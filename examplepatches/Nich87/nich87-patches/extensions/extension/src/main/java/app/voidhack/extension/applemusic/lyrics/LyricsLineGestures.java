package app.voidhack.extension.applemusic.lyrics;

import android.graphics.Rect;
import android.text.Spanned;
import android.text.TextUtils;
import android.text.style.RelativeSizeSpan;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.WeakHashMap;

public final class LyricsLineGestures {
    private static final String TAG = "AppleMusicLrclib";
    private static final Map<View, Boolean> TIMED_SHARE = new WeakHashMap<>();
    private static final Map<Object, WeakReference<Object>> STATIC_ADAPTERS = new WeakHashMap<>();

    private LyricsLineGestures() {}

    public static void setTimedShare(View anchor, String signature) {
        if (signature == null) TIMED_SHARE.remove(anchor);
        else TIMED_SHARE.put(anchor, Boolean.TRUE);
    }

    public static void editTimed(Object fragment, View anchor, Object adapter, Object[] target) {
        Runnable share = TIMED_SHARE.containsKey(anchor)
                ? () -> shareTimed(fragment, anchor, adapter, target)
                : null;
        if (!LrclibController.onEditTimedLyric(fragment, anchor, target[0], share) && share != null) {
            share.run();
        }
    }

    private static void shareTimed(Object fragment, View anchor, Object adapter, Object[] target) {
        if (!anchor.isAttachedToWindow()) return;
        try {
            Class<?> fragmentClass = fragment.getClass();
            Class<?> adapterType = adapter.getClass().getSuperclass();
            Object[] current = (Object[]) fragmentClass
                    .getMethod("voidhackTimedLyricTarget", View.class, adapterType)
                    .invoke(null, anchor, adapter);
            if (current == null || current[1] != target[1] || !current[2].equals(target[2])) return;
            LyricsScrollSync.onShareLaunching(fragment);
            fragmentClass.getMethod("voidhackNativeShareLyricLine", fragmentClass, View.class, adapterType)
                    .invoke(null, fragment, anchor, adapter);
        } catch (ReflectiveOperationException | RuntimeException e) {
            Log.w(TAG, "Could not open lyric sharing", e);
        }
    }

    public static void bindStaticAdapter(Object fragment, Object adapter) {
        STATIC_ADAPTERS.put(adapter, new WeakReference<>(fragment));
    }

    public static void bindStaticView(Object adapter, View view) {
        if (!(view instanceof TextView text)) return;
        StaticHold listener = new StaticHold(adapter);
        text.setOnTouchListener(listener);
        text.setOnLongClickListener(listener);
    }

    private static final class StaticHold implements View.OnTouchListener, View.OnLongClickListener {
        private final WeakReference<Object> adapter;
        private float x;
        private float y;
        private boolean touching;

        StaticHold(Object adapter) {
            this.adapter = new WeakReference<>(adapter);
        }

        @Override
        public boolean onTouch(View view, MotionEvent event) {
            switch (event.getActionMasked()) {
                case MotionEvent.ACTION_DOWN -> {
                    x = event.getX();
                    y = event.getY();
                    touching = true;
                }
                case MotionEvent.ACTION_UP, MotionEvent.ACTION_CANCEL -> touching = false;
            }
            return false;
        }

        @Override
        public boolean onLongClick(View view) {
            WeakReference<Object> fragmentRef = STATIC_ADAPTERS.get(adapter.get());
            Object fragment = fragmentRef == null ? null : fragmentRef.get();
            if (fragment == null || !view.isAttachedToWindow()) return false;
            TextView text = (TextView) view;
            Rect visible = new Rect();
            if (!touching && !text.getLocalVisibleRect(visible)) return false;
            int offset = touching ? text.getOffsetForPosition(x, y)
                    : text.getOffsetForPosition(visible.left, visible.top);
            if (offset < 0) return false;
            return LrclibController.onEditStaticLyric(fragment, text, staticLine(text.getText(), offset));
        }
    }

    private static int staticLine(CharSequence text, int offset) {
        int lyricLine = -1;
        for (int start = 0; start <= text.length();) {
            int newline = TextUtils.indexOf(text, '\n', start);
            int end = newline < 0 ? text.length() : newline;
            // StaticLyricsPronunciation marks its inserted guide paragraphs with a size span.
            boolean guide = start < end && text instanceof Spanned spanned &&
                    spanned.getSpans(start, end, RelativeSizeSpan.class).length != 0;
            if (!guide) lyricLine++;
            if (offset <= end || newline < 0) return lyricLine;
            start = newline + 1;
        }
        return lyricLine;
    }
}
