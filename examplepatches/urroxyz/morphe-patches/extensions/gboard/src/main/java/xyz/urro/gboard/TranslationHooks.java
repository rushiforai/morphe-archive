package xyz.urro.gboard;

import android.content.Context;
import android.text.Editable;
import android.text.InputFilter;
import android.util.AttributeSet;
import android.util.Log;
import android.util.TypedValue;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.Toast;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Collection;
import java.util.Map;
import java.util.function.Consumer;

/** Adapter for the structurally checked native translation UI. No translated labels are used as identifiers. */
public final class TranslationHooks {
    private static final int STATE_TAG = 0x7e750001;

    private TranslationHooks() {}

    static Object field(Object owner, String name) throws ReflectiveOperationException {
        for (Class<?> type = owner.getClass(); type != null; type = type.getSuperclass()) {
            try {
                Field field = type.getDeclaredField(name);
                field.setAccessible(true);
                return field.get(owner);
            } catch (NoSuchFieldException ignored) { }
        }
        throw new NoSuchFieldException(name);
    }

    static Object call(Object owner, String name, Class<?>[] types, Object... args) throws ReflectiveOperationException {
        for (Class<?> type = owner.getClass(); type != null; type = type.getSuperclass()) {
            try {
                Method method = type.getDeclaredMethod(name, types);
                method.setAccessible(true);
                return method.invoke(owner, args);
            } catch (NoSuchMethodException ignored) { }
        }
        throw new NoSuchMethodException(name);
    }

    private static void set(Object owner, String name, Object value) throws ReflectiveOperationException {
        Field field = owner.getClass().getField(name);
        field.set(owner, value);
    }

    private static void failure(EditText query, Exception exception) {
        Log.e("UrroGboard", "Translation shortcut could not use the inspected Gboard API", exception);
        Toast.makeText(query.getContext(), "Couldn't change translation language", Toast.LENGTH_SHORT).show();
    }

    /** Called after Gboard attaches its consumer, before the user can type. */
    public static void attach(Object keyboard) {
        EditText query = null;
        try {
            Object value = field(keyboard, "a");
            query = value instanceof EditText ? (EditText) value : null;
            if (query == null) return;
            Object nativeConsumer = field(keyboard, "c");
            if (!(nativeConsumer instanceof Consumer)) return;
            State state = (State) query.getTag(STATE_TAG);
            if (state == null) {
                state = new State(keyboard, query);
                query.setTag(STATE_TAG, state);
            }
            state.consumer = (Consumer<Editable>) nativeConsumer;
            state.controller = field(nativeConsumer, "a");
            set(query, "h", state);
            state.configure();
        } catch (ReflectiveOperationException | RuntimeException exception) {
            if (query != null) failure(query, exception);
            else Log.e("UrroGboard", "Translation UI attachment failed", exception);
        }
    }

    /** Gboard asks this method which embedded editor should receive keyboard events. */
    public static Object editor(Object original) {
        if (!(original instanceof EditText)) return original;
        State state = (State) ((EditText) original).getTag(STATE_TAG);
        return state != null && state.pair != null && state.codesActive ? state.pair : original;
    }

    /** Only our two embedded editors override Gboard's always-focused behavior. */
    public static int focusState(Object editor) {
        if (!(editor instanceof EditText)) return -1;
        EditText view = (EditText) editor;
        Object tag = view.getTag(STATE_TAG);
        if (!(tag instanceof State)) return -1;
        State state = (State) tag;
        if (state.pair == null) return -1;
        return view.isEnabled() && (state.codesActive ? view == state.pair : view == state.query) ? 1 : 0;
    }

    public static void render(Object keyboard) {
        try {
            Object value = field(keyboard, "a");
            EditText query = value instanceof EditText ? (EditText) value : null;
            if (query != null && query.getTag(STATE_TAG) instanceof State) {
                State state = (State) query.getTag(STATE_TAG);
                state.hideLanguageBar();
                state.applyFocus();
            }
        } catch (ReflectiveOperationException exception) {
            Log.e("UrroGboard", "Translation rendering hook failed", exception);
        }
    }

