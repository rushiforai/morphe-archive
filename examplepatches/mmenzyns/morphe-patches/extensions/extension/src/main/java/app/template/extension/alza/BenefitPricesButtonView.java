package app.template.extension.alza;

import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.util.AttributeSet;
import android.util.Log;
import android.util.TypedValue;
import android.view.MotionEvent;
import android.view.View;

/**
 * Compact native-styled button card in product detail screen that opens Alza Benefit Prices dialog.
 */
public class BenefitPricesButtonView extends View {
    private static final String TAG = "BenefitButtonView";

    private String commodityId;
    private String productName;
    private BenefitPriceData data;

    private Paint cardBgPaint;
    private Paint cardBorderPaint;
    private Paint dotGoldPaint;
    private Paint dotIsicPaint;
    private Paint dotB2bPaint;
    private Paint textTitlePaint;
    private Paint textPricePaint;
    private Paint textChevronPaint;

    private RectF cardRect = new RectF();

    public BenefitPricesButtonView(Context context) {
        super(context);
        init();
    }

    public BenefitPricesButtonView(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    private void init() {
        cardBgPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        cardBorderPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        cardBorderPaint.setStyle(Paint.Style.STROKE);
        cardBorderPaint.setStrokeWidth(dpToPx(1f));

        dotGoldPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        dotGoldPaint.setStyle(Paint.Style.FILL);
        dotGoldPaint.setColor(Color.parseColor("#FFD500"));

        dotIsicPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        dotIsicPaint.setStyle(Paint.Style.FILL);
        dotIsicPaint.setColor(Color.parseColor("#3CBA9C"));

        dotB2bPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        dotB2bPaint.setStyle(Paint.Style.FILL);
        dotB2bPaint.setColor(Color.parseColor("#3A349F"));

        textTitlePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        textTitlePaint.setTextSize(dpToPx(12f));
        textTitlePaint.setTypeface(Typeface.DEFAULT_BOLD);

        textPricePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        textPricePaint.setTextSize(dpToPx(11.5f));
        textPricePaint.setTypeface(Typeface.DEFAULT_BOLD);
        textPricePaint.setColor(Color.parseColor("#00A651"));

        textChevronPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        textChevronPaint.setTextSize(dpToPx(13.5f));
        textChevronPaint.setTypeface(Typeface.DEFAULT_BOLD);
        textChevronPaint.setColor(Color.parseColor("#8E8E93"));
    }

    public void setCommodityId(String commodityId, String productName) {
        if (commodityId == null || commodityId.isEmpty() || commodityId.equals("0")) return;
        boolean changed = !commodityId.equals(this.commodityId);
        this.commodityId = commodityId;
        if (productName != null) {
            this.productName = productName;
        }

        if (changed || this.data == null) {
            this.data = null;
            invalidate();
            fetchData();
        }
    }

    public void setData(BenefitPriceData data) {
        this.data = data;
        invalidate();
        postInvalidate();
    }

    private void fetchData() {
        if (commodityId == null || commodityId.isEmpty()) return;
        boolean sk = AlzaPriceChartInjector.isSlovak(getContext());
        String country = sk ? "SK" : "CZ";
        final String targetId = commodityId;

        AlzaBenefitPricesClient.getInstance().fetchBenefitPrices(commodityId, country, new AlzaBenefitPricesClient.Callback() {
            @Override
            public void onSuccess(BenefitPriceData fetched) {
                if (!targetId.equals(commodityId)) return;
                data = fetched;
                postInvalidate();
            }

            @Override
            public void onError(Throwable throwable) {
                Log.w(TAG, "fetchData onError for " + targetId + ": " + throwable.getMessage());
            }
        });
    }

    @Override
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int widthSize = MeasureSpec.getSize(widthMeasureSpec);
        int screenWidth;
        try {
            screenWidth = getResources().getDisplayMetrics().widthPixels;
        } catch (Throwable ignored) {
            screenWidth = 1080;
        }

        // Width in FlowRow: full row container width (spanning aligned with 16dp outer screen margin)
        int containerW = (widthSize > 0 && widthSize <= screenWidth) ? widthSize : (screenWidth - (int) dpToPx(32f));
        int targetHeight = (int) dpToPx(36f);

        setMeasuredDimension(containerW, targetHeight);
    }

