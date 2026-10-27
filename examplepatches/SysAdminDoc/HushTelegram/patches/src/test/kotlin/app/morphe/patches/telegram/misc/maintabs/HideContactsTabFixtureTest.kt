/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.maintabs

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.ControlFlow
import app.morphe.util.branchTarget
import app.morphe.util.call
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/** Telegram's main screen, its bar and tab views, its pager and the runtime. */
class HideContactsTabFixtureTest {
    @Test fun `the Contacts tab is hidden each time the bar is set, and a swipe asks before landing on its page`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val plan = context.resolveMainTabs()
            assertEquals("$name: one swipe question each way", listOf(true, false), plan.gates.map { it.forward })

            val oldShown = ImmutableMethod.of(plan.shown)
            val shownBefore = oldShown.controlBody()
            val oldShownFlow = ControlFlow.of(oldShown)
            val shownWays = shownBefore.indices.filter { plan.shownReturn in oldShownFlow.normal[it] }
            assertTrue("$name: the Calls or Settings method reaches its end more than one way", shownWays.size >= 2)
            val oldGates = plan.gates.map { ImmutableMethod.of(it.method) }
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { hideContactsTabPatch.execute(context) })

            // The bar's method: the hook in front of its one return, on every way there.
            val shownAfter = plan.shown.controlBody()
            assertEquals("$name: one instruction", shownBefore.size + 1, shownAfter.size)
            val hook = shownAfter[plan.shownReturn]
            assertEquals(Opcode.INVOKE_STATIC, hook.opcode)
            assertEquals(TABS_SHOWN, hook.controlRef())
            assertEquals("$name: this and the animated flag",
                listOf(oldShown.localRegisterCount(), oldShown.localRegisterCount() + 2), hook.namedRegisters())
            assertEquals(Opcode.RETURN_VOID, shownAfter[plan.shownReturn + 1].opcode)
            val shownFlow = ControlFlow.of(plan.shown)
            for (way in shownWays) assertTrue("$name: way $way", plan.shownReturn in shownFlow.normal[way])
            assertStock(name, shownBefore, shownAfter) { if (it < plan.shownReturn) it else it + 1 }

            // Each swipe question: the page and the way to the extension, a no on true, Telegram's own question on false.
            for ((gate, old) in plan.gates.zip(oldGates)) {
                val what = "$name ${gate.method.name}"
                val before = old.controlBody()
                val after = gate.method.controlBody()
                val self = old.localRegisterCount()
                assertEquals(what, before.size + 7, after.size)
                assertEquals(what, listOf(Opcode.IGET, Opcode.CONST_4, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ,
                    Opcode.CONST_4, Opcode.RETURN), after.take(7).map { it.opcode })
                assertTrue(what, gate.position != gate.direction && gate.position < self && gate.direction < self)
                assertEquals(what, listOf(gate.position, self), after[0].namedRegisters())
                assertEquals(what, plan.position, after[0].controlRef())
                assertEquals(what, listOf(gate.direction), after[1].namedRegisters())
                assertEquals(what, if (gate.forward) 1 else 0, (after[1] as NarrowLiteralInstruction).narrowLiteral)
                assertEquals(what, BLOCKS_SWIPE, after[2].controlRef())
                assertEquals(what, listOf(gate.position, gate.direction), after[2].namedRegisters())
                assertEquals(what, listOf(gate.position), after[3].namedRegisters())
                assertEquals(what, listOf(gate.position), after[4].namedRegisters())
                assertEquals("$what: false goes on to Telegram's question", 7, after.branchTarget(4) { throw AssertionError(it) })
                assertEquals(what, 0, (after[5] as NarrowLiteralInstruction).narrowLiteral)
                assertEquals(what, listOf(gate.position), after[6].namedRegisters())
                assertStock(what, before, after) { it + 7 }
            }

            // The stubs reach the bar, the kept tabs and the pager the way Telegram does.
            val runtime = context.mutableClassDefBy(MAIN_TABS).methods
            fun stub(method: String) = runtime.single { it.name == method }.controlBody()
            val hide = stub("hideContacts")
            assertEquals(plan.screen, hide.first().controlRef())
            assertEquals(Opcode.CHECK_CAST, hide.first().opcode)
            assertEquals(listOf(plan.bar, plan.tabs), hide.filter { it.opcode == Opcode.IGET_OBJECT }.map { it.controlRef() })
            // The tab taken from the kept tabs is the Contacts one.
            val aget = hide.indexOfFirst { it.opcode == Opcode.AGET_OBJECT }
            val contactsIndex = hide[(aget - 1 downTo 0).first { hide[it].namedRegisters().firstOrNull() == hide[aget].namedRegisters()[2] }]
            assertEquals(Opcode.CONST_4, contactsIndex.opcode)
            assertEquals(CONTACTS, (contactsIndex as NarrowLiteralInstruction).narrowLiteral)
            val call = hide.indexOfFirst { it.opcode == Opcode.INVOKE_VIRTUAL }
            assertEquals(plan.setTab, hide[call].controlRef())
            assertEquals(hide[aget].namedRegisters()[0], hide[call].namedRegisters()[1])
            // Hidden, with the animation the bar's own change has (p1, the last of six registers).
            val visible = (aget + 1 until call).single { hide[it].opcode == Opcode.CONST_4 && hide[it].namedRegisters()[0] == hide[call].namedRegisters()[2] }
            assertEquals(0, (hide[visible] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(5, hide[call].namedRegisters()[3])

            val page = stub("page")
            assertEquals(listOf(Opcode.CHECK_CAST, Opcode.IGET_OBJECT, Opcode.IF_EQZ, Opcode.IGET, Opcode.RETURN, Opcode.CONST_4, Opcode.RETURN),
                page.map { it.opcode })
            assertEquals(listOf(plan.screen, plan.pager, plan.position), listOf(page[0], page[1], page[3]).map { it.controlRef() })
            assertEquals(-1, (page[5] as NarrowLiteralInstruction).narrowLiteral)

            val chats = stub("showChats")
            assertEquals(plan.screen, chats.first().controlRef())
            assertEquals(plan.pager, chats.single { it.opcode == Opcode.IGET_OBJECT }.controlRef())
            assertEquals(listOf(plan.slide, plan.set, plan.mark), chats.filter { it.opcode == Opcode.INVOKE_VIRTUAL }.map { it.controlRef() })
            val first = chats.single { it.opcode == Opcode.CONST_4 }
            assertEquals(0, (first as NarrowLiteralInstruction).narrowLiteral)
            for (call in chats.filter { it.opcode == Opcode.INVOKE_VIRTUAL }) assertEquals(first.namedRegisters()[0], call.namedRegisters()[1])
            // The screen marks Chats with the animation it was given (p0 and p1, the last of four registers).
            assertEquals(listOf(2, first.namedRegisters()[0], 3), chats.filter { it.opcode == Opcode.INVOKE_VIRTUAL }.last().namedRegisters())

            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "hideContactsTab" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    @Test fun `each of the bar's sizes goes through the runtime right after Telegram sets it`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val compact = context.resolveCompactBar(context.resolveMainTabs())
            assertNull("$name: ${compact.missing}", compact.missing)
            assertEquals("$name: padding, corner and height as the main screen builds, then the width as the bar measures",
                listOf(BAR_PADDING, BAR_CORNER, BAR_HEIGHT, BAR_MIN_WIDTH), compact.sizes.map { it.hook })
            assertEquals(name, listOf("createView", "createView", "createView", "onMeasure"), compact.sizes.map { it.method.name })
            val before = compact.sizes.map { it.method }.distinct().associateWith { ImmutableMethod.of(it).controlBody() }
            assertEquals("$name: Telegram's own 12 dp, 28 dp, 72 dp and 320 dp", listOf(STOCK_PADDING, STOCK_CORNER, STOCK_HEIGHT, STOCK_MIN_WIDTH),
                compact.sizes.map { (before.getValue(it.method)[it.at - 1] as NarrowLiteralInstruction).narrowLiteral })
            for (size in compact.sizes) {
                val stock = before.getValue(size.method)
                assertEquals("$name ${size.hook}", listOf(size.register), stock[size.at - 1].namedRegisters())
                // The next thing to name the register is the call Telegram hands the size to.
                val read = (size.at until stock.size).first { size.register in stock[it].namedRegisters() }
                assertEquals("$name ${size.hook}", Opcode.INVOKE_STATIC, stock[read].opcode)
            }
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { hideContactsTabPatch.execute(context) })

            for ((method, stock) in before) {
                val what = "$name ${method.name}"
                val own = compact.sizes.filter { it.method === method }.sortedBy { it.at }
                val after = method.controlBody()
                assertEquals("$what: two instructions a size", stock.size + 2 * own.size, after.size)
                val flow = ControlFlow.of(method)
                own.forEachIndexed { earlier, size ->
                    val hook = size.at + 2 * earlier
                    assertEquals(what, listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT), listOf(after[hook].opcode, after[hook + 1].opcode))
                    assertEquals(what, size.hook, after[hook].controlRef())
                    assertEquals(what, listOf(size.register), after[hook].namedRegisters())
                    assertEquals(what, listOf(size.register), after[hook + 1].namedRegisters())
                    // Only Telegram's constant leads into the hook.
                    assertEquals(what, listOf(hook - 1), after.indices.filter { hook in flow.normal[it] || hook in flow.exceptional[it] })
                }
                assertStock(what, stock, after) { i -> i + 2 * own.count { it.at <= i } }
            }
            for (flag in listOf("hideContactsTab", "compactTabBar", "hideNewMessage")) {
                val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == flag }.controlBody()
                assertEquals("$name: $flag", 1L, (status.first() as WideLiteralInstruction).wideLiteral)
            }
        }
    }

    @Test fun `a changed bar leaves the compact switch out and the Contacts tab switch in`() {
        val cases = listOf<Triple<String, String, (BytecodePatchContext, CompactBar) -> Unit>>(
            Triple("padding", "the bar's padding is no longer Telegram's own size") { _, bar ->
                bar.sizes[0].let { it.method.replaceInstruction(it.at - 1, "const/high16 v${it.register}, 0x41800000") }
            },
            Triple("padding read twice", "the bar's padding is read by something else too") { _, bar ->
                bar.sizes[0].let { it.method.addInstruction(it.at, "invoke-static {v${it.register}}, Ljava/lang/Float;->isNaN(F)Z") }
            },
            Triple("corner", "the bar's corner is no longer Telegram's own size") { _, bar ->
                bar.sizes[1].let { it.method.replaceInstruction(it.at - 1, "const/high16 v${it.register}, 0x41a00000") }
            },
            Triple("inset", "the bar's background no longer starts 7.67 dp inside the bar") { _, bar ->
                val build = bar.sizes[0].method
                val body = build.controlBody()
                val inset = body.indices.single { body[it].opcode == Opcode.CONST && (body[it] as NarrowLiteralInstruction).narrowLiteral == 0x40f54fdf }
                build.replaceInstruction(inset, "const v${body[inset].namedRegisters()[0]}, 0x41000000")
            },
            Triple("gravity", "the bar no longer sits at the bottom in the middle") { _, bar ->
                bar.sizes[2].let {
                    val gravity = it.method.controlBody()[it.at]
                    assertEquals(0x51, (gravity as NarrowLiteralInstruction).narrowLiteral)
                    it.method.replaceInstruction(it.at, "const/16 v${gravity.namedRegisters()[0]}, 0x50")
                }
            },
            Triple("height", "the bar's height is no longer Telegram's own size") { _, bar ->
                bar.sizes[2].let { it.method.replaceInstruction(it.at - 1, "const/16 v${it.register}, 0x40") }
            },
            Triple("width", "the bar's tab width is no longer Telegram's own size") { _, bar ->
                bar.sizes[3].let { it.method.replaceInstruction(it.at - 1, "const/high16 v${it.register}, 0x43800000") }
            },
            Triple("tab height", "the bar no longer fits its tabs inside its padding") { _, bar ->
                val measure = bar.sizes[3].method
                val bottom = measure.controlBody().indexOfFirst { it.call()?.name == "getPaddingBottom" }
                val self = measure.controlBody()[bottom].namedRegisters().single()
                measure.replaceInstruction(bottom, "invoke-virtual {v$self}, Landroid/view/View;->getPaddingRight()I")
            },
        )
        for (build in Fixtures.declaredBuilds()) {
            val hosts = hosts(build)
            for ((name, reason, change) in cases) {
                val what = "${build.name}: $name"
                val context = PatchContexts.of(ExtensionDex.classes() + hosts)
                val plan = context.resolveMainTabs()
                val found = context.resolveCompactBar(plan)
                assertNull("$what: ${found.missing}", found.missing)
                change(context, found)
                val sized = found.sizes.map { it.method }.distinct()
                val before = sized.map { method -> method.controlBody().map(::operands) }
                val shown = plan.shown.controlBody().size
                assertEquals(what, listOf("Hide Contacts tab: $reason. The patch goes on without the compact bar."),
                    PatchLogCapture.warnings { hideContactsTabPatch.execute(context) })
                assertEquals("$what: the bar's sizes stay Telegram's", before, sized.map { method -> method.controlBody().map(::operands) })
                assertEquals("$what: the Contacts tab is still hidden each time the bar is set", shown + 1, plan.shown.controlBody().size)
                for ((flag, value) in listOf("hideContactsTab" to 1L, "compactTabBar" to 0L, "sideMenu" to 1L, "hideNewMessage" to 1L)) {
                    val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == flag }.controlBody()
                    assertEquals("$what: $flag", value, (status.first() as WideLiteralInstruction).wideLiteral)
                }
            }
        }
    }

    @Test fun `a swipe back from the first page reaches the side menu, and Back asks it first`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val plan = context.resolveMainTabs()
            val side = context.resolveSideMenu(plan)
            assertNull("$name: ${side.missing}", side.missing)
            val start = side.start!!
            val back = side.back!!
            assertEquals("$name: the swipe starts in the pager's base class", plan.swipeStart.substringBefore("->"), start.definingClass)
            assertEquals(name, "onBackPressed", back.name)
            val oldStart = ImmutableMethod.of(start)
            val oldBack = ImmutableMethod.of(back)
            val startBefore = oldStart.controlBody()
            val backBefore = oldBack.controlBody()
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { hideContactsTabPatch.execute(context) })

            // The swipe start: the pager, the event and the way, before anything else.
            val startAfter = start.controlBody()
            assertEquals(name, startBefore.size + 1, startAfter.size)
            assertEquals(Opcode.INVOKE_STATIC, startAfter[0].opcode)
            assertEquals(SWIPE_STARTS, startAfter[0].controlRef())
            val self = oldStart.localRegisterCount()
            assertEquals("$name: this, the event and the way", listOf(self, self + 1, self + 2), startAfter[0].namedRegisters())
            assertStock("$name swipe start", startBefore, startAfter) { it + 1 }

            // Back: the menu's answer first, Telegram's "handled" when it took Back, Telegram's own answer otherwise.
            val backAfter = back.controlBody()
            assertEquals(name, backBefore.size + 5, backAfter.size)
            assertEquals(name, listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.CONST_4, Opcode.RETURN),
                backAfter.take(5).map { it.opcode })
            val screen = oldBack.localRegisterCount()
            assertEquals(MENU_BACK, backAfter[0].controlRef())
            assertEquals("$name: the screen and whether Back happened", listOf(screen, screen + 1), backAfter[0].namedRegisters())
            for (at in 1..4) assertEquals("$name back $at", listOf(side.borrowed), backAfter[at].namedRegisters())
            assertTrue("$name: a local", side.borrowed < screen)
            assertEquals("$name: false goes on to Telegram's Back", 5, backAfter.branchTarget(2) { throw AssertionError(it) })
            assertEquals(name, 0, (backAfter[3] as NarrowLiteralInstruction).narrowLiteral)
            assertStock("$name back", backBefore, backAfter) { it + 5 }

            // The stubs reach the pager's screen, its backward question, the page turn, the switcher and Telegram's words.
            val runtime = context.mutableClassDefBy(SIDE_MENU).methods
            fun stub(method: String) = runtime.single { it.name == method }.controlBody()
            val pagerType = plan.pager.substringAfter(":")
            val screenStub = stub("screen")
            assertEquals(listOf(pagerType, plan.screen), screenStub.filter { it.opcode == Opcode.INSTANCE_OF }.map { it.controlRef() })
            assertEquals(listOf(side.screenField), screenStub.filter { it.opcode == Opcode.IGET_OBJECT }.map { it.controlRef() })
            assertEquals(listOf(side.backward), stub("mayOpen").filter { it.opcode == Opcode.INVOKE_VIRTUAL }.map { it.controlRef() })
            assertEquals(plan.gates.single { !it.forward }.method.name, side.backward.substringAfter("->").substringBefore("("))
            assertEquals(listOf(plan.slide, plan.mark), stub("turnTo").filter { it.opcode == Opcode.INVOKE_VIRTUAL }.map { it.controlRef() })
            assertEquals(listOf(side.accounts), stub("accounts").filter { it.opcode == Opcode.INVOKE_VIRTUAL }.map { it.controlRef() })
            assertEquals("$name: Telegram's word for each row, in order", LABELS.map { "Lorg/telegram/messenger/R\$string;->$it:I" },
                stub("labels").filter { it.opcode == Opcode.SGET }.map { it.controlRef() })
            assertEquals(side.currentAccount, stub("selfId").first { it.opcode == Opcode.INVOKE_VIRTUAL }.controlRef())
            assertEquals(Opcode.RETURN_WIDE, stub("selfId").last().opcode)
            assertTrue(name, stub("selfName").any { it.controlRef()?.startsWith("Lorg/telegram/messenger/UserObject;->getUserName(") == true })

            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "sideMenu" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    @Test fun `a build without what the side menu needs keeps the other two switches`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build, leaveOut = setOf(LAUNCHER)))
            val plan = context.resolveMainTabs()
            val start = context.mutableClassDefBy(plan.swipeStart.substringBefore("->")).methods
                .single { "${it.definingClass}->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" == plan.swipeStart }
            val before = start.controlBody().map(::operands)
            assertEquals(name, listOf("Hide Contacts tab: Telegram's main activity is gone. The patch goes on without the side menu."),
                PatchLogCapture.warnings { hideContactsTabPatch.execute(context) })
            assertEquals("$name: the swipe start stays Telegram's", before, start.controlBody().map(::operands))
            for ((flag, value) in listOf("hideContactsTab" to 1L, "compactTabBar" to 1L, "sideMenu" to 0L, "hideNewMessage" to 1L)) {
                val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == flag }.controlBody()
                assertEquals("$name: $flag", value, (status.first() as WideLiteralInstruction).wideLiteral)
            }
        }
    }

    @Test fun `compose and Done roles scope the native animation visibility guard to the right button`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val found = context.resolveNewMessageButton()
            assertNull("$name: ${found.missing}", found.missing)
            val method = found.method!!
            val stock = ImmutableMethod.of(method).controlBody()
            val animation = found.animation!!
            val animationStock = ImmutableMethod.of(animation).controlBody()
            val buttonClass = context.mutableClassDefBy(animation.definingClass)
            val neighboringMethods = buttonClass.methods.filter { it != animation }.associateWith { it.controlBody().map(::operands) }
            assertEquals("$name: the compose icon", COMPOSE_ICON, stock[found.at].controlRef())
            assertEquals("$name: the picture is set on the button right after", listOf(found.register),
                stock[found.at + 1].namedRegisters().take(1))
            // The Done branch clears the registration if Telegram ever reuses a compose instance.
            assertTrue("$name: the check mark branch comes first", stock.take(found.at).any { it.controlRef()?.endsWith("->floating_check:I") == true })
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { hideContactsTabPatch.execute(context) })

            val after = method.controlBody()
            val hook = found.at + 1
            assertEquals("$name: two role hooks", stock.count { it.opcode != Opcode.NOP } + 2, after.count { it.opcode != Opcode.NOP })
            assertEquals(name, Opcode.INVOKE_STATIC_RANGE, after[hook].opcode)
            assertEquals(name, NEW_MESSAGE_BUTTON, after[hook].controlRef())
            assertEquals("$name: the icon load follows the hook", COMPOSE_ICON, after[hook + 1].controlRef())
            assertEquals("$name: Done clears the compose role", NEW_MESSAGE_DONE, after[found.doneAt].controlRef())
            assertEquals("$name: Done keeps its icon", DONE_ICON, after[found.doneAt + 1].controlRef())
            // The way into the pencil's branch now lands on the hook, and nothing else leads into it.
            val flow = ControlFlow.of(method)
            val into = after.indices.filter { hook in flow.normal[it] || hook in flow.exceptional[it] }
            assertEquals("$name: one way in", 1, into.size)
            assertTrue("$name: a branch, not the check mark's return", after[into.single()].opcode != Opcode.RETURN_VOID)
            assertStock(name, stock, after) { it + (if (it >= found.doneAt) 1 else 0) + (if (it >= found.at) 1 else 0) }
            val animated = animation.controlBody()
            assertEquals("$name: the animator keeps all instructions", animationStock.size, animated.size)
            assertEquals(name, Opcode.INVOKE_STATIC, animated[found.visibilityAt].opcode)
            assertEquals(name, NEW_MESSAGE_VISIBILITY, animated[found.visibilityAt].controlRef())
            assertEquals("$name: the same view and native visibility", animationStock[found.visibilityAt].namedRegisters(),
                animated[found.visibilityAt].namedRegisters())
            for (index in animationStock.indices.filter { it != found.visibilityAt }) {
                assertEquals("$name: animator instruction $index", operands(animationStock[index]), operands(animated[index]))
            }
            for ((other, before) in neighboringMethods) {
                assertEquals("$name: ${other.name} stays native", before, other.controlBody().map(::operands))
            }
            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "hideNewMessage" }.controlBody()
            assertEquals("$name: hideNewMessage", 1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    @Test fun `a changed native visibility writer disables only new message hiding before any role hook is added`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val found = context.resolveNewMessageButton()
            assertNull("$name: ${found.missing}", found.missing)
            val animation = found.animation!!
            val registers = animation.controlBody()[found.visibilityAt].namedRegisters()
            animation.replaceInstruction(found.visibilityAt, "invoke-virtual {v${registers[0]}, v${registers[1]}}, Landroid/view/View;->setMinimumHeight(I)V")
            val role = found.method!!
            val beforeRole = role.controlBody().map(::operands)
            val beforeAnimation = animation.controlBody().map(::operands)
            assertEquals(name, listOf("Hide Contacts tab: the compose button no longer has one native visibility animator (0). " +
                "The patch goes on without the new message switch."), PatchLogCapture.warnings { hideContactsTabPatch.execute(context) })
            assertEquals("$name: no compose or Done hook", beforeRole, role.controlBody().map(::operands))
            assertEquals("$name: no partial animator edit", beforeAnimation, animation.controlBody().map(::operands))
            assertNewMessageUnavailable(context, name)
        }
    }

    @Test fun `a changed Done role disables new message hiding rather than hiding selection controls`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val found = context.resolveNewMessageButton()
            assertNull("$name: ${found.missing}", found.missing)
            val method = found.method!!
            val iconRegister = method.controlBody()[found.doneAt].namedRegisters().first()
            method.replaceInstruction(found.doneAt, "const/4 v$iconRegister, 0x0")
            val before = method.controlBody().map(::operands)
            assertEquals(name, listOf("Hide Contacts tab: the chat list no longer sets one Done button role. " +
                "The patch goes on without the new message switch."), PatchLogCapture.warnings { hideContactsTabPatch.execute(context) })
            assertEquals("$name: no partial role edit", before, method.controlBody().map(::operands))
            assertNewMessageUnavailable(context, name)
        }
    }

    private fun assertNewMessageUnavailable(context: BytecodePatchContext, name: String) {
        for ((flag, value) in listOf("hideContactsTab" to 1L, "compactTabBar" to 1L, "sideMenu" to 1L, "hideNewMessage" to 0L)) {
            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == flag }.controlBody()
            assertEquals("$name: $flag", value, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    @Test fun `a chat list whose button changed leaves the new message switch out and keeps the others`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val found = context.resolveNewMessageButton()
            assertNull("$name: ${found.missing}", found.missing)
            val method = found.method!!
            val view = found.register
            method.replaceInstruction(found.at + 1, "invoke-virtual {v$view}, Landroid/view/View;->getVisibility()I")
            val before = method.controlBody().map(::operands)
            assertEquals(name, listOf("Hide Contacts tab: the new message button's picture is no longer set right after the icon loads. " +
                "The patch goes on without the new message switch."), PatchLogCapture.warnings { hideContactsTabPatch.execute(context) })
            assertEquals("$name: the chat list stays Telegram's", before, method.controlBody().map(::operands))
            for ((flag, value) in listOf("hideContactsTab" to 1L, "compactTabBar" to 1L, "sideMenu" to 1L, "hideNewMessage" to 0L)) {
                val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == flag }.controlBody()
                assertEquals("$name: $flag", value, (status.first() as WideLiteralInstruction).wideLiteral)
            }
        }
    }

    @Test fun `a build with no chat list keeps the other three switches`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build, withChatList = false))
            assertEquals(name, listOf("Hide Contacts tab: the chat list no longer sets its new message button in one place (0). " +
                "The patch goes on without the new message switch."), PatchLogCapture.warnings { hideContactsTabPatch.execute(context) })
            for ((flag, value) in listOf("hideContactsTab" to 1L, "compactTabBar" to 1L, "sideMenu" to 1L, "hideNewMessage" to 0L)) {
                val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == flag }.controlBody()
                assertEquals("$name: $flag", value, (status.first() as WideLiteralInstruction).wideLiteral)
            }
        }
    }

    private fun operands(instruction: Instruction): List<Any?> = listOf(instruction.opcode, instruction.namedRegisters(),
        instruction.controlRef(), (instruction as? NarrowLiteralInstruction)?.narrowLiteral)

    /** Every stock instruction is still there, at [moved] of its old index, unchanged. */
    private fun assertStock(what: String, before: List<Instruction>, after: List<Instruction>, moved: (Int) -> Int) {
        for (i in before.indices) {
            val j = moved(i)
            assertEquals("$what: stock $i", listOf(before[i].opcode, before[i].namedRegisters(), before[i].controlRef()),
                listOf(after[j].opcode, after[j].namedRegisters(), after[j].controlRef()))
        }
    }

    /**
     * The main screen, found the way the patch finds it, with the classes it names that the patch
     * reads: its superclass, the types of their fields, the tab views, and each one's superclasses.
     */
    private fun hosts(build: File, leaveOut: Set<String> = emptySet(), withChatList: Boolean = true): Collection<ClassDef> {
        val screens = FixtureDex.classesWhere(build, { true }, ::isMainBuild)
        assertEquals("${build.name}: one main screen", 1, screens.size)
        val loaded = LinkedHashMap<String, ClassDef>()
        screens.forEach { loaded[it.type] = it }
        if (withChatList) {
            val chatLists = FixtureDex.classesWhere(build, { true }, ::isChatListButton)
            chatLists.forEach { loaded[it.type] = it }
            val buttonTypes = chatLists.flatMap { cls -> cls.methods.filter(::isChatListButton).map { method ->
                val body = method.controlBody()
                body[body.indexOfFirst { it.controlRef() == COMPOSE_ICON } + 1].call()!!.definingClass
            } }.toSet()
            loaded.putAll(FixtureDex.classes(build, buttonTypes))
        }
        val asked = HashSet<String>(leaveOut)
        var wanted = setOfNotNull(screens.single().superclass) + (SIDE_MENU_HOSTS - leaveOut)
        while (wanted.isNotEmpty()) {
            asked += wanted
            loaded.putAll(FixtureDex.classes(build, wanted))
            val holders = listOfNotNull(loaded[screens.single().type], loaded[screens.single().superclass])
            val named = holders.flatMap { cls -> cls.fields.map { it.type.trimStart('[') } } +
                loaded.values.mapNotNull { it.superclass }
            wanted = named.filter { it.startsWith("L") && isAppType(it) && it !in asked && it !in loaded }.toSet()
        }
        return if (withChatList) loaded.values else loaded.values.filterNot { cls -> cls.methods.any(::isChatListButton) }
    }

    /** What the side menu reads beyond the main screen: the activity its links go to, and Telegram's account, name and words. */
    private val SIDE_MENU_HOSTS = setOf(LAUNCHER, "Lorg/telegram/messenger/UserConfig;", "Lorg/telegram/messenger/UserObject;",
        "Lorg/telegram/messenger/LocaleController;", "Lorg/telegram/messenger/R\$string;")

    private fun isAppType(type: String) = !type.startsWith("Landroid") && !type.startsWith("Ljava") && !type.startsWith("Lkotlin")

    private fun isChatListButton(method: Method) = method.controlBody().let { body ->
        body.any { it.controlRef() == COMPOSE_ICON } && body.any { it.controlRef() == NEW_MESSAGE_TITLE }
    }

    private fun isMainBuild(method: Method) = method.name == "createView" && method.controlBody().let { body ->
        listOf(CONTACTS_LABEL, CALLS_LABEL, SHOW_CALLS_TAB).all { ref -> body.any { it.controlRef() == ref } }
    }
}
