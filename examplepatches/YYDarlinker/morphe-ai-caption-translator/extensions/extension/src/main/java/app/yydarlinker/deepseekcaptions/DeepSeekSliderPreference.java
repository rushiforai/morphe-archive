package app.yydarlinker.deepseekcaptions;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.List;

/** Inline slider that persists on finger release; no additional dialog or Save button is used. */
@SuppressWarnings("deprecation")
public final class DeepSeekSliderPreference extends CaptionSettingPreference {
    static final String KEY_TEXT_SIZE = "deepseek_caption_text_size";
    static final String KEY_OPACITY = "deepseek_caption_background_opacity";
    private static final String[] SIZE_TIER_KEYS = {
            "size_tier_xs", "size_tier_s", "size_tier_standard", "size_tier_l", "size_tier_xl"
    };
    /**
     * A tier name may wrap onto a second line at a word boundary when one translated name cannot fit the
     * width its neighbour allows. It is never ellipsized, never shrunk below the shared caption size and
     * never clipped: the row grows taller instead.
     */
    static final int MAX_TIER_LABEL_LINES = 2;
    /** Upper bound for one label box, so a long translation wraps instead of starving its neighbours. */
    static final int MAX_TIER_LABEL_PX = 84;
    /** Reference settings-row width and horizontal padding, used only to resolve the rail inset. */
    private static final int ROW_REFERENCE_DP = 380;
    private static final int ROW_PADDING_DP = 20;
    private java.lang.ref.WeakReference<RailBar> ownRail=new java.lang.ref.WeakReference<>(null);
    private java.lang.ref.WeakReference<LinearLayout> ownNames=new java.lang.ref.WeakReference<>(null);

    public DeepSeekSliderPreference(Context context) {
        super(context);
        initialize();
    }

