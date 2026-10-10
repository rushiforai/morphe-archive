package app.noam.patches.chesscom.home

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.noam.patches.chesscom.misc.settings.settingsPatch
import app.noam.patches.chesscom.shared.Constants
import app.noam.patches.chesscom.shared.markFeaturePatched
import app.noam.patches.chesscom.shared.returnString
import app.noam.patches.chesscom.shared.toBinaryName
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val HOME_LAYOUT = "${Constants.EXTENSION_PACKAGE}/home/HomeLayout;"
private const val LOADER = "Lcom/chess/home/play/data/HomeScreenLoader;"
private const val LOADER_STATE = "Lcom/chess/home/play/data/HomeScreenLoader\$c;"

/** Sections the settings page offers, by the name their data class prints. */
private val SECTIONS = listOf(
    "CurrentDailyGames", "Challenges", "OutgoingChallenges", "ChallengeRecommendations",
    "FriendsCarousel", "Stats", "FinishedVsPlayerGames", "FinishedVsBotsGames", "FinishedCoachGames",
)

/** toString() of the redesigned Home's content (every section of the screen). */
internal object HomeContentToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("Content(showOfflineBanner="),
)

/** What the redesigned Home's section classes print. */
private val REDESIGN_SECTIONS = listOf(
    "HeaderSection(", "StatsSection(", "GameHistorySection(", "FriendsSection(", "ChallengesSection(",
    "DailyGameSection(", "ActivityFeedSection(",
)
private const val ACTIVITIES = "Lcom/chess/home/play/RecommendedActivitiesSection;"

/** toString() of the Home "vs bot" tile section; its superclass is the section base type. */
internal object VsBotTileToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("VsBotTile(tile="),
)

@Suppress("unused")
val customHomePatch = bytecodePatch(
    name = "Customize Home screen",
    description = "Choose which tiles and sections the Home screen shows, and the order of the " +
        "tiles. Works on both of chess.com's Home screens (the older list and the redesign).",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(settingsPatch)

    execute {
        markFeaturePatched("customHomePatched")

        // Tell the extension which (obfuscated) class is which section.
        val sectionBase = VsBotTileToStringFingerprint.originalClassDef.superclass
            ?: throw PatchException("The Home section type was not found")
        val pairs = mutableListOf<String>()
        classDefForEach { classDef ->
            if (classDef.superclass != sectionBase) return@classDefForEach
            val printed = classDef.methods.firstOrNull { it.name == "toString" }?.implementation?.instructions
                ?.firstOrNull { it.opcode == Opcode.CONST_STRING }
                ?.let { ((it as ReferenceInstruction).reference as StringReference).string.substringBefore('(') }
            if (printed in SECTIONS) pairs += "${classDef.type.toBinaryName()}=$printed"
        }
        if (pairs.size != SECTIONS.size) throw PatchException("Found ${pairs.size} of ${SECTIONS.size} Home sections")
        mutableClassDefBy(HOME_LAYOUT).methods.first { it.name == "sectionClasses" }
            .returnString(pairs.joinToString(";"))

        // Tiles: the loader's tile list, right before it is returned.
        mutableClassDefBy(LOADER).methods.single {
            it.returnType == "Ljava/util/List;" && it.parameterTypes.map { type -> type.toString() } == listOf(LOADER_STATE)
        }.apply {
            val returnIndex = instructions.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
            val register = getInstruction<OneRegisterInstruction>(returnIndex).registerA
            addInstructions(
                returnIndex,
                """
                    invoke-static/range { v$register .. v$register }, $HOME_LAYOUT->tiles(Ljava/util/List;)Ljava/util/List;
                    move-result-object v$register
                """,
            )
        }

        // Sections: every read of the sections map while the screen is being built.
        val mapper = classDefByOrNull {
            it.type.startsWith("Lcom/chess/home/play/data/HomeScreenLoader\$special\$\$inlined\$mapNotNull") &&
                it.methods.any { method -> method.name == "emit" && method.reads(LOADER_STATE) }
        } ?: throw PatchException("The Home screen mapper was not found")
        mutableClassDefBy(mapper).methods.first { it.name == "emit" && it.reads(LOADER_STATE) }.apply {
            val reads = instructions.withIndex().filter { (_, instruction) ->
                instruction.opcode == Opcode.INVOKE_STATIC &&
                    ((instruction as ReferenceInstruction).reference as MethodReference).let { ref ->
                        ref.definingClass == LOADER_STATE && ref.returnType == "Ljava/util/Map;"
                    }
            }.map { it.index }
            if (reads.isEmpty()) throw PatchException("The Home sections map is not read")
            reads.reversed().forEach { index ->
                if (getInstruction(index + 1).opcode != Opcode.MOVE_RESULT_OBJECT) {
                    throw PatchException("Unexpected Home sections map read")
                }
                val register = getInstruction<OneRegisterInstruction>(index + 1).registerA
                addInstructions(
                    index + 2,
                    """
                        invoke-static/range { v$register .. v$register }, $HOME_LAYOUT->sections(Ljava/util/Map;)Ljava/util/Map;
                        move-result-object v$register
                    """,
                )
            }
        }

        // The redesigned Home: its Content receives every section in its constructor.
        val content = HomeContentToStringFingerprint.originalClassDef
        mutableClassDefBy(content).methods.filter { it.name == "<init>" }.maxByOrNull { it.parameterTypes.size }
            ?.apply {
                val hooks = parameterTypes.mapIndexedNotNull { index, parameter ->
                    val type = parameter.toString()
                    val method = when {
                        type == ACTIVITIES -> "recommendedActivities"
                        type == "Ljava/util/List;" -> "onlineNow"
                        printedName(type)?.let { name -> REDESIGN_SECTIONS.any { name.startsWith(it) } } == true -> "section"
                        else -> return@mapIndexedNotNull null
                    }
                    val register = "p${index + 1}"
                    """
                        invoke-static/range { $register .. $register }, $HOME_LAYOUT->$method(Ljava/lang/Object;)Ljava/lang/Object;
                        move-result-object $register
                        check-cast $register, $type
                    """
                }
                if (hooks.size != REDESIGN_SECTIONS.size + 2) {
                    throw PatchException("Found ${hooks.size} of ${REDESIGN_SECTIONS.size + 2} redesigned Home sections")
                }
                addInstructions(0, hooks.joinToString("\n"))
            } ?: throw PatchException("The redesigned Home content constructor was not found")
    }
}

/** What a class's toString() prints first, or null. */
context(context: app.morphe.patcher.patch.BytecodePatchContext)
private fun printedName(type: String): String? =
    context.classDefByOrNull { it.type == type }?.methods?.firstOrNull { it.name == "toString" }
        ?.implementation?.instructions?.firstOrNull { it.opcode == Opcode.CONST_STRING }
        ?.let { ((it as ReferenceInstruction).reference as StringReference).string }

/** Whether this method calls the loader state's map accessor. */
private fun com.android.tools.smali.dexlib2.iface.Method.reads(stateType: String) =
    implementation?.instructions?.any {
        it.opcode == Opcode.INVOKE_STATIC &&
            ((it as ReferenceInstruction).reference as MethodReference).let { ref ->
                ref.definingClass == stateType && ref.returnType == "Ljava/util/Map;"
            }
    } == true
