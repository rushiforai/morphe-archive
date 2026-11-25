/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.settings;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.os.CancellationSignal;
import android.preference.Preference;
import android.view.View;
import android.widget.Button;

import androidx.annotation.Nullable;

import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicBoolean;

import app.hushpinterest.extension.pinterest.ui.CustomFont;
import app.hushpinterest.extension.shared.L10n;
import app.hushpinterest.extension.shared.Logger;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.settings.preference.AbstractPreferenceFragment;

/**
 * The font file row for Custom font (#51): opens Android's file picker, and the picked file is
 * copied into Pinterest's own files once Android loads it as a font, so it keeps working after the
 * original moves. The copy runs on a worker. The row says it's copying meanwhile, and the open is
 * cancelled after {@link #timeoutMs} for an app that honours that.
 *
 * <p>The picker answers through the page's onActivityResult, like Pick a save sound. A font kept
 * while the switch is on owes a restart, which the restart row counts.
 */
@SuppressWarnings("deprecation") // Framework preferences are what the shared settings page builds on.
public final class FontFilePreference extends Preference {
    static final int PICK = 7316;

    /** What the restart row counts for a font file kept while Custom font is on. */
    static final String FONT_FILE_CHANGE = "hushpinterest_custom_font_file";

    /** How long the app holding the file gets to hand it over. A test sets its own. */
    static volatile long timeoutMs = 30_000L;

    /** The rows on the page right now, so a kept font shows at once. */
    private static final List<WeakReference<FontFilePreference>> ROWS = new CopyOnWriteArrayList<>();

    /** A copy is running, so the row says so and a second pick waits for it. */
    private static final AtomicBoolean copying = new AtomicBoolean();

    /** The newest page, which a finished copy reports to. */
    private static WeakReference<HushPinterestPreferenceFragment> latestPage = new WeakReference<>(null);

    private final HushPinterestPreferenceFragment page;

    FontFilePreference(HushPinterestPreferenceFragment page, Context context) {
        super(HushPinterestPreferenceFragment.themed(context));
        this.page = page;
        latestPage = new WeakReference<>(page);
        setKey("action_font_file");
        setPersistent(false);
        setTitle(L10n.t(context, "Font file"));
        // The row is off while a copy runs, so a tap always starts a new pick.
        setOnPreferenceClickListener(preference -> {
            pick(this.page);
            return true;
        });
        ROWS.add(new WeakReference<>(this));
    }

    @Override public CharSequence getSummary() {
        Context context = getContext();
        return copying.get() ? L10n.t("Copying the font file") : summary(context);
    }

    @Override public boolean isEnabled() {
        return super.isEnabled() && !copying.get();
    }

