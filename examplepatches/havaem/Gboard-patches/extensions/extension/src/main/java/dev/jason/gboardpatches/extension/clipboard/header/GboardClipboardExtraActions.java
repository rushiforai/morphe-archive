package dev.jason.gboardpatches.extension.clipboard.header;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.InsetDrawable;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.WeakHashMap;

import dev.jason.gboardpatches.extension.settings.GboardPatchesIcons;

/**
 * Search (normal mode) and Add-to-stickers (edit mode) buttons in the clipboard header.
 * The soft keyboard view swallows touches, so the header forwards each gesture here first;
 * only a DOWN on one of these buttons takes the stream.
 */
public final class GboardClipboardExtraActions {
    public interface Ops {
        boolean isCurrent(Object keyboard, View header) throws ReflectiveOperationException;
        /** Current settings, or null while every extra action is off. */
        Settings settings(Context context);
        boolean searchAvailable(Object keyboard) throws ReflectiveOperationException;
        void openSearch(Object keyboard, View view) throws ReflectiveOperationException;
        void clearSearch(Object keyboard) throws ReflectiveOperationException;
        /** Query shown in place of the header title, or null when no search is active. */
        String activeQuery();
        void addSelectedToStickers(Object keyboard, View anchor) throws ReflectiveOperationException;
        void report(Throwable failure);
    }

    public static final class Settings {
        final boolean search;
        final boolean stickers;
        final String searchLabel;
        final String clearLabel;
        final String stickerLabel;

        public Settings(boolean search, boolean stickers, String searchLabel, String clearLabel,
                String stickerLabel) {
            this.search = search;
            this.stickers = stickers;
            this.searchLabel = searchLabel;
            this.clearLabel = clearLabel;
            this.stickerLabel = stickerLabel;
        }
    }

    private static final Map<Object, Session> KEYBOARDS = new WeakHashMap<>();
    private static final Map<View, WeakReference<Session>> HEADERS = new WeakHashMap<>();
    private static final Map<Object, Boolean> EDITING = new WeakHashMap<>();

    private GboardClipboardExtraActions() { }

    public static void attach(Object keyboard, View header, LinearLayout icons, View anchor,
            TextView title, Ops ops) {
        close(keyboard);
        if (icons.indexOfChild(anchor) < 0) return;
        Session session = new Session(keyboard, header, icons, title, ops);
        synchronized (KEYBOARDS) { KEYBOARDS.put(keyboard, session); }
        synchronized (HEADERS) { HEADERS.put(header, new WeakReference<>(session)); }
        session.update();
    }

    public static void stateChanged(Object keyboard, boolean editing) {
        synchronized (EDITING) {
            if (editing) EDITING.put(keyboard, true);
            else EDITING.remove(keyboard);
        }
        update(keyboard);
    }

    public static void update(Object keyboard) {
        Session session;
        synchronized (KEYBOARDS) { session = KEYBOARDS.get(keyboard); }
        if (session != null) session.update();
    }

    public static void close(Object keyboard) {
        Session old;
        synchronized (KEYBOARDS) { old = KEYBOARDS.remove(keyboard); }
        if (old != null) old.dispose();
    }

    /** Re-applies settings to every live header after the settings snapshot changes. */
    public static void settingsPublished() {
        Session[] sessions;
        synchronized (KEYBOARDS) { sessions = KEYBOARDS.values().toArray(new Session[0]); }
        for (Session session : sessions) session.header.post(session::update);
    }

    public static boolean onHeaderTouch(View header, MotionEvent event) {
        Session session;
        synchronized (HEADERS) {
            WeakReference<Session> reference = HEADERS.get(header);
            session = reference == null ? null : reference.get();
        }
        return session != null && event != null && session.touch(event);
    }

    private static final class Session {
        final WeakReference<Object> keyboard;
        final View header;
        final LinearLayout icons;
        final TextView title;
        final CharSequence originalTitle;
        final Ops ops;
        final Rect bounds = new Rect();
        ImageButton search;
        ImageButton stickers;
        ImageButton pressed;
        boolean active = true;
        boolean showingQuery;

        Session(Object keyboard, View header, LinearLayout icons, TextView title, Ops ops) {
            this.keyboard = new WeakReference<>(keyboard);
            this.header = header;
            this.icons = icons;
            this.title = title;
            this.originalTitle = title == null ? null : title.getText();
            this.ops = ops;
        }

