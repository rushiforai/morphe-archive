package app.template.extension.alza;

import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.DashPathEffect;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.Shader;
import android.net.Uri;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.MotionEvent;
import android.view.View;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

public class PriceHistoryChartView extends View {
    public enum State {
        LOADING,
        LOADED,
        EMPTY,
        ERROR,
        UNSUPPORTED_COUNTRY
    }

    private State state = State.EMPTY;
    private PriceHistoryData data;
    private String commodityId;
    private boolean isCollapsed = false;

    // Paints
    private Paint cardBgPaint;
    private Paint cardBorderPaint;
    private Paint gridLinePaint;
    private Paint titlePaint;
    private Paint subtitlePaint;
    private Paint labelPaint;
    private Paint discountLabelPaint;
    private Paint discountValuePaint;
    private Paint currentCurvePaint;
    private Paint currentAreaPaint;
    private Paint originalCurvePaint;
    private Paint toggleTextPaint;
    private Paint dotBgPaint;
    private Paint dotFgPaint;

    private Path currentCurvePath = new Path();
    private Path currentAreaPath = new Path();
    private Path originalCurvePath = new Path();
    private RectF cardRect = new RectF();

    private float lastGradTop = -1f;
    private float lastGradBottom = -1f;
    private boolean lastGradCompact = false;
    private LinearGradient cachedGradient = null;

    private final SimpleDateFormat dateFormat = new SimpleDateFormat("MM/yy", Locale.getDefault());
    private final DecimalFormat priceFormat;
    private final DecimalFormat euroFormat;
    private final DecimalFormat euroFormatRound;

    private float paddingPx;
    private float cornerRadiusPx;

    public PriceHistoryChartView(Context context) {
        super(context);
        priceFormat = initPriceFormat(0);
        euroFormat = initPriceFormat(1);
        euroFormatRound = initPriceFormat(2);
        init();
    }

    public PriceHistoryChartView(Context context, AttributeSet attrs) {
        super(context, attrs);
        priceFormat = initPriceFormat(0);
        euroFormat = initPriceFormat(1);
        euroFormatRound = initPriceFormat(2);
        init();
    }

    private DecimalFormat initPriceFormat(int type) {
        DecimalFormatSymbols symbols = new DecimalFormatSymbols(Locale.getDefault());
        symbols.setGroupingSeparator(' ');
        symbols.setDecimalSeparator(',');
        if (type == 1) {
            return new DecimalFormat("#,##0.00", symbols);
        } else if (type == 2) {
            return new DecimalFormat("#,##0", symbols);
        }
        return new DecimalFormat("#,###", symbols);
    }

    private void init() {
        paddingPx = dpToPx(12f);
        cornerRadiusPx = dpToPx(12f);

        cardBgPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        cardBorderPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        cardBorderPaint.setStyle(Paint.Style.STROKE);
        cardBorderPaint.setStrokeWidth(dpToPx(1f));

        gridLinePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        gridLinePaint.setStyle(Paint.Style.STROKE);
        gridLinePaint.setStrokeWidth(dpToPx(1f));

        titlePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        titlePaint.setTextSize(dpToPx(12.5f));
        titlePaint.setFakeBoldText(true);

        subtitlePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        subtitlePaint.setTextSize(dpToPx(10f));

        labelPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        labelPaint.setTextSize(dpToPx(9.5f));

        discountLabelPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        discountLabelPaint.setTextSize(dpToPx(12f));

        discountValuePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        discountValuePaint.setTextSize(dpToPx(13.5f));
        discountValuePaint.setFakeBoldText(true);

        toggleTextPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        toggleTextPaint.setTextSize(dpToPx(11f));
        toggleTextPaint.setFakeBoldText(true);

        currentCurvePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        currentCurvePaint.setStyle(Paint.Style.STROKE);
        currentCurvePaint.setStrokeWidth(dpToPx(2.5f));
        currentCurvePaint.setColor(Color.parseColor("#00A651")); // Hlídač shopů green

        currentAreaPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        currentAreaPaint.setStyle(Paint.Style.FILL);

        originalCurvePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        originalCurvePaint.setStyle(Paint.Style.STROKE);
        originalCurvePaint.setStrokeWidth(dpToPx(1.5f));
        originalCurvePaint.setColor(Color.parseColor("#EF4444")); // Red strikethrough price
        originalCurvePaint.setPathEffect(new DashPathEffect(new float[]{dpToPx(4f), dpToPx(4f)}, 0));

        dotBgPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        dotBgPaint.setStyle(Paint.Style.FILL);

        dotFgPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        dotFgPaint.setStyle(Paint.Style.FILL);
    }

