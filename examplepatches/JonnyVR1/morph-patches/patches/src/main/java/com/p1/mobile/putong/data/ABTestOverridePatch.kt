package com.p1.mobile.putong.data

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

private const val RETURN_NULL_STRING = """
    const/4 v0, 0x0
    return-object v0
"""

private const val RETURN_EMPTY_STRING = """
    const-string v0, ""
    return-object v0
"""

@Suppress("unused")
@JvmField
val abTestOverridePatch = bytecodePatch(
    name = "AB Test Override",
    description = "Override A/B test group assignments to force default behavior",
    default = true,
) {
    compatibleWith(tantanCompatibility)
    execute {
        classDefByOrNull("Lcom/p1/mobile/putong/api/ABManager;")?.let { classDef ->
            val mutableClassDef = mutableClassDefBy(classDef)

            mutableClassDef.methods
                .filter { method ->
                    method.name == "i0" &&
                    method.returnType == "Ljava/lang/String;" &&
                    method.parameterTypes.size == 1 &&
                    method.parameterTypes[0] == "Ljava/lang/String;" &&
                    AccessFlags.PUBLIC.isSet(method.accessFlags) &&
                    AccessFlags.STATIC.isSet(method.accessFlags)
                }
                .forEach { it.addInstructions(0, RETURN_NULL_STRING) }

            mutableClassDef.methods
                .filter { method ->
                    method.name == "j0" &&
                    method.returnType == "Ljava/lang/String;" &&
                    method.parameterTypes.size == 1 &&
                    method.parameterTypes[0] == "Ljava/lang/String;" &&
                    AccessFlags.PUBLIC.isSet(method.accessFlags) &&
                    AccessFlags.STATIC.isSet(method.accessFlags)
                }
                .forEach { it.addInstructions(0, RETURN_EMPTY_STRING) }
        }
    }
}
