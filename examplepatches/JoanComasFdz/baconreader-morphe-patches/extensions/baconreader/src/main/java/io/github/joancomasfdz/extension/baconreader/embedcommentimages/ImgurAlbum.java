// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.embedcommentimages;

import static app.morphe.extension.shared.StringRef.str;

import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.util.LruCache;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import io.github.joancomasfdz.extension.baconreader.errors.ErrorDialog;
import io.github.joancomasfdz.extension.baconreader.DownloadProgress;
import io.github.joancomasfdz.extension.baconreader.GlideUtils;
import app.morphe.extension.shared.Logger;

/**
 * Imgur albums (imgur.com/a/... and imgur.com/gallery/... links) in comments and posts.
 * The images are listed with the app's own Imgur client, and shown one at a time in the comment:
 * swipe sideways to change the image. Each image behaves like any other embedded image.
 */
final class ImgurAlbum {
    private static final Pattern ALBUM = Pattern.compile(
            "^https?://(?:www\\.|m\\.)?imgur\\.com/(a|gallery)/(?:[^/?#]*-)?([A-Za-z0-9]+)/?(?:[?#].*)?$",
            Pattern.CASE_INSENSITIVE);
    /** ImagesRetriever request types. */
    private static final int REQUEST_GALLERY = 0;
    private static final int REQUEST_ALBUM = 1;

    /** Album link -> its images. */
    private static final LruCache<String, List<EmbedCommentImagesPatch.ImageRef>> ALBUMS = new LruCache<>(20);
    /** The image shown in each album slot, to keep it when the comment is shown again. */
    private static final LruCache<String, Integer> POSITIONS = new LruCache<>(50);
    /** The album view of each slot. */
    private static final Map<View, AlbumLayout> LAYOUTS = new WeakHashMap<>();
    private static final ExecutorService LOADER = Executors.newFixedThreadPool(2);

    private ImgurAlbum() {
    }

    /** Whether the link is an Imgur album or gallery. */
    static boolean isAlbum(String url) {
        return url != null && ALBUM.matcher(url).matches();
    }

    /**
     * A slot for the album: a placeholder with a progress bar while the album is listed,
     * then its images, one at a time.
     */
    static View createSlot(final TextView textView, final String url) {
        final Context context = textView.getContext();
        final AlbumLayout slot = new AlbumLayout(textView, url);
        slot.setLayoutParams(EmbedCommentImagesPatch.slotLayoutParams(
                textView, ViewGroup.LayoutParams.WRAP_CONTENT));
        LAYOUTS.put(slot, slot);

        List<EmbedCommentImagesPatch.ImageRef> known = ALBUMS.get(url);
        if (known != null) {
            slot.show(known);
            return slot;
        }

        slot.showLoading();
        LOADER.execute(() -> {
            final List<EmbedCommentImagesPatch.ImageRef> images = fetch(url);
            if (images != null && !images.isEmpty()) ALBUMS.put(url, images);
            slot.post(() -> {
                if (slot.released) return; // The view shows another comment now.
                if (images == null || images.isEmpty()) slot.showUnavailable();
                else slot.show(images);
            });
        });
        return slot;
    }

    /** The view is reused for another comment: drop the image the album shows. */
    static void release(View slot) {
        AlbumLayout layout = LAYOUTS.remove(slot);
        if (layout == null) return;
        layout.released = true;
        layout.discardPage();
    }

    /**
     * The images of an album with the app's Imgur client (ImagesRetriever), or null when it could not be
     * listed. Blocks.
     */
    private static List<EmbedCommentImagesPatch.ImageRef> fetch(String url) {
        Matcher matcher = ALBUM.matcher(url);
        if (!matcher.matches()) return null;
        int requestType = matcher.group(1).equalsIgnoreCase("a") ? REQUEST_ALBUM : REQUEST_GALLERY;
        String id = matcher.group(2);
        for (int attempt = 1; attempt <= GlideUtils.MAX_ATTEMPTS; attempt++) {
            try {
                Class<?> retrieverClass = Class.forName("com.onelouder.baconreader.imgur_gallery.ImagesRetriever");
                Class<?> callbackClass = Class.forName("com.onelouder.baconreader.imgur_gallery.GalleryCallback");
                Object retriever = retrieverClass.getConstructor(String.class, int.class, callbackClass)
                        .newInstance(id, requestType, null);
                Method request = retrieverClass.getDeclaredMethod("doInBackground", Void[].class);
                request.setAccessible(true);
                List<?> items = (List<?>) request.invoke(retriever, (Object) new Void[0]);
                if (items != null) {
                    List<EmbedCommentImagesPatch.ImageRef> images = new ArrayList<>();
                    for (Object item : items) {
                        EmbedCommentImagesPatch.ImageRef image = toImage(item);
                        if (image != null) images.add(image);
                    }
                    return Collections.unmodifiableList(images);
                }
            } catch (Exception ex) {
                Logger.printInfo(() -> "Could not list the Imgur album " + url, ex);
            }
            try {
                Thread.sleep(GlideUtils.RETRY_DELAY_MS * attempt);
            } catch (InterruptedException ex) {
                return null;
            }
        }
        return null;
    }

