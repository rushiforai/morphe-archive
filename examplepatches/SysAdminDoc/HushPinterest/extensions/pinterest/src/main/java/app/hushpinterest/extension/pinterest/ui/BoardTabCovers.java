/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ui;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Fragment;
import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.Button;
import android.widget.ImageView;

import androidx.annotation.Nullable;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.HushDialogs;
import app.hushpinterest.extension.pinterest.settings.PatchFamily;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.L10n;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;
import app.hushpinterest.extension.shared.settings.StringSetting;

/**
 * The picture at the top of a board tab on Home (#42). Pinterest picks a new one as it pleases, so a
 * long press lets the person keep it or swap it for a pin, a photo from the phone or plain black,
 * one choice per board. Everything here runs on the main thread, except reading and saving files.
 */
@SuppressWarnings("deprecation") // A framework fragment is what receives the file picker's answer.
public final class BoardTabCovers {
    private BoardTabCovers() {}

    /** A JSON object of board id to its cover's kind and value. */
    static final StringSetting COVERS = new StringSetting("hushpinterest_board_tab_covers", "", false, false);

    static final String URL = "url";
    static final String BLACK = "black";
    static final String FILE = "file";

    private static final String FOLDER = "hush-board-covers";
    private static final String PICKER_TAG = "hushpinterest-board-cover";
    private static final String PICKER_BOARD = "board";
    private static final int REQUEST = 0x4851;
    private static final long MAX_FILE_BYTES = 20L * 1024 * 1024;
    private static final long PIN_WINDOW_MS = 10 * 60 * 1000;
    private static final int MAX_DECODED_SIDE = 4096;

    /** The picture Pinterest wanted for each header, by its image view. */
    private static final Map<View, String> STOCK = new WeakHashMap<>();

    @Nullable private static String pendingBoard;
    private static long pendingUntil;
    @Nullable private static WeakReference<View> pendingImage;
    @Nullable private static WeakReference<View> pickingFor;

    private static final class Cover {
        final String kind;
        final String value;

        Cover(String kind, String value) {
            this.kind = kind;
            this.value = value;
        }
    }

    /**
     * Pinterest shades the header picture with a color filter, which turns a black drawable gray. This
     * filter paints it black instead and carries Pinterest's along, so the view itself remembers it and
     * a rebind that drops the filter drops both.
     */
    private static final class BlackShade extends PorterDuffColorFilter {
        @Nullable final ColorFilter pinterests;

        BlackShade(@Nullable ColorFilter pinterests) {
            super(Color.BLACK, PorterDuff.Mode.SRC_ATOP);
            this.pinterests = pinterests;
        }
    }

    private static void setBlackCover(View image, boolean wanted) {
        if (!(image instanceof ImageView)) return;
        ImageView view = (ImageView) image;
        ColorFilter now = view.getColorFilter();
        ColorFilter next = shaded(now, wanted);
        if (next != now) view.setColorFilter(next);
        Drawable fade = fadeOver(view);
        if (fade == null) return;
        ColorFilter fadeNow = fade.getColorFilter();
        ColorFilter fadeNext = shaded(fadeNow, wanted);
        if (fadeNext != fadeNow) fade.setColorFilter(fadeNext);
    }

    @Nullable
    private static ColorFilter shaded(@Nullable ColorFilter now, boolean black) {
        boolean painted = now instanceof BlackShade;
        if (black && !painted) return new BlackShade(now);
        if (!black && painted) return ((BlackShade) now).pinterests;
        return now;
    }

    /** The gradient over the picture, fading to the app's gray: an empty image view with it as background. */
    @Nullable
    private static Drawable fadeOver(ImageView image) {
        ViewParent parent = image.getParent();
        if (!(parent instanceof ViewGroup)) return null;
        ViewGroup header = (ViewGroup) parent;
        for (int index = 0; index < header.getChildCount(); index++) {
            View child = header.getChildAt(index);
            if (child != image && child instanceof ImageView && ((ImageView) child).getDrawable() == null
                    && child.getBackground() instanceof GradientDrawable) {
                return child.getBackground();
            }
        }
        return null;
    }

    private static boolean covering() {
        return UiHooks.enabled(FamilyNames.BOARD_TABS, Settings.BOARD_TAB_COVERS);
    }

