/*
 * TaobaoLingo — experimental Taobao localization patches for Morphe.
 * SPDX-License-Identifier: GPL-3.0-only
 */
package dev.goodlight999.taobaolingo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch

private const val LANGUAGE = "Lcom/alibaba/ability/localization/constants/Language;"
private const val LOCALIZATION = "Lcom/alibaba/ability/localization/Localization;"

private val taobao = Compatibility(
    name = "Taobao",
    packageName = "com.taobao.taobao",
    apkFileType = ApkFileType.APK,
    targets = listOf(AppTarget(version = "10.66.30", isExperimental = true))
)

private object LocalizedStringLookup : Fingerprint(
    definingClass = LOCALIZATION,
    name = "q",
    returnType = "Ljava/lang/String;",
    parameters = listOf("I"),
    isStatic = true
)

private object NamedStringLookup : Fingerprint(
    definingClass = LOCALIZATION,
    name = "r",
    returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/lang/String;"),
    isStatic = true
)


/**
 * Localized Resources.getString() for the 909 calls to Localization.q(int).
 * Creates a separate configuration context rather than modifying shared
 * Resources or reporting a false locale to the network, edition or login SDKs.
 *
 * Uses only three existing local registers in q(int) (5 registers total,
 * one parameter; v0-v3 are locals in Taobao 10.66.30).
 * Fails through to the original implementation if the app context is absent.
 * Named lookups through Localization.r(String) are handled the same way.
 * This does not translate remote JSON, WebView, or images.
 */
@Suppress("unused")
val englishResourceStringsPatch = bytecodePatch(
    name = "TaobaoLingo: English resource strings",
    description = "English ID-based and named string resources without modifying networking or regional locale (experimental).",
    default = false
) {
    compatibleWith(taobao)
    execute {
        LocalizedStringLookup.method.addInstructions(
            0,
            """
                sget-object v0, Lcom/alibaba/ability/localization/LocalizationManager;->INSTANCE:Lcom/alibaba/ability/localization/LocalizationManager;
                invoke-virtual {v0}, Lcom/alibaba/ability/localization/LocalizationManager;->b()Landroid/content/Context;
                move-result-object v0
                if-eqz v0, :taobaolingo_original
                invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
                move-result-object v1
                invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;
                move-result-object v1
                new-instance v2, Landroid/content/res/Configuration;
                invoke-direct {v2, v1}, Landroid/content/res/Configuration;-><init>(Landroid/content/res/Configuration;)V
                sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;
                invoke-virtual {v2, v1}, Landroid/content/res/Configuration;->setLocale(Ljava/util/Locale;)V
                invoke-virtual {v0, v2}, Landroid/content/Context;->createConfigurationContext(Landroid/content/res/Configuration;)Landroid/content/Context;
                move-result-object v0
                invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
                move-result-object v0
                invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;
                move-result-object v0
                return-object v0
                :taobaolingo_original
            """.trimIndent()
        )
        NamedStringLookup.method.addInstructions(
            0,
            """
                sget-object v0, Lcom/alibaba/ability/localization/LocalizationManager;->INSTANCE:Lcom/alibaba/ability/localization/LocalizationManager;
                invoke-virtual {v0}, Lcom/alibaba/ability/localization/LocalizationManager;->b()Landroid/content/Context;
                move-result-object v0
                if-eqz v0, :taobaolingo_original
                invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
                move-result-object v1
                invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;
                move-result-object v1
                new-instance v2, Landroid/content/res/Configuration;
                invoke-direct {v2, v1}, Landroid/content/res/Configuration;-><init>(Landroid/content/res/Configuration;)V
                sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;
                invoke-virtual {v2, v1}, Landroid/content/res/Configuration;->setLocale(Ljava/util/Locale;)V
                invoke-virtual {v0, v2}, Landroid/content/Context;->createConfigurationContext(Landroid/content/res/Configuration;)Landroid/content/Context;
                move-result-object v0
                invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
                move-result-object v1
                const-string v2, "string"
                invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
                move-result-object v3
                invoke-virtual {v1, p0, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
                move-result v2
                if-eqz v2, :taobaolingo_original
                invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;
                move-result-object v0
                return-object v0
                :taobaolingo_original
            """.trimIndent()
        )
    }
}

