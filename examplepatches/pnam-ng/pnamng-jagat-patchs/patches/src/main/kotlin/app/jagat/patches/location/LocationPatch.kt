package app.jagat.patches.location

import app.jagat.patches.shared.Constants.COMPATIBILITY_JAGAT
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.mutableClassDefByOrNull
import app.morphe.patcher.patch.patch

private const val EXTENSION_CLASS = "Lapp/jagat/extension/LocationHook;"

@Suppress("unused")
val jagatLocationPatch = patch(
    name = "Chỉnh sửa vị trí & Đóng băng toạ độ (Ghost Mode)",
    description = "Cho phép đóng băng toạ độ thực tế (Freeze) hoặc ghi đè toạ độ giả lập (Mock Location) ẩn danh.",
    default = true
) {
    compatibleWith(COMPATIBILITY_JAGAT)

    extendWith("extensions/extension.mpe")

    execute {
        mutableClassDefByOrNull("Lio/jagat/lite/map/location/LocationManage;")?.let { locClass ->
            locClass.methods.filter { it.name == "onLocationChanged" || it.name == "updateLocation" }.forEach { method ->
                method.addInstructions(
                    0,
                    """
                        invoke-static {p1}, $EXTENSION_CLASS;->onLocationChanged(Landroid/location/Location;)Landroid/location/Location;
                        move-result-object p1
                    """
                )
            }
        }
    }
}
