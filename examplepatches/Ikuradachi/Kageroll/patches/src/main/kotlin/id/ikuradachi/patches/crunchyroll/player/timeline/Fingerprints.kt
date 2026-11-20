package id.ikuradachi.patches.crunchyroll.player.timeline

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

object PlayerTimelineLayoutInitFingerprint : Fingerprint(
    definingClass = "Lcom/crunchyroll/player/presentation/controls/timeline/PlayerTimelineLayout;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Landroid/util/AttributeSet;", "I"),
    filters = listOf(
        literal(0x7f0e035b),
        literal(0x7f0b02fd),
        literal(0x7f0b0b89),
    ),
)

object PlayerTimelineUpdateTimeFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("I"),
    filters = listOf(
        literal(0x7f14033e),
        methodCall(
            definingClass = "Landroid/content/Context;",
            name = "getString",
            parameters = listOf("I", "[Ljava/lang/Object;"),
        ),
    ),
)

object RemainingTimeDefaultFingerprint : Fingerprint(
    definingClass = "Lid/ikuradachi/kageroll/extension/crunchyroll/RemainingTimeHelper;",
    name = "getDefaultShowRemaining",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf(),
)
