package app.morphe.patches.all.theme

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.mutableClassDefByOrNull
import app.morphe.patcher.util.findMutableMethodOf
import app.morphe.patcher.util.returnEarly

private const val NIGHT_YES = 2  // AppCompatDelegate.MODE_NIGHT_YES
private val AMOLED_FLAG_RE = Regex(
    "^(is|get|has|should).*(pure.?black|amoled|black.?theme|true.?black|dark.?amoled)",
    RegexOption.IGNORE_CASE,
)

@Suppress("unused")
val forceDarkPatch = bytecodePatch(
    name = "Force dark / AMOLED theme",
    description = "Forces AppCompat night mode to YES and (optionally) flips AMOLED/pure-black flags. " +
        "Covers AppCompat/Material apps; Jetpack Compose themes are not affected.",
    default = false,
) {
    val amoled by booleanOption(
        key = "amoled", default = true,
        title = "Enable AMOLED / pure-black",
        description = "Also force isPureBlack/isAmoled-style flags to true (best-effort).",
    )

    execute {
        // AppCompat night-mode force.
        mutableClassDefByOrNull("Landroidx/appcompat/app/AppCompatDelegate;")?.methods?.forEach { m ->
            when (m.name) {
                "getDefaultNightMode" -> m.returnEarly(NIGHT_YES)
                "setDefaultNightMode", "setLocalNightMode" -> if (m.returnType == "V") m.returnEarly()
            }
        }

        if (amoled == true) {
            classDefForEach { classDef ->
                val targets = classDef.methods.filter { it.returnType == "Z" && AMOLED_FLAG_RE.matches(it.name) }
                if (targets.isEmpty()) return@forEach
                val mc = mutableClassDefBy(classDef)
                targets.forEach { mc.findMutableMethodOf(it).returnEarly(true) }
            }
        }
    }
}