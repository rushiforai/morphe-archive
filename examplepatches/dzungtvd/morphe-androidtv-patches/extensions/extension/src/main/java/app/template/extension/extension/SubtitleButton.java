package app.template.extension.extension;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.util.Base64;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.lang.reflect.Method;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;

/** Adds the subtitles toggle to the player's floating button row. */
final class SubtitleButton {

    private static final String TAG = "TikTokTVSub";
    private static final String BUTTON_TAG = "app.tiktoktv.subtitle.button";
    private static final String ICON_MENU_VIEW = "com.ss.android.ugc.aweme.tv.ui.IconMenuView";
    private static final String LABEL = "Subtitles";

    /** The icon whose slot this button takes over. */
    private static final String DISLIKE = "dislike_menu";
    private static final String COMMENT = "comment_menu";

    /** The views the row's visibility and focus memory are keyed off. */
    private static final String[] ROW_GROUPS = {"player_menu_group", "video_over_lay"};

    /** The mark's colour when the row is not focused: the same white the other icons are drawn in. */
    private static final int GLYPH_COLOR = 0xFFFFFFFF;

    /** The fraction of the icon box the mark is drawn into. */
    private static final float MARK_SCALE = 0.75f;

    private static final String OFF_MASK =
            "iVBORw0KGgoAAAANSUhEUgAAAQAAAAEACAYAAABccqhmAAAE3UlEQVR42u3dUXLbOgxAUcGj/W8Z/etPMmO5pWQCOGcB71kw"
            + "eUUrjROZeQAzvYwABAAQAEAAAAEABAAQAEAAAAEABAAQAEAAAAEABAAQAEAAAAEABAAQAEAAAAEABAAQAEAAAAEABAAQAEAA"
            + "AAEABAAQAEAAAAEABAAQAEAAAAEAAQAEABAAQACACc6m15XeWm4QAmCTM1d2i8Np08PytVkmBi+bH+au1ZeBwtw1ew4aZFiT"
            + "PLzucvd1dzZ7A2xyVolFazN3Xptng81v0/PNOOQHa3q7tfqy+eGxj5YpAN8ZPFiLBQKQNj/NI7DVKeBsOmT45vr07wBuuPvb"
            + "/HS5UaUA2PyIgAAAswPg7o9TgBMAIADu/sw6BQiAzY8IzAyAX/MFJwB3f5wCBAAQAEAAgIEB8PkfnAAAAQAEABAAQAAAAQAE"
            + "ABAAQAAAAQAEABAAQAAAAQAEAAQAEABAAAABAAQAEABAAAABAAQAKO80gh8q/sXiMKetZyUANv1jrz/MaptZ+Qhg87e6HrMS"
            + "AAtg6HWZlQB444tdX27037EWPAMo+4ZH4dee//H6K8/p09efx8BnAqfNX2Yx//a6csPXVHlW4yLgIWCtBb3j6zQrAbD5h75e"
            + "sxKAVsf/qgsk3rz2XDyrKD6rY/GsBMCdf8w1mJMA2Px4zwUAEABAABwF+1+PWQkAIACAAEBhfh3YGgABgIk8BLQGYC7fCbjX"
            + "Z8kwK/NyApi7oH3zDgIwfEH77j2zEgBsCrMSgMkLMy3oW69ZKA8PAe+04osn0qwuzcJmdgIot6A9wTYHARi+oMOszEoAcJc1"
            + "KwEYvOD8Dv8e1+IPg+DOY05OAIAAAAIACAAgAIAAAAIACAAgAIAAAAIAbM3vAuzjri+1CHMaOysngCILOotumE6bv9usBIC5"
            + "C9usBKDCAkqzMisBmLmwLWhz+DoPAfde2DFkM+XDcxIeJ4Ct/evXhMXQWR1mJQBY2GYlAOUXUJiVDSwAMxd2mBVP8hDQwjYr"
            + "JwBAAGAWfx7cGgABgIn8GNAaAAEABGCkdD1mJQCAAAAC4GMA3nMBsCBcgzkJQB/RdGG8+2LR1d8tkEffLx8JAXAS8HrNSgBE"
            + "wOs0q94m/jpwHJ9/aWdYyJdeUxTf9CEAItDt7hHmZPP7CDDvDY9F1xiHbyoSAG/8+OsyKwGwAIZfj1l5BtA+AmkhX/p/pU0v"
            + "AE4E5oSPAIAAAAIACAAgAIAAAAIACAAgAIAAAAIACAAgAIAAAAIACAAgAIAAAAIACAAgAIAAAAIACABQJAD+jjs4AQACAAgA"
            + "MCcAngPQTQrAT/7CLDgBOAXg7i8AIoDNLwDAnAC8ew7gFEDXu38IADA+AE4BuPsPPwGIADb/w86ig/XvB6i48X0EWFRGpwGq"
            + "bv4QgKG1xZ3fCaBYIaHz2n4VH5RTAI7+TT8CxMWhiQA7b/44Nj7VVngGcDUCQsCTGz8Xrd2vqvJjwLg48Kw0fFoe9Uutv9Mb"
            + "BnNV+jGgOzrW6uAAiADWqI8AfwfsiI+NP/gZQPi8j00/NwA+GsCwZwCAAAACAAgAIACAAAACAAgAIACAAAACAAgACAAgAIAA"
            + "AAIACAAgAIAAAAIACAAgAIAAAAIACAAgAIAAAAIACAAgAIAAAAIACAAgAIAAAAIACAAgAIAAAAv8AR5kszTxXXJ5AAAAAElF"
            + "TkSuQmCC";

