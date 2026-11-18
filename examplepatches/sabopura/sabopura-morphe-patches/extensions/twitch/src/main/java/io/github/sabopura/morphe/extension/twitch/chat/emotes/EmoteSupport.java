// Adapted from Hooman's patches, GPL-3.0; see NOTICE for source and revision.
package io.github.sabopura.morphe.extension.twitch.chat.emotes;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.SpannedString;
import android.text.style.ReplacementSpan;
import android.view.View;
import android.widget.TextView;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;
import io.github.sabopura.morphe.extension.twitch.chat.ChatMetadata;
import io.github.sabopura.morphe.extension.twitch.chat.ChatSettings;
import io.github.sabopura.morphe.extension.twitch.chat.NamePaintSpan;
import io.github.sabopura.morphe.extension.twitch.chat.PublicApi;
import io.github.sabopura.morphe.extension.twitch.ui.Feature;
import io.github.sabopura.morphe.extension.twitch.ui.Features;
import io.github.sabopura.morphe.extension.twitch.ui.Text;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;

/** Replaces emote names in chat text with images. Everything but the two refresh callbacks runs on the main thread. */
@SuppressWarnings("unused")
public final class EmoteSupport {
    /** View tag key; the 0x7e package id belongs to no resource table, so it cannot collide. */
    private static final int STATE_TAG = 0x7efffe01;
    /** Rows with a message, to refresh them. The state lives on the view, so nothing here retains a row. */
    private static final Map<TextView, Boolean> ROWS = new WeakHashMap<>();
    private static final EmoteCatalog CATALOG = new EmoteCatalog(EmoteSupport::refreshCatalog);
    private static final EmoteImageLoader IMAGES = new EmoteImageLoader(EmoteSupport::refreshImage);
    private static final Set<String> BADGE_URLS = ConcurrentHashMap.newKeySet();
    private static volatile Runnable catalogListener;
    /** The info sheet's image, while that sheet is open. */
    private static EmotePreview openPreview;
    /** Views outside chat that show emote images, told when one has loaded. Main thread only. */
    private static final Set<java.util.function.Consumer<String>> IMAGE_LISTENERS = new HashSet<>();

    private static final View.OnAttachStateChangeListener VIEW_LIFECYCLE =
            new View.OnAttachStateChangeListener() {
                @Override
                public void onViewAttachedToWindow(View view) {
                    BoundMessage message = stateOf(view);
                    if (message != null) message.attach(view);
                }

                @Override
                public void onViewDetachedFromWindow(View view) {
                    BoundMessage message = stateOf(view);
                    if (message != null) message.detach(view);
                }
            };

    private EmoteSupport() {}

    private static BoundMessage stateOf(View view) {
        Object tag = view.getTag(STATE_TAG);
        return tag instanceof BoundMessage ? (BoundMessage) tag : null;
    }

    public static List<String> names(Context context, String channelId) {
        return CATALOG.names(context, channelId);
    }

    /**
     * Whether chat draws this word as a 7TV, BetterTTV or FrankerFaceZ image in this channel. Only the
     * lists chat has loaded are known, so nothing is downloaded for the question. Any thread.
     */
    public static boolean draws(Context context, String channelId, String word) {
        return Features.has(Feature.CHAT_EMOTES) && CATALOG.find(context, normalizeChannelId(channelId), word) != null;
    }

    static Emote find(Context context, String channelId, String name) {
        return CATALOG.find(context, channelId, name);
    }

    static EmoteCatalog catalog() {
        return CATALOG;
    }

    static EmoteImageLoader images() {
        return IMAGES;
    }

    static void addImageListener(java.util.function.Consumer<String> listener) {
        IMAGE_LISTENERS.add(listener);
    }

    static void removeImageListener(java.util.function.Consumer<String> listener) {
        IMAGE_LISTENERS.remove(listener);
    }

    /** Called while a picker is open; replaced or cleared by the next call. */
    public static void onCatalogChanged(Runnable listener) {
        catalogListener = listener;
    }

