/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */


package app.morphe.extension.instagram.patches.actionbar;

import android.content.Context;
import android.view.ViewGroup;

import app.morphe.extension.instagram.constants.UI;
import app.morphe.extension.instagram.patches.dm.SavedMessagesHook;
import app.morphe.extension.instagram.settings.SettingsStatus;
import app.morphe.extension.shared.Logger;

/**
 * Buttons added to Instagram's action bars.
 *
 * piko also adds a settings gear, a ghost mode toggle and a profile info button, each chosen from
 * its settings screen. This bundle does not ship that screen, so those choices could never be
 * made; only the deleted-messages button, which "Save deleted messages" turns on, is kept.
 */
public class ActionBarPatch {

    public static void chatActionBarButton(ViewGroup viewGroup) {
        try {
            if (viewGroup == null) {
                return;
            }

            if (SettingsStatus.saveDeletedMessages) {
                Context context = viewGroup.getContext();
                UI.addImageViewToViewGroup(viewGroup, UI.DRAWABLE_HISTORY_ICON,
                        () -> SavedMessagesHook.openDeletedMessages(context));
            }
        } catch (Exception e) {
            Logger.printException(() -> "chatActionBarButton:", e);
        }
    }
}