    public void setCommodityId(String commodityId) {
        this.commodityId = commodityId;
    }

    public String getCommodityId() {
        return commodityId;
    }

    public void setData(PriceHistoryData data) {
        this.data = data;
        if (data != null && data.hasData()) {
            this.state = State.LOADED;
            if (data.getCommodityId() != null) {
                this.commodityId = data.getCommodityId();
            }
        } else {
            this.state = State.EMPTY;
        }
        invalidate();
        postInvalidate();
    }

    public PriceHistoryData getData() {
        return data;
    }

    public void setState(State state) {
        this.state = state;
        invalidate();
        postInvalidate();
    }

    public State getState() {
        return state;
    }

    public void setCollapsed(boolean collapsed) {
        if (this.isCollapsed != collapsed) {
            this.isCollapsed = collapsed;
            requestLayout();
            invalidate();
        }
    }

    public boolean isCollapsed() {
        return isCollapsed;
    }

    @Override
    public boolean performClick() {
        super.performClick();
        return true;
    }

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        if (event.getAction() == MotionEvent.ACTION_UP) {
            performClick();
            if (AlzaPriceChartInjector.isCompactMode()) {
                openHlidacWeb();
                return true;
            }
            float x = event.getX();
            float y = event.getY();
            int width = getWidth();

            // Rightmost header toggle ("▼ Sbalit" / "▲ Graf")
            float toggleLeft = width - paddingPx - dpToPx(50f);

            if (isCollapsed) {
                // Tapping collapsed bar expands it
                isCollapsed = false;
                requestLayout();
                invalidate();
                return true;
            } else {
                // When expanded:
                if (y <= dpToPx(42f)) {
                    if (x >= toggleLeft) {
                        isCollapsed = true;
                        requestLayout();
                        invalidate();
                        return true;
                    }
                    openHlidacWeb();
                    return true;
                }
                // Tapping chart plot area opens web
                openHlidacWeb();
                return true;
            }
        }
        return true;
    }

    private void openHlidacWeb() {
        if (commodityId == null || commodityId.isEmpty()) return;
        try {
            String domain = AlzaPriceChartInjector.getDetectedDomain();
            if (domain == null || domain.isEmpty()) domain = "alza.cz";
            String url = "https://www.hlidacshopu.cz/app/?url=https://www." + domain + "/a-d" + commodityId + ".htm";
            Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            getContext().startActivity(intent);
        } catch (Throwable ignored) {
        }
    }

    @Override
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        boolean compact = AlzaPriceChartInjector.isCompactMode();
        int width;
        int targetHeight;

        int widthMode = MeasureSpec.getMode(widthMeasureSpec);
        int widthSize = MeasureSpec.getSize(widthMeasureSpec);
        int heightMode = MeasureSpec.getMode(heightMeasureSpec);
        int heightSize = MeasureSpec.getSize(heightMeasureSpec);

        int screenWidth;
        try {
            screenWidth = getResources().getDisplayMetrics().widthPixels;
        } catch (Throwable ignored) {
            screenWidth = 1080;
        }
        float density = getResources().getDisplayMetrics().density;
        if (density <= 0f) density = 1f;

        if (compact) {
            // Container width available to the FlowRow layout (in dp)
            float containerWidthDp = (widthSize > 0 && widthSize <= screenWidth) ? (widthSize / density) : (screenWidth / density - 32f);

            // Responsive width:
            // FlowRow contains the price block (~35-42% of row) + 20dp gap (~5%).
            // Taking ~57% of container width (up to 220dp) allows the card
            // to expand and fill the unused space on the right without wrapping.
            float targetWidthDp = Math.max(160f, Math.min(220f, containerWidthDp * 0.57f));
            width = (int) dpToPx(targetWidthDp);

            // Responsive height:
            // Proportional to width using card ratio (~2.0:1),
            // giving a sleek, balanced card that matches the price block height.
            float targetHeightDp = Math.max(85f, Math.min(120f, targetWidthDp * 0.50f));
            targetHeight = (int) dpToPx(targetHeightDp);

            if (heightMode == MeasureSpec.EXACTLY && heightSize > 0) {
                targetHeight = heightSize;
            }
        } else {
            width = widthSize > 0 ? widthSize : screenWidth;
            int expandedHeightDp = (int) Math.max(170f, Math.min(230f, (width / density) * 0.52f));
            targetHeight = isCollapsed ? (int) dpToPx(38f) : (int) dpToPx(expandedHeightDp);
            if (heightMode == MeasureSpec.EXACTLY && heightSize > 0) {
                targetHeight = heightSize;
            }
        }
        setMeasuredDimension(width, targetHeight);
    }

    private boolean isDarkMode() {
        int nightMode = getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;
        return nightMode == Configuration.UI_MODE_NIGHT_YES;
    }

    private String formatPrice(double price) {
        String currency = AlzaPriceChartInjector.getDetectedCurrency();
        if ("€".equals(currency)) {
            if (price == Math.floor(price)) {
                return euroFormatRound.format(price) + " €";
            }
            return euroFormat.format(price) + " €";
        }
        return priceFormat.format(price) + " " + currency;
    }

    @Override
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);

        boolean dark = isDarkMode();
        int width = getWidth();
        int height = getHeight();

        // Theme colors
        int bgColor = dark ? Color.parseColor("#181824") : Color.parseColor("#FFFFFF");
        int borderColor = dark ? Color.parseColor("#2E2E3E") : Color.parseColor("#E5E7EB");
        int textNormalColor = dark ? Color.parseColor("#E5E7EB") : Color.parseColor("#1F2937");
        int subtitleColor = dark ? Color.parseColor("#9CA3AF") : Color.parseColor("#6B7280");
        int gridColor = dark ? Color.parseColor("#252538") : Color.parseColor("#F3F4F6");
        int labelColor = dark ? Color.parseColor("#9CA3AF") : Color.parseColor("#6B7280");
        int toggleColor = dark ? Color.parseColor("#00A651") : Color.parseColor("#008A43");

        cardBgPaint.setColor(bgColor);
        cardBorderPaint.setColor(borderColor);
        gridLinePaint.setColor(gridColor);
        titlePaint.setColor(textNormalColor);
        subtitlePaint.setColor(subtitleColor);
        labelPaint.setColor(labelColor);
        discountLabelPaint.setColor(textNormalColor);
        toggleTextPaint.setColor(toggleColor);

        // Draw card background & border
        float inset = AlzaPriceChartInjector.isCompactMode() ? dpToPx(2f) : (paddingPx / 2f);
        float marginLeft = AlzaPriceChartInjector.isCompactMode() ? Math.max(dpToPx(8f), width * 0.045f) : 0f;
        cardRect.set(inset + marginLeft, inset, width - inset, height - inset);
        float radius = Math.max(dpToPx(8f), Math.min(dpToPx(14f), height * 0.10f));
        canvas.drawRoundRect(cardRect, radius, radius, cardBgPaint);
        canvas.drawRoundRect(cardRect, radius, radius, cardBorderPaint);

        if (AlzaPriceChartInjector.isCompactMode()) {
            drawCompactCard(canvas, width, height, dark);
        } else if (isCollapsed) {
            drawCollapsedState(canvas, width, height, dark);
        } else {
            drawExpandedState(canvas, width, height, dark);
        }
    }

    private void drawCompactCard(Canvas canvas, int width, int height, boolean dark) {
        boolean sk = AlzaPriceChartInjector.isSlovak(getContext());

        float cardW = cardRect.width();
        float cardH = cardRect.height();

        // Responsive paddings dynamically derived from card dimensions
        float padH = Math.max(dpToPx(6f), cardW * 0.045f);
        float padV = Math.max(dpToPx(5f), cardH * 0.055f);

        // 1. Header (Logo on left, Real discount on right) - proportional to card height
        float headerHeight = cardH * 0.20f;
        float logoHeight = Math.max(dpToPx(10f), Math.min(dpToPx(15f), headerHeight * 0.65f));
        float logoLeft = cardRect.left + padH;
        float logoTop = cardRect.top + padV + (headerHeight - logoHeight) / 2f;
        HlidacLogo.draw(canvas, logoLeft, logoTop, logoHeight, dark);

        // Header right: Real discount percentage or min price
        if (data != null && data.hasData()) {
            PriceHistoryData.DiscountCalculation calc = data.calculateHlidacShopuDiscount();
            float valTextSize = Math.max(dpToPx(9.5f), Math.min(dpToPx(13.5f), headerHeight * 0.58f));
            float labelTextSize = Math.max(dpToPx(8.5f), Math.min(dpToPx(11.5f), headerHeight * 0.50f));

            discountValuePaint.setTextSize(valTextSize);
            discountLabelPaint.setTextSize(labelTextSize);

            String prefix;
            String badgeText;
            if (calc != null && calc.realDiscountPercent > 0) {
                prefix = sk ? "Skutočná: " : "Skutečná: ";
                badgeText = "-" + Math.round(calc.realDiscountPercent) + " %";
                discountValuePaint.setColor(Color.parseColor("#00A651"));
            } else {
                prefix = sk ? "Skutočná: " : "Skutečná: ";
                badgeText = "0 %";
                discountValuePaint.setColor(Color.parseColor("#9CA3AF"));
            }

            float valW = discountValuePaint.measureText(badgeText);
            float prefW = discountLabelPaint.measureText(prefix);
            float textBaseline = logoTop + logoHeight * 0.88f;

            float rightX = cardRect.right - padH;
            canvas.drawText(badgeText, rightX - valW, textBaseline, discountValuePaint);

            // Only draw prefix if there is enough space between logo and discount value
            float logoRight = logoLeft + HlidacLogo.getScaledWidth(logoHeight);
            if (rightX - valW - prefW > logoRight + dpToPx(6f)) {
                canvas.drawText(prefix, rightX - valW - prefW, textBaseline, discountLabelPaint);
            }
        }

        // 2. Chart Plot Area - occupying the central ~60% of vertical height
        float plotLeft = cardRect.left + padH;
        float plotTop = cardRect.top + padV + headerHeight + dpToPx(2f);
        float plotRight = cardRect.right - padH;
        float plotBottom = cardRect.bottom - Math.max(dpToPx(15f), cardH * 0.18f);

        switch (state) {
            case LOADING:
                subtitlePaint.setTextSize(Math.max(dpToPx(8.5f), cardH * 0.09f));
                drawCenteredText(canvas, sk ? "Načítavam..." : "Načítám...", plotLeft, plotTop, plotRight, plotBottom, subtitlePaint);
                break;
            case EMPTY:
            case UNSUPPORTED_COUNTRY:
                labelPaint.setTextSize(Math.max(dpToPx(8f), cardH * 0.085f));
                drawCenteredText(canvas, sk ? "História nie je k dispozícii" : "Historie není k dispozici", plotLeft, plotTop, plotRight, plotBottom, labelPaint);
                break;
            case ERROR:
                labelPaint.setTextSize(Math.max(dpToPx(8f), cardH * 0.085f));
                drawCenteredText(canvas, sk ? "Chyba načítania" : "Chyba načtení", plotLeft, plotTop, plotRight, plotBottom, labelPaint);
                break;
            case LOADED:
                drawChart(canvas, plotLeft, plotTop, plotRight, plotBottom, true);
                break;
        }
    }

    private void drawCollapsedState(Canvas canvas, int width, int height, boolean dark) {
        float midY = height / 2f;
        boolean sk = AlzaPriceChartInjector.isSlovak(getContext());

        // 1. Hlídač shopů Logo
        float logoHeight = dpToPx(13.5f);
        float logoLeft = paddingPx + dpToPx(4f);
        float logoTop = midY - (logoHeight / 2f);
        HlidacLogo.draw(canvas, logoLeft, logoTop, logoHeight, dark);

        float curX = logoLeft + HlidacLogo.getScaledWidth(logoHeight) + dpToPx(8f);

        // 2. Skutečná sleva
        if (state == State.UNSUPPORTED_COUNTRY) {
            // No warning text inside app
        } else if (data != null) {
            PriceHistoryData.DiscountCalculation calc = data.calculateHlidacShopuDiscount();
            String discountPrefix = sk ? "Skutočná zľava: " : "Skutečná sleva: ";
            String discountText;
            if (calc != null && calc.realDiscountPercent > 0) {
                discountValuePaint.setColor(Color.parseColor("#00A651")); // Green
                discountText = discountPrefix + "-" + Math.round(calc.realDiscountPercent) + " %";
            } else {
                discountValuePaint.setColor(Color.parseColor("#9CA3AF")); // Neutral
                discountText = discountPrefix + "0 %";
            }
            canvas.drawText(discountText, curX, midY + dpToPx(4.5f), discountValuePaint);
        }

        // "▲ Graf" toggle
        float expandX = width - paddingPx - dpToPx(40f);
        canvas.drawText("▲ Graf", expandX, midY + dpToPx(4f), toggleTextPaint);
    }

    private void drawExpandedState(Canvas canvas, int width, int height, boolean dark) {
        boolean compact = AlzaPriceChartInjector.isCompactMode();
        boolean sk = AlzaPriceChartInjector.isSlovak(getContext());

        float headerLeft = paddingPx + dpToPx(4f);
        float headerTop = paddingPx + dpToPx(compact ? 11f : 14f);

        // 1. Hlídač shopů Vector SVG Logo
        float logoHeight = dpToPx(compact ? 13.5f : 16f);
        HlidacLogo.draw(canvas, headerLeft, headerTop - dpToPx(compact ? 10f : 12f), logoHeight, dark);

        // 2. Controls on the right: "▼ Sbalit" / "▼ Zbaliť"
        float toggleX = width - paddingPx - dpToPx(45f);
        canvas.drawText(sk ? "▼ Zbaliť" : "▼ Sbalit", toggleX, headerTop - dpToPx(0.5f), toggleTextPaint);

        // 3. SKUTEČNÁ / SKUTOČNÁ ZĽAVA
        float discountRowY = headerTop + dpToPx(compact ? 13f : 16f);
        if (state == State.UNSUPPORTED_COUNTRY) {
            discountValuePaint.setColor(Color.parseColor("#9CA3AF"));
        } else if (state == State.LOADED && data != null) {
            PriceHistoryData.DiscountCalculation calc = data.calculateHlidacShopuDiscount();

            // "Skutečná sleva: " / "Skutočná zľava: "
            String discountPrefix = sk ? "Skutočná zľava: " : "Skutečná sleva: ";
            discountLabelPaint.setTextSize(dpToPx(compact ? 11f : 12f));
            canvas.drawText(discountPrefix, headerLeft, discountRowY, discountLabelPaint);
            float labelWidth = discountLabelPaint.measureText(discountPrefix);

            // Value: "-XX %" or "0 %"
            String valStr;
            if (calc != null && calc.realDiscountPercent > 0) {
                discountValuePaint.setColor(Color.parseColor("#00A651")); // Green
                valStr = "-" + Math.round(calc.realDiscountPercent) + " %";
            } else {
                boolean fakeDiscount = data.getClaimedDiscount() != null && data.getClaimedDiscount() > 0;
                discountValuePaint.setColor(fakeDiscount ? Color.parseColor("#F59E0B") : Color.parseColor("#9CA3AF"));
                valStr = "0 %";
            }
            discountValuePaint.setTextSize(dpToPx(compact ? 12f : 13.5f));
            canvas.drawText(valStr, headerLeft + labelWidth, discountRowY, discountValuePaint);
        }

        // 4. Plot Area
        float plotLeft = headerLeft;
        float plotTop = headerTop + dpToPx(compact ? 24f : 28f);
        float plotRight = width - paddingPx - dpToPx(4f);
        float plotBottom = height - paddingPx - dpToPx(compact ? 8f : 14f);

        switch (state) {
            case LOADING:
                drawCenteredText(canvas, sk ? "Načítavam históriu cien z Hlídača shopov..." : "Načítám historii cen z Hlídače shopů...", plotLeft, plotTop, plotRight, plotBottom, subtitlePaint);
                break;
            case EMPTY:
            case UNSUPPORTED_COUNTRY:
                drawCenteredText(canvas, sk ? "História cien pre tento produkt nie je k dispozícii" : "Historie cen pro tento produkt není k dispozici", plotLeft, plotTop, plotRight, plotBottom, subtitlePaint);
                break;
            case ERROR:
                drawCenteredText(canvas, sk ? "Údaje o histórii cien sa nepodarilo načítať" : "Data o historii cen se nepodařilo načíst", plotLeft, plotTop, plotRight, plotBottom, subtitlePaint);
                break;
            case LOADED:
                drawChart(canvas, plotLeft, plotTop, plotRight, plotBottom, compact);
                break;
        }
    }

    private void drawCenteredText(Canvas canvas, String text, float left, float top, float right, float bottom, Paint paint) {
        float x = (left + right) / 2f;
        float y = (top + bottom) / 2f - ((paint.descent() + paint.ascent()) / 2f);
        Paint.Align prevAlign = paint.getTextAlign();
        paint.setTextAlign(Paint.Align.CENTER);
        canvas.drawText(text, x, y, paint);
        paint.setTextAlign(prevAlign);
    }

    private void drawChart(Canvas canvas, float left, float top, float right, float bottom, boolean compact) {
        if (data == null || !data.hasData()) return;

        List<PriceHistoryData.PricePoint> points = data.getCurrentPricePoints();
        int count = points.size();
        if (count == 0) return;

        float plotHeight = bottom - top;
        float plotWidth = right - left;

        double minPrice = data.getMinPrice() != null ? data.getMinPrice() : points.get(0).price;
        double maxPrice = data.getMaxPrice() != null ? data.getMaxPrice() : points.get(0).price;

        if (maxPrice <= minPrice) {
            maxPrice = minPrice + 1.0;
        }

        // Responsive label size and gutter
        float labelTextSize = compact ? Math.max(dpToPx(7.5f), Math.min(dpToPx(10f), plotHeight * 0.15f)) : dpToPx(9.5f);
        labelPaint.setTextSize(labelTextSize);

        String topLabel = formatPrice(maxPrice);
        String btmLabel = formatPrice(minPrice);
        float maxLabelWidth = Math.max(labelPaint.measureText(topLabel), labelPaint.measureText(btmLabel));
        float yGutter = maxLabelWidth + Math.max(dpToPx(4f), plotWidth * 0.02f);

        float chartRight = right - yGutter;
        if (chartRight <= left + dpToPx(40f)) {
            chartRight = right;
        }

        if (count < 2) {
            float midY = (top + bottom) / 2f;
            canvas.drawLine(left, midY, chartRight, midY, gridLinePaint);
            String pStr = formatPrice(points.get(0).price);
            canvas.drawText(pStr, right - labelPaint.measureText(pStr), midY + labelTextSize * 0.35f, labelPaint);
            return;
        }

        // Horizontal grid lines and labels - responsive count
        int gridLines = compact ? (plotHeight > dpToPx(65f) ? 3 : 2) : 3;
        for (int i = 0; i < gridLines; i++) {
            float y = top + (bottom - top) * i / (gridLines - 1f);
            canvas.drawLine(left, y, chartRight, y, gridLinePaint);

            double priceVal = maxPrice - (maxPrice - minPrice) * i / (gridLines - 1f);
            String label = formatPrice(priceVal);
            float labelY;
            if (i == 0) {
                labelY = y + labelTextSize * 0.9f;
            } else if (i == gridLines - 1) {
                labelY = y - dpToPx(2f);
            } else {
                labelY = y + labelTextSize * 0.35f;
            }
            canvas.drawText(label, right - labelPaint.measureText(label), labelY, labelPaint);
        }

        // Dates on X-axis - responsive count
        long minTime = points.get(0).timestamp;
        long maxTime = points.get(count - 1).timestamp;
        if (maxTime <= minTime) maxTime = minTime + 1;

        int numDates = compact ? ((chartRight - left) > dpToPx(150f) ? 3 : 2) : ((chartRight - left) > dpToPx(240f) ? 4 : 3);
        float dateY = bottom + Math.max(dpToPx(8f), (cardRect.bottom - bottom) * 0.58f);
        for (int i = 0; i < numDates; i++) {
            float frac = (float) i / (float) (numDates - 1);
            long time = minTime + (long) ((maxTime - minTime) * frac);
            String dateText = dateFormat.format(new Date(time));
            float dWidth = labelPaint.measureText(dateText);

            float dx;
            if (i == 0) {
                dx = left;
            } else if (i == numDates - 1) {
                dx = chartRight - dWidth;
            } else {
                dx = left + (chartRight - left) * frac - (dWidth / 2f);
            }
            canvas.drawText(dateText, dx, dateY, labelPaint);
        }

        // Build curve & shaded area
        currentCurvePath.reset();
        currentAreaPath.reset();

        float startX = left;
        float startY = bottom - (float) ((points.get(0).price - minPrice) / (maxPrice - minPrice) * (bottom - top));

        currentCurvePath.moveTo(startX, startY);
        currentAreaPath.moveTo(startX, bottom);
        currentAreaPath.lineTo(startX, startY);

        for (int i = 1; i < count; i++) {
            PriceHistoryData.PricePoint p = points.get(i);
            float x = left + (float) ((p.timestamp - minTime) / (double) (maxTime - minTime) * (chartRight - left));
            float y = bottom - (float) ((p.price - minPrice) / (maxPrice - minPrice) * (bottom - top));

            currentCurvePath.lineTo(x, y);
            currentAreaPath.lineTo(x, y);
        }

        currentAreaPath.lineTo(chartRight, bottom);
        currentAreaPath.close();

        int curveColor = Color.parseColor("#00A651");

        // Shaded area - cached to avoid allocations on every frame
        if (cachedGradient == null || lastGradTop != top || lastGradBottom != bottom || lastGradCompact != compact) {
            int startGradColor = Color.argb(compact ? 60 : 75, Color.red(curveColor), Color.green(curveColor), Color.blue(curveColor));
            int endGradColor = Color.argb(0, Color.red(curveColor), Color.green(curveColor), Color.blue(curveColor));

            cachedGradient = new LinearGradient(
                    0, top, 0, bottom,
                    startGradColor, endGradColor,
                    Shader.TileMode.CLAMP
            );
            lastGradTop = top;
            lastGradBottom = bottom;
            lastGradCompact = compact;
            currentAreaPaint.setShader(cachedGradient);
        }

        canvas.drawPath(currentAreaPath, currentAreaPaint);

        float strokeWidth = compact ? Math.max(dpToPx(1.5f), Math.min(dpToPx(2.2f), plotHeight * 0.032f)) : dpToPx(2.5f);
        currentCurvePaint.setStrokeWidth(strokeWidth);
        canvas.drawPath(currentCurvePath, currentCurvePaint);

        // Draw endpoint circle for latest price
        PriceHistoryData.PricePoint lastP = points.get(count - 1);
        float lastX = chartRight;
        float lastY = bottom - (float) ((lastP.price - minPrice) / (maxPrice - minPrice) * (bottom - top));

        float dotRadius = compact ? Math.max(dpToPx(2f), Math.min(dpToPx(3.2f), plotHeight * 0.045f)) : dpToPx(3.5f);
        dotBgPaint.setColor(isDarkMode() ? Color.parseColor("#181824") : Color.WHITE);
        canvas.drawCircle(lastX, lastY, dotRadius + dpToPx(1f), dotBgPaint);
        dotFgPaint.setColor(curveColor);
        canvas.drawCircle(lastX, lastY, dotRadius, dotFgPaint);

        // Optional original price line (strikethrough)
        List<PriceHistoryData.PricePoint> origPoints = data.getOriginalPricePoints();
        if (origPoints != null && origPoints.size() >= 2) {
            originalCurvePath.reset();
            boolean first = true;
            for (PriceHistoryData.PricePoint op : origPoints) {
                float ox = left + (float) ((op.timestamp - minTime) / (double) (maxTime - minTime) * (chartRight - left));
                float oy = bottom - (float) ((op.price - minPrice) / (maxPrice - minPrice) * (bottom - top));
                if (first) {
                    originalCurvePath.moveTo(ox, oy);
                    first = false;
                } else {
                    originalCurvePath.lineTo(ox, oy);
                }
            }
            canvas.drawPath(originalCurvePath, originalCurvePaint);
        }
    }

    private float dpToPx(float dp) {
        return TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP,
                dp,
                getResources().getDisplayMetrics()
        );
    }
}
