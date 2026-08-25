package app.template.patches.rustore.navigation

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val NAVIGATION_TAB_KIND =
    "Lru/vk/store/feature/showcase/tabsOrder/api/domain/NavigationTabKind;"
private const val INTERESTING_DESTINATION =
    "Lru/vk/store/feature/interesting/api/presentation/InterestingTabDestination;"
private const val GAMES_DESTINATION =
    "Lru/vk/store/feature/recommendation/api/presentation/RecommendationGamesDestination;"
private const val APPS_DESTINATION =
    "Lru/vk/store/feature/recommendation/api/presentation/RecommendationAppsDestination;"

context(_: BytecodePatchContext)
internal fun hideFeaturedAndGamesTabs() {
    val tabsFactoryMethod = MainNavigationTabsFactoryFingerprint
        .matchAll(1..1)
        .single()
        .method
    val tabsFactoryInstructions = tabsFactoryMethod.implementation!!.instructions
    val tabKindCasts = tabsFactoryInstructions.withIndex().filter { (_, instruction) ->
        val type = (instruction as? ReferenceInstruction)?.reference as? TypeReference
        instruction.opcode == Opcode.CHECK_CAST && type?.type == NAVIGATION_TAB_KIND
    }
    require(tabKindCasts.size == 1) {
        "Expected one NavigationTabKind loop cast, found ${tabKindCasts.size}"
    }

    val (tabKindCastIndex, tabKindCastInstruction) = tabKindCasts.single()
    val tabKindRegister =
        (tabKindCastInstruction as? OneRegisterInstruction)?.registerA
    require(tabKindRegister != null) {
        "NavigationTabKind loop cast has an unexpected format"
    }
    val scratchRegister =
        (tabsFactoryInstructions[tabKindCastIndex + 1] as? TwoRegisterInstruction)
            ?.registerA
    require(
        scratchRegister != null &&
            scratchRegister != tabKindRegister &&
            tabKindRegister <= 15 &&
            scratchRegister <= 15,
    ) {
        "Could not find a safe navigation-tab scratch register"
    }

    val iteratorCalls = tabsFactoryInstructions.withIndex().filter { (index, instruction) ->
        val method =
            (instruction as? ReferenceInstruction)?.reference as? MethodReference
        index < tabKindCastIndex &&
            instruction.opcode == Opcode.INVOKE_INTERFACE &&
            method?.definingClass == "Ljava/util/Iterator;" &&
            method.name == "hasNext" &&
            method.parameterTypes.isEmpty() &&
            method.returnType == "Z"
    }
    require(iteratorCalls.size == 1) {
        "Expected one navigation-tab iterator, found ${iteratorCalls.size}"
    }

    tabsFactoryMethod.addInstructionsWithLabels(
        tabKindCastIndex + 1,
        """
            sget-object v$scratchRegister, $NAVIGATION_TAB_KIND->INTERESTING:$NAVIGATION_TAB_KIND
            if-eq v$tabKindRegister, v$scratchRegister, :next_navigation_tab
            sget-object v$scratchRegister, $NAVIGATION_TAB_KIND->GAMES:$NAVIGATION_TAB_KIND
            if-eq v$tabKindRegister, v$scratchRegister, :next_navigation_tab
        """,
        ExternalLabel(
            "next_navigation_tab",
            iteratorCalls.single().value,
        ),
    )

    val rootNavHostMethod = RootNavHostFingerprint
        .matchAll(1..1)
        .single()
        .method
    val rootNavHostInstructions = rootNavHostMethod.implementation!!.instructions
    val oldDestinations = setOf(INTERESTING_DESTINATION, GAMES_DESTINATION)
    val destinationConstants = rootNavHostInstructions.withIndex().filter { (_, instruction) ->
        val type = (instruction as? ReferenceInstruction)?.reference as? TypeReference
        instruction.opcode == Opcode.CONST_CLASS && type?.type in oldDestinations
    }
    val destinationCounts = destinationConstants.groupingBy { (_, instruction) ->
        ((instruction as ReferenceInstruction).reference as TypeReference).type
    }.eachCount()
    require(destinationCounts == oldDestinations.associateWith { 1 }) {
        "Expected one Interesting and one Games start destination, found $destinationCounts"
    }

    destinationConstants.forEach { (index, instruction) ->
        val register = (instruction as? OneRegisterInstruction)?.registerA
        require(register != null) {
            "Root start-destination instruction has an unexpected format"
        }
        rootNavHostMethod.replaceInstruction(
            index,
            "const-class v$register, $APPS_DESTINATION",
        )
    }
}
