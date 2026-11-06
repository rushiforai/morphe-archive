package app.revanced.patches.pinterest

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.AccessFlags
import app.morphe.patcher.fingerprint
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue

private val booleanGetterPattern = listOf(
    Opcode.IGET_OBJECT,
    Opcode.IF_NEZ,
    Opcode.SGET_OBJECT,
    Opcode.RETURN_OBJECT
)

internal val adsGmaExperimentFingerprint = fingerprint {
    accessFlags(AccessFlags.PUBLIC)
    returns("Z")
    strings("android_ad_gma_new", "enabled")
}

internal val isPromotedFingerprint = fingerprint {
    accessFlags(AccessFlags.PUBLIC, AccessFlags.FINAL)
    returns("Ljava/lang/Boolean")
    opcodes(*booleanGetterPattern.toTypedArray())
    custom { method, classDef ->
        method.implementation?.instructions?.any { insn ->
            val fieldRef = (insn as? ReferenceInstruction)?.reference as? FieldReference
            fieldRef?.let { ref ->
                classDef.fields.any { field ->
                    field.name == ref.name &&
                    field.annotations.any { ann ->
                        ann.elements.any { el ->
                            el.name == "value" &&
                            (el.value as? StringEncodedValue)?.value == "is_promoted"
                        }
                    }
                }
            } ?: false
        } ?: false
    }
}

internal val isDownstreamPromotionFingerprint = fingerprint {
    accessFlags(AccessFlags.PUBLIC, AccessFlags.FINAL)
    returns("Ljava/lang/Boolean")
    opcodes(*booleanGetterPattern.toTypedArray())
    custom { method, classDef ->
        method.implementation?.instructions?.any { insn ->
            val fieldRef = (insn as? ReferenceInstruction)?.reference as? FieldReference
            fieldRef?.let { ref ->
                classDef.fields.any { field ->
                    field.name == ref.name &&
                    field.annotations.any { ann ->
                        ann.elements.any { el ->
                            el.name == "value" &&
                            (el.value as? StringEncodedValue)?.value == "is_downstream_promotion"
                        }
                    }
                }
            } ?: false
        } ?: false
    }
}

internal val shopTheLookFingerprint = fingerprint {
    accessFlags(AccessFlags.PUBLIC, AccessFlags.FINAL)
    parameters("Lcom/pinterest/api/model/me;", "Z")
    returns("V")
    strings("closeupPin", "product_tagged_shopping_module_upsell")
}
