package app.aidan.patches.sidelineswap.customization

import app.aidan.patches.sidelineswap.shared.COMPATIBILITY_SIDELINESWAP
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val COLOR_BLACK = "#000000"
private const val COLOR_WHITE = "#FFFFFFFF"
private const val COLOR_MUTED_WHITE = "#B3FFFFFF"
private const val COLOR_DIVIDER = "#33FFFFFF"
private const val COLOR_LOCAL_BUBBLE = "#121212"
private const val COLOR_FREE_SHIPPING_GREEN = "#02c874"

private val AMOLED_LAYOUT_FILES = listOf(
    "activity_facet_child_list.xml",
    "activity_filter.xml",
    "activity_main.xml",
    "activity_sort_type.xml",
    "fragment_accept_swap.xml",
    "fragment_account_details.xml",
    "fragment_add_account.xml",
    "fragment_add_braintree_payment_method.xml",
    "fragment_address_list.xml",
    "fragment_all_categories.xml",
    "fragment_cart.xml",
    "fragment_cart_checkout.xml",
    "fragment_cart_checkout_completed.xml",
    "fragment_category_item_list.xml",
    "fragment_checkout_summary.xml",
    "fragment_choose_refund_method.xml",
    "fragment_counter_offer.xml",
    "fragment_dispute_details.xml",
    "fragment_dispute_prompt.xml",
    "fragment_edit_address.xml",
    "fragment_edit_saved_search.xml",
    "fragment_email_address.xml",
    "fragment_email_sent.xml",
    "fragment_favorite_items.xml",
    "fragment_flag_item.xml",
    "fragment_give_feedback.xml",
    "fragment_invite_friends.xml",
    "fragment_item_list.xml",
    "fragment_join.xml",
    "fragment_locker.xml",
    "fragment_locker_item_list.xml",
    "fragment_make_offer.xml",
    "fragment_new_password.xml",
    "fragment_partial_refund.xml",
    "fragment_payment_method_list.xml",
    "fragment_phone_verification.xml",
    "fragment_photo_input.xml",
    "fragment_receipt.xml",
    "fragment_receive_package.xml",
    "fragment_saved_searches.xml",
    "fragment_seller_offer.xml",
    "fragment_sports_preferences.xml",
    "fragment_swap_messaging.xml",
    "fragment_update_addresses.xml",
    "fragment_update_shipping_label.xml",
    "fragment_update_shipping_label_final_step.xml",
    "fragment_update_shipping_label_select_carrier.xml",
    "fragment_vacation.xml",
    "layout_item_details_actions.xml",
    "layout_item_details_description.xml",
    "layout_item_details_seller.xml",
    "list_item_address.xml",
    "list_item_cart_item.xml",
    "list_item_cart_item_with_itemization.xml",
    "list_item_cart_seller.xml",
    "list_item_completed_checkout_cart_item.xml",
    "list_item_facet.xml",
    "list_item_item.xml",
    "list_item_item_detail.xml",
    "list_item_itemization.xml",
    "list_item_itemization_divider.xml",
    "list_item_itemization_offer.xml",
    "list_item_itemization_total.xml",
    "list_item_payment_method.xml",
    "list_item_recent_query.xml",
    "list_item_remote_message.xml",
    "list_item_saved_search.xml",
    "list_item_seller_intro_message.xml",
    "list_item_seller_item.xml",
    "list_item_sort.xml",
    "list_item_subtotal.xml",
    "list_item_subtotal_section.xml",
    "list_item_suggested_query.xml",
    "list_item_swap.xml",
    "list_item_swap_scope.xml",
    "list_item_updates.xml",
    "progress_view_2.xml",
    "view_checkout_message.xml",
    "view_profile.xml",
    "view_refund_method.xml"
)

