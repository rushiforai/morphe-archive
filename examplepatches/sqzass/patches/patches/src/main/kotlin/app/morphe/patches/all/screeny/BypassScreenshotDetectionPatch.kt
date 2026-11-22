package app.morphe.patches.all.screeny

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.util.findMutableMethodOf
import app.morphe.patcher.util.returnEarly

@Suppress("unused")
val bypassScreenshotDetectionPatch = bytecodePatch(
    name = "Bypass screenshot detection",
    description = "Blinds MediaStore ContentObservers and screenshot FileObservers.",
    default = false,
) {
    val blockContentObservers by booleanOption(
        key = "blockContentObservers",
        default = true,
        title = "Block MediaStore observers",
        description = "No-ops onChange in ContentObserver subclasses. " +
            "May break apps that use observers for legitimate UI updates.",
    )
    val blockFileObservers by booleanOption(
        key = "blockFileObservers",
        default = true,
        title = "Block file observers",
        description = "No-ops onEvent in FileObserver subclasses (screenshot directory watchers).",
    )

    execute {
        classDefForEach { classDef ->
            val sc = classDef.superclass ?: return@classDefForEach
            val mc by lazy { mutableClassDefBy(classDef) }

            if (blockContentObservers == true && sc == "Landroid/database/ContentObserver;") {
                classDef.methods
                    .filter { it.name == "onChange" && it.returnType == "V" && it.implementation != null }
                    .forEach { mc.findMutableMethodOf(it).returnEarly() }
            }

            if (blockFileObservers == true && sc == "Landroid/os/FileObserver;") {
                classDef.methods
                    .filter { it.name == "onEvent" && it.returnType == "V" && it.implementation != null }
                    .forEach { mc.findMutableMethodOf(it).returnEarly() }
            }
        }
    }
}
