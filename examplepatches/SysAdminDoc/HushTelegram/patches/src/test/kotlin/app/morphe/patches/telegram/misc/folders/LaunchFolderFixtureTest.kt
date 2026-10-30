/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.folders

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.telegram.misc.chattypefolders.LOCAL_FILTER
import app.morphe.patches.telegram.misc.chattypefolders.MESSAGES_CONTROLLER
import app.morphe.patches.telegram.misc.chattypefolders.USER_CONFIG
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File
import java.util.concurrent.ConcurrentHashMap

/** Both pinned builds' chat list, whose first folder tab build asks the extension which tab to start on. */
class LaunchFolderFixtureTest {
    @Test fun `the first tab build hands the chat list to the extension before any tab goes in`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + launchFolderHosts(build))
            context.requireLaunchFolderRuntime()
            val plan = context.resolveLaunchFolder()
            assertNull("$name: ${plan.missing}", plan.missing)
            val method = plan.tabs!!
            val stock = method.body().map(::operands)
            plan.apply()
            val body = method.body()
            assertEquals("$name: the pick is one instruction", stock.size + LAUNCH_FOLDER_SIZE, body.size)
            val hook = body[plan.at]
            assertEquals(Opcode.INVOKE_STATIC_RANGE, hook.opcode)
            assertEquals("$LAUNCH_FOLDER->firstTabs(Ljava/lang/Object;)V", hook.ref())
            assertEquals(listOf(plan.self), hook.namedRegisters())
            // Right after the strip's tabs answer isEmpty, before the first of them is added.
            assertEquals("Ljava/util/ArrayList;->isEmpty()Z", body[plan.at - 2].ref())
            assertEquals(Opcode.MOVE_RESULT, body[plan.at - 1].opcode)
            assertEquals(plan.refs!!.tabs, body[plan.at - 3].ref())
            assertEquals(plan.refs!!.strip, body[plan.at - 4].ref())
            // The register is the copy of this the method makes first.
            assertEquals(listOf(plan.self, method.localRegisterCount()), body[0].namedRegisters())
            assertEquals("$name: Telegram's own code is unchanged around it", stock,
                (body.take(plan.at) + body.drop(plan.at + 1)).map(::operands))
            val refs = plan.refs!!
            assertEquals(refs.list, refs.strip.substringBefore("->"))
            assertEquals(refs.tabs.substringBefore("->"), refs.selected.substringBefore("->"))
            assertTrue(refs.selected, refs.selected.endsWith(":I"))
            assertEquals("${refs.list}->", refs.pages.substringBefore("->") + "->")
            assertEquals("[" + refs.selectedType.substringBefore("->"), refs.pages.substringAfter(":"))
            assertTrue(refs.arguments, refs.arguments.endsWith("->getArguments()Landroid/os/Bundle;"))
            assertTrue(refs.account, refs.account.endsWith("->getCurrentAccount()I"))
            // The strip's own list of tabs (declared beside the tabs, on the class the chat list's field may
            // subclass), and RecyclerView's scrollToPosition under whatever name it has.
            assertTrue("$name: ${refs.tabList}", refs.tabList?.startsWith(refs.tabs.substringBefore("->") + "->") == true)
            assertTrue("$name: ${refs.scrollTo}", refs.scrollTo?.startsWith("$TAB_LIST_BASE->") == true)
            assertTrue("$name: ${refs.scrollTo}", refs.scrollTo?.endsWith("(I)V") == true)
        }
    }

    @Test fun `the whole patch fills every stub and turns the switch on`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of((ExtensionDex.classes() + folderCounterHosts(build) + menuHosts(build)).distinctBy { it.type })
            val launch = context.resolveLaunchFolder()
            val refs = launch.refs!!
            val all = context.resolveAllChats(launch).refs!!
            assertEquals(name, emptyList<String>(), PatchLogCapture.warnings { hideFolderCountersPatch.execute(context) })
            val stubs = context.mutableClassDefBy(LAUNCH_FOLDER).methods.associateBy { it.name }
            // Each one whole: smali drops what it can't build, and the count shows it.
            val expected = mapOf(
                "tabsEmpty" to (9 to listOf(refs.strip, refs.tabs, "Ljava/util/ArrayList;->isEmpty()Z")),
                "arguments" to (4 to listOf(refs.arguments)),
                "account" to (4 to listOf(refs.account)),
                "select" to (14 to listOf(refs.pages, refs.strip, refs.selectedType, refs.selected)),
                "selectedAccount" to (2 to listOf("$USER_CONFIG->selectedAccount:I")),
                "userId" to (5 to listOf("$USER_CONFIG->getInstance(I)$USER_CONFIG", "$USER_CONFIG->getClientUserId()J")),
                "folderCount" to (7 to listOf("$MESSAGES_CONTROLLER->getDialogFilters()Ljava/util/ArrayList;", "Ljava/util/ArrayList;->size()I")),
                "folderId" to (9 to listOf("$LOCAL_FILTER->id:I")),
                "folderName" to (9 to listOf("$LOCAL_FILTER->name:Ljava/lang/String;")),
                "folderLocked" to (9 to listOf("$LOCAL_FILTER->locked:Z")),
                "folderDefault" to (10 to listOf("$LOCAL_FILTER->isDefault()Z")),
                "strip" to (3 to listOf(refs.strip)),
                "selectedType" to (11 to listOf(refs.pages, refs.selectedType)),
                "selectedId" to (6 to listOf(refs.strip, refs.selected)),
                "currentStable" to (7 to listOf(refs.strip, all.stable)),
                "selectByStable" to (7 to listOf(refs.strip, all.selectStable)),
                "folderStable" to (9 to listOf("$LOCAL_FILTER->localId:I")),
                "addTab" to (3 to listOf(all.addTab)),
                "presentArchive" to (11 to listOf("${refs.list}-><init>(Landroid/os/Bundle;)V", all.present)),
                "telegramArchiveTitle" to (4 to listOf("Lorg/telegram/messenger/R\$string;->ArchivedChats:I",
                    "Lorg/telegram/messenger/LocaleController;->getString(I)Ljava/lang/String;")),
                "scrollStrip" to (9 to listOf(refs.strip, refs.tabList!!, refs.scrollTo!!)),
            )
            for ((stub, want) in expected) {
                val body = stubs.getValue(stub).body()
                assertEquals("$name: $stub", want.first, body.size)
                val calls = body.mapNotNull { it.ref() }
                for (reference in want.second) assertTrue("$name: $stub reaches $reference", reference in calls)
            }
            // select sets the page's folder and the strip's selected id to the same index, the second parameter.
            val select = stubs.getValue("select").body().filter { it.opcode == Opcode.IPUT }
            assertEquals(listOf(refs.selectedType, refs.selected), select.map { it.ref() })
            assertEquals(listOf(4, 4), select.map { it.namedRegisters().first() })
            assertEquals(1, statusOf(context, "hideFolderCounters"))
            assertEquals(1, statusOf(context, "launchFolder"))
            assertEquals(1, statusOf(context, "hideAllChats"))
            val tabs = context.tabBuild(launchFolderList(build)).body()
            assertEquals(1, tabs.count { it.ref() == "$LAUNCH_FOLDER->firstTabs(Ljava/lang/Object;)V" })
            assertEquals(1, tabs.count { it.ref() == ALL_CHATS_TAB_HOOK })
            assertEquals(1, tabs.count { it.ref() == TABS_ADDED_HOOK })
            assertEquals("$name: the other folders' tabs still go in through Telegram's call", 1, tabs.count { it.ref() == all.addTab })
        }
    }

    @Test fun `Hide All Chats stands in for the All Chats tab, answers the page update and guards tab dragging`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + launchFolderHosts(build))
            context.requireLaunchFolderRuntime()
            context.requireAllChatsRuntime()
            val launch = context.resolveLaunchFolder()
            val plan = context.resolveAllChats(launch)
            assertNull("$name: ${plan.missing}", plan.missing)
            val method = plan.tabs!!
            val editing = plan.editing!!
            val done = plan.done!!
            val stock = method.body().map(::operands)
            val stockEditing = editing.body().map(::operands)
            val stockDone = done.body().map(::operands)
            val add = method.body()[plan.allChats]
            assertEquals(Opcode.INVOKE_VIRTUAL_RANGE, add.opcode)
            assertEquals(plan.refs!!.addTab, add.ref())
            assertEquals("$name: All Chats is the tab added right after its title is read", 1,
                method.body().take(plan.allChats).count { it.ref() == "Lorg/telegram/messenger/R\$string;->FilterAllChats:I" })
            plan.apply()

            val body = method.body()
            assertEquals("$name: the answer is two instructions", stock.size + TABS_ADDED_SIZE, body.size)
            // The call keeps its registers, now the extension's.
            assertEquals(Opcode.INVOKE_STATIC_RANGE, body[plan.allChats].opcode)
            assertEquals(ALL_CHATS_TAB_HOOK, body[plan.allChats].ref())
            assertEquals(stock[plan.allChats][1], body[plan.allChats].namedRegisters())
            // Asked just before Telegram's own question whether the page moves, and the question reads the answer.
            assertEquals(TABS_ADDED_HOOK, body[plan.update].ref())
            assertEquals(listOf(plan.self, plan.answer), body[plan.update].namedRegisters())
            assertEquals(Opcode.MOVE_RESULT, body[plan.update + 1].opcode)
            assertEquals(listOf(plan.answer), body[plan.update + 1].namedRegisters())
            assertEquals(Opcode.IF_EQZ, body[plan.update + 2].opcode)
            assertEquals(listOf(plan.answer), body[plan.update + 2].namedRegisters())
            assertEquals("$name: Telegram's own code is unchanged around it",
                stock.filterIndexed { i, _ -> i != plan.allChats },
                body.filterIndexed { i, _ -> i != plan.allChats && i != plan.update && i != plan.update + 1 }.map(::operands))

            // The strip's setIsEditing asks first and edits only on a yes.
            val edit = editing.body()
            val editRegisters = editing.implementation!!.registerCount
            assertEquals("$name: setIsEditing", stockEditing.size + EDITING_SIZE, edit.size)
            assertEquals("$LAUNCH_FOLDER->editing(Ljava/lang/Object;I)Z", edit[0].ref())
            assertEquals(listOf(editRegisters - 2, editRegisters - 1), edit[0].namedRegisters())
            assertEquals(Opcode.MOVE_RESULT, edit[1].opcode)
            assertEquals(listOf(editRegisters - 1), edit[1].namedRegisters())
            assertEquals(stockEditing, edit.drop(EDITING_SIZE).map(::operands))

            // The Done button returns before anything when editing was turned down.
            val shown = done.body()
            val doneRegisters = done.implementation!!.registerCount
            assertEquals("$name: the Done button", stockDone.size + SKIPS_DONE_SIZE, shown.size)
            assertEquals("$LAUNCH_FOLDER->skipsDone(Ljava/lang/Object;I)Z", shown[0].ref())
            assertEquals(listOf(doneRegisters - 2, doneRegisters - 1), shown[0].namedRegisters())
            assertEquals(listOf(Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID), shown.subList(1, 4).map { it.opcode })
            assertEquals("$name: a no runs the stock call", listOf(3, 4), ControlFlow.of(done).normal[2].sorted())
            assertEquals(stockDone, shown.drop(SKIPS_DONE_SIZE).map(::operands))

            val refs = plan.refs!!
            val strip = launch.refs!!.tabs.substringBefore("->")
            assertEquals(strip, editing.definingClass)
            assertEquals(launch.refs!!.list, done.definingClass)
            assertTrue(refs.stable, refs.stable == "$strip->getCurrentTabStableId()I")
            assertTrue(refs.selectStable, refs.selectStable.startsWith("$strip->") && refs.selectStable.endsWith("(I)Z"))
            assertTrue(refs.present, refs.present.contains("->presentFragment(") && refs.present.endsWith(")Z"))
        }
    }

    @Test fun `a chat list whose tabs changed leaves only Hide All Chats out`() {
        class Case(val name: String, val reason: String, val hosts: (List<ClassDef>) -> List<ClassDef> = { it },
                   val context: (BytecodePatchContext) -> Unit = { })
        val cases = listOf(
            Case("no archive title", "isn't reachable from the extension", hosts = { hosts ->
                hosts.filter { it.type != "Lorg/telegram/messenger/LocaleController;" }
            }),
            Case("a jump to the Done button's start", "something jumps back to the start of the chat list's Done button", context = { context ->
                val done = context.resolveAllChats(context.resolveLaunchFolder()).done!!
                done.addInstructionsWithLabels(done.body().size, "goto/16 :hush_in", ExternalLabel("hush_in", done.getInstruction(0)))
            }),
            Case("a jump into the page update", "something jumps into the folder tabs' page update", context = { context ->
                val plan = context.resolveAllChats(context.resolveLaunchFolder())
                val method = plan.tabs!!
                method.addInstructionsWithLabels(method.body().size, "goto/16 :hush_in", ExternalLabel("hush_in", method.getInstruction(plan.update)))
            }),
        )
        for (build in Fixtures.declaredBuilds()) for (case in cases) {
            val where = "${build.name} ${case.name}"
            val hosts = (folderCounterHosts(build) + menuHosts(build)).distinctBy { it.type }
            val context = PatchContexts.of((ExtensionDex.classes() + case.hosts(hosts)).distinctBy { it.type })
            context.requireLaunchFolderRuntime()
            context.requireAllChatsRuntime()
            case.context(context)
            val list = launchFolderList(build)
            val before = context.tabBuild(list).body().map(::operands)
            val warnings = PatchLogCapture.warnings { hideFolderCountersPatch.execute(context) }
            val left = warnings.single { it.contains("without hiding All Chats") }
            assertTrue("$where: $left", left.contains(case.reason))
            assertTrue("$where: $warnings", warnings.none { it.contains("without opening a folder at launch") })
            assertEquals(where, 1, statusOf(context, "launchFolder"))
            assertEquals(where, 0, statusOf(context, "hideAllChats"))
            val after = context.tabBuild(list).body()
            assertEquals("$where: only the pick goes in", before.size + LAUNCH_FOLDER_SIZE, after.size)
            assertTrue(where, after.none { it.ref() == ALL_CHATS_TAB_HOOK || it.ref() == TABS_ADDED_HOOK })
        }
    }

    @Test fun `a chat list whose first build changed leaves the switch out and the method as it was`() {
        class Case(val name: String, val reason: String, val hosts: (List<ClassDef>) -> List<ClassDef> = { it },
                   val context: (BytecodePatchContext, String) -> Unit = { _, _ -> })
        val cases = listOf(
            Case("no chat list", "the folder tabs' build is missing or ambiguous", hosts = { hosts ->
                hosts.filter { host -> host.methods.none { it.isTabBuildLike() } }
            }),
            Case("this written over", "doesn't read the chat list's own tabs", context = { context, list ->
                context.tabBuild(list).addInstructions(1, "const/4 v0, 0x0")
            }),
            Case("a jump to the pick", "something jumps into the folder tabs' first build", context = { context, list ->
                val method = context.tabBuild(list)
                val at = method.body().indexOfFirst { it.ref() == "Ljava/util/ArrayList;->isEmpty()Z" } + 2
                method.addInstructionsWithLabels(method.body().size, "goto/16 :hush_in", ExternalLabel("hush_in", method.getInstruction(at)))
            }),
            Case("the selected tab computed", "the tab strip's selected tab changed", context = { context, list ->
                val current = context.tabStrip(list).methods.single { it.name == "getCurrentTabId" }
                current.replaceInstruction(0, "const/4 v0, 0x0")
            }),
            Case("no BaseFragment", "the chat list's account or arguments can't be read", hosts = { hosts ->
                hosts.filter { host -> host.methods.none { it.name == "getArguments" && it.returnType == "Landroid/os/Bundle;" } }
            }),
            Case("no local folders", "isn't reachable from the extension", hosts = { hosts -> hosts.filter { it.type != LOCAL_FILTER } }),
        )
        for (build in Fixtures.declaredBuilds()) for (case in cases) {
            val where = "${build.name} ${case.name}"
            val list = launchFolderList(build)
            val context = PatchContexts.of(ExtensionDex.classes() + case.hosts(launchFolderHosts(build)))
            case.context(context, list)
            val before = context.tabBuildOrNull(list)?.body()?.map(::operands)
            val plan = context.resolveLaunchFolder()
            assertTrue("$where: ${plan.missing}", plan.missing.orEmpty().contains(case.reason))
            assertNull(where, plan.tabs)
            plan.apply()
            assertEquals("$where: nothing is edited", before, context.tabBuildOrNull(list)?.body()?.map(::operands))
        }
    }

    /**
     * A register past the last one a range call can name: smali emits no class for the snippet, and
     * the patcher's empty collection comes out of the rehearsal as a reason, not a crash of the patch.
     */
    @Test fun `a pick that can't name its register is caught by the rehearsal`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + launchFolderHosts(build))
            val plan = context.resolveLaunchFolder()
            val method = plan.tabs!!
            val stock = method.body().map(::operands)
            val failed = assertThrows(build.name, Exception::class.java) {
                LaunchFolderPlan(method, plan.at, 70_000, plan.refs, null).rehearse()
            }
            assertTrue("${build.name}: ${failed.message}", failed.message.orEmpty().startsWith("the folder pick doesn't compile"))
            assertEquals("${build.name}: the rehearsal works on a copy", stock, method.body().map(::operands))
        }
    }

    @Test fun `without the chat list the counters still go in with a warning`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of((ExtensionDex.classes() + folderCounterHosts(build)).distinctBy { it.type })
            val warnings = PatchLogCapture.warnings { hideFolderCountersPatch.execute(context) }
            // Without Telegram's MessagesController the hidden chats are left out too, with their own warning.
            assertEquals(build.name, 2, warnings.size)
            val launch = warnings.single { it.contains("without opening a folder at launch") }
            assertTrue(launch, launch.contains("the folder tabs' build is missing or ambiguous"))
            assertTrue(warnings.toString(), warnings.any { it.contains("without hiding chats") })
            assertEquals(1, statusOf(context, "hideFolderCounters"))
            assertEquals(0, statusOf(context, "launchFolder"))
            assertEquals(0, statusOf(context, "hideAllChats"))
            assertTrue(context.mutableClassDefBy(LAUNCH_FOLDER).methods.single { it.name == "select" }.body().none { it.opcode == Opcode.IPUT })
        }
    }

    private fun statusOf(context: BytecodePatchContext, flag: String) =
        (context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == flag }.body()[0] as NarrowLiteralInstruction).narrowLiteral

    private fun operands(instruction: Instruction): List<Any?> = listOf(instruction.opcode, instruction.namedRegisters(), instruction.ref())
}

