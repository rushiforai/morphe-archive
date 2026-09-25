package app.onlynazril.patches.tiktok.handle

import app.morphe.patcher.Fingerprint
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

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
 * Binder bridge: FeedBaseViewModel.paramSync2StateAccept(LX/06iX, VideoItemParams)
 * Verified in 47.0.3 dexdump: VideoAuthorInfoVM inherits from FeedBaseViewModel,
 * the real bind entry is the base class with 2 params (p1=state, p2=VideoItemParams).
 * Hooking the base covers all feed assems including VideoAuthorInfoVM.
 */
object VideoAuthorInfoVMBinderFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/feed/assem/base/FeedBaseViewModel;",
    custom = { method, _ ->
        method.name == "paramSync2StateAccept" &&
            method.parameterTypes.size == 2 &&
            method.parameterTypes[1].toString().contains("VideoItemParams") &&
            method.implementation != null &&
            (method.implementation?.registerCount ?: 99) < 16
    },
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
 * neighbouring video once the feed starts prefetching, which is what made the For You feed show
 * another video's region and age while search and DM (no prefetch) looked right.
 */
object AuthorInfoItemFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/feed/assem/videoauthorinfo/VideoAuthorInfoRelationAssem;",
    returnType = "V",
    custom = { method, classDef ->
        method.parameterTypes == listOf(ITEM) &&
            method.implementation?.instructions?.any { instruction ->
                if (instruction.opcode != Opcode.INVOKE_VIRTUAL) return@any false
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    ?: return@any false
                reference.definingClass == classDef.type &&
                    reference.returnType == "V" &&
                    reference.parameterTypes == listOf(ITEM)
            } == true
    },
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

private const val USER_MODEL = "Lcom/ss/android/ugc/aweme/profile/model/User;"
private const val COMMENT_MODEL = "Lcom/ss/android/ugc/aweme/comment/model/Comment;"
private const val TEXT_VIEW = "Landroid/widget/TextView;"

private const val ITEM = "Lcom/ss/android/ugc/aweme/feed/model/Aweme;"

/**
 * The process's Application. Real-named (`AwemeHostApplication`) and read straight from the
 * manifest, so it is the earliest reliable place to hand the extension a Context.
 */
object ApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/app/host/AwemeHostApplication;",
    name = "onCreate",
    returnType = "V",
    parameters = emptyList(),
)

/**
 * Backstop hook is intentionally implemented via the same VideoAuthorInfoVM
 * binder (no separate TextView fingerprint needed for zero-flicker). If a
 * future build bypasses getNickname via direct iget, add a TextView.setText
 * fingerprint here. Kept minimal for feed-only stability.
 */