    public static void renderUi(Object ui) {
        try {
            Object value = field(ui, "k");
            EditText query = value instanceof EditText ? (EditText) value : null;
            if (query != null && query.getTag(STATE_TAG) instanceof State) {
                State state = (State) query.getTag(STATE_TAG);
                state.hideLanguageBar();
                state.applyFocus();
            }
        } catch (ReflectiveOperationException exception) {
            Log.e("UrroGboard", "Translation language bar refresh failed", exception);
        }
    }

    private static android.graphics.drawable.Drawable halfBackground(
            android.graphics.drawable.Drawable original, boolean left) {
        android.graphics.drawable.Drawable copy = original.getConstantState().newDrawable().mutate();
        squareInnerCorners(copy, left);
        return copy;
    }

    private static void squareInnerCorners(android.graphics.drawable.Drawable drawable, boolean left) {
        if (drawable instanceof android.graphics.drawable.GradientDrawable) {
            android.graphics.drawable.GradientDrawable shape = (android.graphics.drawable.GradientDrawable) drawable;
            float[] corners = shape.getCornerRadii();
            if (corners == null) {
                corners = new float[8];
                java.util.Arrays.fill(corners, shape.getCornerRadius());
            }
            int top = left ? 2 : 0;
            int bottom = left ? 4 : 6;
            corners[top] = corners[top + 1] = corners[bottom] = corners[bottom + 1] = 0;
            shape.setCornerRadii(corners);
        }
        else if (drawable instanceof android.graphics.drawable.DrawableWrapper) {
            squareInnerCorners(((android.graphics.drawable.DrawableWrapper) drawable).getDrawable(), left);
        } else if (drawable instanceof android.graphics.drawable.LayerDrawable) {
            android.graphics.drawable.LayerDrawable layers = (android.graphics.drawable.LayerDrawable) drawable;
            for (int i = 0; i < layers.getNumberOfLayers(); i++) squareInnerCorners(layers.getDrawable(i), left);
        } else if (android.os.Build.VERSION.SDK_INT >= 29 && drawable instanceof android.graphics.drawable.StateListDrawable) {
            android.graphics.drawable.StateListDrawable states = (android.graphics.drawable.StateListDrawable) drawable;
            for (int i = 0; i < states.getStateCount(); i++) squareInnerCorners(states.getStateDrawable(i), left);
        }
    }

    private static final class State implements Consumer<Editable> {
        final Object keyboard;
        final EditText query;
        Object controller;
        Consumer<Editable> consumer;
        EditText pair;
        boolean changing;
        boolean codesActive;

        State(Object keyboard, EditText query) {
            this.keyboard = keyboard;
            this.query = query;
        }

        @SuppressWarnings("unchecked")
        boolean select(String text) throws ReflectiveOperationException {
            Object languages = field(controller, "q");
            Object source = field(languages, "b");
            Object target = field(languages, "c");
            Collection<String> sources = ((Map<String, ?>) call(source, "f", new Class<?>[0])).keySet();
            Collection<String> targets = ((Map<String, ?>) call(target, "f", new Class<?>[0])).keySet();
            LanguageShortcut.Selection selection = LanguageShortcut.parse(text, sources, targets);
            if (selection == null) return false;
            String oldSource = (String) call(source, "d", new Class<?>[0]);
            String oldTarget = (String) call(target, "d", new Class<?>[0]);
            boolean success = selection.source == null || (Boolean) call(source, "h", new Class<?>[]{String.class}, selection.source);
            success &= (Boolean) call(target, "h", new Class<?>[]{String.class}, selection.target);
            if (!success) {
                call(source, "h", new Class<?>[]{String.class}, oldSource);
                call(target, "h", new Class<?>[]{String.class}, oldTarget);
                return false;
            }
            if (pair == null) {
                query.getText().delete(0, selection.end);
                // ai() may immediately retranslate the stored query, so update it before refreshing.
                setQueryText(query.getText().toString());
            }
            call(controller, "ai", new Class<?>[]{boolean.class}, selection.source != null);
            if (pair != null) {
                pair.setText(currentPair());
                focus(false);
            }
            return true;
        }