    public static void prependBadge(
            TextView view, SpannableStringBuilder text, String title, String url, String source) {
        if (!EmoteUrls.allowed(url)) return;
        Emote emote = new Emote(url, url.endsWith(".gif"));
        if (BADGE_URLS.size() < 512) BADGE_URLS.add(url);
        EmoteImageLoader.Image image = IMAGES.image(view.getResources(), emote);
        // A badge appears with its image: the rows are redone when it arrives, and one that fails stays out.
        if (image == null) {
            IMAGES.request(view.getContext(), emote, Math.max(1, Math.round(view.getTextSize())));
            return;
        }
        String label = "[" + title + "] ";
        text.insert(0, label);
        ChatSettings settings = ChatSettings.get(view.getContext());
        float scale = Features.has(Feature.CHAT_APPEARANCE) ? settings.badgePercent / 100f : 1;
        text.setSpan(
                new CenteredImageSpan(view, image.drawable, scale),
                0,
                label.length() - 1,
                Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        if (Features.has(Feature.EMOTE_PREVIEW) && settings.emotePreview) {
            text.setSpan(new EmoteInfoSpan(title, Text.label(source + "のバッジ", source + " badge"), url, emote.animated),
                    0, label.length() - 1, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        }
    }

    /**
     * The still image of a 7TV name paint, or null while it is fetched; the rows are redone when it arrives,
     * as for a badge.
     */
    public static Bitmap paintImage(Context context, String url) {
        if (!EmoteUrls.allowed(url)) return null;
        Emote emote = new Emote(url, false);
        EmoteImageLoader.Image image = IMAGES.image(context.getResources(), emote);
        if (image != null)
            return image.drawable instanceof BitmapDrawable ? ((BitmapDrawable) image.drawable).getBitmap() : null;
        if (BADGE_URLS.size() < 512) BADGE_URLS.add(url);
        IMAGES.request(context, emote, 128);
        return null;
    }

    private static String sourceOf(Emote emote) {
        if ("twitch".equals(emote.provider)) return "Twitch";
        String provider = "7tv".equals(emote.provider) ? "7TV" : "bttv".equals(emote.provider) ? "BetterTTV" : "FrankerFaceZ";
        return provider + Text.label(emote.global ? "・グローバル" : "・チャンネル", emote.global ? " · global" : " · channel");
    }

    /** The sheet's image: the row's copy at once, the provider's larger copy when it has loaded. */
    public static View preview(Context context, EmoteInfoSpan info) {
        Emote small = new Emote(info.url, info.animated), large = new Emote(EmoteUrls.large(info.url), info.animated);
        EmotePreview view = new EmotePreview(context, large.url);
        EmoteImageLoader.Image shown = IMAGES.image(context.getResources(), small);
        if (shown != null) view.show(shown);
        openPreview = view;
        view.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            @Override
            public void onViewAttachedToWindow(View v) {}

            @Override
            public void onViewDetachedFromWindow(View v) {
                if (openPreview == view) openPreview = null;
            }
        });
        EmoteImageLoader.Image big = IMAGES.image(context.getResources(), large);
        if (big != null) view.show(big);
        else if (!large.url.equals(small.url)) IMAGES.request(context, large, 256);
        return view;
    }

    /** Puts images into a row whose text the caller has just set. */
    public static void bind(TextView textView, String channelId) {
        bind(textView, channelId, true, TwitchEmotes.NONE, false);
    }

    /**
     * For a row Twitch does not draw itself: also puts in the Twitch emotes {@code own} names, in
     * their copy for a dark or a light background. Without {@code thirdParty} only those are drawn
     * and no emote service is asked.
     */
    public static void bind(TextView textView, String channelId, boolean thirdParty, TwitchEmotes own, boolean dark) {
        if (textView == null) return;
        try {
            CharSequence current = textView.getText();
            CharSequence composed = compose(textView, current, channelId, thirdParty, own, dark);
            if (composed != current) textView.setText(composed, TextView.BufferType.SPANNABLE);
        } catch (RuntimeException | LinkageError failure) {
            Diagnostics.note("emotes.row", failure);
            clear(textView);
        }
    }

    /**
     * The text with emote images, or {@code text} itself when no emote was recognised, so the
     * caller can skip the layout. The row is refreshed as images and channel emotes arrive.
     */
    public static CharSequence compose(TextView view, CharSequence text, String channelId) {
        return compose(view, text, channelId, true, TwitchEmotes.NONE, false);
    }

