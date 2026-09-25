package app.onlynazril.patches.tiktok.handle

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.getReference
import app.morphe.util.implementationOrPatchException
import app.morphe.util.numberOfParameterRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import app.onlynazril.patches.shared.Constants.COMPATIBILITY_TIKTOK
import app.onlynazril.patches.tiktok.handle.settings.settingsPatch

private const val HANDLE_DELEGATE = "Lapp/onlynazril/extension/tiktokHandle/HandleDelegate;"
private const val BIND_BRIDGE = "Lapp/onlynazril/extension/tiktokHandle/BindBridge;"
private const val APP_CONTEXT = "Lapp/onlynazril/extension/tiktokHandle/internal/AppContext;"
private const val AUTHOR_INFO_BRIDGE = "Lapp/onlynazril/extension/tiktokHandle/AuthorInfoBridge;"
private const val COMMENT_DATE_BRIDGE = "Lapp/onlynazril/extension/tiktokHandle/CommentDateBridge;"
private const val COMMENT_MODEL = "Lcom/ss/android/ugc/aweme/comment/model/Comment;"
private const val TEXT_VIEW = "Landroid/widget/TextView;"

/**
 * Runs `body` at the method's first instruction with the first [count] parameters in v0, v1, …
 *
 * `move-object/from16` covers parameters above v15, and those locals are free at the first
 * instruction: parameters live in the last registers and a local cannot be read before it is
 * written. The error is explicit when the method has too few locals to borrow.
 */
private fun MutableMethod.injectWithParameters(count: Int, body: String) {
    val implementation = implementationOrPatchException("Handle")
    if (implementation.registerCount - numberOfParameterRegisters < count) {
        throw PatchException(
            "Handle: ${definingClass}->${name} has no room for $count borrowed locals.",
        )
    }
    val moves = (0 until count).joinToString("\n") { "move-object/from16 v$it, p${it + 1}" }
    addInstructions(
        0,
        """
            $moves
            $body
        """.trimIndent(),
    )
}

/** Same, for the instance itself (`this` in v0). */
private fun MutableMethod.injectWithThis(body: String) {
    val registers = implementationOrPatchException("Handle").registerCount
    if (registers <= numberOfParameterRegisters) {
        throw PatchException(
            "Handle: ${definingClass}->${name} has no local register to borrow for an injection.",
        )
    }
    addInstructions(
        0,
        """
            move-object/from16 v0, p0
            $body
        """.trimIndent(),
    )
}

/** Same, with `this` in v0 and the first parameter in v1. */
private fun MutableMethod.injectWithThisAndFirst(body: String) {
    val implementation = implementationOrPatchException("Handle")
    if (implementation.registerCount - numberOfParameterRegisters < 1) {
        throw PatchException(
            "Handle: ${definingClass}->${name} has no room to borrow a local for the parameter.",
        )
    }
    addInstructions(
        0,
        """
            move-object/from16 v0, p0
            move-object/from16 v1, p1
            $body
        """.trimIndent(),
    )
}

/**
 * Runs [body] just before every return of the method, with `this` in v0 and the first parameter
 * in v1.
 *
 * Used where the work has to happen *after* the method's own writes but still inside the call:
 * deferring to the next message instead lets a recycled view be rebound in between, which mixes
 * one video's region and age into another's header. At a return nothing reads those registers
 * again, so borrowing them is safe.
 */
private fun MutableMethod.injectBeforeReturns(body: String) {
    val implementation = implementationOrPatchException("Handle")
    if (implementation.registerCount - numberOfParameterRegisters < 1) {
        throw PatchException(
            "Handle: ${definingClass}->${name} has no room to borrow a local for the parameter.",
        )
    }
    val returns = implementation.instructions
        .withIndex()
        .filter { it.value.opcode == Opcode.RETURN_VOID }
        .map { it.index }
    if (returns.isEmpty()) {
        throw PatchException("Handle: ${definingClass}->${name} has no return-void to hook.")
    }
    // Highest index first: inserting shifts everything after it.
    for (index in returns.reversed()) {
        addInstructions(
            index,
            """
                move-object/from16 v0, p0
                move-object/from16 v1, p1
                $body
            """.trimIndent(),
        )
    }
}

/**
 * Feed-only, always-on, zero-flicker handle patch.
 *
 * - Top video immun: hooks User.getNickname() (not list distribution), so
 *   cold-cache SPUT_OBJECT FeedItemList (FeedFilterPatch.kt:336) is irrelevant.
 *   No field mutation → no cache pollution.
 * - Zero flicker: ThreadLocal stash in VideoAuthorInfoVM.paramSync2StateAccept
 *   ensures the first bind already returns "@handle · CC". Backstop not needed
 *   for handle, but kept via same bridge for field-direct setText bypass.
 */