    @Override protected void onBindView(View view) {
        super.onBindView(view);
        HushPinterestPreferenceFragment.showAllText(view);
        ScreenColors.row(view, this);
        view.setAccessibilityDelegate(new HushPinterestPreferenceFragment.RowSemantics(this, Button.class));
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            view.setStateDescription(copying.get() ? L10n.t("Copying the font file") : null);
        }
    }

    /** What the row says when nothing is running: the picked file's name, or how to pick one. */
    static String summary(Context context) {
        String name = CustomFont.keptName(context);
        if (name == null) return L10n.t("No font picked yet. Pick a .ttf or .otf file.");
        if (name.isEmpty()) return L10n.t("A font file is picked. Tap to pick another.");
        return L10n.f("%1$s is picked. Tap to pick another.", name);
    }

    /** Opens Android's file picker for a font file. */
    static void pick(HushPinterestPreferenceFragment page) {
        // Apps call font files many things, and a picker filtered by type greys out the rest.
        // Whether it's a font is settled by loading it.
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType("*/*");
        try {
            page.startActivityForResult(intent, PICK);
        } catch (ActivityNotFoundException missing) {
            Logger.printInfo(() -> "No file picker");
            Utils.showToastLong(L10n.t("This phone has no file picker, so a file can't be chosen."));
        } catch (RuntimeException error) {
            Logger.printInfo(() -> "Could not open the file picker: " + error.getClass().getSimpleName());
            Utils.showToastLong(L10n.t("Couldn't open the file picker. Try again."));
        }
    }

    /**
     * The file picker's answer, from the page's onActivityResult.
     *
     * @return whether the request was this row's.
     */
    static boolean onResult(HushPinterestPreferenceFragment page, int request, int result, @Nullable Intent data) {
        if (request != PICK) return false;
        Uri font = result == Activity.RESULT_OK && data != null ? data.getData() : null;
        if (font == null) return true; // Cancelled: nothing changes.
        latestPage = new WeakReference<>(page);
        Activity activity = page.getActivity();
        Context context = activity != null ? activity.getApplicationContext() : Utils.getContext();
        if (context == null || !copying.compareAndSet(false, true)) return true;
        refreshRows();
        CancellationSignal cancel = new CancellationSignal();
        Utils.runOnMainThreadDelayed(cancel::cancel, timeoutMs);
        boolean accepted = Utils.runOnBackgroundThread(() -> {
            String said;
            boolean kept = false;
            try {
                ContentResolver resolver = context.getContentResolver();
                String name = SaveSoundPreference.displayName(resolver, font);
                CustomFont.Outcome outcome;
                try (InputStream stream = resolver.openInputStream(font)) {
                    if (stream == null) throw new java.io.FileNotFoundException("No stream");
                    outcome = CustomFont.keep(context, stream, name, cancel);
                }
                kept = outcome == CustomFont.Outcome.KEPT;
                said = outcome(outcome);
            } catch (Exception error) {
                // The class only: an app's message can carry the document's name or address.
                Logger.printInfo(() -> "Font file not read: " + error.getClass().getSimpleName());
                said = L10n.t("Couldn't open that file. Nothing was changed.");
            }
            String result1 = said;
            boolean owed = kept;
            Utils.runOnMainThread(() -> {
                copying.set(false);
                if (owed) fontKept();
                refreshRows();
                Utils.showToastLong(result1);
            });
        });
        if (!accepted) {
            copying.set(false);
            refreshRows();
            Utils.showToastLong(L10n.t("Couldn't start that. Try again in a moment."));
        }
        return true;
    }

    /** One sentence per way a picked font can go. */
    static String outcome(CustomFont.Outcome outcome) {
        switch (outcome) {
            case KEPT:
                return L10n.t("Font file saved. Restart Pinterest to see it.");
            case TOO_LARGE:
                return L10n.t("That file is too large to be a font. Nothing was changed.");
            case NOT_A_FONT:
                return L10n.t("That isn't a font file Android can use. Nothing was changed.");
            default:
                return L10n.t("Couldn't open that file. Nothing was changed.");
        }
    }

    /**
     * A new font is kept, and the next start shows it, so a restart is owed. The font just picked
     * is the one people expect to see, so its switch comes on with it, like Pick a save sound's.
     * Main thread.
     */
    private static void fontKept() {
        HushPinterestPreferenceFragment page = latestPage.get();
        boolean shown = page != null && page.isAdded();
        if (!Settings.CUSTOM_FONT.savedValue()) {
            Settings.CUSTOM_FONT.save(true);
            if (shown) page.customFontTurnedOn();
            else AbstractPreferenceFragment.restartPending.add(Settings.CUSTOM_FONT.key);
            return;
        }
        // The switch's own debt already covers this restart.
        if (AbstractPreferenceFragment.restartPending.contains(Settings.CUSTOM_FONT.key)) return;
        AbstractPreferenceFragment.restartPending.add(FONT_FILE_CHANGE);
        if (shown) page.onRestartPendingChanged();
    }

    private static void refreshRows() {
        for (WeakReference<FontFilePreference> reference : ROWS) {
            FontFilePreference row = reference.get();
            if (row == null) ROWS.remove(reference);
            else row.notifyChanged();
        }
    }
}
