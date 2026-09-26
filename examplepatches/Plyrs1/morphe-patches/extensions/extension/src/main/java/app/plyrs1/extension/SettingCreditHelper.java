package app.plyrs1.extension;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;

public class SettingCreditHelper {

    private static final String CREDIT_TEXT = "Patched with ❤️ by Plyrs";
    private static final String REPO_URL = "https://github.com/Plyrs1/morphe-patches";
    private static final String TAG_KEY = "plyrs_setting_credit_tag";

    public static void setupCreditText(View rootView) {
        try {
            if (!(rootView instanceof ViewGroup)) {
                return;
            }
            ViewGroup parentGroup = (ViewGroup) rootView;

            if (parentGroup.findViewWithTag(TAG_KEY) != null) {
                return;
            }

            Context context = rootView.getContext();
            TextView creditView = new TextView(context);
            creditView.setTag(TAG_KEY);
            creditView.setText(CREDIT_TEXT);
            creditView.setGravity(Gravity.CENTER);

            float density = context.getResources().getDisplayMetrics().density;
            int topPadding = (int) (24 * density);
            int bottomPadding = (int) (24 * density);
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

            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            );
            lp.gravity = Gravity.CENTER_HORIZONTAL;

            parentGroup.addView(creditView, lp);
        } catch (Exception ignored) {
        }
    }
}
