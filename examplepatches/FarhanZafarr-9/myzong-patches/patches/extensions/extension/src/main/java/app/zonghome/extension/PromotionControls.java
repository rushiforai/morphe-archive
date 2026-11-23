package app.zonghome.extension;

import android.app.Dialog;
import android.graphics.Color;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.ImageView;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import java.util.Locale;

public final class PromotionControls {
    private PromotionControls() {}
    public static boolean hideWhatsAppChannel() { return false; }

    public static void onDialogShown(Dialog dialog) {
        if (!hideWhatsAppChannel() || dialog.getWindow() == null) return;
        View root = dialog.getWindow().getDecorView();
        if (isChannelPromotion(root)) {
            dialog.dismiss();
            return;
        }
        WeakReference<Dialog> reference = new WeakReference<>(dialog);
        root.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() {
            @Override public boolean onPreDraw() {
                Dialog current = reference.get();
                if (current == null || !current.isShowing()) {
                    root.getViewTreeObserver().removeOnPreDrawListener(this);
                    return true;
                }
                if (!isChannelPromotion(root)) return true;
                root.getViewTreeObserver().removeOnPreDrawListener(this);
                current.dismiss();
                return false;
            }
        });
    }

    private static boolean isChannelPromotion(View root) {
        StringBuilder text = new StringBuilder();
        collectText(root, text);
        String words = text.toString().toLowerCase(Locale.ROOT).replaceAll("[^a-z0-9]", "");
        return words.contains("getthelatestupdatesatzong5gwhatsappchannel");
    }

    private static void collectText(View view, StringBuilder text) {
        if (view instanceof TextView) text.append(((TextView) view).getText()).append(' ');
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) collectText(group.getChildAt(i), text);
        }
    }

    public static void tintUsageStar(ImageView view, int originalColor) {
        if (NavigationStyle.shapes()) MaterialShapes.styleFavorite(view);
        boolean selected=Color.alpha(originalColor)!=0;
        view.setSelected(selected);
        if(NavigationStyle.shapes()) {
            view.setColorFilter(selected?CharcoalTheme.ON_ACCENT:0xff666666);
            return;
        }
        int color=CharcoalTheme.tabIndicatorColor(view,CharcoalTheme.ACCENT);
        view.setColorFilter(selected?color:originalColor);
    }
}