    /**
     * An album image (com.onelouder.baconreader.imgur_gallery.ImgurImage). Images use a medium size
     * while small and the original when expanded; GIFs are shown as GIFs; videos, which can not be
     * played here, show a still.
     */
    static EmbedCommentImagesPatch.ImageRef toImage(Object item) throws Exception {
        String id = (String) item.getClass().getField("id").get(item);
        String link = (String) item.getClass().getField("link").get(item);
        String mp4 = (String) item.getClass().getField("mp4").get(item);
        if (id == null || link == null) return null;
        String path = link.toLowerCase(Locale.ROOT).replaceFirst("[?#].*$", "");
        if (path.endsWith(".gif")) return new EmbedCommentImagesPatch.ImageRef(link, link, 0, 0);
        if ((mp4 != null && !mp4.isEmpty()) || path.endsWith(".mp4")) {
            String still = "https://i.imgur.com/" + id + "h.jpg";
            return new EmbedCommentImagesPatch.ImageRef(still, still, 0, 0);
        }
        return new EmbedCommentImagesPatch.ImageRef("https://i.imgur.com/" + id + "l.jpg", link, 0, 0);
    }

    /**
     * Shows one image of the album, and changes it when swiped sideways. The swipe is taken from
     * the list only once it is clearly sideways, so the list still scrolls.
     */
    private static final class AlbumLayout extends FrameLayout {
        private final TextView textView;
        private final String url;
        private final TextView counter;
        private final int touchSlop;
        private final int minFlingVelocity;
        boolean released;

        private List<EmbedCommentImagesPatch.ImageRef> images;
        private int position;
        private View page;

        private float downX;
        private float downY;
        private boolean dragging;
        private VelocityTracker velocity;

        AlbumLayout(TextView textView, String url) {
            super(textView.getContext());
            this.textView = textView;
            this.url = url;
            Context context = textView.getContext();
            ViewConfiguration configuration = ViewConfiguration.get(context);
            touchSlop = configuration.getScaledTouchSlop();
            minFlingVelocity = configuration.getScaledMinimumFlingVelocity() * 4;

            counter = new TextView(context);
            counter.setTextColor(Color.WHITE);
            counter.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
            GradientDrawable background = new GradientDrawable();
            background.setColor(0x99000000);
            background.setCornerRadius(dp(context, 10));
            counter.setBackground(background);
            counter.setPadding(dp(context, 8), dp(context, 2), dp(context, 8), dp(context, 2));
            counter.setVisibility(GONE);
            FrameLayout.LayoutParams counterParams = new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.TOP | Gravity.END);
            counterParams.setMargins(0, dp(context, 6), dp(context, 6), 0);
            addView(counter, counterParams);
        }

