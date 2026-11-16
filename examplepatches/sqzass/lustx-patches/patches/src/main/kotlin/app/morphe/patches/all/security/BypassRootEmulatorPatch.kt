package app.morphe.patches.all.security

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.util.findMutableMethodOf
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method

private val ROOT_RE = Regex(
    "^(is|has|check|detect|verify|test|find|look|scan)" +
        ".*(root|magisk|superuser|supersu|kernelsu)",
    RegexOption.IGNORE_CASE,
)

private val SU_RE = Regex(
    "^(is|has|check|detect|verify|test|find|look|scan).*Su(?![a-z])",
)

private val EMU_RE = Regex(
    "^(is|has|check|detect|verify|test|find|look|scan)" +
        ".*(emulator|qemu|genymotion|bluestacks|virtualbox|vmware|ldplayer|androidstudio)",
    RegexOption.IGNORE_CASE,
)

private val EMU_TOKEN_RE = Regex(
    "^(is|has|check|detect|verify|test|find|look|scan).*(Nox|Memu)(?![a-z])",
)

private val LIB_PREFIXES = listOf(
    "Landroidx/", "Landroid/", "Lkotlin/", "Lkotlinx/",
    "Lcom/google/android/", "Lokhttp3/", "Lokio/", "Lretrofit2/",
    "Lcom/bumptech/", "Lcom/squareup/", "Ljava/", "Ljavax/",
)

private fun isLibraryClass(type: String) = LIB_PREFIXES.any(type::startsWith)

private fun shouldNoOp(m: Method): Boolean {
    if (m.implementation == null) return false

    val name = m.name
    val ret = m.returnType
    if (ret != "Z" && ret != "V") return false

    return ROOT_RE.matches(name) ||
        SU_RE.matches(name) ||
        EMU_RE.matches(name) ||
        EMU_TOKEN_RE.matches(name)
}

private fun processClass(classDef: ClassDef) {
    if (isLibraryClass(classDef.type)) return

    val targets = classDef.methods.filter(::shouldNoOp)
    if (targets.isEmpty()) return

    val mc = mutableClassDefBy(classDef)
    targets.forEach { m ->
        val mm = mc.findMutableMethodOf(m)
        when (m.returnType) {
            "Z" -> mm.returnEarly(false)
            "V" -> mm.returnEarly()
        }
    }
}

@Suppress("unused")
val bypassRootEmulatorPatch = bytecodePatch(
    name = "Bypass root / emulator detection",
    description = "Forces common root and emulator detection methods to report clean. " +
        "Covers Java/Kotlin-level checks in app code; library packages and native " +
        "(.so) detection are not affected.",
    default = false,
) {
    execute {
        classDefForEach(::processClass)
    }
}