private val AMOLED_ICON_FILES = listOf(
    "ic_arrow_back_black_24.xml",
    "ic_arrow_back_black_24dp.xml",
    "ic_check_circle.xml",
    "ic_checked_box.xml",
    "ic_chevron_left_black_24dp.xml",
    "ic_chevron_right_grey_24dp.xml",
    "ic_clear_black_24dp.xml",
    "ic_delete_black_24dp.xml",
    "ic_edit_grey_24dp.xml",
    "ic_favorite_off_grey_24dp.xml",
    "ic_image_black_60dp.xml",
    "ic_info_circle.xml",
    "ic_more_vert.xml",
    "ic_radio_button_unchecked.xml",
    "ic_radio_button_on.xml",
    "ic_radio_button_off.xml",
    "ic_receipt.xml",
    "ic_recent_search_dark_grey_24dp.xml",
    "ic_search_black_24.xml",
    "ic_search_dark_grey_24dp.xml",
    "ic_shopping_cart_grey_24dp.xml",
    "ic_tariff_warning_outlined.xml",
    "ic_uncheck_box.xml",
    "ic_view_grey_24dp.xml",
    "ic_local_shipping.xml",
    "ic_place.xml",
    "ic_access_time.xml",
    "ic_perm_identity.xml",
    "ic_zip_logo.xml",
)
val amoledThemeResourcePatch = resourcePatch(
    name = "AMOLED Theme Resources",
    description = "Resource modifications for AMOLED theme.",
    default = false
) {
    category("Customization")
    compatibleWith(COMPATIBILITY_SIDELINESWAP)

    execute {
        patchStyles()
        patchColors()
        patchStrings()
        patchLayouts()
        patchDrawables()
        patchIcons()
        patchShippingIcon()
        patchVaultedPaymentCard()
        patchAddressListGuideline()
    }
}

val amoledThemePatch = bytecodePatch(
    name = "AMOLED Theme",
    description = "Forces SidelineSwap into a pure-black AMOLED theme with dark system bars, black app surfaces, readable light text and icons, and force dark mode on embedded WebViews.",
    default = false
) {
    category("Customization")
    compatibleWith(COMPATIBILITY_SIDELINESWAP)
    dependsOn(amoledThemeResourcePatch)
    extendWith("extensions/extension.mpe")

    execute {
        patchWebViewDarkMode()
        patchEmblemLabelColor()
        patchCartItemBackgrounds()
    }
}

private fun BytecodePatchContext.patchWebViewDarkMode() {
    val webViewFragment = mutableClassDefByOrNull("Lcom/sidelineswap/android/webview/WebViewFragment;")
    webViewFragment?.methods?.firstOrNull { it.name == "onViewCreated" && it.implementation != null }?.let { method ->
        method.addInstructions(
            0,
            """
            check-cast p1, Landroid/view/ViewGroup;
            const v0, 0x7f0904ab
            invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;
            move-result-object v0
            check-cast v0, Landroid/webkit/WebView;
            invoke-static {v0}, Lapp/aidan/extension/sidelineswap/DarkWebViewBridge;->applyDarkMode(Landroid/webkit/WebView;)V
            """
        )
    }

    val webViewClientClass = mutableClassDefByOrNull("Lcom/sidelineswap/android/webview/WebViewFragment\$onViewCreated\$4;")
    webViewClientClass?.methods?.firstOrNull { it.name == "onPageFinished" && it.implementation != null }?.let { method ->
        method.addInstructions(
            0,
            """
            invoke-static {p1}, Lapp/aidan/extension/sidelineswap/DarkWebViewBridge;->applyDarkMode(Landroid/webkit/WebView;)V
            """
        )
    }

    val webSignInFragment = mutableClassDefByOrNull("Lcom/sidelineswap/android/account/WebSignInFragment;")
    webSignInFragment?.methods?.firstOrNull { it.name == "onViewCreated" && it.implementation != null }?.let { method ->
        method.addInstructions(
            0,
            """
            check-cast p1, Landroid/view/ViewGroup;
            const v0, 0x7f0903c5
            invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;
            move-result-object v0
            check-cast v0, Landroid/webkit/WebView;
            invoke-static {v0}, Lapp/aidan/extension/sidelineswap/DarkWebViewBridge;->applyDarkMode(Landroid/webkit/WebView;)V
            """
        )
    }
}

private fun BytecodePatchContext.patchEmblemLabelColor() {
    val itemKtClass = mutableClassDefByOrNull("Lcom/sidelineswap/android/model/ItemKt;")
        ?: throw PatchException("Class Lcom/sidelineswap/android/model/ItemKt; not found")
    val getEmblemLabelMethod = itemKtClass.methods.firstOrNull {
        it.name == "getEmblemLabel" && it.implementation != null
    } ?: throw PatchException("Method getEmblemLabel not found in Lcom/sidelineswap/android/model/ItemKt;")

    val impl = getEmblemLabelMethod.implementation
        ?: throw PatchException("getEmblemLabel has no implementation")

    val instructions = impl.instructions.toList()
    val targetIndex = instructions.indexOfFirst { inst ->
        if (inst is Instruction21c) {
            val ref = inst.reference
            ref is StringReference && ref.string.equals("#253C32", ignoreCase = true)
        } else false
    }

    if (targetIndex < 0) {
        throw PatchException("const-string '#253C32' not found in getEmblemLabel")
    }

    val inst = instructions[targetIndex] as Instruction21c
    getEmblemLabelMethod.replaceInstruction(
        targetIndex,
        "const-string v${inst.registerA}, \"$COLOR_FREE_SHIPPING_GREEN\""
    )
}