    public DeepSeekSliderPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
        initialize();
    }

    public DeepSeekSliderPreference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        initialize();
    }

    public DeepSeekSliderPreference(
            Context context,
            AttributeSet attrs,
            int defStyleAttr,
            int defStyleRes
    ) {
        super(context, attrs, defStyleAttr, defStyleRes);
        initialize();
    }

    private void initialize() {
        setPersistent(false);
        setSelectable(false);
    }

    @Override
    public View getView(View convertView, ViewGroup parent) {
        // Text-size and opacity share this class but bind to different ranges and values.
        String key = getKey();
        View safeView = convertView != null && key != null && key.equals(convertView.getTag())
                ? convertView
                : null;
        return super.getView(safeView, parent);
    }

    @Override
    protected View onCreateView(ViewGroup parent) {
        Context context = getContext();
        LinearLayout root = new LinearLayout(context);
        root.setTag(getKey());
        root.setOrientation(LinearLayout.VERTICAL);
        CaptionSettingsStyle.row(root);

        LinearLayout heading = new LinearLayout(context);
        heading.setOrientation(LinearLayout.HORIZONTAL);
        root.addView(heading, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));

        TextView title = new TextView(context);
        uiText(title,()->String.valueOf(getTitle()));
        CaptionSettingsStyle.title(title);
        title.setTypeface(Typeface.DEFAULT, Typeface.NORMAL);
        heading.addView(title, new LinearLayout.LayoutParams(
                0,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                1f
        ));

        // The size slider states both pixel sizes in the tier line below, so it carries no header value.
        TextView valueLabel = addHeaderValue(context, heading);

        boolean sizeSlider = KEY_TEXT_SIZE.equals(getKey());
        SeekBar sizeBar = sizeSlider ? new SizeTierSeekBar(this, context) : null;
        SeekBar opacityBar = sizeSlider ? null : new OpacitySeekBar(this, context);
        SeekBar slider = sizeSlider ? sizeBar : opacityBar;
        ownRail=new java.lang.ref.WeakReference<>((RailBar)slider);
        CaptionSettingsStyle.slider(slider);
        CaptionTextResolver.direction(slider,false); // The existing N25 physical fraction mapping handles RTL.
        slider.setTag(sizeSlider ? "ai_size_tier_slider" : "ai_opacity_slider");
        slider.setMinimumHeight(dp(48));
        slider.setContentDescription(getTitle());
        int minimum = minimum();
        int maximum = maximum();
        int current = currentValue();
        slider.setMax(maximum - minimum);
        slider.setProgress(current - minimum);
        if (valueLabel != null) valueLabel.setText(format(current));
        root.addView(slider, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));

        LinearLayout tierNames = sizeSlider ? tierNames((SizeTierSeekBar) sizeBar) : null;
        ownNames=new java.lang.ref.WeakReference<>(tierNames);
        if (tierNames != null) {
            root.addView(tierNames, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            ));
            updateTierNames(slider, tierNames, current);
        }

        CharSequence summaryText = KEY_TEXT_SIZE.equals(getKey()) ? tierDescription(current) : getSummary();
        TextView summary = new TextView(context);
        if (summaryText != null && summaryText.length() > 0) {
            uiText(summary,()->KEY_TEXT_SIZE.equals(getKey())?tierDescription(minimum+slider.getProgress()):String.valueOf(getSummary()));
            CaptionSettingsStyle.caption(summary);
            root.addView(summary, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            ));
        }

        slider.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                setHeaderValue(valueLabel, minimum + progress);
                if (sizeSlider) {
                    summary.setText(tierDescription(minimum + progress));
                    updateTierNames(slider, tierNames, minimum + progress);
                    slider.invalidate();
                }
                if(fromUser) SubtitleStylePreview.update(getKey(),minimum+progress);
            }

            @Override public void onStartTrackingTouch(SeekBar seekBar) {}

            @Override public void onStopTrackingTouch(SeekBar seekBar) {
                saveValue(minimum + seekBar.getProgress());
            }
        });
        return root;
    }

    /** Adds the live header value for the sliders that still show one; the size slider gets none. */
    private TextView addHeaderValue(Context context, LinearLayout heading) {
        if (KEY_TEXT_SIZE.equals(getKey())) return null;
        TextView valueLabel = new TextView(context);
        CaptionSettingsStyle.caption(valueLabel);
        valueLabel.setTextSize(14);
        valueLabel.setTextColor(CaptionSettingsStyle.primary(context));
        valueLabel.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        valueLabel.setPadding(dp(12), 0, 0, 0);
        heading.addView(valueLabel, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));
        return valueLabel;
    }

    /** The size slider carries no header value; only the opacity slider shows its live percentage. */
    private void setHeaderValue(TextView valueLabel, int value) {
        if (valueLabel != null) valueLabel.setText(format(value));
    }

    /**
     * The tier label row. Every label is centred on its own tick, which is only possible if the two outer
     * labels have somewhere to go: both sliders are therefore inset from their padded edges by exactly the
     * room the end labels need, so a centred end label still lands inside the row and nothing has to be
     * clipped, ellipsized or nudged off its tick. The inset is the same for both sliders, so the two rails
     * stay the same length with the same margins.
     */
    private LinearLayout tierNames(SizeTierSeekBar sizeBar) {
        List<TextView> labels = new ArrayList<>();
        final int[] natural=new int[SIZE_TIER_KEYS.length];
        for (int tier = 0; tier < SIZE_TIER_KEYS.length; tier++) {
            TextView name = tierLabel(SIZE_TIER_KEYS[tier]);
            uiText(name,SIZE_TIER_KEYS[tier]);
            // The width the label wants on one line: what decides the rail inset and what the row places.
            // A weight-1 cell measures to an equal share instead, which would hide a name that does not
            // fit its share, so the natural size is captured here and used by the layout below.
            name.measure(View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED),
                    View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
            natural[tier]=name.getMeasuredWidth();
            labels.add(name);
        }
        LinearLayout names = new LinearLayout(getContext()) {
            @Override protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
                int count=getChildCount();
                int[] translatedWidths=tierLabelWidths();System.arraycopy(translatedWidths,0,natural,0,count);
                // The label row is a full-width sibling of the slider with no horizontal padding of its own,
                // so the slider's padded frame and this row's frame start at the same x and every
                // coordinate below can be derived from the slider's own numbers.
                int pad=sizeBar.getPaddingLeft();
                int span=getWidth()-2*pad;
                int inset=span>0?tierLabelInset(natural,span):0;
                float step=count>1?(span-2f*inset)/(count-1):0f;
                int previousRight=-1;
                int tallest=0;
                for (int i = 0; i < count; i++) {
                    View label = getChildAt(i);
                    int height = label.getMeasuredHeight();
                    // A label is placed only horizontally here, so its own vertical band is whatever the
                    // standard row layout computed; the very first pass can still hold zeros.
                    int labelTop = label.getBottom() > label.getTop() ? label.getTop() : 0;
                    int labelBottom = labelTop + height;
                    if (span <= 0) {
                        label.layout(pad, labelTop, pad + Math.max(0,natural[i]), labelBottom);
                        previousRight = pad + Math.max(0,natural[i]);
                        continue;
                    }
                    // The leftmost x this label may take, and the room the labels still to come need: an
                    // equal share of the rail each. A name is never allowed past its own share, so five
                    // names always fit side by side and none can reach over another.
                    int floorX = Math.max(pad, previousRight);
                    int remaining = count - i;
                    int share = Math.max(1, (pad + span - floorX) / remaining);
                    int width = Math.min(natural[i], share);
                    label.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                            View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
                    width = label.getMeasuredWidth();
                    // Centre on the tick when the name fits its share: the rail is inset by exactly the room
                    // the end labels need, so on a row wide enough for the names this lands every label on
                    // its own tick. Otherwise the label keeps the leftmost position its share allows.
                    int x = Math.round(pad + inset + i * step - width / 2f);
                    x = Math.max(floorX, Math.min(pad + span - width, x));
                    labelBottom=labelTop+label.getMeasuredHeight();
                    label.layout(x, labelTop, x + width, labelBottom);
                    tallest=Math.max(tallest,labelBottom);
                    previousRight = Math.max(previousRight, x + width);
                }
                // A locale rebind can need a taller font or a second line; retain the original rail maths.
                if(tallest>getHeight()){setMinimumHeight(tallest);requestLayout();}
            }
        };
        names.setTag("ai_size_tier_names");
        names.setOrientation(LinearLayout.HORIZONTAL);
        names.setClipChildren(false);
        names.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_YES);
        for (TextView name : labels) {
            names.addView(name, new LinearLayout.LayoutParams(
                    0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        }
        return names;
    }

    /**
     * One tier label. The selected tier is drawn bold and bold is wider, so every measurement that decides
     * room for a label — the row's inset and the label's own cap — uses the bold face.
     */
    private TextView tierLabel(String key) {
        TextView name = new TextView(getContext());
        name.setText(CaptionStrings.settings(getContext(),key));
        CaptionSettingsStyle.caption(name);
        name.setGravity(Gravity.CENTER);
        name.setSingleLine(false);
        name.setMaxLines(MAX_TIER_LABEL_LINES);
        name.setEllipsize(null);
        name.setBreakStrategy(android.text.Layout.BREAK_STRATEGY_BALANCED);
        name.setHyphenationFrequency(android.text.Layout.HYPHENATION_FREQUENCY_NONE);
        name.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        name.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        name.setMaxWidth(dp(MAX_TIER_LABEL_PX));
        return name;
    }

    /** Natural one-line width of every tier label with the face the row draws it in. */
    int[] tierLabelWidths() {
        int[] widths = new int[SIZE_TIER_KEYS.length];
        for (int tier = 0; tier < SIZE_TIER_KEYS.length; tier++) {
            TextView name = tierLabel(SIZE_TIER_KEYS[tier]);
            name.measure(View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED),
                    View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
            widths[tier] = name.getMeasuredWidth();
        }
        return widths;
    }

    /** The label-box ceiling in pixels, for the geometry fixtures. */
    int tierLabelCeilingPx() {
        return dp(MAX_TIER_LABEL_PX);
    }

    /** The reference content width of one settings row, for the geometry fixtures. */
    int referenceSpanPx() {
        return dp(ROW_REFERENCE_DP - 2 * ROW_PADDING_DP);
    }

    /**
     * The inset both rails in the row carry, and with it the whole labelled rail.
     * <p>
     * With inset {@code i} the five tick centres are {@code i + k*(S-2i)/4}, so a label of natural width
     * {@code w_j} centred on its tick spans {@code (S-2i)/4} of its own and needs:
     * <ul>
     *   <li>{@code w_0/2 <= i} and {@code w_4/2 <= i} — the two end labels stay inside the row;</li>
     *   <li>{@code w_j + w_j+1 <= (S-2i)/2} — no two neighbours touch, the same gap being shared by the
     *       two half-widths that meet in it.</li>
     * </ul>
     * Rearranging the last one gives {@code i >= (2*(w_j + w_j+1) - S)/4}. Taking the smallest inset that
     * satisfies all six inequalities keeps every label on its tick whenever the row can hold the names at
     * all, and keeps the rail as long as possible; the four-fifths cap leaves a sliver of rail even in a
     * hopeless case, and the row falls back to confining over-wide names to the gap between two ticks.
     */
    static int tierLabelInset(int[] widths,int span){
        if(widths==null||widths.length==0||span<=0)return 0;
        int count=widths.length;
        int required=(widths[0]+1)/2;
        if(count>1)required=Math.max(required,(widths[count-1]+1)/2);
        for(int j=0;j+1<count;j++){
            int pair=Math.max(0,widths[j])+Math.max(0,widths[j+1]);
            required=Math.max(required,(2*pair-span+3)/4);
        }
        return Math.max(0,Math.min(span*2/5,required));
    }

    private void updateTierNames(SeekBar slider, LinearLayout names, int tier) {
        int selected = CaptionFontSize.clampTier(tier);
        String current = CaptionStrings.settings(getContext(), SIZE_TIER_KEYS[selected]);
        String description = getTitle() + ": " + current;
        slider.setContentDescription(description);
        names.setContentDescription(description);
        for (int i = 0; i < names.getChildCount(); i++) {
            TextView name = (TextView) names.getChildAt(i);
            name.setTextColor(i == selected ? CaptionSettingsStyle.primary(getContext())
                    : CaptionSettingsStyle.secondary(getContext()));
            name.setTypeface(Typeface.create(Typeface.DEFAULT,
                    i == selected ? Typeface.BOLD : Typeface.NORMAL));
        }
        names.invalidate();
    }
    @Override protected void refreshDynamicText(){
        RailBar rail=ownRail.get();LinearLayout names=ownNames.get();
        if(rail!=null){rail.refreshTextGeometry();rail.setContentDescription(getTitle());if(names!=null){updateTierNames(rail,names,rail.getProgress()+minimum());names.requestLayout();}}
    }

    /**
     * One geometry for the whole slider. The rail runs over the inclusive padded frame, narrowed at both
     * ends by the row's label inset — first endpoint at {@code paddingLeft + inset}, last at
     * {@code width - paddingRight - inset} — the ticks and the extreme thumb centres sit on exactly those
     * two coordinates, and every tier divides that same travel evenly.
     * <p>
     * {@code AbsSeekBar} cannot supply this: its stock rail is the only source of the intrinsic measured
     * height but is additionally inset by a vendor amount (about 6px on API 28) that does not scale with
     * the layout width, and its own thumb stamping follows a private offset. This class therefore keeps
     * {@code AbsSeekBar}'s dragging and progress handling untouched and takes over only painting: the
     * rail and ticks are drawn here and the real native thumb drawable is stamped from the same geometry.
     */
    abstract static class RailBar extends SeekBar {
        /** Rasterization hook: suppresses only the two rail bands so the ticks can be sampled exactly. */
        static boolean RAIL_BANDS_HIDDEN = false;
        /** The preference this rail belongs to; it owns the labels the inset is derived from. */
        private final DeepSeekSliderPreference preference;
        /** The row inset for the width this rail currently has; zero until it has been laid out. */
        private int inset;
        private final Paint railPaint = new Paint(Paint.ANTI_ALIAS_FLAG);

        RailBar(DeepSeekSliderPreference preference, Context context) {
            super(context);
            this.preference = preference;
            // The rail is drawn by this view. The stock drawable is the only source of AbsSeekBar's
            // intrinsic measured height, so onMeasure below replaces that contribution explicitly.
            setProgressDrawable(null);
        }

        @Override protected void onSizeChanged(int width, int height, int oldWidth, int oldHeight) {
            super.onSizeChanged(width, height, oldWidth, oldHeight);
            // The inset depends on the padded row width, which is only known here. Both sliders in the row
            // take the same width from the same parent and read the same labels, so they agree exactly.
            int span = width - getPaddingLeft() - getPaddingRight();
            inset = preference == null || span <= 0
                    ? 0 : tierLabelInset(preference.tierLabelWidths(), span);
        }

        @Override protected void onMeasure(int widthSpec, int heightSpec) {
            Drawable thumb = getThumb();
            int intrinsic = Math.max(getSuggestedMinimumHeight(), thumb == null ? 0 : thumb.getIntrinsicHeight());
            int height = Math.max(intrinsic, CaptionSettingsStyle.dp(getContext(), 24));
            setMeasuredDimension(resolveSize(MeasureSpec.getSize(widthSpec), widthSpec),
                    resolveSize(height, heightSpec));
        }
        void refreshTextGeometry(){onSizeChanged(getWidth(),getHeight(),getWidth(),getHeight());requestLayout();invalidate();}

        final int centerY() {
            return getPaddingTop() + (getHeight() - getPaddingTop() - getPaddingBottom()) / 2;
        }

        /** Inclusive visible rail: first endpoint at paddingLeft plus the row's label inset. */
        final float railStart() {
            return getPaddingLeft() + inset;
        }

        final float railEnd() {
            return getWidth() - getPaddingRight() - inset;
        }

        /**
         * The row's label inset, resolved from this preference's own translated labels and the width this
         * rail actually has. Both sliders in the row take the same width from the same parent and read the
         * same labels, so they resolve the same number and the two rails stay the same length.
         */
        final int resolvedInset() {
            return inset;
        }

        /**
         * The owning preference, so a nested rail can expose the row geometry to the fixtures.
         */
        final DeepSeekSliderPreference owner() {
            return preference;
        }

        /**
         * The row inset this rail resolved for its current width, for the geometry fixtures and for the
         * label row, which is a full-width sibling and therefore uses the same number.
         */
        final int railInsetPx() {
            return resolvedInset();
        }

        /** The widths of the five tier labels this rail's preference renders. */
        final int[] labelWidths() {
            return preference == null ? new int[0] : preference.tierLabelWidths();
        }

        /** Bold width of the widest tier label, for the geometry fixtures. */
        final int largestTierLabelPx() {
            if (preference == null) return 0;
            int largest = 0;
            for (int width : preference.tierLabelWidths()) largest = Math.max(largest, width);
            return largest;
        }

        /** The label-box ceiling in pixels, for the geometry fixtures. */
        final int tierLabelCeilingPx() {
            return preference == null ? 0 : preference.tierLabelCeilingPx();
        }

        /** The reference content width of one settings row, for the geometry fixtures. */
        final int referenceSpanPx() {
            return preference == null ? 0 : preference.referenceSpanPx();
        }

        /** Thumb centre travel: paddingLeft to width - paddingRight, divided evenly by progress. */
        final float thumbCenterX(float logicalFraction) {
            return physicalCenterX(physicalFraction(logicalFraction));
        }

        final float progressFraction() {
            int span = Math.max(1, getMax());
            return getProgress() / (float) span;
        }

        /**
         * The single logical-to-physical mapping for the whole rail. Every mirroring decision lives here,
         * exactly once: in RTL the logical fraction is measured from the opposite edge, so the physical
         * fraction is {@code 1 - logical}. Thumb placement, tick placement, the filled rail band and the
         * tier label row all consume this one value, which is what keeps a drag and its on-screen position
         * in agreement instead of applying the mirror twice.
         */
        final boolean rtl() {
            // A view created but not yet attached has no resolved layout direction of its own — a
            // just-constructed View reports "inherit" no matter what its siblings will inherit. Read the
            // nearest ancestor that has resolved one, then fall back to the localised configuration, which
            // is the same signal the widget itself will inherit on attach. Never an unresolved default, so
            // a drag and its mirror can never disagree.
            ViewParent ancestor = getParent();
            while (ancestor instanceof View) {
                View view = (View) ancestor;
                int direction = view.getLayoutDirection();
                if (direction == View.LAYOUT_DIRECTION_RTL) return true;
                if (direction == View.LAYOUT_DIRECTION_LTR) return false;
                ancestor = view.getParent();
            }
            return resolvedRtl(getContext());
        }

        /**
         * RTL for a view that is not attached yet. The localised configuration is authoritative: it
         * carries the same resolved layout direction the widget inherits on attach, and unlike a
         * platform default-locale lookup it does not follow a device-wide language change.
         */
        private static boolean resolvedRtl(Context context) {
            android.content.res.Configuration configuration =
                    context.getResources().getConfiguration();
            int direction = configuration.getLayoutDirection();
            if (direction == View.LAYOUT_DIRECTION_RTL) return true;
            if (direction == View.LAYOUT_DIRECTION_LTR) return false;
            java.util.Locale locale = configuration.getLocales().isEmpty()
                    ? java.util.Locale.getDefault()
                    : configuration.getLocales().get(0);
            return android.text.TextUtils.getLayoutDirectionFromLocale(locale)
                    == View.LAYOUT_DIRECTION_RTL;
        }

        final float physicalFraction(float logicalFraction) {
            return rtl() ? 1f - logicalFraction : logicalFraction;
        }

        final float physicalFraction() {
            return physicalFraction(progressFraction());
        }

        /** Physical X of a physical fraction; the extreme thumb centre for both rails. */
        final float physicalCenterX(float physicalFraction) {
            return railStart() + physicalFraction * (railEnd() - railStart());
        }

        /**
         * The full padded width the rail geometry is expressed in. The tier label row is a sibling of the
         * slider inside the same padded {@code LinearLayout}, so this is also the row's own width, and a
         * label placed with a coordinate from here lands on the matching tick.
         */
        private int railThickness() {
            return Math.max(1, CaptionSettingsStyle.dp(getContext(), 2));
        }

        /** Extra decoration hook for the size tier ticks; drawn between the rail and the thumb. */
        void drawOverRail(Canvas canvas) {
        }

        /**
         * AbsSeekBar is not allowed to draw here: its own rail is inset by a vendor amount and its thumb
         * is stamped at a platform position this class does not share. Rail, ticks and the native thumb
         * drawable are all positioned from one geometry instead, so the visible rail endpoints, the first
         * and last tick centres and the two end thumb centres are the same two coordinates.
         */
        @Override public void draw(Canvas canvas) {
            float thickness = railThickness();
            float radius = thickness / 2f;
            float centerY = centerY();
            float top = centerY - radius;
            float bottom = centerY + radius;
            float start = railStart();
            float end = railEnd();
            // One mirrored fraction drives the filled band and the thumb; the two can never disagree.
            float fraction = physicalFraction();
            railPaint.setStyle(Paint.Style.FILL);
            railPaint.setAlpha(255);
            railPaint.setColor(CaptionSettingsStyle.sliderUnfilled(getContext()));
            if (!RAIL_BANDS_HIDDEN && end > start) canvas.drawRoundRect(start, top, end, bottom, radius, radius, railPaint);
            if (!RAIL_BANDS_HIDDEN && fraction > 0f && end > start) {
                railPaint.setColor(CaptionSettingsStyle.primary(getContext()));
                float filled = (end - start) * fraction;
                boolean rtl = rtl();
                canvas.save();
                canvas.clipRect(rtl ? end - filled : start, top, rtl ? end : start + filled, bottom);
                canvas.drawRoundRect(start, top, end, bottom, radius, radius, railPaint);
                canvas.restore();
            }
            drawOverRail(canvas);
            Drawable thumb = getThumb();
            if (thumb == null) return;
            int halfWidth = thumb.getIntrinsicWidth() / 2;
            int halfHeight = thumb.getIntrinsicHeight() / 2;
            int cx = Math.round(physicalCenterX(fraction));
            int cy = centerY();
            thumb.setBounds(cx - halfWidth, cy - halfHeight, cx + halfWidth, cy + halfHeight);
            thumb.setState(getDrawableState());
            thumb.draw(canvas);
        }
    }

    /** Background opacity rail: identical geometry to the size rail, no tick marks. */
    static final class OpacitySeekBar extends RailBar {
        OpacitySeekBar(DeepSeekSliderPreference preference, Context context) {
            super(preference, context);
        }
    }

    /** Five thumb positions, with visible ticks even when the theme omits tick marks. */
    static final class SizeTierSeekBar extends RailBar {
        private final Paint tickPaint = new Paint(Paint.ANTI_ALIAS_FLAG);

        SizeTierSeekBar(DeepSeekSliderPreference preference, Context context) {
            super(preference, context);
            setTickMark(null);
        }

        /** Tick for a tier sits on the thumb centre that tier produces. */
        float tickCenterX(int tier) {
            float fraction = CaptionFontSize.clampTier(tier) / (float) (CaptionFontSize.COUNT - 1);
            if (getLayoutDirection() == View.LAYOUT_DIRECTION_RTL) fraction = 1f - fraction;
            return thumbCenterX(fraction);
        }

        @Override void drawOverRail(Canvas canvas) {
            float centerY = centerY();
            float radius = CaptionSettingsStyle.dp(getContext(), 3);
            for (int tier = 0; tier < CaptionFontSize.COUNT; tier++) {
                tickPaint.setColor(tier == getProgress() ? CaptionSettingsStyle.primary(getContext())
                        : CaptionSettingsStyle.sliderUnfilled(getContext()));
                canvas.drawCircle(tickCenterX(tier), centerY, radius, tickPaint);
            }
        }
    }

    private int minimum() {
        return 0;
    }

    private int maximum() {
        return KEY_TEXT_SIZE.equals(getKey()) ? CaptionFontSize.COUNT - 1 : 100;
    }

    private int currentValue() {
        DeepSeekConfig.Snapshot current = DeepSeekConfig.displayStyle(getContext());
        return KEY_TEXT_SIZE.equals(getKey())
                ? current.captionSizeTier
                : current.backgroundOpacity;
    }

    private String format(int value) {
        if (!KEY_TEXT_SIZE.equals(getKey())) return value + "%";
        return pixels(CaptionFontSize.detailGlyphHeightPx(value)) + " px";
    }

    private String tierDescription(int tier) {
        return String.format(java.util.Locale.ROOT, CaptionStrings.settings(getContext(), "size_tier_hint"),
                CaptionStrings.settings(getContext(), SIZE_TIER_KEYS[CaptionFontSize.clampTier(tier)]),
                pixels(CaptionFontSize.detailGlyphHeightPx(tier)),
                pixels(CaptionFontSize.fullScreenGlyphHeightPx(tier)));
    }

    private static String pixels(float value) {
        return value == Math.round(value) ? Integer.toString(Math.round(value))
                : String.format(java.util.Locale.ROOT, "%.1f", value);
    }

    private void saveValue(int value) {
        if (KEY_TEXT_SIZE.equals(getKey())) {
            DeepSeekConfig.saveCaptionSizeTier(getContext(), value);
        } else {
            DeepSeekConfig.saveBackgroundOpacity(getContext(), value);
        }
        CaptionOverlay.refreshStyle(getContext());
    }

    private int dp(int value) {
        return Math.round(value * getContext().getResources().getDisplayMetrics().density);
    }
}
