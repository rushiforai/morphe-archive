/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-20.
 */

package app.morphe.extension.youtube.patches.utils;

import android.graphics.drawable.Drawable;
import android.os.Build;
import android.text.Layout;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

import app.morphe.extension.shared.patches.LithoRelayoutPatch;
import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.returnyoutubedislike.DislikePill;
import app.morphe.extension.youtube.returnyoutubedislike.ReturnYouTubeDislike;
import app.morphe.extension.youtube.settings.Settings;

/** Mounted text belongs to a single watch session, not to the cached network request. */
final class WatchCountText {
    private final ReturnYouTubeDislikePatch.WatchBinding watch;
    private volatile boolean hasSegmentedText;

    // Only the native model owns the String used as the key. Equal text from another model
    // (including another rolling number on the same page) must not acquire this binding.
    private final List<RollingModel> rollingModels = new ArrayList<>();

    // An attached or detached native view owns its listener. Neither the request nor this map
    // roots the view, its stock ImageSpan, or any of the original drawable callbacks.
    private final Map<TextView, WeakReference<RollingBinding>> rollingViews = new WeakHashMap<>();

    WatchCountText(ReturnYouTubeDislikePatch.WatchBinding watch) {
        this.watch = watch;
    }

    int desiredRevision() {
        return watch.canShowCounts() && watch.data.getFetchedVotes() != null ? watch.data.getRevision() : -1;
    }

    CharSequence markSegmented(CharSequence original) {
        if (original.length() == 0 || original instanceof SegmentedSource) {
            return original;
        }
        hasSegmentedText = true;
        return new SegmentedSource(this, original);
    }

    void refreshSegmentedViews() {
        if (hasSegmentedText) {
            LithoRelayoutPatch.relayoutOutdatedTexts();
        }
    }

    static CharSequence resolveSegmented(CharSequence text) {
        return text instanceof SegmentedSource source ? source.resolve() : text;
    }

    @Nullable
    static Layout reuseSegmentedLayout(@Nullable Layout cached, CharSequence text) {
        if (cached == null || !(text instanceof SegmentedPresentation presentation)) {
            return cached;
        }
        // The sizing pass can copy or ellipsize the text. A copy retains the exact marker.
        CharSequence cachedText = cached.getText();
        return cachedText == text || cachedText instanceof Spanned spanned
                && spanned.getSpanStart(presentation.marker) >= 0 ? cached : null;
    }

    private static class SegmentedPresentation extends SpannableString {
        final MountedSegmentedCount marker;

        SegmentedPresentation(WatchCountText owner, CharSequence text, int revision) {
            super(text);
            marker = new MountedSegmentedCount(owner, revision);
            setSpan(marker, 0, length(), SPAN_INCLUSIVE_EXCLUSIVE);
        }
    }

    private static final class SegmentedSource extends SegmentedPresentation {
        final WatchCountText owner;
        final Spanned stock;
        int renderedRevision = -1;
        CharSequence rendering;

        SegmentedSource(WatchCountText owner, CharSequence original) {
            super(owner, original, -1);
            this.owner = owner;
            stock = original instanceof Spanned spanned ? spanned : new SpannableString(original);
        }

        synchronized CharSequence resolve() {
            int revision = owner.desiredRevision();
            if (revision < 0) {
                return this;
            }
            if (revision != renderedRevision) {
                Spanned formatted = owner.watch.data.getSegmentedCountSpan(stock, false, owner.watch);
                rendering = new SegmentedPresentation(owner, formatted, revision);
                renderedRevision = revision;
            }
            return rendering;
        }
    }

    private record MountedSegmentedCount(WatchCountText owner, int revision) implements LithoRelayoutPatch.RelayoutSpan {
        @Override
        public boolean isOutdated() {
            return revision != owner.desiredRevision();
        }

        @Override
        public boolean canRelayoutHost(View host) {
            return host.isAttachedToWindow() && host.isShown();
        }
    }

    synchronized String markRolling(String original) {
        if (original.isEmpty()) {
            return original;
        }
        rollingModels.removeIf(model -> model.get() == null);
        String modelText = new String(original);
        rollingModels.add(new RollingModel(modelText, original));
        return modelText;
    }

    @Nullable
    private synchronized RollingModel findRolling(CharSequence text) {
        for (int index = rollingModels.size() - 1; index >= 0; --index) {
            RollingModel model = rollingModels.get(index);
            if (model.get() == text) {
                return model;
            }
        }
        return null;
    }

    String rollingTextForMeasure(String original) {
        RollingModel model = findRolling(original);
        return model == null || desiredRevision() < 0 ? original : model.resolve(this).toString();
    }

    private static final class RollingModel extends WeakReference<String> {
        final Spanned stock;
        int renderedRevision = -1;
        Spanned rendering;

        RollingModel(String modelText, String original) {
            super(modelText);
            stock = new SpannableString(original);
            rendering = stock;
        }

        synchronized Spanned resolve(WatchCountText owner) {
            int revision = owner.desiredRevision();
            if (revision < 0) {
                return stock;
            }
            if (revision != renderedRevision) {
                rendering = owner.watch.data.getSegmentedCountSpan(stock, true, owner.watch);
                renderedRevision = revision;
            }
            return rendering;
        }
    }