private fun BytecodePatchContext.patchCartItemBackgrounds() {
    val cartItemViewHolder = mutableClassDefByOrNull("Lcom/sidelineswap/android/cart/CartItemAdapter\$ViewHolder;")
        ?: throw PatchException("Class Lcom/sidelineswap/android/cart/CartItemAdapter\$ViewHolder; not found")
    val bindMethod = cartItemViewHolder.methods.firstOrNull {
        it.name == "bind" && it.parameterTypes.size == 1 && it.parameterTypes[0] == "Lcom/sidelineswap/android/model/Cart\$CartItem;" && it.implementation != null
    } ?: throw PatchException("Method bind not found in Lcom/sidelineswap/android/cart/CartItemAdapter\$ViewHolder;")
    val checkoutViewHolder = mutableClassDefByOrNull("Lcom/sidelineswap/android/cart/CartCheckoutItemAdapter\$ViewHolder;")
        ?: throw PatchException("Class Lcom/sidelineswap/android/cart/CartCheckoutItemAdapter\$ViewHolder; not found")
    val checkoutBindMethod = checkoutViewHolder.methods.firstOrNull {
        it.name == "bind" && it.parameterTypes.size == 1 && it.parameterTypes[0] == "Lcom/sidelineswap/android/cart/CartCheckoutItemAdapter\$AdapterItem;" && it.implementation != null
    } ?: throw PatchException("Method bind not found in Lcom/sidelineswap/android/cart/CartCheckoutItemAdapter\$ViewHolder;")

    for (method in listOf(bindMethod, checkoutBindMethod)) {
        val impl = method.implementation ?: throw PatchException("${method.name} has no implementation")
        val instructions = impl.instructions.toList()
        val targets = setOf("#ffffff", "#f8f8f8")
        val matches = mutableListOf<Pair<Int, Instruction21c>>()
        instructions.forEachIndexed { index, inst ->
            if (inst is Instruction21c) {
                val ref = inst.reference
                if (ref is StringReference && ref.string.lowercase() in targets) {
                    matches.add(index to inst)
                }
            }
        }
        if (matches.size != targets.size) {
            throw PatchException("${method.name}: expected to replace ${targets.size} color strings, but found ${matches.size}")
        }
        for ((index, inst) in matches.asReversed()) {
            method.replaceInstruction(
                index,
                "const-string v${inst.registerA}, \"$COLOR_BLACK\""
            )
        }
    }
}

