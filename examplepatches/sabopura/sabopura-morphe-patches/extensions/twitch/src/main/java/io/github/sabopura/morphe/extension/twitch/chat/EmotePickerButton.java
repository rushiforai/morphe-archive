package io.github.sabopura.morphe.extension.twitch.chat;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.drawable.RippleDrawable;
import android.util.AttributeSet;
import android.view.View;
import android.widget.EditText;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;
import io.github.sabopura.morphe.extension.twitch.chat.emotes.EmotePicker;
import io.github.sabopura.morphe.extension.twitch.ui.Text;
import io.github.sabopura.morphe.extension.twitch.ui.TwitchRes;
import io.github.sabopura.morphe.extension.twitch.ui.Ui;

/** Additional picker; Twitch's original picker and input controller remain in charge of sending. */
public final class EmotePickerButton extends View {
    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Path badgeHole = new Path();
    private final int face, badge, onBadge;

    public EmotePickerButton(Context context, AttributeSet attrs) {
        super(context, attrs);
        Ui ui = Ui.of(context);
        face = ui.secondary;
        badge = ui.accent;
        onBadge = ui.onAccent;
        setClickable(true);
        setFocusable(true);
        setBackground(new RippleDrawable(ColorStateList.valueOf(ui.dark ? 0x33FFFFFF : 0x22000000), null, null));
        setContentDescription(Text.label("追加エモート・お気に入り", "Additional emotes and favorites"));
        setOnClickListener(v -> {
            try {
                EditText input = input();
                if (input != null) EmotePicker.show(input);
            } catch (RuntimeException | LinkageError e) {
                Diagnostics.note("emotes.picker-open", e);
            }
        });
    }

    private EditText input() {
        int id = TwitchRes.id(getContext(), "message_input", "id");
        View view = getRootView().findViewById(id);
        return view instanceof EditText ? (EditText) view : null;
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        post(() -> {
            try {
                EditText input = input();
                if (input != null) EmotePicker.attach(input);
            } catch (RuntimeException | LinkageError e) {
                Diagnostics.note("emotes.completion-attach", e);
            }
        });
    }

    /** A face with a plus badge: Twitch's own emote button beside it is a plain face. */
    @Override
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        float d = getResources().getDisplayMetrics().density;
        float x = getWidth() / 2f - d, y = getHeight() / 2f + d;
        float badgeX = x + 7.5f * d, badgeY = y - 7.5f * d;
        canvas.save();
        badgeHole.rewind();
        badgeHole.addCircle(badgeX, badgeY, 6.5f * d, Path.Direction.CW);
        canvas.clipOutPath(badgeHole);
        paint.setColor(face);
        paint.setStrokeWidth(1.8f * d);
        paint.setStyle(Paint.Style.STROKE);
        paint.setStrokeCap(Paint.Cap.ROUND);
        canvas.drawCircle(x, y, 9 * d, paint);
        canvas.drawArc(x - 5 * d, y - 4 * d, x + 5 * d, y + 5 * d, 15, 150, false, paint);
        paint.setStyle(Paint.Style.FILL);
        canvas.drawCircle(x - 3 * d, y - 3 * d, d, paint);
        canvas.drawCircle(x + 3 * d, y - 3 * d, d, paint);
        canvas.restore();
        paint.setColor(badge);
        canvas.drawCircle(badgeX, badgeY, 5 * d, paint);
        paint.setColor(onBadge);
        paint.setStyle(Paint.Style.STROKE);
        paint.setStrokeWidth(1.6f * d);
        canvas.drawLine(badgeX - 2.4f * d, badgeY, badgeX + 2.4f * d, badgeY, paint);
        canvas.drawLine(badgeX, badgeY - 2.4f * d, badgeX, badgeY + 2.4f * d, paint);
    }
}