    void setRollingText(TextView view, CharSequence original, boolean initial) {
        RollingBinding binding = getRollingBinding(view);
        if (initial) {
            RollingModel model = findRolling(original);
            if (binding == null || binding.model != model) {
                unbindRolling(view, binding);
                binding = null;
                if (model != null && !isDescriptionPanel(view)) {
                    binding = new RollingBinding(model, original);
                    view.addOnAttachStateChangeListener(binding);
                    rollingViews.put(view, new WeakReference<>(binding));
                }
            }
        } else if (binding != null && !TextUtils.equals(original, binding.model.stock)) {
            unbindRolling(view, binding);
            binding = null;
        }

        if (binding == null) {
            view.setText(original);
        } else {
            binding.stockText = original;
            binding.install(view, binding.resolve(view));
        }
    }

    private static boolean isDescriptionPanel(TextView view) {
        return view.getParent() instanceof ViewGroup parent && parent.getChildCount() < 2;
    }

    @Nullable
    private RollingBinding getRollingBinding(TextView view) {
        WeakReference<RollingBinding> reference = rollingViews.get(view);
        return reference == null ? null : reference.get();
    }

    private void unbindRolling(TextView view, @Nullable RollingBinding binding) {
        if (binding != null) {
            rollingViews.remove(view);
            view.removeOnAttachStateChangeListener(binding);
            binding.restore(view);
        }
    }

    void refreshRollingViews() {
        for (var entry : rollingViews.entrySet()) {
            RollingBinding binding = entry.getValue().get();
            TextView view = entry.getKey();
            if (binding != null && view != null && view.isAttachedToWindow()) {
                binding.refresh(view);
            }
        }
    }

    void clearRollingViews() {
        for (var entry : rollingViews.entrySet()) {
            RollingBinding binding = entry.getValue().get();
            TextView view = entry.getKey();
            if (binding != null && view != null) {
                view.removeOnAttachStateChangeListener(binding);
                binding.restore(view);
            }
        }
        rollingViews.clear();
    }

    private final class RollingBinding implements View.OnAttachStateChangeListener {
        final RollingModel model;
        CharSequence stockText;
        CharSequence resolvedText;
        @Nullable RollingStyle stockStyle;

        RollingBinding(RollingModel model, CharSequence original) {
            this.model = model;
            stockText = original;
            resolvedText = original;
        }

        private void install(TextView view, CharSequence text) {
            view.setText(text);
            installedText = view.getText();
        }

        private CharSequence installedText;

        CharSequence resolve(TextView view) {
            Spanned resolved = isDescriptionPanel(view) ? model.stock : model.resolve(WatchCountText.this);
            if (resolved == model.stock) {
                restoreStyle(view);
                resolvedText = stockText;
                return stockText;
            }

            if (stockStyle == null) {
                stockStyle = new RollingStyle(view);
            }
            view.setPadding(0, 0, 0, 0);
            if (!Settings.RYD_COMPACT_LAYOUT.get() && !DislikePill.isEnabled()) {
                var separator = ReturnYouTubeDislike.getLeftSeparatorDrawable();
                if (Utils.isRightToLeftLocale()) {
                    view.setCompoundDrawables(null, null, separator, null);
                } else {
                    view.setCompoundDrawables(separator, null, null, null);
                }
                view.setCompoundDrawablePadding(ReturnYouTubeDislike.leftSeparatorShapePaddingPixels);
                view.setTextAlignment(View.TEXT_ALIGNMENT_CENTER);
                view.setSingleLine(true);
            }
            resolvedText = resolved;
            return resolved;
        }

        void refresh(TextView view) {
            if (view.getText() != installedText) {
                // Native code has already replaced the content without our setter. Never revive it.
                return;
            }
            CharSequence before = resolvedText;
            CharSequence next = resolve(view);
            if (before != next) {
                install(view, next);
                requestRollingRelayout(view);
            }
        }

        void restore(TextView view) {
            restoreStyle(view);
            if (resolvedText != stockText && view.getText() == installedText) {
                install(view, stockText);
                if (view.isAttachedToWindow()) {
                    requestRollingRelayout(view);
                }
            }
            resolvedText = stockText;
        }

        private void restoreStyle(TextView view) {
            if (stockStyle != null) {
                stockStyle.restore(view);
                stockStyle = null;
            }
        }

        @Override
        public void onViewAttachedToWindow(View view) {
            refresh((TextView) view);
        }

        @Override
        public void onViewDetachedFromWindow(View view) {
            restore((TextView) view);
        }
    }

    private static void requestRollingRelayout(TextView view) {
        // RollingNumber is measured by its Litho component before the TextView is laid out.
        View host = view;
        while (!(host instanceof LithoRelayoutPatch.LithoViewInterface)
                && host.getParent() instanceof View parent) {
            host = parent;
        }
        if (host instanceof LithoRelayoutPatch.LithoViewInterface lithoHost) {
            lithoHost.patch_forceRelayout();
        }
    }

    private record RollingStyle(Drawable[] drawables, int drawablePadding, int alignment, boolean singleLine,
                                int maxLines, int left, int top, int right, int bottom) {
        RollingStyle(TextView view) {
            this(view.getCompoundDrawables(), view.getCompoundDrawablePadding(), view.getTextAlignment(),
                    Build.VERSION.SDK_INT >= 29 ? view.isSingleLine() : view.getMaxLines() == 1,
                    view.getMaxLines(), view.getPaddingLeft(), view.getPaddingTop(),
                    view.getPaddingRight(), view.getPaddingBottom());
        }

        void restore(TextView view) {
            view.setCompoundDrawables(drawables[0], drawables[1], drawables[2], drawables[3]);
            view.setCompoundDrawablePadding(drawablePadding);
            view.setTextAlignment(alignment);
            view.setSingleLine(singleLine);
            view.setMaxLines(maxLines);
            view.setPadding(left, top, right, bottom);
        }
    }
}
