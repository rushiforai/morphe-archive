package io.github.pengusto.patches.mihon

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.*
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import io.github.pengusto.patches.codeDigest

private const val manager = "Leu/kanade/tachiyomi/data/download/DownloadManager;"

/** Backport of Marc Went / Dunky13's 0L correction in Mihon PR #4182,
 * commit 07e5882033ae664b0abcca3f5a64dc6e3e59e212 (Apache-2.0).
 * Only the default category's boxed numeric type changes; no Hide/Unhide feature.
 */
@Suppress("unused")
val defaultCategoryDownloadsPatch = bytecodePatch(
    name = "Preserve excluded Default-category downloads",
    description = "Keep read chapter downloads when Default is excluded from deletion. Corrects the Default category's numeric ID without changing other deletion preferences. Official GitHub Mihon 0.21.3 ARM64 APK tested.",
    default = false,
) {
    compatibleWith(Compatibility(name = "Mihon", packageName = "app.mihon",
        targets = listOf(AppTarget(version = "0.21.3"))))
    execute {
        check(classDefBy(manager).codeDigest() ==
            "5dd3e964a2130e4e0ca7bc40dad5167f8ecbf989d4ffc7a1ffe3e388ac3c4368") {
            "Unsupported or already patched Mihon download manager. Use the original official GitHub 0.21.3 APK."
        }
        val owner = mutableClassDefBy(manager)
        val filter = owner.methods.single { it.name == "getChaptersToDelete" }
        val helper = MutableMethod(ImmutableMethod(manager, "penguinDefaultCategory", emptyList(),
            "Ljava/lang/Long;", AccessFlags.PRIVATE.value or AccessFlags.STATIC.value or AccessFlags.SYNTHETIC.value,
            emptySet(), emptySet(), ImmutableMethodImplementation(2, emptyList(), emptyList(), emptyList())))
        helper.addInstructions(0, """
            const-wide/16 v0, 0x0
            invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
            move-result-object v0
            return-object v0
        """.trimIndent())
        owner.methods.add(helper)
        // Guarded empty-category fallback originally constructs Integer(0) in v11.
        // Return a boxed Long without borrowing a live wide pair from the suspend method.
        filter.replaceInstruction(84, "invoke-static {}, $manager->penguinDefaultCategory()Ljava/lang/Long;")
        filter.replaceInstruction(85, "move-result-object v11")
        filter.replaceInstruction(86, "nop")
    }
}
