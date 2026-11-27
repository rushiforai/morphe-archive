package app.noam.patches.chesscom.home

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.noam.patches.chesscom.misc.settings.settingsPatch
import app.noam.patches.chesscom.shared.Constants
import app.noam.patches.chesscom.shared.markFeaturePatched
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val HOME_LAYOUT = "${Constants.EXTENSION_PACKAGE}/home/HomeLayout;"

/** toString() of the Home screen's content (every section of the screen). */
internal object HomeContentToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("Content(showOfflineBanner="),
)

/** What the Home screen's section classes print. */
private val SECTIONS = listOf(
    "HeaderSection(", "StatsSection(", "GameHistorySection(", "FriendsSection(", "ChallengesSection(",
    "DailyGameSection(", "ActivityFeedSection(",
)
private const val ACTIVITIES = "Lcom/chess/home/play/RecommendedActivitiesSection;"

@Suppress("unused")
val customHomePatch = bytecodePatch(
    name = "Customize Home screen",
    description = "Choose which tiles and sections the Home screen shows, and the order of the tiles.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(settingsPatch)

    execute {
        markFeaturePatched("customHomePatched")

        // The Home screen's Content receives every section in its constructor.
        val content = HomeContentToStringFingerprint.originalClassDef
        mutableClassDefBy(content).methods.filter { it.name == "<init>" }.maxByOrNull { it.parameterTypes.size }
            ?.apply {
                val hooks = parameterTypes.mapIndexedNotNull { index, parameter ->
                    val type = parameter.toString()
                    val method = when {
                        type == ACTIVITIES -> "recommendedActivities"
                        type == "Ljava/util/List;" -> "onlineNow"
                        printedName(type)?.let { name -> SECTIONS.any { name.startsWith(it) } } == true -> "section"
                        else -> return@mapIndexedNotNull null
                    }
                    val register = "p${index + 1}"
                    """
                        invoke-static/range { $register .. $register }, $HOME_LAYOUT->$method(Ljava/lang/Object;)Ljava/lang/Object;
                        move-result-object $register
                        check-cast $register, $type
                    """
                }
                if (hooks.size != SECTIONS.size + 2) {
                    throw PatchException("Found ${hooks.size} of ${SECTIONS.size + 2} Home sections")
                }
                addInstructions(0, hooks.joinToString("\n"))
            } ?: throw PatchException("The Home content constructor was not found")
    }
}

/**
 * The name a class's toString() prints ("StatsSection(stats="), or null. R8 may load the labels in
 * any order, so it is the one constant that starts with a capital and opens a parenthesis.
 */
context(context: app.morphe.patcher.patch.BytecodePatchContext)
private fun printedName(type: String): String? =
    context.classDefByOrNull { it.type == type }?.methods?.firstOrNull { it.name == "toString" }
        ?.implementation?.instructions?.mapNotNull { instruction ->
            if (instruction.opcode != Opcode.CONST_STRING) return@mapNotNull null
            ((instruction as ReferenceInstruction).reference as StringReference).string
        }?.firstOrNull { it.isNotEmpty() && it[0].isUpperCase() && '(' in it }
