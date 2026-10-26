/*
 * TaobaoLingo — Japanese region English selector, server-model path.
 * SPDX-License-Identifier: GPL-3.0-only
 */
package dev.goodlight999.taobaolingo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val SITE_MODEL = "Lcom/taobao/android/editionswitcher/boarding/LocaleModel\$SiteLangModel;"
private const val LANG_MODEL = "Lcom/taobao/android/editionswitcher/boarding/LocaleModel\$LangModel;"

private val editionCompatibility = Compatibility(
    name = "Taobao",
    packageName = "com.taobao.taobao",
    apkFileType = ApkFileType.APK,
    targets = listOf(AppTarget(version = "10.66.30", isExperimental = true))
)

/**
 * Taobao parses the server-provided locale model in this callback and stores
 * it as LocaleModel.reqData. This fingerprint is version-pinned; index 87
 * is immediately after the reqData assignment in 10.66.30.
 */
private object EditionLocaleResponse : Fingerprint(
    definingClass = "Lcom/taobao/android/editionswitcher/api/EditionApi\$1;",
    name = "onSuccess",
    returnType = "V",
    parameters = listOf(
        "I",
        "Lmtopsdk/mtop/domain/MtopResponse;",
        "Lmtopsdk/mtop/domain/BaseOutDo;",
        "Ljava/lang/Object;"
    ),
    isStatic = false
)

/**
 * Adds a non-default en_US option to JP in both countryInfo and the current-country model if JP.
 * Does not force a language switch, select another region, or modify
 * network/edition language getters. Server acceptance of Japan+English is
 * not established and remains an on-device integration test.
 */
@Suppress("unused")
val japanEnglishServerPickerPatch = bytecodePatch(
    name = "TaobaoLingo: Enable English for Japan picker (experimental)",
    description = "Add English in Japan to the bundled locale choices and both server-side region collections.",
    default = false
) {
    compatibleWith(editionCompatibility)
    dependsOn(japanEnglishPickerPatch)
    execute {
        val method = EditionLocaleResponse.method
        val anchor = method.implementation?.instructions?.getOrNull(86)
        val anchorRef = (anchor as? ReferenceInstruction)?.reference?.toString()
        if (anchor?.opcode != Opcode.SPUT_OBJECT ||
            anchorRef != "Lcom/taobao/android/editionswitcher/boarding/LocaleModel;->reqData:Lcom/taobao/android/editionswitcher/boarding/LocaleModel;"
        ) {
            throw PatchException("Expected Taobao 10.66.30 LocaleModel.reqData assignment at instruction 86")
        }
        method.addInstructions(
            87,
            """
                const/4 v8, 0x0
                iget-object v9, v6, Lcom/taobao/android/editionswitcher/boarding/LocaleModel;->countryInfo:Ljava/util/List;
                if-eqz v9, :taobaolingo_current
                invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;
                move-result-object v9
                :taobaolingo_site_loop
                invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z
                move-result v10
                if-eqz v10, :taobaolingo_current
                invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;
                move-result-object v10
                check-cast v10, $SITE_MODEL
                iget-object v11, v10, $SITE_MODEL->site:Ljava/lang/String;
                const-string v13, "JP"
                invoke-virtual {v13, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v11
                if-eqz v11, :taobaolingo_site_loop
                goto :taobaolingo_process_site
                :taobaolingo_current
                const/4 v8, 0x1
                iget-object v10, v6, Lcom/taobao/android/editionswitcher/boarding/LocaleModel;->currentCountryInfo:$SITE_MODEL
                if-eqz v10, :taobaolingo_done
                iget-object v11, v10, $SITE_MODEL->site:Ljava/lang/String;
                const-string v13, "JP"
                invoke-virtual {v13, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v11
                if-eqz v11, :taobaolingo_done
                :taobaolingo_process_site
                iget-object v11, v10, $SITE_MODEL->langs:Ljava/util/List;
                if-eqz v11, :taobaolingo_finish_site
                invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;
                move-result-object v14
                :taobaolingo_lang_loop
                invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z
                move-result v13
                if-eqz v13, :taobaolingo_add
                invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;
                move-result-object v13
                check-cast v13, $LANG_MODEL
                iget-object v13, v13, $LANG_MODEL->lang:Ljava/lang/String;
                const-string v15, "en_US"
                invoke-virtual {v15, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v13
                if-nez v13, :taobaolingo_finish_site
                goto :taobaolingo_lang_loop
                :taobaolingo_add
                new-instance v14, $LANG_MODEL
                invoke-direct {v14}, $LANG_MODEL-><init>()V
                const-string v13, "en_US"
                iput-object v13, v14, $LANG_MODEL->lang:Ljava/lang/String;
                const-string v13, "English"
                iput-object v13, v14, $LANG_MODEL->langName:Ljava/lang/String;
                const/4 v13, 0x0
                iput-boolean v13, v14, $LANG_MODEL->defaultLang:Z
                invoke-interface {v11, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z
                :taobaolingo_finish_site
                if-eqz v8, :taobaolingo_current
                :taobaolingo_done
            """.trimIndent()
        )
    }
}
