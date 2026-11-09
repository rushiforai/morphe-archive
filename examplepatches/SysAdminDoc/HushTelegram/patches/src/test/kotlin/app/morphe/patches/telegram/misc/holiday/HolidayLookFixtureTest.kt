/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.holiday

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.util.names.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.util.names.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Test
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origRef
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origString
import app.morphe.util.names.origType
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy

/** The holiday check's class, every class that reads its snow flag and the runtime are the whole context. */
class HolidayLookFixtureTest {
    @Test
    fun `the holiday check shows the look or puts it back before its date test`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = contextFor(build)
            val sites = context.resolveHolidayLookSites()
            val stock = ImmutableMethod.of(sites.check)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { holidayLookPatch.execute(context) })
            val name = build.name
            val after = sites.check.instructions()

            assertEquals("$name: hook", HOOK, after.subList(0, HOOK.size).map { it.opcode })
            assertEquals("$name: hook asks", "$HOLIDAY_LOOK->mode()I", after[0].reference())
            assertEquals("$name: show lets snow start", sites.snow.toString(), after[5].reference())
            assertEquals("$name: show looks for the hat", sites.hat.toString(), after[6].reference())
            assertEquals("$name: restore drops the hat", sites.hat.toString(), after[10].reference())
            assertEquals("$name: restore stops snow", sites.snow.toString(), after[11].reference())
            assertEquals("$name: restore forgets the last check", sites.checked.toString(), after[13].reference())
            // The wide write takes the pair the restore wrote its zero to.
            assertEquals("$name: zeroed pair", after[12].namedRegisters()[0], after[13].namedRegisters()[0])

            val moved = assertKeepsStock("$name: holiday check", stock, sites.check, 0, HOOK.size)
            val flow = ControlFlow.of(sites.check)
            val stockStart = HOOK.size
            assertEquals("$name: off runs Telegram's check", setOf(3, stockStart - 1), flow.normal[2].toSet())
            assertEquals("$name: show or restore", setOf(5, 9), flow.normal[4].toSet())
            assertEquals("$name: a loaded hat returns as is", setOf(8, moved.getValue(sites.done)), flow.normal[7].toSet())
            assertEquals("$name: no hat yet loads it", listOf(moved.getValue(sites.load)), flow.normal[8])
            assertEquals("$name: restore goes on to Telegram's check", listOf(stockStart), flow.normal[stockStart - 1])
            assertEquals("$name: restore runs into it", listOf(stockStart - 1), flow.normal[13])

            // The load is the stock one: the app's resources, the hat's id, stored to the hat.
            val load = stock.instructions()
            assertEquals("$name: load reads the app context", Opcode.SGET_OBJECT, load[sites.load].opcode)
            assertTrue("$name: load reads the hat's id", (sites.load until sites.done).any { load[it].reference() == NEW_YEAR_HAT })
            assertEquals("$name: the exit returns the hat", Opcode.RETURN_OBJECT, load[sites.done + 1].opcode)

            val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "holidayLook" }.instructions()
            assertEquals("$name: build fact", 1, (status[0] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals("$name: title emoji build fact", 1, flag(context, "titleEmoji"))
        }
    }

    @Test
    fun `only Telegram's holiday check loads the hat, and its snow flag reaches the top bar and chat backgrounds`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val loaders = FixtureDex.methodsWhere(build, { true }) { method -> method.instructions().any { it.reference() == NEW_YEAR_HAT } }
            assertEquals("$name: one hat loader", 1, loaders.size)
            val check = loaders.single()
            val snow = check.instructions().first { it.opcode == Opcode.SPUT_BOOLEAN }.reference()
            val readers = FixtureDex.methodsWhere(build, { true }) { method -> method.instructions().any {
                it.opcode == Opcode.SGET_BOOLEAN && it.reference() == snow } }
            // The top bar starts its snow where it draws the hat; the chat background starts the same snow.
            val bar = readers.single { it.origName == "drawChild" }
            val effect = bar.instructions().first { it.opcode == Opcode.NEW_INSTANCE }.reference()
            assertEquals("$name: snow flag readers", 2, readers.size)
            assertTrue("$name: the bar draws the hat", bar.instructions().any { it.reference()?.endsWith("->${check.name}()$DRAWABLE") == true })
            val background = readers.single { it != bar }
            assertTrue("$name: the chat background starts the same snow", background.instructions().any {
                it.opcode == Opcode.NEW_INSTANCE && it.reference() == effect })
        }
    }

    // Keep the stock plain-title block pinned while the logo has its own additive bridge.
    @Test
    fun `the bar draws the hat only over a plain-text title, and the chat list title is Telegram's logo`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val check = FixtureDex.methodsWhere(build, { true }) { method -> method.instructions().any { it.reference() == NEW_YEAR_HAT } }.single()
            val asks = { method: Method -> method.instructions().any { it.reference()?.endsWith("->${check.name}()$DRAWABLE") == true } }
            val bar = FixtureDex.methodsWhere(build, { true }) { method -> method.origName == "drawChild" && asks(method) }.single().instructions()
            val ask = bar.indexOfFirst { it.reference()?.endsWith("->${check.name}()$DRAWABLE") == true }
            val draw = (ask until bar.size).first { bar[it].reference() == "Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V" }
            assertTrue("$name: the hat draws only over a String title",
                (ask until draw).any { bar[it].opcode == Opcode.INSTANCE_OF && bar[it].reference() == "Ljava/lang/String;" })

            val screens = FixtureDex.methodsWhere(build, { true }) { method -> method.origName == "createView" && method.instructions().any {
                it.reference()?.endsWith("->setSupportsHolidayImage(Z)V") == true } }
            assertEquals("$name: one screen wants the holiday image", 1, screens.size)
            val title = screens.single().instructions()
            assertTrue("$name: its title is the logo", title.any { it.reference() == "Lorg/telegram/messenger/R\$drawable;->telegram_logo_2:I" })
            assertTrue("$name: spanned over the app name", title.any {
                it.opcode == Opcode.NEW_INSTANCE && it.reference() == "Landroid/text/style/ImageSpan;" })
        }
    }

    @Test
    fun `the patched logo title has an owned span bridge without converting its app name to text`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = contextFor(build)
            val sites = context.resolveHolidayLookSites()
            val logo = context.resolveHolidayLogoSites(sites)
            val stockBar = ImmutableMethod.of(logo.bar)
            val stockTitle = ImmutableMethod.of(logo.create)
            holidayLookPatch.execute(context)
            val screen = owners(build).single { owner -> owner.methods.any { method -> method.origName == "createView" &&
                method.instructions().any { it.reference() == "Lorg/telegram/messenger/R\$drawable;->telegram_logo_2:I" } } }
            val create = context.tgMutableClassDefBy(screen.type).methods.single { it.origName == "createView" }.instructions()
            assertEquals("${build.name}: register exactly the chat list logo span", 1, create.count {
                it.reference() == "$HOLIDAY_LOOK->registerLogoSpan(Landroid/text/style/ImageSpan;)V" })
            val bar = sites.readers.single { it.origName == "drawChild" }
            val after = context.tgMutableClassDefBy(bar.definingClass).methods.single { it.origName == "drawChild" }.instructions()
            assertEquals("${build.name}: owned logo gate", 1, after.count {
                it.reference() == "$HOLIDAY_LOOK->isLogoTitle(Ljava/lang/CharSequence;)Z" })
            assertEquals("${build.name}: separate drawing bridge", 1, after.count {
                it.reference() == "$HOLIDAY_LOOK->drawLogoHat(Landroid/graphics/Canvas;Landroid/view/View;Landroid/graphics/drawable/Drawable;Landroid/view/View;)V" })
            assertEquals("${build.name}: no String conversion", 0, after.count {
                it.reference() == "Ljava/lang/CharSequence;->toString()Ljava/lang/String;" })
            assertKeepsStock("${build.name}: plain title and snow", stockBar, logo.bar, logo.gate, 9)
            // The registration goes in before length(), and the emoji, one further on after it, before the bar's load.
            assertKeepsStock("${build.name}: original logo and title actions", stockTitle, logo.create,
                listOf(logo.registerAt..logo.registerAt, logo.emojiAt + 1..logo.emojiAt + 1))
            val emoji = create.indices.single { create[it].reference() == DECORATE }
            assertTrue("${build.name}: the emoji follows the logo's span",
                create[emoji - 1].reference()!!.endsWith("->setSpan(Ljava/lang/Object;III)V"))
            assertEquals("${build.name}: it's handed the spanned builder", listOf(create[emoji - 1].namedRegisters()[0]),
                create[emoji].namedRegisters())
            assertTrue("${build.name}: before the action bar's load", create[emoji + 1].reference()!!.contains("->actionBar:"))
            assertEquals("${build.name}: the same builder becomes the title", create[emoji].namedRegisters()[0],
                create[emoji + 3].namedRegisters()[1])
            assertEquals("${build.name}: the title setter follows", stockTitle.instructions()[logo.emojiAt + 2].reference(),
                create[emoji + 3].reference())
            val bridge = context.tgMutableClassDefBy(HOLIDAY_LOOK).methods.single { it.origName == "drawLogoHat" }.instructions()
            assertEquals("${build.name}: bounded getter bridge", 1, bridge.count {
                it.reference() == "$HOLIDAY_LOOK->drawLogoHatAt(Landroid/graphics/Canvas;Ljava/lang/CharSequence;Landroid/graphics/drawable/Drawable;IIIIIII)V" })
            assertEquals("${build.name}: bridge never measures AppName", 0, bridge.count {
                it.reference()?.contains("getTextBounds") == true || it.reference()?.contains("measureText") == true })
        }
    }

    @Test
    fun `changed logo String gate refuses before editing`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = contextFor(build)
            val bar = context.resolveHolidayLookSites().readers.single { it.origName == "drawChild" }
            val method = context.tgMutableClassDefBy(bar.definingClass).methods.single { it.origName == "drawChild" }
            val body = method.instructions()
            val gate = body.indices.single { body[it].opcode == Opcode.INSTANCE_OF && body[it].reference() == "Ljava/lang/String;" }
            val registers = body[gate].namedRegisters()
            method.replaceInstruction(gate, "instance-of v${registers[0]}, v${registers[1]}, Landroid/text/Spanned;")
            assertRefusedUntouched(build, "changed String gate", context)
        }
    }

    @Test
    fun `changed span ownership placement and bridge access refuse atomically on both targets`() {
        for (build in Fixtures.declaredBuilds()) {
            val changes: List<Pair<String, (BytecodePatchContext, HolidayLookSites, HolidayLogoSites) -> Unit>> = listOf(
                "String cast" to { _, _, logo ->
                    val at = logo.bar.instructions().indices.single { logo.bar.instructions()[it].opcode == Opcode.CHECK_CAST &&
                        logo.bar.instructions()[it].reference() == "Ljava/lang/String;" }
                    logo.bar.replaceInstruction(at, "check-cast v14, Ljava/lang/Object;")
                },
                "start X getter" to { _, _, logo ->
                    val at = logo.bar.instructions().indexOfFirst { it.reference()?.endsWith("->getTextStartX()I") == true }
                    logo.bar.replaceInstruction(at, "invoke-virtual {v8}, " + logo.bar.instructions()[at].reference()!!.replace("getTextStartX", "getTextStartY"))
                },
                "hat centering divide" to { _, _, logo ->
                    val at = (logo.gate until logo.afterHat).first { logo.bar.instructions()[it].opcode == Opcode.DIV_INT_2ADDR }
                    logo.bar.replaceInstruction(at, "mul-int/2addr v14, v12")
                },
                "vertical ceiling" to { _, _, logo ->
                    val at = logo.bar.instructions().indexOfFirst { it.reference() == "Ljava/lang/Math;->ceil(D)D" }
                    logo.bar.replaceInstruction(at, "invoke-static {v11, v12}, Ljava/lang/Math;->floor(D)D")
                },
                "theme horizontal offset" to { _, sites, logo ->
                    val at = logo.bar.instructions().indexOfFirst { it.reference() == "${sites.check.definingClass}->D1:I" }
                    logo.bar.replaceInstruction(at, "sget v14, ${sites.check.definingClass}->E1:I")
                },
                "scale adjustment" to { _, _, logo ->
                    val at = (logo.gate until logo.afterHat).first { (logo.bar.instructions()[it] as? WideLiteralInstruction)?.wideLiteral == 0x41000000L }
                    logo.bar.replaceInstruction(at, "const/high16 v10, 0x41100000")
                },
                "hat bounds operands" to { _, _, logo ->
                    val at = (logo.gate until logo.afterHat).first { logo.bar.instructions()[it].reference()?.endsWith("->setBounds(IIII)V") == true }
                    logo.bar.replaceInstruction(at, "invoke-virtual {v9, v10, v14, v11, v13}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V")
                },
                // 13.2 builds the span in the register the stock call names, so the swaps read it from there.
                "logo constructor drawable" to { _, _, logo ->
                    val init = logo.create.instructions()[logo.registerAt - 1].namedRegisters()
                    logo.create.replaceInstruction(logo.registerAt - 1,
                        "invoke-direct {v${init[0]}, v3}, Landroid/text/style/ImageSpan;-><init>(Landroid/graphics/drawable/Drawable;)V")
                },
                "logo alignment" to { _, _, logo ->
                    val init = logo.create.instructions()[logo.registerAt - 1].namedRegisters()
                    logo.create.replaceInstruction(logo.registerAt - 1,
                        "invoke-direct {v${init[0]}, v${init[1]}, v11}, Landroid/text/style/ImageSpan;-><init>(Landroid/graphics/drawable/Drawable;I)V")
                },
                "logo span range" to { _, _, logo ->
                    val at = logo.create.instructions().indexOfFirst { it.reference()?.endsWith("->setSpan(Ljava/lang/Object;III)V") == true }
                    val span = logo.create.instructions()[at].namedRegisters()
                    logo.create.replaceInstruction(at,
                        "invoke-virtual {v3, v${span[1]}, v11, v${span[4]}, v${span[4]}}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V")
                },
                "logo bounds start" to { _, _, logo -> logo.create.replaceInstruction(2, "const/4 v11, 0x1") },
                "logo span flags" to { _, _, logo ->
                    val flags = logo.create.instructions().first { it.reference()?.endsWith("->setSpan(Ljava/lang/Object;III)V") == true }
                        .namedRegisters()[4]
                    val at = (0 until logo.registerAt).last { logo.create.instructions()[it].opcode.setsRegister() &&
                        logo.create.instructions()[it].namedRegisters().firstOrNull() == flags }
                    logo.create.replaceInstruction(at, "const/16 v$flags, 0x22")
                },
                "main chat list guard" to { _, _, logo ->
                    // 13.2 moved getResources() into a loader helper, so the guard sits 56 before the logo id, not 58.
                    val at = logo.create.instructions().indexOfFirst { it.reference() == "Lorg/telegram/messenger/R\$drawable;->telegram_logo_2:I" } - 56
                    val original = logo.create.getInstruction(at) as BuilderOffsetInstruction
                    logo.create.replaceInstruction(at, BuilderInstruction21t(Opcode.IF_NEZ, 3, original.target))
                },
                "second holiday owner" to { context, _, logo ->
                    val owner = context.tgMutableClassDefBy(logo.create.definingClass)
                    owner.methods.add(MutableMethod(ImmutableMethod(logo.create.definingClass, "anotherHolidayOwner", logo.create.parameters,
                        logo.create.returnType, logo.create.accessFlags, null, null, logo.create.implementation)))
                },
                "private text getter" to { context, _, logo ->
                    val type = logo.bar.instructions().first { it.reference()?.endsWith("->getTextStartX()I") == true }
                        .reference()!!.substringBefore("->")
                    val getter = context.tgMutableClassDefBy(type).methods.single { it.origName == "getTextStartX" }
                    getter.accessFlags = getter.accessFlags and AccessFlags.PUBLIC.value.inv() or AccessFlags.PRIVATE.value
                },
                "private theme offset" to { context, sites, _ ->
                    val field = context.tgMutableClassDefBy(sites.check.definingClass).fields.single { it.origName == "D1" }
                    field.accessFlags = field.accessFlags and AccessFlags.PUBLIC.value.inv() or AccessFlags.PRIVATE.value
                },
                "static overlay field" to { context, _, logo ->
                    val field = (logo.bar.instructions()[logo.gate - 13] as ReferenceInstruction).reference as FieldReference
                    val mutable = context.tgMutableClassDefBy(field.definingClass).fields.single { it.origName == field.origName }
                    mutable.accessFlags = mutable.accessFlags or AccessFlags.STATIC.value
                },
                "title forwarding argument" to { context, _, logo ->
                    val setter = titleSetter(context, logo)
                    val reference = setter.instructions()[17].reference()
                    setter.replaceInstruction(17, "invoke-virtual {v2, v6}, $reference")
                },
                "title forwarding branch" to { context, _, logo ->
                    val setter = titleSetter(context, logo)
                    val original = setter.getInstruction(7) as BuilderOffsetInstruction
                    setter.replaceInstruction(7, BuilderInstruction21t(Opcode.IF_NEZ, 2, original.target))
                },
                "text getter loses span ownership" to { context, _, logo ->
                    val type = logo.bar.instructions().first { it.reference()?.endsWith("->getText()Ljava/lang/CharSequence;") == true }
                        .reference()!!.substringBefore("->")
                    val getter = context.tgMutableClassDefBy(type).methods.single { it.origName == "getText" }
                    getter.replaceInstruction(0, "const-string v0, \"Telegram\"")
                },
            )
            for ((case, change) in changes) {
                val context = contextFor(build)
                val sites = context.resolveHolidayLookSites()
                val logo = context.resolveHolidayLogoSites(sites)
                change(context, sites, logo)
                assertRefusedUntouched(build, case, context)
            }
            val hooks = listOf("registerLogoSpan", "isLogoTitle", "drawLogoHat", "drawLogoHatAt").map { HOLIDAY_LOOK to it } +
                (TITLE_EMOJI to "decorate")
            for ((runtime, hook) in hooks) {
                for (kind in 0..4) {
                    val context = contextFor(build)
                    val method = context.tgMutableClassDefBy(runtime).methods.single { it.origName == hook }
                    method.accessFlags = when (kind) {
                        0 -> method.accessFlags and AccessFlags.PUBLIC.value.inv()
                        1 -> method.accessFlags and AccessFlags.STATIC.value.inv()
                        2 -> method.accessFlags or AccessFlags.NATIVE.value
                        3 -> method.accessFlags or AccessFlags.ABSTRACT.value
                        else -> method.accessFlags
                    }
                    if (kind == 4) {
                        val owner = context.tgMutableClassDefBy(runtime)
                        owner.methods.add(MutableMethod(ImmutableMethod(method.definingClass, method.name,
                            method.parameters + ImmutableMethodParameter("I", null, null), method.returnType,
                            method.accessFlags, null, null, method.implementation)))
                    }
                    assertRefusedUntouched(build, "$hook shape $kind", context)
                }
            }
        }
    }

    @Test
    fun `changed title geometry getter bodies refuse before editing`() {
        for (build in Fixtures.declaredBuilds()) {
            for (name in listOf("getTextHeight", "getTextStartX", "getTextStartY")) {
                val context = contextFor(build)
                val logo = context.resolveHolidayLogoSites(context.resolveHolidayLookSites())
                val type = logo.bar.instructions().first { it.reference()?.endsWith("->getTextStartX()I") == true }
                    .reference()!!.substringBefore("->")
                val getter = context.tgMutableClassDefBy(type).methods.single { it.origName == name }
                getter.replaceInstruction(0, "const/4 v0, 0x0")
                assertRefusedUntouched(build, "changed $name geometry", context)
            }
        }
    }

    @Test
    fun `changed title geometry fields arithmetic and branches refuse atomically`() {
        for (build in Fixtures.declaredBuilds()) {
            for (case in listOf("height field", "horizontal addition", "vertical branch")) {
                val context = contextFor(build)
                val logo = context.resolveHolidayLogoSites(context.resolveHolidayLookSites())
                val type = logo.bar.instructions().first { it.reference()?.endsWith("->getTextStartX()I") == true }
                    .reference()!!.substringBefore("->")
                val methods = context.tgMutableClassDefBy(type).methods
                when (case) {
                    "height field" -> methods.single { it.origName == "getTextHeight" }
                        .replaceInstruction(0, "iget v0, p0, $type->n:I")
                    "horizontal addition" -> methods.single { it.origName == "getTextStartX" }
                        .replaceInstruction(30, "sub-int/2addr v0, v2")
                    else -> {
                        val getter = methods.single { it.origName == "getTextStartY" }
                        val branch = getter.getInstruction(1) as BuilderOffsetInstruction
                        getter.replaceInstruction(1, BuilderInstruction21t(Opcode.IF_EQZ, 0, branch.target))
                    }
                }
                assertRefusedUntouched(build, "changed $case", context)
            }
        }
    }

    @Test
    fun `changed holiday check geometry refuses before any partial mutation`() {
        for (build in Fixtures.declaredBuilds()) {
            val changes: List<Pair<String, (BytecodePatchContext, HolidayLookSites) -> Unit>> = listOf(
                "a second hat loader" to { context, sites ->
                    val other = context.tgMutableClassDefBy(sites.check.definingClass).methods.first { it != sites.check &&
                        (it.implementation?.registerCount ?: 0) > 1 }
                    other.addInstructions(0, "sget v0, $NEW_YEAR_HAT")
                },
                "the hat goes to another field" to { _, sites ->
                    val body = sites.check.instructions()
                    val store = (sites.load until sites.done).first { body[it].opcode == Opcode.SPUT_OBJECT }
                    sites.check.replaceInstruction(store, "sput-object v${body[store].namedRegisters()[0]}, " +
                        "${sites.check.definingClass}->hushOther:$DRAWABLE")
                },
                "a second exit" to { _, sites ->
                    sites.check.addInstructions(sites.load, "return-object v0")
                },
                "the snow flag is set one way only" to { _, sites ->
                    val body = sites.check.instructions()
                    sites.check.replaceInstruction(body.indexOfFirst { it.opcode == Opcode.SPUT_BOOLEAN }, "nop")
                },
                "the top bar stops reading the snow flag" to { context, sites ->
                    val bar = sites.readers.single { it.origName == "drawChild" }
                    val method = context.tgMutableClassDefBy(bar.definingClass).methods.single { it.origName == bar.origName &&
                        it.parameterTypes.map(CharSequence::toString) == bar.parameterTypes.map(CharSequence::toString) }
                    val body = method.instructions()
                    val read = body.indexOfFirst { it.opcode == Opcode.SGET_BOOLEAN && (it as ReferenceInstruction).reference.origString() == sites.snow.toString() }
                    method.replaceInstruction(read, "const/4 v${body[read].namedRegisters()[0]}, 0x0")
                },
            )
            for ((case, change) in changes) {
                val context = contextFor(build)
                change(context, context.resolveHolidayLookSites())
                assertRefusedUntouched(build, case, context)
            }
            assertRefusedUntouched(build, "no runtime", contextFor(build, runtime = false))
        }
    }

    private fun assertRefusedUntouched(file: java.io.File, case: String, context: BytecodePatchContext) {
        val build = file.name
        val owners = owners(file).map { it.type }
        val types = owners + listOf(HOLIDAY_LOOK, SETTINGS_STATUS).filter { context.tgClassDefByOrNull(it) != null }
        val before = snapshot(context, types)
        try {
            holidayLookPatch.execute(context)
            fail("$build: $case was accepted")
        } catch (expected: PatchException) {
            assertTrue("$build: $case: ${expected.message}", expected.message.orEmpty().contains("before editing"))
        }
        assertEquals("$build: $case doesn't partly mutate the holiday check or its readers", before,
            snapshot(context, types))
        val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "holidayLook" }.instructions()
        assertEquals("$build: $case leaves the build fact false", 0, (status[0] as NarrowLiteralInstruction).narrowLiteral)
        assertEquals("$build: $case leaves the title emoji fact false", 0, flag(context, "titleEmoji"))
    }

    private fun flag(context: BytecodePatchContext, name: String) =
        (context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == name }.instructions()[0] as NarrowLiteralInstruction).narrowLiteral

    private fun snapshot(context: BytecodePatchContext, types: List<String>) = types.associateWith { type ->
        val owner = context.tgMutableClassDefBy(type)
        listOf(owner.accessFlags, owner.fields.map { listOf(it.name, it.type, it.accessFlags, it.initialValue) },
            owner.methods.map { method -> listOf(method.name, method.parameterTypes.map(CharSequence::toString), method.returnType,
                method.accessFlags, method.implementation?.registerCount, method.instructions().map(::operation),
                method.implementation?.let { ControlFlow.of(method).normal.toList() },
                method.implementation?.let { ControlFlow.of(method).exceptional.toList() }) })
    }

    /**
     * The edited method holds the stock one's operations outside the [size] instructions inserted
     * at [at], and every stock jump still goes where it went, a jump to the hooked instruction now
     * landing on the hook. Returns where each stock index moved.
     */
    private fun assertKeepsStock(what: String, original: Method, after: Method, at: Int, size: Int): Map<Int, Int> =
        assertKeepsStock(what, original, after, listOf(at until at + size))

    /** As above, with a hook at each of [inserted], given as indexes in [after]. */
    private fun assertKeepsStock(what: String, original: Method, after: Method, inserted: List<IntRange>): Map<Int, Int> {
        val old = original.instructions()
        val now = after.instructions()
        val kept = old.indices.toList()
        val moved = now.indices.filterNot { index -> inserted.any { index in it } }
        assertEquals("$what keeps every stock operation", kept.map { operation(old[it]) }, moved.map { operation(now[it]) })
        val to = kept.zip(moved).toMap()
        // A stock jump to an instruction that now has a hook just before it lands on the hook.
        val landing = to.mapValues { (_, at) -> inserted.singleOrNull { it.last + 1 == at }?.first ?: at }
        val oldFlow = ControlFlow.of(original)
        val newFlow = ControlFlow.of(after)
        for (index in kept) {
            assertEquals("$what keeps stock flow from $index", oldFlow.normal[index].map { landing.getValue(it) },
                newFlow.normal[to.getValue(index)])
        }
        return to
    }

    /** The holiday check's class and every class reading its snow flag. */
    private fun owners(build: java.io.File): List<ClassDef> {
        val check = FixtureDex.classesWhere(build, HAT_CENSUS, { true }) { method -> method.instructions().any { it.reference() == NEW_YEAR_HAT } }
        assertEquals("${build.name}: the holiday check", 1, check.size)
        val loader = check.single().methods.single { method -> method.instructions().any { it.reference() == NEW_YEAR_HAT } }
        val snow = loader.instructions().first { it.opcode == Opcode.SPUT_BOOLEAN }.reference()
        val readers = FixtureDex.classesWhere(build, SNOW_CENSUS, { true }) { method -> method.origName == "getTextStartX" ||
            method.instructions().any { (it.opcode == Opcode.SGET_BOOLEAN && it.reference() == snow) ||
                (method.origName == "createView" && it.reference() == "Lorg/telegram/messenger/R\$drawable;->telegram_logo_2:I") } }
        // 13.2 loads the logo through a static helper right after its id, and the patch reads that helper's body.
        val loaders = readers.flatMap { it.methods }.filter { it.origName == "createView" }.mapNotNull { method ->
            val body = method.instructions()
            val logo = body.indexOfFirst { it.reference() == "Lorg/telegram/messenger/R\$drawable;->telegram_logo_2:I" }
            body.getOrNull(logo + 1)?.takeIf { logo >= 0 && it.opcode == Opcode.INVOKE_STATIC }
                ?.let { ((it as ReferenceInstruction).reference as MethodReference).definingClass }
        }.toSet()
        return (check + readers + FixtureDex.classes(build, loaders).values).distinctBy { it.type }
    }

    private fun contextFor(build: java.io.File, runtime: Boolean = true): BytecodePatchContext {
        val extension = ExtensionDex.classes().filter { runtime || it.origType != HOLIDAY_LOOK }
        return PatchContexts.of(extension + owners(build))
    }

    private companion object {
        val HAT_CENSUS = FixtureDex.ClassCensus()
        val SNOW_CENSUS = FixtureDex.ClassCensus()
        const val DECORATE = "$TITLE_EMOJI->decorate(Landroid/text/SpannableStringBuilder;)V"
        val HOOK = listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.CONST_4, Opcode.IF_NE, Opcode.SPUT_BOOLEAN,
            Opcode.SGET_OBJECT, Opcode.IF_NEZ, Opcode.GOTO, Opcode.CONST_4, Opcode.SPUT_OBJECT, Opcode.SPUT_BOOLEAN,
            Opcode.CONST_WIDE_16, Opcode.SPUT_WIDE, Opcode.NOP)
    }

    /** The chat list's own call names the setter; R8 renames it between builds (I, then G). */
    private fun titleSetter(context: BytecodePatchContext, logo: HolidayLogoSites): MutableMethod {
        val call = (logo.create.instructions()[logo.registerAt + 5] as ReferenceInstruction).reference as MethodReference
        return context.tgMutableClassDefBy(logo.bar.definingClass).methods.single { it.origName == call.origName &&
            it.parameterTypes.map(CharSequence::toString) == call.parameterTypes.map(CharSequence::toString) &&
            it.origReturnType == call.origReturnType }
    }

    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
    // 13.2 inlined its R classes: a const holding a resource id reads as the R field it stands for.
    private fun Instruction.reference() = if (this is NarrowLiteralInstruction) origRef() else
        ((this as? ReferenceInstruction)?.reference as? Any)?.let {
            if (it is FieldReference) "${it.definingClass}->${it.name}:${it.type}" else it.toString() }
    private fun operation(instruction: Instruction) = listOf(instruction.opcode, instruction.reference(), instruction.namedRegisters(),
        (instruction as? WideLiteralInstruction)?.wideLiteral)
}
