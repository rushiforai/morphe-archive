/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.drafts

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.util.names.origRef
import app.morphe.util.names.addInstructions
import app.morphe.util.names.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.util.ControlFlow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Test
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origInterfaces
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy
import app.morphe.util.names.tgMutableClassDefByOrNull

private const val MEDIA_DATA = "Lorg/telegram/messenger/MediaDataController;"
private val FLAGS = listOf("disableDraftPreviews", "localDrafts", "localSearch") + DraftPreviewTarget.entries.map { it.capability }

/** The builders' classes and the classes they hand work to are the whole context; nothing else is a target. */
class DisableDraftPreviewsFixtureTest {
    @Test
    fun `every compose builder is gated before its request and keeps its stock flow`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = contextFor(build)
            val hooks = context.resolveDraftPreviewHooks()
            assertEquals("${build.name}: complete compose coverage", DraftPreviewTarget.entries.toSet(), hooks.keys)
            val before = hooks.mapValues { ImmutableMethod.of(it.value.method) }
            val excluded = context.excludedBuilders().associateWith { it.instructions().map(::operation) }
            val drafts = context.resolveLocalDraftHook()
            val upload = ImmutableMethod.of(drafts.method)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { disableDraftPreviewsPatch.execute(context) })
            assertUploadGated(build.name, context, drafts, upload)

            for ((target, hook) in hooks) {
                val original = before.getValue(target)
                val old = original.instructions()
                val after = hook.method.instructions()
                val guard = after.subList(hook.index, hook.index + hook.size)
                assertEquals("${build.name}: $target guard method", "$DRAFT_PREVIEWS->${target.hook}()Z", guard[0].reference())
                // dexlib2 adds or drops the nop that aligns a switch table when a hook's length is odd,
                // as the bot share guard's is, so the stock code is matched with that padding left out.
                val kept = old.indices.filterNot { old.isPadding(it) }
                val now = after.indices.filterNot { after.isPadding(it) || it in hook.index until hook.index + hook.size }
                assertEquals("${build.name}: $target keeps every original operation", kept.map { operation(old[it]) },
                    now.map { operation(after[it]) })
                val oldFlow = ControlFlow.of(original)
                val newFlow = ControlFlow.of(hook.method)
                val movedTo = kept.zip(now).toMap()
                fun moved(index: Int) = movedTo.getValue(index)
                for (index in kept) {
                    assertEquals("${build.name}: $target keeps stock flow from $index",
                        oldFlow.normal[index].map { if (it == hook.index) hook.index else moved(it) }, newFlow.normal[moved(index)])
                }
                if (target == DraftPreviewTarget.BOT_SHARE) {
                    assertEquals("${build.name}: bot share guard", listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ,
                        Opcode.MOVE_OBJECT_FROM16, Opcode.CONST_4, Opcode.INVOKE_VIRTUAL, Opcode.GOTO_16, Opcode.NOP), guard.map { it.opcode })
                    val callback = old.subList(0, hook.index).last { it.opcode == Opcode.NEW_INSTANCE }
                    // 13.2's callback has its interface's build name for run, which the table maps on the interface only.
                    val owner = context.tgMutableClassDefBy(callback.reference()!!)
                    val run = owner.methods.single { m -> m.parameterTypes.map { it.toString() } == listOf("Ljava/lang/Object;") && m.returnType == "V" &&
                        (m.origName == "run" || owner.origInterfaces.any { face -> context.tgMutableClassDefByOrNull(face)?.methods?.any { it.origName == "run" && it.name == m.name } == true }) }
                    assertEquals("${build.name}: a skip hands the callback no preview", "${callback.reference()}->${run.origName}(Ljava/lang/Object;)V", guard[5].reference())
                    assertEquals("${build.name}: false fetches as before", listOf(hook.index + 7), newFlow.normal[hook.index + 2].filter { it != hook.index + 3 })
                    assertEquals("${build.name}: a skip leaves through the request's own exit", listOf(moved(hook.finish)), newFlow.normal[hook.index + 6])
                } else if (target == DraftPreviewTarget.CHAT || target == DraftPreviewTarget.SHARE) {
                    // A skip leaves the found links as a draft with none leaves them: null in chat,
                    // an emptied list on the share sheet, the same field the builder stores them in.
                    val forget = if (target == DraftPreviewTarget.CHAT) listOf(Opcode.CONST_4, Opcode.IPUT_OBJECT)
                        else listOf(Opcode.IGET_OBJECT, Opcode.INVOKE_VIRTUAL)
                    assertEquals("${build.name}: $target exact guard", listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ) + forget +
                        listOf(Opcode.GOTO_16, Opcode.NOP), guard.map { it.opcode })
                    val stored = old.filter { (it.opcode == Opcode.IPUT_OBJECT || it.opcode == Opcode.IGET_OBJECT) &&
                        (it as ReferenceInstruction).reference.let { field -> field is FieldReference && field.origDefiningClass == original.origDefiningClass &&
                            field.origType == "Ljava/util/ArrayList;" } }.map { it.reference() }.distinct()
                    val forgotten = guard[if (target == DraftPreviewTarget.CHAT) 4 else 3].reference()
                    assertEquals("${build.name}: $target forgets the links it stored", listOf(forgotten), stored)
                    if (target == DraftPreviewTarget.SHARE) {
                        assertEquals("${build.name}: share empties that list", "Ljava/util/ArrayList;->clear()V", guard[4].reference())
                    }
                    assertEquals("${build.name}: $target false fetches as before", listOf(hook.index + 6), newFlow.normal[hook.index + 2].filter { it != hook.index + 3 })
                    assertEquals("${build.name}: $target skip leaves through the no-preview exit", listOf(moved(hook.finish)), newFlow.normal[hook.index + 5])
                } else {
                    assertEquals("${build.name}: $target exact guard", listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_NEZ),
                        guard.map { it.opcode })
                    assertTrue("${build.name}: $target true reaches the no-preview exit", moved(hook.finish) in newFlow.normal[hook.index + 2])
                    assertTrue("${build.name}: $target false reaches the original code", hook.index + 3 in newFlow.normal[hook.index + 2])
                }
                // The skip goes where the builder already goes for a draft it doesn't fetch for.
                val request = requestOf(target, original)
                assertTrue("${build.name}: $target skip target is a stock no-request path",
                    hook.finish in reachable(oldFlow, 0, request))
                assertFalse("${build.name}: $target reaches its request without passing its guard",
                    moved(request) in reachable(newFlow, 0, hook.index))
            }
            for ((method, operations) in excluded) {
                assertEquals("${build.name}: leaves ${method.definingClass}->${method.name} alone", operations,
                    context.tgMutableClassDefBy(method.definingClass).methods.single { it.sameSignature(method) }.instructions().map(::operation))
            }
            for (flag in FLAGS) {
                val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == flag }.instructions()
                assertEquals("${build.name}: $flag build fact", 1, (status[0] as NarrowLiteralInstruction).narrowLiteral)
                assertEquals(Opcode.RETURN, status[1].opcode)
            }
        }
    }

    /**
     * The draft upload asks the switch with the request it built, right before the send, and a yes
     * goes past the send only. The draft was saved on the phone before that, and the reader written
     * for LocalDrafts.carries looks at every content field and the effect's flag. The emptier written
     * for LocalDrafts.clear takes all of that out and leaves where the draft goes.
     */
    private fun assertUploadGated(build: String, context: BytecodePatchContext, drafts: LocalDraftHook, upload: Method) {
        val old = upload.instructions()
        val now = drafts.method.instructions()
        val gate = now.subList(drafts.index, drafts.index + 3)
        assertEquals("$build: draft gate", listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT, Opcode.IF_NEZ), gate.map { it.opcode })
        assertEquals("$build: draft gate method", "$LOCAL_DRAFTS->keepOnPhone(Ljava/lang/Object;)Z", gate[0].reference())
        val send = now[drafts.index + 3]
        assertEquals("$build: the send follows the gate", SEND_REQUEST, send.reference())
        assertEquals("$build: the gate reads the request the send takes",
            (send as FiveRegisterInstruction).registerD, (gate[0] as RegisterRangeInstruction).startRegister)
        assertEquals("$build: one register for the request", 1, (gate[0] as RegisterRangeInstruction).registerCount)
        assertEquals("$build: the upload keeps every original operation", old.map(::operation),
            now.filterIndexed { index, _ -> index !in drafts.index until drafts.index + 3 }.map(::operation))
        val flow = ControlFlow.of(drafts.method)
        assertEquals("$build: no sends, yes goes past the send only", setOf(drafts.index + 3, drafts.index + 4),
            flow.normal[drafts.index + 2].toSet())
        assertFalse("$build: the send is reached without the gate", drafts.index + 3 in reachable(flow, 0, drafts.index))
        val local = old.indices.filter { old[it].call()?.let { call -> call.origDefiningClass == upload.origDefiningClass && call.origName == "saveDraft" &&
            call.parameterTypes.map(CharSequence::toString).contains("Lorg/telegram/tgnet/TLRPC\$DraftMessage;") } == true }
        assertEquals("$build: one save on the phone", 1, local.size)
        assertFalse("$build: the gate is reached without the save on the phone", drafts.index in reachable(ControlFlow.of(upload), 0, local.single()))
        val reader = context.tgMutableClassDefBy(LOCAL_DRAFTS).methods.single { it.origName == "carries" }
        val read = reader.instructions()
        assertEquals("$build: reader registers", 2, reader.implementation!!.registerCount)
        assertEquals("$build: reader casts the request", Opcode.CHECK_CAST to SAVE_DRAFT, operation(read[0]))
        assertEquals("$build: reader looks at every content field, then the flags",
            DRAFT_CONTENT.keys.toList() + "flags",
            read.mapNotNull { ((it as? ReferenceInstruction)?.reference as? FieldReference)?.takeIf { field -> field.origDefiningClass == SAVE_DRAFT }?.name })
        val mask = read.single { it.opcode == Opcode.AND_INT_LIT16 } as NarrowLiteralInstruction
        assertEquals("$build: reader masks the effect flag", DRAFT_EFFECT_FLAG, mask.narrowLiteral)
        assertEquals("$build: reader answers no once and yes once", listOf(0, 1),
            read.filter { it.opcode == Opcode.CONST_4 }.map { (it as NarrowLiteralInstruction).narrowLiteral })
        assertEquals("$build: a reply counts when it's to a message", listOf("$INPUT_REPLY_TO->reply_to_msg_id:I"),
            read.mapNotNull { it.reference() }.filter { it.startsWith(INPUT_REPLY_TO) })

        val emptier = context.tgMutableClassDefBy(LOCAL_DRAFTS).methods.single { it.origName == "clear" }
        val empty = emptier.instructions()
        assertEquals("$build: emptier registers", 3, emptier.implementation!!.registerCount)
        assertEquals("$build: emptier casts the request", Opcode.CHECK_CAST to SAVE_DRAFT, operation(empty[0]))
        val written = empty.filter { it.opcode in setOf(Opcode.IPUT, Opcode.IPUT_WIDE, Opcode.IPUT_OBJECT) }
            .mapNotNull { ((it as ReferenceInstruction).reference as FieldReference).takeIf { field -> field.origDefiningClass == SAVE_DRAFT }?.name }
        assertEquals("$build: every content field, the flags and the effect are emptied, and nothing else",
            (DRAFT_CONTENT.keys + listOf("flags", "effect")).toSet(), written.toSet())
        assertTrue("$build: the chat and the two switches stay", written.none { it in setOf("peer", "no_webpage", "invert_media") })
        val emptyMask = empty.single { it.opcode == Opcode.AND_INT_LIT16 } as NarrowLiteralInstruction
        assertEquals("$build: the effect and media bits go, every other flag stays",
            (DRAFT_EFFECT_FLAG or DRAFT_MEDIA_FLAG).inv(), emptyMask.narrowLiteral)
        assertEquals("$build: the text is empty, not missing", "", empty.firstNotNullOf { (((it as? ReferenceInstruction)?.reference) as? StringReference)?.string })
        assertEquals("$build: a direct messages draft keeps the person's chat it's for", listOf(MONO_FORUM_REPLY, "$MONO_FORUM_REPLY-><init>()V"),
            empty.filter { it.opcode == Opcode.NEW_INSTANCE || it.opcode == Opcode.INVOKE_DIRECT }.map { it.reference() })
        assertEquals("$build: the emptier answers yes", listOf(Opcode.CONST_4, Opcode.RETURN), empty.takeLast(2).map { it.opcode })
        assertEquals(1, (empty[empty.size - 2] as NarrowLiteralInstruction).narrowLiteral)
    }

    @Test
    fun `changed draft upload geometry refuses before any partial mutation`() {
        for (build in Fixtures.declaredBuilds()) {
            for (change in listOf("new request field", "second upload", "request overwritten", "effect flag", "send answer read",
                    "reply id gone", "second emptier")) {
                val context = contextFor(build)
                val hooks = context.resolveDraftPreviewHooks()
                val drafts = context.resolveLocalDraftHook()
                val body = drafts.method.instructions()
                val held = (body[drafts.index] as FiveRegisterInstruction).registerD
                when (change) {
                    // A field Telegram adds could be content the reader doesn't look at.
                    "new request field" -> context.tgMutableClassDefBy(SAVE_DRAFT).fields.add(
                        ImmutableField(SAVE_DRAFT, "todo", "Lorg/telegram/tgnet/TLRPC\$InputMedia;", AccessFlags.PUBLIC.value, null, null, null).toMutable())
                    "second upload" -> context.tgMutableClassDefBy(drafts.method.definingClass).methods.single { it.origName == "cleanDraft" }
                        .addInstructions(0, "new-instance v0, $SAVE_DRAFT")
                    "request overwritten" -> drafts.method.addInstructions(drafts.index, "const/4 v$held, 0x0")
                    // The request's own flag, two after its effect: the local draft sets the same bit earlier on.
                    "effect flag" -> {
                        val flag = body.indexOfFirst { it.opcode == Opcode.IPUT_WIDE && it.reference() == "$SAVE_DRAFT->effect:J" } + 2
                        assertEquals(DRAFT_EFFECT_FLAG, (body[flag] as NarrowLiteralInstruction).narrowLiteral)
                        val register = (body[flag] as TwoRegisterInstruction).registerA
                        drafts.method.replaceInstruction(flag, "or-int/lit16 v$register, v$register, 0x40")
                    }
                    // Without it the reader can't tell a reply from a direct messages target.
                    "reply id gone" -> context.tgMutableClassDefBy(INPUT_REPLY_TO).fields.removeIf { it.origName == "reply_to_msg_id" }
                    // A second stub of the name could be the one a stub write picks.
                    "second emptier" -> context.tgMutableClassDefBy(LOCAL_DRAFTS).methods.add(ImmutableMethod(LOCAL_DRAFTS, "clear",
                        listOf(ImmutableMethodParameter("I", null, null)), "Z", AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
                        ImmutableMethodImplementation(1, listOf(ImmutableInstruction11n(Opcode.CONST_4, 0, 0), ImmutableInstruction11x(Opcode.RETURN, 0)),
                            null, null)).toMutable())
                    else -> drafts.method.replaceInstruction(drafts.finish, "move-result v$held")
                }
                assertRefusedUntouched(build.name, change, context, hooks)
            }
        }
    }

    @Test
    fun `the census has five compose builders, Browser and the received-preview refresh`() {
        for (build in Fixtures.declaredBuilds()) {
            val builders = FixtureDex.methodsWhere(build, { true }) { it.constructs(WEB_PAGE_PREVIEW) }
            assertEquals("${build.name}: every preview request builder", 7, builders.size)
            assertEquals("${build.name}: received previews refresh", 1, builders.count {
                it.origDefiningClass == "Lorg/telegram/messenger/MessagesController;" && it.origName == "reloadWebPages" })
            assertEquals("${build.name}: Browser opens a tapped link", 1, builders.count {
                it.parameterTypes.take(2).map(CharSequence::toString) == listOf("Landroid/content/Context;", "Landroid/net/Uri;") })
        }
    }

    @Test
    fun `the story request runs only from the runnable its URL check posts`() {
        for (build in Fixtures.declaredBuilds()) {
            val story = FixtureDex.methodsWhere(build, { true }) { it.constructs(WEB_PAGE_PREVIEW) && it.storySheet() != null }.single()
            val sheet = story.storySheet()!!
            // 13.2 makes the request in the runnable itself, where 13.1.1 has the runnable call a static builder.
            val runnable = if (story.name == "run") story.definingClass else {
                val callers = FixtureDex.methodsWhere(build, { true }) { method -> method.instructions().any { it.call()?.let { call ->
                    call.origDefiningClass == story.origDefiningClass && call.origName == story.origName } == true } }
                assertEquals("${build.name}: only a run() calls the story request", "run", callers.single().name)
                callers.single().definingClass
            }
            val check = FixtureDex.methodsWhere(build, { true }) { method -> method.definingClass == sheet &&
                method.parameterTypes.map(CharSequence::toString) == listOf(sheet, "Ljava/lang/String;") &&
                method.instructions().any { it.call()?.origName == "cancelRunOnUIThread" } }.single()
            val field = check.instructions().map { (it as? ReferenceInstruction)?.reference }.filterIsInstance<FieldReference>()
                .single { it.origType == runnable }
            val readers = FixtureDex.methodsWhere(build, { true }) { method -> method.instructions().any { it.opcode == Opcode.IGET_OBJECT &&
                (it as ReferenceInstruction).reference.let { read -> read is FieldReference && read.origDefiningClass == field.origDefiningClass &&
                    read.origName == field.origName } } }
            assertEquals("${build.name}: only the URL check reads the runnable it posts", listOf(check.name),
                readers.map { it.name })
        }
    }

    @Test
    fun `changed builder geometry refuses every target before any partial mutation`() {
        for (build in Fixtures.declaredBuilds()) {
            for (changed in DraftPreviewTarget.entries) {
                val context = contextFor(build)
                val hooks = context.resolveDraftPreviewHooks()
                val invalid = hooks.getValue(changed)
                invalid.method.replaceInstruction(if (changed == DraftPreviewTarget.STORY) invalid.index - 1 else invalid.finish, "nop")
                assertRefusedUntouched(build.name, "changed $changed", context, hooks)
            }
            // A new compose surface building the request is caught, not left ungated.
            val context = contextFor(build)
            val hooks = context.resolveDraftPreviewHooks()
            val bot = hooks.getValue(DraftPreviewTarget.BOT_SHARE).method.instructions()
            val callback = bot.subList(0, hooks.getValue(DraftPreviewTarget.BOT_SHARE).index).last { it.opcode == Opcode.NEW_INSTANCE }.reference()!!
            val owner = context.tgMutableClassDefBy(callback)
            // 13.2 names the callback's run as its interface's.
            owner.methods.single { m -> m.parameterTypes.map { it.toString() } == listOf("Ljava/lang/Object;") && m.returnType == "V" &&
                (m.origName == "run" || owner.origInterfaces.any { face ->
                    context.tgMutableClassDefByOrNull(face)?.methods?.any { it.origName == "run" && it.name == m.name } == true })
            }.addInstructions(0, "new-instance v0, $WEB_PAGE_PREVIEW")
            assertRefusedUntouched(build.name, "unknown builder", context, hooks)
        }
    }

    /** @return what the refusal said */
    private fun assertRefusedUntouched(build: String, case: String, context: BytecodePatchContext, hooks: Map<DraftPreviewTarget, DraftPreviewHook>): String {
        val before = hooks.mapValues { it.value.method.instructions().map(::operation) }
        val uploads = listOf(MEDIA_DATA, LOCAL_DRAFTS).associateWith { owner -> methodOperations(context, owner) }
        var refusal = ""
        try {
            disableDraftPreviewsPatch.execute(context)
            fail("$build: $case was accepted")
        } catch (expected: PatchException) {
            refusal = expected.message.orEmpty()
            assertTrue("$build: $case: $refusal", refusal.contains("before editing"))
        }
        for ((target, hook) in hooks) assertEquals("$build: $case doesn't partly mutate $target",
            before.getValue(target), hook.method.instructions().map(::operation))
        for ((owner, operations) in uploads) assertEquals("$build: $case doesn't partly mutate $owner",
            operations, methodOperations(context, owner))
        for (flag in FLAGS) {
            val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == flag }.instructions()
            assertEquals("$build: $case leaves $flag false", 0, (status[0] as NarrowLiteralInstruction).narrowLiteral)
        }
        return refusal
    }

    /** Chat search rides in this patch, so a change to it refuses the whole patch, drafts and previews included. */
    @Test
    fun `changed chat search geometry refuses before any partial mutation`() {
        for (build in Fixtures.declaredBuilds()) {
            val hosts = localSearchHosts(build).map { it.type }
            for ((change, reason) in SEARCH_CHANGES) {
                val context = contextFor(build)
                val hooks = context.resolveDraftPreviewHooks()
                changeSearch(change, context.resolveLocalSearch())
                val before = hosts.associateWith { methodOperations(context, it) }
                val refusal = assertRefusedUntouched(build.name, change, context, hooks)
                assertTrue("${build.name}: $change refused for its own reason: $refusal", refusal.contains(reason))
                for ((host, operations) in before) assertEquals("${build.name}: $change doesn't partly mutate $host",
                    operations, methodOperations(context, host))
            }
        }
    }

    private fun methodOperations(context: BytecodePatchContext, owner: String) =
        context.tgMutableClassDefBy(owner).methods.associate { it.toString() to it.instructions().map(::operation) }

    /**
     * Builder classes plus every class their builders and URL checks construct or read, so callbacks
     * and runnables resolve, the draft upload's class with the request it builds, and chat search.
     */
    private fun contextFor(build: java.io.File): BytecodePatchContext {
        val owners = (FixtureDex.classesWhere(build, { true }) { it.constructs(WEB_PAGE_PREVIEW) } +
            FixtureDex.classesWhere(build, { true }) { it.constructs(SAVE_DRAFT) }).distinctBy(ClassDef::getType)
        val helpers = owners.flatMap { owner -> owner.methods.filter { method -> method.constructs(WEB_PAGE_PREVIEW) ||
            method.instructions().any { it.call()?.origName == "cancelRunOnUIThread" } } }
            .flatMap { method -> method.instructions().mapNotNull { instruction -> when {
                instruction.opcode == Opcode.NEW_INSTANCE -> instruction.reference()
                instruction.opcode == Opcode.IGET_OBJECT -> ((instruction as ReferenceInstruction).reference as FieldReference).type
                else -> null
            } } }
            .filter { it.startsWith("L") && it !in owners.map(ClassDef::getType) }.toSet()
        val helperClasses = FixtureDex.classes(build, helpers + SAVE_DRAFT + INPUT_REPLY_TO + MONO_FORUM_REPLY).values
        // 13.2 names a callback's run as its interface's, so the interfaces come along.
        val faces = FixtureDex.classes(build, helperClasses.flatMap { it.origInterfaces }.filter { it.startsWith("Lorg/telegram/") }.toSet()).values
        return PatchContexts.of((ExtensionDex.classes() + owners + helperClasses + faces +
            localSearchHosts(build)).distinctBy(ClassDef::getType))
    }

    private fun BytecodePatchContext.excludedBuilders(): List<Method> {
        val found = mutableListOf<Method>()
        classDefForEach { classDef -> classDef.methods.filterTo(found) { method -> method.constructs(WEB_PAGE_PREVIEW) &&
            (method.origName == "reloadWebPages" || method.parameterTypes.take(2).map(CharSequence::toString) ==
                listOf("Landroid/content/Context;", "Landroid/net/Uri;")) } }
        assertEquals("both left-alone builders are in the context", 2, found.size)
        return found.map { ImmutableMethod.of(it) }
    }

    private fun requestOf(target: DraftPreviewTarget, method: Method): Int {
        val body = method.instructions()
        return if (target == DraftPreviewTarget.STORY) body.indexOfFirst { it.call()?.let { call ->
            call.origName == "runOnUIThread" && call.parameterTypes.size == 2 } == true }
        else body.indexOfFirst { it.opcode == Opcode.NEW_INSTANCE && it.reference() == WEB_PAGE_PREVIEW }
    }

    private fun reachable(flow: ControlFlow, from: Int, blocked: Int): Set<Int> {
        val found = mutableSetOf<Int>()
        val pending = ArrayDeque<Int>()
        pending.add(from)
        while (pending.isNotEmpty()) {
            val index = pending.removeFirst()
            if (index == blocked || !found.add(index)) continue
            pending.addAll(flow.normal[index])
            pending.addAll(flow.exceptional[index])
        }
        return found
    }
    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
    private fun List<Instruction>.isPadding(index: Int) = this[index].opcode == Opcode.NOP && getOrNull(index + 1)?.opcode in
        setOf(Opcode.PACKED_SWITCH_PAYLOAD, Opcode.SPARSE_SWITCH_PAYLOAD, Opcode.ARRAY_PAYLOAD)
    private fun Method.constructs(type: String) = instructions().any { it.opcode == Opcode.NEW_INSTANCE && it.reference() == type }
    private fun Instruction.reference() = origRef()
    private fun Instruction.call(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference
    private fun operation(instruction: Instruction) = instruction.opcode to instruction.reference()
    private fun Method.sameSignature(other: Method) = name == other.name && returnType == other.returnType &&
        parameterTypes.map { it.toString() } == other.parameterTypes.map { it.toString() }
}
