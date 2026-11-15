/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.loki.extension;

import android.content.Context;
import android.content.Intent;

import java.util.ArrayList;

/**
 * The "Loki Patches" row in Splitwise's Account tab.
 *
 * The Account list only knows the actions in its own ButtonAction enum, so the row borrows GetPro: that row
 * ("Splitwise Pro") is removed by the Pro-ads patch, and the Pro cards that also fire GetPro are hidden too. A tap
 * on GetPro opens the Loki Patches screen instead of the subscription page.
 */
@SuppressWarnings("unused")
public final class SplitwiseAccount {
    private static final String SECTIONS = "com.Splitwise.SplitwiseMobile.features.account.sections.";
    private static final String TEXT_MODEL = "com.Splitwise.SplitwiseMobile.features.shared.viewmodel.TextModel$Text";

    private SplitwiseAccount() {
    }

    /** Builds the row into a scratch list: the menu logs this so a broken row shows up without opening Account. */
    @SuppressWarnings({"rawtypes", "unchecked"})
    public static String selfCheck() {
        ArrayList scratch = new ArrayList();
        addRow(scratch, true);
        return scratch.size() == 1 ? "ready (" + scratch.get(0) + ")" : "failed";
    }

    /**
     * The row icon, in the Account tab's own style: an outlined Material icon tinted colorOnBackground at 24 dp,
     * exactly like Email settings or Help center (ImageViewModel.IconicsDrawableConfiguration). The puzzle piece
     * (gmo_extension) stands for patches. Falls back to a plain drawable if the icon font classes moved.
     */
    private static Object icon(ClassLoader loader, Class<?> localResource) throws Exception {
        try {
            Class<?> glyphs = Class.forName(
                    "com.mikepenz.iconics.typeface.library.googlematerial.OutlinedGoogleMaterial$Icon", true, loader);
            Class<?> iconBase = Class.forName(SECTIONS + "IconicsIcon", true, loader);
            Class<?> outlined = Class.forName(SECTIONS + "IconicsIcon$Outlined", true, loader);
            Class<?> config = Class.forName(SECTIONS + "ImageViewModel$IconicsDrawableConfiguration", true, loader);
            @SuppressWarnings({"unchecked", "rawtypes"})
            Object glyph = Enum.valueOf((Class<Enum>) glyphs, "gmo_extension");
            Object icon = outlined.getConstructor(glyphs).newInstance(glyph);
            Integer tint = colorOnBackground();
            return config.getConstructor(iconBase, Integer.class, Integer.class, Integer.class)
                    .newInstance(icon, tint, 24, null);
        } catch (Throwable error) {
            LokiLog.note("Account tab: outlined icon unavailable, using plain one: " + error);
            return localResource.getConstructor(int.class).newInstance(android.R.drawable.ic_menu_manage);
        }
    }

    /** R.attr.colorOnBackground of the host app; looked up by name because the id is not stable across builds. */
    private static Integer colorOnBackground() {
        Context context = application();
        if (context == null) return null;
        int id = context.getResources().getIdentifier("colorOnBackground", "attr", "com.Splitwise.SplitwiseMobile");
        if (id == 0) id = context.getResources().getIdentifier("colorOnBackground", "attr", context.getPackageName());
        return id == 0 ? null : id;
    }

    /** Called before AccountItemsViewModelConfiguration.buildOtherOptionsItems returns its list. */
    @SuppressWarnings({"unchecked", "rawtypes"})
    public static void addRow(ArrayList list) {
        addRow(list, false);
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    private static void addRow(ArrayList list, boolean quiet) {
        if (list == null) return;
        try {
            ClassLoader loader = SplitwiseAccount.class.getClassLoader();
            Class<?> actionType = Class.forName(SECTIONS + "AccountItem$ButtonAction", true, loader);
            Class<?> imageBase = Class.forName(SECTIONS + "ImageViewModel", true, loader);
            Class<?> imageType = Class.forName(SECTIONS + "ImageViewModel$LocalResource", true, loader);
            Class<?> textBase = Class.forName("com.Splitwise.SplitwiseMobile.features.shared.viewmodel.TextModel",
                    true, loader);
            Class<?> textType = Class.forName(TEXT_MODEL, true, loader);
            Class<?> buttonType = Class.forName(SECTIONS + "AccountItem$Button", true, loader);

            Object action = Enum.valueOf((Class<Enum>) actionType, "GetPro");
            Object icon = icon(loader, imageType);
            Object title = textType.getConstructor(String.class).newInstance(MenuInfo.BRAND);
            Object row = buttonType.getConstructor(actionType, imageBase, textBase).newInstance(action, icon, title);

            // The Pro-ads patch hides the real "Splitwise Pro" row; drop it here too in case that patch is off.
            for (int index = list.size() - 1; index >= 0; index--) {
                Object item = list.get(index);
                if (buttonType.isInstance(item)
                        && action.equals(buttonType.getMethod("getAction").invoke(item))) {
                    list.remove(index);
                }
            }
            list.add(row);
            if (!quiet) LokiLog.note("Account tab: Loki Patches row added");
        } catch (Throwable error) {
            LokiLog.note("Account tab: row could not be added: " + error);
        }
    }

    /**
     * Called first in AccountContentViewModel.onButtonTapped. Returns true when the tap was ours and the app
     * should do nothing else.
     */
    public static boolean tapped(Object action) {
        if (action == null || !"GetPro".equals(((Enum<?>) action).name())) return false;
        try {
            Context context = application();
            if (context == null) return false;
            context.startActivity(new Intent(context, MenuActivity.class)
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            LokiLog.note("Account tab: Loki Patches row tapped");
            return true;
        } catch (Throwable error) {
            android.util.Log.e("Loki", "account row: could not open the menu", error);
            return false;
        }
    }

    private static Context application() {
        try {
            return (Context) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
        } catch (Throwable error) {
            return null;
        }
    }
}
