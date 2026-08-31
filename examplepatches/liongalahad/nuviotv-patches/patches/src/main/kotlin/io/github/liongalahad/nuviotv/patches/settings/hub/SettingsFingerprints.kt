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
        literal(0x7f110946),
        literal(0x7f110947),
        literal(0x7f110944),
        literal(0x7f110945),
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
        literal(0x7f110921),
        literal(0x7f110598)
    )
)

/** Both Experience-mode cards rendered inside the native settings pane. */
internal object ExperienceSettingsCardFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;"),
    custom = { method, classDef ->
        val requiredLiterals = setOf(
            0x7f11058cL, 0x7f110594L, 0x7f110597L,
            0x7f110599L, 0x7f11059aL, 0x7f11059bL
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
        literal(0x7f110a2f),
        literal(0x7f110a30)
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