private fun app.morphe.patcher.patch.ResourcePatchContext.patchStyles() {
    val stylesPath = "res/values/styles.xml"
    document(stylesPath).use { doc ->
        val appTheme = findSingleStyle(doc, stylesPath, "AppTheme")
        val appThemeParent = appTheme.getAttribute("parent")
        if (appThemeParent != "@style/Theme.MaterialComponents.Light.NoActionBar") {
            throw PatchException("[$stylesPath] Expected AppTheme parent '@style/Theme.MaterialComponents.Light.NoActionBar', found '$appThemeParent'")
        }
        appTheme.setAttribute("parent", "@style/Theme.MaterialComponents.NoActionBar")

        replaceStyleItem(stylesPath, appTheme, "android:statusBarColor", "@android:color/transparent", "@android:color/black")
        replaceStyleItem(stylesPath, appTheme, "android:navigationBarColor", "@android:color/transparent", "@android:color/black")
        replaceStyleItem(stylesPath, appTheme, "android:windowLightStatusBar", "true", "false")
        replaceStyleItem(stylesPath, appTheme, "android:windowLightNavigationBar", "true", "false")

        val appBarOverlay = findSingleStyle(doc, stylesPath, "AppTheme.AppBarOverlay")
        val appBarParent = appBarOverlay.getAttribute("parent")
        if (appBarParent != "@style/ThemeOverlay.MaterialComponents.ActionBar") {
            throw PatchException("[$stylesPath] Expected AppTheme.AppBarOverlay parent '@style/ThemeOverlay.MaterialComponents.ActionBar', found '$appBarParent'")
        }
        appBarOverlay.setAttribute("parent", "@style/ThemeOverlay.MaterialComponents.Dark.ActionBar")

        val popupOverlay = findSingleStyle(doc, stylesPath, "AppTheme.PopupOverlay")
        val popupParent = popupOverlay.getAttribute("parent")
        if (popupParent != "@style/ThemeOverlay.MaterialComponents.Light") {
            throw PatchException("[$stylesPath] Expected AppTheme.PopupOverlay parent '@style/ThemeOverlay.MaterialComponents.Light', found '$popupParent'")
        }
        popupOverlay.setAttribute("parent", "@style/ThemeOverlay.MaterialComponents.Dark")

        val searchStyle = findSingleStyle(doc, stylesPath, "TextAppearance.Search")
        replaceStyleItem(stylesPath, searchStyle, "android:textColor", "#4a4a4a", COLOR_WHITE)

        val facetSubtitleStyle = findSingleStyle(doc, stylesPath, "TextAppearance.Facet.Subtitle")
        replaceStyleItem(stylesPath, facetSubtitleStyle, "android:textColor", "#de000000", COLOR_WHITE)

        val messagingStyle = findSingleStyle(doc, stylesPath, "TextAppearance.Messaging")

        val appBarDarkOverlay = findSingleStyle(doc, stylesPath, "AppTheme.AppBarOverlay.Dark")
        val appBarDarkParent = appBarDarkOverlay.getAttribute("parent")
        if (appBarDarkParent != "@style/ThemeOverlay.MaterialComponents.Dark.ActionBar") {
            throw PatchException("[$stylesPath] Expected AppTheme.AppBarOverlay.Dark parent '@style/ThemeOverlay.MaterialComponents.Dark.ActionBar', found '$appBarDarkParent'")
        }
        appBarDarkOverlay.setAttribute("parent", "@style/ThemeOverlay.MaterialComponents.Dark.ActionBar")

        val cardViewStyle = findSingleStyle(doc, stylesPath, "CardView")
        replaceStyleItem(stylesPath, cardViewStyle, "cardBackgroundColor", "?android:attr/colorBackgroundFloating", COLOR_BLACK)

        val btDropInTheme = findSingleStyle(doc, stylesPath, "bt_drop_in_activity_theme")
        val btDropInParent = btDropInTheme.getAttribute("parent")
        if (btDropInParent != "@style/Theme.AppCompat.Light.NoActionBar") {
            throw PatchException("[$stylesPath] Expected bt_drop_in_activity_theme parent '@style/Theme.AppCompat.Light.NoActionBar', found '$btDropInParent'")
        }
        btDropInTheme.setAttribute("parent", "@style/Theme.AppCompat.NoActionBar")

        val btAddCardTheme = findSingleStyle(doc, stylesPath, "bt_add_card_activity_theme")
        val btAddCardParent = btAddCardTheme.getAttribute("parent")
        if (btAddCardParent != "@style/Theme.AppCompat.Light.NoActionBar") {
            throw PatchException("[$stylesPath] Expected bt_add_card_activity_theme parent '@style/Theme.AppCompat.Light.NoActionBar', found '$btAddCardParent'")
        }
        btAddCardTheme.setAttribute("parent", "@style/Theme.AppCompat.NoActionBar")

        val btEditButton = findSingleStyle(doc, stylesPath, "bt_edit_button")
        val btEditParent = btEditButton.getAttribute("parent")
        if (btEditParent != "@style/Theme.AppCompat.Light") {
            throw PatchException("[$stylesPath] Expected bt_edit_button parent '@style/Theme.AppCompat.Light', found '$btEditParent'")
        }
        btEditButton.setAttribute("parent", "@style/Theme.AppCompat")
    }
}

