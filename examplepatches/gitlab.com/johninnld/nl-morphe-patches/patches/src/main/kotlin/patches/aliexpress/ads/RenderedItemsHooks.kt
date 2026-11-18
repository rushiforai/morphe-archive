/*
 * Copyright (C) 2026 johninnl
 * SPDX-License-Identifier: GPL-3.0-only
 */
package patches.aliexpress.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import app.morphe.patcher.util.matchSingle
import patches.aliexpress.descriptor
import patches.aliexpress.replaceStub

private const val RENDERED_ITEMS = "Lnl/johninnl/aliexpress/RenderedItems;"
private const val MODEL = "Lcom/aliexpress/anc/core/container/pojo/IAncItemModel;"
// 8.180.1 renamed the search view models: l9.a -> w9.a, su.a -> wx.a and the
// product parser moved from floor/product/e.H0 to floor/product/d.P0.
private const val LEGACY_MODEL = "Lw9/a;"
private const val PRODUCT_BEAN = "Lcom/alibaba/aliexpress/android/search/core/ahe/srp/AHEListBean;"
private const val MODERN_RAW = "Lwx/a;"
private const val MODERN_PRODUCT = "Lcom/aliexpress/android/aesearch/common/floor/product/d;"
private const val JSON_OBJECT = "Lcom/alibaba/fastjson/JSONObject;"
private const val COMPONENT = "Lcom/taobao/android/ultron/common/model/IDMComponent;"

private object ItemDataGetter : Fingerprint(
    definingClass = MODEL, name = "getData", parameters = emptyList(), returnType = "Ljava/lang/Object;",
)
private object ItemNameGetter : Fingerprint(
    definingClass = MODEL, name = "getFloorName", parameters = emptyList(), returnType = "Ljava/lang/String;",
)
private object ComponentDataGetter : Fingerprint(
    definingClass = COMPONENT, name = "getData", parameters = emptyList(), returnType = "Lcom/alibaba/fastjson/JSONObject;",
)
private object LegacyBeanGetter : Fingerprint(
    definingClass = LEGACY_MODEL, name = "getBean", parameters = emptyList(),
    returnType = "Lcom/alibaba/aliexpress/android/search/core/net/bean/BaseSearchBean;",
)
private object LegacyBeanTypeGetter : Fingerprint(
    definingClass = "Lcom/alibaba/aliexpress/android/search/core/net/bean/BaseSearchBean;",
    name = "getTypeName", parameters = emptyList(), returnType = "Ljava/lang/String;",
)
private object ProductDataGetter : Fingerprint(
    definingClass = PRODUCT_BEAN, name = "getModel", parameters = emptyList(), returnType = JSON_OBJECT,
)
private object ProductPaidGetter : Fingerprint(
    definingClass = PRODUCT_BEAN, name = "getP4pObj", parameters = emptyList(), returnType = JSON_OBJECT,
)
private object ModernRawSetter : Fingerprint(
    definingClass = MODERN_RAW, name = "C", parameters = listOf(JSON_OBJECT), returnType = "V",
)
private object ModernProductParser : Fingerprint(
    definingClass = MODERN_PRODUCT, name = "P0", parameters = listOf(JSON_OBJECT), returnType = "V",
    strings = listOf("p4p"),
)
private object ModernViewTypeGetter : Fingerprint(
    definingClass = MODERN_RAW, parameters = emptyList(), returnType = "Ljava/lang/String;",
    custom = { method, _ -> method.accessFlags and AccessFlags.ABSTRACT.value != 0 },
)
private object AppBarSubmission : Fingerprint(
    definingClass = "Lcom/aliexpress/anc/core/container/solution/AncAppBarLayout;", name = "setData",
    parameters = listOf("Ljava/util/List;", "Ljava/util/List;", "Ldt/a;"),
    returnType = "V",
)

private fun jsonFieldStoredBy(method: Method, afterString: String? = null): FieldReference {
    val instructions = method.implementation?.instructions?.toList()
        ?: throw PatchException("AliExpress product parser has no implementation")
    val start = if (afterString == null) -1 else instructions.indexOfFirst { instruction ->
        ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string == afterString
    }.also { if (it < 0) throw PatchException("AliExpress product parser marker changed") }
    return instructions.drop(start + 1).mapNotNull { instruction ->
        if (instruction.opcode == Opcode.IPUT_OBJECT) {
            (instruction as? ReferenceInstruction)?.reference as? FieldReference
        } else null
    }.firstOrNull { it.type == JSON_OBJECT }
        ?: throw PatchException("AliExpress product model field changed")
}

private class NativeListSetter(name: String) : Fingerprint(
    definingClass = "Lcom/aliexpress/anc/core/container/ANCContainerView;", name = name,
    parameters = listOf("Ljava/util/List;"), returnType = "V",
)

