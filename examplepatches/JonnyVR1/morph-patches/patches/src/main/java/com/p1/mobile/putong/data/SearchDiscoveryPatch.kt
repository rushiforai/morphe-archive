package com.p1.mobile.putong.data

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

@Suppress("unused")
@JvmField
val searchDiscoveryPatch = bytecodePatch(
    name = "Search Discovery Enhancement",
    description = "Enhance discovery features by removing search limitations",
    default = true,
) {
    compatibleWith(tantanCompatibility)
    execute {
        classDefByOrNull("Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (!AccessFlags.STATIC.isSet(method.accessFlags)) return@forEach
                when {
                    method.name == "getRadiusAllowedMaximum" &&
                        method.parameterTypes.isEmpty() &&
                        method.returnType == "I" -> {
                        method.addInstructions(0, """
                            const v0, 0x30d40
                            return v0
                        """)
                    }
                    method.name == "getRadiusAllowedMinimum" &&
                        method.parameterTypes.isEmpty() &&
                        method.returnType == "I" -> {
                        method.addInstructions(0, """
                            const/4 v0, 0x0
                            return v0
                        """)
                    }
                    method.name == "getSearchAgeAllowedMaximum" &&
                        method.parameterTypes.isEmpty() &&
                        method.returnType == "I" -> {
                        method.addInstructions(0, """
                            const/16 v0, 0x64
                            return v0
                        """)
                    }
                    method.name == "getSearchAgeAllowedMinimum" &&
                        method.parameterTypes.isEmpty() &&
                        method.returnType == "I" -> {
                        method.addInstructions(0, """
                            const/16 v0, 0x12
                            return v0
                        """)
                    }
                }
            }
        }
    }
}
