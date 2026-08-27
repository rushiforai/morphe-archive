package app.template.patches.rustore.gaming

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.template.patches.all.analytics.childrenNamed
import app.template.patches.all.analytics.removeChildren
import app.template.patches.rustore.shared.Constants.COMPATIBILITY_RUSTORE
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val PACKAGE_USAGE_STATS_PERMISSION =
    "android.permission.PACKAGE_USAGE_STATS"

private val disableGamingProfileManifestPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_RUSTORE)

    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val usageStatsPermissions = manifest
                .childrenNamed("uses-permission", "uses-permission-sdk-23")
                .filter {
                    it.getAttribute("android:name") == PACKAGE_USAGE_STATS_PERMISSION
                }
            if (usageStatsPermissions.size != 1) {
                throw PatchException(
                    "Expected one package usage statistics permission, found " +
                        usageStatsPermissions.size,
                )
            }
            manifest.removeChildren(usageStatsPermissions)

            val permissionStillPresent = manifest
                .childrenNamed("uses-permission", "uses-permission-sdk-23")
                .any {
                    it.getAttribute("android:name") == PACKAGE_USAGE_STATS_PERMISSION
                }
            if (permissionStillPresent) {
                throw PatchException("Package usage statistics permission remains")
            }
        }
    }
}

@Suppress("unused")
val disableGamingProfilePatch = bytecodePatch(
    name = "Disable gaming profile",
    description =
        "Removes the Game Profile and usage statistics access, hides both " +
            "gaming cards, and blocks navigation to the profile.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_RUSTORE)
    dependsOn(disableGamingProfileManifestPatch)

    execute {
        disableGamingProfile()
    }
}

context(_: BytecodePatchContext)
internal fun disableGamingProfile() {
    MineV2OpenGameCenterFingerprint
        .matchAll(1..1)
        .single()
        .method
        .addInstructions(0, "return-void")

    val viewModelImplementation = GameCenterWidgetViewModelConstructorFingerprint
        .matchAll(1..1)
        .single()
        .classDef
    val viewModelType = viewModelImplementation.interfaces.single()
    val registryMethod = GameCenterWidgetRegistryFingerprint
        .matchAll(1..1)
        .single()
        .method
    val registryInstructions = registryMethod.implementation!!.instructions
    val viewModelConstants = registryInstructions.withIndex().filter { (_, instruction) ->
        val type = (instruction as? ReferenceInstruction)?.reference as? TypeReference
        instruction.opcode == Opcode.CONST_CLASS &&
            type?.type == viewModelType
    }
    require(viewModelConstants.size == 1) {
        "Expected one Game Center widget ViewModel registration, " +
            "found ${viewModelConstants.size}"
    }

    val viewModelConstantIndex = viewModelConstants.single().index
    val dependencyFactoryIndex = viewModelConstantIndex - 4
    val registrationIndex = viewModelConstantIndex + 1
    require(
        dependencyFactoryIndex >= 0 &&
            registrationIndex + 1 < registryInstructions.size,
    ) {
        "Game Center widget registration boundaries are invalid"
    }

    val dependencyFactoryMethod =
        (registryInstructions[dependencyFactoryIndex] as? ReferenceInstruction)
            ?.reference as? MethodReference
    val dependencyResult =
        registryInstructions[dependencyFactoryIndex + 1] as? OneRegisterInstruction
    val providerType =
        (registryInstructions[dependencyFactoryIndex + 2] as? ReferenceInstruction)
            ?.reference as? TypeReference
    val providerRegister =
        (registryInstructions[dependencyFactoryIndex + 2] as? OneRegisterInstruction)
            ?.registerA
    val providerConstructorInstruction =
        registryInstructions[dependencyFactoryIndex + 3] as? FiveRegisterInstruction
    val providerConstructor =
        (registryInstructions[dependencyFactoryIndex + 3] as? ReferenceInstruction)
            ?.reference as? MethodReference
    val viewModelClassRegister =
        (registryInstructions[viewModelConstantIndex] as? OneRegisterInstruction)
            ?.registerA
    val registrationInstruction =
        registryInstructions[registrationIndex] as? FiveRegisterInstruction
    val registrationMethod =
        (registryInstructions[registrationIndex] as? ReferenceInstruction)
            ?.reference as? MethodReference
    require(
        registryInstructions[dependencyFactoryIndex].opcode == Opcode.INVOKE_VIRTUAL &&
            dependencyFactoryMethod?.parameterTypes?.isEmpty() == true &&
            dependencyFactoryMethod?.returnType?.startsWith("L") == true &&
            registryInstructions[dependencyFactoryIndex + 1].opcode ==
            Opcode.MOVE_RESULT_OBJECT &&
            dependencyResult != null &&
            registryInstructions[dependencyFactoryIndex + 2].opcode ==
            Opcode.NEW_INSTANCE &&
            providerType != null &&
            providerRegister != null &&
            registryInstructions[dependencyFactoryIndex + 3].opcode ==
            Opcode.INVOKE_DIRECT &&
            providerConstructor?.definingClass == providerType?.type &&
            providerConstructor?.name == "<init>" &&
            providerConstructor?.parameterTypes?.map(CharSequence::toString) ==
            listOf(dependencyFactoryMethod?.returnType) &&
            providerConstructor?.returnType == "V" &&
            providerConstructorInstruction?.registerCount == 2 &&
            providerConstructorInstruction?.registerC == providerRegister &&
            providerConstructorInstruction?.registerD == dependencyResult?.registerA &&
            viewModelClassRegister != null &&
            registryInstructions[registrationIndex].opcode == Opcode.INVOKE_VIRTUAL &&
            registrationMethod?.parameterTypes?.map(CharSequence::toString) ==
            listOf("Ljava/lang/Object;", "Ljava/lang/Object;") &&
            registrationMethod?.returnType == "V" &&
            registrationInstruction?.registerCount == 3 &&
            registrationInstruction?.registerD == viewModelClassRegister &&
            registrationInstruction?.registerE == providerRegister,
    ) {
        "Game Center widget ViewModel registration has an unexpected format"
    }

    registryMethod.addInstructionsWithLabels(
        dependencyFactoryIndex,
        "goto :after_game_center_widget_registration",
        ExternalLabel(
            "after_game_center_widget_registration",
            registryInstructions[registrationIndex + 1],
        ),
    )

    val composableMatches = listOf(
        GameCenterV2ButtonComposableFingerprint,
        GameCenterV1ButtonComposableFingerprint,
    ).map { fingerprint ->
        fingerprint
            .matchAll(1..1)
            .single()
    }
    require(composableMatches.all { match ->
        match.method.parameterTypes[2].toString() == viewModelType
    }) {
        "Game Center composables do not use the discovered widget ViewModel type"
    }
    composableMatches.forEach { match ->
        match.method.addInstructions(0, "return-void")
    }
}
