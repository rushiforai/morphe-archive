package app.plyrs1.patches.com_gajihub_app

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.plyrs1.patches.shared.Constants.COMPATIBILITY_GAJIHUB
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
@Suppress("unused")
val bypassMockLocationPatch = bytecodePatch(
    name = "Bypass Mock Location",
    description = "Bypasses mock location and emulator detection in GajiHub by neutralizing " +
            "Location.isFromMockProvider() flags in React Native location bridges, forcing " +
            "Build.TYPE user checks to true, and disabling emulator detection in RNDeviceInfo.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GAJIHUB)

    execute {
        // 1. In LocationSerializationHelper (i3/i;->i), replace the boolean value for "mocked"
        // LocationSerializationFingerprint serializes:
        //   invoke-virtual {p0}, Landroid/location/Location;->isFromMockProvider()Z
        //   move-result p0
        //   invoke-interface {v0, v1, p0}, Lcom/facebook/react/bridge/WritableMap;->putBoolean(Ljava/lang/String;Z)V
        // 1. In LocationSerializationHelper (i3/i;->i), force mocked register to 0 immediately after move-result
        LocationSerializationFingerprint.method.let { method ->
            val instructions = method.instructions
            for ((index, instr) in instructions.withIndex()) {
                if (instr is ReferenceInstruction && (instr.reference as? MethodReference)?.name == "isFromMockProvider") {
                    val moveResultIndex = index + 1
                    val moveResultInstr = instructions[moveResultIndex]
                    if (moveResultInstr is OneRegisterInstruction) {
                        val reg = moveResultInstr.registerA
                        method.addInstructions(moveResultIndex + 1, "const/4 v$reg, 0x0")
                    }
                }
            }
        }

        // 2. In MapViewLocationChangeFingerprint (com/rnmaps/maps/z$k;->a), force isFromMockProvider to 0
        MapViewLocationChangeFingerprint.method.let { method ->
            val instructions = method.instructions
            for ((index, instr) in instructions.withIndex()) {
                if (instr is ReferenceInstruction && (instr.reference as? MethodReference)?.name == "isFromMockProvider") {
                    val moveResultIndex = index + 1
                    val moveResultInstr = instructions[moveResultIndex]
                    if (moveResultInstr is OneRegisterInstruction) {
                        val reg = moveResultInstr.registerA
                        method.addInstructions(moveResultIndex + 1, "const/4 v$reg, 0x0")
                    }
                }
            }
        }

        // 3. In BuildTypeCheckFingerprint (C6/h;->b()Z), return true (0x1) immediately
        BuildTypeCheckFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // 4. In RNDeviceModuleIsEmulatorSyncFingerprint (isEmulatorSync()Z), return false (0x0)
        RNDeviceModuleIsEmulatorSyncFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )

        // 5. In RNDeviceModuleIsEmulatorFingerprint (isEmulator(Promise)V), resolve with Boolean.FALSE
        RNDeviceModuleIsEmulatorFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                invoke-interface {p1, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
                return-void
            """
        )

        // 6. In SoLoader SysUtil.j(), return ["arm64-v8a"] for ARM translation in x86_64 emulators
        SoLoaderGetSupportedAbisFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                new-array v0, v0, [Ljava/lang/String;
                const/4 v1, 0x0
                const-string v2, "arm64-v8a"
                aput-object v2, v0, v1
                return-object v0
            """
        )

        // 7. In OfflineLocationModule.isMock(Location), return false (0x0) (v2.0.14+)
        OfflineLocationIsMockFingerprint.methodOrNull?.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )
    }
}
