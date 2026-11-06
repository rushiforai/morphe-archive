package app.bookspiko.patches.books.reader.font

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import com.android.tools.smali.dexlib2.Opcode

internal const val SETTINGS_CATEGORY_NODE = "Lcom/google/android/apps/play/books/settings/common/CategoryNode;"

/**
 * Provider of the settings item registry: reads the static settings tree, gets the
 * `Map<item id, item>` from Dagger and wraps it. Matched instructions: 0 = tree root, 2 = the map.
 */
internal object SettingsItemsProviderFingerprint : Fingerprint(
    returnType = "L",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(type = SETTINGS_CATEGORY_NODE, opcode = Opcode.SGET_OBJECT),
        methodCall(returnType = "Ljava/util/Map;"),
        opcode(Opcode.MOVE_RESULT_OBJECT, location = MatchAfterImmediately()),
        methodCall(name = "<init>", parameters = listOf("Ljava/util/Map;"), returnType = "V"),
    ),
)

/**
 * Composable model of the "About Google Play Books" settings row (title, version subtitle,
 * click). Its class is reused for the custom font row.
 */
internal object AboutSettingsItemFingerprint : Fingerprint(
    returnType = "L",
    parameters = listOf("L"),
    filters = listOf(
        resourceLiteral(ResourceType.STRING, "about_play_books_settings_title"),
        opcode(Opcode.INVOKE_STATIC),
        opcode(Opcode.MOVE_RESULT_OBJECT, location = MatchAfterImmediately()),
    ),
)
