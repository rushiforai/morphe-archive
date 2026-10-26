/*
 * TaobaoLingo — native DinamicX UI label translation (Taobao 10.66.30).
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
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction

/**
 * These concrete widget classes were located by references to
 * DXButterTextWidgetNode / DXFastTextWidgetNode in classes6.dex.
 * Both have setText(CharSequence), 6 registers, and 2 input registers.
 * Their argument p1 is replaced ONLY for an exact known UI-label match.
 *
 * This affects native DinamicX text, including strings arriving from server
 * templates. It does not alter API requests, locale tags, item titles that do
 * not match the dictionary, or Android global Resources configuration.
 */
private val dinamicXCompatibility = Compatibility(
    name = "Taobao",
    packageName = "com.taobao.taobao",
    apkFileType = ApkFileType.APK,
    targets = listOf(AppTarget(version = "10.66.30", isExperimental = true))
)

private object StandardDxTextSetter : Fingerprint(
    definingClass = "Ltb/gi6;",
    name = "setText",
    returnType = "V",
    parameters = listOf("Ljava/lang/CharSequence;"),
    isStatic = false
)

private object FastDxTextSetter : Fingerprint(
    definingClass = "Ltb/cx5;",
    name = "setText",
    returnType = "V",
    parameters = listOf("Ljava/lang/CharSequence;"),
    isStatic = false
)

private object StandardDxTextAttribute : Fingerprint(
    definingClass = "Ltb/gi6;",
    name = "onSetStringAttribute",
    returnType = "V",
    parameters = listOf("J", "Ljava/lang/String;"),
    isStatic = false
)

private object FastDxTextAttribute : Fingerprint(
    definingClass = "Ltb/cx5;",
    name = "onSetStringAttribute",
    returnType = "V",
    parameters = listOf("J", "Ljava/lang/String;"),
    isStatic = false
)

// Conservative exact-match UI terms derived from the original APK's
// assets/mytaobao, assets/mtbsettings and assets/awesome snapshots.
// DO NOT add product descriptions or dynamically generated seller text.
private val exactUiLabels = linkedMapOf(
    "我的淘宝" to "My Taobao",
    "首页" to "Home",
    "搜索" to "Search",
    "分类" to "Categories",
    "购物车" to "Cart",
    "我的" to "My Account",
    "消息" to "Messages",
    "设置" to "Settings",
    "账号设置" to "Account Settings",
    "通用" to "General",
    "国家/地区" to "Country / Region",
    "语言" to "Language",
    "货币" to "Currency",
    "确定" to "Confirm",
    "取消" to "Cancel",
    "完成" to "Done",
    "返回" to "Back",
    "关闭" to "Close",
    "全部" to "All",
    "更多" to "More",
    "推荐" to "Recommended",
    "关注" to "Following",
    "店铺" to "Shops",
    "商品" to "Products",
    "订单" to "Orders",
    "我的订单" to "My Orders",
    "全部订单" to "All Orders",
    "查看全部订单" to "View All Orders",
    "待付款" to "To Pay",
    "待发货" to "To Ship",
    "待收货" to "To Receive",
    "待评价" to "To Review",
    "退款/售后" to "Refunds / After-sales",
    "收藏" to "Favorites",
    "收藏夹" to "Favorites",
    "我的收藏" to "My Favorites",
    "足迹" to "History",
    "我的足迹" to "Browsing History",
    "快递" to "Delivery",
    "查看物流" to "Track Delivery",
    "物流信息" to "Shipping Details",
    "优惠券" to "Coupons",
    "红包" to "Red Packets",
    "省钱卡" to "Savings Card",
    "天猫积分" to "Tmall Points",
    "淘金币" to "Taobao Coins",
    "淘金币抵" to "Coins Discount",
    "我的权益" to "My Benefits",
    "会员中心" to "Membership Center",
    "昵称" to "Nickname",
    "用户名" to "Username",
    "账号名：" to "Account:",
    "官方客服" to "Customer Support",
    "专属客服" to "VIP Support",
    "去使用" to "Use Now",
    "立即购买" to "Buy Now",
    "加入购物车" to "Add to Cart",
    "去结算" to "Checkout",
    "结算" to "Checkout",
    "领券" to "Get Coupons",
    "确认收货" to "Confirm Receipt",
    "申请退款" to "Request Refund",
    "联系卖家" to "Contact Seller",
    "联系客服" to "Contact Support",
    "立即支付" to "Pay Now",
    "再逛逛" to "Continue Shopping",
    "百亿补贴" to "Subsidy Deals",
    "淘宝直播" to "Taobao Live",
    "淘宝秒杀" to "Flash Deals",
    "猜你喜欢" to "Recommended for You",
    "看讲解" to "View Details",
    "拍卖" to "Auctions",
    "客服" to "Support",
    "帮助与反馈" to "Help & Feedback",
    "清除缓存" to "Clear Cache",
    "字体大小" to "Font Size",
    "网络诊断" to "Network Diagnostics",
    "网络加速" to "Network Acceleration",
    "消息通知" to "Notifications",
    "隐私" to "Privacy",
    "关于手机淘宝" to "About Taobao",
    "安全中心" to "Security Center",
    "收货地址" to "Shipping Addresses",
    "地址管理" to "Address Book",
    "新增地址" to "Add Address",
    "管理" to "Manage",
    "编辑" to "Edit",
    "删除" to "Delete",
    "保存" to "Save",
    "提交订单" to "Place Order",
    "券后价" to "After Coupon",
    "秒杀价" to "Flash Price",
    "已售" to "Sold",
    "优惠" to "Discount",
    "最新" to "Latest",
    "价格" to "Price",
    "销量" to "Sales",
    "筛选" to "Filter",
    "正在加载" to "Loading",
    "加载中" to "Loading",
    "加载失败" to "Failed to Load",
    "重试" to "Retry",
    "暂无推荐" to "No Recommendations",
    "登录" to "Log In",
    "立即登录" to "Log In",
    "注册" to "Sign Up",
    "退出登录" to "Log Out",
    "登录/注册" to "Log In / Sign Up",
)

