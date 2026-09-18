/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 * Follows BlueDragon4251/tiktok-patches-for-morphe.
 */
package app.morphe.extension.tiktok.settings.preference;

import app.morphe.extension.tiktok.settings.L10n;
import android.content.Context;
import android.preference.Preference;
import android.view.View;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.tiktok.seen.SeenVideoHistory;

import java.text.NumberFormat;

@SuppressWarnings("deprecation")
public final class ClearSeenVideoHistoryPreference extends Preference
        implements app.morphe.extension.shared.settings.preference.ImmediateAction {
    @Override public boolean actsOnTap() { return true; }

    static final String CLEAR_TITLE = "Clear seen videos";
    static final String UNDO_TITLE = "Undo clearing seen videos";
    static final String NOT_READY = "Still reading the record. Tap again in a moment.";
    static final String FAILED = "Could not undo the clear. Try again.";

    public ClearSeenVideoHistoryPreference(Context context) {
        super(context);
        setKey("action_clear_seen_video_history");
        applyState(SeenVideoHistory.canUndo());

        setOnPreferenceClickListener(preference -> {
            if (SeenVideoHistory.canUndo()) {
                SeenVideoHistory.undoClear(result -> {
                    String message;
                    if (result == SeenVideoHistory.UndoResult.RESTORED) {
                        message = "Seen videos restored.";
                    } else if (result == SeenVideoHistory.UndoResult.FAILED) {
                        message = FAILED;
                    } else if (result == SeenVideoHistory.UndoResult.EMPTY) {
                        message = "There was nothing to undo.";
                    } else if (result == SeenVideoHistory.UndoResult.SUPERSEDED) {
                        message = "A newer clear replaced that undo. Tap the row again to undo.";
                    } else {
                        message = NOT_READY;
                    }
                    Utils.showToastShort(L10n.t(context, message));
                    boolean restored = result == SeenVideoHistory.UndoResult.RESTORED
                            || result == SeenVideoHistory.UndoResult.EMPTY;
                    applyState(!restored);
                });
                return true;
            }

            SeenVideoHistory.clear();
            Utils.showToastLong(L10n.t(context,
                    "Seen videos cleared. Tap the row to undo before TikTok closes."));
            applyState(true);
            return true;
        });
    }

    private void applyState(boolean canUndo) {
        if (canUndo) {
            setTitle(UNDO_TITLE);
            setSummary("Cleared. Tap to undo before TikTok closes.");
        } else {
            setTitle(CLEAR_TITLE);
            int count = SeenVideoHistory.size();
            if (count > 0) {
                setSummary(L10n.f(getContext(),
                        "Forget the %1$s seen videos.",
                        NumberFormat.getInstance().format(count)));
            } else {
                setSummary("No seen videos recorded yet.");
            }
        }
    }

    @Override
    protected void onBindView(View view) {
        super.onBindView(view);
        SettingsUi.styleTitleAndSummary(view);
    }

    @Override
    public void setTitle(CharSequence title) {
        super.setTitle(L10n.t(getContext(), title));
    }

    @Override
    public void setSummary(CharSequence summary) {
        super.setSummary(L10n.t(getContext(), summary));
    }
}