    @Override
    public boolean performClick() {
        super.performClick();
        String currentId = AlzaPriceChartInjector.getActiveCommodityId();
        if (currentId == null || currentId.isEmpty()) {
            currentId = this.commodityId;
        }
        String currentName = AlzaPriceChartInjector.getActiveProductName();
        if (currentName == null || currentName.isEmpty()) {
            currentName = this.productName;
        }
        BenefitPricesDialog.show(getContext(), currentId, currentName, data);
        return true;
    }

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        if (event.getAction() == MotionEvent.ACTION_UP) {
            performClick();
            return true;
        }
        return true;
    }

    private boolean isDarkMode() {
        int nightMode = getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;
        return nightMode == Configuration.UI_MODE_NIGHT_YES;
    }

    private float dpToPx(float dp) {
        return TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP,
                dp,
                getResources().getDisplayMetrics()
        );
    }

    @Override
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);

        boolean dark = isDarkMode();
        boolean sk = AlzaPriceChartInjector.isSlovak(getContext());
        int width = getWidth();
        int height = getHeight();

        int bgColor = dark ? Color.parseColor("#1E1E1E") : Color.parseColor("#F7F7F8");
        int borderColor = dark ? Color.parseColor("#333333") : Color.parseColor("#E5E5EA");
        int textTitleColor = dark ? Color.parseColor("#F3F4F6") : Color.parseColor("#111827");

        cardBgPaint.setColor(bgColor);
        cardBorderPaint.setColor(borderColor);
        textTitlePaint.setColor(textTitleColor);

        float inset = dpToPx(1f);
        cardRect.set(inset, inset, width - inset, height - inset);
        float radius = dpToPx(8f);
        canvas.drawRoundRect(cardRect, radius, radius, cardBgPaint);
        canvas.drawRoundRect(cardRect, radius, radius, cardBorderPaint);

        float centerY = height / 2f;

        // 1. Left colored dots (Gold, ISIC, B2B)
        float dotRadius = dpToPx(3.2f);
        float dotX = cardRect.left + dpToPx(10f);

        canvas.drawCircle(dotX, centerY, dotRadius, dotGoldPaint);
        dotX += dotRadius * 2f + dpToPx(3.5f);
        canvas.drawCircle(dotX, centerY, dotRadius, dotIsicPaint);
        dotX += dotRadius * 2f + dpToPx(3.5f);
        canvas.drawCircle(dotX, centerY, dotRadius, dotB2bPaint);

        // 2. Title Text
        float textX = dotX + dotRadius + dpToPx(8f);
        String title = sk ? "Cenníky Alzy (Gold, ISIC, B2B…)" : "Ceníky Alzy (Gold, ISIC, B2B…)";
        float textY = centerY - ((textTitlePaint.descent() + textTitlePaint.ascent()) / 2f);
        canvas.drawText(title, textX, textY, textTitlePaint);

        // 3. Right side: lowest price snippet + chevron
        float rightX = cardRect.right - dpToPx(10f);
        String chevron = "›";
        float chevronY = centerY - ((textChevronPaint.descent() + textChevronPaint.ascent()) / 2f);
        float chevronW = textChevronPaint.measureText(chevron);
        canvas.drawText(chevron, rightX - chevronW, chevronY, textChevronPaint);

        float snippetRight = rightX - chevronW - dpToPx(6f);
        if (data != null && data.getLowestPrice() > 0) {
            String snippet;
            int snippetColor;

            if (!data.isAnyTierCheaperThanBasic()) {
                snippet = sk ? "Rovnaká cena" : "Stejná cena";
                snippetColor = Color.parseColor("#8E8E93");
            } else {
                BenefitPriceData.TierType tier = data.getLowestPriceTier();
                String tierName = (tier != null) ? tier.displayName : "od";
                snippet = tierName + ": " + data.formatPrice(data.getLowestPrice());
                snippetColor = Color.parseColor("#00A651");
            }

            textPricePaint.setColor(snippetColor);
            float snippetW = textPricePaint.measureText(snippet);
            float snippetY = centerY - ((textPricePaint.descent() + textPricePaint.ascent()) / 2f);
            if (snippetRight - snippetW > textX + textTitlePaint.measureText(title) + dpToPx(8f)) {
                canvas.drawText(snippet, snippetRight - snippetW, snippetY, textPricePaint);
            }
        }
    }
}

