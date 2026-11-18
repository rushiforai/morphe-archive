/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.settings;

import android.app.AlertDialog;
import android.content.Context;
import android.preference.Preference;
import android.view.View;
import android.widget.Button;

import java.util.Arrays;

import app.hushpinterest.extension.pinterest.ui.BoardTabs;
import app.hushpinterest.extension.shared.L10n;

/** Board name position (#42): where the name sits on the picture at the top of a board tab. */
@SuppressWarnings("deprecation") // Framework preferences are what the shared settings page builds on.
public final class BoardTabPositionPreference extends Preference {
    BoardTabPositionPreference(Context context) {
        super(HushPinterestPreferenceFragment.themed(context));
        setKey("action_board_tab_position");
        setPersistent(false);
        setTitle(L10n.t(context, "Board name position"));
        setOnPreferenceClickListener(preference -> {
            tapped();
            return true;
        });
    }

    @Override public CharSequence getSummary() {
        return L10n.f("%s. Moves the board name on the picture at the top of a board tab on Home. "
                + "The change shows the next time the tab opens.", label(BoardTabs.POSITION.savedValue()));
    }

    @Override protected void onBindView(View view) {
        super.onBindView(view);
        HushPinterestPreferenceFragment.showAllText(view);
        ScreenColors.row(view, this);
        view.setAccessibilityDelegate(new HushPinterestPreferenceFragment.RowSemantics(this, Button.class));
    }

    private static String label(String position) {
        switch (position) {
            case BoardTabs.TOP_LEFT: return L10n.t("Top left");
            case BoardTabs.TOP_CENTER: return L10n.t("Top center");
            case BoardTabs.MIDDLE: return L10n.t("Middle");
            case BoardTabs.BOTTOM_CENTER: return L10n.t("Bottom center");
            case BoardTabs.BOTTOM_RIGHT: return L10n.t("Bottom right");
            default: return L10n.t("Where Pinterest puts it");
        }
    }

    private void tapped() {
        String[] positions = BoardTabs.POSITIONS;
        CharSequence[] names = new CharSequence[positions.length];
        for (int index = 0; index < names.length; index++) names[index] = label(positions[index]);
        int checked = Math.max(0, Arrays.asList(positions).indexOf(BoardTabs.POSITION.savedValue()));
        AlertDialog dialog = HushDialogs.builder(getContext())
                .setTitle(getTitle())
                .setSingleChoiceItems(names, checked, (shown, which) -> {
                    choose(positions[which]);
                    shown.dismiss();
                })
                .setNegativeButton(L10n.t("Cancel"), null)
                .create();
        HushDialogs.prepareChoices(dialog);
        dialog.show();
        HushDialogs.paint(dialog);
    }

    void choose(String position) {
        BoardTabs.POSITION.save(position);
        notifyChanged();
    }
}
