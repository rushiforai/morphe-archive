package app.plyrs1.extension;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import java.lang.reflect.Method;

public class DrawerCreditHelper {

    private static final String CREDIT_TEXT = "Patched with ❤️ by Plyrs";
    private static final String REPO_URL = "https://github.com/Plyrs1/morphe-patches";
    private static final String TAG_KEY = "plyrs_credit_tag";

    public static void setupCreditText(Activity activity) {
        try {
            int navViewId = activity.getResources().getIdentifier("navigationView", "id", activity.getPackageName());
            if (navViewId == 0) return;

            View navView = activity.findViewById(navViewId);
            if (navView == null) return;

            ViewGroup headerGroup = null;
            try {
                Method getHeaderView = navView.getClass().getMethod("getHeaderView", int.class);
                Object headerObj = getHeaderView.invoke(navView, 0);
                if (headerObj instanceof ViewGroup) {
                    headerGroup = (ViewGroup) headerObj;
                }
            } catch (Exception ignored) {
            }

            if (headerGroup == null && navView instanceof ViewGroup) {
                ViewGroup navGroup = (ViewGroup) navView;
                for (int i = 0; i < navGroup.getChildCount(); i++) {
                    View child = navGroup.getChildAt(i);
                    if (child instanceof ViewGroup) {
                        headerGroup = (ViewGroup) child;
                        break;
                    }
                }
            }

            if (headerGroup != null) {
                if (headerGroup.findViewWithTag(TAG_KEY) != null) return;

                TextView creditView = new TextView(activity);
                creditView.setTag(TAG_KEY);
                creditView.setText(CREDIT_TEXT);
                creditView.setGravity(Gravity.CENTER);

                float density = activity.getResources().getDisplayMetrics().density;
                int topPadding = (int) (24 * density);
                int bottomPadding = (int) (20 * density);
                creditView.setPadding(0, topPadding, 0, bottomPadding);

                creditView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
                creditView.setAlpha(0.65f);

                creditView.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        try {
                            Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(REPO_URL));
                            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                            v.getContext().startActivity(intent);
                        } catch (Exception ignored) {
                        }
                    }
                });

                ViewGroup.LayoutParams lp = new ViewGroup.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT
                );
                headerGroup.addView(creditView, lp);
            }
        } catch (Exception ignored) {
        }
    }
}
