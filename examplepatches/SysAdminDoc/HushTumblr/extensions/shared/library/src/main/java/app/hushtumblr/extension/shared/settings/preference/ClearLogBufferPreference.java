/*
 * Forked from https://github.com/SysAdminDoc/HushPinterest at debdac4 (GPL-3.0),
 * modified for HushTumblr (Tumblr), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/HushTelegram at 8c54a1d (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Forked from MorpheApp/morphe-patches (GPL-3.0), by way of
 * icysymmetra/tiktok-patches-for-morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * Imported carrying no notice of its own. Morphe hard forked ReVanced, so parts of
 * this file may originate there.
 *
 * Modified for Hushfacebook (Facebook), 2026.
 */
package app.hushtumblr.extension.shared.settings.preference;

import android.content.Context;
import android.os.Build;
import android.preference.Preference;
import android.util.AttributeSet;
import android.view.View;
import android.widget.Toast;

import java.lang.ref.WeakReference;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicReference;

import app.hushtumblr.extension.shared.L10n;
import app.hushtumblr.extension.shared.Logger;
import app.hushtumblr.extension.shared.Utils;

/** Clears diagnostic data with one-tap Undo while storage work stays off the main thread. */
@SuppressWarnings({"unused", "deprecation"})
public class ClearLogBufferPreference extends Preference implements ImmediateAction {
    @Override public boolean actsOnTap() { return true; }

    private static final AtomicReference<Run> OWNER = new AtomicReference<>();
    private static final List<WeakReference<ClearLogBufferPreference>> ROWS =
            new CopyOnWriteArrayList<>();

    private static final class Run {
        final boolean undo;

        Run(boolean undo) {
            this.undo = undo;
        }
    }

    private CharSequence clearSummary;
    private CharSequence undoSummary = L10n.t("Diagnostic data cleared. Tap again to put it back.");
    private String busyLine;

    {
        // A key so the settings search can index this row. Nothing in the settings
        // framework treats it as a setting: a key with no Setting behind it is skipped.
        setKey(LogBufferManager.CLEAR_ROW_KEY);
        setPersistent(false);
        setOnPreferenceClickListener(pref -> {
            if (OWNER.get() != null) return true;
            if (clearSummary == null) clearSummary = getSummary();
            Run run = new Run(LogBufferManager.canUndoClear());
            if (!OWNER.compareAndSet(null, run)) return true;
            refreshRows();
            boolean accepted = Utils.runOnBackgroundThread(() -> {
                try {
                    if (run.undo) LogBufferManager.undoClear();
                    else LogBufferManager.clearLogBuffer();
                } catch (RuntimeException error) {
                    Logger.printException(() -> "Failed to change diagnostic data", error);
                    LogBufferManager.tell(LogBufferManager.CLEAR_ROW_KEY, run.undo
                            ? L10n.t("Couldn't put back the diagnostic data. Try again.")
                            : L10n.t("Couldn't clear the diagnostic data. Try again."), true, Toast.LENGTH_LONG);
                } finally {
                    Utils.runOnMainThread(() -> finish(run));
                }
            });
            if (!accepted) {
                finish(run);
                LogBufferManager.tell(LogBufferManager.CLEAR_ROW_KEY,
                        L10n.t("Couldn't start that. Try again in a moment."), true, Toast.LENGTH_LONG);
            }
            return true;
        });
        ROWS.add(new WeakReference<>(this));
        refreshRows();
    }

    /** Supplies the two row summaries in the bundle's language. */
    public final void setClearAndUndoSummaries(CharSequence clearSummary, CharSequence undoSummary) {
        this.clearSummary = clearSummary;
        this.undoSummary = undoSummary;
        refresh();
    }

    private static void finish(Run run) {
        if (OWNER.compareAndSet(run, null)) refreshRows();
    }

    private static void refreshRows() {
        for (WeakReference<ClearLogBufferPreference> reference : ROWS) {
            ClearLogBufferPreference row = reference.get();
            if (row == null) ROWS.remove(reference);
            else row.refresh();
        }
    }

    private void refresh() {
        Run run = OWNER.get();
        busyLine = run == null ? null : run.undo
                ? L10n.t("Putting diagnostic data back")
                : L10n.t("Clearing diagnostic data");
        setEnabled(run == null);
        if (busyLine != null) setSummary(busyLine);
        else if (clearSummary != null) {
            setSummary(LogBufferManager.canUndoClear() ? undoSummary : clearSummary);
        }
    }

    @Override protected void onBindView(View view) {
        super.onBindView(view);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) view.setStateDescription(busyLine);
    }

    public ClearLogBufferPreference(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
    }
    public ClearLogBufferPreference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }
    public ClearLogBufferPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
    }
    public ClearLogBufferPreference(Context context) {
        super(context);
    }
}
