package app.mightymorphing.extension.joey;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.ImageDecoder;
import android.graphics.Outline;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.widget.CheckBox;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Bundled sidebar header pictures. Joey's saved drawer file is left alone and
 * is shown only when the choice is Joey's image.
 */
public final class SeasonalBanner {
    private static final String PREFS = "morphe_seasonal";
    private static final String KEY_MODE = "mode";
    private static final String KEY_PICK = "pick";
    private static final String KEY_ANIM = "animation";
    private static final String KEY_JOEY_ANIM = "joey_animation";
    private static final String KEY_STILL = "still";
    private static final String ANIM_NONE = "none";
    private static final int OVERLAY = 0x4d4f0009;
    private static final int OURS = 0x4d4f000a;
    private static final int PENDING = 0x4d4f000b;
    private static final int LAID = 0x4d4f000c;
    private static final int KIND = 0x4d4f000d;
    private static final int STILL = 0x4d4f000e;
    private static final int FACE = 0x4d4f000f;
    /** Painted bottom of every seasonal square. The rest of the file below this is empty. */
    private static final float ART_BOTTOM = 0.79f;
    private static final float MODERN_SCALE = 1.36f;
    private static final String MODE_JOEY = "joey";
    private static final String MODE_HIDDEN = "hidden";
    private static final String MODE_SEASONAL = "seasonal";
    private static final String MODE_SEASON_JOEY = "season_joey";
    private static final String MODE_SEASON_CUSTOM = "season_custom";
    private static final String MODE_MANUAL = "manual";
    private static final String PICK_AUTO = "auto";

    private static final String[] IDS = {
            "newyear", "valentine", "blossom", "summer",
            "perseids", "diwali", "halloween", "christmas"
    };
    private static final String[] EXTRA_IDS = {
            "coffee", "synthwave", "jellyfish",
            "vinyl", "campfire", "potion", "origami"
    };
    private static final String[] NAMES = {
            "New Year", "Valentine's Day", "Cherry blossom", "Summer solstice",
            "Perseids", "Diwali", "Halloween", "Christmas"
    };
    private static final String[] EXTRA_NAMES = {
            "Espresso Café", "Synthwave 80s Cassette", "Bioluminescent Jellyfish",
            "Retro Vinyl Turntable", "Cozy Campfire & Embers",
            "Alchemist's Elixir Flask", "Origami Paper Crane"
    };
    private static final int[][] EXTRA_COLOURS = {
            {0xFF6D4C41, 0xFFFFE0B2},
            {0xFFFF2BD6, 0xFF2DE2E6},
            {0xFF26C6DA, 0xFF7E57C2},
            {0xFF1A1A1A, 0xFFE8D5A3},
            {0xFFE65100, 0xFF5D4037},
            {0xFF7B1FA2, 0xFF69F0AE},
            {0xFFF8F4EC, 0xFFE57373}
    };
    private static final String[] WINDOWS = {
            "31 Dec – 2 Jan", "13–15 Feb", "28 Mar – 5 Apr", "20–23 Jun",
            "11–14 Aug", "27–29 Oct", "31 Oct – 1 Nov", "1–25 Dec"
    };
    private static final int[][] COLOURS = {
            {0xFFE8C872, 0xFFF7F3EA},
            {0xFFE07A8A, 0xFF8E2F45},
            {0xFFF2A3C7, 0xFFFFF1F6},
            {0xFFF0C14A, 0xFFE07A3D},
            {0xFF6B7CFF, 0xFF1B2340},
            {0xFFB388FF, 0xFFF0C14A},
            {0xFFE07A3D, 0xFF2A2140},
            {0xFF2F6B4F, 0xFFC0392B}
    };
    private static final String[] LOGO_IDS = {
            "logo_plain", "logo_headphones", "logo_glasses", "logo_flower",
            "logo_leaf", "logo_bamboo", "logo_spark"
    };
    private static final String[] LOGO_NAMES = {
            "Plain", "Headphones", "Glasses", "Flower", "Leaf", "Bamboo", "Spark"
    };
    private static final int[] LOGO_COLOURS = {
            0xFF14B8A6, 0xFF3B82F6, 0xFF8B5CF6, 0xFFFB7185,
            0xFF34D399, 0xFFEAB308, 0xFFF59E0B
    };

    private static boolean sEnabled;
    private static WeakReference<View> sHeader;

    private SeasonalBanner() {
    }

    public static void enable() {
        sEnabled = true;
    }

    public static boolean isEnabled() {
        return sEnabled;
    }

    /** False only when Modern UI is on and the banner is hidden. Automatic with no season keeps Joey's picture. */
    public static boolean showsPicture(Context context) {
        return !(MODE_HIDDEN.equals(mode(context)) && modernHeader(context));
    }

    public static String summary(Context context) {
        String mode = mode(context);
        if (MODE_JOEY.equals(mode)) return "Joey";
        if (MODE_HIDDEN.equals(mode)) return "Hide";
        if (MODE_SEASON_JOEY.equals(mode)) return "Season + Joey";
        if (MODE_SEASON_CUSTOM.equals(mode)) return "Season + custom";
        if (MODE_MANUAL.equals(mode)) return "Manual";
        return "Season + Joey";
    }

    /** Copies and decodes off the main thread, so the first showing of a banner does not stutter. */
    private static final ExecutorService IO = Executors.newSingleThreadExecutor();

    /** Runs after the header row binds. Does nothing unless this patch is installed. */
    public static void apply(Object holder) {
        if (!sEnabled || holder == null) return;
        try {
            Object itemView = holder.getClass().getField("itemView").get(holder);
            if (!(itemView instanceof View)) return;
            View item = (View) itemView;
            Context context = item.getContext().getApplicationContext();
            Frame frame = current(context);
            boolean freeze = still(context);
            // The banner's files are made ready first, then the header is finished on the main thread.
            IO.execute(() -> {
                warm(context, frame, freeze);
                item.post(() -> finish(item));
            });
            scheduleMidnight(item);
        } catch (Throwable ignored) {
        }
    }

    /** The cache file and the decoded picture for what the header is about to show. */
    private static void warm(Context context, Frame frame, boolean freeze) {
        try {
            if (frame == null || !frame.visible || frame.joey || frame.picture == null) return;
            if (isLogo(frame.picture) && !freeze) cacheFile(context, frame.picture + "_icon.webp");
            else bitmapAsset(context, frame.picture + ".png");
            if (nameFor(frame.anim) != null) {
                if (freeze && isLogo(frame.anim)) bitmapAsset(context, frame.anim + "_bg.png");
                else cacheFile(context, frame.anim + "_overlay.webp");
            }
        } catch (Throwable ignored) {
        }
    }

    private static Runnable sMidnight;

    /** A season starts or ends at midnight. The header is finished again then, if it is still showing. */
    private static void scheduleMidnight(View item) {
        Runnable old = sMidnight;
        Calendar next = Calendar.getInstance();
        next.add(Calendar.DAY_OF_MONTH, 1);
        next.set(Calendar.HOUR_OF_DAY, 0);
        next.set(Calendar.MINUTE, 0);
        next.set(Calendar.SECOND, 5);
        next.set(Calendar.MILLISECOND, 0);
        long delay = next.getTimeInMillis() - System.currentTimeMillis();
        if (delay <= 0) return;
        WeakReference<View> ref = new WeakReference<>(item);
        Runnable run = () -> {
            View header = ref.get();
            if (header != null && header.isAttachedToWindow()) finish(header);
        };
        android.os.Handler main = new android.os.Handler(android.os.Looper.getMainLooper());
        if (old != null) main.removeCallbacks(old);
        sMidnight = run;
        main.postDelayed(run, delay);
    }