private const val ALL_CHATS_TAB_HOOK = "$LAUNCH_FOLDER->allChatsTab(Ljava/lang/Object;IILjava/lang/String;Ljava/util/ArrayList;III)V"
private const val TABS_ADDED_HOOK = "$LAUNCH_FOLDER->tabsAdded(Ljava/lang/Object;I)Z"
private const val TAB_LIST_BASE = "Landroidx/recyclerview/widget/RecyclerView;"

private val LAUNCH_FOLDER_HOSTS = ConcurrentHashMap<String, List<ClassDef>>()
private val LAUNCH_FOLDER_LISTS = ConcurrentHashMap<String, String>()

internal fun Method.isTabBuildLike() = returnType == "V" && parameterTypes.map(CharSequence::toString) == listOf("Z", "Z") &&
    body().any { it.ref()?.endsWith("->getCurrentTabStableId()I") == true } &&
    body().any { it.ref() == "Lorg/telegram/messenger/R\$string;->FilterAllChats:I" }

/** DialogsActivity's type in [build]. */
internal fun launchFolderList(build: File): String = LAUNCH_FOLDER_LISTS.getOrPut(build.path) {
    FixtureDex.classesWhere(build, { true }) { it.isTabBuildLike() }.map { it.type }.single()
}

/**
 * DialogsActivity and the classes its first tab build reads, each with its parents, and the
 * account and folder classes the stubs call.
 */