@Suppress("unused")
val tiktokHandlePatch = bytecodePatch(
    name = "Always @handle · region · post time",
    description = "Shows the @handle, the region and the post time on feed videos and comments, " +
        "including a video shared into a chat. Each surface and each part has a switch in Tweaks.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TIKTOK)

    extendWith("extensions/tiktokHandle.mpe")

    execute {
        // Feed bridge: hands the binder's own VideoItemParams (p2) over, so the region is read
        // from the item being rendered instead of from a ThreadLocal another thread may have set.
        VideoAuthorInfoVMBinderFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p2}, $BIND_BRIDGE->onBind(Ljava/lang/Object;)V
            """.trimIndent(),
        )

        // Capture Aweme region for CC — DexKit verified 47.0.3 Aweme.getRegion real-named, 2 regs
        AwemeGetRegionFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v0, p0
                invoke-static {v0}, $BIND_BRIDGE->captureAwemeRegionFromAweme(Ljava/lang/Object;)V
            """.trimIndent(),
        )

        // Comments and the DM tag are detected from the class on the stack, not from a hook on
        // the method that renders the name: that method is obfuscated and is not the one the
        // surface can be recognised by (getNickname is called from Y5/onBindItemView on 47.0.3,
        // not from the author helper).

        // The header's root view is taken once per component, and every bind re-applies the post
        // time and the region to its time view. The component's own text setter is not the write
        // path on 47.0.3, and the time view is only reachable by id.
        AuthorInfoViewFingerprint.method.injectWithThisAndFirst(
            "invoke-static {v0, v1}, $AUTHOR_INFO_BRIDGE" +
                "->onHeaderView(Ljava/lang/Object;Landroid/view/View;)V",
        )
        // The per-item renderer hands over the item it is rendering, and the write happens at its
        // returns: after TikTok has set the header's text, still inside the call, so a recycled
        // view cannot be rebound underneath it.
        AuthorInfoItemFingerprint.method.injectBeforeReturns(
            "invoke-static {v0, v1}, $AUTHOR_INFO_BRIDGE" +
                "->onHeaderItem(Ljava/lang/Object;Ljava/lang/Object;)V",
        )

        // A comment's region goes on the comment's own time view, the way the feed's goes on the
        // post time: that view is already dimmer than the name and sits clear of it, so the region
        // reads as metadata instead of as part of the username, and it stays out of the way of the
        // verified badge that follows the name — TikTok's view, and not reorderable from here.
        //
        // Both registers come from the method itself: the comment, from the receiver of the create
        // time read, and the view, from the write that follows it. The bridge reads the region off
        // the comment rather than off the name on screen, because the time is written before the
        // name is.
        CommentListDateFingerprint.method.apply {
            val instructions = implementationOrPatchException("Comment").instructions.toList()
            fun firstInvokeAfter(from: Int, matches: (MethodReference) -> Boolean): Int? =
                instructions.withIndex().firstOrNull { (index, instruction) ->
                    index > from &&
                        instruction.getReference<MethodReference>()?.let(matches) == true
                }?.index

            val timeIndices = instructions.withIndex()
                .filter { (_, instruction) ->
                    instruction.getReference<MethodReference>()?.let {
                        it.definingClass == COMMENT_MODEL && it.name == "getCreateTime"
                    } == true
                }
                .map { it.index }
            if (timeIndices.isEmpty()) {
                throw PatchException(
                    "Comment: ${definingClass}->${name} reads no comment create time.",
                )
            }

            val sites = timeIndices.mapNotNull { timeIndex ->
                val writeIndex = firstInvokeAfter(timeIndex) {
                    it.definingClass == TEXT_VIEW && it.name == "setText"
                } ?: return@mapNotNull null
                val read = instructions[timeIndex] as? Instruction35c
                    ?: throw PatchException(
                        "Comment: the create time read in ${definingClass}->${name} does not name " +
                            "its comment in four bits.",
                    )
                val write = instructions[writeIndex] as? Instruction35c
                    ?: throw PatchException(
                        "Comment: a time write in ${definingClass}->${name} does not name its view " +
                            "in four bits, so the view cannot be handed over.",
                    )
                val comment = read.registerC
                // Both are handed over together after the write, so the comment has to still be in
                // that register by then. A build that reuses it in between fails here.
                for (index in (timeIndex + 1) until writeIndex) {
                    val instruction = instructions[index]
                    if (instruction.opcode.setsRegister() &&
                        (instruction as? OneRegisterInstruction)?.registerA == comment
                    ) {
                        throw PatchException(
                            "Comment: ${definingClass}->${name} reuses v$comment between reading " +
                                "the create time and writing the time.",
                        )
                    }
                }
                Triple(writeIndex, comment, write.registerC)
            }
            if (sites.isEmpty()) {
                throw PatchException(
                    "Comment: ${definingClass}->${name} writes no text after a create time.",
                )
            }
            // Highest first: inserting shifts every index above it.
            for ((writeIndex, comment, view) in sites.sortedByDescending { it.first }) {
                addInstructions(
                    writeIndex + 1,
                    "invoke-static {v$comment, v$view}, $COMMENT_DATE_BRIDGE" +
                        "->attach(Ljava/lang/Object;Landroid/widget/TextView;)V",
                )
            }
        }

        // The application context is stashed at process start. Without it the extension cannot
        // read its preferences, so every switch other than the feed would fall back to its
        // default — which is exactly "the toggle is on but nothing happens".
        ApplicationOnCreateFingerprint.method.injectWithThis(
            "invoke-static {v0}, $APP_CONTEXT->set(Landroid/content/Context;)V",
        )

        // Primary: override User.getNickname() to return "@handle" / "@handle · CC"
        UserGetNicknameFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p0}, $HANDLE_DELEGATE->getDisplayName(Ljava/lang/Object;)Ljava/lang/String;
                move-result-object v0
                if-eqz v0, :no_override
                return-object v0
                :no_override
                nop
            """.trimIndent(),
        )
    }
}