    public static void show(Activity activity, Runnable changed) {
        if (activity == null) return;
        float density = activity.getResources().getDisplayMetrics().density;
        final String[] draftMode = { mode(activity) };
        final String[] draftPick = { pick(activity) };
        final String[] draftAnim = { colour(activity) };
        final String[] draftJoeyAnim = { joeyAnim(activity) };
        final boolean[] draftStill = { still(activity) };
        final boolean[] draftPreview = { false };

        LinearLayout page = MorpheDialog.page(activity, "Seasonal sidebar banner", "Banner preview");
        Preview stage = roundedStage(activity, density);
        ImageView preview = new ImageView(activity);
        preview.setScaleType(ImageView.ScaleType.FIT_CENTER);
        stage.addView(preview, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        FitImage previewMotion = new FitImage(activity);
        stage.addView(previewMotion, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        TextView caption = new TextView(activity);
        caption.setTextColor(MorpheDialog.text(activity));
        caption.setTextSize(15);
        TextView when = new TextView(activity);
        when.setTextColor(MorpheDialog.sub(activity));
        when.setTextSize(13);
        when.setPadding(0, Math.round(4 * density), 0, Math.round(8 * density));
        CheckBox noMotion = MorpheDialog.check(activity, "No animation", draftStill[0], null);
        LinearLayout side = new LinearLayout(activity);
        side.setOrientation(LinearLayout.VERTICAL);
        side.setGravity(Gravity.CENTER_VERTICAL);
        side.setPadding(Math.round(12 * density), 0, 0, 0);
        side.addView(caption);
        side.addView(when);
        side.addView(noMotion);
        TextView previewOnly = new TextView(activity);
        previewOnly.setText("Preview only. Change the schedule to use this banner.");
        previewOnly.setTextColor(MorpheDialog.sub(activity));
        previewOnly.setTypeface(previewOnly.getTypeface(), android.graphics.Typeface.ITALIC);
        previewOnly.setTextSize(12);
        previewOnly.setPadding(0, Math.round(6 * density), 0, 0);
        previewOnly.setVisibility(View.GONE);
        side.addView(previewOnly);
        // The popup is up to 560dp wide. Below about 480dp the text goes under the preview, so the
        // preview keeps a useful size on a phone.
        float popupDp = Math.min(activity.getResources().getDisplayMetrics().widthPixels / density - 48, 560);
        boolean narrow = popupDp < 480;
        LinearLayout previewRow = new LinearLayout(activity);
        previewRow.setOrientation(narrow ? LinearLayout.VERTICAL : LinearLayout.HORIZONTAL);
        previewRow.setGravity(Gravity.CENTER_VERTICAL);
        if (narrow) {
            previewRow.addView(stage, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            side.setPadding(0, Math.round(10 * density), 0, 0);
            previewRow.addView(side, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        } else {
            previewRow.addView(stage, new LinearLayout.LayoutParams(
                    0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
            previewRow.addView(side, new LinearLayout.LayoutParams(
                    Math.round(200 * density), ViewGroup.LayoutParams.WRAP_CONTENT));
        }
        page.addView(previewRow);

        page.addView(MorpheDialog.section(activity, "Schedule", MorpheDialog.sub(activity)));
        Flow chips = new Flow(activity, density);
        TextView hidden = MorpheDialog.action(activity, "Hide", MorpheDialog.TEXT);
        TextView joey = MorpheDialog.action(activity, "Joey", MorpheDialog.TEXT);
        TextView seasonJoey = MorpheDialog.action(activity, "Season + Joey", MorpheDialog.TEXT);
        TextView seasonCustom = MorpheDialog.action(activity, "Season + custom", MorpheDialog.TEXT);
        TextView manual = MorpheDialog.action(activity, "Manual", MorpheDialog.TEXT);
        chips.addView(hidden);
        chips.addView(joey);
        chips.addView(seasonJoey);
        chips.addView(seasonCustom);
        chips.addView(manual);
        page.addView(chips);
        TextView scheduleNote = new TextView(activity);
        scheduleNote.setTextColor(MorpheDialog.sub(activity));
        scheduleNote.setTextSize(13);
        scheduleNote.setPadding(0, Math.round(6 * density), 0, 0);
        page.addView(scheduleNote);
        boolean hideLocked = !modernHeader(activity);

        page.addView(MorpheDialog.section(activity, "Custom banner", MorpheDialog.accent(activity)));
        page.addView(MorpheDialog.section(activity, "Seasonal", MorpheDialog.sub(activity)));
        DotRow seasons = new DotRow(activity);
        seasons.setPadding(0, Math.round(4 * density), 0, 0);
        SplitDot[] dots = new SplitDot[IDS.length];
        for (int i = 0; i < IDS.length; i++) {
            SplitDot circle = new SplitDot(activity, COLOURS[i][0], COLOURS[i][1]);
            seasons.addView(circle);
            dots[i] = circle;
        }
        page.addView(seasons, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        page.addView(MorpheDialog.section(activity, "Other", MorpheDialog.sub(activity)));
        DotRow others = new DotRow(activity);
        others.setPadding(0, Math.round(4 * density), 0, 0);
        SplitDot[] extraDots = new SplitDot[EXTRA_IDS.length];
        for (int i = 0; i < EXTRA_IDS.length; i++) {
            SplitDot circle = new SplitDot(activity, EXTRA_COLOURS[i][0], EXTRA_COLOURS[i][1]);
            others.addView(circle);
            extraDots[i] = circle;
        }
        page.addView(others, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        page.addView(MorpheDialog.section(activity, "Joey logo", MorpheDialog.sub(activity)));
        LinearLayout joeyGroup = new LinearLayout(activity);
        joeyGroup.setOrientation(LinearLayout.VERTICAL);
        int groupPad = Math.round(12 * density);
        joeyGroup.setPadding(groupPad, groupPad, groupPad, groupPad);
        android.graphics.drawable.GradientDrawable groupFill = new android.graphics.drawable.GradientDrawable();
        groupFill.setCornerRadius(Math.round(12 * density));
        groupFill.setColor(0x14FFFFFF);
        joeyGroup.setBackground(groupFill);
        DotRow logoRow = new DotRow(activity);
        logoRow.setPadding(0, Math.round(4 * density), 0, Math.round(8 * density));
        SplitDot[] logoDots = new SplitDot[LOGO_IDS.length];
        for (int i = 0; i < LOGO_IDS.length; i++) {
            SplitDot circle = new SplitDot(activity, LOGO_COLOURS[i], LOGO_COLOURS[i]);
            logoRow.addView(circle);
            logoDots[i] = circle;
        }
        DotRow bubbleRow = new DotRow(activity);
        bubbleRow.setPadding(0, Math.round(4 * density), 0, Math.round(8 * density));
        SplitDot[] bubbleDots = new SplitDot[LOGO_IDS.length];
        for (int i = 0; i < LOGO_IDS.length; i++) {
            SplitDot circle = new SplitDot(activity, LOGO_COLOURS[i], LOGO_COLOURS[i]);
            bubbleRow.addView(circle);
            bubbleDots[i] = circle;
        }
        TextView matchLogo = MorpheDialog.action(activity, "Match logo colour", MorpheDialog.TEXT);
        joeyGroup.addView(rowLabel(activity, "Logo colour"));
        joeyGroup.addView(logoRow, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        joeyGroup.addView(rowLabel(activity, "Animation colour"));
        joeyGroup.addView(bubbleRow, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        joeyGroup.addView(matchLogo, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        LinearLayout.LayoutParams groupGap = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        groupGap.topMargin = Math.round(4 * density);
        page.addView(joeyGroup, groupGap);

        final boolean[] skipMotion = { false };
        Runnable paint = () -> {
            boolean hiddenOn = MODE_HIDDEN.equals(draftMode[0]);
            boolean forcedJoey = hiddenOn && hideLocked;
            scheduleNote.setText(scheduleNote(draftMode[0]));
            MorpheDialog.setFilled(activity, hidden, hiddenOn);
            hidden.setEnabled(!hideLocked);
            hidden.setAlpha(hideLocked ? 0.38f : 1f);
            MorpheDialog.setFilled(activity, joey, MODE_JOEY.equals(draftMode[0]));
            MorpheDialog.setFilled(activity, seasonJoey, MODE_SEASON_JOEY.equals(draftMode[0]));
            MorpheDialog.setFilled(activity, seasonCustom, MODE_SEASON_CUSTOM.equals(draftMode[0]));
            MorpheDialog.setFilled(activity, manual, MODE_MANUAL.equals(draftMode[0]));
            float dim = hiddenOn && !forcedJoey ? 0.38f : 1f;
            previewRow.setAlpha(dim);
            boolean previewCustom = draftPreview[0]
                    && (MODE_JOEY.equals(draftMode[0]) || MODE_SEASON_JOEY.equals(draftMode[0]))
                    && nameFor(draftPick[0]) != null;
            previewOnly.setVisibility(previewCustom ? View.VISIBLE : View.GONE);
            Frame frame = previewCustom
                    ? shown(MODE_MANUAL, draftPick[0], draftAnim[0], draftJoeyAnim[0], draftStill[0], hideLocked)
                    : shown(draftMode[0], draftPick[0], draftAnim[0], draftJoeyAnim[0], draftStill[0], hideLocked);
            String shown = frame.picture;
            boolean joeyPicture = frame.joey;
            if (!frame.visible) {
                caption.setText("Hidden");
                when.setText("");
            } else if (joeyPicture) {
                caption.setText("Joey's picture");
                when.setText(MODE_SEASON_JOEY.equals(draftMode[0])
                        ? "No seasonal banner active today.\nClick a banner below to preview."
                        : "");
            } else {
                caption.setText(nameFor(shown));
                String window = windowFor(shown);
                when.setText(window.length() == 0 ? "" : "Runs " + window);
            }
            if (!frame.visible || (!joeyPicture && (shown == null || !showPreview(preview, shown, draftStill[0])))) {
                stopDrawable(preview);
                preview.setImageDrawable(null);
                preview.setTag(FACE, null);
                previewFrame(preview, false);
            } else if (joeyPicture) {
                preview.setTag(FACE, null);
                showJoey(preview);
                previewFrame(preview, false);
            } else {
                previewFrame(preview, !isLogo(shown));
            }
            String marked = nameFor(draftPick[0]) == null ? null : draftPick[0];
            int accent = MorpheDialog.accent(activity);
            for (int i = 0; i < dots.length; i++) {
                dots[i].setChosen(IDS[i].equals(marked), accent);
            }
            for (int i = 0; i < extraDots.length; i++) {
                extraDots[i].setChosen(EXTRA_IDS[i].equals(marked), accent);
            }
            for (int i = 0; i < logoDots.length; i++) {
                logoDots[i].setChosen(LOGO_IDS[i].equals(marked), accent);
                bubbleDots[i].setChosen(LOGO_IDS[i].equals(draftAnim[0]), accent);
            }
            MorpheDialog.setFilled(activity, matchLogo, isLogo(marked) && marked.equals(draftAnim[0]));
            boolean motionOff = draftStill[0];
            if (noMotion.isChecked() != motionOff) {
                skipMotion[0] = true;
                noMotion.setChecked(motionOff);
                skipMotion[0] = false;
            }
            boolean showMotion = frame.visible && preview.getDrawable() != null && !motionOff && nameFor(frame.anim) != null;
            boolean faceMoves = isLogo(shown);
            boolean logoField = faceMoves && isLogo(draftAnim[0]) && preview.getDrawable() != null && frame.visible;
            if (logoField && motionOff) {
                showStill(previewMotion, draftAnim[0]);
                fillWidth(previewMotion);
                preview.bringToFront();
            } else {
                play(previewMotion, showMotion ? frame.anim : ANIM_NONE);
                if (showMotion && (faceMoves || joeyPicture)) {
                    fillWidth(previewMotion);
                    preview.bringToFront();
                } else {
                    previewMotion.setScaleX(preview.getScaleX());
                    previewMotion.setScaleY(preview.getScaleY());
                    previewMotion.setTranslationY(preview.getTranslationY());
                    if (showMotion) previewMotion.bringToFront();
                }
            }
        };
        hidden.setOnClickListener(v -> {
            if (hideLocked) return;
            draftMode[0] = MODE_HIDDEN;
            paint.run();
        });
        joey.setOnClickListener(v -> {
            draftMode[0] = MODE_JOEY;
            draftPreview[0] = false;
            paint.run();
        });
        seasonJoey.setOnClickListener(v -> {
            draftMode[0] = MODE_SEASON_JOEY;
            draftPreview[0] = false;
            paint.run();
        });
        seasonCustom.setOnClickListener(v -> {
            draftMode[0] = MODE_SEASON_CUSTOM;
            paint.run();
        });
        manual.setOnClickListener(v -> {
            draftMode[0] = MODE_MANUAL;
            paint.run();
        });
        for (int i = 0; i < dots.length; i++) {
            final String id = IDS[i];
            dots[i].setOnClickListener(v -> {
                draftPick[0] = id;
                draftAnim[0] = id;
                draftPreview[0] = true;
                paint.run();
            });
        }
        for (int i = 0; i < extraDots.length; i++) {
            final String id = EXTRA_IDS[i];
            extraDots[i].setOnClickListener(v -> {
                draftPick[0] = id;
                draftAnim[0] = id;
                draftPreview[0] = true;
                paint.run();
            });
        }
        for (int i = 0; i < logoDots.length; i++) {
            final String id = LOGO_IDS[i];
            logoDots[i].setOnClickListener(v -> {
                draftPick[0] = id;
                if (!isLogo(draftAnim[0])) draftAnim[0] = id;
                draftPreview[0] = true;
                paint.run();
            });
            bubbleDots[i].setOnClickListener(v -> {
                draftAnim[0] = id;
                draftJoeyAnim[0] = id;
                if (nameFor(draftPick[0]) == null) draftPick[0] = id;
                draftPreview[0] = true;
                paint.run();
            });
        }
        matchLogo.setOnClickListener(v -> {
            if (!isLogo(draftPick[0])) return;
            draftAnim[0] = draftPick[0];
            draftJoeyAnim[0] = draftPick[0];
            paint.run();
        });
        noMotion.setOnCheckedChangeListener((button, checked) -> {
            if (skipMotion[0]) return;
            draftStill[0] = checked;
            if (!checked && nameFor(draftAnim[0]) == null) {
                Frame restored = shown(draftMode[0], draftPick[0], draftPick[0], draftJoeyAnim[0], false, hideLocked);
                draftAnim[0] = nameFor(restored.anim) == null ? ANIM_NONE : restored.anim;
            }
            paint.run();
        });
        paint.run();

        TextView cancel = MorpheDialog.action(activity, "Cancel", MorpheDialog.SUB);
        TextView save = MorpheDialog.action(activity, "Save", MorpheDialog.GOLD);
        page.addView(MorpheDialog.actions(activity, cancel, save));
        AlertDialog[] shown = new AlertDialog[1];
        cancel.setOnClickListener(v -> {
            if (shown[0] != null) shown[0].dismiss();
        });
        save.setOnClickListener(v -> {
            save(activity, draftMode[0], draftPick[0], draftAnim[0], draftJoeyAnim[0], draftStill[0]);
            refresh(activity);
            if (changed != null) changed.run();
            if (shown[0] != null) shown[0].dismiss();
        });
        // The preview loops, so it is stopped when the picker closes, however it closes.
        stage.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            @Override
            public void onViewAttachedToWindow(View view) {
            }

            @Override
            public void onViewDetachedFromWindow(View view) {
                stopDrawable(preview);
                stopDrawable(previewMotion);
            }
        });
        // Every banner's loop is copied out in the background, so tapping a dot does not wait on it.
        Context app = activity.getApplicationContext();
        IO.execute(() -> {
            for (String id : IDS) cacheFile(app, id + "_overlay.webp");
            for (String id : EXTRA_IDS) cacheFile(app, id + "_overlay.webp");
            for (String id : LOGO_IDS) {
                cacheFile(app, id + "_icon.webp");
                cacheFile(app, id + "_overlay.webp");
            }
        });
        shown[0] = MorpheDialog.show(activity, scroller(activity, page, density), 560);
    }

    private static Preview roundedStage(Activity activity, float density) {
        Preview stage = new Preview(activity);
        stage.setBackgroundColor(ModernUi.isModernUiEnabled(activity)
                ? ModernUi.getPalette(activity).canvas : 0xFF102022);
        int radius = Math.round(16 * density);
        stage.setOutlineProvider(new ViewOutlineProvider() {
            @Override
            public void getOutline(View view, Outline outline) {
                outline.setRoundRect(0, 0, view.getWidth(), view.getHeight(), radius);
            }
        });
        stage.setClipToOutline(true);
        return stage;
    }

    /** An animated picture keeps decoding until it is stopped, even once it is replaced. */
    private static void stopDrawable(ImageView view) {
        Drawable drawn = view.getDrawable();
        if (drawn instanceof Animatable) ((Animatable) drawn).stop();
    }

    private static void showJoey(ImageView view) {
        stopDrawable(view);
        Context context = view.getContext();
        int res = context.getResources().getIdentifier(
                "ic_drawer", "drawable", context.getPackageName());
        if (res == 0) {
            view.setImageDrawable(null);
            return;
        }
        view.setImageResource(res);
    }

    /** Fits the loop into the banner's rectangle, behind the username. A hidden picture removes it. */
    private static void syncOverlay(ImageView banner) {
        if (!(banner.getParent() instanceof ViewGroup)) return;
        ViewGroup parent = (ViewGroup) banner.getParent();
        ImageView overlay = null;
        for (int i = 0; i < parent.getChildCount(); i++) {
            View child = parent.getChildAt(i);
            if (child.getTag(OVERLAY) != null && child instanceof ImageView) overlay = (ImageView) child;
        }
        String anim = banner.getTag(PENDING) instanceof String ? (String) banner.getTag(PENDING) : ANIM_NONE;
        boolean show = banner.getVisibility() == View.VISIBLE && nameFor(anim) != null;
        boolean freeze = Boolean.TRUE.equals(banner.getTag(STILL));
        if (!show || (freeze && !"logo".equals(banner.getTag(KIND)))) {
            if (overlay != null) {
                Drawable drawn = overlay.getDrawable();
                if (drawn instanceof Animatable) ((Animatable) drawn).stop();
                parent.removeView(overlay);
            }
            return;
        }
        FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
        if (banner.getLayoutParams() instanceof FrameLayout.LayoutParams) {
            lp.gravity = ((FrameLayout.LayoutParams) banner.getLayoutParams()).gravity;
        }
        boolean behind = "logo".equals(banner.getTag(KIND)) || "joey".equals(banner.getTag(KIND));
        int at = parent.indexOfChild(banner);
        if (at < 0) return;
        int want = behind ? at : at + 1;
        if (overlay == null) {
            overlay = new FitImage(banner.getContext());
            overlay.setTag(OVERLAY, ANIM_NONE);
            parent.addView(overlay, want, lp);
        } else {
            overlay.setLayoutParams(lp);
            if (parent.indexOfChild(overlay) != want) {
                parent.removeView(overlay);
                at = parent.indexOfChild(banner);
                if (at < 0) return;
                parent.addView(overlay, behind ? at : at + 1, lp);
            }
        }
        if (behind && freeze && isLogo(anim)) {
            overlay.setPadding(0, 0, 0, 0);
            fillWidth(overlay);
            showStill(overlay, anim);
            return;
        }
        if (behind) {
            overlay.setPadding(0, 0, 0, 0);
            fillWidth(overlay);
        } else {
            overlay.setPadding(banner.getPaddingLeft(), banner.getPaddingTop(),
                    banner.getPaddingRight(), banner.getPaddingBottom());
            overlay.setScaleX(banner.getScaleX());
            overlay.setScaleY(banner.getScaleY());
            overlay.setTranslationY(banner.getTranslationY());
        }
        play(overlay, anim);
    }

    /** The fitted square is as wide as the header, so the bubbles run edge to edge behind the face. */
    private static void fillWidth(ImageView view) {
        int width = view.getWidth();
        int height = view.getHeight();
        if (width <= 0 || height <= 0) {
            view.post(() -> fillWidth(view));
            return;
        }
        float fitted = Math.min(width, height);
        float scale = width / fitted;
        view.setPivotX(width / 2f);
        view.setPivotY(height / 2f);
        view.setScaleX(scale);
        view.setScaleY(scale);
        view.setTranslationY(0f);
    }

    private static void play(ImageView view, String anim) {
        Drawable drawn = view.getDrawable();
        if (drawn instanceof Animatable) ((Animatable) drawn).stop();
        if (anim == null || ANIM_NONE.equals(anim) || Build.VERSION.SDK_INT < 28) {
            view.setImageDrawable(null);
            view.setTag(OVERLAY, ANIM_NONE);
            view.setVisibility(View.GONE);
            return;
        }
        if (!anim.equals(view.getTag(OVERLAY))) {
            Drawable motion = motion(view.getContext(), anim + "_overlay.webp");
            if (motion == null) {
                view.setImageDrawable(null);
                view.setVisibility(View.GONE);
                return;
            }
            view.setTag(OVERLAY, anim);
            view.setImageDrawable(motion);
        }
        view.setVisibility(View.VISIBLE);
        Drawable current = view.getDrawable();
        if (current instanceof Animatable) ((Animatable) current).start();
    }

    private static Drawable motion(Context context, String name) {
        if (Build.VERSION.SDK_INT < 28) return null;
        try {
            File cache = cacheFile(context, name);
            if (cache == null) return null;
            return ImageDecoder.decodeDrawable(ImageDecoder.createSource(cache));
        } catch (Throwable ignored) {
            return null;
        }
    }

    /** Files already copied this run, so a check does not read the asset again. */
    private static final java.util.Set<String> COPIED = java.util.Collections.synchronizedSet(new java.util.HashSet<>());

    /**
     * The loop is copied out of the app once. Synchronised, so the background warm-up and the
     * main thread never write the same file at once.
     */
    private static synchronized File cacheFile(Context context, String name) {
        try {
            File cache = new File(context.getCacheDir(), name);
            if (COPIED.contains(name) && cache.isFile()) return cache;
            long size = assetSize(context, name);
            if (!cache.isFile() || size < 0 || cache.length() != size) {
                try (InputStream in = context.getAssets().open("seasonal/" + name);
                     FileOutputStream out = new FileOutputStream(cache)) {
                    byte[] buffer = new byte[8192];
                    int read;
                    while ((read = in.read(buffer)) != -1) out.write(buffer, 0, read);
                }
            }
            COPIED.add(name);
            return cache;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static long assetSize(Context context, String name) {
        try (android.content.res.AssetFileDescriptor fd = context.getAssets().openFd("seasonal/" + name)) {
            return fd.getLength();
        } catch (Throwable ignored) {
            // Compressed assets have no descriptor. Fall back to reading the length.
        }
        try (InputStream in = context.getAssets().open("seasonal/" + name)) {
            long total = 0;
            byte[] buffer = new byte[8192];
            int read;
            while ((read = in.read(buffer)) != -1) total += read;
            return total;
        } catch (Throwable ignored) {
            return -1;
        }
    }

    /** Decoded pictures, kept so a header rebind does not decode a 1024px PNG again. */
    private static final android.util.LruCache<String, android.graphics.Bitmap> BITMAPS =
            new android.util.LruCache<String, android.graphics.Bitmap>(12 * 1024 * 1024) {
                @Override
                protected int sizeOf(String key, android.graphics.Bitmap value) {
                    return value.getByteCount();
                }
            };

    private static android.graphics.Bitmap bitmapAsset(Context context, String asset) {
        android.graphics.Bitmap cached = BITMAPS.get(asset);
        if (cached != null && !cached.isRecycled()) return cached;
        try (InputStream in = context.getAssets().open("seasonal/" + asset)) {
            android.graphics.Bitmap bitmap = BitmapFactory.decodeStream(in);
            if (bitmap != null) BITMAPS.put(asset, bitmap);
            return bitmap;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static boolean showPreview(ImageView view, String id, boolean freeze) {
        if (isLogo(id) && !freeze && playFace(view, id)) return true;
        return load(view, id);
    }

    /** Plays the face loop. A repeat call leaves the loop running. */
    private static boolean playFace(ImageView view, String id) {
        String asset = id + "_icon.webp";
        if (asset.equals(view.getTag(FACE))) {
            Drawable drawn = view.getDrawable();
            if (drawn instanceof Animatable) ((Animatable) drawn).start();
            return drawn != null;
        }
        Drawable motion = motion(view.getContext(), asset);
        if (motion == null) return false;
        stopDrawable(view);
        view.setTag(FACE, asset);
        view.setImageDrawable(motion);
        view.setTag(OURS, motion);
        view.setVisibility(View.VISIBLE);
        if (motion instanceof Animatable) ((Animatable) motion).start();
        return true;
    }

    /** The still bubble field, used when animation is off. */
    private static void showStill(ImageView view, String id) {
        Drawable drawn = view.getDrawable();
        if (drawn instanceof Animatable) ((Animatable) drawn).stop();
        String asset = id + "_bg.png";
        if (asset.equals(view.getTag(OVERLAY)) && view.getDrawable() != null) {
            view.setVisibility(View.VISIBLE);
            return;
        }
        android.graphics.Bitmap bitmap = bitmapAsset(view.getContext(), asset);
        if (bitmap == null) {
            view.setImageDrawable(null);
            view.setVisibility(View.GONE);
            return;
        }
        view.setTag(OVERLAY, asset);
        view.setImageBitmap(bitmap);
        view.setVisibility(View.VISIBLE);
    }

    private static boolean load(ImageView view, String id) {
        if (view == null || id == null) return false;
        android.graphics.Bitmap bitmap = bitmapAsset(view.getContext(), id + ".png");
        if (bitmap == null) return false;
        Drawable shown = view.getDrawable();
        boolean already = shown instanceof android.graphics.drawable.BitmapDrawable
                && ((android.graphics.drawable.BitmapDrawable) shown).getBitmap() == bitmap
                && shown == view.getTag(OURS);
        if (!already) {
            stopDrawable(view);
            view.setImageBitmap(bitmap);
            view.setTag(OURS, view.getDrawable());
        }
        view.setTag(FACE, null);
        return true;
    }

    private static void applyNow(View item) {
        if (!sEnabled || item == null) return;
        sHeader = new WeakReference<>(item);
        View image = find(item, "drawer_image");
        if (!(image instanceof ImageView)) return;
        ImageView view = (ImageView) image;
        Context context = item.getContext();
        restoreClassicHeight(item);
        Frame frame = current(item.getContext());
        if (!frame.visible) {
            view.setVisibility(View.GONE);
            view.setTag(PENDING, ANIM_NONE);
            return;
        }
        boolean freeze = still(context);
        if (frame.joey) {
            place(view, false);
            view.setTag(KIND, "joey");
            view.setVisibility(View.VISIBLE);
            restoreSize(view);
            releaseJoey(view);
            view.setTag(STILL, freeze);
            view.setTag(PENDING, frame.anim);
            return;
        }
        String picture = frame.picture;
        boolean movingFace = isLogo(picture) && !freeze;
        if (movingFace) {
            if (!playFace(view, picture) && !load(view, picture)) {
                view.setTag(PENDING, ANIM_NONE);
                return;
            }
        } else if (!load(view, picture)) {
            view.setTag(PENDING, ANIM_NONE);
            return;
        }
        view.setColorFilter(null);
        if (isLogo(picture)) placeLogo(view);
        else place(view, true);
        view.setVisibility(View.VISIBLE);
        restoreSize(view);
        view.setTag(STILL, freeze);
        view.setTag(PENDING, frame.anim);
    }

    /** After the picture is chosen, Modern UI paints the header, then the loop matches that rectangle. */
    private static void finish(View item) {
        applyNow(item);
        item.post(() -> {
            Sidebar.repaint(item);
            item.post(() -> {
                View image = find(item, "drawer_image");
                if (!(image instanceof ImageView)) return;
                ImageView view = (ImageView) image;
                if (view.getTag(OURS) != null && view.getTag(OURS) == view.getDrawable()) {
                    if ("logo".equals(view.getTag(KIND))) placeLogo(view);
                    else place(view, true);
                }
                syncOverlay(view);
            });
        });
    }

    /** Joey's bind already replaced a seasonal bitmap. This covers a refresh that did not rebind. */
    private static void releaseJoey(ImageView view) {
        Object ours = view.getTag(OURS);
        Drawable drawn = view.getDrawable();
        if (drawn instanceof Animatable) ((Animatable) drawn).stop();
        view.setTag(FACE, null);
        if (ours != null && ours == drawn) showJoey(view);
        view.setTag(OURS, null);
    }

    /** Puts back the fixed classic header if an earlier hide shrank it. */
    private static void restoreClassicHeight(View item) {
        if (modernHeader(item.getContext())) return;
        View top = find(item, "drawer_top");
        if (top == null) return;
        ViewGroup.LayoutParams lp = top.getLayoutParams();
        if (lp == null) return;
        int height = Math.round(168 * top.getResources().getDisplayMetrics().density);
        if (lp.height == height) return;
        lp.height = height;
        top.setLayoutParams(lp);
    }

    /** The settings preview is only the picture and the loop, centered in the frame. */
    private static void previewFrame(ImageView view, boolean seasonal) {
        view.setPadding(0, 0, 0, 0);
        view.setTranslationY(0f);
        view.setScaleType(ImageView.ScaleType.FIT_CENTER);
        float scale = seasonal ? 1.15f : 1f;
        if (view.getWidth() > 0 && view.getHeight() > 0) {
            view.setPivotX(view.getWidth() / 2f);
            view.setPivotY(view.getHeight() / 2f);
        }
        view.setScaleX(scale);
        view.setScaleY(scale);
    }

    /** Joey's bird stays put. A seasonal picture uses the same zoom in Classic and Modern. */
    private static void place(ImageView view, boolean seasonal) {
        view.setPadding(0, 0, 0, 0);
        view.setScaleType(ImageView.ScaleType.FIT_CENTER);
        float scale = seasonal ? MODERN_SCALE : 1f;
        if (view.getWidth() > 0 && view.getHeight() > 0) {
            view.setPivotX(view.getWidth() / 2f);
            view.setPivotY(view.getHeight() / 2f);
        }
        view.setScaleX(scale);
        view.setScaleY(scale);
        view.setTag(KIND, null);
        if (!seasonal) {
            view.setTranslationY(0f);
            return;
        }
        watchBounds(view);
        if (view.getWidth() <= 0 || view.getHeight() <= 0) {
            view.setTranslationY(0f);
            return;
        }
        view.setTranslationY(modernShift(view, scale));
    }

    /** Header height changes after the first bind, and again when the drawer is resized. */
    private static void watchBounds(ImageView view) {
        if (view.getTag(LAID) != null) return;
        view.setTag(LAID, Boolean.TRUE);
        view.addOnLayoutChangeListener((changed, left, top, right, bottom,
                                         oldLeft, oldTop, oldRight, oldBottom) -> {
            if (right - left == oldRight - oldLeft && bottom - top == oldBottom - oldTop) return;
            if (right - left <= 0 || bottom - top <= 0) return;
            if (!(changed instanceof ImageView)) return;
            ImageView image = (ImageView) changed;
            if (image.getTag(OURS) == null || image.getTag(OURS) != image.getDrawable()) return;
            if ("logo".equals(image.getTag(KIND))) placeLogo(image);
            else place(image, true);
            syncOverlay(image);
        });
    }

    /** Distance from the view centre down to the painted bottom, then across to the middle of the username row. */
    private static float modernShift(ImageView view, float scale) {
        float width = view.getWidth();
        float height = view.getHeight();
        float drawn = Math.min(width, height);
        float art = (height - drawn) / 2f + ART_BOTTOM * drawn;
        float scaled = height / 2f + (art - height / 2f) * scale;
        return height - nameRow(view) / 2f - scaled;
    }

    /** A face sits in the clear area above the username. The bubble field uses the same shift. */
    private static void placeLogo(ImageView view) {
        view.setPadding(0, 0, 0, 0);
        view.setScaleType(ImageView.ScaleType.FIT_CENTER);
        view.setTag(KIND, "logo");
        watchBounds(view);
        if (view.getWidth() <= 0 || view.getHeight() <= 0) {
            view.setScaleX(1f);
            view.setScaleY(1f);
            view.setTranslationY(0f);
            return;
        }
        view.setPivotX(view.getWidth() / 2f);
        view.setPivotY(view.getHeight() / 2f);
        float scale = (view.getHeight() - nameRow(view)) / (float) view.getHeight();
        view.setScaleX(scale);
        view.setScaleY(scale);
        view.setTranslationY(-nameRow(view) / 2f);
    }

    private static int nameRow(View image) {
        float density = image.getResources().getDisplayMetrics().density;
        int cap = Math.round(72 * density);
        int fallback = Math.round(48 * density);
        View name = find(image.getRootView(), "currentusername");
        if (name != null && name.getParent() instanceof View) {
            int row = ((View) name.getParent()).getHeight();
            if (row > 0 && row <= cap) return row;
        }
        return fallback;
    }

    /** Empty outside a date window, so Automatic shows no picture until the next one. */
    private static String automaticId() {
        Calendar now = Calendar.getInstance();
        if (inWindow(now, 12, 31, 1, 2)) return "newyear";
        if (inWindow(now, 2, 13, 2, 15)) return "valentine";
        if (inWindow(now, 3, 28, 4, 5)) return "blossom";
        if (inWindow(now, 6, 20, 6, 23)) return "summer";
        if (inWindow(now, 8, 11, 8, 14)) return "perseids";
        if (inWindow(now, 10, 27, 10, 29)) return "diwali";
        if (inWindow(now, 10, 31, 11, 1)) return "halloween";
        if (inWindow(now, 12, 1, 12, 25)) return "christmas";
        return null;
    }

    private static boolean inWindow(Calendar now, int startMonth, int startDay, int endMonth, int endDay) {
        int cur = (now.get(Calendar.MONTH) + 1) * 100 + now.get(Calendar.DAY_OF_MONTH);
        int start = startMonth * 100 + startDay;
        int end = endMonth * 100 + endDay;
        if (start <= end) return cur >= start && cur <= end;
        return cur >= start || cur <= end;
    }

    private static void refresh(Activity activity) {
        View header = sHeader == null ? null : sHeader.get();
        if (header != null && rebind(header)) return;
        if (header != null) finish(header);
        try {
            int id = activity.getResources().getIdentifier(
                    "home_left_drawer_recycler_view", "id", activity.getPackageName());
            if (id == 0) return;
            View recycler = activity.findViewById(id);
            if (recycler == null) return;
            Object adapter = recycler.getClass().getMethod("getAdapter").invoke(recycler);
            if (adapter != null) adapter.getClass().getMethod("notifyDataSetChanged").invoke(adapter);
        } catch (Throwable ignored) {
        }
    }

    private static boolean rebind(View item) {
        try {
            View child = item;
            while (child != null && child.getParent() instanceof View) {
                View parent = (View) child.getParent();
                if (parent.getClass().getName().contains("RecyclerView")) {
                    Object pos = parent.getClass().getMethod("getChildAdapterPosition", View.class)
                            .invoke(parent, child);
                    Object adapter = parent.getClass().getMethod("getAdapter").invoke(parent);
                    if (adapter != null && pos instanceof Integer && (Integer) pos >= 0) {
                        adapter.getClass().getMethod("notifyItemChanged", int.class).invoke(adapter, pos);
                        return true;
                    }
                }
                child = parent;
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    private static void restoreSize(View view) {
        ViewGroup.LayoutParams lp = view.getLayoutParams();
        if (lp != null && (lp.width == 0 || lp.height == 0)) {
            lp.width = ViewGroup.LayoutParams.MATCH_PARENT;
            lp.height = ViewGroup.LayoutParams.MATCH_PARENT;
            view.setLayoutParams(lp);
        }
    }

    /** Resource ids are fixed for the app, so each name is looked up once. */
    private static final Map<String, Integer> IDS_BY_NAME = new HashMap<>();

    private static int idOf(View root, String name) {
        Integer cached = IDS_BY_NAME.get(name);
        if (cached != null) return cached;
        int id = root.getResources().getIdentifier(name, "id", root.getContext().getPackageName());
        IDS_BY_NAME.put(name, id);
        return id;
    }

    private static View find(View root, String name) {
        if (root == null) return null;
        int id = idOf(root, name);
        if (id != 0) {
            View found = root.findViewById(id);
            if (found != null) return found;
        }
        if (root instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) root;
            for (int i = 0; i < group.getChildCount(); i++) {
                View found = find(group.getChildAt(i), name);
                if (found != null) return found;
            }
        }
        return null;
    }

    private static String mode(Context context) {
        try {
            SharedPreferences savedPrefs = prefs(context);
            if (!savedPrefs.contains(KEY_MODE)) {
                boolean modernHides = MorpheSettings.modernUiControls()
                        && ModernUi.isModernUiEnabled(context)
                        && !ModernUi.savedSidebarBird(context);
                return modernHides ? MODE_HIDDEN : MODE_JOEY;
            }
            String saved = savedPrefs.getString(KEY_MODE, MODE_HIDDEN);
            if (MODE_SEASONAL.equals(saved)) {
                return PICK_AUTO.equals(pick(context)) ? MODE_SEASON_JOEY : MODE_MANUAL;
            }
            if (MODE_HIDDEN.equals(saved) || MODE_JOEY.equals(saved) || MODE_SEASON_JOEY.equals(saved)
                    || MODE_SEASON_CUSTOM.equals(saved) || MODE_MANUAL.equals(saved)) {
                return saved;
            }
            return MODE_HIDDEN;
        } catch (Throwable ignored) {
            return MODE_HIDDEN;
        }
    }

    private static String pick(Context context) {
        try {
            String saved = prefs(context).getString(KEY_PICK, PICK_AUTO);
            if (saved == null || saved.trim().isEmpty()) return PICK_AUTO;
            return saved;
        } catch (Throwable ignored) {
            return PICK_AUTO;
        }
    }

    private static String colour(Context context) {
        try {
            String saved = prefs(context).getString(KEY_ANIM, ANIM_NONE);
            return nameFor(saved) == null ? ANIM_NONE : saved;
        } catch (Throwable ignored) {
            return ANIM_NONE;
        }
    }

    private static boolean still(Context context) {
        try {
            SharedPreferences prefs = prefs(context);
            if (!prefs.contains(KEY_STILL)) return nameFor(prefs.getString(KEY_ANIM, ANIM_NONE)) == null;
            return prefs.getBoolean(KEY_STILL, false);
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static String joeyAnim(Context context) {
        try {
            SharedPreferences prefs = prefs(context);
            String saved = prefs.getString(KEY_JOEY_ANIM, null);
            if (saved == null) saved = prefs.getString(KEY_ANIM, ANIM_NONE);
            return isLogo(saved) ? saved : ANIM_NONE;
        } catch (Throwable ignored) {
            return ANIM_NONE;
        }
    }

    private static void save(Context context, String mode, String pick, String anim, String joeyAnim, boolean freeze) {
        try {
            prefs(context).edit()
                    .putString(KEY_MODE, mode)
                    .putString(KEY_PICK, pick)
                    .putString(KEY_ANIM, nameFor(anim) == null ? ANIM_NONE : anim)
                    .putString(KEY_JOEY_ANIM, isLogo(joeyAnim) ? joeyAnim : ANIM_NONE)
                    .putBoolean(KEY_STILL, freeze)
                    .apply();
        } catch (Throwable ignored) {
        }
    }

    private static SharedPreferences prefs(Context context) {
        return context.getApplicationContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    private static boolean modernHeader(Context context) {
        return MorpheSettings.modernUiControls() && ModernUi.isModernUiEnabled(context);
    }

    private static String windowFor(String id) {
        for (int i = 0; i < IDS.length; i++) {
            if (IDS[i].equals(id)) return WINDOWS[i];
        }
        return "";
    }

    private static String nameFor(String id) {
        String season = seasonId(id);
        if (season != null) return season;
        return extraId(id);
    }

    /** What the schedule shows. The custom pick is only used by Season + custom and Manual. */
    private static Frame current(Context context) {
        return shown(mode(context), pick(context), colour(context), joeyAnim(context), still(context), !modernHeader(context));
    }

    private static Frame shown(String mode, String pick, String anim, String joeyAnim, boolean freeze, boolean hideLocked) {
        if (MODE_HIDDEN.equals(mode) && !hideLocked) return new Frame(false, null, true, ANIM_NONE);
        if (MODE_HIDDEN.equals(mode) || MODE_JOEY.equals(mode)) {
            return new Frame(true, null, true, ANIM_NONE);
        }
        boolean seasonal = MODE_SEASON_JOEY.equals(mode) || MODE_SEASON_CUSTOM.equals(mode);
        String season = seasonal ? automaticId() : null;
        if (season != null) return new Frame(true, season, false, freeze ? ANIM_NONE : season);
        if (MODE_SEASON_JOEY.equals(mode)) return new Frame(true, null, true, ANIM_NONE);
        String custom = nameFor(pick) == null ? null : pick;
        if (custom == null) return new Frame(true, null, true, ANIM_NONE);
        String motion = nameFor(anim) == null ? custom : anim;
        if (freeze && !isLogo(custom)) motion = ANIM_NONE;
        return new Frame(true, custom, false, motion);
    }

    private static String scheduleNote(String mode) {
        if (MODE_HIDDEN.equals(mode)) return "Hides the banner area.";
        if (MODE_JOEY.equals(mode)) return "Joey's picture, no animation.";
        if (MODE_SEASON_JOEY.equals(mode)) return "Seasonal banners on their dates. Joey's picture on other days.";
        if (MODE_SEASON_CUSTOM.equals(mode)) return "Seasonal banners on their dates. Your chosen banner on other days.";
        if (MODE_MANUAL.equals(mode)) return "Stays on the banner you set.";
        return "Choose a schedule.";
    }

    private static final class Frame {
        final boolean visible;
        final String picture;
        final boolean joey;
        final String anim;

        Frame(boolean visible, String picture, boolean joey, String anim) {
            this.visible = visible;
            this.picture = picture;
            this.joey = joey;
            this.anim = anim;
        }
    }

    private static String seasonId(String id) {
        for (int i = 0; i < IDS.length; i++) {
            if (IDS[i].equals(id)) return NAMES[i];
        }
        return null;
    }

    private static String extraId(String id) {
        for (int i = 0; i < EXTRA_IDS.length; i++) {
            if (EXTRA_IDS[i].equals(id)) return EXTRA_NAMES[i];
        }
        return logoId(id);
    }

    private static boolean isLogo(String id) {
        return logoId(id) != null;
    }

    private static String logoId(String id) {
        for (int i = 0; i < LOGO_IDS.length; i++) {
            if (LOGO_IDS[i].equals(id)) return LOGO_NAMES[i];
        }
        return null;
    }

    private static TextView rowLabel(Activity activity, String label) {
        TextView view = new TextView(activity);
        view.setText(label);
        view.setTextColor(MorpheDialog.sub(activity));
        view.setTextSize(13);
        return view;
    }

    /** Scrolls this popup only. The bar stays hidden while the page fits. */
    private static ScrollView scroller(Activity activity, View page, float density) {
        ScrollView scroll = new ScrollView(activity);
        scroll.setFillViewport(false);
        scroll.setVerticalScrollBarEnabled(true);
        scroll.setScrollbarFadingEnabled(true);
        scroll.addView(page, new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        int width = Math.round(560 * density);
        scroll.measure(
                View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
        int max = activity.getResources().getDisplayMetrics().heightPixels - Math.round(48 * density);
        int height = Math.min(scroll.getMeasuredHeight(), Math.max(max, 1));
        scroll.setLayoutParams(new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, height));
        return scroll;
    }

    /** Wraps the choice chips onto the next line, the same way the splash motions do. */
    private static final class Flow extends ViewGroup {
        private final int gap;

        Flow(Context context, float density) {
            super(context);
            gap = Math.round(8 * density);
        }

        @Override
        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            int width = View.MeasureSpec.getSize(widthMeasureSpec);
            int x = 0;
            int y = 0;
            int rowHeight = 0;
            for (int i = 0; i < getChildCount(); i++) {
                View child = getChildAt(i);
                measureChild(child, widthMeasureSpec, heightMeasureSpec);
                int[] extra = margins(child);
                int childWidth = child.getMeasuredWidth() + extra[0];
                if (x > 0 && x + childWidth > width) {
                    x = 0;
                    y += rowHeight + gap;
                    rowHeight = 0;
                }
                x += childWidth + gap;
                rowHeight = Math.max(rowHeight, child.getMeasuredHeight() + extra[1]);
            }
            setMeasuredDimension(width, y + rowHeight);
        }

        @Override
        protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
            int width = right - left;
            int x = 0;
            int y = 0;
            int rowHeight = 0;
            for (int i = 0; i < getChildCount(); i++) {
                View child = getChildAt(i);
                int[] extra = margins(child);
                int childWidth = child.getMeasuredWidth() + extra[0];
                int childHeight = child.getMeasuredHeight() + extra[1];
                if (x > 0 && x + childWidth > width) {
                    x = 0;
                    y += rowHeight + gap;
                    rowHeight = 0;
                }
                int atX = x + (child.getLayoutParams() instanceof ViewGroup.MarginLayoutParams
                        ? ((ViewGroup.MarginLayoutParams) child.getLayoutParams()).leftMargin : 0);
                int atY = y + (child.getLayoutParams() instanceof ViewGroup.MarginLayoutParams
                        ? ((ViewGroup.MarginLayoutParams) child.getLayoutParams()).topMargin : 0);
                child.layout(atX, atY, atX + child.getMeasuredWidth(), atY + child.getMeasuredHeight());
                x += childWidth + gap;
                rowHeight = Math.max(rowHeight, childHeight);
            }
        }

        private static int[] margins(View child) {
            if (!(child.getLayoutParams() instanceof ViewGroup.MarginLayoutParams)) return new int[]{0, 0};
            ViewGroup.MarginLayoutParams lp = (ViewGroup.MarginLayoutParams) child.getLayoutParams();
            return new int[]{lp.leftMargin + lp.rightMargin, lp.topMargin + lp.bottomMargin};
        }
    }

    /** One row. The marks shrink together if the card is narrower than eight of them. */
    private static final class DotRow extends LinearLayout {
        DotRow(Context context) {
            super(context);
            setOrientation(HORIZONTAL);
        }

        @Override
        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            float density = getResources().getDisplayMetrics().density;
            int gap = Math.round(8 * density);
            int maxDot = Math.round(32 * density);
            int count = Math.max(getChildCount(), 1);
            int width = View.MeasureSpec.getMode(widthMeasureSpec) == View.MeasureSpec.UNSPECIFIED
                    ? Math.round(320 * density) : View.MeasureSpec.getSize(widthMeasureSpec);
            int inner = Math.max(width - getPaddingLeft() - getPaddingRight(), 1);
            int dot = Math.min(maxDot, (inner - gap * (count - 1)) / count);
            dot = Math.max(dot, 1);
            int spec = View.MeasureSpec.makeMeasureSpec(dot, View.MeasureSpec.EXACTLY);
            for (int i = 0; i < getChildCount(); i++) getChildAt(i).measure(spec, spec);
            setMeasuredDimension(width, dot + getPaddingTop() + getPaddingBottom());
        }

        @Override
        protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
            float density = getResources().getDisplayMetrics().density;
            int gap = Math.round(8 * density);
            int x = getPaddingLeft();
            int y = getPaddingTop();
            for (int i = 0; i < getChildCount(); i++) {
                View child = getChildAt(i);
                child.layout(x, y, x + child.getMeasuredWidth(), y + child.getMeasuredHeight());
                x += child.getMeasuredWidth() + gap;
            }
        }
    }

    /** Joey's drawer is 320dp wide and the header picture is 168dp tall, folded or open. */
    private static final class Preview extends FrameLayout {
        Preview(Context context) {
            super(context);
        }

        @Override
        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            float density = getResources().getDisplayMetrics().density;
            int bannerW = Math.round(320 * density);
            int available = View.MeasureSpec.getMode(widthMeasureSpec) == View.MeasureSpec.UNSPECIFIED
                    ? bannerW : View.MeasureSpec.getSize(widthMeasureSpec);
            int width = Math.min(Math.max(available, 1), bannerW);
            int height = Math.round(width * 168f / 320f);
            super.onMeasure(
                    View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                    View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.EXACTLY));
            setMeasuredDimension(width, height);
        }
    }

    /** Draws an animated overlay in the same centered rectangle as a still banner. */
    private static final class FitImage extends ImageView {
        FitImage(Context context) {
            super(context);
            setScaleType(ScaleType.MATRIX);
        }

        @Override
        protected void onDraw(Canvas canvas) {
            Drawable drawn = getDrawable();
            if (drawn == null) return;
            int innerW = getWidth() - getPaddingLeft() - getPaddingRight();
            int innerH = getHeight() - getPaddingTop() - getPaddingBottom();
            int sourceW = drawn.getIntrinsicWidth();
            int sourceH = drawn.getIntrinsicHeight();
            if (innerW <= 0 || innerH <= 0 || sourceW <= 0 || sourceH <= 0) return;
            float scale = Math.min(innerW / (float) sourceW, innerH / (float) sourceH);
            int width = Math.max(1, Math.round(sourceW * scale));
            int height = Math.max(1, Math.round(sourceH * scale));
            int left = getPaddingLeft() + (innerW - width) / 2;
            int top = getPaddingTop() + (innerH - height) / 2;
            drawn.setBounds(left, top, left + width, top + height);
            drawn.draw(canvas);
        }
    }

    /** Draws an animated overlay in the same centered rectangle as a still banner. */
    private static final class SplitDot extends View {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final int first;
        private final int second;
        private boolean chosen;
        private int ring;

        SplitDot(Context context, int first, int second) {
            super(context);
            this.first = first;
            this.second = second;
        }

        void setChosen(boolean chosen, int ring) {
            this.chosen = chosen;
            this.ring = ring;
            invalidate();
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float size = Math.min(getWidth(), getHeight());
            float radius = size / 2f;
            float cx = getWidth() / 2f;
            float cy = getHeight() / 2f;
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(first);
            canvas.drawCircle(cx, cy, radius, paint);
            canvas.save();
            Path half = new Path();
            half.moveTo(0, 0);
            half.lineTo(0, getHeight());
            half.lineTo(getWidth(), getHeight());
            half.close();
            canvas.clipPath(half);
            paint.setColor(second);
            canvas.drawCircle(cx, cy, radius, paint);
            canvas.restore();
            if (chosen) {
                paint.setStyle(Paint.Style.STROKE);
                paint.setStrokeWidth(Math.max(2f, getResources().getDisplayMetrics().density * 2f));
                paint.setColor(ring);
                canvas.drawCircle(cx, cy, radius - paint.getStrokeWidth(), paint);
            }
        }
    }
}
