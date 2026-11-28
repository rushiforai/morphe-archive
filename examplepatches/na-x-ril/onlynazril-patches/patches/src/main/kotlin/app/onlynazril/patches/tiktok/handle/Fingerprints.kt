package app.onlynazril.patches.tiktok.handle

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Feed-only zero-flicker handle patch fingerprints for TikTok 47.0.3.
 *
 * Verified against real APK 47.0.3: User model and VideoAuthorInfoVM keep
 * their real names (DexKit string scan found User descriptor + getNickname
 * in same dex, VideoAuthorInfoVM + paramSync2StateAccept co-located).
 */

/** Primary hook: User.getNickname()Ljava/lang/String; — always returns "@handle · CC" */
object UserGetNicknameFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/profile/model/User;",
    name = "getNickname",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
)

/**
 * Binder bridge: FeedBaseViewModel.paramSync2StateAccept(state, VideoItemParams)
 * Verified in 47.0.3 dexdump: VideoAuthorInfoVM inherits from FeedBaseViewModel,
 * the real bind entry is the base class with 2 params (p1=state, p2=VideoItemParams).
 * Hooking the base covers all feed assems including VideoAuthorInfoVM.
 *
 * The state type renames with every build (`X.08Ee` on 47.7.1, `X.04rr` on 47.9.1), so it is
 * matched as any reference type; the real-named parameter and the return shape are what pin the
 * overload. The name is unique in the class on 47.7.1 through 47.9.1.
 */
object VideoAuthorInfoVMBinderFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/feed/assem/base/FeedBaseViewModel;",
    name = "paramSync2StateAccept",
    returnType = "L",
    parameters = listOf("L", "Lcom/ss/android/ugc/aweme/feed/model/VideoItemParams;"),
    custom = { method, _ -> method.implementation != null },
)

/** Aweme region capture for CC — DexKit verified: Aweme.getRegion() real-named, 2 regs, safe */
object AwemeGetRegionFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/feed/model/Aweme;",
    name = "getRegion",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
)

/**
 * The author-info component's view creation — the root view of the header.
 *
 * Its own text setter (`rs`) is *not* the write path on 47.0.3: the smali shows no call to it from
 * inside the class, and the post-time view is reached by id (`tv_post_time`). So the view is taken
 * here, once per component, and each bind re-applies to it.
 */
object AuthorInfoViewFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/feed/assem/videoauthorinfo/VideoAuthorInfoRelationAssem;",
    name = "onViewCreated",
    returnType = "V",
    parameters = listOf("Landroid/view/View;"),
)

/**
 * The header's per-item renderer: the `(Aweme) -> V` method that calls the author-line renderer.
 *
 * Three methods in the class take an Aweme and return void (`cs`, `ts`, `ys` on 47.0.3). Only this
 * one calls another `(Aweme) -> V` method on itself — `ts` calls a no-argument method and `cs`
 * calls one returning an int — so the call it makes is the anchor, not its obfuscated name.
 *
 * This is where the item is taken from: reading "the component's current item" returns the
 * neighboring video once the feed starts prefetching, which is what made the For You feed show
 * another video's region and age while search and DM (no prefetch) looked right.
 */
object AuthorInfoItemFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/feed/assem/videoauthorinfo/VideoAuthorInfoRelationAssem;",
    returnType = "V",
    parameters = listOf(ITEM),
    filters = listOf(
        methodCall(
            definingClass = "this",
            returnType = "V",
            parameters = listOf(ITEM),
            opcode = Opcode.INVOKE_VIRTUAL,
        ),
    ),
)

/**
 * The comment list's per-item bind: the method that fills a comment's time.
 *
 * This is the cell the comment list renders with on 47.0.3: `BaseCommentCell`, reached as
 * `...powercell.CommentSecondaryItemCell#onBindItemView -> BaseCommentCell#W6`, with the name built
 * in `R5` and the time written here. A device log is what named this chain — the frames of a name
 * render — and it is also what showed the region never moving while the hook pointed at the
 * `now.interaction` cell, which this list does not use.
 *
 * Matched structurally, on the calls and not on the method's name — the method here is obfuscated
 * (`G8` on 47.0.3) and has two time writes, in two branches.
 */
object CommentListDateFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/commentv2/commentlist/powercell/BaseCommentCell;",
    returnType = "V",
    custom = { method, _ ->
        val references = method.implementation?.instructions?.mapNotNull {
            it.getReference<MethodReference>()
        } ?: emptyList()
        references.any { it.definingClass == COMMENT_MODEL && it.name == "getCreateTime" } &&
            references.any { it.definingClass == TEXT_VIEW && it.name == "setText" }
    },
)

/**
 * The poll row's own date write: `(PollInfo) -> void` reads the poll's `createTime` and hands the
 * formatted string to a `TextView`. The row is real-named; the method name is obfuscated and moves
 * (`H6` on 47.9.1, `Z6` on 47.7.1), so the two calls are the anchor.
 */
object PollDateFingerprint : Fingerprint(
    definingClass = POLL_CELL,
    returnType = "V",
    parameters = listOf(POLL_INFO),
    custom = { method, _ ->
        val instructions = method.implementation?.instructions ?: emptyList()
        val readsCreateTime = instructions.any { instruction ->
            instruction.opcode == Opcode.IGET_OBJECT &&
                instruction.getReference<FieldReference>()?.let {
                    it.definingClass == POLL_INFO && it.name == "createTime"
                } == true
        }
        val writesText = instructions.any { instruction ->
            instruction.getReference<MethodReference>()?.let {
                it.definingClass == TEXT_VIEW && it.name == "setText"
            } == true
        }
        readsCreateTime && writesText
    },
)

/**
 * The feed cell's root touch dispatch. It owns the long-press speed-up gesture, so a touch that
 * started on the name has to be taken around it rather than merely consumed by the child.
 */
object VideoViewCellRootTouchFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/feed/VideoViewCellRootView;",
    name = "dispatchTouchEvent",
    returnType = "Z",
    parameters = listOf("Landroid/view/MotionEvent;"),
)

/**
 * The comment composer's mention insert: `(int, name, uid, secUid, tako) -> boolean`.
 *
 * The name it inserts is appended to a literal "@" by the method itself. `HandleDelegate` already
 * stamps names with their own "@", so the duplicate is dropped here before the app adds its one.
 * The signature is unique in the APK on 47.7.1 through 47.9.1; the class is obfuscated and is
 * therefore not part of the match.
 */
object CommentMentionFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(
        "I",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Z",
    ),
    custom = { method, _ ->
        val instructions = method.implementation?.instructions ?: emptyList()
        val prefixed = instructions.any { instruction ->
            (instruction.opcode == Opcode.CONST_STRING ||
                instruction.opcode == Opcode.CONST_STRING_JUMBO) &&
                instruction.getReference<StringReference>()?.string == "@"
        }
        val buildsSpan = instructions.any { instruction ->
            instruction.getReference<MethodReference>()?.let {
                it.definingClass == MENTION_SPAN && it.name == "<init>"
            } == true
        }
        prefixed && buildsSpan
    },
)

private const val MENTION_SPAN = "Lcom/ss/android/ugc/aweme/comment/widgets/MentionSpan;"

private const val USER_MODEL = "Lcom/ss/android/ugc/aweme/profile/model/User;"
private const val COMMENT_MODEL = "Lcom/ss/android/ugc/aweme/comment/model/Comment;"
private const val POLL_CELL =
    "Lcom/ss/android/ugc/aweme/commentv2/commentlist/powercell/PollCell;"
private const val POLL_INFO = "Lcom/ss/android/ugc/aweme/comment/model/PollInfo;"
private const val TEXT_VIEW = "Landroid/widget/TextView;"

private const val ITEM = "Lcom/ss/android/ugc/aweme/feed/model/Aweme;"

/**
 * Backstop hook is intentionally implemented via the same VideoAuthorInfoVM
 * binder (no separate TextView fingerprint needed for zero-flicker). If a
 * future build bypasses getNickname via direct iget, add a TextView.setText
 * fingerprint here. Kept minimal for feed-only stability.
 */

/**
 * The comment cell's bind: `BaseCommentCell#onBindItemView`, real-named in the app. Hooked only to
 * mark the surface for the duration of the bind, so the name renderer does not walk the stack for
 * every comment cell.
 */
object CommentCellBindFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/commentv2/commentlist/powercell/BaseCommentCell;",
    name = "onBindItemView",
    returnType = "V",
    custom = { method, _ -> method.implementation != null },
)