private fun smaliQuoted(s: String): String =
    "\"" + s.replace("\\", "\\\\").replace("\"", "\\\"").replace("\n", "\\n") + "\""

private fun nativeLabelInstructions(
    valueRegister: String = "p1",
    textAttributeGate: Boolean = false
): String = buildString {
    if (textAttributeGate) {
        // Only alter DinamicX TEXT attribute (hash 38178040921), not FONT.
        // onSetStringAttribute(J,String): 7 registers, p1/p2 = attribute hash,
        // p3 = text, v0/v1 = scratch wide, v2 = scratch cmp result.
        appendLine("const-wide v0, 0x8e396ac59L")
        appendLine("cmp-long v2, p1, v0")
        appendLine("if-nez v2, :tl_end")
    } else {
        // setText accepts any CharSequence. String.equals(SpannableString)
        // is false even when the rendered characters are identical.
        // Normalize only the comparison operand, preserving the original
        // CharSequence, including its spans, if no label matches.
        appendLine("if-eqz $valueRegister, :tl_end")
        appendLine("invoke-virtual {$valueRegister}, Ljava/lang/Object;->toString()Ljava/lang/String;")
        appendLine("move-result-object v2")
    }
    val comparisonRegister = if (textAttributeGate) valueRegister else "v2"
    exactUiLabels.entries.forEachIndexed { i, item ->
        appendLine("const-string v0, ${smaliQuoted(item.key)}")
        appendLine("invoke-virtual {v0, $comparisonRegister}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z")
        appendLine("move-result v1")
        appendLine("if-eqz v1, :tl_next_$i")
        appendLine("const-string $valueRegister, ${smaliQuoted(item.value)}")
        appendLine("goto/32 :tl_end")
        appendLine(":tl_next_$i")
    }
    appendLine(":tl_end")
}

/**
 * EXPERIMENTAL. Not proof of an English Taobao on device.
 * Does NOT trigger on pre-existing English error / repair / Agree screens.
 * Overrides only four localized view-layer methods, 0 global/network getters.
 * Fully opt-in until original-vs-patched UI and runtime stability are measured.
 */
@Suppress("unused")
val englishDinamicXUiLabelsPatch = bytecodePatch(
    name = "TaobaoLingo: Native DinamicX English labels (experimental)",
    description = "Exact-match English UI labels at DinamicX text binding, leaving network and account language unchanged.",
    default = false
) {
    compatibleWith(dinamicXCompatibility)
    execute {
        // Fail closed if any bytecode entry point no longer writes the precise
        // DinamicX native text field. This protects against obfuscation changes.
        val pairs = listOf(
            StandardDxTextSetter.method to "Ltb/gi6;->text:Ljava/lang/CharSequence;",
            FastDxTextSetter.method to "Ltb/cx5;->text:Ljava/lang/CharSequence;",
            StandardDxTextAttribute.method to "Ltb/gi6;->text:Ljava/lang/CharSequence;",
            FastDxTextAttribute.method to "Ltb/cx5;->text:Ljava/lang/CharSequence;"
        )
        for ((method, expectedField) in pairs) {
            val impl = method.implementation
                ?: throw PatchException("Missing DinamicX text method implementation")
            val writesText = impl.instructions.any {
                it.opcode == Opcode.IPUT_OBJECT &&
                    (it as? ReferenceInstruction)?.reference?.toString() == expectedField
            }
            if (!writesText) {
                throw PatchException("Expected DinamicX text field assignment: $expectedField")
            }
        }
        for (method in listOf(
            StandardDxTextAttribute.method,
            FastDxTextAttribute.method
        )) {
            val textAttributeId = method.implementation?.instructions?.any {
                it.opcode == Opcode.CONST_WIDE &&
                    (it as? WideLiteralInstruction)?.wideLiteral == 38178040921L
            } == true
            if (!textAttributeId) {
                throw PatchException("Expected DinamicX TEXT attribute hash 38178040921")
            }
        }
        val fromDirectSetter = nativeLabelInstructions()
        val fromTemplateAttribute = nativeLabelInstructions(
            valueRegister = "p3", textAttributeGate = true
        )
        StandardDxTextSetter.method.addInstructions(0, fromDirectSetter)
        FastDxTextSetter.method.addInstructions(0, fromDirectSetter)
        StandardDxTextAttribute.method.addInstructions(0, fromTemplateAttribute)
        FastDxTextAttribute.method.addInstructions(0, fromTemplateAttribute)
    }
}


