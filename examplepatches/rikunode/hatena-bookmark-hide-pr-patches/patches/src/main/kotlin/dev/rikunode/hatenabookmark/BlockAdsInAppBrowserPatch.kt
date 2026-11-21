package dev.rikunode.hatenabookmark

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val WEBVIEW_CLIENT =
    "Lcom/hatena/android/bookmark/extensions/WebViewExtensionsKt\$setupView\$2;"
private const val SUPER_CLIENT = "Landroid/webkit/WebViewClient;"
private const val HELPER = "Ldev/rikunode/adblock/AdBlockHelper;"

/** Only Hatena Bookmark 5.80 / 58000. In-app article WebView only. */
@Suppress("unused")
val blockAdsInAppBrowserPatch = bytecodePatch(
    name = "Block ads in in-app article browser",
    description = "Block list-based ad subrequests and hide safe ad containers in the article WebView.",
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
    val blockInAppBrowserAds by booleanOption(
        key = "blockInAppBrowserAds",
        default = true,
        title = "Block in-app browser ads",
        description = "Block ad hosts and insert minimal ad-hiding CSS in article pages.",
    )
    val updateAdBlockLists by booleanOption(
        key = "updateAdBlockLists",
        default = true,
        title = "Automatically update ad-block lists",
        description = "Update the local snapshot from the repository at most once per 24 hours.",
    )

    extendWith("extensions/adblock.mpe")

    execute {
        if (blockInAppBrowserAds == false) return@execute
        val cls = classDefBy(WEBVIEW_CLIENT)
        if (cls.type != WEBVIEW_CLIENT || cls.superclass != SUPER_CLIENT) {
            throw PatchException("Hatena 5.80 article WebView class/superclass guard failed")
        }
        if (cls.methods.any { it.name == "shouldInterceptRequest" }) {
            throw PatchException("Hatena article WebView already overrides shouldInterceptRequest")
        }

        val finished = cls.methods.singleOrNull {
            it.name == "onPageFinished" &&
                it.parameterTypes.map(CharSequence::toString) ==
                    listOf("Landroid/webkit/WebView;", "Ljava/lang/String;") &&
                it.returnType == "V"
        } ?: throw PatchException("Hatena article onPageFinished signature guard failed")
        val orig = finished.implementation
            ?: throw PatchException("Hatena onPageFinished has no code")
        val instructions = orig.instructions.toList()
        if (orig.registerCount != 10 || instructions.sumOf { it.codeUnits } != 82 ||
            instructions.count { it.opcode == Opcode.RETURN_VOID } != 1 ||
            instructions.lastOrNull()?.opcode != Opcode.RETURN_VOID
        ) {
            throw PatchException("Hatena onPageFinished register/code_item/return guard failed")
        }

        // p1 (v8) is a WebView only until the original code reuses v8 for
        // WebViewActivity and SimpleUriIdlingResource. Inject immediately after
        // the superclass callback, before that first overwrite.
        val superFinished = instructions.getOrNull(4)
        if (superFinished?.opcode != Opcode.INVOKE_SUPER ||
            (superFinished as? ReferenceInstruction)?.reference?.toString() !=
                "Landroid/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V"
        ) {
            throw PatchException("Hatena onPageFinished superclass call location guard failed")
        }

        val mutable = mutableClassDefBy(WEBVIEW_CLIENT)
        val existing = mutable.methods.single {
            it.name == "onPageFinished" &&
                it.parameterTypes.map(CharSequence::toString) ==
                    listOf("Landroid/webkit/WebView;", "Ljava/lang/String;")
        }

        // At index 5, p1 (v8) is still the article WebView; v0 is scratch.
        existing.addInstructions(
            5,
            """
                const/4 v0, ${if (updateAdBlockLists == false) "0x0" else "0x1"}
                invoke-static { p1, v0 }, ${HELPER}->injectCss(Landroid/webkit/WebView;Z)V
            """.trimIndent(),
        )

        // New virtual method: null from the helper means allow via the superclass.
        // The helper internally catches Throwable and returns null on all failures.
        val intercept = ImmutableMethod(
            WEBVIEW_CLIENT,
            "shouldInterceptRequest",
            listOf(
                ImmutableMethodParameter("Landroid/webkit/WebView;", null, null),
                ImmutableMethodParameter("Landroid/webkit/WebResourceRequest;", null, null),
            ),
            "Landroid/webkit/WebResourceResponse;",
            AccessFlags.PUBLIC.value,
            null,
            null,
            ImmutableMethodImplementation(4, emptyList(), emptyList(), emptyList()),
        ).toMutable()
        intercept.addInstructions(
            0,
            """
                const/4 v0, ${if (updateAdBlockLists == false) "0x0" else "0x1"}
                invoke-static { p1, p2, v0 }, ${HELPER}->intercept(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Z)Landroid/webkit/WebResourceResponse;
                move-result-object v0
                if-eqz v0, :allow_request
                return-object v0
                :allow_request
                invoke-super { p0, p1, p2 }, ${SUPER_CLIENT}->shouldInterceptRequest(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
                move-result-object v0
                return-object v0
            """.trimIndent(),
        )
        if (!mutable.methods.add(intercept)) {
            throw PatchException("Could not append the in-app WebView intercept method")
        }
    }
}