    /**
     * Called with the picture a board tab's header is about to load. Answers the picture to load, or
     * null when this has painted the header itself. A header outside a known board tab is left alone.
     */
    @Nullable
    public static String coverUrl(View image, String url) {
        HookStatus.invoked(FamilyNames.BOARD_TABS);
        try {
            View tab = tabOf(image);
            if (tab == null || !covering()) {
                setBlackCover(image, false);
                return url;
            }
            String board = BoardTabs.boardOf(tab);
            STOCK.put(image, url);
            watch(image);
            Cover cover = cover(board);
            if (cover != null) return show(image, board, cover);
            setBlackCover(image, false);
            return url;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.BOARD_TABS, "board tab cover", failure);
            return url;
        }
    }

    /** Does nothing here. Patching writes the call to Pinterest's image loader. */
    public static void loadCover(View image, String url) {}

    @Nullable
    private static View tabOf(View image) {
        for (ViewParent parent = image.getParent(); parent instanceof View; parent = parent.getParent()) {
            if (BoardTabs.boardOf((View) parent) != null) return (View) parent;
        }
        return null;
    }

    private static boolean showing(View image, String board) {
        View tab = tabOf(image);
        return tab != null && board.equals(BoardTabs.boardOf(tab));
    }

    private static void watch(View image) {
        ViewParent parent = image.getParent();
        if (!(parent instanceof View)) return;
        ((View) parent).setOnLongClickListener(held -> {
            try {
                if (!covering()) return false;
                openCoverMenu(image);
                return true;
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.BOARD_TABS, "board tab cover menu", failure);
                return false;
            }
        });
    }

    @Nullable
    private static Cover cover(String board) {
        String saved = COVERS.savedValue();
        if (saved.isEmpty()) return null;
        try {
            JSONObject entry = new JSONObject(saved).optJSONObject(board);
            if (entry == null) return null;
            String kind = entry.optString("kind");
            String value = entry.optString("value");
            if (BLACK.equals(kind)) return new Cover(BLACK, "");
            if ((URL.equals(kind) || FILE.equals(kind)) && !value.isEmpty()) return new Cover(kind, value);
        } catch (JSONException damaged) {
            HookStatus.threw(FamilyNames.BOARD_TABS, "read board tab covers", damaged);
        }
        return null;
    }

    /** Saves a board's cover. A null kind goes back to Pinterest's picture. */
    static void store(String board, @Nullable String kind, @Nullable String value) {
        JSONObject all = new JSONObject();
        String saved = COVERS.savedValue();
        try {
            if (!saved.isEmpty()) all = new JSONObject(saved);
        } catch (JSONException damaged) {
            HookStatus.threw(FamilyNames.BOARD_TABS, "read board tab covers", damaged);
        }
        try {
            if (kind == null) all.remove(board);
            else all.put(board, new JSONObject().put("kind", kind).put("value", value == null ? "" : value));
        } catch (JSONException failure) {
            HookStatus.threw(FamilyNames.BOARD_TABS, "save board tab cover", failure);
            return;
        }
        COVERS.save(all.length() == 0 ? "" : all.toString());
        if (!FILE.equals(kind)) deleteFile(board);
    }

    private static void deleteFile(String board) {
        Context context = Utils.getContext();
        if (context == null) return;
        File file = new File(new File(context.getFilesDir(), FOLDER), safeName(board));
        if (file.exists() && !file.delete()) {
            HookStatus.counted(FamilyNames.BOARD_TABS, "old board tab cover file stayed");
        }
    }

    static String safeName(String board) {
        return board.replaceAll("[^A-Za-z0-9_-]", "_");
    }

    @Nullable
    private static String show(View image, String board, Cover cover) {
        setBlackCover(image, BLACK.equals(cover.kind));
        if (URL.equals(cover.kind)) return cover.value;
        if (image instanceof ImageView) ((ImageView) image).setImageDrawable(new ColorDrawable(Color.BLACK));
        if (FILE.equals(cover.kind)) loadFile(image, board, cover.value);
        return null;
    }

    private static void refresh(View image, String board) {
        Cover cover = cover(board);
        if (cover == null) setBlackCover(image, false);
        String url = cover == null ? STOCK.get(image) : show(image, board, cover);
        if (url != null) loadCover(image, url);
    }

    private static void confirmSet() {
        Utils.showToastShort(L10n.t("Board tab cover set."));
    }

    @Nullable
    private static Activity activityOf(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            Context base = ((ContextWrapper) context).getBaseContext();
            if (base == context) break;
            context = base;
        }
        return null;
    }

    private static void openCoverMenu(View image) {
        View tab = tabOf(image);
        String board = tab == null ? null : BoardTabs.boardOf(tab);
        Activity activity = activityOf(image.getContext());
        if (board == null || activity == null) return;
        Cover current = cover(board);
        String stock = STOCK.get(image);
        List<CharSequence> names = new ArrayList<>();
        List<Runnable> actions = new ArrayList<>();
        if (current == null && stock != null) {
            names.add(L10n.t("Keep this picture"));
            actions.add(() -> {
                store(board, URL, stock);
                confirmSet();
            });
        }
        if (PatchFamily.Capability.PIN_DOWNLOADS.installed()) {
            names.add(L10n.t("Pin from this board"));
            actions.add(() -> pickPin(image, board));
        }
        names.add(L10n.t("Image from phone"));
        actions.add(() -> pickFile(activity, image, board));
        names.add(L10n.t("No image"));
        actions.add(() -> {
            store(board, BLACK, null);
            refresh(image, board);
        });
        if (current != null) {
            names.add(L10n.t("Pinterest's choice"));
            actions.add(() -> {
                store(board, null, null);
                refresh(image, board);
            });
        }
        AlertDialog dialog = HushDialogs.builder(activity)
                .setTitle(L10n.t("Board tab cover"))
                .setItems(names.toArray(new CharSequence[0]), (shown, which) -> {
                    try {
                        actions.get(which).run();
                    } catch (Throwable failure) {
                        HookStatus.threw(FamilyNames.BOARD_TABS, "board tab cover choice", failure);
                    }
                })
                .setNegativeButton(L10n.t("Cancel"), null)
                .create();
        HushDialogs.prepareChoices(dialog);
        dialog.show();
        HushDialogs.paint(dialog);
    }

    /** Opens the board when its button is there. Its pins then offer Use as tab cover for a while. */
    private static void pickPin(View image, String board) {
        startPinPick(image, board);
        Utils.showToastLong(L10n.t("Open a pin's menu and pick Use as tab cover."));
        ViewParent parent = image.getParent();
        if (!(parent instanceof ViewGroup)) return;
        ViewGroup header = (ViewGroup) parent;
        for (int index = 0; index < header.getChildCount(); index++) {
            View child = header.getChildAt(index);
            if (child instanceof Button) {
                child.performClick();
                return;
            }
        }
    }

    static void startPinPick(View image, String board) {
        pendingBoard = board;
        pendingUntil = SystemClock.elapsedRealtime() + PIN_WINDOW_MS;
        pendingImage = new WeakReference<>(image);
    }

    static void clearPinPick() {
        pendingBoard = null;
        pendingImage = null;
    }

    /** Whether a pin menu opening now should offer Use as tab cover. */
    public static boolean pickingPin() {
        if (pendingBoard == null) return false;
        if (SystemClock.elapsedRealtime() > pendingUntil || !covering()) {
            clearPinPick();
            return false;
        }
        return true;
    }

    /** The person picked this pin's picture for the board being chosen for. */
    public static void usePin(String url) {
        String board = pendingBoard;
        View image = pendingImage == null ? null : pendingImage.get();
        clearPinPick();
        if (board == null || url == null || url.isEmpty()) return;
        store(board, URL, url);
        if (image != null && showing(image, board)) refresh(image, board);
        confirmSet();
    }

    private static void pickFile(Activity activity, View image, String board) {
        Picker picker = null;
        try {
            FragmentManager fragments = activity.getFragmentManager();
            Fragment old = fragments.findFragmentByTag(PICKER_TAG);
            picker = new Picker();
            Bundle arguments = new Bundle();
            arguments.putString(PICKER_BOARD, board);
            picker.setArguments(arguments);
            FragmentTransaction change = fragments.beginTransaction();
            if (old != null) change.remove(old);
            change.add(picker, PICKER_TAG).commitNow();
            pickingFor = new WeakReference<>(image);
            Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType("image/*");
            try {
                picker.startActivityForResult(intent, REQUEST);
            } catch (ActivityNotFoundException missing) {
                picker.leave();
                Utils.showToastLong(L10n.t("This phone has no file picker, so a file can't be chosen."));
            }
        } catch (RuntimeException failure) {
            if (picker != null) picker.leave();
            HookStatus.threw(FamilyNames.BOARD_TABS, "open board tab cover picker", failure);
            Utils.showToastLong(L10n.t("Couldn't open the file picker. Try again."));
        }
    }

    /** Receives the file picker's answer. Android rebuilds it by name, so it has to stay public. */
    public static final class Picker extends Fragment {
        void leave() {
            try {
                FragmentManager fragments = getFragmentManager();
                if (fragments != null) fragments.beginTransaction().remove(this).commitAllowingStateLoss();
            } catch (RuntimeException gone) {
                HookStatus.counted(FamilyNames.BOARD_TABS, "board tab cover picker already gone");
            }
        }

        @Override public void onActivityResult(int request, int result, Intent data) {
            if (request != REQUEST) return;
            Activity host = getActivity();
            Context app = host != null ? host.getApplicationContext() : Utils.getContext();
            Bundle arguments = getArguments();
            String board = arguments == null ? null : arguments.getString(PICKER_BOARD);
            leave();
            Uri uri = result == Activity.RESULT_OK && data != null ? data.getData() : null;
            if (uri == null || app == null || board == null) return;
            boolean started = Utils.runOnBackgroundThread(() -> {
                boolean saved = saveFile(app, uri, board);
                Utils.runOnMainThread(() -> fileSaved(board, saved));
            });
            if (!started) fileSaved(board, false);
        }
    }

    private static void fileSaved(String board, boolean saved) {
        View image = pickingFor == null ? null : pickingFor.get();
        pickingFor = null;
        if (!saved) {
            Utils.showToastLong(L10n.t("That file couldn't be read as a picture."));
            return;
        }
        store(board, FILE, safeName(board));
        if (image != null && showing(image, board)) refresh(image, board);
        confirmSet();
    }

    /** Copies the picture into the app, since the picker's permission ends with the app's process. */
    private static boolean saveFile(Context app, Uri uri, String board) {
        File temp = null;
        try {
            File folder = new File(app.getFilesDir(), FOLDER);
            if (!folder.mkdirs() && !folder.isDirectory()) throw new IOException("no folder for board tab covers");
            temp = File.createTempFile("cover", ".tmp", folder);
            try (InputStream in = app.getContentResolver().openInputStream(uri);
                 OutputStream out = new FileOutputStream(temp)) {
                if (in == null || !copyCapped(in, out, MAX_FILE_BYTES)) return false;
            }
            BitmapFactory.Options bounds = new BitmapFactory.Options();
            bounds.inJustDecodeBounds = true;
            BitmapFactory.decodeFile(temp.getPath(), bounds);
            if (bounds.outWidth <= 0 || bounds.outHeight <= 0) return false;
            return temp.renameTo(new File(folder, safeName(board)));
        } catch (IOException | RuntimeException failure) {
            HookStatus.threw(FamilyNames.BOARD_TABS, "save board tab cover file", failure);
            return false;
        } finally {
            if (temp != null && temp.exists() && !temp.delete()) {
                HookStatus.counted(FamilyNames.BOARD_TABS, "board tab cover temp file stayed");
            }
        }
    }

    /** False when the source runs past the cap. */
    static boolean copyCapped(InputStream in, OutputStream out, long cap) throws IOException {
        byte[] buffer = new byte[64 * 1024];
        long total = 0;
        for (int read = in.read(buffer); read != -1; read = in.read(buffer)) {
            total += read;
            if (total > cap) return false;
            out.write(buffer, 0, read);
        }
        return true;
    }

    private static void loadFile(View image, String board, String name) {
        Context app = image.getContext().getApplicationContext();
        File file = new File(new File(app.getFilesDir(), FOLDER), name);
        if (!file.isFile()) return;
        int wanted = Math.max(image.getWidth(), image.getResources().getDisplayMetrics().widthPixels);
        WeakReference<View> target = new WeakReference<>(image);
        Utils.runOnBackgroundThread(() -> {
            Bitmap picture = decode(file, wanted);
            if (picture == null) return;
            Utils.runOnMainThread(() -> {
                View view = target.get();
                if (!(view instanceof ImageView) || !showing(view, board) || !covering()) return;
                Cover now = cover(board);
                if (now != null && FILE.equals(now.kind)) ((ImageView) view).setImageBitmap(picture);
            });
        });
    }

    @Nullable
    private static Bitmap decode(File file, int wanted) {
        try {
            BitmapFactory.Options bounds = new BitmapFactory.Options();
            bounds.inJustDecodeBounds = true;
            BitmapFactory.decodeFile(file.getPath(), bounds);
            if (bounds.outWidth <= 0 || bounds.outHeight <= 0) return null;
            int sample = 1;
            while (bounds.outWidth / (sample * 2) >= wanted && bounds.outHeight / (sample * 2) >= wanted) sample *= 2;
            while (Math.max(bounds.outWidth, bounds.outHeight) / sample > MAX_DECODED_SIDE) sample *= 2;
            BitmapFactory.Options options = new BitmapFactory.Options();
            options.inSampleSize = sample;
            return BitmapFactory.decodeFile(file.getPath(), options);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.BOARD_TABS, "read board tab cover file", failure);
            return null;
        }
    }
}
