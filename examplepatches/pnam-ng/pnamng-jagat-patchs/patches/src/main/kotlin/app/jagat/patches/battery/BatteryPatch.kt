package app.jagat.patches.battery

import app.jagat.patches.shared.Constants.COMPATIBILITY_JAGAT
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.mutableClassDefByOrNull
import app.morphe.patcher.patch.patch

private const val EXTENSION_CLASS = "Lapp/jagat/extension/BatteryOptimizer;"

@Suppress("unused")
val jagatBatteryPatch = patch(
    name = "Tối ưu pin & Giảm tải nền (Battery Optimization)",
    description = "Tự động hạn chế GPS polling liên tục khi tắt màn hình, tối ưu tần suất của LongTimeLocWorker.",
    default = true
) {
    compatibleWith(COMPATIBILITY_JAGAT)

    extendWith("extensions/extension.mpe")

    execute {
        mutableClassDefByOrNull("Lio/jagat/lite/map/location/LongTimeLocWorker;")?.let { workerClass ->
            workerClass.methods.firstOrNull { it.name == "doWork" }?.let { method ->
                method.addInstructions(
                    0,
                    """
                        invoke-virtual {p0}, Landroidx/work/ListenableWorker;->getApplicationContext()Landroid/content/Context;
                        move-result-object v0
                        invoke-static {v0}, $EXTENSION_CLASS;->shouldSkipBackgroundLocation(Landroid/content/Context;)Z
                        move-result v0
                        if-eqz v0, :cond_skip
                        invoke-static {}, Landroidx/work/ListenableWorker${'$'}Result;->success()Landroidx/work/ListenableWorker${'$'}Result;
                        move-result-object v0
                        return-object v0
                        :cond_skip
                    """
                )
            }
        }
    }
}
