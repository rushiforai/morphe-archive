package app.template.extension.alza;

import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
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
        setBackgroundColor(Color.TRANSPARENT);

        final boolean dark = isDarkMode(context);
        final boolean sk = AlzaPriceChartInjector.isSlovak(context);

        int bgColor = dark ? Color.parseColor("#1E1E1E") : Color.parseColor("#F7F7F8");
        int borderColor = dark ? Color.parseColor("#333333") : Color.parseColor("#E5E5EA");
        int textNormalColor = dark ? Color.parseColor("#F3F4F6") : Color.parseColor("#111827");
        int textMutedColor = dark ? Color.parseColor("#8E8E93") : Color.parseColor("#6B7280");
        final int brandGreen = Color.parseColor("#00A651");

        // Card background with rounded corners and border
        GradientDrawable cardBg = new GradientDrawable();
        cardBg.setShape(GradientDrawable.RECTANGLE);
        cardBg.setColor(bgColor);
        cardBg.setCornerRadius(dpToPx(context, 12f));
        cardBg.setStroke((int) dpToPx(context, 1f), borderColor);

        final LinearLayout cardContainer = new LinearLayout(context);
        cardContainer.setOrientation(LinearLayout.VERTICAL);
        cardContainer.setBackground(cardBg);

        int pad16 = (int) dpToPx(context, 16f);
        cardContainer.setPadding(pad16, pad16, pad16, pad16);

        // LayoutParams with 3x larger top margin (24dp instead of 8dp)
        LinearLayout.LayoutParams cardLp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT
        );
        int marginH = (int) dpToPx(context, 12f);
        int marginTop = (int) dpToPx(context, 24f); // 3x větší margin nad morphe menu
        int marginBottom = (int) dpToPx(context, 8f);
        cardLp.setMargins(marginH, marginTop, marginH, marginBottom);
        cardContainer.setLayoutParams(cardLp);

        // 1. Header: "Morphe – Rozšíření pro Alzu"
        LinearLayout headerRow = new LinearLayout(context);
        headerRow.setOrientation(LinearLayout.HORIZONTAL);
        headerRow.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout.LayoutParams headerLp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT
        );
        headerRow.setLayoutParams(headerLp);

        TextView titleView = new TextView(context);
        titleView.setText(sk ? "Morphe – Rozšírenie pre Alzu" : "Morphe – Rozšíření pro Alzu");
        titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
        titleView.setTypeface(Typeface.DEFAULT_BOLD);
        titleView.setTextColor(brandGreen);
        LinearLayout.LayoutParams titleLp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT
        );
        headerRow.addView(titleView, titleLp);

        cardContainer.addView(headerRow);

        boolean showPriceHistory = AlzaPriceChartInjector.isPriceHistoryPatchEnabled();
        boolean showBenefitPrices = AlzaPriceChartInjector.isBenefitPricesPatchEnabled();
        boolean showFxAlza = AlzaPriceChartInjector.isFxAlzaPatchEnabled();

        // Fallback: If no patch was explicitly activated yet via Application.onCreate, show all available by default
        if (!showPriceHistory && !showBenefitPrices && !showFxAlza) {
            showPriceHistory = true;
            showBenefitPrices = true;
            showFxAlza = true;
        }

        // 2. Price History Section (3-state segmented control: Vypnuto / Velký / Kompaktní)
        if (showPriceHistory) {
            addDivider(cardContainer, context, borderColor, 12f);

            TextView chartTitle = new TextView(context);
            chartTitle.setText(sk ? "Graf cenovej histórie (Hlídač shopov)" : "Graf historie cen (Hlídač shopů)");
            chartTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
            chartTitle.setTypeface(Typeface.DEFAULT_BOLD);
            chartTitle.setTextColor(textNormalColor);
            cardContainer.addView(chartTitle);

            // Container for segmented control
            final LinearLayout segmentContainer = new LinearLayout(context);
            segmentContainer.setOrientation(LinearLayout.HORIZONTAL);
            segmentContainer.setWeightSum(3f);

            int segBgColor = dark ? Color.parseColor("#262626") : Color.parseColor("#E5E5EA");
            GradientDrawable segBg = new GradientDrawable();
            segBg.setShape(GradientDrawable.RECTANGLE);
            segBg.setColor(segBgColor);
            segBg.setCornerRadius(dpToPx(context, 8f));
            segmentContainer.setBackground(segBg);

            int pad3 = (int) dpToPx(context, 3f);
            segmentContainer.setPadding(pad3, pad3, pad3, pad3);

            LinearLayout.LayoutParams segLp = new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT,
                    (int) dpToPx(context, 36f)
            );
            segLp.topMargin = (int) dpToPx(context, 8f);
            segLp.bottomMargin = (int) dpToPx(context, 6f);
            segmentContainer.setLayoutParams(segLp);

            final TextView btnOff = new TextView(context);
            btnOff.setText(sk ? "Vypnutý" : "Vypnuto");
            final TextView btnLarge = new TextView(context);
            btnLarge.setText(sk ? "Veľký" : "Velký");
            final TextView btnCompact = new TextView(context);
            btnCompact.setText(sk ? "Kompaktný" : "Kompaktní");

            final TextView[] buttons = new TextView[]{btnOff, btnLarge, btnCompact};
            final int[] modes = new int[]{
                    AlzaPriceChartInjector.CHART_MODE_OFF,
                    AlzaPriceChartInjector.CHART_MODE_LARGE,
                    AlzaPriceChartInjector.CHART_MODE_COMPACT
            };

            final TextView chartDesc = new TextView(context);
            chartDesc.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
            chartDesc.setTextColor(textMutedColor);
            chartDesc.setPadding(0, 0, 0, (int) dpToPx(context, 4f));

            final Runnable updateSegmentUi = new Runnable() {
                @Override
                public void run() {
                    int currentMode = AlzaPriceChartInjector.getChartMode();
                    for (int i = 0; i < 3; i++) {
                        TextView btn = buttons[i];
                        boolean active = (modes[i] == currentMode);
                        if (active) {
                            GradientDrawable actBg = new GradientDrawable();
                            actBg.setShape(GradientDrawable.RECTANGLE);
                            actBg.setColor(brandGreen);
                            actBg.setCornerRadius(dpToPx(context, 6f));
                            btn.setBackground(actBg);
                            btn.setTextColor(Color.WHITE);
                            btn.setTypeface(Typeface.DEFAULT_BOLD);
                        } else {
                            btn.setBackground(null);
                            btn.setTextColor(dark ? Color.parseColor("#9CA3AF") : Color.parseColor("#4B5563"));
                            btn.setTypeface(Typeface.DEFAULT);
                        }
                    }

                    if (currentMode == AlzaPriceChartInjector.CHART_MODE_OFF) {
                        chartDesc.setText(sk
                                ? "Graf cenovej histórie je skrytý (zobrazuje sa pôvodné rozloženie Alzy)."
                                : "Graf historie cen je skrytý (zobrazuje se původní rozložení Alzy).");
                    } else if (currentMode == AlzaPriceChartInjector.CHART_MODE_LARGE) {
                        chartDesc.setText(sk
                                ? "Zobrazí veľký graf pod cenovkou s možnosťou zbalenia."
                                : "Zobrazí velký graf pod cenovkou s možností sbalení.");
                    } else {
                        chartDesc.setText(sk
                                ? "Skryje ponuku splátok (HomeCredit) a vloží kompaktný graf priamo vedľa cenovky."
                                : "Skryje nabídku splátek (HomeCredit) a vloží kompaktní graf přímo vedle cenovky.");
                    }
                }
            };

            for (int i = 0; i < 3; i++) {
                final int mode = modes[i];
                final TextView btn = buttons[i];
                btn.setGravity(Gravity.CENTER);
                btn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);

                LinearLayout.LayoutParams btnLp = new LinearLayout.LayoutParams(
                        0, LinearLayout.LayoutParams.MATCH_PARENT, 1.0f
                );
                btn.setLayoutParams(btnLp);

                btn.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        AlzaPriceChartInjector.setChartMode(mode);
                        AlzaPriceChartInjector.unloadActiveProduct(context);
                        updateSegmentUi.run();
                        String msg;
                        if (mode == AlzaPriceChartInjector.CHART_MODE_OFF) {
                            msg = sk ? "Graf cenovej histórie vypnutý" : "Graf historie cen vypnut";
                        } else if (mode == AlzaPriceChartInjector.CHART_MODE_LARGE) {
                            msg = sk ? "Veľký graf zapnutý" : "Velký graf zapnut";
                        } else {
                            msg = sk ? "Kompaktný graf zapnutý (HomeCredit skrytý)" : "Kompaktní graf zapnut (HomeCredit skryt)";
                        }
                        Toast.makeText(context, msg, Toast.LENGTH_SHORT).show();
                    }
                });
                segmentContainer.addView(btn);
            }

            updateSegmentUi.run();
            cardContainer.addView(segmentContainer);
            cardContainer.addView(chartDesc);
        }

        // 3. Benefit Prices Button Toggle Switch Row (only if Benefit Prices patch is enabled)
        if (showBenefitPrices) {
            addDivider(cardContainer, context, borderColor, 12f);

            LinearLayout benefitSwitchRow = new LinearLayout(context);
            benefitSwitchRow.setOrientation(LinearLayout.HORIZONTAL);
            benefitSwitchRow.setGravity(Gravity.CENTER_VERTICAL);
            LinearLayout.LayoutParams benefitSwitchRowLp = new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT,
                    LinearLayout.LayoutParams.WRAP_CONTENT
            );
            benefitSwitchRow.setLayoutParams(benefitSwitchRowLp);

            LinearLayout benefitTextCol = new LinearLayout(context);
            benefitTextCol.setOrientation(LinearLayout.VERTICAL);
            LinearLayout.LayoutParams benefitTextColLp = new LinearLayout.LayoutParams(
                    0, LinearLayout.LayoutParams.WRAP_CONTENT, 1.0f
            );
            benefitTextColLp.rightMargin = (int) dpToPx(context, 12f);
            benefitTextCol.setLayoutParams(benefitTextColLp);

            TextView benefitTitle = new TextView(context);
            benefitTitle.setText(sk ? "Cenníky Alzy (Gold, ISIC, B2B…)" : "Ceníky Alzy (Gold, ISIC, B2B…)");
            benefitTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
            benefitTitle.setTypeface(Typeface.DEFAULT_BOLD);
            benefitTitle.setTextColor(textNormalColor);
            benefitTextCol.addView(benefitTitle);

            TextView benefitDesc = new TextView(context);
            benefitDesc.setText(sk
                    ? "Zobrazí v detaile produktu tlačidlo na otvorenie ponuky všetkých cenových kategórií a promo akcií."
                    : "Zobrazí v detailu produktu tlačítko pro otevření nabídky všech cenových kategorií a promo akcí.");
            benefitDesc.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
            benefitDesc.setTextColor(textMutedColor);
            benefitDesc.setPadding(0, (int) dpToPx(context, 2f), 0, 0);
            benefitTextCol.addView(benefitDesc);

            benefitSwitchRow.addView(benefitTextCol);

            final Switch benefitSwitch = new Switch(context);
            benefitSwitch.setChecked(AlzaPriceChartInjector.isBenefitPricesButtonVisible());
            benefitSwitch.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
                @Override
                public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                    AlzaPriceChartInjector.setBenefitPricesButtonVisible(isChecked);
                    AlzaPriceChartInjector.unloadActiveProduct(context);
                    String msg = isChecked
                            ? (sk ? "Cenníky Alzy zapnuté" : "Ceníky Alzy zapnuty")
                            : (sk ? "Cenníky Alzy vypnuté" : "Ceníky Alzy vypnuty");
                    Toast.makeText(context, msg, Toast.LENGTH_SHORT).show();
                }
            });
            benefitSwitchRow.addView(benefitSwitch);

            cardContainer.addView(benefitSwitchRow);
        }

        // 4. FxAlza & Clean Links Switches Row (only if FxAlza patch is enabled)
        if (showFxAlza) {
            addDivider(cardContainer, context, borderColor, 12f);

            // Switch 1: Odkazy přes fxalza.cz
            LinearLayout fxSwitchRow = new LinearLayout(context);
            fxSwitchRow.setOrientation(LinearLayout.HORIZONTAL);
            fxSwitchRow.setGravity(Gravity.CENTER_VERTICAL);
            LinearLayout.LayoutParams fxSwitchRowLp = new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT,
                    LinearLayout.LayoutParams.WRAP_CONTENT
            );
            fxSwitchRow.setLayoutParams(fxSwitchRowLp);

            LinearLayout fxTextCol = new LinearLayout(context);
            fxTextCol.setOrientation(LinearLayout.VERTICAL);
            LinearLayout.LayoutParams fxTextColLp = new LinearLayout.LayoutParams(
                    0, LinearLayout.LayoutParams.WRAP_CONTENT, 1.0f
            );
            fxTextColLp.rightMargin = (int) dpToPx(context, 12f);
            fxTextCol.setLayoutParams(fxTextColLp);

            TextView fxTitle = new TextView(context);
            fxTitle.setText(sk ? "Odkazy cez fxalza.cz" : "Odkazy přes fxalza.cz");
            fxTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
            fxTitle.setTypeface(Typeface.DEFAULT_BOLD);
            fxTitle.setTextColor(textNormalColor);
            fxTextCol.addView(fxTitle);

            TextView fxDesc = new TextView(context);
            fxDesc.setText(sk
                    ? "Pri zdieľaní a kopírovaní prevedie alza.sk na sk.fxalza.cz (pre bohaté náhľady na Discorde a sieťach)."
                    : "Při sdílení a kopírování převede alza.cz na fxalza.cz (pro bohaté náhledy na Discordu a sítích).");
            fxDesc.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
            fxDesc.setTextColor(textMutedColor);
            fxDesc.setPadding(0, (int) dpToPx(context, 2f), 0, 0);
            fxTextCol.addView(fxDesc);

            fxSwitchRow.addView(fxTextCol);

            final Switch fxSwitch = new Switch(context);
            fxSwitch.setChecked(AlzaPriceChartInjector.isFxAlzaLinksEnabled());
            fxSwitch.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
                @Override
                public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                    AlzaPriceChartInjector.setFxAlzaLinksEnabled(isChecked);
                    AlzaPriceChartInjector.unloadActiveProduct(context);
                    String msg = isChecked
                            ? (sk ? "Odkazy cez fxalza.cz zapnuté" : "Odkazy přes fxalza.cz zapnuty")
                            : (sk ? "Odkazy cez fxalza.cz vypnuté" : "Odkazy přes fxalza.cz vypnuty");
                    Toast.makeText(context, msg, Toast.LENGTH_SHORT).show();
                }
            });
            fxSwitchRow.addView(fxSwitch);
            cardContainer.addView(fxSwitchRow);

            // Switch 2: Čisté odkazy bez reklamy
            addDivider(cardContainer, context, borderColor, 8f);

            LinearLayout cleanSwitchRow = new LinearLayout(context);
            cleanSwitchRow.setOrientation(LinearLayout.HORIZONTAL);
            cleanSwitchRow.setGravity(Gravity.CENTER_VERTICAL);
            cleanSwitchRow.setLayoutParams(new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT,
                    LinearLayout.LayoutParams.WRAP_CONTENT
            ));

            LinearLayout cleanTextCol = new LinearLayout(context);
            cleanTextCol.setOrientation(LinearLayout.VERTICAL);
            LinearLayout.LayoutParams cleanTextColLp = new LinearLayout.LayoutParams(
                    0, LinearLayout.LayoutParams.WRAP_CONTENT, 1.0f
            );
            cleanTextColLp.rightMargin = (int) dpToPx(context, 12f);
            cleanTextCol.setLayoutParams(cleanTextColLp);

            TextView cleanTitle = new TextView(context);
            cleanTitle.setText(sk ? "Čisté odkazy pri zdieľaní" : "Čisté odkazy při sdílení");
            cleanTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
            cleanTitle.setTypeface(Typeface.DEFAULT_BOLD);
            cleanTitle.setTextColor(textNormalColor);
            cleanTextCol.addView(cleanTitle);

            TextView cleanDesc = new TextView(context);
            cleanDesc.setText(sk
                    ? "Odstráni reklamný text 'Odoslané z aplikácie Alza' pri zdieľaní alebo kopírovaní odkazu."
                    : "Odstraní reklamní text 'Odesláno z aplikace Alza' při sdílení nebo kopírování odkazu.");
            cleanDesc.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
            cleanDesc.setTextColor(textMutedColor);
            cleanDesc.setPadding(0, (int) dpToPx(context, 2f), 0, 0);
            cleanTextCol.addView(cleanDesc);

            cleanSwitchRow.addView(cleanTextCol);

            final Switch cleanSwitch = new Switch(context);
            cleanSwitch.setChecked(AlzaPriceChartInjector.isCleanSharedLinksEnabled());
            cleanSwitch.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
                @Override
                public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                    AlzaPriceChartInjector.setCleanSharedLinksEnabled(isChecked);
                    AlzaPriceChartInjector.unloadActiveProduct(context);
                    String msg = isChecked
                            ? (sk ? "Čisté odkazy zapnuté" : "Čisté odkazy zapnuty")
                            : (sk ? "Čisté odkazy vypnuté" : "Čisté odkazy vypnuty");
                    Toast.makeText(context, msg, Toast.LENGTH_SHORT).show();
                }
            });
            cleanSwitchRow.addView(cleanSwitch);
            cardContainer.addView(cleanSwitchRow);
        }

        addView(cardContainer);
    }

    private void addDivider(ViewGroup parent, Context context, int color, float verticalMarginDp) {
        View divider = new View(context);
        divider.setBackgroundColor(color);
        LinearLayout.LayoutParams divLp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                (int) dpToPx(context, 1f)
        );
        int marginV = (int) dpToPx(context, verticalMarginDp);
        divLp.setMargins(0, marginV, 0, marginV);
        divider.setLayoutParams(divLp);
        parent.addView(divider);
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