    private static final String ON_MASK =
            "iVBORw0KGgoAAAANSUhEUgAAAQAAAAEACAYAAABccqhmAAADrUlEQVR42u3dW3brIBBFQTeL+U+5PQF/yImsBZyqCURuwxZS"
            + "7qO6+wVkGkYAAgAIACAAgAAAAgAIACAAgAAAAgAIACAAgAAAAgAIACAAgAAAAgAIACAAgAAAAgAIACAAgAAAAgAIACAAgAAA"
            + "AgAIACAAgAAAAgAIACAAgACAAAACAAgAIABAgnno52pfLT9QAmCTk6tPi8O06eH2tblNDIbND7lrdRgo5K7ZYZCQu3an4cEj"
            + "63jJ9wLD5ofcNT0MCnLXtj8JCMFWC4C7P04BTgBAWgDc/XEKCA2AzY8IeAQA0gLg7o9TgBMAIACAAADnB8DzPzgBAAIACAAg"
            + "AIAAAAIACAAgAIAAAAIACAAgAIAAAAIACAAgAIAAAAIAAgAIACAAgAAAAgAIACAAgAAAAgAIACAAgAAAAgAIACAAgAAAi5lG"
            + "cEktdC1tTkfMSgBs+n9fV5vVdrPyCGDzH3WdZiUANn/o9ZqVANj8i1x3HfzzfMcCYGEs8hnMSQBsfnznAgAIACAAjoLnfx6z"
            + "EgBAAAABgI21AAACAIG8BLQGIJe/DrzWs2SZlXk5AeQu6DYrBCB7QbdZCYoAYFOYlQAEL8y2oH/6mYXy5SWgO5Q5OQEAAgAI"
            + "ACAAgAAAAgAIACAAgAAAAgAIACAAgAAAAgAIACAAgAAAAgAIACAAgAAAz/GvAq/t2//6qs3JrJwAzljQ9dBGSNz8qbMSABsC"
            + "sxKAlRdQmZUNLACZC7vMiid5CWhhm5UTACAAkMV/D24NgABAIr8GtAZAAAABiNQ+j1kJACAAgAB4DMB3LgAWhM9gTgIgAjtc"
            + "dx/883zHAmCBLHi9ZiUAIhB+nWa1MX8d+NqCKQv50jWVTS8ATgTmhEcAQAAAAQAEABAAQAAAAQAEABAAQAAAAQAEABAAQAAA"
            + "AQAEABAAQAAAAQAEABAAQAAAAQAEAATACEAAAAEABAAQAEAAAAEABAAQAEAAAAH4s/IVgBMAIACAAAAxAfAegFQlAEB8AJwC"
            + "cPcPPwGIADa/RwAgNQBOAbj7OwEAqQFwCsDdP/wEIALY/A+YGwysrR1s/Nx3AE4D2PzBARABbP7wAADhAXAKwFoNPwGIANbo"
            + "jebGA/bbAWz8wAB8GrgYYNOHBcCjAYS9AwAEABAAQAAAAQAEABAAQAAAAQAEABAAQABAAAABAAQAEABAAAABAAQAEABAAAAB"
            + "AAQAEABAAAABAAQAEABAAAABAAQAEABAAAABAAQAEABAAAABAAQAuMEbTMJaHmo9DyMAAAAASUVORK5CYII=";

