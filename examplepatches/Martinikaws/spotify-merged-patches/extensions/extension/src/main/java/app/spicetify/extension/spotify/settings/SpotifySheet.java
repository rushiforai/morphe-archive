package app.spicetify.extension.spotify.settings;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.os.Bundle;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;

/**
 * A bottom sheet matching Spotify's confirmation sheets: grab handle, centred title and message, stacked buttons.
 * Public for the extensions' sheets outside settings, such as Home's Random chooser.
 */
public final class SpotifySheet extends Dialog {

    /** Returns true to dismiss the sheet after the click. */
    public interface Action {
        boolean onClick();
    }

    private final LinearLayout content;
    private final LinearLayout buttons;

    public SpotifySheet(Context context, String title, String message) {
        super(context, android.R.style.Theme_Material_Dialog_NoActionBar);
        // Settings pages pass a themed wrapper of Spotify's activity; the owner supplies the bottom inset.
        Context owner = context;
        while (!(owner instanceof Activity) && owner instanceof ContextWrapper) owner = ((ContextWrapper) owner).getBaseContext();
        if (owner instanceof Activity) setOwnerActivity((Activity) owner);
        content = SpotifyStyle.column(context);
        int side = SpotifyStyle.dp(context, 24);
        content.setPadding(side, SpotifyStyle.dp(context, 12), side, SpotifyStyle.dp(context, 16));
        content.setGravity(Gravity.CENTER_HORIZONTAL);

        View handle = new View(context);
        GradientDrawable pill = new GradientDrawable();
        pill.setColor(Color.rgb(99, 99, 99));
        pill.setCornerRadius(SpotifyStyle.dp(context, 2));
        handle.setBackground(pill);
        LinearLayout.LayoutParams handleParams = new LinearLayout.LayoutParams(SpotifyStyle.dp(context, 40), SpotifyStyle.dp(context, 4));
        handleParams.bottomMargin = SpotifyStyle.dp(context, 24);
        content.addView(handle, handleParams);

        TextView heading = SpotifyStyle.text(context, title, 22, Color.WHITE, SpotifyStyle.Font.TITLE);
        heading.setGravity(Gravity.CENTER);
        SpotifyStyle.heading(heading);
        content.addView(heading, wide());
        if (message != null) {
            TextView body = SpotifyStyle.text(context, message, 16, Color.WHITE, SpotifyStyle.Font.REGULAR);
            body.setGravity(Gravity.CENTER);
            body.setPadding(0, SpotifyStyle.dp(context, 8), 0, 0);
            content.addView(body, wide());
        }
        buttons = SpotifyStyle.column(context);
        buttons.setGravity(Gravity.CENTER_HORIZONTAL);
        LinearLayout.LayoutParams buttonsParams = wide();
        buttonsParams.topMargin = SpotifyStyle.dp(context, 16);
        content.addView(buttons, buttonsParams);
    }

    /** Adds custom content between the message and the buttons. */
    SpotifySheet view(View view) {
        LinearLayout.LayoutParams params = wide();
        params.topMargin = SpotifyStyle.dp(getContext(), 16);
        content.addView(view, content.indexOfChild(buttons), params);
        return this;
    }

    public SpotifySheet primary(String label, Action action) {
        Button button = new Button(getContext());
        button.setText(label);
        SpotifyStyle.style(button, true);
        button.setOnClickListener(view -> { if (action.onClick()) dismiss(); });
        LinearLayout.LayoutParams params = SpotifyStyle.buttonParams(getContext());
        buttons.addView(button, params);
        return this;
    }

    public SpotifySheet secondary(String label) {
        Context context = getContext();
        Button button = new Button(context);
        button.setText(label);
        SpotifyStyle.style(button, false);
        button.setBackground(null);
        button.setOnClickListener(view -> cancel());
        buttons.addView(button, SpotifyStyle.buttonParams(context));
        return this;
    }

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(content);
        setCanceledOnTouchOutside(true);
        Window window = getWindow();
        if (window == null) return;
        GradientDrawable background = new GradientDrawable();
        background.setColor(SpotifyStyle.elevated());
        float radius = SpotifyStyle.dp(getContext(), 16);
        background.setCornerRadii(new float[] {radius, radius, radius, radius, 0, 0, 0, 0});
        window.setBackgroundDrawable(background);
        window.setGravity(Gravity.BOTTOM);
        window.setLayout(WindowManager.LayoutParams.MATCH_PARENT, WindowManager.LayoutParams.WRAP_CONTENT);
        if (Build.VERSION.SDK_INT >= 30) {
            WindowManager.LayoutParams attributes = window.getAttributes();
            attributes.setFitInsetsTypes(0);
            window.setAttributes(attributes);
        } else {
            window.addFlags(WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS);
        }
        content.setPadding(content.getPaddingLeft(), content.getPaddingTop(), content.getPaddingRight(),
                content.getPaddingBottom() + ownerBottomInset());
    }

    private int ownerBottomInset() {
        Activity owner = getOwnerActivity();
        if (owner == null) return 0;
        WindowInsets insets = owner.getWindow().getDecorView().getRootWindowInsets();
        return insets == null ? 0 : insets.getSystemWindowInsetBottom();
    }

    private static LinearLayout.LayoutParams wide() {
        return new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
    }
}