private fun app.morphe.patcher.patch.ResourcePatchContext.patchColors() {
    val colorsPath = "res/values/colors.xml"
    val expectedColors = mapOf(
        "appBarColor" to Pair("#ffffff", COLOR_BLACK),
        "itemBackground" to Pair("#f8f8f8", COLOR_BLACK),
        "dividerColor" to Pair("#b7b7b7", COLOR_DIVIDER),
        "background_floating_material_dark" to Pair("@color/material_grey_800", COLOR_BLACK),
        "background_material_dark" to Pair("@color/material_grey_850", COLOR_BLACK),
        "cardview_dark_background" to Pair("#ff424242", COLOR_BLACK),
        "cardview_light_background" to Pair("#ffffffff", COLOR_BLACK),
        "design_dark_default_color_background" to Pair("#121212", COLOR_BLACK),
        "design_dark_default_color_surface" to Pair("#121212", COLOR_BLACK),
        "colorBlack" to Pair("#4a4a4a", COLOR_WHITE),
        "follow" to Pair("#4a4a4a", COLOR_WHITE),
        "design_default_color_background" to Pair("#ffffff", COLOR_BLACK),
        "design_default_color_surface" to Pair("#ffffff", COLOR_BLACK),
        "design_default_color_on_background" to Pair("#000000", COLOR_WHITE),
        "design_default_color_on_surface" to Pair("#000000", COLOR_WHITE),
        "primary_text_default_material_light" to Pair("#de000000", COLOR_WHITE),
        "secondary_text_default_material_light" to Pair("#8a000000", COLOR_MUTED_WHITE),
        "bt_base_background" to Pair("#fafafa", COLOR_BLACK),
        "bt_black" to Pair("#001129", COLOR_WHITE),
        "bt_black_12" to Pair("#1e000000", COLOR_DIVIDER),
        "bt_black_54" to Pair("#8a000000", COLOR_MUTED_WHITE),
        "bt_black_87" to Pair("#de000000", COLOR_WHITE),
        "bt_black_contrast" to Pair("#000000", COLOR_FREE_SHIPPING_GREEN),
        "bt_color_primary" to Pair("#3e3c42", COLOR_BLACK),
        "bt_color_primary_dark" to Pair("#363439", COLOR_BLACK),
    )

    document(colorsPath).use { doc ->
        val colorNodes = doc.getElementsByTagName("color")
        val foundColors = mutableMapOf<String, Element>()
        for (i in 0 until colorNodes.length) {
            val elem = colorNodes.item(i) as? Element ?: continue
            val name = elem.getAttribute("name")
            if (name in expectedColors) {
                if (foundColors.put(name, elem) != null) {
                    throw PatchException("[$colorsPath] Duplicate color declaration for '$name'")
                }
            }
        }

        for ((name, expectedAndReplacement) in expectedColors) {
            val elem = foundColors[name]
                ?: throw PatchException("[$colorsPath] Required color '$name' not found")
            val currentVal = elem.textContent.trim()
            val (expectedVal, replacementVal) = expectedAndReplacement
            if (!currentVal.equals(expectedVal, ignoreCase = true)) {
                throw PatchException("[$colorsPath] Color '$name' expected '$expectedVal', found '$currentVal'")
            }
            elem.textContent = replacementVal
        }
    }
}
private fun app.morphe.patcher.patch.ResourcePatchContext.patchStrings() {
    val stringsPath = "res/values/strings.xml"
    val expectedStrings = mapOf(
        "feedback_zero" to Pair(
            "No Feedback <font color=#9b9b9b>(0)</font>",
            "<font color=#ffffff>No Feedback </font><font color=#b3ffffff>(0)</font>"
        ),
        "feedback" to Pair(
            "<b>%1$.1f&#37;</b> Positive Feedback <font color=#9b9b9b>(%2\$d)</font>",
            "<font color=#ffffff><b>%1$.1f&#37;</b> Positive Feedback </font><font color=#b3ffffff>(%2\$d)</font>"
        )
    )

    document(stringsPath).use { doc ->
        val stringNodes = doc.getElementsByTagName("string")
        val foundStrings = mutableMapOf<String, Element>()
        for (i in 0 until stringNodes.length) {
            val elem = stringNodes.item(i) as? Element ?: continue
            val name = elem.getAttribute("name")
            if (name in expectedStrings) {
                if (foundStrings.put(name, elem) != null) {
                    throw PatchException("[$stringsPath] Duplicate string declaration for '$name'")
                }
            }
        }

        for ((name, expectedAndReplacement) in expectedStrings) {
            val elem = foundStrings[name]
                ?: throw PatchException("[$stringsPath] Required string '$name' not found")
            val currentVal = elem.textContent.trim()
            val (expectedVal, replacementVal) = expectedAndReplacement
            if (currentVal != expectedVal) {
                throw PatchException("[$stringsPath] String '$name' expected '$expectedVal', found '$currentVal'")
            }
            elem.textContent = replacementVal
        }
    }
}