    /** The masks, decoded once: the row asks for its mark every time a player is bound. */
    private static Bitmap off;
    private static Bitmap on;

    /**
     * The marks of every row that has been given a button, so a switch thrown in the More pane
     * repaints the floating icon instead of leaving it disagreeing.
     */
    private static final List<WeakReference<Glyph>> GLYPHS = new ArrayList<>();

    private SubtitleButton() {
    }

    /** Brings every floating button in line with the saved switch. */
    static void syncGlyphs(Context context) {
        boolean shown = Subtitles.isEnabled(context);

        synchronized (GLYPHS) {
            for (int i = GLYPHS.size() - 1; i >= 0; i--) {
                Glyph glyph = GLYPHS.get(i).get();
                if (glyph == null) {
                    GLYPHS.remove(i);
                    continue;
                }
                glyph.setShown(shown);
            }
        }
    }

    /** Adds the button to the fragment's row once, and keeps it aligned while the row moves. */
    static void attach(Object fragment, View root) {
        int moreId = Subtitles.idOf(root, "more_menu");
        if (moreId == 0) {
            Log.i(TAG, "no menu row to join");
            return;
        }

        View more = root.findViewById(moreId);
        if (more == null || !(more.getParent() instanceof ViewGroup)) return;

        ViewGroup row = (ViewGroup) more.getParent();
        if (root.findViewWithTag(BUTTON_TAG) != null) return;

        int dislikeId = Subtitles.idOf(root, DISLIKE);
        final View dislike = dislikeId == 0 ? null : root.findViewById(dislikeId);
        if (dislike != null) dislike.setVisibility(View.GONE);

        Context context = row.getContext();
        View button = newMenu(context);
        if (button == null) return;

        int buttonId = View.generateViewId();
        button.setId(buttonId);
        button.setTag(BUTTON_TAG);

        Glyph glyph = new Glyph(Subtitles.isEnabled(context));
        synchronized (GLYPHS) {
            GLYPHS.add(new WeakReference<>(glyph));
            while (GLYPHS.size() > 4) GLYPHS.remove(0);
        }
        invoke(button, "setIcon", Drawable.class, glyph);
        invoke(button, "setText", String.class, LABEL);
        invoke(button, "setIconBackground", int.class,
                Subtitles.drawableOf(root, "ic_menu_common_background_selector"));

        TextView label = label(button);
        if (label != null) {
            int maxWidth = Subtitles.dimenOf(root, "icon_menu_text_max_width");
            if (maxWidth > 0) label.setMaxWidth(maxWidth);
        }

        button.setOnFocusChangeListener((view, focused) -> glyph.setFocused(focused));

        ViewGroup.LayoutParams params = unconstrained(more);
        if (params == null) return;

        int at = row.indexOfChild(more);
        try {
            row.addView(button, at < 0 ? row.getChildCount() : at, params);
        } catch (Throwable failure) {
            Log.i(TAG, "button not added " + failure);
            return;
        }

        // The layout names the dislike icon as the row's neighbour on both sides of its slot, so the
        // chain is rebuilt around the button. Both sides have to be named: this view carries no
        // constraints of its own, and a row that searches its children by constraint finds nothing
        // next to it, which leaves the key press dead on the way back.
        int commentId = Subtitles.idOf(root, COMMENT);
        View comment = commentId == 0 ? null : root.findViewById(commentId);
        if (comment != null) comment.setNextFocusRightId(buttonId);
        button.setNextFocusLeftId(comment == null ? View.NO_ID : commentId);
        button.setNextFocusRightId(moreId);
        more.setNextFocusLeftId(buttonId);

        joinRow(fragment, row, button, buttonId, more, moreId, dislikeId);

        button.setOnClickListener(view -> {
            glyph.setShown(!glyph.isShown());
            Subtitles.setEnabled(view.getContext(), glyph.isShown());
            Log.i(TAG, "subtitles switched " + glyph.isShown());
            Subtitles.refresh(root);
        });

        align(button, dislike, more, row);
        row.addOnLayoutChangeListener((v, l, t, r, b, ol, ot, or, ob) ->
                align(button, dislike, more, row));

        Log.i(TAG, "subtitles button " + buttonId + " shown=" + glyph.isShown());
    }

