package app.template.extension.alza;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.widget.CompoundButton;
import android.widget.LinearLayout;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

/**
 * Dedicated "Morphe" settings card view displayed inside Alza app settings.
 */
public class MorpheSettingsCardView extends LinearLayout {

    public MorpheSettingsCardView(Context context) {
        super(context);
        init(context);
    }

    public MorpheSettingsCardView(Context context, AttributeSet attrs) {
        super(context, attrs);
        init(context);
    }

    private void init(final Context context) {
        setOrientation(LinearLayout.VERTICAL);

        boolean dark = isDarkMode(context);
        final boolean sk = AlzaPriceChartInjector.isSlovak(context);

        int bgColor = dark ? Color.parseColor("#181824") : Color.parseColor("#FFFFFF");
        int borderColor = dark ? Color.parseColor("#2E2E3E") : Color.parseColor("#E5E7EB");
        int textNormalColor = dark ? Color.parseColor("#F3F4F6") : Color.parseColor("#111827");
        int textMutedColor = dark ? Color.parseColor("#9CA3AF") : Color.parseColor("#6B7280");
        int brandGreen = Color.parseColor("#00A651");

        // Card background with rounded corners and border
        GradientDrawable cardBg = new GradientDrawable();
        cardBg.setShape(GradientDrawable.RECTANGLE);
        cardBg.setColor(bgColor);
        cardBg.setCornerRadius(dpToPx(context, 12f));
        cardBg.setStroke((int) dpToPx(context, 1f), borderColor);
        setBackground(cardBg);

        int pad16 = (int) dpToPx(context, 16f);
        setPadding(pad16, pad16, pad16, pad16);

        // LayoutParams with margins
        LinearLayout.LayoutParams cardLp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT
        );
        int marginH = (int) dpToPx(context, 12f);
        int marginV = (int) dpToPx(context, 8f);
        cardLp.setMargins(marginH, marginV, marginH, marginV);
        setLayoutParams(cardLp);

        // 1. Header: "Morphe – Hlídač shopů"
        LinearLayout headerRow = new LinearLayout(context);
        headerRow.setOrientation(LinearLayout.HORIZONTAL);
        headerRow.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout.LayoutParams headerLp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT
        );
        headerRow.setLayoutParams(headerLp);

        TextView titleView = new TextView(context);
        titleView.setText(sk ? "Morphe – Hlídač shopov" : "Morphe – Hlídač shopů");
        titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
        titleView.setTypeface(Typeface.DEFAULT_BOLD);
        titleView.setTextColor(brandGreen);
        LinearLayout.LayoutParams titleLp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT
        );
        headerRow.addView(titleView, titleLp);

        addView(headerRow);

        // Divider
        addDivider(context, borderColor, 12f);

        // 2. Compact Mode Toggle Switch Row
        LinearLayout switchRow = new LinearLayout(context);
        switchRow.setOrientation(LinearLayout.HORIZONTAL);
        switchRow.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout.LayoutParams switchRowLp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT
        );
        switchRow.setLayoutParams(switchRowLp);

        LinearLayout textCol = new LinearLayout(context);
        textCol.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams textColLp = new LinearLayout.LayoutParams(
                0, LinearLayout.LayoutParams.WRAP_CONTENT, 1.0f
        );
        textColLp.rightMargin = (int) dpToPx(context, 12f);
        textCol.setLayoutParams(textColLp);

        TextView switchTitle = new TextView(context);
        switchTitle.setText(sk ? "Kompaktný režim" : "Kompaktní režim");
        switchTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
        switchTitle.setTypeface(Typeface.DEFAULT_BOLD);
        switchTitle.setTextColor(textNormalColor);
        textCol.addView(switchTitle);

        TextView switchDesc = new TextView(context);
        switchDesc.setText(sk ? "Skryje ponuku splátok (HomeCredit) a zmenší graf cenovej histórie pre úsporu miesta na displeji." : "Skryje HomeCredit (splátky) a zmenší graf cenové historie pro úsporu místa na displeji.");
        switchDesc.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
        switchDesc.setTextColor(textMutedColor);
        switchDesc.setPadding(0, (int) dpToPx(context, 2f), 0, 0);
        textCol.addView(switchDesc);

        switchRow.addView(textCol);

        final Switch compactSwitch = new Switch(context);
        compactSwitch.setChecked(AlzaPriceChartInjector.isCompactMode());
        compactSwitch.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                AlzaPriceChartInjector.setCompactMode(isChecked);
                String msg = isChecked
                        ? (sk ? "Kompaktný režim zapnutý (HomeCredit skrytý)" : "Kompaktní režim zapnut (HomeCredit skryt)")
                        : (sk ? "Kompaktný režim vypnutý" : "Kompaktní režim vypnut");
                Toast.makeText(context, msg, Toast.LENGTH_SHORT).show();
            }
        });
        switchRow.addView(compactSwitch);

        addView(switchRow);
    }

    private void addDivider(Context context, int color, float verticalMarginDp) {
        View divider = new View(context);
        divider.setBackgroundColor(color);
        LinearLayout.LayoutParams divLp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                (int) dpToPx(context, 1f)
        );
        int marginV = (int) dpToPx(context, verticalMarginDp);
        divLp.setMargins(0, marginV, 0, marginV);
        divider.setLayoutParams(divLp);
        addView(divider);
    }

    private static boolean isDarkMode(Context context) {
        try {
            int nightMode = context.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;
            return nightMode == Configuration.UI_MODE_NIGHT_YES;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static float dpToPx(Context context, float dp) {
        return TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP,
                dp,
                context.getResources().getDisplayMetrics()
        );
    }
}
