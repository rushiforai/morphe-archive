package app.saketh.patches.webnovel.popups

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

/**
 * Shows the server-driven campaign popup carousel on the home screen.
 */
internal object HomeCampaignPopupFingerprint : Fingerprint(
    definingClass = "Lcom/qidian/Int/reader/MainActivity;",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Lcom/qidian/QDReader/components/entity/HomeOperationItemNew;"),
)

/**
 * Shows the floating campaign banner at the top of the home screen.
 */
internal object HomeFloatingPromoFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Lcom/qidian/QDReader/components/entity/bookCity/BookCityOperationInfo;"),
    strings = listOf("bookCityOperationInfo"),
)

/**
 * Renders the library's floating sale campaign, with a null-payload branch that hides it.
 */
internal object LibraryFloatingPromoFingerprint : Fingerprint(
    isStatic = false,
    returnType = "V",
    parameters = listOf("Lcom/qidian/QDReader/components/entity/LibraryReadingTimeItem;"),
    strings = listOf("GIF"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/qidian/QDReader/components/entity/LibraryReadingTimeItem;",
            name = "getMarketInfo",
        ),
    ),
)

/**
 * Server switch that opens the daily check-in modal automatically on launch.
 */
internal object AutoCheckInModalFingerprint : Fingerprint(
    definingClass = "Lcom/qidian/QDReader/components/setting/CloudConfig;",
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/qidian/QDReader/components/entity/CloudConfigBean;",
            name = "getCheckInShowType",
        ),
    ),
)

/**
 * Rating prompt entry point. Source "profile" is the user opening it from their profile;
 * every other source is an automatic prompt. Matches the branch that splits the two.
 */
internal object RatingPromptFingerprint : Fingerprint(
    isStatic = true,
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "Ljava/lang/String;"),
    strings = listOf("SettingHasRatingNew"),
    filters = listOf(
        string("profile"),
        methodCall(definingClass = "Ljava/lang/String;", name = "equals", location = MatchAfterImmediately()),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
        opcode(Opcode.IF_NEZ, MatchAfterImmediately()),
    ),
)

/**
 * Fetches the popup shown when leaving the novel or comic reader
 * (recommended books, tasks, top-up offers, campaign images, "add to library").
 * Parameters: context, book id, source, chapter id, exit callback.
 */
internal object ReaderExitPopupFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "J", "I", "J", "L"),
    filters = listOf(
        string("context"),
        methodCall(parameters = listOf("J", "I", "J")),
    ),
)
