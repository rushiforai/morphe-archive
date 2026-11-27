package dev.jkcarino.adobo.patches.reddit.layout.actions.download

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.jkcarino.adobo.patches.reddit.shared.LinkToStringFingerprint

internal const val EXTENSION_CLASS_DESCRIPTOR =
    "Ldev/jkcarino/extension/reddit/frontpage/DownloadActionButton;"

internal const val SHARE_GROUP_CLASSIC = 184120079
internal const val SHARE_GROUP_PLAIN = -1795292249
internal const val SHARE_GROUP_REFRESH = 475922991
internal const val FEED_FOOTER_GROUP = -1633490746

/**
 * Fingerprint for the Compose Action Bar container class (h30 in 2026.47.0).
 * Matches method via tag string "actionBar_vote_button_group".
 */
internal object ActionBarClassFingerprint : Fingerprint(
    filters = listOf(
        string("actionBar_vote_button_group")
    )
)

/**
 * Fingerprint for the Classic Action Bar Row layout method (h30.f).
 * Identifiable by Compose group key for Share button (184120079 / 0xaf9390f).
 */
internal object ActionBarClassicRowFingerprint : Fingerprint(
    classFingerprint = ActionBarClassFingerprint,
    returnType = "V",
    filters = listOf(
        literal(SHARE_GROUP_CLASSIC)
    )
)

/**
 * Fingerprint for the Plain Action Bar Row layout method (h30.d).
 * Identifiable by Compose group key for Share button (-1795292249 / 0x94fdfb97).
 */
internal object ActionBarPlainRowFingerprint : Fingerprint(
    classFingerprint = ActionBarClassFingerprint,
    returnType = "V",
    filters = listOf(
        literal(SHARE_GROUP_PLAIN)
    )
)

/**
 * Fingerprint for the Refresh Action Bar Row layout method (h30.q).
 * Identifiable by Compose group key for Share button (475922991 / 0x1c5dce2f).
 */
internal object ActionBarRefreshRowFingerprint : Fingerprint(
    classFingerprint = ActionBarClassFingerprint,
    returnType = "V",
    filters = listOf(
        literal(SHARE_GROUP_REFRESH)
    )
)

/**
 * Fingerprint for PostActionBarModel mapper (so30.b).
 * Identifiable by string resource pdp_action_bar_vote_upvoted_description (2131959352 / 0x7f131e38).
 */
internal object PostActionBarModelFingerprint : Fingerprint(
    returnType = "L",
    filters = listOf(
        literal(2131959352)
    ),
    custom = { method, _ ->
        !AccessFlags.STATIC.isSet(method.accessFlags) &&
            method.parameterTypes.isNotEmpty() &&
            method.parameterTypes[0].toString().let { it.startsWith("L") || it.startsWith("[") }
    }
)

/**
 * Fingerprint for Action Bar post dispatcher (ttd0.a).
 * Identifiable by string resource action_repost_on_reddit (2131952090 / 0x7f1301da).
 */
internal object PostActionBarDispatchFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        literal(2131952090)
    ),
    custom = { method, _ ->
        AccessFlags.STATIC.isSet(method.accessFlags) &&
            method.parameterTypes.isNotEmpty() &&
            method.parameterTypes[0].toString().startsWith("L")
    }
)

// --- Native Download Handlers ---

/**
 * Fingerprint for native LightboxScreen download handler (LightboxScreen.M5).
 */
internal object LightboxDownloadFingerprint : Fingerprint(
    definingClass = "Lcom/reddit/frontpage/presentation/detail/LightboxScreen;",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        string("shareCardDialogNavigator"),
        methodCall(
            parameters = listOf(
                "Ljava/lang/String;",
                "Z",
                "Lcom/reddit/domain/model/Link;",
                "Ljava/lang/Integer;",
                "Ljava/lang/Integer;"
            ),
            returnType = "V"
        )
    ),
    custom = { method, _ ->
        !AccessFlags.STATIC.isSet(method.accessFlags)
    }
)

/**
 * Fingerprint for native VideoPlayerScreen download handler (VideoPlayerScreen.N5).
 */
internal object VideoPlayerDownloadFingerprint : Fingerprint(
    definingClass = "Lcom/reddit/frontpage/presentation/detail/video/VideoPlayerScreen;",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(type = "Lcom/reddit/sharing/custom/model/ShareEntryPoint;"),
        methodCall(
            parameters = listOf(
                "Ljava/lang/String;",
                "Z",
                "Lcom/reddit/domain/model/Link;",
                "Ljava/lang/Integer;",
                "Ljava/lang/Integer;"
            ),
            returnType = "V"
        )
    ),
    custom = { method, _ ->
        !AccessFlags.STATIC.isSet(method.accessFlags)
    }
)