    /** Parks this button in the slot one pitch left of the more icon. */
    private static void align(View button, View dislike, View more, ViewGroup row) {
        if (dislike != null && dislike.getVisibility() != View.GONE) {
            dislike.setVisibility(View.GONE);
        }
        if (more.getWidth() <= 0 || more.getLeft() <= 0) {
            row.post(() -> align(button, dislike, more, row));
            return;
        }

        int pitch = Subtitles.dimenOf(row, "icon_menu_drawable_size")
                + Subtitles.dimenOf(row, "icon_menu_margin_end");
        if (pitch <= 0) pitch = gap(row, button);
        if (pitch <= 0) pitch = more.getWidth();

        int slot = more.getLeft() + more.getWidth() / 2 - pitch;
        int shift = 0;
        for (int i = 0; i < row.getChildCount(); i++) {
            View taken = row.getChildAt(i);
            if (taken == button || taken.getVisibility() == View.GONE || !isMenu(taken)) continue;
            if (Math.abs(centre(taken) - slot) < pitch / 2) shift = -pitch;
        }

        for (int i = 0; i < row.getChildCount(); i++) {
            View child = row.getChildAt(i);
            if (child == button || child.getVisibility() == View.GONE || !isMenu(child)) continue;
            child.setTranslationX(centre(child) <= slot ? shift : 0);
        }

        button.setTranslationX(slot - (button.getLeft() + button.getWidth() / 2));
        button.setTranslationY(more.getTop() - button.getTop());
    }

    /** @return the centre this icon was laid out at, ignoring any shift the row already carries. */
    private static int centre(View icon) {
        return icon.getLeft() + icon.getWidth() / 2;
    }

    /** @return the smallest distance between two laid-out icons of the row, or -1 without a pair. */
    private static int gap(ViewGroup row, View button) {
        List<Integer> centres = new ArrayList<>();
        for (int i = 0; i < row.getChildCount(); i++) {
            View child = row.getChildAt(i);
            if (child == button || !isMenu(child)) continue;
            if (child.getVisibility() == View.GONE || child.getWidth() <= 0 || child.getLeft() <= 0) {
                continue;
            }

            int centre = child.getLeft() + child.getWidth() / 2;
            int at = centres.size();
            while (at > 0 && centres.get(at - 1) > centre) at--;
            centres.add(at, Integer.valueOf(centre));
        }

        int pitch = 0;
        for (int i = 1; i < centres.size(); i++) {
            int measured = centres.get(i).intValue() - centres.get(i - 1).intValue();
            if (measured > 0 && (pitch <= 0 || measured < pitch)) pitch = measured;
        }
        return pitch;
    }

    private static View newMenu(Context context) {
        try {
            Object menu = Class.forName(ICON_MENU_VIEW)
                    .getConstructor(Context.class, android.util.AttributeSet.class)
                    .newInstance(context, null);
            return menu instanceof View ? (View) menu : null;
        } catch (Throwable failure) {
            Log.i(TAG, "no IconMenuView " + failure);
            return null;
        }
    }

