/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.downloads.reel

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.media.resume.TRACK_START
import app.morphe.patches.facebook.media.resume.paramsGetters
import app.morphe.patches.facebook.media.resume.reportedValues
import app.morphe.patches.facebook.media.resume.trackers
import app.morphe.patches.facebook.media.taptoplay.FB_SHORTS
import app.morphe.patches.facebook.media.taptoplay.GROOT_PLAY
import app.morphe.patches.facebook.media.taptoplay.grootPlays
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Download any reel run whole on each declared build's own sidebar and the classes it reaches: the
 * block goes in before the assembly call where v0 to v2 are free and the parked player is still in
 * its register, borrowing v0 to v2, and a fourth local for the story when its register is outside
 * v3 to v15, each proved free there by the liveness of the whole builder, and each register it
 * reads followed back from the call's own arguments. The build's
 * one FbShortsSideBarComponent render, which the button can't go in, gets a counter as its first
 * instruction and nothing else (#18). And the More sheet's builder asks for a Download row first
 * thing, through a helper on its class, with the handler made to take the row's click interface
 * (#18). The kept player start gets one range call for the missing-sidebar diagnostic, whose
 * one-register predicate reads this build's getter and flag.
 */
class DownloadReelFixtureTest {
    private val sidebarName = "UDDSideBarComponent"
    private val function1 = "Lkotlin/jvm/functions/Function1;"
    private val session = "Lcom/facebook/auth/usersession/FbUserSession;"
    private val otherSidebarName = "FbShortsSideBarComponent"

    /** A render of the same Litho method as [render]: its name, its one scoped parameter and its return type. */
    private fun rendersLike(method: Method, render: Method) = method.name == render.name &&
        method.parameterTypes.map(CharSequence::toString) == render.parameterTypes.map(CharSequence::toString) &&
        method.returnType == render.returnType && holdsString(method, otherSidebarName)

    /** Where the block goes on one bundle: [before] instructions before the assembly call, and the story in [story]. */
    private data class Pin(val before: Int, val story: Int)

    /**
     * Each declared bundle's pick, by the end of its file name. 584's render (LX/AF0;->A0l) parks
     * the scoped context over the player in v29 at instruction 549, so the block goes in at 532,
     * where the button loop ends and the call's straight run starts, 38 instructions before the
     * call. The story, the call's second argument, is still in v14 there, which the helper call
     * names as it is.
     *
     * The armeabi-v7a build is a separate rebuild of the same render, and lays the call out the
     * same way: its button loop ends and the call's straight run starts at 532, so the block goes
     * in there, 38 instructions before the call at 570. v0 to v2 are free at 532, so the block
     * keeps its own three locals, and the story resolves to v14 as on arm64.
     */
    private val pins = mapOf(
        "${AppCompatibilities.FACEBOOK_TARGET_VERSION}-arm64-v8a.apkm" to Pin(before = 38, story = 14),
        "${AppCompatibilities.FACEBOOK_TARGET_VERSION}-armeabi-v7a.apkm" to Pin(before = 38, story = 14),
    )

    private fun callsButtonFactory(method: Method) = method.implementation?.instructions?.any { instruction ->
        ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.parameterTypes?.let { types ->
            types.count { it.toString() == function1 } == 4 && types.firstOrNull()?.toString() == session
        } == true
    } == true

    /**
     * Where [method] gets its buttons made: itself when it calls the factory, as up to 583, or the
     * one static of [owner], its class, that it calls and that calls the factory, as on 584.
     */
    private fun factoryCaller(method: Method, owner: ClassDef): Method? = if (callsButtonFactory(method)) method else {
        val called = (method.implementation?.instructions ?: emptyList()).mapNotNull {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.takeIf { call -> call.definingClass == owner.type }
        }.map { "${it.name}${it.parameterTypes.joinToString("", "(", ")")}${it.returnType}" }.toSet()
        owner.methods.singleOrNull { sibling ->
            "${sibling.name}${sibling.parameterTypes.joinToString("", "(", ")")}${sibling.returnType}" in called &&
                callsButtonFactory(sibling)
        }
    }

    /** Every class the builder names: the owners of what it calls and reads, and the types it makes or casts to. */
    private fun namedBy(method: Method): Set<String> = method.implementation!!.instructions.mapNotNull { instruction ->
        when (val reference = (instruction as? ReferenceInstruction)?.reference) {
            is MethodReference -> reference.definingClass
            is FieldReference -> reference.definingClass
            is TypeReference -> reference.type
            else -> null
        }
    }.filter { it.startsWith("L") }.toSet()

    /** [namedBy], plus the parameter and return types of everything [method] calls. */
    private fun reachedBy(method: Method): Set<String> = namedBy(method) + method.implementation!!.instructions.flatMap { instruction ->
        ((instruction as? ReferenceInstruction)?.reference as? MethodReference)
            ?.let { it.parameterTypes.map(CharSequence::toString) + it.returnType }.orEmpty()
    }.filter { it.startsWith("L") }

    @Test
    fun `the reel button and the More sheet row go in with proved registers on each declared build`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertEquals("the declared builds", pins.keys.map { it.substringBefore('-') }.toSet(), versions)
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val pin = pins.entries.singleOrNull { bundle.name.endsWith(it.key) }?.value
                    ?: throw AssertionError("${bundle.name} has no pin")
                val holders = FixtureDex.classesHolding(bundle, sidebarName)
                val (builderClass, builder) = holders.flatMap { classDef ->
                    classDef.methods.filter { holdsString(it, sidebarName) && factoryCaller(it, classDef) != null }.map { classDef to it }
                }.single()
                val buttonMaker = factoryCaller(builder, builderClass)!!
                // The component's render: the builder itself up to 582, the one handing it the
                // scoped context on 583. The component declares itself by name, so it's a holder too.
                val (component, render) = if (builder.parameterTypes.size == 1) builderClass to builder else {
                    holders.flatMap { classDef -> classDef.methods.filter { rendersThrough(it, builder) }.map { classDef to it } }.single()
                }

                val types = namedBy(builder) + namedBy(buttonMaker) + component.fields.map { it.type } +
                    builder.parameterTypes.map { it.toString() } + setOf(function1, "Lcom/facebook/video/engine/api/VideoDataSource;")
                val classes = mutableMapOf<String, ClassDef>()
                FixtureDex.classes(bundle, types).forEach { (type, classDef) -> classes[type] = classDef }
                FixtureDex.classesHolding(bundle, "fds_control_download_video").forEach { classes.putIfAbsent(it.type, it) }
                // The other sidebar, whose render the patch counts in Hook status (#18).
                val others = FixtureDex.classesHolding(bundle, otherSidebarName).filter { classDef ->
                    classDef.type != component.type && classDef.methods.any { rendersLike(it, render) }
                }
                assertEquals("${bundle.name}: the other sidebar components", 1, others.size)
                val other = others.single()
                classes.putIfAbsent(other.type, other)
                classes[component.type] = component
                classes[builderClass.type] = builderClass
                // The More sheet's builder, everything it calls with, and the row's own types (#18).
                val sheetHolder = FixtureDex.classesHolding(bundle, CLEAR_MODE_ROW).single()
                val sheetBuilder = sheetHolder.methods.single { holdsString(it, CLEAR_MODE_ROW) }
                val sheetTypes = reachedBy(sheetBuilder)
                FixtureDex.classes(bundle, sheetTypes).forEach { (type, classDef) -> classes.putIfAbsent(type, classDef) }
                val rowTypes = sheetTypes.mapNotNull(classes::get).flatMap { classDef ->
                    classDef.methods.filter { it.name == "<init>" }.flatMap { it.parameterTypes.map(CharSequence::toString) }
                }.toSet()
                FixtureDex.classes(bundle, rowTypes).forEach { (type, classDef) -> classes.putIfAbsent(type, classDef) }
                classes[sheetHolder.type] = sheetHolder
                classes[SETTINGS_STATUS] = ExtensionDex.classDef(SETTINGS_STATUS)
                classes[MENU_HANDLER] = ExtensionDex.classDef(MENU_HANDLER)
                classes[REEL_SIDEBAR_DIAGNOSTICS] = ExtensionDex.classDef(REEL_SIDEBAR_DIAGNOSTICS)
                val player = FixtureDex.classesHolding(bundle, GROOT_PLAY).single { grootPlays(it).size == 1 }
                classes[player.type] = player
                val paramsType = "Lcom/facebook/video/engine/api/VideoPlayerParams;"
                val params = FixtureDex.classes(bundle, setOf(paramsType)).getValue(paramsType)
                classes[paramsType] = params
                val play = grootPlays(player).single()
                val start = trackers(player, TRACK_START, play.parameterTypes.single().toString()).single()
                val getter = paramsGetters(player).single()
                val flag = params.methods.filter { holdsString(it, FB_SHORTS) }
                    .mapNotNull { reportedValues(it)[FB_SHORTS] }.distinctBy(FieldReference::toString).single()
                val context = PatchContexts.of(classes.values)
                val sheet = context.moreSheet("the fixture")

                downloadReelPatch.execute(context)

                val sheetBody = context.mutableClassDefBy(sheetHolder.type).methods
                    .single { it.name == sheetBuilder.name && holdsString(it, CLEAR_MODE_ROW) }
                    .implementation!!.instructions.toList()
                val rowCall = sheetBody[6] as RegisterRangeInstruction
                assertEquals(
                    "${bundle.name}: the More sheet asks the row helper first thing, from v0 to v5",
                    "$ROW_HELPER 0 6",
                    "${((rowCall as ReferenceInstruction).reference as MethodReference).name} ${rowCall.startRegister} ${rowCall.registerCount}",
                )
                assertEquals(
                    "${bundle.name}: the builder keeps the rest of its own code",
                    sheetBuilder.implementation!!.instructions.count() + 7,
                    sheetBody.size,
                )
                assertTrue(
                    "${bundle.name}: the helper is on the builder's class",
                    context.mutableClassDefBy(sheetHolder.type).methods.any { it.name == ROW_HELPER },
                )
                val handler = context.mutableClassDefBy(MENU_HANDLER)
                assertEquals("${bundle.name}: the handler takes the row's click", listOf(sheet.click), handler.interfaces.toList())
                assertTrue(
                    "${bundle.name}: the handler answers the click's one method",
                    handler.methods.any { it.name == sheet.clickMethod && it.parameterTypes.isEmpty() && it.returnType == "V" },
                )

                val patched = context.mutableClassDefBy(builderClass.type).methods.single {
                    it.name == builder.name && it.parameterTypes.map(CharSequence::toString) == builder.parameterTypes.map(CharSequence::toString)
                }
                val body = patched.implementation!!.instructions.toList()
                val original = builder.implementation!!.instructions.toList()
                val assemblyAt = original.indexOfFirst { instruction ->
                    ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.parameterTypes
                        ?.count { it.toString() == "Ljava/util/ArrayList;" } == 2
                }
                val injectAt = assemblyAt - pin.before
                assertEquals(
                    "${bundle.name}: the block's first call",
                    "Lapp/morphe/extension/facebook/download/ReelDownload;->showsButton()Z",
                    (body[injectAt] as ReferenceInstruction).reference.toString(),
                )
                assertEquals("${bundle.name}: the builder's own code up to the block", original.take(injectAt).map { it.opcode },
                    body.take(injectAt).map { it.opcode })
                val helper = body.single { instruction ->
                    ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.name == "hushfacebookDownloadButton"
                } as FiveRegisterInstruction
                assertEquals(
                    "${bundle.name}: the helper call's registers",
                    listOf(0, 1, 2, pin.story),
                    listOf(helper.registerC, helper.registerD, helper.registerE, helper.registerF),
                )
                val otherRender = context.mutableClassDefBy(other.type).methods.single { rendersLike(it, render) }
                val otherOriginal = other.methods.single { rendersLike(it, render) }
                assertEquals(
                    "${bundle.name}: the other sidebar counts itself first thing",
                    "Lapp/morphe/extension/facebook/download/ReelDownload;->otherSidebarBuilt()V",
                    (otherRender.implementation!!.instructions.first() as ReferenceInstruction).reference.toString(),
                )
                assertEquals(
                    "${bundle.name}: the counter is the only thing added to the other sidebar",
                    otherOriginal.implementation!!.instructions.count() + 1,
                    otherRender.implementation!!.instructions.count(),
                )
                val tracked = context.mutableClassDefBy(player.type).methods.single {
                    it.name == start.name && it.parameterTypes.map(CharSequence::toString) == start.parameterTypes.map(CharSequence::toString)
                }
                val trackedBody = tracked.implementation!!.instructions.toList()
                val started = trackedBody.first() as RegisterRangeInstruction
                assertEquals("${bundle.name}: the real start tracker uses the range form", Opcode.INVOKE_STATIC_RANGE, trackedBody.first().opcode)
                assertEquals("${bundle.name}: the diagnostic receives this tracker's player", tracked.implementation!!.registerCount - 2, started.startRegister)
                assertEquals("${bundle.name}: only the player is passed", 1, started.registerCount)
                assertEquals("${bundle.name}: the start calls the diagnostic", "$REEL_SIDEBAR_DIAGNOSTICS->started(Ljava/lang/Object;)V",
                    (trackedBody.first() as ReferenceInstruction).reference.toString())
                assertEquals("${bundle.name}: the tracker keeps all its own instructions", start.implementation!!.instructions.count() + 1, trackedBody.size)
                val predicate = context.mutableClassDefBy(REEL_SIDEBAR_DIAGNOSTICS).methods.single { it.name == "isReel" }
                val predicateBody = predicate.implementation!!.instructions.toList()
                assertEquals("${bundle.name}: the predicate keeps its parameter in v0", 1, predicate.implementation!!.registerCount)
                assertTrue("${bundle.name}: predicate register operands fit their instruction formats",
                    predicateBody.filterIsInstance<OneRegisterInstruction>().all { it.registerA == 0 } &&
                        predicateBody.filterIsInstance<TwoRegisterInstruction>().all { it.registerB == 0 })
                assertEquals("${bundle.name}: the predicate calls the build's actual params getter",
                    "${player.type}->${getter.name}()$paramsType",
                    predicateBody.mapNotNull { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.toString() }.single())
                assertEquals("${bundle.name}: the predicate reads the field actually reported as isFbShorts", flag.toString(),
                    predicateBody.mapNotNull { ((it as? ReferenceInstruction)?.reference as? FieldReference)?.toString() }.single())
                assertEquals("${bundle.name}: null players and params return false", 2, predicateBody.count { it.opcode == Opcode.IF_EQZ })
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
