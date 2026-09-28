/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.settings;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.preference.Preference;
import android.preference.PreferenceGroup;
import android.provider.OpenableColumns;
import android.view.View;

import androidx.annotation.Nullable;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicBoolean;

import app.morphe.extension.facebook.font.FontFile;
import app.morphe.extension.facebook.font.OwnFont;
import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.preference.ImmediateAction;

/**
 * Font file and Use your phone's font, the two rows under the Use the system font switch.
 *
 * <p>Font file opens Android's file picker for a font. The picker is an activity of its own, so
 * Android may rebuild Facebook's activity behind it, and the settings page with it. As with Import
 * settings, the answer still reaches the page: Android hands it to the fragment the request came
 * from by the name the framework gave it. Nothing about a request is kept on the page, and the
 * file's address comes with the answer. The file is copied into Facebook's own files on a worker
 * ({@link FontFile#copy}), and the setting names it only once the copy has passed its checks.
 *
 * <p>Use your phone's font takes the copy away and goes back to the phone's font. It acts the
 * moment it's tapped, so it goes without a chevron, and it's on the page only while a file is
 * picked: with the phone's font in use there's nothing for it to go back from, and a row that
 * can never be tapped read to a screen reader as a button that doesn't work.
 */
@SuppressWarnings("deprecation") // Framework preferences are what the shared settings page builds on.
public class FontFilePreference extends Preference implements ImmediateAction {
    /** The picker's request code. Import and Export settings use 7311 and 7312. */
    static final int PICK_FONT = 7313;

    /** The row that opens the picker. */
    static final int CHOOSE = 1;
    /** The row that goes back to the phone's font. */
    static final int PHONE_FONT = 2;

    static final String CHOOSE_KEY = "action_choose_font";
    static final String PHONE_FONT_KEY = "action_phone_font";

    /**
     * What the picker offers: the names providers give fonts, and plain bytes for a provider that
     * doesn't know a font when it sees one. What a file really is gets checked after it's picked.
     */
    static final String[] OPENABLE_TYPES = {"font/ttf", "font/otf", "font/collection", "font/sfnt",
            "application/x-font-ttf", "application/x-font-otf", "application/font-sfnt",
            "application/vnd.ms-opentype", "application/octet-stream"};

    /** The longest name a row shows for a picked file. */
    static final int MAX_NAME_LENGTH = 80;

    /** A copy or a removal is running. */
    private static final AtomicBoolean BUSY = new AtomicBoolean();

    /** The line Font file shows while a copy runs, or null. */
    @Nullable
    private static volatile String runningLine;

    /** The rows on the page right now, so a run can take them all out of reach and bring them back. */
    private static final List<WeakReference<FontFilePreference>> ROWS = new CopyOnWriteArrayList<>();

    private final int role;

    /**
     * On Font file, the Use your phone's font row it keeps beside itself while a font file is
     * picked or a copy of one is left, and takes away when there's neither to go back from.
     */
    @Nullable
    FontFilePreference wayBack;

    FontFilePreference(HushfacebookPreferenceFragment page, Context context, int role) {
        super(context);
        this.role = role;
        setKey(role == CHOOSE ? CHOOSE_KEY : PHONE_FONT_KEY);
        setPersistent(false);
        setTitle(role == CHOOSE ? L10n.t("Font file") : L10n.t("Use your phone's font"));
        setOnPreferenceClickListener(preference -> {
            // Rows are out of reach while a run is going, so this is only the race between a tap
            // and that.
            if (!BUSY.get()) {
                if (role == CHOOSE) pickFont(page);
                else usePhoneFont(page);
            }
            return true;
        });
        ROWS.add(new WeakReference<>(this));
        show();
    }

    @Override
    public boolean actsOnTap() {
        return role == PHONE_FONT;
    }

    /**
     * The row's line and whether a tap reaches it, from the saved font and whether a run is going.
     * Font file also puts Use your phone's font beside itself, or takes it away.
     */
    void show() {
        String source = Settings.FONT_SOURCE.savedValue();
        String line = runningLine;
        boolean running = BUSY.get();
        boolean copy = copyExists();
        // A copy no name points at, one a removal couldn't delete, still has a way out.
        boolean wayBack = !source.isEmpty() || copy;
        if (role == CHOOSE) {
            setEnabled(!running);
            setSummary(line != null ? line : chosenSummary(source, copy));
            showWayBack(wayBack);
        } else {
            setEnabled(!running && wayBack);
            setSummary(L10n.t("Stops using the font file and goes back to your phone's font."));
        }
    }

