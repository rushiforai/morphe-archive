package app.template.extension.settings;

import android.app.Dialog;
import android.content.Context;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;

/** Simple input dialog for the TMDB API key. */
final class TmdbKeyDialog extends Dialog {

    interface OnSave { void onSave(String key); }

    private final Context ctx;
    private final float density;

    TmdbKeyDialog(Context context, final OnSave onSave) {
        super(context);
        this.ctx = context;
        this.density = context.getResources().getDisplayMetrics().density;
        Prefs.load(context);
        build(onSave);
    }

    private void build(final OnSave onSave) {
        Window window = getWindow();
        if (window != null) {
            GradientDrawable bg = new GradientDrawable();
            bg.setColor(SurfaceColors.elevated(ctx));
            bg.setCornerRadius(dp(20));
            window.setBackgroundDrawable(bg);
            WindowManager.LayoutParams lp = new WindowManager.LayoutParams();
            lp.copyFrom(window.getAttributes());
            lp.width = WindowManager.LayoutParams.MATCH_PARENT;
            window.setAttributes(lp);
        }

        LinearLayout root = new LinearLayout(ctx);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(dp(20), dp(20), dp(20), dp(16));

        TextView title = new TextView(ctx);
        title.setText("TMDB API key");
        title.setTextColor(0xFFFFFFFF);
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 19f);
        title.setTypeface(title.getTypeface(), Typeface.BOLD);
        root.addView(title);

        TextView hint = new TextView(ctx);
        hint.setText("Free key from themoviedb.org → Settings → API. Used only for the custom " +
                "poster picker. Stored locally, never exported.");
        hint.setTextColor(0xFF9AA0A6);
        hint.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        hint.setPadding(0, dp(6), 0, dp(14));
        root.addView(hint);

        final EditText input = new EditText(ctx);
        input.setText(Prefs.tmdbKey());
        input.setHint("paste key here");
        input.setHintTextColor(0xFF6B6B6B);
        input.setTextColor(0xFFEDEDED);
        input.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
        input.setSingleLine(true);
        GradientDrawable inputBg = new GradientDrawable();
        inputBg.setColor(SurfaceColors.background(ctx));
        inputBg.setCornerRadius(dp(8));
        inputBg.setStroke(dp(1), 0x33FFFFFF);
        input.setBackground(inputBg);
        input.setPadding(dp(10), dp(10), dp(10), dp(10));
        root.addView(input, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        LinearLayout buttons = new LinearLayout(ctx);
        buttons.setOrientation(LinearLayout.HORIZONTAL);
        buttons.setGravity(Gravity.END);
        buttons.setPadding(0, dp(16), 0, 0);

        TextView cancel = new TextView(ctx);
        cancel.setText("Cancel");
        cancel.setTextColor(0xFFB0B0B0);
        cancel.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
        cancel.setPadding(dp(16), dp(10), dp(16), dp(10));
        cancel.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) { dismiss(); }
        });
        buttons.addView(cancel);

        TextView save = new TextView(ctx);
        save.setText("Save");
        save.setTextColor(0xFFFFFFFF);
        save.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
        save.setTypeface(save.getTypeface(), Typeface.BOLD);
        save.setPadding(dp(16), dp(10), dp(16), dp(10));
        GradientDrawable saveBg = new GradientDrawable();
        saveBg.setColor(0xFF2A6FDB);
        saveBg.setCornerRadius(dp(8));
        save.setBackground(saveBg);
        save.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) {
                String key = input.getText() != null ? input.getText().toString().trim() : "";
                if (onSave != null) onSave.onSave(key);
                dismiss();
            }
        });
        buttons.addView(save);
        root.addView(buttons);

        setContentView(root);
    }

    private int dp(float v) { return Math.round(v * density); }
}
