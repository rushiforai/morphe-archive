package app.template.extension.alza;

import android.app.Dialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.util.List;

/**
 * Modern modal dialog displaying the tier price table (Gold, Silver, ISIC, Bronze, B2B, Basic)
 * with instant promo filters, discounts, grouped equal tiers, clean equalPrices card, and offer copy action.
 */
public class BenefitPricesDialog {

    public static void show(
            final Context context,
            final String commodityId,
            final String productName,
            BenefitPriceData initialData
    ) {
        if (context == null) return;

        final boolean dark = isDarkMode(context);
        final boolean sk = AlzaPriceChartInjector.isSlovak(context);

        // Always resolve fresh product ID and name to avoid stale name bug
        String freshCid = AlzaPriceChartInjector.getActiveCommodityId();
        final String effectiveCommodityId = (freshCid != null && !freshCid.isEmpty()) ? freshCid : commodityId;

        String freshPname = AlzaPriceChartInjector.getActiveProductName();
        final String effectiveProductName = (freshPname != null && !freshPname.trim().isEmpty()) ? freshPname.trim() : productName;

        final Dialog dialog = new Dialog(context);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);

        Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
        }

        final int bgColor = dark ? Color.parseColor("#1E1E1E") : Color.WHITE;
        final int borderColor = dark ? Color.parseColor("#333333") : Color.parseColor("#E5E5EA");
        final int textNormal = dark ? Color.parseColor("#F3F4F6") : Color.parseColor("#111827");
        final int textMuted = dark ? Color.parseColor("#8E8E93") : Color.parseColor("#6B7280");
        final int priceColor = dark ? Color.parseColor("#EF4444") : Color.parseColor("#CA0505");
        final int greenColor = Color.parseColor("#00A651");

        // Root Card container
        final LinearLayout rootCard = new LinearLayout(context);
        rootCard.setOrientation(LinearLayout.VERTICAL);

        GradientDrawable cardBg = new GradientDrawable();
        cardBg.setShape(GradientDrawable.RECTANGLE);
        cardBg.setColor(bgColor);
        cardBg.setCornerRadius(dpToPx(context, 16f));
        cardBg.setStroke((int) dpToPx(context, 1f), borderColor);
        rootCard.setBackground(cardBg);

        int pad = (int) dpToPx(context, 16f);
        rootCard.setPadding(pad, pad, pad, pad);

        // 1. Header (Title + Subtitle + Close button)
        LinearLayout headerRow = new LinearLayout(context);
        headerRow.setOrientation(LinearLayout.HORIZONTAL);
        headerRow.setGravity(Gravity.CENTER_VERTICAL);

        LinearLayout titleCol = new LinearLayout(context);
        titleCol.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams titleColLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f);
        titleCol.setLayoutParams(titleColLp);

        TextView titleView = new TextView(context);
        titleView.setText(sk ? "Ceny cenníkov" : "Ceny ceníků");
        titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 17f);
        titleView.setTypeface(Typeface.DEFAULT_BOLD);
        titleView.setTextColor(textNormal);
        titleCol.addView(titleView);

        if (effectiveProductName != null && !effectiveProductName.trim().isEmpty()) {
            TextView subView = new TextView(context);
            subView.setText(effectiveProductName.trim());
            subView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11.5f);
            subView.setTextColor(textMuted);
            subView.setSingleLine(true);
            subView.setEllipsize(android.text.TextUtils.TruncateAt.END);
            titleCol.addView(subView);
        } else if (effectiveCommodityId != null && !effectiveCommodityId.isEmpty()) {
            TextView subView = new TextView(context);
            subView.setText("ID: " + effectiveCommodityId);
            subView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11.5f);
            subView.setTextColor(textMuted);
            titleCol.addView(subView);
        }
        headerRow.addView(titleCol);

        TextView closeBtn = new TextView(context);
        closeBtn.setText("✕");
        closeBtn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 17f);
        closeBtn.setTypeface(Typeface.DEFAULT_BOLD);
        closeBtn.setTextColor(textMuted);
        closeBtn.setPadding((int) dpToPx(context, 8f), 0, (int) dpToPx(context, 4f), 0);
        closeBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                dialog.dismiss();
            }
        });
        headerRow.addView(closeBtn);
        rootCard.addView(headerRow);

        addDivider(rootCard, context, borderColor, 10f);

        // Loading container & Content container
        final LinearLayout loadingLayout = new LinearLayout(context);
        loadingLayout.setOrientation(LinearLayout.VERTICAL);
        loadingLayout.setGravity(Gravity.CENTER);
        loadingLayout.setPadding(0, (int) dpToPx(context, 24f), 0, (int) dpToPx(context, 24f));

        ProgressBar progressBar = new ProgressBar(context);
        loadingLayout.addView(progressBar);

        final TextView loadingText = new TextView(context);
        loadingText.setText(sk ? "Načítavam cenníky..." : "Načítám ceníky...");
        loadingText.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        loadingText.setTextColor(textMuted);
        loadingText.setPadding(0, (int) dpToPx(context, 8f), 0, 0);
        loadingLayout.addView(loadingText);

        rootCard.addView(loadingLayout);

        final LinearLayout contentContainer = new LinearLayout(context);
        contentContainer.setOrientation(LinearLayout.VERTICAL);
        contentContainer.setVisibility(View.GONE);
        rootCard.addView(contentContainer);

        // Setup dialog container in ScrollView
        ScrollView scrollView = new ScrollView(context);
        scrollView.addView(rootCard);

        int screenWidth = context.getResources().getDisplayMetrics().widthPixels;
        int dialogWidth = Math.min(screenWidth - (int) dpToPx(context, 24f), (int) dpToPx(context, 460f));
        dialog.setContentView(scrollView, new ViewGroup.LayoutParams(dialogWidth, ViewGroup.LayoutParams.WRAP_CONTENT));

        // State holder
        final BenefitPriceData[] currentData = new BenefitPriceData[]{ initialData };
        final Runnable[] renderTable = new Runnable[1];

        renderTable[0] = new Runnable() {
            @Override
            public void run() {
                if (currentData[0] == null) return;
                loadingLayout.setVisibility(View.GONE);
                contentContainer.setVisibility(View.VISIBLE);
                contentContainer.removeAllViews();

                boolean enablePlus = AlzaPriceChartInjector.isAlzaPlusPromosEnabled();
                boolean enableCashback = AlzaPriceChartInjector.isCashbackPromosEnabled();
                boolean enableTradeIn = AlzaPriceChartInjector.isTradeInPromosEnabled();

                currentData[0].recompute(enablePlus, enableCashback, enableTradeIn);

                boolean allEqual = currentData[0].areAllPricesEqual();

                if (allEqual) {
                    // SECTION 5: Special clean informational box when all tiers share identical price & promo
                    LinearLayout infoBox = new LinearLayout(context);
                    infoBox.setOrientation(LinearLayout.VERTICAL);
                    infoBox.setGravity(Gravity.CENTER_HORIZONTAL);
                    int infoPad = (int) dpToPx(context, 16f);
                    infoBox.setPadding(infoPad, infoPad, infoPad, infoPad);

                    GradientDrawable infoBoxBg = new GradientDrawable();
                    infoBoxBg.setShape(GradientDrawable.RECTANGLE);
                    infoBoxBg.setCornerRadius(dpToPx(context, 10f));
                    infoBoxBg.setColor(dark ? Color.parseColor("#252525") : Color.parseColor("#F3F4F6"));
                    infoBox.setBackground(infoBoxBg);

                    // Row 1: Mini-badges for all 6 tiers
                    LinearLayout miniBadgesRow = new LinearLayout(context);
                    miniBadgesRow.setOrientation(LinearLayout.HORIZONTAL);
                    miniBadgesRow.setGravity(Gravity.CENTER);

                    for (BenefitPriceData.TierType tierType : BenefitPriceData.TierType.values()) {
                        TextView miniBadge = new TextView(context);
                        miniBadge.setText(tierType.displayName);
                        miniBadge.setTextSize(TypedValue.COMPLEX_UNIT_SP, 10f);
                        miniBadge.setTypeface(Typeface.DEFAULT_BOLD);
                        miniBadge.setGravity(Gravity.CENTER);
                        miniBadge.setTextColor(tierType.getTextColor(dark));

                        GradientDrawable miniBg = new GradientDrawable();
                        miniBg.setShape(GradientDrawable.RECTANGLE);
                        miniBg.setCornerRadius(dpToPx(context, 3f));
                        miniBg.setColor(tierType.getBgColor(dark));
                        miniBadge.setBackground(miniBg);

                        int pX = (int) dpToPx(context, 6f);
                        int pY = (int) dpToPx(context, 2f);
                        miniBadge.setPadding(pX, pY, pX, pY);

                        LinearLayout.LayoutParams mbLp = new LinearLayout.LayoutParams(
                                ViewGroup.LayoutParams.WRAP_CONTENT,
                                ViewGroup.LayoutParams.WRAP_CONTENT
                        );
                        mbLp.setMargins((int) dpToPx(context, 2f), 0, (int) dpToPx(context, 2f), 0);
                        miniBadge.setLayoutParams(mbLp);
                        miniBadgesRow.addView(miniBadge);
                    }
                    infoBox.addView(miniBadgesRow);

                    // Row 2: Message 14sp bold
                    TextView msgView = new TextView(context);
                    msgView.setText(sk ? "Všetky cenníky majú rovnakú cenu" : "Všechny ceníky mají stejnou cenu");
                    msgView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
                    msgView.setTypeface(Typeface.DEFAULT_BOLD);
                    msgView.setTextColor(dark ? Color.parseColor("#F3F4F6") : Color.parseColor("#111827"));
                    msgView.setGravity(Gravity.CENTER);
                    LinearLayout.LayoutParams msgLp = new LinearLayout.LayoutParams(
                            ViewGroup.LayoutParams.WRAP_CONTENT,
                            ViewGroup.LayoutParams.WRAP_CONTENT
                    );
                    msgLp.setMargins(0, (int) dpToPx(context, 12f), 0, 0);
                    msgView.setLayoutParams(msgLp);
                    infoBox.addView(msgView);

                    // Row 3: Subtext 12sp
                    TextView subMsgView = new TextView(context);
                    subMsgView.setText(sk ? "Pri tomto produkte nie je dostupná žiadna dodatočná cenníková zľava." : "U tohoto produktu není dostupná žádná dodatečná ceníková sleva.");
                    subMsgView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
                    subMsgView.setTextColor(Color.parseColor("#8E8E93"));
                    subMsgView.setGravity(Gravity.CENTER);
                    LinearLayout.LayoutParams subMsgLp = new LinearLayout.LayoutParams(
                            ViewGroup.LayoutParams.WRAP_CONTENT,
                            ViewGroup.LayoutParams.WRAP_CONTENT
                    );
                    subMsgLp.setMargins(0, (int) dpToPx(context, 2f), 0, 0);
                    subMsgView.setLayoutParams(subMsgLp);
                    infoBox.addView(subMsgView);

                    // Row 4: Single Price + optional discount pill
                    LinearLayout priceRow = new LinearLayout(context);
                    priceRow.setOrientation(LinearLayout.HORIZONTAL);
                    priceRow.setGravity(Gravity.CENTER);
                    LinearLayout.LayoutParams priceRowLp = new LinearLayout.LayoutParams(
                            ViewGroup.LayoutParams.WRAP_CONTENT,
                            ViewGroup.LayoutParams.WRAP_CONTENT
                    );
                    priceRowLp.setMargins(0, (int) dpToPx(context, 12f), 0, 0);
                    priceRow.setLayoutParams(priceRowLp);

                    BenefitPriceData.TierResult sample = currentData[0].getAllTiers().values().iterator().next();
                    TextView mainPrice = new TextView(context);
                    mainPrice.setText(sample.finalPriceFormatted);
                    mainPrice.setTextSize(TypedValue.COMPLEX_UNIT_SP, 18f);
                    mainPrice.setTypeface(Typeface.DEFAULT_BOLD);
                    mainPrice.setTextColor(priceColor);
                    priceRow.addView(mainPrice);

                    if (sample.discountPercent != null && sample.discountPercent >= 0.5) {
                        TextView discPill = new TextView(context);
                        discPill.setText("−" + Math.round(sample.discountPercent) + " %");
                        discPill.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11.5f);
                        discPill.setTypeface(Typeface.DEFAULT_BOLD);
                        discPill.setTextColor(Color.WHITE);
                        discPill.setGravity(Gravity.CENTER);

                        GradientDrawable dpBg = new GradientDrawable();
                        dpBg.setShape(GradientDrawable.RECTANGLE);
                        dpBg.setCornerRadius(dpToPx(context, 4f));
                        dpBg.setColor(greenColor);
                        discPill.setBackground(dpBg);

                        int pillPadX = (int) dpToPx(context, 6f);
                        int pillPadY = (int) dpToPx(context, 2f);
                        discPill.setPadding(pillPadX, pillPadY, pillPadX, pillPadY);

                        LinearLayout.LayoutParams dpLp = new LinearLayout.LayoutParams(
                                ViewGroup.LayoutParams.WRAP_CONTENT,
                                ViewGroup.LayoutParams.WRAP_CONTENT
                        );
                        dpLp.setMargins((int) dpToPx(context, 8f), 0, 0, 0);
                        discPill.setLayoutParams(dpLp);
                        priceRow.addView(discPill);
                    }
                    infoBox.addView(priceRow);

                    // Optional Original Price
                    if (sample.discountBase != null && sample.discountBase > sample.finalAmount) {
                        TextView compPrice = new TextView(context);
                        compPrice.setText((sk ? "Pôvodná cena: " : "Původní cena: ") + currentData[0].formatPrice(sample.discountBase));
                        compPrice.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11.5f);
                        compPrice.setTextColor(Color.parseColor("#8E8E93"));
                        compPrice.setPaintFlags(compPrice.getPaintFlags() | Paint.STRIKE_THRU_TEXT_FLAG);
                        LinearLayout.LayoutParams cpLp = new LinearLayout.LayoutParams(
                                ViewGroup.LayoutParams.WRAP_CONTENT,
                                ViewGroup.LayoutParams.WRAP_CONTENT
                        );
                        cpLp.setMargins(0, (int) dpToPx(context, 4f), 0, 0);
                        compPrice.setLayoutParams(cpLp);
                        infoBox.addView(compPrice);
                    }

                    contentContainer.addView(infoBox);

                } else {
                    // SECTION 4: Grouped Table of tiers
                    List<BenefitPriceData.TierGroup> groups = currentData[0].getGroupedDisplayRows();

                    // Table Header Row
                    LinearLayout tblHeader = new LinearLayout(context);
                    tblHeader.setOrientation(LinearLayout.HORIZONTAL);
                    tblHeader.setGravity(Gravity.CENTER_VERTICAL);
                    tblHeader.setPadding(0, 0, 0, (int) dpToPx(context, 6f));

                    TextView thTier = new TextView(context);
                    thTier.setText(sk ? "CENNÍK" : "CENÍK");
                    thTier.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f);
                    thTier.setTypeface(Typeface.DEFAULT_BOLD);
                    thTier.setTextColor(textMuted);
                    thTier.setLayoutParams(new LinearLayout.LayoutParams((int) dpToPx(context, 114f), ViewGroup.LayoutParams.WRAP_CONTENT));
                    tblHeader.addView(thTier);

                    TextView thPrice = new TextView(context);
                    thPrice.setText(sk ? "CENA" : "CENA");
                    thPrice.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f);
                    thPrice.setTypeface(Typeface.DEFAULT_BOLD);
                    thPrice.setTextColor(textMuted);
                    thPrice.setPadding((int) dpToPx(context, 10f), 0, 0, 0);
                    thPrice.setLayoutParams(new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f));
                    tblHeader.addView(thPrice);

                    TextView thDiscount = new TextView(context);
                    thDiscount.setText(sk ? "ZĽAVA" : "SLEVA");
                    thDiscount.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f);
                    thDiscount.setTypeface(Typeface.DEFAULT_BOLD);
                    thDiscount.setTextColor(textMuted);
                    thDiscount.setGravity(Gravity.END);
                    thDiscount.setLayoutParams(new LinearLayout.LayoutParams((int) dpToPx(context, 68f), ViewGroup.LayoutParams.WRAP_CONTENT));
                    tblHeader.addView(thDiscount);

                    contentContainer.addView(tblHeader);

                    Double highestComparePrice = null;

                    for (BenefitPriceData.TierGroup group : groups) {
                        Double comp = group.getComparePrice();
                        if (comp != null && (highestComparePrice == null || comp > highestComparePrice)) {
                            highestComparePrice = comp;
                        }

                        LinearLayout row = new LinearLayout(context);
                        row.setOrientation(LinearLayout.HORIZONTAL);
                        row.setGravity(Gravity.CENTER_VERTICAL);
                        row.setPadding(0, (int) dpToPx(context, 6f), 0, (int) dpToPx(context, 6f));

                        // 1. Badges column
                        LinearLayout badgeCol = new LinearLayout(context);
                        badgeCol.setOrientation(LinearLayout.HORIZONTAL);
                        badgeCol.setGravity(Gravity.CENTER_VERTICAL);
                        badgeCol.setLayoutParams(new LinearLayout.LayoutParams(
                                (int) dpToPx(context, 114f),
                                ViewGroup.LayoutParams.WRAP_CONTENT
                        ));

                        if (group.isOtherSummary) {
                            TextView badge = new TextView(context);
                            badge.setText(sk ? "OSTATNÉ" : "OSTATNÍ");
                            badge.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f);
                            badge.setTypeface(Typeface.DEFAULT_BOLD);
                            badge.setGravity(Gravity.CENTER);
                            badge.setTextColor(dark ? Color.parseColor("#F3F4F6") : Color.parseColor("#374151"));

                            GradientDrawable bg = new GradientDrawable();
                            bg.setShape(GradientDrawable.RECTANGLE);
                            bg.setCornerRadius(dpToPx(context, 4f));
                            bg.setColor(dark ? Color.parseColor("#333333") : Color.parseColor("#E5E7EB"));
                            badge.setBackground(bg);

                            LinearLayout.LayoutParams bLp = new LinearLayout.LayoutParams(
                                    (int) dpToPx(context, 76f),
                                    (int) dpToPx(context, 26f)
                            );
                            badgeCol.addView(badge, bLp);
                        } else if (group.items.size() == 1) {
                            BenefitPriceData.TierResult tr = group.items.get(0);
                            TextView badge = new TextView(context);
                            badge.setText(tr.tier.displayName);
                            badge.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
                            badge.setTypeface(Typeface.DEFAULT_BOLD);
                            badge.setGravity(Gravity.CENTER);
                            badge.setTextColor(tr.tier.getTextColor(dark));

                            GradientDrawable bg = new GradientDrawable();
                            bg.setShape(GradientDrawable.RECTANGLE);
                            bg.setCornerRadius(dpToPx(context, 4f));
                            bg.setColor(tr.tier.getBgColor(dark));
                            badge.setBackground(bg);

                            LinearLayout.LayoutParams bLp = new LinearLayout.LayoutParams(
                                    (int) dpToPx(context, 70f),
                                    (int) dpToPx(context, 26f)
                            );
                            badgeCol.addView(badge, bLp);
                        } else {
                            // Multiple tiers side by side with 4dp gap
                            for (int i = 0; i < group.items.size(); i++) {
                                BenefitPriceData.TierResult tr = group.items.get(i);
                                TextView badge = new TextView(context);
                                badge.setText(tr.tier.displayName);
                                badge.setTextSize(TypedValue.COMPLEX_UNIT_SP, 10.5f);
                                badge.setTypeface(Typeface.DEFAULT_BOLD);
                                badge.setGravity(Gravity.CENTER);
                                badge.setTextColor(tr.tier.getTextColor(dark));

                                GradientDrawable bg = new GradientDrawable();
                                bg.setShape(GradientDrawable.RECTANGLE);
                                bg.setCornerRadius(dpToPx(context, 4f));
                                bg.setColor(tr.tier.getBgColor(dark));
                                badge.setBackground(bg);

                                LinearLayout.LayoutParams bLp = new LinearLayout.LayoutParams(
                                        (int) dpToPx(context, 52f),
                                        (int) dpToPx(context, 24f)
                                );
                                if (i > 0) {
                                    bLp.setMargins((int) dpToPx(context, 4f), 0, 0, 0);
                                }
                                badgeCol.addView(badge, bLp);
                            }
                        }
                        row.addView(badgeCol);

                        // 2. Price + Promo column
                        LinearLayout priceCol = new LinearLayout(context);
                        priceCol.setOrientation(LinearLayout.VERTICAL);
                        priceCol.setPadding((int) dpToPx(context, 10f), 0, 0, 0);
                        LinearLayout.LayoutParams priceColLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f);
                        priceCol.setLayoutParams(priceColLp);

                        TextView priceText = new TextView(context);
                        priceText.setText(group.getFinalPriceFormatted());
                        priceText.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15.5f);
                        priceText.setTypeface(Typeface.DEFAULT_BOLD);
                        priceText.setTextColor(priceColor);
                        priceCol.addView(priceText);

                        BenefitPriceData.PromoItem promo = group.getSelectedPromo();
                        if (promo != null) {
                            TextView promoText = new TextView(context);
                            String label = "";
                            switch (promo.promoType) {
                                case ALZA_PLUS:
                                    label = "★ S AlzaPlus+";
                                    promoText.setTextColor(Color.parseColor("#2563EB"));
                                    break;
                                case COUPON:
                                    String code = promo.discountCouponCode;
                                    label = "🏷 " + (code != null ? code : (sk ? "Kupón" : "Kupón"));
                                    promoText.setTextColor(greenColor);
                                    break;
                                case CASHBACK:
                                    label = "💰 Cashback";
                                    promoText.setTextColor(Color.parseColor("#F59E0B"));
                                    break;
                                case TRADE_IN:
                                    label = sk ? "🔄 Výkupný bonus" : "🔄 Výkupní bonus";
                                    promoText.setTextColor(Color.parseColor("#8B5CF6"));
                                    break;
                                default:
                                    label = promo.name != null ? promo.name : "";
                                    promoText.setTextColor(textMuted);
                                    break;
                            }
                            promoText.setText(label);
                            promoText.setTextSize(TypedValue.COMPLEX_UNIT_SP, 10.5f);
                            priceCol.addView(promoText);
                        }
                        row.addView(priceCol);

                        // 3. Discount Pill
                        TextView discountView = new TextView(context);
                        discountView.setGravity(Gravity.CENTER);
                        LinearLayout.LayoutParams discLp = new LinearLayout.LayoutParams(
                                (int) dpToPx(context, 68f),
                                (int) dpToPx(context, 24f)
                        );

                        Double discPct = group.getDiscountPercent();
                        if (discPct != null && discPct >= 0.5) {
                            long rounded = Math.round(discPct);
                            discountView.setText("−" + rounded + " %");
                            discountView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11.5f);
                            discountView.setTypeface(Typeface.DEFAULT_BOLD);
                            discountView.setTextColor(Color.WHITE);

                            GradientDrawable discBg = new GradientDrawable();
                            discBg.setShape(GradientDrawable.RECTANGLE);
                            discBg.setColor(greenColor);
                            discBg.setCornerRadius(dpToPx(context, 4f));
                            discountView.setBackground(discBg);
                        } else {
                            discountView.setText("—");
                            discountView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
                            discountView.setTextColor(textMuted);
                        }
                        row.addView(discountView, discLp);

                        contentContainer.addView(row);
                    }

                    // Optional Original Price footer
                    if (highestComparePrice != null && highestComparePrice > 0) {
                        TextView compareView = new TextView(context);
                        String compFormatted = currentData[0].formatPrice(highestComparePrice);
                        compareView.setText((sk ? "Pôvodná cena: " : "Původní cena: ") + compFormatted);
                        compareView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11.5f);
                        compareView.setTextColor(textMuted);
                        compareView.setPaintFlags(compareView.getPaintFlags() | Paint.STRIKE_THRU_TEXT_FLAG);
                        compareView.setPadding(0, (int) dpToPx(context, 6f), 0, (int) dpToPx(context, 2f));
                        contentContainer.addView(compareView);
                    }
                }

                // Quick Filter Chips section (only if at least one promo is available at product)
                boolean hasAnyPromoFilter = currentData[0].hasAlzaPlusPromo() ||
                                            currentData[0].hasCashbackPromo() ||
                                            currentData[0].hasTradeInPromo();

                if (hasAnyPromoFilter) {
                    addDivider(contentContainer, context, borderColor, 8f);

                    HorizontalScrollView chipScroll = new HorizontalScrollView(context);
                    chipScroll.setHorizontalScrollBarEnabled(false);
                    LinearLayout chipRow = new LinearLayout(context);
                    chipRow.setOrientation(LinearLayout.HORIZONTAL);
                    chipRow.setPadding(0, 0, 0, (int) dpToPx(context, 8f));

                    if (currentData[0].hasAlzaPlusPromo()) {
                        chipRow.addView(createFilterChip(
                                context,
                                enablePlus ? "✓ AlzaPlus+" : "+ AlzaPlus+",
                                enablePlus,
                                dark,
                                new View.OnClickListener() {
                                    @Override
                                    public void onClick(View v) {
                                        AlzaPriceChartInjector.setAlzaPlusPromosEnabled(!AlzaPriceChartInjector.isAlzaPlusPromosEnabled());
                                        if (renderTable[0] != null) renderTable[0].run();
                                    }
                                }
                        ));
                    }

                    if (currentData[0].hasCashbackPromo()) {
                        chipRow.addView(createFilterChip(
                                context,
                                enableCashback ? "✓ Cashback" : "+ Cashback",
                                enableCashback,
                                dark,
                                new View.OnClickListener() {
                                    @Override
                                    public void onClick(View v) {
                                        AlzaPriceChartInjector.setCashbackPromosEnabled(!AlzaPriceChartInjector.isCashbackPromosEnabled());
                                        if (renderTable[0] != null) renderTable[0].run();
                                    }
                                }
                        ));
                    }

                    if (currentData[0].hasTradeInPromo()) {
                        chipRow.addView(createFilterChip(
                                context,
                                enableTradeIn ? (sk ? "✓ Výkup" : "✓ Výkup") : (sk ? "+ Výkup" : "+ Výkup"),
                                enableTradeIn,
                                dark,
                                new View.OnClickListener() {
                                    @Override
                                    public void onClick(View v) {
                                        AlzaPriceChartInjector.setTradeInPromosEnabled(!AlzaPriceChartInjector.isTradeInPromosEnabled());
                                        if (renderTable[0] != null) renderTable[0].run();
                                    }
                                }
                        ));
                    }

                    chipScroll.addView(chipRow);
                    contentContainer.addView(chipScroll);
                }

                // Bottom Action Buttons: "Kopírovat nabídku" & "Kopírovat odkaz"
                LinearLayout btnRow = new LinearLayout(context);
                btnRow.setOrientation(LinearLayout.HORIZONTAL);
                btnRow.setWeightSum(2.0f);
                LinearLayout.LayoutParams btnRowLp = new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        (int) dpToPx(context, 38f)
                );
                btnRowLp.setMargins(0, (int) dpToPx(context, 10f), 0, 0);
                btnRow.setLayoutParams(btnRowLp);

                // Button 1: Kopírovat nabídku
                TextView copyOfferBtn = new TextView(context);
                copyOfferBtn.setText(sk ? "Kopírovať ponuku" : "Kopírovat nabídku");
                copyOfferBtn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
                copyOfferBtn.setTypeface(Typeface.DEFAULT_BOLD);
                copyOfferBtn.setTextColor(Color.WHITE);
                copyOfferBtn.setGravity(Gravity.CENTER);

                GradientDrawable copyOfferBg = new GradientDrawable();
                copyOfferBg.setShape(GradientDrawable.RECTANGLE);
                copyOfferBg.setColor(greenColor);
                copyOfferBg.setCornerRadius(dpToPx(context, 8f));
                copyOfferBtn.setBackground(copyOfferBg);

                LinearLayout.LayoutParams offerLp = new LinearLayout.LayoutParams(
                        0, ViewGroup.LayoutParams.MATCH_PARENT, 1.0f
                );
                offerLp.rightMargin = (int) dpToPx(context, 4f);
                copyOfferBtn.setLayoutParams(offerLp);

                copyOfferBtn.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        copyOfferToClipboard(context, effectiveCommodityId, effectiveProductName, currentData[0], sk);
                    }
                });
                btnRow.addView(copyOfferBtn);

                // Button 2: Kopírovat odkaz
                TextView copyLinkBtn = new TextView(context);
                boolean fx = AlzaPriceChartInjector.isFxAlzaLinksEnabled();
                copyLinkBtn.setText(fx ? "FxAlza odkaz" : (sk ? "Kopírovať odkaz" : "Kopírovat odkaz"));
                copyLinkBtn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
                copyLinkBtn.setTypeface(Typeface.DEFAULT_BOLD);
                copyLinkBtn.setTextColor(Color.WHITE);
                copyLinkBtn.setGravity(Gravity.CENTER);

                GradientDrawable copyLinkBg = new GradientDrawable();
                copyLinkBg.setShape(GradientDrawable.RECTANGLE);
                copyLinkBg.setColor(fx ? Color.parseColor("#5865F2") : (dark ? Color.parseColor("#374151") : Color.parseColor("#4B5563")));
                copyLinkBg.setCornerRadius(dpToPx(context, 8f));
                copyLinkBtn.setBackground(copyLinkBg);

                LinearLayout.LayoutParams linkLp = new LinearLayout.LayoutParams(
                        0, ViewGroup.LayoutParams.MATCH_PARENT, 1.0f
                );
                linkLp.leftMargin = (int) dpToPx(context, 4f);
                copyLinkBtn.setLayoutParams(linkLp);

                copyLinkBtn.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        copyLinkOnlyToClipboard(context, effectiveCommodityId, sk);
                    }
                });
                btnRow.addView(copyLinkBtn);

                contentContainer.addView(btnRow);
            }
        };

        if (initialData != null) {
            renderTable[0].run();
        } else {
            String country = sk ? "SK" : "CZ";
            AlzaBenefitPricesClient.getInstance().fetchBenefitPrices(effectiveCommodityId, country, new AlzaBenefitPricesClient.Callback() {
                @Override
                public void onSuccess(BenefitPriceData data) {
                    currentData[0] = data;
                    if (renderTable[0] != null) renderTable[0].run();
                }

                @Override
                public void onError(Throwable throwable) {
                    loadingText.setText(sk ? "Chyba načítania cenníkov" : "Chyba načtení ceníků");
                }
            });
        }

        dialog.show();
    }

    private static View createFilterChip(
            Context context,
            String label,
            boolean active,
            boolean dark,
            View.OnClickListener clickListener
    ) {
        TextView chip = new TextView(context);
        chip.setText(label);
        chip.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f);
        chip.setTypeface(Typeface.DEFAULT_BOLD);
        chip.setGravity(Gravity.CENTER);
        chip.setPadding((int) dpToPx(context, 10f), (int) dpToPx(context, 5f), (int) dpToPx(context, 10f), (int) dpToPx(context, 5f));

        int activeBg = dark ? Color.parseColor("#1A00A651") : Color.parseColor("#E6F6EE");
        int activeText = Color.parseColor("#00A651");
        int inactiveBg = dark ? Color.parseColor("#2A2A2A") : Color.parseColor("#F3F4F6");
        int inactiveText = dark ? Color.parseColor("#9CA3AF") : Color.parseColor("#4B5563");

        GradientDrawable bg = new GradientDrawable();
        bg.setShape(GradientDrawable.RECTANGLE);
        bg.setCornerRadius(dpToPx(context, 12f));
        bg.setColor(active ? activeBg : inactiveBg);
        if (active) {
            bg.setStroke((int) dpToPx(context, 1f), activeText);
        }
        chip.setBackground(bg);
        chip.setTextColor(active ? activeText : inactiveText);

        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        lp.setMargins(0, 0, (int) dpToPx(context, 6f), 0);
        chip.setLayoutParams(lp);

        chip.setOnClickListener(clickListener);
        return chip;
    }

    private static void copyOfferToClipboard(
            Context context,
            String commodityId,
            String productName,
            BenefitPriceData data,
            boolean sk
    ) {
        if (data == null) return;
        StringBuilder sb = new StringBuilder();
        if (productName != null && !productName.isEmpty()) {
            sb.append(productName).append("\n");
        }

        if (data.areAllPricesEqual()) {
            BenefitPriceData.TierResult sample = data.getAllTiers().values().iterator().next();
            sb.append("• ").append(sk ? "Všetky cenníky: " : "Všechny ceníky: ").append(sample.finalPriceFormatted);
            if (sample.discountPercent != null && sample.discountPercent >= 0.5) {
                sb.append(" (−").append(Math.round(sample.discountPercent)).append(" %)");
            }
            sb.append("\n");
        } else {
            for (BenefitPriceData.TierGroup group : data.getGroupedDisplayRows()) {
                sb.append("• ");
                if (group.isOtherSummary) {
                    sb.append(sk ? "OSTATNÉ: " : "OSTATNÍ: ");
                } else {
                    StringBuilder names = new StringBuilder();
                    for (int i = 0; i < group.items.size(); i++) {
                        if (i > 0) names.append(", ");
                        names.append(group.items.get(i).tier.displayName);
                    }
                    sb.append(names).append(": ");
                }
                sb.append(group.getFinalPriceFormatted());
                if (group.getDiscountPercent() != null && group.getDiscountPercent() >= 0.5) {
                    sb.append(" (−").append(Math.round(group.getDiscountPercent())).append(" %)");
                }
                BenefitPriceData.PromoItem promo = group.getSelectedPromo();
                if (promo != null) {
                    if (promo.promoType == BenefitPriceData.PromoType.ALZA_PLUS) {
                        sb.append(" [AlzaPlus+]");
                    } else if (promo.discountCouponCode != null) {
                        sb.append(" [Kód: ").append(promo.discountCouponCode).append("]");
                    } else if (promo.promoType == BenefitPriceData.PromoType.CASHBACK) {
                        sb.append(" [Cashback]");
                    } else if (promo.promoType == BenefitPriceData.PromoType.TRADE_IN) {
                        sb.append(" [Výkup]");
                    }
                }
                sb.append("\n");
            }
        }

        String linkUrl = "https://" + (sk ? "www.alza.sk" : "www.alza.cz") + "/a-d" + commodityId + ".htm";
        if (AlzaPriceChartInjector.isFxAlzaLinksEnabled()) {
            linkUrl = AlzaPriceChartInjector.rewriteUrlToFxAlzaIfEnabled(linkUrl);
        }
        sb.append(linkUrl);

        try {
            ClipboardManager cm = (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
            if (cm != null) {
                cm.setPrimaryClip(ClipData.newPlainText("Alza Benefit Prices", sb.toString()));
                Toast.makeText(context, sk ? "Skopírované do schránky" : "Zkopírováno do schránky", Toast.LENGTH_SHORT).show();
            }
        } catch (Throwable t) {
            Toast.makeText(context, "Chyba kopírování: " + t.getMessage(), Toast.LENGTH_SHORT).show();
        }
    }

    private static void copyLinkOnlyToClipboard(
            Context context,
            String commodityId,
            boolean sk
    ) {
        String linkUrl = "https://" + (sk ? "www.alza.sk" : "www.alza.cz") + "/a-d" + commodityId + ".htm";
        if (AlzaPriceChartInjector.isFxAlzaLinksEnabled()) {
            linkUrl = AlzaPriceChartInjector.rewriteUrlToFxAlzaIfEnabled(linkUrl);
        }
        try {
            ClipboardManager cm = (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
            if (cm != null) {
                cm.setPrimaryClip(ClipData.newPlainText("Alza Link", linkUrl));
                String label = AlzaPriceChartInjector.isFxAlzaLinksEnabled()
                        ? (sk ? "FxAlza odkaz skopírovaný do schránky" : "FxAlza odkaz zkopírován do schránky")
                        : (sk ? "Odkaz skopírovaný do schránky" : "Odkaz zkopírován do schránky");
                Toast.makeText(context, label, Toast.LENGTH_SHORT).show();
            }
        } catch (Throwable t) {
            Toast.makeText(context, "Chyba: " + t.getMessage(), Toast.LENGTH_SHORT).show();
        }
    }

    private static void addDivider(ViewGroup parent, Context context, int color, float verticalMarginDp) {
        View divider = new View(context);
        divider.setBackgroundColor(color);
        LinearLayout.LayoutParams divLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
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
