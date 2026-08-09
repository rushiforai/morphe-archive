package com.p1.mobile.putong.data

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

private const val RETURN_TRUE = """
    const/4 v0, 0x1
    return v0
"""

private const val RETURN_ZERO_INT = """
    const/4 v0, 0x0
    return v0
"""

private const val RETURN_ZERO_DOUBLE = """
    const-wide/16 v0, 0x0
    return-wide v0
"""

private const val RETURN_ZERO_LONG = """
    const-wide/16 v0, 0x0
    return-wide v0
"""

private const val RETURN_EMPTY_STRING = """
    const-string v0, ""
    return-object v0
"""

private const val RETURN_PARAM_INT = """
    move v0, p2
    return v0
"""

@Suppress("unused")
@JvmField
val remoteConfigOverridePatch = bytecodePatch(
    name = "Remote Config Override",
    description = "Override remote configuration values to control feature flags and bypass A/B testing",
    default = true,
) {
    compatibleWith(tantanCompatibility)
    execute {
        classDefByOrNull("Lcom/p1/mobile/putong/remote_config/RemoteConfig;")?.let { classDef ->
            val mutableClassDef = mutableClassDefBy(classDef)

            mutableClassDef.methods
                .filter {
                    it.name == "s" &&
                    it.returnType == "Z" &&
                    it.parameterTypes.size == 1 && it.parameterTypes[0] == "Ljava/lang/String;" &&
                    AccessFlags.PUBLIC.isSet(it.accessFlags)
                }
                .forEach { it.addInstructions(0, RETURN_TRUE) }

            mutableClassDef.methods
                .filter {
                    it.name == "w" &&
                    it.returnType == "D" &&
                    it.parameterTypes.size == 1 && it.parameterTypes[0] == "Ljava/lang/String;" &&
                    AccessFlags.PUBLIC.isSet(it.accessFlags)
                }
                .forEach { it.addInstructions(0, RETURN_ZERO_DOUBLE) }

            mutableClassDef.methods
                .filter {
                    it.name == "y" &&
                    it.returnType == "I" &&
                    it.parameterTypes.size == 1 && it.parameterTypes[0] == "Ljava/lang/String;" &&
                    AccessFlags.PUBLIC.isSet(it.accessFlags)
                }
                .forEach { it.addInstructions(0, RETURN_ZERO_INT) }

            mutableClassDef.methods
                .filter {
                    it.name == "z" &&
                    it.returnType == "I" &&
                    it.parameterTypes.size == 2 &&
                    it.parameterTypes[0] == "Ljava/lang/String;" && it.parameterTypes[1] == "I" &&
                    AccessFlags.PUBLIC.isSet(it.accessFlags)
                }
                .forEach { it.addInstructions(0, RETURN_PARAM_INT) }

            mutableClassDef.methods
                .filter {
                    it.name == "F" &&
                    it.returnType == "Ljava/lang/String;" &&
                    it.parameterTypes.size == 1 && it.parameterTypes[0] == "Ljava/lang/String;" &&
                    AccessFlags.PUBLIC.isSet(it.accessFlags)
                }
                .forEach { it.addInstructions(0, RETURN_EMPTY_STRING) }

            mutableClassDef.methods
                .filter {
                    it.name == "A" &&
                    it.returnType == "J" &&
                    it.parameterTypes.size == 1 && it.parameterTypes[0] == "Ljava/lang/String;" &&
                    AccessFlags.PUBLIC.isSet(it.accessFlags)
                }
                .forEach { it.addInstructions(0, RETURN_ZERO_LONG) }
        }
    }
}
