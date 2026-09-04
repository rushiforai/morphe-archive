package app.template.patches.steamlink.androidxr

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.isLegacyXrFoundationSteamLinkBuild
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction12x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21s
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference

private fun MutableMethod.pRegister(index: Int): Int {
    val registerCount = implementation!!.registerCount
    val parameterWords = parameterTypes.size + if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    return registerCount - parameterWords + index
}

private fun invokeStaticRange(
    definingClass: String,
    methodName: String,
    parameterTypes: List<String>,
    returnType: String,
    startRegister: Int,
    registerCount: Int,
): BuilderInstruction = BuilderInstruction3rc(
    Opcode.INVOKE_STATIC_RANGE,
    startRegister,
    registerCount,
    ImmutableMethodReference(definingClass, methodName, parameterTypes, returnType),
)

private fun MutableMethod.invocationIndex(
    definingClass: String,
    methodName: String,
): Int = implementation!!.instructions.indexOfFirst { instruction ->
    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
    reference?.definingClass == definingClass && reference.name == methodName
}.also { index ->
    require(index >= 0) { "Missing invocation $definingClass->$methodName in $definingClass" }
}

private fun MutableMethod.fieldAccessIndex(
    definingClass: String,
    fieldName: String,
): Int = implementation!!.instructions.indexOfFirst { instruction ->
    val reference = (instruction as? ReferenceInstruction)?.reference as? FieldReference
    reference?.definingClass == definingClass && reference.name == fieldName
}.also { index ->
    require(index >= 0) { "Missing field access $definingClass->$fieldName in $name" }
}

internal data class XrPointerRouteMethods(
    val touch: String,
    val generic: String,
)

internal fun xrPointerRouteMethodsFor(
    versionName: String,
    versionCode: String,
): XrPointerRouteMethods =
    if (versionName == "2.0.20" && versionCode == "5001712") {
        XrPointerRouteMethods(
            touch = "routeXrPointerAsMouse5001712",
            generic = "routeXrPointerAsMouseGeneric5001712",
        )
    } else {
        XrPointerRouteMethods(
            touch = "routeXrPointerAsMouse",
            generic = "routeXrPointerAsMouseGeneric",
        )
    }

internal val xrDirectInputFixPatch = bytecodePatch {
    dependsOn(androidXrUiExtensionPatch)

    execute {
        // Dependencies execute even when their own compatibility excludes this build. Mutate only
        // exact decoded legacy layouts; native/unknown SDL and controller paths remain untouched.
        if (!isLegacyXrFoundationSteamLinkBuild(
                packageMetadata.versionName,
                packageMetadata.versionCode,
            )) return@execute

        // 5001712 uses exact mouse-only wrappers. Its synthetic PAD_A event runs on Android's
        // UI thread and can activate Connect before the pointed-at PC is selected.
        val pointerRoutes = xrPointerRouteMethodsFor(
            packageMetadata.versionName,
            packageMetadata.versionCode,
        )

        val surfaceChanged = mutableClassDefBy("Lorg/libsdl/app/SDLSurface;").methods
            .first { it.name == "surfaceChanged" && it.parameterTypes.size == 4 }
        val displayMetricsClass = "Landroid/util/DisplayMetrics;"
        val widthIndex = surfaceChanged.fieldAccessIndex(displayMetricsClass, "widthPixels")
        val heightIndex = surfaceChanged.fieldAccessIndex(displayMetricsClass, "heightPixels")
        val densityIndex = surfaceChanged.fieldAccessIndex(displayMetricsClass, "densityDpi")
        val widthDestination =
            (surfaceChanged.implementation!!.instructions[widthIndex] as OneRegisterInstruction).registerA
        val heightDestination =
            (surfaceChanged.implementation!!.instructions[heightIndex] as OneRegisterInstruction).registerA
        val densityDestination =
            (surfaceChanged.implementation!!.instructions[densityIndex] as OneRegisterInstruction).registerA

        surfaceChanged.replaceInstruction(
            widthIndex,
            BuilderInstruction12x(Opcode.MOVE, widthDestination, surfaceChanged.pRegister(3)),
        )
        surfaceChanged.replaceInstruction(
            heightIndex,
            BuilderInstruction12x(Opcode.MOVE, heightDestination, surfaceChanged.pRegister(4)),
        )
        surfaceChanged.replaceInstruction(
            densityIndex,
            BuilderInstruction21s(Opcode.CONST_16, densityDestination, 160),
        )

        mutableClassDefBy("Lorg/libsdl/app/SDLSurface;").methods
            .first { it.name == "onTouch" && it.parameterTypes.size == 2 }
            .apply {
                addInstruction(
                    0,
                    invokeStaticRange(
                        "Lorg/libsdl/app/GxrSdlBridge;",
                        pointerRoutes.touch,
                        listOf("Landroid/view/MotionEvent;"),
                        "V",
                        pRegister(2),
                        1,
                    ),
                )
            }

        mutableClassDefBy("Lorg/libsdl/app/SDLGenericMotionListener_API14;").methods
            .first { it.name == "onGenericMotion" && it.parameterTypes.size == 2 }
            .apply {
                addInstruction(
                    0,
                    invokeStaticRange(
                        "Lorg/libsdl/app/GxrSdlBridge;",
                        pointerRoutes.generic,
                        listOf("Landroid/view/MotionEvent;"),
                        "V",
                        pRegister(2),
                        1,
                    ),
                )
            }

    }
}

/**
 * Overlay/resolution activation hook shared by legacy and native-XR launchers.
 * It changes only SteamLink lifecycle methods and intentionally avoids every SDL/controller class.
 */
internal val xrResolutionProbePatch = bytecodePatch {
    execute {
        val steamLinkClass = mutableClassDefBy("Lcom/valvesoftware/steamlink/SteamLink;")
        val runResolutionProbe = { method: MutableMethod, index: Int, probeMethod: String ->
            method.addInstruction(
                index,
                invokeStaticRange(
                    "Lcom/valvesoftware/steamlink/GxrResolutionProbe;",
                    probeMethod,
                    listOf("Landroid/app/Activity;"),
                    "Z",
                    method.pRegister(0),
                    1,
                ),
            )
        }

        steamLinkClass.methods
            .first { it.name == "onCreate" && it.parameterTypes.singleOrNull() == "Landroid/os/Bundle;" }
            .apply {
                runResolutionProbe(
                    this,
                    invocationIndex("Lorg/libsdl/app/SDLActivity;", "onCreate") + 1,
                    "onSteamLinkCreate",
                )
            }

        steamLinkClass.methods
            .first { it.name == "onResume" && it.parameterTypes.isEmpty() }
            .apply {
                runResolutionProbe(
                    this,
                    invocationIndex("Lorg/libsdl/app/SDLActivity;", "onResume") + 1,
                    "onSteamLinkResume",
                )
            }

        steamLinkClass.methods
            .first { it.name == "startVRLink" && it.parameterTypes.singleOrNull() == "Ljava/lang/String;" }
            .apply {
                runResolutionProbe(
                    this,
                    invocationIndex("Lcom/valvesoftware/steamlink/SteamLink;", "startActivity"),
                    "beforeVrLaunch",
                )
            }
    }
}
