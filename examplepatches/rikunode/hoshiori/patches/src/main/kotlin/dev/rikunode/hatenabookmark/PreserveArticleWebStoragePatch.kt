package dev.rikunode.hatenabookmark

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

/**
 * Preserve user-selected article-site preferences by default, unless disabled.
 * The original 5.80 WebViewActivity clears *all* WebView cookies on destroy;
 * BookmarkApplication starts a dedicated WebStorage.deleteAllData() thread on startup.
 *
 * Do not intercept explicit logout, user-requested data clearing, or alter CookieManager
 * configuration. Both hooks are guarded against the actual original DEX layouts.
 */
@Suppress("unused")
val preserveArticleWebStoragePatch = bytecodePatch(
    name = "Preserve article WebView cookies and storage",
    description = "Optionally retain website preferences after closing articles and restarting the app; affects all article sites.",
    default = true,
) {
    compatibleWith(
        Compatibility(
            name = "Hatena Bookmark",
            packageName = "com.hatena.android.bookmark",
            apkFileType = ApkFileType.APK,
            appIconColor = 0x2A9BD6,
            targets = listOf(AppTarget(version = "5.80", versionCode = 58000)),
        )
    )

    val preserveArticleWebStorage by booleanOption(
        key = "preserveArticleWebStorage",
        default = true,
        title = "Preserve article website preferences",
        description = "Keep cookies and website storage across article closes and app restarts. All article websites may retain login and tracking data.",
    )

    dependsOn(hoshioriSettingsEntryPatch)

    execute {
        if (preserveArticleWebStorage != true) return@execute

        fun findGuardedCall(
            className: String,
            methodName: String,
            parameters: List<String>,
            registerCount: Int,
            insnsSize: Int,
            targetReference: String,
            requiredOffset: Int,
            opcode: Opcode,
        ): Pair<String, Int> {
            val cls = classDefBy(className)
            val method = cls.methods.singleOrNull {
                it.name == methodName &&
                    it.parameterTypes.map(CharSequence::toString) == parameters &&
                    it.returnType == "V"
            } ?: throw PatchException("Missing $className.$methodName")
            val impl = method.implementation ?: throw PatchException("Missing code in $methodName")
            val original = impl.instructions.toList()
            if (impl.registerCount != registerCount ||
                original.sumOf { it.codeUnits } != insnsSize
            ) throw PatchException("Hatena 5.80 $methodName DEX layout guard failed")
            var offset = 0
            val matches = original.mapIndexedNotNull { index, instruction ->
                val here = offset
                offset += instruction.codeUnits
                if (here == requiredOffset &&
                    instruction.opcode == opcode &&
                    (instruction as? ReferenceInstruction)?.reference?.toString() == targetReference
                ) index else null
            }
            if (matches.size != 1 || original.count {
                    it.opcode == opcode &&
                        (it as? ReferenceInstruction)?.reference?.toString() == targetReference
                } != 1
            ) throw PatchException("Hatena 5.80 $methodName call-site guard failed")
            return className to matches.single()
        }

        val destroy = findGuardedCall(
            "Lcom/hatena/android/bookmark/presentation/activity/WebViewActivity;",
            "onDestroy", emptyList(), 4, 39,
            "Lcom/hatena/android/bookmark/presentation/viewmodel/WebViewViewModel;->clearWebViewCookie()V",
            0x23, Opcode.INVOKE_VIRTUAL,
        )
        val startup = findGuardedCall(
            "Lcom/hatena/android/bookmark/BookmarkApplication;",
            "onCreate", emptyList(), 5, 170,
            "Ljava/lang/Thread;->start()V",
            0x60, Opcode.INVOKE_VIRTUAL,
        )

        // Keep both original calls, but execute them only when the in-app setting
        // is OFF. Existing cookies are not immediately deleted when toggling OFF.
        mutableClassDefBy(destroy.first).methods.single {
            it.name == "onDestroy" && it.parameterTypes.isEmpty()
        }.apply {
            replaceInstruction(destroy.second, "nop")
            addInstructionsWithLabels(destroy.second, """
                invoke-static { p0 }, Ldev/rikunode/settings/HoshioriRuntime;->preserveWebStorage(Landroid/content/Context;)Z
                move-result v1
                if-nez v1, :skip_delete
                invoke-virtual { v0 }, Lcom/hatena/android/bookmark/presentation/viewmodel/WebViewViewModel;->clearWebViewCookie()V
                :skip_delete
                nop
            """.trimIndent())
        }
        mutableClassDefBy(startup.first).methods.single {
            it.name == "onCreate" && it.parameterTypes.isEmpty()
        }.apply {
            replaceInstruction(startup.second, "nop")
            addInstructionsWithLabels(startup.second, """
                invoke-static { p0 }, Ldev/rikunode/settings/HoshioriRuntime;->preserveWebStorage(Landroid/content/Context;)Z
                move-result v1
                if-nez v1, :skip_delete
                invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
                :skip_delete
                nop
            """.trimIndent())
        }
    }
}