private fun app.morphe.patcher.patch.ResourcePatchContext.patchLayouts() {
    var totalSurfaceCount = 0
    var totalDividerCount = 0
    var totalPrimaryFgCount = 0
    var totalMutedFgCount = 0

    val surfaceLiterals = setOf("#ffffff", "#f8f8f8", "#fafafa", "@android:color/white")
    val dividerLiterals = setOf("#1f000000", "#de000000", "#efeff4", "#dfd3d3d3", "#b7b7b7", "#f4f4f5")
    val primaryFgLiterals = setOf("#4a4a4a", "#de000000", "#000000", "#253c32", "#454545", "#595959", "@android:color/black", "@color/colorblack")
    val mutedFgLiterals = setOf("#9b9b9b", "#b7b7b7", "#61716a", "#828282", "#cacaca", "#d8d8d8", "#cccccc", "#99000000", "#b3000000")

    for (layoutName in AMOLED_LAYOUT_FILES) {
        val layoutPath = "res/layout/$layoutName"
        var fileModifiedCount = 0

        document(layoutPath).use { doc ->
            val allElements = doc.getElementsByTagName("*")
            for (i in 0 until allElements.length) {
                val elem = allElements.item(i) as? Element ?: continue

                if (elem.hasAttribute("android:background")) {
                    val rawVal = elem.getAttribute("android:background")
                    val normalized = rawVal.trim().lowercase()
                    if (normalized in surfaceLiterals) {
                        elem.setAttribute("android:background", COLOR_BLACK)
                        totalSurfaceCount++
                        fileModifiedCount++
                    } else if (normalized in dividerLiterals) {
                        elem.setAttribute("android:background", COLOR_DIVIDER)
                        totalDividerCount++
                        fileModifiedCount++
                    }
                }

                for (attrName in listOf("android:textColor", "android:tint", "app:titleTextColor")) {
                    if (elem.hasAttribute(attrName)) {
                        val rawVal = elem.getAttribute(attrName)
                        val normalized = rawVal.trim().lowercase()
                        if (normalized in primaryFgLiterals) {
                            elem.setAttribute(attrName, COLOR_WHITE)
                            totalPrimaryFgCount++
                            fileModifiedCount++
                        } else if (normalized in mutedFgLiterals) {
                            elem.setAttribute(attrName, COLOR_MUTED_WHITE)
                            totalMutedFgCount++
                            fileModifiedCount++
                        }
                    }
                }
                if (elem.getAttribute("android:id") == "@id/interactWithCart" && !elem.hasAttribute("android:textColor")) {
                    elem.setAttribute("android:textColor", COLOR_WHITE)
                    totalPrimaryFgCount++
                    fileModifiedCount++
                }
            }
        }

        if (fileModifiedCount == 0) {
            throw PatchException("[$layoutPath] Expected at least one replacement in layout file, but none matched")
        }
    }

    if (totalSurfaceCount != 33) {
        throw PatchException("Layout surface replacement count mismatch: expected 33, got $totalSurfaceCount")
    }
    if (totalDividerCount != 34) {
        throw PatchException("Layout divider replacement count mismatch: expected 34, got $totalDividerCount")
    }
    if (totalPrimaryFgCount != 178) {
        throw PatchException("Layout primary foreground replacement count mismatch: expected 178, got $totalPrimaryFgCount")
    }
    if (totalMutedFgCount != 58) {
        throw PatchException("Layout muted foreground replacement count mismatch: expected 58, got $totalMutedFgCount")
    }
}

