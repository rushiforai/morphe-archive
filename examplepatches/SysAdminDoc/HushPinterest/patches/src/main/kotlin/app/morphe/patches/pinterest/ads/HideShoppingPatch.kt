/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ads

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.patchLog
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.pinterest.ui.PIN_CLOSEUP_BASE_MODULE
import app.morphe.patches.pinterest.ui.collapseView
import app.morphe.patches.pinterest.ui.fields
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.iface.ClassDef

/** The component type Pinterest gives the Shop the look section under a pin (#6). Obfuscation leaves enum names alone. */
internal const val SHOP_THE_LOOK_COMPONENT = "STELA_PRODUCTS"

internal fun ClassDef.isShopTheLookModule() = methods.any { method ->
    method.name == "getComponentType" && method.parameterTypes.isEmpty() &&
        method.fields().any { it.name == SHOP_THE_LOOK_COMPONENT }
}

/**
 * The Shop the look section under a pin: its own closeup module, holding the section's title and
 * a carousel of products. Pinterest fills it from the pin itself, not from a feed story, so the
 * feed filter never sees it. Null, with a warning, when a build has no single such module, so the
 * feed part of Hide shopping still applies.
 */
internal fun BytecodePatchContext.shopTheLookModule(): MutableClass? {
    val modules = mutableListOf<ClassDef>()
    classDefForEach { if (it.isShopTheLookModule()) modules += it }
    val module = modules.singleOrNull()
    if (module == null) {
        patchLog.warning("Hide shopping: ${modules.size} closeup modules are $SHOP_THE_LOOK_COMPONENT, so Shop the look stays under pins.")
        return null
    }
    var parent = module.superclass
    val visited = mutableSetOf<String>()
    while (parent != PIN_CLOSEUP_BASE_MODULE && parent != null && visited.add(parent)) {
        parent = classDefByOrNull(parent)?.superclass
    }
    if (parent != PIN_CLOSEUP_BASE_MODULE) {
        patchLog.warning("Hide shopping: ${module.type} doesn't build on $PIN_CLOSEUP_BASE_MODULE, so Shop the look stays under pins.")
        return null
    }
    return mutableClassDefBy(module.type)
}

@Suppress("unused")
val hideShoppingPatch = bytecodePatch(
    name = "Hide shopping and product pins",
    description = "Hides shoppable pins, shopping stories, featured boards and the Shop the look section under a pin. " +
        "Good if you want to browse ideas, not products. Starts off. Turn it on in HushPinterest settings > Feed.",
) {
    category("Feed")
    dependsOn(settingsPatch, feedListHookPatch)
    compatibleWith(*AppCompatibilities.pinterest())
    execute {
        requireStatusMethod("hideShopping")
        requireStatusMethod("feedShopping")
        requireStatusMethod("closeupShopping")
        if (feedListHoldersHooked == 0) throw PatchException("Hide shopping: no list holder was hooked")
        val shopTheLook = shopTheLookModule()
        shopTheLook?.let { collapseView(it, "closeupShopping") }
        enableCapability("feedShopping")
        if (shopTheLook != null) enableCapability("closeupShopping")
        enableStatus("hideShopping")
    }
}
