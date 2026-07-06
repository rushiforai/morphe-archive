package app.morphe.patches.piko.misc.shim.fields

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import com.android.tools.smali.dexlib2.Opcode

internal const val EXTENSION_CLASS = "Lapp/morphe/extension/piko/patches/AbstractShimLayerPatch;"
internal const val TWITTER_ACTIVITY_CLASS = "Lcom/twitter/app/TwitterApplication;"

internal object AppComponentFactoryConstructorFingerprint : Fingerprint(
    name = "<clinit>",
    returnType = "V",
    custom = { _, classDef ->
        classDef.superclass == "Landroid/app/AppComponentFactory;"
    }
)

internal object ApplicationConstructorFingerprint : Fingerprint(
    name = "<clinit>",
    returnType = "V",
    custom = { _, classDef ->
        classDef.superclass == "Landroid/app/Application;"
    }
)

internal object SetFieldFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS,
    name = "setField",
    returnType = "Z"
)

internal object TwitterApplicationFingerprint : Fingerprint(
    name = "attachBaseContext",
    custom = { _, classDef ->
        classDef.superclass == TWITTER_ACTIVITY_CLASS
    }
)

internal fun originalMethodFingerprint(fieldCall: String) = object : Fingerprint(
    filters = listOf(
        fieldAccess(
            opcode = Opcode.SGET_OBJECT,
            smali = fieldCall
        )
    )
) {}