internal fun BytecodePatchContext.installRenderedItemFiltering() {
    // Keep the previously released 8.180.0 path unchanged until its native bindings are checked.
    if (packageMetadata.versionName != "8.180.1" || packageMetadata.versionCode != "80005998") return
    val data = ItemDataGetter.matchSingle().method
    val name = ItemNameGetter.matchSingle().method
    val component = ComponentDataGetter.matchSingle().method
    val bean = LegacyBeanGetter.matchSingle().method
    val beanType = LegacyBeanTypeGetter.matchSingle().method
    val product = ProductDataGetter.matchSingle().method
    val paid = ProductPaidGetter.matchSingle().method
    val modernViewType = ModernViewTypeGetter.matchSingle().method
    val rawField = jsonFieldStoredBy(ModernRawSetter.matchSingle().method)
    val paidField = jsonFieldStoredBy(ModernProductParser.matchSingle().method, "p4p")
    for (field in listOf(rawField, paidField)) {
        val definition = mutableClassDefBy(field.definingClass).fields.single {
            it.name == field.name && it.type == field.type
        }
        if (definition.accessFlags and AccessFlags.PUBLIC.value == 0) {
            throw PatchException("AliExpress product field is no longer public")
        }
    }
    mutableClassDefBy(RENDERED_ITEMS).apply {
        replaceStub("itemData", 3, """
            instance-of v0, p0, Ljava/util/Map;
            if-eqz v0, :model
            check-cast p0, Ljava/util/Map;
            return-object p0
            :model
            instance-of v0, p0, $MODEL
            if-eqz v0, :none
            check-cast p0, $MODEL
            invoke-interface { p0 }, ${descriptor(data)}
            move-result-object v0
            instance-of v1, v0, Ljava/util/Map;
            if-nez v1, :map
            instance-of v1, v0, $COMPONENT
            if-eqz v1, :none
            check-cast v0, $COMPONENT
            invoke-interface { v0 }, ${descriptor(component)}
            move-result-object v0
            :map
            check-cast v0, Ljava/util/Map;
            return-object v0
            :none
            const/4 v0, 0x0
            return-object v0
        """.trimIndent())
        // The legacy presentation component is assigned in the view holder, after list submission.
        // Read the exact bean/model used by that view holder as well as the presentation fallback.
        replaceStub("productData", 3, """
            instance-of v0, p0, $LEGACY_MODEL
            if-eqz v0, :modern
            check-cast p0, $LEGACY_MODEL
            invoke-virtual { p0 }, ${descriptor(bean)}
            move-result-object v0
            instance-of v1, v0, $PRODUCT_BEAN
            if-eqz v1, :modern
            check-cast v0, $PRODUCT_BEAN
            invoke-virtual { v0 }, ${descriptor(product)}
            move-result-object v0
            return-object v0
            :modern
            instance-of v0, p0, ${rawField.definingClass}
            if-eqz v0, :none
            check-cast p0, ${rawField.definingClass}
            iget-object v0, p0, ${descriptor(rawField)}
            return-object v0
            :none
            const/4 v0, 0x0
            return-object v0
        """.trimIndent())
        replaceStub("isPaid", 3, """
            instance-of v0, p0, $LEGACY_MODEL
            if-eqz v0, :modern
            check-cast p0, $LEGACY_MODEL
            invoke-virtual { p0 }, ${descriptor(bean)}
            move-result-object v0
            instance-of v1, v0, $PRODUCT_BEAN
            if-eqz v1, :modern
            check-cast v0, $PRODUCT_BEAN
            invoke-virtual { v0 }, ${descriptor(paid)}
            move-result-object v0
            if-nez v0, :yes
            goto :none
            :modern
            instance-of v0, p0, ${paidField.definingClass}
            if-eqz v0, :none
            check-cast p0, ${paidField.definingClass}
            iget-object v0, p0, ${descriptor(paidField)}
            if-nez v0, :yes
            :none
            const/4 v0, 0x0
            return v0
            :yes
            const/4 v0, 0x1
            return v0
        """.trimIndent())
        replaceStub("itemName", 2, """
            instance-of v0, p0, $LEGACY_MODEL
            if-eqz v0, :model
            check-cast p0, $LEGACY_MODEL
            invoke-virtual { p0 }, ${descriptor(bean)}
            move-result-object v0
            if-eqz v0, :model
            invoke-virtual { v0 }, ${descriptor(beanType)}
            move-result-object v0
            return-object v0
            :model
            instance-of v0, p0, $MODERN_RAW
            if-eqz v0, :native
            check-cast p0, $MODERN_RAW
            invoke-virtual { p0 }, ${descriptor(modernViewType)}
            move-result-object v0
            return-object v0
            :native
            instance-of v0, p0, $MODEL
            if-eqz v0, :none
            check-cast p0, $MODEL
            invoke-interface { p0 }, ${descriptor(name)}
            move-result-object v0
            return-object v0
            :none
            const/4 v0, 0x0
            return-object v0
        """.trimIndent())
    }
    // Section metadata and section rendering have separate setters. Filter both so the
    // section-body submission cannot restore cards removed from the metadata list.
    val sectionSetters = setOf("setSectionList", "setSectionBody")
    for (methodName in listOf("setBody", "setTopSticky", "setBottomSticky") + sectionSetters) {
        val helper = if (methodName in sectionSetters) "filterSectionsIfEnabled" else "filterIfEnabled"
        NativeListSetter(methodName).matchSingle().method.addInstructions(0, """
            invoke-static/range { p1 .. p1 }, $RENDERED_ITEMS->$helper(Ljava/util/List;)Ljava/util/List;
            move-result-object p1
        """.trimIndent())
    }
    // Search's app-bar submits independent sticky/slide/collapsible model lists.
    AppBarSubmission.matchSingle().method.addInstructions(0, """
        invoke-static/range { p1 .. p1 }, $RENDERED_ITEMS->filterIfEnabled(Ljava/util/List;)Ljava/util/List;
        move-result-object p1
        invoke-static/range { p2 .. p2 }, $RENDERED_ITEMS->filterIfEnabled(Ljava/util/List;)Ljava/util/List;
        move-result-object p2
        invoke-static/range { p3 .. p3 }, $RENDERED_ITEMS->filterOneIfEnabled(Ljava/lang/Object;)Ljava/lang/Object;
        move-result-object p3
        check-cast p3, Ldt/a;
    """.trimIndent())
}
