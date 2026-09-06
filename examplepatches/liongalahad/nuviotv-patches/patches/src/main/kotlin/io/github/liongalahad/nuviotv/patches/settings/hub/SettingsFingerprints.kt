package io.github.liongalahad.nuviotv.patches.settings.hub

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** Exact 0.8.11-beta settings Composable and its visibility-filter ordinal call. */
internal object SettingsScreenFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        literal(0x7f110974),
        literal(0x7f110975),
        literal(0x7f110972),
        literal(0x7f110973),
        methodCall(
            definingClass = "Lkotlin/collections/CollectionsKt;",
            name = "listOf",
            returnType = "Ljava/util/List;"
        ),
        methodCall(name = "ordinal", returnType = "I")
    )
)

/** Essential-layout Experience pane header repurposed as the Morphe preview. */
internal object ExperienceSettingsHeaderFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        literal(0x7f11094f),
        literal(0x7f1105ae)
    )
)

/** Both Experience-mode cards rendered inside the native settings pane. */
internal object ExperienceSettingsCardFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;"),
    custom = { method, classDef ->
        val requiredLiterals = setOf(
            0x7f1105a2L, 0x7f1105aaL, 0x7f1105adL,
            0x7f1105afL, 0x7f1105b0L, 0x7f1105b1L
        )
        val methodLiterals = method.implementation?.instructions
            ?.mapNotNull { (it as? WideLiteralInstruction)?.wideLiteral }
            ?.toSet()
            .orEmpty()
        "Lkotlin/jvm/functions/Function3;" in classDef.interfaces &&
            methodLiterals.containsAll(requiredLiterals)
    }
)

/** A native Nuvio boolean setting row used to discover the Compose type. */
internal object NativeSettingsSwitchUsageFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;"),
    filters = listOf(
        literal(0x7f110a5d),
        literal(0x7f110a5e)
    ),
    custom = { method, classDef ->
        "Lkotlin/jvm/functions/Function3;" in classDef.interfaces &&
            method.implementation?.instructions?.any { instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    ?: return@any false
                reference.returnType == "V" &&
                    reference.parameterTypes.map(CharSequence::toString).let { parameters ->
                        parameters.size == 10 && parameters.take(4) == listOf(
                            "Ljava/lang/String;", "Ljava/lang/String;", "Z",
                            "Lkotlin/jvm/functions/Function0;"
                        )
                    }
            } == true
    }
)