        void setQueryText(String text) throws ReflectiveOperationException {
            Class<?> type = controller.getClass().getSuperclass();
            Field queryField = type.getDeclaredField("a");
            queryField.setAccessible(true);
            queryField.set(controller, text);
        }

        String currentPair() throws ReflectiveOperationException {
            Object languages = field(controller, "q");
            String source = (String) call(field(languages, "b"), "d", new Class<?>[0]);
            String target = (String) call(field(languages, "c"), "d", new Class<?>[0]);
            return "auto".equalsIgnoreCase(source) ? target : source + "-" + target;
        }

        @Override public void accept(Editable text) {
            if (changing || text == null) return;
            changing = true;
            try {
                if (pair == null) select(text.toString());
            } catch (ReflectiveOperationException | RuntimeException exception) {
                failure(query, exception);
            } finally {
                changing = false;
            }
            consumer.accept(text);
        }

        void applyFocus() throws ReflectiveOperationException {
            if (pair == null) return;
            pair.setActivated(codesActive);
            query.setActivated(!codesActive);
            pair.setCursorVisible(codesActive);
            query.setCursorVisible(!codesActive);
            call(pair, NativeApi.editorFocus(), new Class<?>[]{boolean.class}, codesActive);
            call(query, NativeApi.editorFocus(), new Class<?>[]{boolean.class}, !codesActive);
            ((View) field(field(keyboard, "b"), "l")).setActivated(!codesActive);
        }

        void focus(boolean codes) throws ReflectiveOperationException {
            codesActive = codes;
            applyFocus();
            if (codes) { pair.requestFocus(); pair.selectAll(); }
            else {
                pair.setSelection(pair.length());
                query.requestFocus();
            }
            call(controller, "ag", new Class<?>[0]);
            applyFocus();
        }

