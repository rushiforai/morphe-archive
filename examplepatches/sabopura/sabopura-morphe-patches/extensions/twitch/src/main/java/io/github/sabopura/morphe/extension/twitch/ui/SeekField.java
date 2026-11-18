/*
 * Ported from Bencho's seek block (Seek.tsx), MIT License.
 * Copyright (c) 2026 Lorenzo Cabra
 */
package io.github.sabopura.morphe.extension.twitch.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.PathInterpolator;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.FrameLayout;

import java.util.function.Consumer;

/**
 * A search icon that becomes the field, one object whose width is the state. Unlike the free-standing
 * source it sits at the end of a toolbar, so it grows from its right edge; the title gives way as it does.
 */
final class SeekField extends FrameLayout implements Motion.Step {
    private static final int SHUT_DP = 48, LENS_DP = 20;
    private static final int INSET_DP = (SHUT_DP - LENS_DP) / 2;
    private static final double TUNE = 20;
    private static final int PRESS_MS = 90;
    private static final float PRESSED_SCALE = .93f;

    private final Ui ui;
    private final EditText field;
    private final FrameSpring width;
    private final Motion.Loop loop = new Motion.Loop(this, this);
    private final Paint skin = new Paint(Paint.ANTI_ALIAS_FLAG), lens = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Path icon = Icons.path(Icons.Kind.SEARCH);
    private final Path shaped = new Path();
    private final Matrix matrix = new Matrix();
    private final Runnable onOpen, onClose;
    private final Consumer<String> onText;
    private int span = SHUT_DP;
    private boolean open, busy;
    private final float density;
    private View title;
    private final Runnable rest = () -> {
        busy = false;
        invalidate();
    };

    SeekField(Context context, Ui ui, Runnable onOpen, Runnable onClose, Consumer<String> onText, Runnable onSubmit) {
        super(context);
        this.ui = ui;
        this.onOpen = onOpen;
        this.onClose = onClose;
        this.onText = onText;
        density = context.getResources().getDisplayMetrics().density;
        width = new FrameSpring(SHUT_DP);
        setWillNotDraw(false);
        skin.setColor(ui.dark ? 0x1AFFFFFF : 0x0D000000);
        lens.setStyle(Paint.Style.STROKE);
        lens.setStrokeCap(Paint.Cap.ROUND);
        lens.setStrokeJoin(Paint.Join.ROUND);
        lens.setColor(ui.text);
        setClickable(true);
        setFocusable(true);
        setOnClickListener(v -> start());

        field = new EditText(context);
        field.setSingleLine(true);
        relabel();
        field.setTextColor(ui.text);
        field.setHintTextColor(ui.secondary);
        field.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        field.setImeOptions(EditorInfo.IME_ACTION_SEARCH);
        field.setBackground(null);
        field.setPadding(0, 0, 0, 0);
        field.setGravity(Gravity.CENTER_VERTICAL);
        field.setVisibility(INVISIBLE);
        field.setOnEditorActionListener((v, action, event) -> {
            onSubmit.run();
            return true;
        });
        field.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
            }

