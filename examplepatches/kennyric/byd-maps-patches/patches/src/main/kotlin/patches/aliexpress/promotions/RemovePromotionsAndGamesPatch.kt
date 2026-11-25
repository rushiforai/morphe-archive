/*
 * Copyright (C) 2026 johninnl
 * SPDX-License-Identifier: GPL-3.0-only
 */
package patches.aliexpress.promotions

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.opcode
import app.morphe.patcher.util.findInstructionIndicesReversedOrThrow
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import patches.aliexpress.descriptor
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.matchSingle
import app.morphe.patcher.util.smali.ExternalLabel
import patches.aliexpress.ALIEXPRESS
import patches.aliexpress.replaceStub
import patches.aliexpress.ads.contentFilteringPatch
import patches.aliexpress.settings.markPatchApplied

private const val EXTENSION = "Lnl/johninnl/aliexpress/PromotionalContent;"
private const val DESCRIPTION = "Removes campaign and coupon offers, channel-only deals, registration gift prompts, games, coin offers and entries, and the Fast & Free tab."

private object RegistrationRetentionFingerprint : Fingerprint(
    definingClass = "Lcom/aliexpress/sky/user/ui/SkyShellActivity;",
    name = "onBackPressed",
    parameters = emptyList(),
    returnType = "V",
    strings = listOf("CAN_SHOW_RETAIN_USER_DIALOG"),
)

private object ParsedFloorsFingerprint : Fingerprint(
    // 8.180.1 reuses this constructor shape in three classes; pin the ANC floor container.
    definingClass = "Llt/c;",
    strings = listOf("headerList", "bodyList", "footerList"),
    name = "<init>",
    parameters = List(4) { "Ljava/util/List;" },
    returnType = "V",
)

private object ComponentDataFingerprint : Fingerprint(
    definingClass = "Llt/d;",
    name = "getData",
    parameters = emptyList(),
    returnType = "Lcom/taobao/android/ultron/common/model/IDMComponent;",
)

private object ComponentNameFingerprint : Fingerprint(
    definingClass = "Llt/d;", name = "getFloorName",
    parameters = emptyList(), returnType = "Ljava/lang/String;",
)

private object CoinEntryFactoryFingerprint : Fingerprint(
    definingClass = "Lcom/aliexpress/module/cointask/provider/CoinAccountServiceImpl;",
    name = "createCoinEntry",
    parameters = listOf("Landroid/app/Activity;", "Lcom/aliexpress/module/coinsdk/service/account/CoinEntryParams;"),
    returnType = "Lcom/aliexpress/module/coinsdk/service/account/CoinEntryHandle;",
)

private object AccountHeaderModelFingerprint : Fingerprint(
    definingClass = "Lcom/aliexpress/module/myae/anc/a;", name = "<init>",
    parameters = listOf("Lcom/taobao/android/ultron/common/model/IDMComponent;"), returnType = "V",
)

private class AccountHeaderLayoutGetter(name: String) : Fingerprint(
    definingClass = "Lcom/aliexpress/module/myae/anc/a;", name = name,
    parameters = emptyList(), returnType = "Ljava/lang/String;",
)

private object AccountHeaderContrastFingerprint : Fingerprint(
    definingClass = "Lcom/aliexpress/module/myae/anc/e0;", name = "s",
    parameters = listOf("Z"), returnType = "V",
)

private object PriceRootSetterFingerprint : Fingerprint(
    definingClass = "Lcom/aliexpress/android/moduleaidetail/ui/c0;",
    name = "setDataRoot",
    parameters = listOf("Lcom/alibaba/fastjson/JSONObject;"),
    returnType = "V",
)

private object PriceRenderFingerprint : Fingerprint(
    definingClass = "Lcom/aliexpress/android/moduleaidetail/ui/price/AIPriceProvider\$AIPriceHolder;",
    name = "Y", parameters = listOf("Lcom/alibaba/fastjson/JSONObject;"), returnType = "V",
)

private object RecommendationFloorFactoryFingerprint : Fingerprint(
    strings = listOf("floorKey", "tItemType", "ahe_"),
    parameters = listOf("Lcom/alibaba/fastjson/JSONObject;", "Ljava/lang/String;"),
    returnType = "Lwx/a;",
)

private object CampaignTabConfigFingerprint : Fingerprint(
    parameters = listOf("Lcom/aliexpress/android/home/base/vm/b;"),
    returnType = "V",
    strings = listOf("isHiddenChoiceTab", "badgeShowTimes"),
    custom = { _, classDef -> classDef.type.startsWith("Lcom/alibaba/aliexpresshd/home/manager/") },
)

private object CampaignTabVisibilityFingerprint : Fingerprint(
    definingClass = "Landroidx/appcompat/view/menu/MenuItemImpl;",
    name = "isVisible",
    parameters = emptyList(),
    returnType = "Z",
)

