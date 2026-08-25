package app.template.patches.rustore.notifications

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

context(_: BytecodePatchContext)
internal fun hideNotificationButtons() {
    val viewModelImplementation = NotificationButtonViewModelConstructorFingerprint
        .matchAll(1..1)
        .single()
        .classDef
    val viewModelType = viewModelImplementation.interfaces.single()
    val registryMethod = NotificationButtonRegistryFingerprint
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
        "Expected one notification-button ViewModel registration, " +
            "found ${viewModelConstants.size}"
    }

    val viewModelConstantIndex = viewModelConstants.single().index
    val dependencyFactoryIndex = viewModelConstantIndex - 4
    val registrationIndex = viewModelConstantIndex + 1
    require(
        dependencyFactoryIndex >= 0 &&
            registrationIndex + 1 < registryInstructions.size,
    ) {
        "Notification-button registration boundaries are invalid"
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
        "Notification-button ViewModel registration has an unexpected format"
    }

    registryMethod.addInstructionsWithLabels(
        dependencyFactoryIndex,
        "goto :after_notification_button_registration",
        ExternalLabel(
            "after_notification_button_registration",
            registryInstructions[registrationIndex + 1],
        ),
    )

    val composableMatch = NotificationCenterIconButtonWidgetFingerprint
        .matchAll(1..1)
        .single()
    require(composableMatch.method.parameterTypes[1].toString() == viewModelType) {
        "Notification-button composable does not use the discovered ViewModel type"
    }
    composableMatch.method.addInstructions(0, "return-void")
}