internal fun launchFolderHosts(build: File): List<ClassDef> = LAUNCH_FOLDER_HOSTS.getOrPut(build.path) {
    val list = launchFolderList(build)
    val first = FixtureDex.classes(build, setOf(list)).getValue(list)
    val tabs = first.methods.single { it.isTabBuildLike() }
    // The dialog and notification classes are for the hidden chats' stubs, which go in with the same patch, the
    // storage and its queue for their unread counts, and the strings and locale for Hide All Chats' archive title.
    val wanted = mutableSetOf(list, MESSAGES_CONTROLLER, LOCAL_FILTER, USER_CONFIG, "Lorg/telegram/tgnet/TLRPC\$Dialog;",
        "Lorg/telegram/messenger/NotificationCenter;", "Lorg/telegram/messenger/MessagesStorage;",
        "Lorg/telegram/messenger/DispatchQueue;",
        "Lorg/telegram/messenger/R\$string;", "Lorg/telegram/messenger/LocaleController;")
    for (instruction in tabs.body()) {
        val field = (instruction as? ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.FieldReference ?: continue
        if (field.definingClass == list || field.definingClass.startsWith("Lorg/telegram/ui/")) {
            wanted += field.definingClass
            field.type.trimStart('[').takeIf { it.startsWith("Lorg/telegram/ui/") }?.let { wanted += it }
        }
    }
    // The strip's list of tabs, a RecyclerView, with each parent up to it, for the scroll to a picked tab.
    val strip = tabs.body().first { it.opcode == Opcode.IGET_OBJECT && it.ref()?.endsWith(":Ljava/util/ArrayList;") == true &&
        it.ref()!!.substringBefore("->") != list }.ref()!!.substringBefore("->")
    var chains = FixtureDex.classes(build, setOf(strip)).getValue(strip).fields
        .filter { !AccessFlags.STATIC.isSet(it.accessFlags) }.map { it.type }
        .filter { it.startsWith("L") && !it.startsWith("Ljava/") && !it.startsWith("Landroid/") }.map { listOf(it) }
    repeat(8) {
        val open = chains.map { it.last() }.filter { it != TAB_LIST_BASE }.toSet()
        if (open.isEmpty()) return@repeat
        val parents = FixtureDex.classes(build, open)
        chains = chains.mapNotNull { chain ->
            if (chain.last() == TAB_LIST_BASE) chain else parents[chain.last()]?.superclass?.let { chain + it }
        }
    }
    chains.filter { it.last() == TAB_LIST_BASE }.forEach { wanted += it }
    // Parents up to Telegram's BaseFragment and FilterTabsView, so inherited members resolve.
    var loaded = FixtureDex.classes(build, wanted)
    repeat(6) {
        val parents = loaded.values.mapNotNull { it.superclass }.filter { it.startsWith("Lorg/telegram/") && it !in wanted }
        if (parents.isEmpty()) return@repeat
        wanted += parents
        loaded = FixtureDex.classes(build, wanted)
    }
    loaded.values.toList()
}

/** The class with the folder tab counter. */
internal fun folderCounterHosts(build: File): List<ClassDef> = FixtureDex.classesWhere(build, { true }) { m ->
    m.returnType == "I" && m.body().map { it.ref() }.let { MAIN_UNREAD in it && FILTER_UNREAD in it }
}

private fun BytecodePatchContext.tabBuildOrNull(list: String): MutableMethod? =
    mutableClassDefByOrNull(list)?.methods?.singleOrNull { it.isTabBuildLike() }

private fun BytecodePatchContext.tabBuild(list: String): MutableMethod = tabBuildOrNull(list)!!

/** The tab strip class whose tab list the first build reads. */
private fun BytecodePatchContext.tabStrip(list: String) = mutableClassDefBy(
    tabBuild(list).body().first { it.ref()?.endsWith(":Ljava/util/ArrayList;") == true && it.opcode == Opcode.IGET_OBJECT &&
        it.ref()!!.substringBefore("->") != list }.ref()!!.substringBefore("->"))

private fun Method.body(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
private fun Instruction.ref() = (this as? ReferenceInstruction)?.reference?.toString()