            @Override
            public void afterTextChanged(Editable s) {
                busy = true;
                removeCallbacks(rest);
                postDelayed(rest, 340);
                invalidate();
                SeekField.this.onText.accept(s.toString());
            }
        });
        LayoutParams lp = new LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
        lp.leftMargin = Math.round((INSET_DP + LENS_DP + 11) * density);
        lp.rightMargin = Math.round(14 * density);
        addView(field, lp);
    }

    /** The toolbar item that gives way as the field opens. */
    void setTitle(View title) {
        this.title = title;
    }

    boolean isOpen() {
        return open;
    }

    void setText(String text) {
        field.setText(text);
    }

    String text() {
        return field.getText().toString();
    }

    /** The width the open field takes, from the toolbar's real size. */
    void setSpan(int spanDp) {
        span = Math.max(SHUT_DP, spanDp);
        if (open) width.target = span;
        loop.start();
    }

    private void start() {
        if (open) return;
        setPressedScale(true);
        postDelayed(() -> {
            setPressedScale(false);
            openNow(true);
        }, Motion.enabled() ? PRESS_MS : 0);
    }

    private void setPressedScale(boolean pressed) {
        float scale = pressed ? PRESSED_SCALE : 1;
        animate().scaleX(scale).scaleY(scale).setDuration(160)
                .setInterpolator(new PathInterpolator(Ease.OUT[0], Ease.OUT[1], Ease.OUT[2], Ease.OUT[3]));
    }

    /** Says what the field is for, in the language chosen now. */
    void relabel() {
        String purpose = Text.label("設定を検索", "Search settings");
        setContentDescription(purpose);
        field.setHint(purpose);
    }

    void openNow(boolean keyboard) {
        if (open) return;
        open = true;
        width.target = span;
        field.setVisibility(VISIBLE);
        setClickable(false);
        setFocusable(false);
        onOpen.run();
        if (keyboard) {
            field.requestFocus();
            InputMethodManager ime = (InputMethodManager) getContext().getSystemService(Context.INPUT_METHOD_SERVICE);
            if (ime != null) ime.showSoftInput(field, InputMethodManager.SHOW_IMPLICIT);
        }
        loop.start();
    }

    void close() {
        if (!open) return;
        open = false;
        width.target = SHUT_DP;
        InputMethodManager ime = (InputMethodManager) getContext().getSystemService(Context.INPUT_METHOD_SERVICE);
        if (ime != null) ime.hideSoftInputFromWindow(field.getWindowToken(), 0);
        field.clearFocus();
        if (!TextUtils.isEmpty(field.getText())) field.setText("");
        field.setVisibility(INVISIBLE);
        setClickable(true);
        setFocusable(true);
        onClose.run();
        loop.start();
    }

    private void applyWidth() {
        ViewGroup.LayoutParams lp = getLayoutParams();
        if (lp == null) return;
        int wanted = Math.round((float) width.position * density);
        if (lp.width != wanted) {
            lp.width = wanted;
            setLayoutParams(lp);
        }
        float p = progress();
        float say = Math.max(0, Math.min(1, (p - .55f) / .45f));
        field.setAlpha(say);
        if (title != null) title.setAlpha(Math.max(0, 1 - p * 1.6f));
    }

    private float progress() {
        return (float) Math.max(0, Math.min(1, (width.position - SHUT_DP) / Math.max(1, span - SHUT_DP)));
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        applyWidth();
    }

    @Override
    public boolean frame(float seconds, long nowMs) {
        double frames = Math.max(0, Math.min(2.5, seconds * 1000 / 16.67));
        boolean moving = width.step(frames, FrameSpring.stiffnessOf(TUNE), FrameSpring.decayOf(TUNE), .02);
        applyWidth();
        return moving;
    }

    @Override
    public void snap() {
        width.position = width.target;
        width.velocity = 0;
        applyWidth();
    }

    @Override
    protected void onDetachedFromWindow() {
        loop.stop();
        removeCallbacks(rest);
        super.onDetachedFromWindow();
    }

    @Override
    protected void onDraw(Canvas canvas) {
        float height = getHeight();
        float radius = height / 2;
        skin.setAlpha(Math.round((ui.dark ? 0x1A : 0x0D) * (open || getScaleX() < 1 || width.position > SHUT_DP + .5 ? 1f : 0f)));
        canvas.drawRoundRect(0, 0, getWidth(), height, radius, radius, skin);
        float size = LENS_DP * density, scale = size / 24f;
        float left = INSET_DP * density, top = (height - size) / 2;
        lens.setStrokeWidth((busy ? 1.8f : 1.6f) * size / 18f);
        matrix.setScale(scale, scale);
        matrix.postTranslate(left, top);
        icon.transform(matrix, shaped);
        canvas.drawPath(shaped, lens);
    }
}