    /** A view added to a ConstraintLayout without constraints sits where its margins say. */
    private static ViewGroup.LayoutParams unconstrained(View sibling) {
        Object source = sibling.getLayoutParams();
        if (source == null) return null;

        try {
            Object params = source.getClass().getConstructor(int.class, int.class).newInstance(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            return params instanceof ViewGroup.LayoutParams
                    ? (ViewGroup.LayoutParams) params : null;
        } catch (Throwable failure) {
            Log.i(TAG, "no layout params " + failure);
            return null;
        }
    }

    private static boolean isMenu(View view) {
        for (Class<?> type = view.getClass(); type != null; type = type.getSuperclass()) {
            if (type.getName().equals(ICON_MENU_VIEW)) return true;
        }
        return false;
    }

    /** The app walks its own two lists of row views whenever a direction key is pressed while the row holds focus. */
    private static void joinRow(Object fragment, ViewGroup row, View button, int buttonId,
                                View more, int moreId, int dislikeId) {
        for (Class<?> type = fragment.getClass(); type != null; type = type.getSuperclass()) {
            for (java.lang.reflect.Field field : type.getDeclaredFields()) {
                if (field.getType() != List.class) continue;

                field.setAccessible(true);
                List<Object> list;
                try {
                    list = (List<Object>) field.get(fragment);
                } catch (Throwable ignored) {
                    continue;
                }
                if (list == null) continue;

                int at = list.contains(more) ? list.indexOf(more)
                        : list.contains(moreId) ? list.indexOf(moreId) : -1;
                if (at < 0) continue;

                list.add(at, list.get(0) instanceof View ? button : Integer.valueOf(buttonId));
            }
        }

        for (String name : ROW_GROUPS) {
            int id = Subtitles.idOf(row, name);
            if (id == 0) continue;

            View group = row.findViewById(id);
            if (group == null) continue;
            try {
                Method get = group.getClass().getMethod("getReferencedIds");
                Method set = group.getClass().getMethod("setReferencedIds", int[].class);
                int[] ids = (int[]) get.invoke(group);
                if (ids == null) continue;

                List<Integer> held = new ArrayList<>();
                for (int referenced : ids) {
                    if (referenced != dislikeId && referenced != buttonId) held.add(referenced);
                }
                held.add(buttonId);

                int[] joined = new int[held.size()];
                for (int i = 0; i < joined.length; i++) joined[i] = held.get(i);
                set.invoke(group, (Object) joined);
            } catch (Throwable failure) {
                Log.i(TAG, "group " + name + " " + failure);
            }
        }
    }

    private static TextView label(View button) {
        Object text = call(button, "getTextView");
        return text instanceof TextView ? (TextView) text : null;
    }

    private static Object call(Object target, String name) {
        return Subtitles.call(target, name);
    }

    /** The menu view's own setters, reached one signature at a time because it is not on the classpath. */
    private static void invoke(View target, String name, Class<?> parameter, Object argument) {
        try {
            target.getClass().getMethod(name, parameter).invoke(target, argument);
        } catch (Throwable failure) {
            Log.i(TAG, name + " failed " + failure);
        }
    }

    /** The closed captions mark: the leanback glyph, filled in with the captions on. */
    static final class Glyph extends Drawable {

        private final Paint ink = new Paint(Paint.FILTER_BITMAP_FLAG);
        private final Rect slot = new Rect();
        private int tint;
        private boolean shown;
        private boolean focused;

        Glyph(boolean shown) {
            this.shown = shown;
        }

        boolean isShown() {
            return shown;
        }

        void setShown(boolean shown) {
            if (this.shown == shown) return;

            this.shown = shown;
            invalidateSelf();
        }

        void setFocused(boolean focused) {
            if (this.focused == focused) return;

            this.focused = focused;
            invalidateSelf();
        }

        @Override
        public void draw(Canvas canvas) {
            Rect bounds = getBounds();
            int side = (int) (Math.min(bounds.width(), bounds.height()) * MARK_SCALE);
            if (side <= 0) return;

            Bitmap mask = mask(shown);
            if (mask == null) return;

            // Focus paints a white pill behind the icon, so the mark has to turn dark with it.
            int colour = focused ? Color.BLACK : GLYPH_COLOR;
            if (colour != tint) {
                tint = colour;
                ink.setColorFilter(new PorterDuffColorFilter(tint, PorterDuff.Mode.SRC_IN));
            }

            slot.set(bounds.left + (bounds.width() - side) / 2,
                    bounds.top + (bounds.height() - side) / 2,
                    bounds.left + (bounds.width() + side) / 2,
                    bounds.top + (bounds.height() + side) / 2);
            canvas.drawBitmap(mask, null, slot, ink);
        }

        @Override
        public void setAlpha(int alpha) {
        }

        @Override
        public void setColorFilter(android.graphics.ColorFilter colorFilter) {
        }

        @Override
        public int getOpacity() {
            return android.graphics.PixelFormat.TRANSLUCENT;
        }

        @Override
        public int getIntrinsicWidth() {
            return -1;
        }

        @Override
        public int getIntrinsicHeight() {
            return -1;
        }
    }

    /** @return the mask of one state, decoded the first time either is asked for. */
    private static Bitmap mask(boolean shown) {
        if (off == null && on == null) {
            off = decode(OFF_MASK);
            on = decode(ON_MASK);
        }
        return shown ? on : off;
    }

    private static Bitmap decode(String value) {
        try {
            byte[] bytes = Base64.decode(value, Base64.DEFAULT);
            return BitmapFactory.decodeByteArray(bytes, 0, bytes.length);
        } catch (Throwable failure) {
            Log.i(TAG, "mask not decoded " + failure);
            return null;
        }
    }
}
