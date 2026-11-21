package app.stylus.patches.wimt.font

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefByOrNull
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val TYPEFACE = "Landroid/graphics/Typeface;"
private const val SET_TEXT_VIEW_TYPEFACE = "Landroid/widget/TextView;->setTypeface($TYPEFACE)V"
private const val DEFAULT_TYPEFACE = "$TYPEFACE->DEFAULT:$TYPEFACE"

/**
 * ResourcesCompat.getFont(Context, int, TypedValue, int, FontCallback, boolean, boolean).
 *
 * This is the shared entry point used by both the Android View and Compose
 * font loaders in the app.
 */
internal object ResourcesCompatGetFontFingerprint : Fingerprint(
    accessFlags = listOf(
        AccessFlags.PUBLIC,
        AccessFlags.STATIC,
    ),
    returnType = TYPEFACE,
    custom = { method, _ ->
        method.parameters.size == 7 &&
            method.parameters[0].type == "Landroid/content/Context;" &&
            method.parameters[1].type == "I" &&
            method.parameters[2].type == "Landroid/util/TypedValue;" &&
            method.parameters[3].type == "I" &&
            method.parameters[5].type == "Z" &&
            method.parameters[6].type == "Z"
    },
)

internal fun resolveFontSuccessCallback(loader: Method): MethodReference {
    val callbackType = loader.parameters[4].type
    return classDefByOrNull(callbackType)?.methods?.singleOrNull { method ->
        val code = method.implementation
        !AccessFlags.STATIC.isSet(method.accessFlags) &&
            method.returnType == "V" &&
            method.parameterTypes.singleOrNull() == TYPEFACE &&
            code?.instructions?.any {
                (it as? ReferenceInstruction)?.reference.toString() ==
                    "Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z"
            } == true
    } ?: throw PatchException("Could not find the font success callback on $callbackType.")
}

/**
 * Track row binder.
 *
 * Resets the station name TextView to Typeface.DEFAULT, which discards the
 * theme font. The custom font patch removes that reset so station names follow
 * the same font as the rest of the UI.
 */
internal object TrackRowTypefaceFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        method.parameters.size == 2 &&
            method.parameters[1].type == "Ljava/util/List;" &&
            findTrackRowTypefaceReset(method) >= 0
    },
    filters = listOf(
        methodCall(smali = SET_TEXT_VIEW_TYPEFACE),
    ),
)

internal fun findTrackRowTypefaceReset(method: Method): Int {
    val instructions = method.implementation?.instructions ?: return -1
    var typefaceRegister: Int? = null
    for ((index, instruction) in instructions.withIndex()) {
        val reference = (instruction as? ReferenceInstruction)?.reference.toString()
        if (instruction.opcode == Opcode.SGET_OBJECT && reference == DEFAULT_TYPEFACE) {
            typefaceRegister = (instruction as OneRegisterInstruction).registerA
            continue
        }

        if (typefaceRegister == null) continue
        if (reference == SET_TEXT_VIEW_TYPEFACE) {
            val argument = when (instruction.opcode) {
                Opcode.INVOKE_VIRTUAL -> (instruction as FiveRegisterInstruction).registerD
                Opcode.INVOKE_VIRTUAL_RANGE -> (instruction as RegisterRangeInstruction).startRegister + 1
                else -> null
            }
            if (argument == typefaceRegister) return index
        }

        if (instruction.opcode.setsRegister() && (instruction as? OneRegisterInstruction)?.registerA == typefaceRegister) {
            typefaceRegister = null
        }
    }
    return -1
}

/**
 * Compose's AndroidParagraphIntrinsics constructor.
 *
 * The constructor applies the base SpanStyle to its TextPaint before laying
 * out the paragraph. Match that call and the stable parts of the signature.
 */
internal object ComposeParagraphConstructorFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        method.name == "<init>" &&
            method.parameters.firstOrNull()?.type == "Ljava/lang/String;" &&
            method.parameters.getOrNull(2)?.type == "Ljava/util/List;" &&
            method.parameters.getOrNull(3)?.type == "Ljava/util/List;" &&
            method.parameters.lastOrNull()?.type == "Z" &&
            method.implementation?.instructions?.any(::isFontFeatureSettingsCall) == true
    },
)

internal fun isFontFeatureSettingsCall(instruction: Instruction): Boolean {
    if (instruction.opcode != Opcode.INVOKE_VIRTUAL) return false
    val method = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return method.name == "setFontFeatureSettings" &&
        method.returnType == "V" &&
        method.parameterTypes.singleOrNull() == "Ljava/lang/String;"
}