private fun app.morphe.patcher.patch.ResourcePatchContext.patchDrawables() {
    patchDrawableShape(
        path = "res/drawable/messaging_local_background.xml",
        expectedSolid = "#efeff4",
        replacementSolid = COLOR_LOCAL_BUBBLE
    )
    patchDrawableShape(
        path = "res/drawable/messaging_remote_background.xml",
        expectedSolid = "#ffffff",
        replacementSolid = COLOR_BLACK
    )
    patchDrawableShape(
        path = "res/drawable/message_background.xml",
        expectedSolid = "#f7fafb",
        replacementSolid = COLOR_BLACK
    )
    patchDrawableShape(
        path = "res/drawable/rating_background_checked.xml",
        expectedSolid = "#f8f8f8",
        replacementSolid = COLOR_BLACK,
        expectedStroke = "#d8d8d8",
        replacementStroke = COLOR_DIVIDER
    )
    patchDrawableShape(
        path = "res/drawable/avatar_stroke_v2.xml",
        expectedSolid = "#ffffff",
        replacementSolid = "@android:color/transparent"
    )

    val togglePath = "res/drawable/toggle_background_unchecked.xml"
    document(togglePath).use { doc ->
        val strokes = doc.getElementsByTagName("stroke")
        if (strokes.length != 1) {
            throw PatchException("[$togglePath] Expected exactly 1 <stroke> element, found ${strokes.length}")
        }
        val strokeElem = strokes.item(0) as Element
        val currentStroke = strokeElem.getAttribute("android:color").trim()
        if (!currentStroke.equals("#4a4a4a", ignoreCase = true)) {
            throw PatchException("[$togglePath] Expected stroke color '#4a4a4a', found '$currentStroke'")
        }
        strokeElem.setAttribute("android:color", COLOR_DIVIDER)
    }

    val toggleColorPath = "res/color/toggle_text_color.xml"
    document(toggleColorPath).use { doc ->
        val items = doc.getElementsByTagName("item")
        var found = false
        for (i in 0 until items.length) {
            val itemElem = items.item(i) as? Element ?: continue
            if (itemElem.getAttribute("android:color").trim().equals("#4a4a4a", ignoreCase = true)) {
                itemElem.setAttribute("android:color", COLOR_MUTED_WHITE)
                found = true
            }
        }
        if (!found) {
            throw PatchException("[$toggleColorPath] Item with color '#4a4a4a' not found")
        }
    }
}

private fun app.morphe.patcher.patch.ResourcePatchContext.patchShippingIcon() {
    val shippingIconPath = "res/drawable/ic_shipping.xml"
    document(shippingIconPath).use { doc ->
        val paths = doc.getElementsByTagName("path")
        var backgroundRemoved = false
        var foregroundUpdatedCount = 0

        val nodesToRemove = mutableListOf<Element>()
        for (i in 0 until paths.length) {
            val pathElem = paths.item(i) as? Element ?: continue
            val fillColor = pathElem.getAttribute("android:fillColor").trim().lowercase()
            if (fillColor == "#ffffff") {
                nodesToRemove.add(pathElem)
                backgroundRemoved = true
            } else if (fillColor == "#253c32") {
                pathElem.setAttribute("android:fillColor", COLOR_FREE_SHIPPING_GREEN)
                foregroundUpdatedCount++
            }
        }

        for (node in nodesToRemove) {
            node.parentNode?.removeChild(node)
        }

        if (!backgroundRemoved) {
            throw PatchException("[$shippingIconPath] White background path not found")
        }
        if (foregroundUpdatedCount != 5) {
            throw PatchException("[$shippingIconPath] Expected 5 foreground paths with #253c32, found $foregroundUpdatedCount")
        }
    }
}

private fun app.morphe.patcher.patch.ResourcePatchContext.patchVaultedPaymentCard() {
    val path = "res/layout/bt_vaulted_payment_method_card.xml"
    document(path).use { doc ->
        val cards = doc.getElementsByTagName("androidx.cardview.widget.CardView")
        if (cards.length != 1) {
            throw PatchException("[$path] Expected 1 CardView, found ${cards.length}")
        }
        val card = cards.item(0) as Element
        val attrName = if (card.hasAttribute("card_view:cardBackgroundColor")) "card_view:cardBackgroundColor" else "app:cardBackgroundColor"
        val current = card.getAttribute(attrName).trim()
        if (!current.equals("@android:color/white", ignoreCase = true)) {
            throw PatchException("[$path] Expected cardBackgroundColor '@android:color/white', found '$current'")
        }
        card.setAttribute(attrName, COLOR_LOCAL_BUBBLE)
    }
}

private fun app.morphe.patcher.patch.ResourcePatchContext.patchAddressListGuideline() {
    val layoutPath = "res/layout/fragment_address_list.xml"
    document(layoutPath).use { doc ->
        val guidelines = doc.getElementsByTagName("androidx.constraintlayout.widget.Guideline")
        for (i in 0 until guidelines.length) {
            val elem = guidelines.item(i) as? Element ?: continue
            if (elem.getAttribute("android:id") == "@id/guidelineStart") {
                elem.setAttribute("app:layout_constraintGuide_begin", "16.0dp")
                return@use
            }
        }
        throw PatchException("[$layoutPath] guidelineStart not found")
    }
}