// Separate opt-in extension: some DXButterTextWidgetNode subclasses save the
// original String in an OWN field before/after invoking the patched superclass.
// Translating only the superclass p3 cannot rewrite the subclass's p3.
// 24 candidates were verified against the exact Taobao 10.66.30 original:
// - all extend gi6
// - all override onSetStringAttribute(J,String)
// - all write their own String/CharSequence field
// - all have at least three LOCAL registers available for the injected code
// - all invoke their superclass attribute handler.
// Do not enable without deliberately testing the expanded 28-method footprint.
private val extendedTextAttributeTypes = listOf(
    "Ltb/oe6;",
    "Lcom/taobao/unit/center/mdc/dinamicx/widget/DXMPTextViewWidgetNode;",
    "Lcom/taobao/unit/center/mdc/dinamicx/widget/DXMsgTextViewWidgetNode;",
    "Ltb/g2s;", "Ltb/z1s;",
    "Lcom/taobao/android/detail2/core/framework/base/dinamicx/a;",
    "Ltb/a2s;", "Ltb/h2s;", "Ltb/umx;", "Ltb/vmx;", "Ltb/wmx;",
    "Ltb/xjx;", "Ltb/yjx;",
    "Lcom/taobao/android/dinamicx/widget/b0;",
    "Lcom/taobao/android/dinamicx/widget/e0;",
    "Ltb/ce5;", "Ltb/db6;", "Ltb/op00;", "Ltb/q86;",
    "Ltb/vr90;", "Ltb/han;", "Ltb/i6z;", "Ltb/ian;", "Ltb/t9n;"
)

private val extendedAttributeFingerprints by lazy {
    extendedTextAttributeTypes.map { type ->
        object : Fingerprint(
            definingClass = type,
            name = "onSetStringAttribute",
            returnType = "V",
            parameters = listOf("J", "Ljava/lang/String;"),
            isStatic = false
        ) {}
    }
}

/**
 * EXTRA EXPERIMENTAL. Translates the TEXT attribute BEFORE subclasses save
 * their own String fields. This is a separate opt-in patch, disabled by default.
 * It does not patch login, locale, networking or non-TEXT attributes.
 * Only intended for validating the identified real-Taobao subclass bypasses.
 */
@Suppress("unused")
val extendedEnglishDxSubclassLabelsPatch = bytecodePatch(
    name = "TaobaoLingo: Extended DinamicX subclass English labels (experimental)",
    description = "Translate TEXT input to 24 custom DinamicX subclass attribute handlers before independent field writes.",
    default = false
) {
    compatibleWith(dinamicXCompatibility)
    execute {
        val methods = extendedAttributeFingerprints.map { it.method }
        if (methods.size != 24) {
            throw PatchException("Expected 24 DinamicX subclass candidates")
        }
        for ((index, method) in methods.withIndex()) {
            val impl = method.implementation
                ?: throw PatchException("No implementation for " + extendedTextAttributeTypes[index])
            // p0=this, p1/p2=long id, p3=String: 4 input registers.
            // Our translation uses local v0,v1,v2, without clobbering p0-p3.
            if (impl.registerCount < 7) {
                throw PatchException("Insufficient local registers: " + extendedTextAttributeTypes[index])
            }
            val ownStringWrite = impl.instructions.any { instruction ->
                instruction.opcode == Opcode.IPUT_OBJECT &&
                    (instruction as? ReferenceInstruction)?.reference?.toString()?.let {
                        it.endsWith("Ljava/lang/String;") ||
                            it.endsWith("Ljava/lang/CharSequence;")
                    } == true
            }
            val callsParent = impl.instructions.any { instruction ->
                instruction.opcode == Opcode.INVOKE_SUPER &&
                    (instruction as? ReferenceInstruction)?.reference?.toString()
                        ?.endsWith("->onSetStringAttribute(JLjava/lang/String;)V") == true
            }
            if (!ownStringWrite || !callsParent) {
                throw PatchException("Unexpected subclass TEXT storage/dispatch: " +
                    extendedTextAttributeTypes[index])
            }
        }
        val instructions = nativeLabelInstructions(
            valueRegister = "p3", textAttributeGate = true
        )
        for (method in methods) {
            method.addInstructions(0, instructions)
        }
    }
}