/**
 * Fingerprint for native SaveMediaScreen execution method (SaveMediaScreen.o5).
 */
internal object SaveMediaDownloadFingerprint : Fingerprint(
    definingClass = "Lcom/reddit/frontpage/ui/SaveMediaScreen;",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Z",
        "Lcom/reddit/domain/model/Link;",
        "Ljava/lang/Integer;",
        "Ljava/lang/Integer;"
    ),
    custom = { method, _ ->
        !AccessFlags.STATIC.isSet(method.accessFlags)
    }
)

/**
 * Fingerprint for LightboxScreen toolbar configuration (LightboxScreen.G4).
 */
internal object LightboxToolbarFingerprint : Fingerprint(
    definingClass = "Lcom/reddit/frontpage/presentation/detail/LightboxScreen;",
    name = "G4",
    parameters = listOf("Landroidx/appcompat/widget/Toolbar;"),
    returnType = "V",
    custom = { method, _ ->
        !AccessFlags.STATIC.isSet(method.accessFlags)
    }
)

/**
 * Fingerprint for VideoPlayerScreen toolbar configuration (VideoPlayerScreen.G4).
 */
internal object VideoPlayerToolbarFingerprint : Fingerprint(
    definingClass = "Lcom/reddit/frontpage/presentation/detail/video/VideoPlayerScreen;",
    name = "G4",
    parameters = listOf("Landroidx/appcompat/widget/Toolbar;"),
    returnType = "V",
    custom = { method, _ ->
        !AccessFlags.STATIC.isSet(method.accessFlags)
    }
)

/**
 * Fingerprint for Home Feed ActionBar Compose dispatcher (m5s0.c in 2026.47.0).
 * Takes (to30, yqj, jyb0, shareM20, repostM20, ...) and invokes h30.a with tag "post_footer".
 */
internal object FeedActionBarDispatchFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        literal(FEED_FOOTER_GROUP),
        string("post_footer")
    ),
    custom = { method, _ ->
        AccessFlags.STATIC.isSet(method.accessFlags) &&
            method.parameterTypes.size >= 4 &&
            method.parameterTypes[0].toString().startsWith("L") &&
            method.parameterTypes[3].toString().startsWith("L")
    }
)

/**
 * Fingerprint for Home Feed element base constructor (mtj.<init> in 2026.47.0).
 * Matches root base class by 4 instance fields and zero-arg getLinkId()Ljava/lang/String;.
 */
internal object FeedElementConstructorFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Z", "L"),
    custom = { _, classDef ->
        classDef.superclass == "Ljava/lang/Object;" &&
            classDef.instanceFields.count() == 4 &&
            classDef.methods.any {
                it.name == "getLinkId" && it.parameters.isEmpty() && it.returnType == "Ljava/lang/String;"
            }
    }
)

/**
 * Fingerprint for com.reddit.domain.model.Link primary constructor.
 * Structurally checks superclass <init> invocation and excludes delegating this(...) constructors.
 */
internal object LinkPrimaryConstructorFingerprint : Fingerprint(
    classFingerprint = LinkToStringFingerprint,
    name = "<init>",
    returnType = "V",
    custom = { method, classDef ->
        val impl = method.implementation
        if (method.parameterTypes.size <= 100 || impl == null) {
            false
        } else {
            var callsSuperInit = false
            var delegatesToSelf = false
            for (inst in impl.instructions) {
                if (inst.opcode == Opcode.INVOKE_DIRECT || inst.opcode == Opcode.INVOKE_DIRECT_RANGE) {
                    val ref = (inst as? ReferenceInstruction)?.reference as? MethodReference ?: continue
                    if (ref.name == "<init>") {
                        if (ref.definingClass == classDef.type) {
                            delegatesToSelf = true
                        } else if (ref.definingClass == classDef.superclass) {
                            callsSuperInit = true
                        }
                    }
                }
            }
            callsSuperInit && !delegatesToSelf
        }
    }
)

/**
 * Fingerprint for Full Bleed Player (FBP) native download event handler
 * (com.reddit.fullbleedplayer.data.events.c.a in 2026.47.0).
 */
internal object FbpDownloadEventHandlerFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L", "Lkotlin/jvm/functions/Function1;", "L"),
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/reddit/fullbleedplayer/analytics/Noun;",
            name = "OVERFLOW_DOWNLOAD"
        )
    ),
    custom = { method, _ ->
        !AccessFlags.STATIC.isSet(method.accessFlags)
    }
)
