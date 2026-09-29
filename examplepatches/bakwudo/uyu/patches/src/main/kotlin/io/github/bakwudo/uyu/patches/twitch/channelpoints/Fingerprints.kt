package io.github.bakwudo.uyu.patches.twitch.channelpoints

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

internal const val COMMUNITY_POINTS_MODEL = "Ltv/twitch/android/models/communitypoints/CommunityPointsModel;"
private const val CHAT_MODE_METADATA = "Ltv/twitch/android/shared/one/chat/pub/ChatModeMetadata;"

/**
 * claim(claimId, chatModeMetadata) of the channel points data provider. Several classes
 * implement the provider interface, but only the real provider keeps the latest
 * CommunityPointsModel in a mutable field; the others delegate to it.
 */
internal object ClaimCommunityPointsFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", CHAT_MODE_METADATA),
    custom = { _, classDef ->
        classDef.fields.any { field ->
            field.type == COMMUNITY_POINTS_MODEL &&
                !AccessFlags.STATIC.isSet(field.accessFlags) &&
                !AccessFlags.FINAL.isSet(field.accessFlags)
        }
    },
)

/**
 * Where the provider stores each CommunityPointsModel update it receives. The provider
 * subscribes to the updates for as long as it exists, whether or not any points UI is shown.
 */
internal fun communityPointsModelUpdateFingerprint(providerType: String) = Fingerprint(
    filters = listOf(
        fieldAccess(opcode = Opcode.IPUT_OBJECT, definingClass = providerType, type = COMMUNITY_POINTS_MODEL),
    ),
    custom = { method, _ -> method.name != "<init>" },
)