private fun app.morphe.patcher.patch.ResourcePatchContext.patchDrawableShape(
    path: String,
    expectedSolid: String,
    replacementSolid: String,
    expectedStroke: String? = null,
    replacementStroke: String? = null
) {
    document(path).use { doc ->
        val solids = doc.getElementsByTagName("solid")
        if (solids.length != 1) {
            throw PatchException("[$path] Expected exactly 1 <solid> element, found ${solids.length}")
        }
        val solidElem = solids.item(0) as Element
        val currentSolid = solidElem.getAttribute("android:color").trim()
        if (!currentSolid.equals(expectedSolid, ignoreCase = true)) {
            throw PatchException("[$path] Expected solid color '$expectedSolid', found '$currentSolid'")
        }
        solidElem.setAttribute("android:color", replacementSolid)

        if (expectedStroke != null && replacementStroke != null) {
            val strokes = doc.getElementsByTagName("stroke")
            if (strokes.length != 1) {
                throw PatchException("[$path] Expected exactly 1 <stroke> element, found ${strokes.length}")
            }
            val strokeElem = strokes.item(0) as Element
            val currentStroke = strokeElem.getAttribute("android:color").trim()
            if (!currentStroke.equals(expectedStroke, ignoreCase = true)) {
                throw PatchException("[$path] Expected stroke color '$expectedStroke', found '$currentStroke'")
            }
            strokeElem.setAttribute("android:color", replacementStroke)
        }
    }
}

private fun app.morphe.patcher.patch.ResourcePatchContext.patchIcons() {
    var totalPrimaryIconCount = 0
    var totalMutedIconCount = 0

    val primaryLiterals = setOf("#ff000000", "#000000", "#4a4a4a", "#000")
    val mutedLiterals = setOf("#757575", "#b3000000", "#b7b7b7")

    for (iconName in AMOLED_ICON_FILES) {
        val iconPath = "res/drawable/$iconName"
        var fileModifiedCount = 0

        document(iconPath).use { doc ->
            val allElements = doc.getElementsByTagName("*")
            for (i in 0 until allElements.length) {
                val elem = allElements.item(i) as? Element ?: continue

                for (attrName in listOf("android:tint", "android:fillColor")) {
                    if (elem.hasAttribute(attrName)) {
                        val rawVal = elem.getAttribute(attrName)
                        val normalized = rawVal.trim().lowercase()
                        if (normalized in primaryLiterals) {
                            elem.setAttribute(attrName, COLOR_WHITE)
                            totalPrimaryIconCount++
                            fileModifiedCount++
                        } else if (normalized in mutedLiterals) {
                            elem.setAttribute(attrName, COLOR_MUTED_WHITE)
                            totalMutedIconCount++
                            fileModifiedCount++
                        }
                    }
                }
            }
        }

        if (fileModifiedCount == 0) {
            throw PatchException("[$iconPath] Expected at least one replacement in icon drawable, but none matched")
        }
    }

    if (totalPrimaryIconCount != 28) {
        throw PatchException("Icon primary replacement count mismatch: expected 28, got $totalPrimaryIconCount")
    }
    if (totalMutedIconCount != 10) {
        throw PatchException("Icon muted replacement count mismatch: expected 10, got $totalMutedIconCount")
    }
}

private fun findSingleStyle(doc: Document, path: String, name: String): Element {
    val styles = doc.getElementsByTagName("style")
    var match: Element? = null
    for (i in 0 until styles.length) {
        val elem = styles.item(i) as? Element ?: continue
        if (elem.getAttribute("name") == name) {
            if (match != null) {
                throw PatchException("[$path] Duplicate style found for name '$name'")
            }
            match = elem
        }
    }
    return match ?: throw PatchException("[$path] Required style '$name' not found")
}

private fun replaceStyleItem(
    path: String,
    styleElem: Element,
    itemName: String,
    expectedVal: String,
    replacementVal: String
) {
    val items = styleElem.getElementsByTagName("item")
    var match: Element? = null
    for (i in 0 until items.length) {
        val item = items.item(i) as? Element ?: continue
        if (item.parentNode == styleElem && item.getAttribute("name") == itemName) {
            if (match != null) {
                throw PatchException("[$path] Duplicate item '$itemName' in style '${styleElem.getAttribute("name")}'")
            }
            match = item
        }
    }
    val found = match
        ?: throw PatchException("[$path] Required item '$itemName' in style '${styleElem.getAttribute("name")}' not found")
    val currentVal = found.textContent.trim()
    if (!currentVal.equals(expectedVal, ignoreCase = true)) {
        throw PatchException("[$path] Item '$itemName' in style '${styleElem.getAttribute("name")}' expected '$expectedVal', found '$currentVal'")
    }
    found.textContent = replacementVal
}
