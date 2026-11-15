package app.morphe.patches.all.update

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.util.findMutableMethodOf
import app.morphe.patcher.util.returnEarly

private val VOID_RE =
    Regex(
        "^(show|display|prompt|request|trigger|enforce|block|require|redirect|navigateTo|start|launch)" +
            ".*(force|mandatory|compulsory|required)?.*(update|upgrade|version)$",
        RegexOption.IGNORE_CASE,
    )
private val BOOL_RE =
    Regex(
        "^(is|should|must|needs|can|has|was|get)" +
            ".*(force|mandatory|compulsory|required|update|upgrade)$",
        RegexOption.IGNORE_CASE,
    )

@Suppress("unused")
val forcedUpdateBypassPatch =
    bytecodePatch(
        name = "Forced-update bypass",
        description =
        "Neuters in-app forced-update gates (dialogs, blocking checks, version prompts). " +
            "Works on apps that keep readable method names; fully-obfuscated apps need per-app fingerprints.",
        default = false,
    ) {
        execute {
            classDefForEach { classDef ->
                val hit =
                    classDef.methods.any { m ->
                        (m.returnType == "V" && VOID_RE.matches(m.name)) ||
                            (m.returnType == "Z" && BOOL_RE.matches(m.name))
                    }
                if (!hit) return@classDefForEach
                val mc = mutableClassDefBy(classDef)
                classDef.methods.forEach { m ->
                    when {
                        m.returnType == "V" && VOID_RE.matches(m.name) ->
                            mc.findMutableMethodOf(m).returnEarly()
                        m.returnType == "Z" && BOOL_RE.matches(m.name) ->
                            mc.findMutableMethodOf(m).returnEarly(false)
                    }
                }
            }
        }
    }
