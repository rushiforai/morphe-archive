package app.aidan.patches.navigate360.tracking

import app.aidan.patches.navigate360.shared.COMPATIBILITY_NAVIGATE360
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

private const val GAINSIGHT_PLUGIN = "Lcom/native360/gainsight/GainsightPlugin;"
private const val GAINSIGHT_PX = "Lcom/gainsight/px/mobile/GainsightPX;"
private const val GAINSIGHT_PX_BUILDER = "Lcom/gainsight/px/mobile/GainsightPX\$Builder;"

val removeTrackingAndTelemetryPatch = bytecodePatch(
    name = "Remove Tracking and Telemetry",
    description = "Neutralizes Gainsight PX behavioral analytics (session tracking, screen views, custom events, user identification) and disables the Cordova Gainsight native plugin.",
    default = true
) {
    category("Privacy")
    compatibleWith(COMPATIBILITY_NAVIGATE360)

    execute {
        disableVoidMethods(
            GAINSIGHT_PLUGIN,
            "pluginInitialize",
            "onStart",
            "onNewIntent",
            "handleGainsightIntent",
            "initializeNativeSDK"
        )
        returnBoolean(GAINSIGHT_PLUGIN, "attachNativeBridge", false)
        returnBoolean(GAINSIGHT_PLUGIN, "loadBridgeScript", false)
        returnBoolean(GAINSIGHT_PLUGIN, "execute", false)

        disableVoidMethods(
            GAINSIGHT_PX,
            "attachToWebView",
            "loadScript",
            "setSingletonInstance",
            "enterEditingMode",
            "enableEngagements",
            "custom",
            "screen",
            "identify",
            "flush"
        )
        returnNullObject(GAINSIGHT_PX_BUILDER, "build")
    }
}

/**
 * Makes all implemented void overloads with the requested names return immediately.
 *
 * @throws PatchException if the class is absent or any requested name has no matching
 * method. Other matches may already have been patched when a missing name is detected.
 */
private fun BytecodePatchContext.disableVoidMethods(
    classDescriptor: String,
    vararg methodNames: String
) {
    val mutableClass = mutableClassDefByOrNull(classDescriptor)
        ?: throw PatchException("Missing required class $classDescriptor")
    val methodSet = methodNames.toSet()
    val foundMethods = mutableSetOf<String>()

    for (method in mutableClass.methods) {
        if (method.name in methodSet && method.returnType == "V" && method.implementation != null) {
            method.addInstructions(0, "return-void")
            foundMethods += method.name
        }
    }

    val missingMethods = methodSet - foundMethods
    if (missingMethods.isNotEmpty()) {
        throw PatchException("Missing required void method(s) ${missingMethods.joinToString()} in $classDescriptor")
    }
}

/**
 * Makes the unique implemented boolean method with [methodName] return [value].
 *
 * @throws PatchException if the class is absent or there is not exactly one match.
 */
private fun BytecodePatchContext.returnBoolean(
    classDescriptor: String,
    methodName: String,
    value: Boolean
) {
    val mutableClass = mutableClassDefByOrNull(classDescriptor)
        ?: throw PatchException("Missing required class $classDescriptor")
    val method = mutableClass.methods.singleOrNull {
        it.name == methodName && it.returnType == "Z" && it.implementation != null
    } ?: throw PatchException("Missing required boolean method $methodName in $classDescriptor")
    val constInstruction = if (value) "const/4 v0, 0x1" else "const/4 v0, 0x0"

    method.addInstructions(
        0,
        """
        $constInstruction
        return v0
        """.trimIndent()
    )
}

/**
 * Makes the unique implemented method with [methodName] and a class return type
 * return null. Array return types are excluded.
 *
 * @throws PatchException if the class is absent or there is not exactly one match.
 */
private fun BytecodePatchContext.returnNullObject(
    classDescriptor: String,
    methodName: String
) {
    val mutableClass = mutableClassDefByOrNull(classDescriptor)
        ?: throw PatchException("Missing required class $classDescriptor")
    val method = mutableClass.methods.singleOrNull {
        it.name == methodName && it.returnType.startsWith("L") && it.implementation != null
    } ?: throw PatchException("Missing required object method $methodName in $classDescriptor")

    method.addInstructions(
        0,
        """
        const/4 v0, 0x0
        return-object v0
        """.trimIndent()
    )
}