        void configure() throws ReflectiveOperationException {
            if (pair != null) { applyFocus(); return; }
            if (!query.getContext().getSharedPreferences("urro_gboard", Context.MODE_PRIVATE).getBoolean("simplify_translation_input", false)) return;
            if (!(query.getParent() instanceof FrameLayout)) {
                throw new IllegalStateException("Unsupported translation editor container");
            }
            FrameLayout parent = (FrameLayout) query.getParent();
            pair = (EditText) query.getClass().getConstructor(Context.class, AttributeSet.class)
                    .newInstance(query.getContext(), null);
            pair.setTag(STATE_TAG, this);
            pair.setTextSize(TypedValue.COMPLEX_UNIT_PX, query.getTextSize());
            pair.setTextColor(query.getTextColors());
            pair.setSingleLine(true);
            pair.setInputType(android.text.InputType.TYPE_CLASS_TEXT | android.text.InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
            pair.setContentDescription("Translation language codes");
            int gap = Math.round(4 * query.getResources().getDisplayMetrics().density);
            int width = (int) Math.ceil(query.getPaint().measureText("MMMMM"));
            pair.setPaddingRelative(gap, query.getPaddingTop(), gap, query.getPaddingBottom());
            Object ui = field(keyboard, "b");
            View holder = (View) field(ui, "l");
            android.graphics.drawable.Drawable background = holder.getBackground();
            if (background != null && background.getConstantState() != null) {
                boolean languageOnLeft = query.getLayoutDirection() != View.LAYOUT_DIRECTION_RTL;
                pair.setBackground(halfBackground(background, languageOnLeft));
                holder.setBackground(halfBackground(background, !languageOnLeft));
                if (holder instanceof android.widget.ImageView) {
                    android.widget.ImageView image = (android.widget.ImageView) holder;
                    android.graphics.drawable.Drawable outline = image.getDrawable();
                    if (outline != null && outline.getConstantState() != null) {
                        pair.setForeground(halfBackground(outline, languageOnLeft));
                        image.setImageDrawable(halfBackground(outline, !languageOnLeft));
                    }
                }
            }
            // The native background spans the whole row. Give each editor its own
            // background, with a gap, rather than drawing both inside that one bubble.
            FrameLayout.LayoutParams holderParams = (FrameLayout.LayoutParams) holder.getLayoutParams();
            holderParams.setMarginStart(width + gap);
            holder.setLayoutParams(holderParams);
            FrameLayout.LayoutParams pairParams = new FrameLayout.LayoutParams(width, ViewGroup.LayoutParams.MATCH_PARENT);
            pairParams.gravity = android.view.Gravity.START;
            parent.addView(pair, pairParams);
            FrameLayout.LayoutParams queryParams = (FrameLayout.LayoutParams) query.getLayoutParams();
            queryParams.setMarginStart(width + gap);
            query.setLayoutParams(queryParams);
            pair.setText(currentPair());
            pair.setFilters(new InputFilter[]{(source, start, end, destination, ds, de) -> {
                StringBuilder allowed = new StringBuilder();
                boolean confirm = false;
                for (int i = start; i < end;) {
                    int cp = Character.codePointAt(source, i);
                    i += Character.charCount(cp);
                    if (LanguageShortcut.whitespace(cp)) confirm = true;
                    else if (cp >= 'a' && cp <= 'z' || cp >= 'A' && cp <= 'Z' || cp >= '0' && cp <= '9' || cp == '-') allowed.appendCodePoint(cp);
                }
                if (confirm) {
                    String complete = destination.subSequence(0, ds) + allowed.toString() + destination.subSequence(de, destination.length()) + " ";
                    pair.post(() -> {
                        try {
                            if (!select(complete)) pair.setError("Choose supported translation language codes");
                        } catch (ReflectiveOperationException | RuntimeException exception) { failure(query, exception); }
                    });
                }
                return allowed.toString();
            }});
            pair.setOnTouchListener((view, event) -> {
                if (event.getAction() == MotionEvent.ACTION_UP) {
                    try { focus(true); } catch (ReflectiveOperationException exception) { failure(query, exception); }
                }
                return false;
            });
            View.OnTouchListener nativeTouch = (View.OnTouchListener) field(keyboard, "d");
            query.setOnTouchListener((view, event) -> {
                if (event.getAction() == MotionEvent.ACTION_UP) {
                    try { focus(false); } catch (ReflectiveOperationException exception) { failure(query, exception); }
                }
                return nativeTouch != null && nativeTouch.onTouch(view, event);
            });
            hideLanguageBar();
            focus(true);
        }

        void hideLanguageBar() throws ReflectiveOperationException {
            if (pair == null) return;
            Object ui = field(keyboard, "b");
            View bar = (View) field(ui, "f");
            if (bar != null) bar.setVisibility(View.GONE);
            View options = (View) field(ui, "e");
            if (options != null) options.setVisibility(View.GONE);
            View root = (View) field(ui, "d");
            if (root != null) {
                int padding = Math.round(8 * root.getResources().getDisplayMetrics().density);
                if (root.getPaddingTop() < padding) {
                    root.setPaddingRelative(root.getPaddingStart(), padding, root.getPaddingEnd(), root.getPaddingBottom());
                }
                // In the supported layout the back wrapper shares the now-empty
                // language row. Removing both lets its wrap-content height collapse.
                int backId = root.getResources().getIdentifier("key_pos_translate_back_wrapper", "id", query.getResources().getResourcePackageName(query.getId()));
                View back = backId == 0 ? null : root.findViewById(backId);
                if (back != null) back.setVisibility(View.GONE);
            }
        }
    }
}
