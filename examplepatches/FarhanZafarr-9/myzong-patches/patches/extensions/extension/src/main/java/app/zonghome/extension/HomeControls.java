package app.zonghome.extension;
import android.view.View;
import android.view.ViewGroup;
final class HomeControls {
    private HomeControls() {}
    private static boolean hide(View root, String name) {
        View view = ViewNames.find(root, name);
        if (view == null || view.getVisibility() == View.GONE) return false;
        view.setVisibility(View.GONE);
        return true;
    }
    static boolean apply(View root) {
        boolean changed = false;
        if (NavigationStyle.hideTariff()) changed |= hide(root, "tvTariff");
        if (NavigationStyle.hideLoanButton()) changed |= hide(root, "btnLoan");
        if (!NavigationStyle.hideSmsCard()) return changed;
        changed |= hide(root, "cardSms");
        View minutes = ViewNames.find(root, "cardMins");
        if (minutes == null || minutes.getLayoutParams() == null) return changed;
        ViewGroup.LayoutParams params = minutes.getLayoutParams();
        int guide = root.getResources().getIdentifier("guideLineRight", "id", "com.zong.customercare");
        if (guide == 0) return changed;
        boolean reflow = false;
        try {
            java.lang.reflect.Field endToStart = params.getClass().getField("endToStart");
            java.lang.reflect.Field endToEnd = params.getClass().getField("endToEnd");
            if (endToStart.getInt(params) != -1 || endToEnd.getInt(params) != guide) {
                endToStart.setInt(params, -1); endToEnd.setInt(params, guide); reflow = true;
            }
            if (params instanceof ViewGroup.MarginLayoutParams) {
                ViewGroup.MarginLayoutParams margins = (ViewGroup.MarginLayoutParams)params;
                if (margins.getMarginEnd() != 0) { margins.setMarginEnd(0); reflow = true; }
            }
        } catch (ReflectiveOperationException ignored) { }
        if (reflow) { minutes.setLayoutParams(params); changed = true; }
        return changed;
    }
}
