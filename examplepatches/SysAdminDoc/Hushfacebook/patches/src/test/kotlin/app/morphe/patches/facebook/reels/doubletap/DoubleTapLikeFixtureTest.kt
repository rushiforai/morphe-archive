/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.reels.doubletap

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import app.morphe.patches.facebook.misc.extension.localRegisterCount
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * The anchors of Turn off double tap to like on every declared Facebook build, and the patch run on
 * each build's own classes. One reel like helper, with one double-tap like that returns on a missing
 * key; one GestureReactionComponent, whose view has one heart and a double-tap handler that nothing
 * outside the view, its gesture listener and the component's event subscriber reads, each read
 * checked for null straight away; the three players whose own onDoubleTap likes with the source
 * "DOUBLE_TAP"; and one feed attachment whose onDoubleTap asks the double-tap like and animates a
 * heart of its own. Reads the fixture bundles from HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class DoubleTapLikeFixtureTest {
    private val Instruction.call: MethodReference?
        get() = (this as? ReferenceInstruction)?.reference as? MethodReference

    private val Instruction.field: FieldReference?
        get() = (this as? ReferenceInstruction)?.reference as? FieldReference

    private fun key(method: MethodReference) =
        method.definingClass + "->" + method.name + method.parameterTypes.joinToString("", "(", ")") + method.returnType

    private fun calls(method: Method, target: MethodReference): Boolean =
        method.implementation?.instructions?.any { it.call?.let(::key) == key(target) } == true

    private fun Method.code(): List<Instruction> = implementation!!.instructions.toList()

    /** The registers a call passes, in order. */
    private fun Instruction.registers(): List<Int> = when (this) {
        is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
        is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
        else -> emptyList()
    }

    private fun sameMethod(a: Method, b: Method) = key(a) == key(b)

    private class Build(
        val name: String,
        val helper: ClassDef,
        val like: Method,
        val doubleTapLike: Method,
        val component: ClassDef,
        val view: ClassDef,
        val heart: Method,
        val handler: FieldReference,
        val readers: List<Method>,
        val readerClasses: List<ClassDef>,
        val attachment: Method,
        val attachmentClass: ClassDef,
    )

    /** Reads what the patch finds in [bundle], checking each anchor is the only one of its kind. */
    private fun read(bundle: File): Build {
        val name = bundle.name
        val helpers = FixtureDex.classesHolding(bundle, MUTATE_LIKE)
        val likes = helpers.flatMap { it.methods }.filter(::isReelLike)
        assertEquals("$name: reel likes holding \"$MUTATE_LIKE\"", 1, likes.size)
        val like = likes.single()
        val helper = helpers.single { it.type == like.definingClass }
        val doubleTapLikes = doubleTapLikes(helper)
        assertEquals("$name: the helper's double-tap likes", 1, doubleTapLikes.size)
        val doubleTapLike = doubleTapLikes.single()
        assertTrue("$name: the double-tap like doesn't return on a missing key", likeKeyResult(doubleTapLike) != null)

        val components = FixtureDex.classesHolding(bundle, GESTURE_REACTION).filter(::isGestureReactionComponent)
        assertEquals("$name: classes whose constructor holds \"$GESTURE_REACTION\"", 1, components.size)
        val component = components.single()
        val viewType = mountedView(component) ?: throw AssertionError("$name: the component makes no one view")
        val view = FixtureDex.classes(bundle, setOf(viewType)).getValue(viewType)
        assertEquals("$name: the view's superclass", "Landroid/widget/FrameLayout;", view.superclass)
        val hearts = hearts(view)
        assertEquals("$name: the view's hearts", 1, hearts.size)
        val heart = hearts.single()
        val handler = handlerField(heart) ?: throw AssertionError("$name: the heart reads none of the view's fields")

        // Nothing in the whole build reads the handler but the view, its gesture listener and the
        // component's event subscriber, the classes the patch looks in.
        val everywhere = FixtureDex.methodsWhere(bundle, dexFilter = { dex ->
            dex.fieldSection.any { it.definingClass == handler.definingClass && it.name == handler.name }
        }) { readsOf(it, handler).isNotEmpty() }
        val owners = (setOf(viewType) + typesMadeBy(view) + typesMadeBy(component))
        val readerClasses = FixtureDex.classes(bundle, everywhere.map { it.definingClass }.toSet()).values.toList()
        assertTrue("$name: a class the patch doesn't look in reads the handler: " +
            everywhere.filter { it.definingClass !in owners }.map(::key), everywhere.all { it.definingClass in owners })
        assertEquals("$name: readers of the handler", 3, everywhere.size)
        assertEquals("$name: the handler reads", 3, everywhere.sumOf { readsOf(it, handler).size })
        assertTrue("$name: the heart doesn't read the handler", everywhere.any { sameMethod(it, heart) })
        assertEquals("$name: onDoubleTap readers", 1, everywhere.count { it.name == "onDoubleTap" })
        for (reader in everywhere) {
            for (read in readsOf(reader, handler)) {
                assertTrue("$name: ${key(reader)} doesn't check the handler for null straight after reading it",
                    isCheckedRead(reader, read))
            }
        }

        val attachmentClasses = FixtureDex.classesHolding(bundle, HEART_RISE)
        val attachments = attachmentClasses.flatMap { it.methods }.filter { isAttachmentDoubleTap(it, doubleTapLike) }
        assertEquals("$name: onDoubleTaps asking the double-tap like and loading \"$HEART_RISE\"", 1, attachments.size)
        // And the only onDoubleTap loading it at all, which is what the mutation contract picks it by.
        assertEquals("$name: onDoubleTaps loading \"$HEART_RISE\"", 1, attachmentClasses.flatMap { it.methods }.count {
            it.name == "onDoubleTap" && it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/view/MotionEvent;") &&
                holdsString(it, HEART_RISE)
        })
        val attachment = attachments.single()
        return Build(name, helper, like, doubleTapLike, component, view, heart, handler, everywhere, readerClasses,
            attachment, attachmentClasses.single { it.type == attachment.definingClass })
    }

    private fun declaredBundles(): Map<String, List<File>> {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        return versions.associateWith { version -> Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") } }
    }

    /**
     * The players with a double-tap listener of their own like through the helper's like with the
     * literal "DOUBLE_TAP" as its source, which is what the hook in the like holds back, and the
     * Like button's handler passes something else.
     */
    @Test
    fun `on each declared build three players' own double taps send the reel like with the source DOUBLE_TAP`() {
        val checked = mutableSetOf<String>()
        for ((version, bundles) in declaredBundles()) {
            for (bundle in bundles) {
                val like = FixtureDex.classesHolding(bundle, MUTATE_LIKE).flatMap { it.methods }.single(::isReelLike)
                val senders = FixtureDex.methodsWhere(bundle, dexFilter = { dex ->
                    dex.stringSection.any { it == DOUBLE_TAP } &&
                        dex.methodSection.any { it.definingClass == like.definingClass && it.name == like.name }
                }) { calls(it, like) && holdsString(it, DOUBLE_TAP) }
                val listeners = senders.filter { it.name == "onDoubleTap" }
                assertEquals("${bundle.name}: onDoubleTaps sending the reel like from a double tap", 3, listeners.size)
                for (listener in listeners) {
                    val code = listener.code()
                    val send = code.indexOfLast { it.call?.let(::key) == key(like) }
                    val source = code[send].registers().last()
                    val loaded = code.subList(0, send).last {
                        it.opcode.setsRegister() && (it as? OneRegisterInstruction)?.registerA == source
                    }
                    assertEquals("${bundle.name}: ${key(listener)} passes another source", Opcode.CONST_STRING, loaded.opcode)
                    assertEquals("${bundle.name}: ${key(listener)} passes another source", DOUBLE_TAP,
                        ((loaded as ReferenceInstruction).reference as StringReference).string)
                }
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", declaredBundles().keys, checked)
    }

    /**
     * The patch itself, run on each build's own classes: the like asks first and returns while the
     * extension holds a double tap's like back, the double-tap like's key goes through the extension
     * before its null check, every read of the gesture view's handler goes through it before its
     * null check (the heart's through the heart hook), and the feed attachment's onDoubleTap asks
     * first and answers false.
     */
    @Test
    fun `on each declared build the patch applies and every hook sits where it's claimed`() {
        val checked = mutableSetOf<String>()
        for ((version, bundles) in declaredBundles()) {
            for (bundle in bundles) {
                val build = read(bundle)
                val name = build.name
                val classes = (listOf(build.helper, build.component, build.view, build.attachmentClass) + build.readerClasses)
                    .distinctBy { it.type } + ExtensionDex.classDef(SETTINGS_STATUS)
                val context = PatchContexts.of(classes)
                turnOffDoubleTapLikePatch.execute(context)

                fun patched(method: Method): Method =
                    context.mutableClassDefBy(method.definingClass).methods.single { sameMethod(it, method) }

                // The like: its source copied down and asked about before anything else runs.
                val like = patched(build.like).code()
                assertEquals("$name: the like's first call", HOLD_BACK_LIKE, like.first { it.call != null }.call.toString())
                val copy = like[0] as TwoRegisterInstruction
                assertEquals("$name: the like doesn't copy its source first", Opcode.MOVE_OBJECT_FROM16, like[0].opcode)
                assertEquals("$name: the source the like asks about",
                    build.like.localRegisterCount() + build.like.parameterTypes.size, copy.registerB)
                assertEquals("$name: the like doesn't return while held back", Opcode.RETURN_VOID, like[4].opcode)

                // The double-tap like: the key through the extension, then Facebook's own null check.
                val original = build.doubleTapLike.code()
                val taken = likeKeyResult(build.doubleTapLike)!!
                val keyRegister = (original[taken] as OneRegisterInstruction).registerA
                val doubleTapLike = patched(build.doubleTapLike).code()
                assertEquals("$name: after the key", LIKE_KEY, doubleTapLike[taken + 1].call.toString())
                assertEquals("$name: the key the extension gets", listOf(keyRegister), doubleTapLike[taken + 1].registers())
                assertEquals("$name: the key taken back", Opcode.MOVE_RESULT_OBJECT, doubleTapLike[taken + 2].opcode)
                assertEquals("$name: the key taken back", keyRegister, (doubleTapLike[taken + 2] as OneRegisterInstruction).registerA)
                assertEquals("$name: the key's type kept", "Ljava/lang/String;",
                    ((doubleTapLike[taken + 3] as ReferenceInstruction).reference as TypeReference).type)
                assertEquals("$name: Facebook's null check of the key", original[taken + 1].opcode, doubleTapLike[taken + 4].opcode)

                // Every read of the handler: the extension's answer in place of it, then the null check.
                for (reader in build.readers) {
                    val before = reader.code()
                    val after = patched(reader).code()
                    val hook = if (sameMethod(reader, build.heart)) HEART else HANDLER
                    val reads = readsOf(reader, build.handler)
                    // The reads after this one moved down three instructions for each hook before them.
                    reads.sorted().forEachIndexed { hooked, read ->
                        val at = read + 3 * hooked
                        val register = (before[read] as OneRegisterInstruction).registerA
                        assertEquals("$name: ${key(reader)} lost its read", build.handler.toString(), after[at].field.toString())
                        assertEquals("$name: ${key(reader)} after the read", hook, after[at + 1].call.toString())
                        assertEquals("$name: ${key(reader)} hands on another register", listOf(register), after[at + 1].registers())
                        assertEquals("$name: ${key(reader)} takes the answer back", register,
                            (after[at + 2] as OneRegisterInstruction).registerA)
                        assertEquals("$name: ${key(reader)} keeps the handler's type", build.handler.type,
                            ((after[at + 3] as ReferenceInstruction).reference as TypeReference).type)
                        assertEquals("$name: ${key(reader)} lost its null check", before[read + 1].opcode, after[at + 4].opcode)
                    }
                    assertEquals("$name: ${key(reader)} hooks", reads.size, after.count { it.call.toString() == hook })
                }

                // The attachment's onDoubleTap: asks first, answers false while held back.
                val attachment = patched(build.attachment).code()
                assertEquals("$name: the attachment's first call", HOLD_BACK_TAP, attachment[0].call.toString())
                assertEquals("$name: the attachment doesn't answer false", Opcode.CONST_4, attachment[3].opcode)
                assertEquals("$name: the attachment doesn't return", Opcode.RETURN, attachment[4].opcode)

                val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "doubleTapLike" }
                assertEquals("$name: SettingsStatus.doubleTapLike() isn't switched on", 1,
                    (status.code()[0] as NarrowLiteralInstruction).narrowLiteral)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", declaredBundles().keys, checked)
    }

    private companion object {
        const val DOUBLE_TAP = "DOUBLE_TAP"
    }
}
