package dev.jason.gboardpatches.extension.customstickers;

import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.text.TextUtils;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.GridLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicInteger;

/** Feature-drawn views for Custom Stickers: the pack list with covers and a pack's sticker grid. */
final class GboardCustomStickersViews {
    private static final String TAG = "GboardPatches";
    private static final int COLUMNS = 4;
    private static final int THUMBNAIL_PX = 192;
    private static final int TILE_COLOR = 0x14808080;
    private static final int MAX_OUTLINE_WIDTH = GboardCustomStickersStore.MAX_OUTLINE_WIDTH;
    // Beyond this the flood fill eats most subjects; Strong used to be 80.
    private static final int MAX_BACKGROUND_TOLERANCE = 100;
    // One shared worker: previews are rebuilt on every settings refresh and while dragging.
    private static final ExecutorService PREVIEW_RENDERER = Executors.newSingleThreadExecutor(
            runnable -> {
                Thread thread = new Thread(runnable, "GboardStickerPreview");
                thread.setDaemon(true);
                return thread;
            });

    interface StickerClick {
        void onClick(String fileName, int position);
    }

    interface PackClick {
        void onClick(String packId);
    }

    /**
     * One row per pack: cover, name, and a summary line supplied by the caller. Long-press drags
     * a pack to a new place.
     */
    static View createPackList(Context context, List<GboardCustomStickersStore.Pack> packs,
            List<String> summaries, PackClick click, Moved moved) {
        List<String> packIds = new ArrayList<>();
        for (GboardCustomStickersStore.Pack pack : packs) packIds.add(pack.id);
        float density = density(context);
        int primary = resolveColor(context, android.R.attr.textColorPrimary,
                isNight(context) ? Color.WHITE : Color.BLACK);
        int secondary = resolveColor(context, android.R.attr.textColorSecondary,
                isNight(context) ? 0xFFBDBDBD : 0xFF5F6368);
        LinearLayout list = new LinearLayout(context);
        list.setOrientation(LinearLayout.VERTICAL);
        List<ImageView> covers = new ArrayList<>();
        List<File> files = new ArrayList<>();
        for (int i = 0; i < packs.size(); i++) {
            GboardCustomStickersStore.Pack pack = packs.get(i);
            LinearLayout row = new LinearLayout(context);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setMinimumHeight(px(density, 72));
            row.setPadding(px(density, 16), px(density, 8), px(density, 16), px(density, 8));
            row.setBackgroundResource(selectableBackground(context));
            row.setClickable(true);
            row.setFocusable(true);
            row.setOnClickListener(view -> click.onClick(pack.id));
            attachReorder(row, pack.id, i, packIds, moved);
            row.setContentDescription(pack.name + ", " + summaries.get(i));

            ImageView cover = new ImageView(context);
            cover.setScaleType(ImageView.ScaleType.FIT_CENTER);
            int inset = px(density, 4);
            cover.setPadding(inset, inset, inset, inset);
            cover.setBackground(tile(density, 0, 0));
            cover.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            row.addView(cover, new LinearLayout.LayoutParams(px(density, 52), px(density, 52)));
            if (pack.cover != null) {
                covers.add(cover);
                files.add(GboardCustomStickersStore.stickerFile(context, pack.id, pack.cover));
            }

            LinearLayout texts = new LinearLayout(context);
            texts.setOrientation(LinearLayout.VERTICAL);
            texts.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);
            TextView name = new TextView(context);
            name.setText(pack.name);
            name.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16f);
            name.setTextColor(primary);
            name.setSingleLine(true);
            name.setEllipsize(TextUtils.TruncateAt.END);
            texts.addView(name);
            TextView summary = new TextView(context);
            summary.setText(summaries.get(i));
            summary.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
            summary.setTextColor(secondary);
            texts.addView(summary);
            LinearLayout.LayoutParams textParams =
                    new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f);
            textParams.leftMargin = px(density, 16);
            row.addView(texts, textParams);

            TextView chevron = new TextView(context);
            chevron.setText("›");
            chevron.setTextSize(TypedValue.COMPLEX_UNIT_SP, 22f);
            chevron.setTextColor(secondary);
            chevron.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            row.addView(chevron);
            list.addView(row);
        }
        loadThumbnails(covers, files, null);
        return list;
    }

    interface Moved {
        void onMoved(String key, int target);
    }

    /** Labels shown on the grid; {@code photo} marks stickers Messenger shows as photos. */
    static final class GridLabels {
        final String item;
        final String cover;
        final String photo;
        final String selected;

        GridLabels(String item, String cover, String photo, String selected) {
            this.item = item;
            this.cover = cover;
            this.photo = photo;
            this.selected = selected;
        }
    }

    /**
     * Square tiles, four per row. Long-press drags a sticker to a new place. When
     * {@code selected} is not null the grid is in selection mode and shows check marks.
     */
    static View createStickerGrid(Context context, GboardCustomStickersStore.Pack pack,
            GridLabels labels, java.util.Set<String> selected, StickerClick click, Moved moved) {
        float density = density(context);
        int gap = px(density, 4);
        int accent = resolveColor(context, android.R.attr.colorAccent, 0xFF1A73E8);
        GridLayout grid = new GridLayout(context);
        grid.setColumnCount(COLUMNS);
        grid.setPadding(gap, gap, gap, gap);
        List<ImageView> images = new ArrayList<>();
        List<File> files = new ArrayList<>();
        List<View> photoBadges = new ArrayList<>();
        for (int i = 0; i < pack.stickers.size(); i++) {
            String fileName = pack.stickers.get(i);
            int position = i;
            boolean isCover = fileName.equals(pack.cover);
            boolean isSelected = selected != null && selected.contains(fileName);
            FrameLayout cell = new SquareFrame(context);
            cell.setBackground(tile(density,
                    isSelected ? px(density, 3) : isCover ? px(density, 2) : 0, accent));
            cell.setPadding(gap * 2, gap * 2, gap * 2, gap * 2);
            String label = String.format(Locale.ROOT, labels.item, i + 1);
            if (isCover) label += ", " + labels.cover;
            if (isSelected) label += ", " + labels.selected;
            cell.setContentDescription(label);
            cell.setClickable(true);
            cell.setFocusable(true);
            int ripple = selectableBackground(context);
            if (ripple != 0) cell.setForeground(context.getDrawable(ripple));
            cell.setOnClickListener(view -> click.onClick(fileName, position));
            attachReorder(cell, fileName, position, pack.stickers, moved);
            ImageView image = new ImageView(context);
            image.setScaleType(ImageView.ScaleType.FIT_CENTER);
            image.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            cell.addView(image, new FrameLayout.LayoutParams(
                    FrameLayout.LayoutParams.MATCH_PARENT, FrameLayout.LayoutParams.MATCH_PARENT,
                    Gravity.CENTER));
            if (isCover) {
                cell.addView(badge(context, density, labels.cover, accent),
                        new FrameLayout.LayoutParams(FrameLayout.LayoutParams.WRAP_CONTENT,
                                FrameLayout.LayoutParams.WRAP_CONTENT, Gravity.TOP | Gravity.START));
            }
            if (selected != null) {
                TextView check = badge(context, density, isSelected ? "✓" : " ",
                        isSelected ? accent : 0x66000000);
                cell.addView(check, new FrameLayout.LayoutParams(
                        FrameLayout.LayoutParams.WRAP_CONTENT,
                        FrameLayout.LayoutParams.WRAP_CONTENT, Gravity.TOP | Gravity.END));
            }
            TextView photo = badge(context, density, labels.photo, 0xCC5F6368);
            photo.setVisibility(View.GONE);
            cell.addView(photo, new FrameLayout.LayoutParams(
                    FrameLayout.LayoutParams.WRAP_CONTENT,
                    FrameLayout.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL));
            GridLayout.LayoutParams params = new GridLayout.LayoutParams(
                    GridLayout.spec(i / COLUMNS), GridLayout.spec(i % COLUMNS, 1f));
            params.width = 0;
            params.setMargins(gap, gap, gap, gap);
            grid.addView(cell, params);
            images.add(image);
            files.add(GboardCustomStickersStore.stickerFile(context, pack.id, fileName));
            photoBadges.add(photo);
        }
        // An incomplete last row still needs its columns to keep their width.
        for (int i = pack.stickers.size(); i % COLUMNS != 0; i++) {
            GridLayout.LayoutParams params = new GridLayout.LayoutParams(
                    GridLayout.spec(i / COLUMNS), GridLayout.spec(i % COLUMNS, 1f));
            params.width = 0;
            params.setMargins(gap, gap, gap, gap);
            grid.addView(new View(context), params);
        }
        loadThumbnails(images, files, photoBadges);
        return grid;
    }

    private static TextView badge(Context context, float density, String text, int color) {
        TextView badge = new TextView(context);
        badge.setText(text);
        badge.setTextSize(TypedValue.COMPLEX_UNIT_SP, 10f);
        badge.setTextColor(Color.WHITE);
        badge.setPadding(px(density, 6), px(density, 1), px(density, 6), px(density, 1));
        GradientDrawable background = new GradientDrawable();
        background.setCornerRadius(px(density, 8));
        background.setColor(color);
        badge.setBackground(background);
        badge.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        return badge;
    }

    /** Long-press starts dragging {@code key}; dropping it on this view moves it here. */
    private static void attachReorder(View view, String key, int position, List<String> keys,
            Moved moved) {
        view.setOnLongClickListener(source -> source.startDragAndDrop(
                android.content.ClipData.newPlainText(key, key),
                new View.DragShadowBuilder(source), key, 0));
        view.setOnDragListener((target, event) -> {
            Object dragged = event.getLocalState();
            switch (event.getAction()) {
                case android.view.DragEvent.ACTION_DRAG_STARTED:
                    // Only drags started by this list take part.
                    return dragged instanceof String && keys.contains(dragged);
                case android.view.DragEvent.ACTION_DRAG_ENTERED:
                    target.setAlpha(0.5f);
                    return true;
                case android.view.DragEvent.ACTION_DROP:
                    target.setAlpha(1f);
                    if (!key.equals(dragged)) moved.onMoved((String) dragged, position);
                    return true;
                default:
                    target.setAlpha(1f);
                    return true;
            }
        });
    }

    /**
     * Large preview of an edited sticker on a checkerboard, so transparent areas are visible.
     * Rendering runs off the UI thread with the same code that saves the sticker.
     */
    static final class EditorLabels {
        final String description;
        final String holdHint;
        final String backgroundNotFound;
        final String background;
        final String corners;
        final String outline;

        EditorLabels(String description, String holdHint, String backgroundNotFound,
                String background, String corners, String outline) {
            this.description = description;
            this.holdHint = holdHint;
            this.backgroundNotFound = backgroundNotFound;
            this.background = background;
            this.corners = corners;
            this.outline = outline;
        }
    }

    /**
     * Preview of {@code original} with the edits, on a checkerboard so transparent areas show;
     * holding the image shows the original. Rendering runs off the UI thread with the same code
     * that saves the sticker.
     */
    static View createEditorPreview(Context context, File original,
            GboardCustomStickersStore.Edits edits, EditorLabels labels,
            EditsChosen editsChosen) {
        float density = density(context);
        int secondary = resolveColor(context, android.R.attr.textColorSecondary,
                isNight(context) ? 0xFFBDBDBD : 0xFF5F6368);
        LinearLayout column = new LinearLayout(context);
        column.setOrientation(LinearLayout.VERTICAL);
        column.setGravity(Gravity.CENTER_HORIZONTAL);
        column.setPadding(0, px(density, 12), 0, px(density, 12));

        ImageView image = new ImageView(context);
        image.setScaleType(ImageView.ScaleType.FIT_CENTER);
        int inset = px(density, 12);
        image.setPadding(inset, inset, inset, inset);
        image.setBackground(checkerboard(context, density));
        image.setContentDescription(labels.description);
        int size = px(density, 240);
        column.addView(image, new LinearLayout.LayoutParams(size, size));

        TextView hint = new TextView(context);
        hint.setText(labels.holdHint);
        hint.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
        hint.setTextColor(secondary);
        hint.setPadding(0, px(density, 6), 0, 0);
        column.addView(hint);

        TextView caption = new TextView(context);
        caption.setText(labels.backgroundNotFound);
        caption.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
        caption.setTextColor(secondary);
        caption.setGravity(Gravity.CENTER);
        caption.setPadding(px(density, 16), px(density, 8), px(density, 16), 0);
        caption.setVisibility(View.GONE);
        column.addView(caption);

        // [0] edited result, [1] untouched original; shown while the image is held.
        Bitmap[] shown = new Bitmap[2];
        boolean[] holding = new boolean[1];
        image.setOnTouchListener((view, event) -> {
            int action = event.getActionMasked();
            if (action == android.view.MotionEvent.ACTION_DOWN) {
                holding[0] = true;
                if (shown[1] != null) image.setImageBitmap(shown[1]);
            } else if (action == android.view.MotionEvent.ACTION_UP
                    || action == android.view.MotionEvent.ACTION_CANCEL) {
                holding[0] = false;
                if (shown[0] != null) image.setImageBitmap(shown[0]);
            }
            return true;
        });
        PREVIEW_RENDERER.execute(() -> {
            Bitmap source = BitmapFactory.decodeFile(original.getPath());
            image.post(() -> shown[1] = source);
        });

        // Slider values while dragging: background tolerance, corner percent, outline width.
        int[] values = {edits.backgroundTolerance, edits.cornerPercent, edits.outlineWidth};
        AtomicInteger latest = new AtomicInteger();
        Runnable render = () -> {
            // Only the newest request renders; older ones are skipped while the user drags.
            int ticket = latest.incrementAndGet();
            GboardCustomStickersStore.Edits current = new GboardCustomStickersStore.Edits(
                    values[0], values[1], values[2], edits.outlineColor);
            PREVIEW_RENDERER.execute(() -> {
                if (ticket != latest.get()) return;
                try {
                    GboardCustomStickersStore.Rendered rendered =
                            GboardCustomStickersStore.render(original, current);
                    image.post(() -> {
                        if (ticket != latest.get()) return;
                        shown[0] = rendered.bitmap;
                        if (!holding[0]) image.setImageBitmap(rendered.bitmap);
                        caption.setVisibility(
                                rendered.backgroundNotFound ? View.VISIBLE : View.GONE);
                    });
                } catch (Throwable failure) {
                    Log.w(TAG, "Failed to render sticker preview", failure);
                }
            });
        };
        Runnable chosen = () -> editsChosen.onChosen(new GboardCustomStickersStore.Edits(
                values[0], values[1], values[2], edits.outlineColor));
        addSlider(column, density, labels.background, "", MAX_BACKGROUND_TOLERANCE, values, 0,
                render, chosen);
        addSlider(column, density, labels.corners, "%", 100, values, 1, render, chosen);
        addSlider(column, density, labels.outline, "", MAX_OUTLINE_WIDTH, values, 2,
                render, chosen);
        render.run();
        return column;
    }

    interface EditsChosen {
        void onChosen(GboardCustomStickersStore.Edits edits);
    }

    /** A titled SeekBar writing {@code values[slot]}; previews while dragging, commits on release. */
    private static void addSlider(LinearLayout column, float density, String label, String unit,
            int max, int[] values, int slot, Runnable render, Runnable chosen) {
        Context context = column.getContext();
        TextView title = new TextView(context);
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16f);
        title.setTextColor(resolveColor(context, android.R.attr.textColorPrimary,
                isNight(context) ? Color.WHITE : Color.BLACK));
        title.setPadding(px(density, 20), px(density, 16), px(density, 20), 0);
        title.setText(label + ": " + values[slot] + unit);
        title.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        column.addView(title, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));
        SeekBar bar = new SeekBar(context);
        bar.setMax(max);
        bar.setProgress(values[slot]);
        bar.setContentDescription(label);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, px(density, 48));
        params.setMargins(px(density, 8), 0, px(density, 8), 0);
        column.addView(bar, params);
        bar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override public void onProgressChanged(SeekBar seekBar, int progress,
                    boolean fromUser) {
                values[slot] = progress;
                title.setText(label + ": " + progress + unit);
                if (fromUser) render.run();
            }
            @Override public void onStartTrackingTouch(SeekBar seekBar) { }
            @Override public void onStopTrackingTouch(SeekBar seekBar) {
                chosen.run();
            }
        });
    }

    private static android.graphics.drawable.Drawable checkerboard(Context context, float density) {
        int cell = px(density, 8);
        Bitmap tile = Bitmap.createBitmap(cell * 2, cell * 2, Bitmap.Config.ARGB_8888);
        int light = isNight(context) ? 0xFF3C3C3C : 0xFFFFFFFF;
        int dark = isNight(context) ? 0xFF2A2A2A : 0xFFE3E3E3;
        tile.eraseColor(light);
        android.graphics.Canvas canvas = new android.graphics.Canvas(tile);
        android.graphics.Paint paint = new android.graphics.Paint();
        paint.setColor(dark);
        canvas.drawRect(0, 0, cell, cell, paint);
        canvas.drawRect(cell, cell, cell * 2, cell * 2, paint);
        android.graphics.drawable.BitmapDrawable drawable =
                new android.graphics.drawable.BitmapDrawable(context.getResources(), tile);
        drawable.setTileModeXY(android.graphics.Shader.TileMode.REPEAT,
                android.graphics.Shader.TileMode.REPEAT);
        return drawable;
    }

    /** Decodes off the UI thread; a detached view simply ignores late posts. */
    private static final class Thumbnail {
        final Bitmap bitmap;
        final boolean transparent;

        Thumbnail(Bitmap bitmap, boolean transparent) {
            this.bitmap = bitmap;
            this.transparent = transparent;
        }
    }

    // Screens are rebuilt on every refresh (each tap while selecting, each drag), so decoded
    // thumbnails are kept by file path and modification time. An eighth of the heap at most.
    private static final android.util.LruCache<String, Thumbnail> THUMBNAILS =
            new android.util.LruCache<String, Thumbnail>(
                    (int) Math.min(Integer.MAX_VALUE, Runtime.getRuntime().maxMemory() / 8)) {
                @Override
                protected int sizeOf(String key, Thumbnail value) {
                    return value.bitmap.getByteCount();
                }
            };
    private static final ExecutorService THUMBNAIL_LOADER = Executors.newSingleThreadExecutor(
            runnable -> {
                Thread thread = new Thread(runnable, "GboardStickerThumbs");
                thread.setDaemon(true);
                return thread;
            });

    /**
     * Cached thumbnails are set at once; the rest decode off the UI thread. {@code photoBadges},
     * when given, are shown for thumbnails without any transparency.
     */
    private static void loadThumbnails(List<ImageView> images, List<File> files,
            List<View> photoBadges) {
        List<Integer> missing = new ArrayList<>();
        for (int i = 0; i < files.size(); i++) {
            Thumbnail cached = THUMBNAILS.get(thumbnailKey(files.get(i)));
            if (cached == null) {
                missing.add(i);
            } else {
                showThumbnail(images.get(i), photoBadges == null ? null : photoBadges.get(i),
                        cached);
            }
        }
        if (missing.isEmpty()) return;
        THUMBNAIL_LOADER.execute(() -> {
            for (int i : missing) {
                File file = files.get(i);
                // An earlier queued job may have decoded it already.
                Thumbnail cached = THUMBNAILS.get(thumbnailKey(file));
                if (cached == null) {
                    Bitmap bitmap = decodeThumbnail(file);
                    if (bitmap == null) continue;
                    cached = new Thumbnail(bitmap, hasTransparency(bitmap));
                    THUMBNAILS.put(thumbnailKey(file), cached);
                }
                Thumbnail thumbnail = cached;
                ImageView image = images.get(i);
                View photo = photoBadges == null ? null : photoBadges.get(i);
                image.post(() -> showThumbnail(image, photo, thumbnail));
            }
        });
    }

    private static String thumbnailKey(File file) {
        return file.getPath() + "@" + file.lastModified();
    }

    private static void showThumbnail(ImageView image, View photo, Thumbnail thumbnail) {
        image.setImageBitmap(thumbnail.bitmap);
        if (photo != null) photo.setVisibility(thumbnail.transparent ? View.GONE : View.VISIBLE);
    }

    /** Messenger shows a sticker image as a plain photo unless some of it is transparent. */
    static boolean hasTransparency(Bitmap bitmap) {
        if (!bitmap.hasAlpha()) return false;
        int width = bitmap.getWidth();
        int[] row = new int[width];
        for (int y = 0; y < bitmap.getHeight(); y++) {
            bitmap.getPixels(row, 0, width, 0, y, width, 1);
            for (int pixel : row) {
                if ((pixel >>> 24) < 0xFF) return true;
            }
        }
        return false;
    }

    private static Bitmap decodeThumbnail(File file) {
        try {
            BitmapFactory.Options bounds = new BitmapFactory.Options();
            bounds.inJustDecodeBounds = true;
            BitmapFactory.decodeFile(file.getPath(), bounds);
            BitmapFactory.Options options = new BitmapFactory.Options();
            options.inSampleSize = 1;
            while (Math.max(bounds.outWidth, bounds.outHeight) / (options.inSampleSize * 2)
                    >= THUMBNAIL_PX) {
                options.inSampleSize *= 2;
            }
            return BitmapFactory.decodeFile(file.getPath(), options);
        } catch (Throwable failure) {
            Log.w(TAG, "Failed to decode sticker thumbnail", failure);
            return null;
        }
    }

    private static GradientDrawable tile(float density, int strokePx, int strokeColor) {
        GradientDrawable background = new GradientDrawable();
        background.setCornerRadius(12 * density);
        background.setColor(TILE_COLOR);
        if (strokePx > 0) background.setStroke(strokePx, strokeColor);
        return background;
    }

    private static int selectableBackground(Context context) {
        TypedValue value = new TypedValue();
        context.getTheme().resolveAttribute(android.R.attr.selectableItemBackground, value, true);
        return value.resourceId;
    }

    private static int resolveColor(Context context, int attribute, int fallback) {
        TypedValue value = new TypedValue();
        if (context.getTheme().resolveAttribute(attribute, value, true)) {
            if (value.resourceId != 0) {
                try {
                    return context.getColor(value.resourceId);
                } catch (Throwable ignored) {
                    return fallback;
                }
            }
            if (value.type >= TypedValue.TYPE_FIRST_COLOR_INT
                    && value.type <= TypedValue.TYPE_LAST_COLOR_INT) {
                return value.data;
            }
        }
        return fallback;
    }

    private static boolean isNight(Context context) {
        return (context.getResources().getConfiguration().uiMode
                & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
    }

    private static float density(Context context) {
        return context.getResources().getDisplayMetrics().density;
    }

    private static int px(float density, int dp) {
        return Math.round(dp * density);
    }

    private static final class SquareFrame extends FrameLayout {
        SquareFrame(Context context) {
            super(context);
        }

        @Override
        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            super.onMeasure(widthMeasureSpec, widthMeasureSpec);
        }
    }
}