    /** Puts Use your phone's font in Font file's group when [wanted], after it, or takes it out. */
    private void showWayBack(boolean wanted) {
        FontFilePreference row = wayBack;
        PreferenceGroup group = getParent();
        if (row == null || group == null) return;
        boolean shown = row.getParent() == group;
        if (wanted && !shown) {
            row.show();
            group.addPreference(row);
        } else if (!wanted && shown) {
            group.removePreference(row);
        }
    }

    /**
     * What Font file says under its title: that the phone's font is in use and what a file has to
     * be, the name of the file in use, or that its copy has gone.
     */
    static String chosenSummary(String source, boolean copyExists) {
        if (source.isEmpty()) {
            return L10n.f("None chosen, so your phone's font is used. Choose a TrueType or OpenType file of up "
                    + "to %1$d MB.", FontFile.MAX_MEGABYTES);
        }
        if (!copyExists) {
            return L10n.f("Hushfacebook's copy of %1$s is gone, so your phone's font is used. Choose the file again.",
                    L10n.isolate(source));
        }
        return L10n.f("Using %1$s. Choose another file to replace it.", L10n.isolate(source));
    }

    private static boolean copyExists() {
        Context context = Utils.getContext();
        return context != null && FontFile.file(context).isFile();
    }

    private static void pickFont(HushfacebookPreferenceFragment page) {
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT)
                .addCategory(Intent.CATEGORY_OPENABLE)
                .setType("*/*")
                .putExtra(Intent.EXTRA_MIME_TYPES, OPENABLE_TYPES);
        try {
            page.startActivityForResult(intent, PICK_FONT);
        } catch (ActivityNotFoundException missing) {
            Logger.printInfo(() -> "No file picker for the font file");
            Utils.showToastLong(L10n.t("This phone has no file picker, so there's no way to choose a file here."));
        } catch (RuntimeException error) {
            Logger.printInfo(() -> "Could not open the file picker: " + error.getClass().getSimpleName());
            Utils.showToastLong(L10n.t("Couldn't open the file picker. Try again."));
        }
    }

    /**
     * A picker's answer, from the page's onActivityResult.
     *
     * @return whether the request was this row's.
     */
    static boolean onResult(HushfacebookPreferenceFragment page, int request, int result, @Nullable Intent data) {
        if (request != PICK_FONT) return false;
        Uri uri = result == Activity.RESULT_OK && data != null ? data.getData() : null;
        if (uri != null) copyIn(page, uri); // Cancelled: nothing to do and nothing to say.
        return true;
    }

    private static void copyIn(HushfacebookPreferenceFragment page, Uri uri) {
        Context context = appContext(page);
        if (context == null) return;
        if (!start(L10n.t("Copying the font file"))) return;
        boolean accepted = Utils.runOnBackgroundThread(() -> {
            try {
                String name = displayName(context, uri);
                String before = Settings.FONT_SOURCE.savedValue();
                // The name is saved before the copy moves in and put back if it can't, so the row,
                // the message and the copy never disagree about which font is in use.
                FontFile.copy(open(context, uri), FontFile.file(context), OwnFont::loads, new FontFile.Choice() {
                    @Override
                    public boolean save() {
                        return Settings.FONT_SOURCE.save(name);
                    }

                    @Override
                    public void undo() {
                        Settings.FONT_SOURCE.save(before);
                    }
                });
                // Whatever was built from the copy that was there before is stale now.
                OwnFont.fileChanged();
                Utils.showToastLong(L10n.f("Font set to %1$s. Restart Facebook to see it.", L10n.isolate(name)));
            } catch (FontFile.Refused refused) {
                Logger.printInfo(() -> "Font file refused: " + refused.reason);
                Utils.showToastLong(refusal(refused.reason));
            } finally {
                Utils.runOnMainThread(FontFilePreference::finish);
            }
        });
        if (!accepted) notStarted();
    }

    @Nullable
    private static InputStream open(Context context, Uri uri) throws FontFile.Refused {
        try {
            return context.getContentResolver().openInputStream(uri);
        } catch (IOException | RuntimeException error) {
            // The class only: a provider's message can carry the document's name or address.
            throw new FontFile.Refused(FontFile.Refusal.UNREADABLE, error.getClass().getSimpleName());
        }
    }

    /** One sentence per refusal: a photo picked by mistake and a file too large to take call for different things. */
    static String refusal(FontFile.Refusal reason) {
        switch (reason) {
            case NOT_A_FONT:
                return L10n.t("That isn't a TrueType or OpenType font file. Your font didn't change.");
            case TOO_LARGE:
                return L10n.f("That font file is over %1$d MB. Your font didn't change.", FontFile.MAX_MEGABYTES);
            case WONT_LOAD:
                return L10n.t("Android couldn't draw with that font file. Your font didn't change.");
            case NOT_SAVED:
                return L10n.t("Couldn't save a copy of that font. Check that the phone has room, then try again.");
            default:
                return L10n.t("Couldn't open that file. Your font didn't change.");
        }
    }

    /**
     * The name the picked file goes by, as the provider gives it, or else the last part of its
     * address. Only the name: the file's path and its provider stay out of the setting.
     */
    static String displayName(Context context, Uri uri) {
        String name = null;
        try (Cursor cursor = context.getContentResolver().query(uri,
                new String[]{OpenableColumns.DISPLAY_NAME}, null, null, null)) {
            if (cursor != null && cursor.moveToFirst()) name = cursor.getString(0);
        } catch (RuntimeException unknown) {
            // A provider that can't say leaves the address's own last part.
        }
        if (name == null || name.trim().isEmpty()) name = uri.getLastPathSegment();
        return cleanName(name);
    }

    /**
     * [name] as a row shows it: one line with no control or formatting characters, at most
     * {@link #MAX_NAME_LENGTH} characters, and "font" when nothing is left.
     */
    static String cleanName(@Nullable String name) {
        if (name == null) return "font";
        StringBuilder clean = new StringBuilder();
        int kept = 0;
        for (int index = 0; index < name.length() && kept < MAX_NAME_LENGTH; ) {
            int at = name.codePointAt(index);
            index += Character.charCount(at);
            int type = Character.getType(at);
            boolean hidden = type == Character.CONTROL || type == Character.FORMAT || type == Character.UNASSIGNED
                    || type == Character.LINE_SEPARATOR || type == Character.PARAGRAPH_SEPARATOR
                    || type == Character.PRIVATE_USE || type == Character.SURROGATE;
            if (hidden) continue;
            clean.appendCodePoint(Character.isWhitespace(at) ? ' ' : at);
            kept++;
        }
        String trimmed = clean.toString().trim().replaceAll(" {2,}", " ");
        return trimmed.isEmpty() ? "font" : trimmed;
    }

    /**
     * Takes the copy away and saves the phone's font as the choice, on a worker: the file is
     * removed only after the setting stops naming it.
     */
    private static void usePhoneFont(HushfacebookPreferenceFragment page) {
        Context context = appContext(page);
        if (context == null) return;
        if (!start(null)) return;
        boolean accepted = Utils.runOnBackgroundThread(() -> {
            try {
                if (Settings.FONT_SOURCE.save("")) {
                    OwnFont.fileChanged();
                    File copy = FontFile.file(context);
                    if (copy.exists() && !copy.delete()) {
                        Logger.printInfo(() -> "The font file copy couldn't be removed");
                    }
                    Utils.showToastLong(L10n.t("Back to your phone's font. Restart Facebook to see it."));
                } else {
                    Utils.showToastLong(L10n.t("Couldn't go back to your phone's font. Try again."));
                }
            } finally {
                Utils.runOnMainThread(FontFilePreference::finish);
            }
        });
        if (!accepted) notStarted();
    }

    @Nullable
    private static Context appContext(HushfacebookPreferenceFragment page) {
        Activity activity = page.getActivity();
        return activity != null ? activity.getApplicationContext() : Utils.getContext();
    }

    /** Claims the rows for one run, or says why not. */
    private static boolean start(@Nullable String line) {
        if (!BUSY.compareAndSet(false, true)) {
            Utils.showToastLong(L10n.t("Couldn't start that. Try again in a moment."));
            return false;
        }
        runningLine = line;
        showAll();
        return true;
    }

    private static void finish() {
        runningLine = null;
        BUSY.set(false);
        showAll();
    }

    /** The worker queue was full, so nothing ran: the rows come back and the person hears why. */
    private static void notStarted() {
        finish();
        Utils.showToastLong(L10n.t("Couldn't start that. Try again in a moment."));
    }

    private static void showAll() {
        for (WeakReference<FontFilePreference> held : ROWS) {
            FontFilePreference row = held.get();
            if (row == null) {
                ROWS.remove(held);
                continue;
            }
            row.show();
        }
    }

    @Override
    protected void onBindView(View view) {
        super.onBindView(view);
        // A screen reader hears Font file as unavailable during a copy, and this says why.
        view.setStateDescription(role == CHOOSE ? runningLine : null);
    }
}
