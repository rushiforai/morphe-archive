package app.yydarlinker.deepseekcaptions;

import android.content.Context;
import android.graphics.Typeface;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;

/** Inline slider that persists on finger release; no additional dialog or Save button is used. */
@SuppressWarnings("deprecation")
public final class DeepSeekSliderPreference extends android.preference.Preference {
    static final String KEY_TEXT_SIZE = "deepseek_caption_text_size";
    static final String KEY_OPACITY = "deepseek_caption_background_opacity";

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
        title.setText(getTitle());
        CaptionSettingsStyle.title(title);
        title.setTypeface(Typeface.DEFAULT, Typeface.NORMAL);
        heading.addView(title, new LinearLayout.LayoutParams(
                0,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                1f
        ));

        TextView valueLabel = new TextView(context);
        CaptionSettingsStyle.caption(valueLabel);
        valueLabel.setTextSize(14);
        valueLabel.setTextColor(CaptionSettingsStyle.primary(context));
        valueLabel.setTypeface(Typeface.DEFAULT,Typeface.BOLD);
        valueLabel.setPadding(dp(12),0,0,0);
        heading.addView(valueLabel, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));

        SeekBar slider = new SeekBar(context);
        slider.setMinimumHeight(dp(48));
        slider.setContentDescription(getTitle());
        int minimum = minimum();
        int maximum = maximum();
        int current = currentValue();
        slider.setMax(maximum - minimum);
        slider.setProgress(current - minimum);
        valueLabel.setText(format(current));
        root.addView(slider, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));

        CharSequence summaryText = getSummary();
        if (summaryText != null && summaryText.length() > 0) {
            TextView summary = new TextView(context);
            summary.setText(summaryText);
            CaptionSettingsStyle.caption(summary);
            root.addView(summary, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            ));
        }

        slider.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                valueLabel.setText(format(minimum + progress));
                if(fromUser) SubtitleStylePreview.update(getKey(),minimum+progress);
            }

            @Override public void onStartTrackingTouch(SeekBar seekBar) {}

            @Override public void onStopTrackingTouch(SeekBar seekBar) {
                saveValue(minimum + seekBar.getProgress());
            }
        });
        return root;
    }

    private int minimum() {
        return KEY_TEXT_SIZE.equals(getKey()) ? DeepSeekConfig.MIN_CAPTION_TEXT_SIZE : 0;
    }

    private int maximum() {
        return KEY_TEXT_SIZE.equals(getKey()) ? DeepSeekConfig.MAX_CAPTION_TEXT_SIZE : 100;
    }

    private int currentValue() {
        DeepSeekConfig.Snapshot current = DeepSeekConfig.displayStyle(getContext());
        return KEY_TEXT_SIZE.equals(getKey())
                ? current.captionTextSize
                : current.backgroundOpacity;
    }

    private String format(int value) {
        return KEY_TEXT_SIZE.equals(getKey()) ? Integer.toString(value) : value + "%";
    }

    private void saveValue(int value) {
        if (KEY_TEXT_SIZE.equals(getKey())) {
            DeepSeekConfig.saveCaptionTextSize(getContext(), value);
        } else {
            DeepSeekConfig.saveBackgroundOpacity(getContext(), value);
        }
        CaptionOverlay.refreshStyle(getContext());
    }

    private int dp(int value) {
        return Math.round(value * getContext().getResources().getDisplayMetrics().density);
    }
}