    private static CharSequence compose(TextView view, CharSequence text, String channelId, boolean thirdParty,
                                        TwitchEmotes own, boolean dark) {
        clear(view);
        if (text == null || text.length() == 0) return text;
        BoundMessage message = new BoundMessage(SpannedString.valueOf(text), normalizeChannelId(channelId),
                thirdParty, own, dark);
        view.setTag(STATE_TAG, message);
        ROWS.put(view, Boolean.TRUE);
        view.addOnAttachStateChangeListener(VIEW_LIFECYCLE);
        if (thirdParty) CATALOG.ensureLoaded(view.getContext(), message.channelId);
        CharSequence built = render(view, message);
        if (view.isAttachedToWindow()) message.attach(view);
        return built == null ? text : built;
    }

    /** Stops the row's animations and forgets its message. */
    public static void clear(TextView view) {
        BoundMessage message = stateOf(view);
        if (message == null) return;
        message.detach(view);
        view.setTag(STATE_TAG, null);
        ROWS.remove(view);
        view.removeOnAttachStateChangeListener(VIEW_LIFECYCLE);
    }

    /** Builds the row's text, or null when nothing in it is an emote with a known image. */
    private static CharSequence render(TextView textView, BoundMessage message) {
        SpannedString original = message.original;
        String plain = original.toString();
        int length = plain.length();
        ReplacementSpan[] natives = original.getSpans(0, length, ReplacementSpan.class);
        int[] nativeStarts = new int[natives.length], nativeEnds = new int[natives.length];
        for (int i = 0; i < natives.length; i++) {
            nativeStarts[i] = original.getSpanStart(natives[i]);
            nativeEnds[i] = original.getSpanEnd(natives[i]);
        }
        Context context = textView.getContext();
        ChatSettings settings = ChatSettings.get(context);
        boolean info = Features.has(Feature.EMOTE_PREVIEW) && settings.emotePreview;
        float scale = Features.has(Feature.CHAT_APPEARANCE) ? settings.emotePercent / 100f : 1;
        EmoteInfoSpan marker = null;
        int markerStart = -1;
        SpannableStringBuilder builder = null;
        Map<String, Emote> missing = new LinkedHashMap<>();
        Set<SharedAnimation> animations = new HashSet<>();
        StringBuilder drawn = new StringBuilder();
        LayeredEmoteSpan group = null;
        int groupStart = 0;
        for (int index = 0; index < length; ) {
            while (index < length && isSeparator(plain.charAt(index))) {
                if (plain.charAt(index) == '\n' || plain.charAt(index) == '\r') group = null;
                index++;
            }
            int start = index;
            while (index < length && !isSeparator(plain.charAt(index))) index++;
            int end = index;
            if (start == end) {
                group = null;
                continue;
            }
            int nativeAt = nativeSpanAt(nativeStarts, nativeEnds, start, end);
            if (nativeAt >= 0) {
                group = null;
                // A painted name is no emote for a zero-width emote to sit on.
                if (nativeStarts[nativeAt] == start && nativeEnds[nativeAt] == end
                        && !(natives[nativeAt] instanceof NamePaintSpan)) {
                    group = new LayeredEmoteSpan(natives[nativeAt], original, start, end);
                    groupStart = start;
                }
                continue;
            }
            String word = plain.substring(start, end);
            Emote emote = message.own.find(word, message.dark);
            if (emote == null && message.thirdParty) emote = CATALOG.find(context, message.channelId, word);
            if (emote == null) {
                group = null;
                continue;
            }
            EmoteImageLoader.Image image = IMAGES.image(textView.getResources(), emote);
            if (image == null) {
                missing.put(emote.url, emote);
                group = null;
                continue;
            }
            if (image.animation != null) animations.add(image.animation);
            drawn.append(emote.url).append(' ');
            if (builder == null) builder = new SpannableStringBuilder(original);
            if (emote.zeroWidth && group != null) {
                builder.removeSpan(group);
                for (int i = 0; i < natives.length; i++)
                    if (nativeStarts[i] == groupStart) builder.removeSpan(natives[i]);
                group.add(textView, image.drawable, scale);
            } else {
                group = new LayeredEmoteSpan(textView, image.drawable, scale);
                groupStart = start;
            }
            builder.setSpan(group, groupStart, end, Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
            if (info) {
                if (markerStart != groupStart) {
                    marker = new EmoteInfoSpan(emote.name, sourceOf(emote), emote.url, emote.animated);
                    markerStart = groupStart;
                }
                builder.setSpan(marker, groupStart, end, Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
            }
        }
        message.pendingImages = missing.keySet();
        for (Emote emote : missing.values())
            IMAGES.request(context, emote, Math.max(1, Math.round(textView.getTextSize() * 1.25f * scale)));
        message.setDrawn(textView, animations, drawn.toString());
        return builder == null ? null : new SpannedString(builder);
    }

    private static int nativeSpanAt(int[] starts, int[] ends, int start, int end) {
        for (int i = 0; i < starts.length; i++) if (starts[i] < end && ends[i] > start) return i;
        return -1;
    }

    static boolean isSeparator(char value) {
        return Character.isWhitespace(value) || (value >= '⁦' && value <= '⁩');
    }

    private static String normalizeChannelId(String value) {
        if (value == null) return null;
        String trimmed = value.trim();
        if (trimmed.isEmpty() || trimmed.length() > 20) return null;
        for (int index = 0; index < trimmed.length(); index++) {
            if (!Character.isDigit(trimmed.charAt(index))) return null;
        }
        return trimmed;
    }

    /** Called on a loader thread when an image is ready. */
    private static void refreshImage(String url) {
        PublicApi.UI.post(() -> {
            try {
                if (BADGE_URLS.contains(url)) ChatMetadata.scheduleRefresh();
                EmotePreview preview = openPreview;
                if (preview != null && preview.waitsFor(url)) {
                    EmoteImageLoader.Image image = IMAGES.image(preview.getResources(), new Emote(url, true));
                    if (image != null) preview.show(image);
                }
                for (java.util.function.Consumer<String> listener : new ArrayList<>(IMAGE_LISTENERS)) listener.accept(url);
                for (TextView row : new ArrayList<>(ROWS.keySet())) {
                    BoundMessage message = stateOf(row);
                    if (message != null && message.pendingImages.contains(url)) rerender(row, message);
                }
            } catch (RuntimeException | LinkageError e) {
                Diagnostics.note("emotes.image-refresh", e);
            }
        });
    }

    /** Called on a loader thread when a channel's emote list arrived; null means the global lists. */
    private static void refreshCatalog(String channelId) {
        PublicApi.UI.post(() -> {
            try {
                Runnable listener = catalogListener;
                if (listener != null) listener.run();
                for (TextView row : new ArrayList<>(ROWS.keySet())) {
                    BoundMessage message = stateOf(row);
                    if (message != null && (channelId == null || channelId.equals(message.channelId))) {
                        rerender(row, message);
                    }
                }
            } catch (RuntimeException | LinkageError e) {
                Diagnostics.note("emotes.catalog-refresh", e);
            }
        });
    }

    /** Applies newly available images; the row is only laid out again when something changed. */
    private static void rerender(TextView row, BoundMessage message) {
        String before = message.drawn;
        CharSequence built = render(row, message);
        if (before.equals(message.drawn)) return;
        row.setText(built == null ? message.original : built, TextView.BufferType.SPANNABLE);
        if (row.isAttachedToWindow()) message.attach(row);
    }

    /** One row's text before emotes, and what is drawn in it now. */
    private static final class BoundMessage {
        final SpannedString original;
        final String channelId;
        /** Whether the emote services' catalog is looked up; the message's own Twitch emotes always are. */
        final boolean thirdParty;
        final TwitchEmotes own;
        final boolean dark;
        Set<String> pendingImages = Collections.emptySet();
        Set<SharedAnimation> animations = Collections.emptySet();
        String drawn = "";

        BoundMessage(SpannedString original, String channelId, boolean thirdParty, TwitchEmotes own, boolean dark) {
            this.original = original;
            this.channelId = channelId;
            this.thirdParty = thirdParty;
            this.own = own;
            this.dark = dark;
        }

        void setDrawn(View view, Set<SharedAnimation> nowDrawn, String urls) {
            for (SharedAnimation animation : animations) {
                if (!nowDrawn.contains(animation)) animation.detach(view);
            }
            animations = nowDrawn;
            drawn = urls;
        }

        void attach(View view) {
            for (SharedAnimation animation : animations) animation.attach(view);
        }

        void detach(View view) {
            for (SharedAnimation animation : animations) animation.detach(view);
        }
    }
}