        /** A box with a moving progress bar while the album is listed. */
        void showLoading() {
            FrameLayout box = box();
            DownloadProgress progress = new DownloadProgress(getContext());
            box.addView(progress.root, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM));
            progress.start();
            setPage(box);
        }

        void showUnavailable() {
            FrameLayout box = box();
            TextView message = new TextView(getContext());
            message.setText(str("revanced_embed_comment_images_unavailable"));
            message.setTextColor(withAlpha(textView.getCurrentTextColor(), 0x80));
            message.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
            box.addView(message, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.CENTER));
            DownloadProgress progress = new DownloadProgress(getContext());
            box.addView(progress.root, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM));
            progress.fail();
            setPage(box);
        }

        void show(List<EmbedCommentImagesPatch.ImageRef> images) {
            this.images = images;
            Integer saved = POSITIONS.get(url);
            showPage(saved != null && saved < images.size() ? saved : 0);
        }

        private void showPage(int position) {
            EmbedCommentImagesPatch.ImageRef previous = images != null && page != null && this.position < images.size()
                    ? images.get(this.position) : null;
            this.position = position;
            POSITIONS.put(url, position);
            EmbedCommentImagesPatch.ImageRef image = images.get(position);
            // Swiping keeps the size the user chose for the album.
            if (previous != null && previous != image) EmbedCommentImagesPatch.inheritSize(previous, image);
            try {
                setPage(EmbedCommentImagesPatch.createImageSlot(textView, image));
            } catch (Exception ex) {
                ErrorDialog.printException(() -> "Could not show the album image", ex);
            }
            counter.setText((position + 1) + " / " + images.size());
            counter.setVisibility(images.size() > 1 ? VISIBLE : GONE);
            counter.bringToFront();
        }

        private void setPage(View view) {
            discardPage();
            page = view;
            addView(view, 0);
            // The album slot has the margins of an image slot already.
            ViewGroup.LayoutParams params = view.getLayoutParams();
            if (params instanceof MarginLayoutParams) {
                ((MarginLayoutParams) params).setMargins(0, 0, 0, ((MarginLayoutParams) params).bottomMargin);
            }
        }

        void discardPage() {
            if (page == null) return;
            EmbedCommentImagesPatch.discardSlot(page);
            removeView(page);
            page = null;
        }

        /** A placeholder box of the size of a small image, in the colors of the text. */
        private FrameLayout box() {
            Context context = getContext();
            FrameLayout box = new FrameLayout(context);
            GradientDrawable background = new GradientDrawable();
            background.setColor(withAlpha(textView.getCurrentTextColor(), 0x1A));
            background.setCornerRadius(dp(context, 6));
            box.setBackground(background);
            int size = dp(context, EmbedCommentImagesPatch.IMAGE_SIZE_DP);
            box.setLayoutParams(new FrameLayout.LayoutParams(size, Math.max(textView.getLineHeight() * 2,
                    dp(context, 32))));
            return box;
        }

        /**
         * The album wraps its image, so a full width image would only get its own size:
         * the album takes the full width while its image does.
         */
        @Override
        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            if (page != null && page.getLayoutParams() != null
                    && page.getLayoutParams().width == ViewGroup.LayoutParams.MATCH_PARENT
                    && MeasureSpec.getMode(widthMeasureSpec) == MeasureSpec.AT_MOST) {
                widthMeasureSpec = MeasureSpec.makeMeasureSpec(MeasureSpec.getSize(widthMeasureSpec), MeasureSpec.EXACTLY);
            }
            super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        }

        private boolean canSwipe() {
            return images != null && images.size() > 1 && page != null;
        }

        @Override
        public boolean onInterceptTouchEvent(MotionEvent event) {
            if (!canSwipe()) return false;
            switch (event.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    downX = event.getX();
                    downY = event.getY();
                    dragging = false;
                    trackVelocity(event, true);
                    break;
                case MotionEvent.ACTION_MOVE:
                    trackVelocity(event, false);
                    float dx = event.getX() - downX;
                    float dy = event.getY() - downY;
                    if (Math.abs(dx) > touchSlop && Math.abs(dx) > Math.abs(dy) * 1.5f) {
                        dragging = true;
                        getParent().requestDisallowInterceptTouchEvent(true);
                        return true;
                    }
                    break;
                case MotionEvent.ACTION_UP:
                case MotionEvent.ACTION_CANCEL:
                    recycleVelocity();
                    break;
            }
            return false;
        }

        @Override
        public boolean onTouchEvent(MotionEvent event) {
            if (!canSwipe()) return super.onTouchEvent(event);
            switch (event.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    downX = event.getX();
                    downY = event.getY();
                    trackVelocity(event, true);
                    return true;
                case MotionEvent.ACTION_MOVE:
                    trackVelocity(event, false);
                    float dx = event.getX() - downX;
                    if (!dragging && Math.abs(dx) > touchSlop) {
                        dragging = true;
                        getParent().requestDisallowInterceptTouchEvent(true);
                    }
                    if (dragging) page.setTranslationX(resisted(dx));
                    return true;
                case MotionEvent.ACTION_UP:
                    trackVelocity(event, false);
                    float moved = event.getX() - downX;
                    float speed = 0;
                    if (velocity != null) {
                        velocity.computeCurrentVelocity(1000);
                        speed = velocity.getXVelocity();
                    }
                    recycleVelocity();
                    if (dragging) settle(moved, speed);
                    dragging = false;
                    return true;
                case MotionEvent.ACTION_CANCEL:
                    recycleVelocity();
                    if (dragging) settle(0, 0);
                    dragging = false;
                    return true;
            }
            return true;
        }

        /** The first and last image move less, to show there is nothing past them. */
        private float resisted(float dx) {
            boolean pastEnd = (dx > 0 && position == 0) || (dx < 0 && position == images.size() - 1);
            return pastEnd ? dx / 3 : dx;
        }

        /** Goes to the next or previous image when swiped far or fast enough, else snaps back. */
        private void settle(float dx, float speed) {
            int width = Math.max(page.getWidth(), 1);
            int target = position;
            if (dx < -width / 4f || speed < -minFlingVelocity) target = position + 1;
            else if (dx > width / 4f || speed > minFlingVelocity) target = position - 1;
            if (target < 0 || target >= images.size()) {
                page.animate().translationX(0).setDuration(150).start();
                return;
            }
            final int next = target;
            final float out = next > position ? -width : width;
            final View current = page;
            current.animate().translationX(out).setDuration(150).withEndAction(() -> {
                if (released || page != current) return;
                showPage(next);
                page.setTranslationX(-out);
                page.animate().translationX(0).setDuration(150).start();
            }).start();
        }

        private void trackVelocity(MotionEvent event, boolean reset) {
            if (reset || velocity == null) {
                recycleVelocity();
                velocity = VelocityTracker.obtain();
            }
            velocity.addMovement(event);
        }

        private void recycleVelocity() {
            if (velocity == null) return;
            velocity.recycle();
            velocity = null;
        }
    }

    private static int withAlpha(int color, int alpha) {
        return (color & 0x00FFFFFF) | (alpha << 24);
    }

    private static int dp(Context context, int dp) {
        return Math.round(TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, dp, context.getResources().getDisplayMetrics()));
    }
}