private class EntryRenderFingerprint(viewName: String) : Fingerprint(
    definingClass = "Lcom/aliexpress/android/aehome/modules/topBar/ui/$viewName;",
    name = "render",
    returnType = "V",
)

@Suppress("unused")
val removePromotionsAndGamesPatch = bytecodePatch(
    name = "Remove promotions and games",
    description = DESCRIPTION,
) {
    // The native wrapper descriptors were verified against this supplied build only.
    compatibleWith(Compatibility(
        name = requireNotNull(ALIEXPRESS.name),
        packageName = requireNotNull(ALIEXPRESS.packageName),
        apkFileType = ApkFileType.APK,
        signatures = ALIEXPRESS.signatures,
        targets = listOf(AppTarget(version = "8.180.1", versionCode = 80005998, minSdk = 21)),
    ))
    dependsOn(contentFilteringPatch)
    execute {
        markPatchApplied("removePromotionsAndGames", DESCRIPTION)
        RegistrationRetentionFingerprint.matchSingle().method.apply {
            val eligibilityReads = instructions.withIndex().filter { (_, instruction) ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                reference?.definingClass == "Landroid/content/SharedPreferences;" &&
                    reference.name == "getBoolean" && reference.returnType == "Z"
            }
            if (eligibilityReads.size != 1) throw PatchException("AliExpress registration eligibility read changed")
            val resultIndex = eligibilityReads.single().index + 1
            if (getInstruction<Instruction>(resultIndex).opcode != Opcode.MOVE_RESULT) {
                throw PatchException("AliExpress registration eligibility result changed")
            }
            val register = getInstruction<OneRegisterInstruction>(resultIndex).registerA
            addInstructionsAtControlFlowLabel(
                resultIndex + 1,
                """
                    invoke-static/range { v$register .. v$register }, $EXTENSION->retainRegistrationPromotion(Z)Z
                    move-result v$register
                """.trimIndent(),
            )
        }
        val componentGetter = ComponentDataFingerprint.matchSingle().method
        val componentName = ComponentNameFingerprint.matchSingle().method
        mutableClassDefBy(EXTENSION).replaceStub("componentName", 2, """
            instance-of v0, p0, ${componentName.definingClass}
            if-eqz v0, :none
            check-cast p0, ${componentName.definingClass}
            invoke-virtual { p0 }, ${descriptor(componentName)}
            move-result-object v0
            return-object v0
            :none
            const/4 v0, 0x0
            return-object v0
        """.trimIndent())
        mutableClassDefBy(EXTENSION).replaceStub(
            "componentData", 2,
            """
                instance-of v0, p0, ${componentGetter.definingClass}
                if-eqz v0, :none
                check-cast p0, ${componentGetter.definingClass}
                invoke-virtual { p0 }, ${componentGetter.definingClass}->getData()${componentGetter.returnType}
                move-result-object v0
                if-eqz v0, :none
                invoke-interface { v0 }, ${componentGetter.returnType}->getData()Lcom/alibaba/fastjson/JSONObject;
                move-result-object v0
                return-object v0
                :none
                const/4 v0, 0x0
                return-object v0
            """.trimIndent(),
        )
        ParsedFloorsFingerprint.matchSingle().method.apply {
            (1..3).forEach { parameter ->
                addInstruction(
                    0,
                    "invoke-static/range { p$parameter .. p$parameter }, $EXTENSION->filterComponentsIfEnabled(Ljava/util/List;)V",
                )
            }
        }
        AccountHeaderModelFingerprint.matchSingle().method.apply {
            findInstructionIndicesReversedOrThrow(opcode(Opcode.RETURN_VOID)).forEach { index ->
                addInstructionsAtControlFlowLabel(index,
                    "invoke-static/range { p0 .. p0 }, $EXTENSION->sanitizeAccountHeaderIfEnabled(Ljava/lang/Object;)V")
            }
        }
        // Reuse the app's registered native one-pixel floor and ordinary profile/sign-in toolbar.
        val headerLayoutFields = listOf("getFloorType", "getFloorName").map { name ->
            AccountHeaderLayoutGetter(name).matchSingle().method.instructions.mapNotNull { instruction ->
                if (instruction.opcode == Opcode.IGET_OBJECT) {
                    (instruction as? ReferenceInstruction)?.reference as? FieldReference
                } else null
            }.single { it.type == "Ljava/lang/String;" }
        }
        for (field in headerLayoutFields) {
            val definition = mutableClassDefBy(field.definingClass).fields.single { it.name == field.name }
            if (definition.accessFlags and com.android.tools.smali.dexlib2.AccessFlags.PUBLIC.value == 0) {
                throw PatchException("AliExpress Account layout field is no longer public")
            }
        }
        mutableClassDefBy(EXTENSION).replaceStub("useNativeAccountHeader", 2, """
            check-cast p0, Lcom/aliexpress/module/myae/anc/a;
            const-string v0, "native"
            iput-object v0, p0, ${descriptor(headerLayoutFields[0])}
            const-string v0, "myae_native_header"
            iput-object v0, p0, ${descriptor(headerLayoutFields[1])}
            return-void
        """.trimIndent())
        AccountHeaderContrastFingerprint.matchSingle().method.apply {
            addInstructionsWithLabels(0, """
                invoke-static {}, Lnl/johninnl/aliexpress/PatchSettings;->removePromotionsAndGames()Z
                move-result v0
                if-eqz v0, :original
                const/4 p1, 0x0
            """.trimIndent(), ExternalLabel("original", getInstruction(0)))
        }
        // Initial/cached price fields and later SKU updates all pass the same optional banner
        // object through the shared data-root setter; sanitize it there.
        PriceRootSetterFingerprint.matchSingle().method.addInstruction(0,
            "invoke-static/range { p1 .. p1 }, $EXTENSION->sanitizePriceBannerIfEnabled(Ljava/util/Map;)V")
        PriceRenderFingerprint.matchSingle().method.addInstruction(0,
            "invoke-static/range { p1 .. p1 }, $EXTENSION->sanitizePriceBannerIfEnabled(Ljava/util/Map;)V")
        RecommendationFloorFactoryFingerprint.matchSingle().method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static/range { p0 .. p0 }, $EXTENSION->isPromotionalFloorIfEnabled(Ljava/lang/String;)Z
                    move-result v0
                    if-eqz v0, :original
                    const/4 v0, 0x0
                    return-object v0
                """.trimIndent(),
                ExternalLabel("original", getInstruction(0)),
            )
        }
        // Both the base implementation and the optimized country decorator assign this field.
        // The decorator's override now stores through the inherited setter, so only methods
        // that still write the field directly reveal it; they must agree on one field.
        val campaignConfigMethods = CampaignTabConfigFingerprint.matchAll(2..2).map { it.method }
        val hiddenFields = campaignConfigMethods.mapNotNull { method ->
            val marker = method.instructions.indexOfFirst { instruction ->
                ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string == "isHiddenChoiceTab"
            }
            method.instructions.drop(marker + 1).mapNotNull { instruction ->
                if (instruction.opcode == Opcode.IPUT_OBJECT) {
                    (instruction as? ReferenceInstruction)?.reference as? FieldReference
                } else null
            }.firstOrNull { it.type == "Ljava/lang/Boolean;" }
        }
        if (hiddenFields.isEmpty()) throw PatchException("AliExpress campaign visibility field changed")
        val hiddenField = hiddenFields.first()
        if (hiddenFields.map(::descriptor).distinct().size != 1) {
            throw PatchException("AliExpress campaign decorators disagree on their visibility field")
        }
        mutableClassDefBy(EXTENSION).replaceStub("markCampaignTabHidden", 2, """
            check-cast p0, ${hiddenField.definingClass}
            sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
            iput-object v0, p0, ${descriptor(hiddenField)}
            return-void
        """.trimIndent())
        campaignConfigMethods.forEach { method ->
            method.findInstructionIndicesReversedOrThrow(opcode(Opcode.RETURN_VOID)).forEach { index ->
                method.addInstructionsAtControlFlowLabel(
                    index,
                    "invoke-static/range { p0 .. p0 }, $EXTENSION->applyCampaignTabPolicy(Ljava/lang/Object;)V",
                )
            }
        }
        CampaignTabVisibilityFingerprint.matchSingle().method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static/range { p0 .. p0 }, $EXTENSION->shouldHideCampaignTab(Landroid/view/MenuItem;)Z
                    move-result v0
                    if-eqz v0, :original
                    const/4 v0, 0x0
                    return v0
                """.trimIndent(),
                ExternalLabel("original", getInstruction(0)),
            )
        }
        listOf("CoinEntryView", "PigEntryView").forEach { viewName ->
            EntryRenderFingerprint(viewName).matchSingle().method.apply {
                addInstructionsWithLabels(
                    0,
                    """
                        invoke-static/range { p0 .. p0 }, $EXTENSION->hideEntryIfEnabled(Landroid/view/View;)Z
                        move-result v0
                        if-eqz v0, :original
                        return-void
                    """.trimIndent(),
                    ExternalLabel("original", getInstruction(0)),
                )
            }
        }
        // The native service explicitly permits a null handle; callers retain their normal UI.
        CoinEntryFactoryFingerprint.matchSingle().method.apply {
            addInstructionsWithLabels(0, """
                invoke-static {}, Lnl/johninnl/aliexpress/PatchSettings;->removePromotionsAndGames()Z
                move-result v0
                if-eqz v0, :original
                const/4 v0, 0x0
                return-object v0
            """.trimIndent(), ExternalLabel("original", getInstruction(0)))
        }
    }
}
