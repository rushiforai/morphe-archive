package app.yydarlinker.deepseekcaptions;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.util.Pair;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;

/** Use Morphe's public dialog chrome when installed, without making the addon depend on it. */
final class CaptionSettingsDialogs {
    private CaptionSettingsDialogs() {}

    static Dialog show(Context c, String title, View content, String closeLabel) {
        // A bounded scroll area also keeps actions reachable in landscape and with large fonts.
        ScrollView scroll = new ScrollView(c) {
            @Override protected void onMeasure(int width, int height) {
                int cap = Math.max(CaptionSettingsStyle.dp(c,96),
                        (int)(c.getResources().getDisplayMetrics().heightPixels * .55f));
                if (MeasureSpec.getMode(height) != MeasureSpec.UNSPECIFIED)
                    cap = Math.min(cap, MeasureSpec.getSize(height));
                super.onMeasure(width, MeasureSpec.makeMeasureSpec(cap, MeasureSpec.AT_MOST));
            }
        };
        scroll.setFillViewport(false);
        scroll.addView(content, new ViewGroup.LayoutParams(-1,-2));
        Dialog dialog = null;
        try {
            Object result = Class.forName("app.morphe.extension.shared.ui.CustomDialog")
                    .getMethod("create", Context.class, CharSequence.class, CharSequence.class,
                            EditText.class, CharSequence.class, Runnable.class, Runnable.class,
                            CharSequence.class, Runnable.class, boolean.class, boolean.class)
                    .invoke(null, c, title, null, null, closeLabel, (Runnable)()->{}, null,
                            null, null, false, false);
            Pair<?,?> pair = (Pair<?,?>)result;
            LinearLayout main = (LinearLayout)pair.second;
            main.addView(scroll, main.getChildCount()-1, new LinearLayout.LayoutParams(-1,-2,1f));
            dialog = (Dialog)pair.first;
        } catch (ReflectiveOperationException | ClassCastException | LinkageError unavailable) {
            if (scroll.getParent() instanceof ViewGroup) ((ViewGroup)scroll.getParent()).removeView(scroll);
        }
        if (dialog == null) {
            scroll.setPadding(CaptionSettingsStyle.dp(c,20),0,CaptionSettingsStyle.dp(c,20),0);
            dialog = new AlertDialog.Builder(c).setTitle(title).setView(scroll)
                    .setPositiveButton(closeLabel,null).create();
        }
        dialog.show();
        return dialog;
    }
}