        void update() {
            if (!active) return;
            try {
                Object owner = keyboard.get();
                Settings settings = owner == null ? null : ops.settings(header.getContext());
                boolean current = settings != null && ops.isCurrent(owner, header);
                boolean editing;
                synchronized (EDITING) { editing = owner != null && EDITING.containsKey(owner); }
                String query = ops.activeQuery();
                boolean showSearch = current && !editing && settings.search
                        && (query != null || ops.searchAvailable(owner));
                boolean showStickers = current && editing && settings.stickers;
                // Search sits at the far right; edit-mode actions stay with Select All on the left.
                if (showSearch && search == null) search = createButton(icons.getChildCount());
                if (showStickers && stickers == null) stickers = createButton(0);
                if (search != null) {
                    configure(search, showSearch, query == null
                            ? GboardPatchesIcons.SEARCH : GboardPatchesIcons.CLOSE,
                            showSearch ? (query == null ? settings.searchLabel : settings.clearLabel)
                                    : null);
                }
                if (stickers != null) {
                    configure(stickers, showStickers, GboardPatchesIcons.IMAGE,
                            showStickers ? settings.stickerLabel : null);
                }
                showQuery(current && !editing ? query : null);
            } catch (Throwable failure) {
                fail(failure);
            }
        }

        private void showQuery(String query) {
            if (title == null) return;
            if (query != null) {
                title.setText("“" + query + "”");
                showingQuery = true;
            } else if (showingQuery) {
                title.setText(originalTitle);
                showingQuery = false;
            }
        }

        private void configure(ImageButton button, boolean visible, int icon, String label) {
            button.setVisibility(visible ? View.VISIBLE : View.GONE);
            if (!visible) return;
            Integer shown = (Integer) button.getTag();
            if (shown == null || shown != icon) {
                float density = header.getResources().getDisplayMetrics().density;
                button.setImageDrawable(GboardPatchesIcons.create(icon, Color.WHITE, density));
                button.setTag(icon);
            }
            button.setImageTintList(tint());
            button.setContentDescription(label);
            button.setTooltipText(label);
        }

        private ColorStateList tint() {
            return title != null ? title.getTextColors() : ColorStateList.valueOf(Color.GRAY);
        }

        private ImageButton createButton(int index) {
            Context context = header.getContext();
            float density = context.getResources().getDisplayMetrics().density;
            int size = Math.round(48 * density);
            int face = Math.round(36 * density);
            int glyph = Math.round(24 * density);
            ImageButton button = new ImageButton(context);
            button.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
            button.setPadding((size - glyph) / 2, (size - glyph) / 2,
                    (size - glyph) / 2, (size - glyph) / 2);
            int color = tint().getDefaultColor();
            GradientDrawable surface = new GradientDrawable();
            surface.setShape(GradientDrawable.OVAL);
            surface.setColor((color & 0x00ffffff) | 0x18000000);
            button.setBackground(new InsetDrawable(surface, (size - face) / 2));
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(size, size);
            params.gravity = Gravity.CENTER_VERTICAL;
            icons.addView(button, index, params);
            return button;
        }

        boolean touch(MotionEvent event) {
            try {
                int action = event.getActionMasked();
                if (action == MotionEvent.ACTION_DOWN) {
                    pressed = hit(event, search) ? search : hit(event, stickers) ? stickers : null;
                    if (pressed != null) pressed.setPressed(true);
                    return pressed != null;
                }
                ImageButton target = pressed;
                if (target == null) return false;
                if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
                    pressed = null;
                    target.setPressed(false);
                    if (action == MotionEvent.ACTION_UP && hit(event, target)) perform(target);
                }
                return true;
            } catch (Throwable failure) {
                fail(failure);
                return pressed != null;
            }
        }

        private boolean hit(MotionEvent event, ImageButton button) {
            if (button == null || !button.isShown()) return false;
            bounds.set(0, 0, button.getWidth(), button.getHeight());
            ((ViewGroup) header).offsetDescendantRectToMyCoords(button, bounds);
            return bounds.contains((int) event.getX(), (int) event.getY());
        }

        private void perform(ImageButton button) throws ReflectiveOperationException {
            Object owner = keyboard.get();
            if (owner == null || !header.isAttachedToWindow()) return;
            if (button == search) {
                if (ops.activeQuery() != null) ops.clearSearch(owner);
                else ops.openSearch(owner, header);
            } else if (button == stickers) {
                ops.addSelectedToStickers(owner, header);
            }
            update();
        }

        private void fail(Throwable failure) {
            try { ops.report(failure); } catch (Throwable ignored) { }
            if (search != null) search.setVisibility(View.GONE);
            if (stickers != null) stickers.setVisibility(View.GONE);
        }

        void dispose() {
            active = false;
            synchronized (HEADERS) { HEADERS.remove(header); }
            try {
                showQuery(null);
                if (search != null) icons.removeView(search);
                if (stickers != null) icons.removeView(stickers);
            } catch (Throwable failure) {
                try { ops.report(failure); } catch (Throwable ignored) { }
            }
        }
    }
}
