package app.morphe.extension.vk.settings;

import android.app.Activity;
import android.app.Dialog;
import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Build;
import android.os.Bundle;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import app.morphe.extension.vk.layout.NavigationFilter;
import app.morphe.extension.vk.video.VideoQualityHelper;

import java.util.ArrayList;

public class VkZenSettingsActivity extends Activity {

    private boolean isDark;
    private int colorBg;
    private int colorSurface;
    private int colorStroke;
    private int colorTextPrimary;
    private int colorTextSecondary;
    private int colorAccent;

    private LinearLayout slotsContainer;
    private TextView tvVideoQualityTitle;
    private TextView tvVideoQualitySubtitle;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        requestWindowFeature(Window.FEATURE_NO_TITLE);

        // Detect dark mode
        int nightMode = getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;
        isDark = nightMode == Configuration.UI_MODE_NIGHT_YES;

        // VK color palette
        colorBg = isDark ? Color.parseColor("#19191a") : Color.parseColor("#edeef0");
        colorSurface = isDark ? Color.parseColor("#232324") : Color.parseColor("#ffffff");
        colorStroke = isDark ? Color.parseColor("#333335") : Color.parseColor("#dce1e6");
        colorTextPrimary = isDark ? Color.parseColor("#ffffff") : Color.parseColor("#000000");
        colorTextSecondary = isDark ? Color.parseColor("#909499") : Color.parseColor("#818c99");
        colorAccent = Color.parseColor("#2688eb");

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            Window window = getWindow();
            window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
            window.setStatusBarColor(isDark ? Color.parseColor("#1f1f20") : Color.parseColor("#ffffff"));
            if (!isDark && Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                window.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
            }
        }

        // Root container
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(colorBg);
        root.setLayoutParams(new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        // Top Toolbar with status bar insets
        root.addView(createTopBar());

        // Scrollable content
        ScrollView scrollView = new ScrollView(this);
        scrollView.setLayoutParams(new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.MATCH_PARENT));
        scrollView.setFillViewport(true);

        LinearLayout content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(dp(16), dp(16), dp(16), dp(32));

        // 5 Slots Tabbar Customization Card
        content.addView(createTabbarSlotsCard());

        // Video Quality Card
        content.addView(createVideoQualityCard());

        scrollView.addView(content);
        root.addView(scrollView);

        setContentView(root);
    }

    private int getStatusBarHeight() {
        int result = 0;
        int resId = getResources().getIdentifier("status_bar_height", "dimen", "android");
        if (resId > 0) {
            result = getResources().getDimensionPixelSize(resId);
        }
        if (result <= 0) {
            result = dp(28);
        }
        return result;
    }

    private View createTopBar() {
        int sbHeight = getStatusBarHeight();

        LinearLayout bar = new LinearLayout(this);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        bar.setBackgroundColor(isDark ? Color.parseColor("#1f1f20") : Color.parseColor("#ffffff"));
        bar.setLayoutParams(new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, dp(56) + sbHeight));
        bar.setPadding(dp(4), sbHeight, dp(16), 0);

        // Native VK Back button
        ImageView btnBack = new ImageView(this);
        int iconId = getResources().getIdentifier("vk_icon_arrow_left_outline_28", "drawable", getPackageName());
        if (iconId == 0) {
            iconId = getResources().getIdentifier("ic_arrow_back", "drawable", getPackageName());
        }
        if (iconId == 0) {
            iconId = getResources().getIdentifier("abc_ic_ab_back_material", "drawable", getPackageName());
        }
        if (iconId != 0) {
            btnBack.setImageResource(iconId);
        } else {
            btnBack.setImageDrawable(createBackArrowDrawable(colorTextPrimary));
        }
        btnBack.setColorFilter(colorTextPrimary);
        btnBack.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        btnBack.setPadding(dp(10), dp(10), dp(10), dp(10));

        TypedValue outValue = new TypedValue();
        if (getTheme().resolveAttribute(android.R.attr.selectableItemBackgroundBorderless, outValue, true)) {
            btnBack.setBackgroundResource(outValue.resourceId);
        } else {
            btnBack.setBackground(null);
        }

        LinearLayout.LayoutParams lpBack = new LinearLayout.LayoutParams(dp(48), dp(48));
        btnBack.setLayoutParams(lpBack);
        btnBack.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });
        bar.addView(btnBack);

        // Title
        TextView title = new TextView(this);
        title.setText("Настройки");
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        title.setTextColor(colorTextPrimary);
        LinearLayout.LayoutParams lpTitle = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lpTitle.setMargins(dp(8), 0, 0, 0);
        title.setLayoutParams(lpTitle);
        bar.addView(title);

        return bar;
    }

    private android.graphics.drawable.Drawable createBackArrowDrawable(final int color) {
        return new android.graphics.drawable.Drawable() {
            private final android.graphics.Paint paint = new android.graphics.Paint(android.graphics.Paint.ANTI_ALIAS_FLAG) {{
                setColor(color);
                setStyle(android.graphics.Paint.Style.STROKE);
                setStrokeWidth(dp(2.4f));
                setStrokeCap(android.graphics.Paint.Cap.ROUND);
                setStrokeJoin(android.graphics.Paint.Join.ROUND);
            }};

            @Override
            public void draw(android.graphics.Canvas canvas) {
                android.graphics.Rect b = getBounds();
                float cx = b.exactCenterX();
                float cy = b.exactCenterY();
                float w = dp(16);
                float h = dp(14);
                canvas.drawLine(cx - w / 2, cy, cx + w / 2, cy, paint);
                canvas.drawLine(cx - w / 2, cy, cx - w / 2 + h / 2, cy - h / 2, paint);
                canvas.drawLine(cx - w / 2, cy, cx - w / 2 + h / 2, cy + h / 2, paint);
            }

            @Override
            public void setAlpha(int alpha) { paint.setAlpha(alpha); }

            @Override
            public void setColorFilter(android.graphics.ColorFilter colorFilter) { paint.setColorFilter(colorFilter); }

            @Override
            public int getOpacity() { return android.graphics.PixelFormat.TRANSLUCENT; }
        };
    }

    private View createTabbarSlotsCard() {
        LinearLayout card = createCardLayout();

        final String[] availableTabs = NavigationFilter.availableKeys();

        TextView title = new TextView(this);
        title.setText("Нижняя панель (" + availableTabs.length + " вкладок)");
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        title.setTextColor(colorTextPrimary);
        card.addView(title);

        TextView desc = new TextView(this);
        desc.setText("Состав панели задаёт VK, а порядок — ты. Нажми на слот и выбери, какая вкладка там стоит:");
        desc.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        desc.setTextColor(colorTextSecondary);
        desc.setPadding(0, dp(2), 0, dp(12));
        card.addView(desc);

        slotsContainer = new LinearLayout(this);
        slotsContainer.setOrientation(LinearLayout.VERTICAL);
        refreshSlotsList();
        card.addView(slotsContainer);

        // Apply & Restart button
        TextView btnRestart = new TextView(this);
        btnRestart.setText("Применить и перезапустить VK");
        btnRestart.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        btnRestart.setTypeface(Typeface.DEFAULT_BOLD);
        btnRestart.setTextColor(Color.WHITE);
        btnRestart.setGravity(Gravity.CENTER);
        GradientDrawable btnBg = new GradientDrawable();
        btnBg.setColor(colorAccent);
        btnBg.setCornerRadius(dp(8));
        btnRestart.setBackground(btnBg);
        LinearLayout.LayoutParams lpBtn = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(44));
        lpBtn.setMargins(0, dp(16), 0, dp(8));
        btnRestart.setLayoutParams(lpBtn);
        btnRestart.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                NavigationFilter.restartApp(VkZenSettingsActivity.this);
            }
        });
        card.addView(btnRestart);

        // Reset button
        TextView btnReset = new TextView(this);
        btnReset.setText("Сбросить вкладки по умолчанию");
        btnReset.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        btnReset.setTextColor(colorAccent);
        btnReset.setGravity(Gravity.CENTER);
        btnReset.setPadding(0, dp(8), 0, dp(4));
        btnReset.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                NavigationFilter.saveTabs(VkZenSettingsActivity.this, NavigationFilter.DEFAULT_TABS);
                refreshSlotsList();
                Toast.makeText(VkZenSettingsActivity.this, "Вкладки сброшены по умолчанию!", Toast.LENGTH_SHORT).show();
            }
        });
        card.addView(btnReset);

        // Opt-in: bring back tabs VK knows how to open but left out of this config
        CheckBox addMissing = new CheckBox(this);
        addMissing.setText("Показывать вкладки, которых нет в текущем конфиге VK (экспериментально)");
        addMissing.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        addMissing.setTextColor(colorTextSecondary);
        addMissing.setChecked(NavigationFilter.isAddMissingEnabled());
        LinearLayout.LayoutParams lpMissing = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lpMissing.setMargins(0, dp(8), 0, 0);
        addMissing.setLayoutParams(lpMissing);
        addMissing.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                NavigationFilter.setAddMissing(VkZenSettingsActivity.this, isChecked);
                refreshSlotsList();
                Toast.makeText(VkZenSettingsActivity.this,
                        isChecked ? "Доступные VK вкладки появятся в списке"
                                  : "Синтезированные вкладки убраны из списка",
                        Toast.LENGTH_SHORT).show();
            }
        });
        card.addView(addMissing);

        return card;
    }

    private void refreshSlotsList() {
        if (slotsContainer == null) return;
        slotsContainer.removeAllViews();

        final String[] slots = getCurrentSlots();
        // Hidden tabs would otherwise keep a row and a number, so the numbering stopped matching
        // the positions the bar actually shows. Visible rows come first and carry their real
        // slot number; hidden ones move below with a dash.
        ArrayList<Integer> displayOrder = new ArrayList<>();
        for (int i = 0; i < slots.length; i++) {
            if (!NavigationFilter.isHidden(slots[i])) {
                displayOrder.add(i);
            }
        }
        int visibleCount = displayOrder.size();
        for (int i = 0; i < slots.length; i++) {
            if (NavigationFilter.isHidden(slots[i])) {
                displayOrder.add(i);
            }
        }

        for (int d = 0; d < displayOrder.size(); d++) {
            final int slotIndex = displayOrder.get(d);
            final int displayNumber = d;
            String key = slots[slotIndex];
            String label = NavigationFilter.labelFor(key);
            final boolean tabHidden = NavigationFilter.isHidden(key);

            LinearLayout row = new LinearLayout(this);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setPadding(dp(8), dp(10), dp(8), dp(10));
            row.setBackground(createItemSelectorDrawable(dp(8)));
            row.setClickable(true);

            // Slot badge
            TextView badge = new TextView(this);
            badge.setText(displayNumber < visibleCount ? String.valueOf(displayNumber + 1) : "—");
            badge.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
            badge.setTypeface(Typeface.DEFAULT_BOLD);
            badge.setTextColor(Color.WHITE);
            badge.setGravity(Gravity.CENTER);
            GradientDrawable badgeBg = new GradientDrawable();
            badgeBg.setShape(GradientDrawable.OVAL);
            badgeBg.setColor(tabHidden ? colorTextSecondary : colorAccent);
            badge.setBackground(badgeBg);
            LinearLayout.LayoutParams lpBadge = new LinearLayout.LayoutParams(dp(24), dp(24));
            lpBadge.setMargins(0, 0, dp(12), 0);
            badge.setLayoutParams(lpBadge);
            row.addView(badge);

            // Slot text
            TextView text = new TextView(this);
            text.setText(label + (tabHidden ? " (скрыта)" : ""));
            text.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
            text.setTextColor(tabHidden ? colorTextSecondary : colorTextPrimary);
            LinearLayout.LayoutParams lpText = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f);
            text.setLayoutParams(lpText);
            row.addView(text);

            // Visibility toggle: hide the tab without removing it from VK's config
            final String rowKey = key;
            CheckBox visibleBox = new CheckBox(this);
            visibleBox.setChecked(!tabHidden);
            LinearLayout.LayoutParams lpBox = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            lpBox.setMargins(0, 0, dp(8), 0);
            visibleBox.setLayoutParams(lpBox);
            visibleBox.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
                @Override
                public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                    NavigationFilter.setHidden(VkZenSettingsActivity.this, rowKey, !isChecked);
                    refreshSlotsList();
                    Toast.makeText(VkZenSettingsActivity.this,
                            isChecked ? "Вкладка вернётся после перезапуска"
                                      : "Вкладка скроется после перезапуска",
                            Toast.LENGTH_SHORT).show();
                }
            });
            row.addView(visibleBox);

            // Arrow
            TextView arrow = new TextView(this);
            arrow.setText("›");
            arrow.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20);
            arrow.setTextColor(colorTextSecondary);
            row.addView(arrow);

            row.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    showSlotPicker(slotIndex, slots);
                }
            });

            slotsContainer.addView(row);

            if (displayNumber < displayOrder.size() - 1) {
                View divider = new View(this);
                divider.setBackgroundColor(colorStroke);
                LinearLayout.LayoutParams lpDiv = new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, 1);
                lpDiv.setMargins(dp(44), 0, 0, 0);
                divider.setLayoutParams(lpDiv);
                slotsContainer.addView(divider);
            }
        }
    }

    private void showSlotPicker(final int slotIndex, final String[] slots) {
        final Dialog dialog = new Dialog(this);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);

        LinearLayout dialogRoot = new LinearLayout(this);
        dialogRoot.setOrientation(LinearLayout.VERTICAL);
        dialogRoot.setPadding(0, dp(20), 0, dp(12));
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            dialogRoot.setClipToOutline(true);
        }

        GradientDrawable bg = new GradientDrawable();
        bg.setColor(colorSurface);
        bg.setCornerRadius(dp(16));
        bg.setStroke(dp(1), colorStroke);
        dialogRoot.setBackground(bg);

        // Title
        TextView title = new TextView(this);
        title.setText("Выберите вкладку для слота " + (slotIndex + 1));
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 18);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        title.setTextColor(colorTextPrimary);
        title.setPadding(dp(24), 0, dp(24), dp(14));
        dialogRoot.addView(title);

        // Scrollable list of options
        ScrollView sv = new ScrollView(this);
        LinearLayout listLayout = new LinearLayout(this);
        listLayout.setOrientation(LinearLayout.VERTICAL);

        String[] available = NavigationFilter.choiceKeys();
        for (int j = 0; j < available.length; j++) {
            final String key = available[j];
            final String label = NavigationFilter.labelFor(key);
            final boolean isSelected = key.equalsIgnoreCase(slots[slotIndex]);

            LinearLayout row = new LinearLayout(this);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setPadding(dp(24), dp(12), dp(24), dp(12));
            row.setBackground(createItemSelectorDrawable(0));
            row.setClickable(true);

            // Radio circle
            TextView radio = new TextView(this);
            radio.setGravity(Gravity.CENTER);
            GradientDrawable circleBg = new GradientDrawable();
            circleBg.setShape(GradientDrawable.OVAL);
            if (isSelected) {
                circleBg.setColor(colorAccent);
                circleBg.setStroke(dp(2), colorAccent);
                radio.setText("✓");
                radio.setTextColor(Color.WHITE);
                radio.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11);
                radio.setTypeface(Typeface.DEFAULT_BOLD);
            } else {
                circleBg.setColor(Color.TRANSPARENT);
                circleBg.setStroke(dp(2), colorTextSecondary);
            }
            radio.setBackground(circleBg);
            LinearLayout.LayoutParams lpRadio = new LinearLayout.LayoutParams(dp(20), dp(20));
            lpRadio.setMargins(0, 0, dp(14), 0);
            radio.setLayoutParams(lpRadio);
            row.addView(radio);

            // Text
            TextView itemText = new TextView(this);
            itemText.setText(label);
            itemText.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
            itemText.setTextColor(isSelected ? colorAccent : colorTextPrimary);
            if (isSelected) {
                itemText.setTypeface(Typeface.DEFAULT_BOLD);
            }
            row.addView(itemText);

            row.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    // Placing a tab into a slot means the user wants it visible; "hidden" is a
                    // property of the tab, so without this it kept its hidden flag and the bar
                    // looked unchanged.
                    if (NavigationFilter.isHidden(key)) {
                        NavigationFilter.setHidden(VkZenSettingsActivity.this, key, false);
                    }
                    // Swapping keeps the list a strict permutation: without this the chosen tab
                    // appears twice and the displaced one silently drops out of the order.
                    for (int k = 0; k < slots.length; k++) {
                        if (k != slotIndex && key.equalsIgnoreCase(slots[k])) {
                            slots[k] = slots[slotIndex];
                            break;
                        }
                    }
                    slots[slotIndex] = key;
                    String stored = NavigationFilter.getEffectiveTabs(
                            NavigationFilter.getPrefs(VkZenSettingsActivity.this));
                    NavigationFilter.saveTabs(VkZenSettingsActivity.this,
                            NavigationFilter.mergeOrder(stored, slots));
                    refreshSlotsList();
                    dialog.dismiss();
                    Toast.makeText(VkZenSettingsActivity.this, "Слот " + (slotIndex + 1) + ": " + label, Toast.LENGTH_SHORT).show();
                }
            });

            listLayout.addView(row);
        }

        sv.addView(listLayout);
        dialogRoot.addView(sv, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));

        // Cancel button
        TextView btnCancel = new TextView(this);
        btnCancel.setText("ОТМЕНА");
        btnCancel.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        btnCancel.setTypeface(Typeface.DEFAULT_BOLD);
        btnCancel.setTextColor(colorAccent);
        btnCancel.setGravity(Gravity.RIGHT | Gravity.CENTER_VERTICAL);
        btnCancel.setPadding(dp(24), dp(14), dp(24), dp(4));
        btnCancel.setBackground(createItemSelectorDrawable(dp(8)));
        btnCancel.setClickable(true);
        btnCancel.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                dialog.dismiss();
            }
        });
        dialogRoot.addView(btnCancel);

        dialog.setContentView(dialogRoot);
        if (dialog.getWindow() != null) {
            dialog.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            dialog.getWindow().setLayout((int) (getResources().getDisplayMetrics().widthPixels * 0.90f),
                    ViewGroup.LayoutParams.WRAP_CONTENT);
        }
        dialog.show();
    }

    private String[] getCurrentSlots() {
        SharedPreferences prefs = NavigationFilter.getPrefs(this);
        return NavigationFilter.displayOrder(NavigationFilter.getEffectiveTabs(prefs));
    }

    private View createVideoQualityCard() {
        LinearLayout card = createCardLayout();

        TextView title = new TextView(this);
        title.setText("Качество видео");
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        title.setTextColor(colorTextPrimary);
        card.addView(title);

        TextView desc = new TextView(this);
        desc.setText("Предпочтительное качество при просмотре видео и фильмов:");
        desc.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        desc.setTextColor(colorTextSecondary);
        desc.setPadding(0, dp(2), 0, dp(12));
        card.addView(desc);

        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(8), dp(10), dp(8), dp(10));
        row.setBackground(createItemSelectorDrawable(dp(8)));
        row.setClickable(true);

        // Quality icon badge
        TextView badge = new TextView(this);
        badge.setText("HD");
        badge.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11);
        badge.setTypeface(Typeface.DEFAULT_BOLD);
        badge.setTextColor(Color.WHITE);
        badge.setGravity(Gravity.CENTER);
        GradientDrawable badgeBg = new GradientDrawable();
        badgeBg.setCornerRadius(dp(6));
        badgeBg.setColor(colorAccent);
        badge.setBackground(badgeBg);
        LinearLayout.LayoutParams lpBadge = new LinearLayout.LayoutParams(dp(28), dp(24));
        lpBadge.setMargins(0, 0, dp(12), 0);
        badge.setLayoutParams(lpBadge);
        row.addView(badge);

        LinearLayout textLayout = new LinearLayout(this);
        textLayout.setOrientation(LinearLayout.VERTICAL);
        textLayout.setLayoutParams(new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f));

        tvVideoQualityTitle = new TextView(this);
        tvVideoQualityTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        tvVideoQualityTitle.setTypeface(Typeface.DEFAULT_BOLD);
        tvVideoQualityTitle.setTextColor(colorTextPrimary);
        textLayout.addView(tvVideoQualityTitle);

        tvVideoQualitySubtitle = new TextView(this);
        tvVideoQualitySubtitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        tvVideoQualitySubtitle.setTextColor(colorTextSecondary);
        textLayout.addView(tvVideoQualitySubtitle);

        row.addView(textLayout);

        // Arrow indicator
        TextView arrow = new TextView(this);
        arrow.setText("›");
        arrow.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20);
        arrow.setTextColor(colorTextSecondary);
        arrow.setPadding(dp(8), 0, dp(4), 0);
        row.addView(arrow);

        refreshVideoQualityText();

        row.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showVideoQualityDialog();
            }
        });

        card.addView(row);
        return card;
    }

    private void refreshVideoQualityText() {
        if (tvVideoQualityTitle == null) return;
        String current = VideoQualityHelper.getPreferredQualitySetting();
        tvVideoQualityTitle.setText(VideoQualityHelper.getQualityTitle(current));
        tvVideoQualitySubtitle.setText(VideoQualityHelper.getQualitySubtitle(current));
    }

    private void showVideoQualityDialog() {
        final Dialog dialog = new Dialog(this);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);

        LinearLayout dialogRoot = new LinearLayout(this);
        dialogRoot.setOrientation(LinearLayout.VERTICAL);
        dialogRoot.setPadding(0, dp(20), 0, dp(12));
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            dialogRoot.setClipToOutline(true);
        }

        GradientDrawable bg = new GradientDrawable();
        bg.setColor(colorSurface);
        bg.setCornerRadius(dp(16));
        bg.setStroke(dp(1), colorStroke);
        dialogRoot.setBackground(bg);

        // Title
        TextView title = new TextView(this);
        title.setText("Качество видео");
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 18);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        title.setTextColor(colorTextPrimary);
        title.setPadding(dp(24), 0, dp(24), dp(14));
        dialogRoot.addView(title);

        ScrollView sv = new ScrollView(this);
        LinearLayout listLayout = new LinearLayout(this);
        listLayout.setOrientation(LinearLayout.VERTICAL);

        final String currentQuality = VideoQualityHelper.getPreferredQualitySetting();

        for (int i = 0; i < VideoQualityHelper.QUALITY_VALUES.length; i++) {
            final String val = VideoQualityHelper.QUALITY_VALUES[i];
            final String qTitle = VideoQualityHelper.QUALITY_TITLES[i];
            final String qSub = VideoQualityHelper.QUALITY_SUBTITLES[i];
            final boolean isSelected = val.equalsIgnoreCase(currentQuality);

            LinearLayout row = new LinearLayout(this);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setPadding(dp(24), dp(12), dp(24), dp(12));
            row.setBackground(createItemSelectorDrawable(0));
            row.setClickable(true);

            // Radio circle
            TextView radio = new TextView(this);
            radio.setGravity(Gravity.CENTER);
            GradientDrawable circleBg = new GradientDrawable();
            circleBg.setShape(GradientDrawable.OVAL);
            if (isSelected) {
                circleBg.setColor(colorAccent);
                circleBg.setStroke(dp(2), colorAccent);
                radio.setText("✓");
                radio.setTextColor(Color.WHITE);
                radio.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11);
                radio.setTypeface(Typeface.DEFAULT_BOLD);
            } else {
                circleBg.setColor(Color.TRANSPARENT);
                circleBg.setStroke(dp(2), colorTextSecondary);
            }
            radio.setBackground(circleBg);
            LinearLayout.LayoutParams lpRadio = new LinearLayout.LayoutParams(dp(20), dp(20));
            lpRadio.setMargins(0, 0, dp(14), 0);
            radio.setLayoutParams(lpRadio);
            row.addView(radio);

            // Text column
            LinearLayout textCol = new LinearLayout(this);
            textCol.setOrientation(LinearLayout.VERTICAL);
            textCol.setLayoutParams(new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f));

            TextView itemText = new TextView(this);
            itemText.setText(qTitle);
            itemText.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
            itemText.setTextColor(isSelected ? colorAccent : colorTextPrimary);
            if (isSelected) {
                itemText.setTypeface(Typeface.DEFAULT_BOLD);
            }
            textCol.addView(itemText);

            if (qSub != null && !qSub.isEmpty()) {
                TextView subText = new TextView(this);
                subText.setText(qSub);
                subText.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
                subText.setTextColor(colorTextSecondary);
                textCol.addView(subText);
            }
            row.addView(textCol);

            row.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    VideoQualityHelper.savePreferredQuality(VkZenSettingsActivity.this, val);
                    refreshVideoQualityText();
                    dialog.dismiss();
                    Toast.makeText(VkZenSettingsActivity.this, "Качество видео: " + qTitle, Toast.LENGTH_SHORT).show();
                }
            });

            listLayout.addView(row);
        }

        sv.addView(listLayout);
        dialogRoot.addView(sv, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));

        // Cancel button
        TextView btnCancel = new TextView(this);
        btnCancel.setText("ОТМЕНА");
        btnCancel.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        btnCancel.setTypeface(Typeface.DEFAULT_BOLD);
        btnCancel.setTextColor(colorAccent);
        btnCancel.setGravity(Gravity.RIGHT | Gravity.CENTER_VERTICAL);
        btnCancel.setPadding(dp(24), dp(14), dp(24), dp(4));
        btnCancel.setBackground(createItemSelectorDrawable(dp(8)));
        btnCancel.setClickable(true);
        btnCancel.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                dialog.dismiss();
            }
        });
        dialogRoot.addView(btnCancel);

        dialog.setContentView(dialogRoot);
        if (dialog.getWindow() != null) {
            dialog.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            dialog.getWindow().setLayout((int) (getResources().getDisplayMetrics().widthPixels * 0.90f),
                    ViewGroup.LayoutParams.WRAP_CONTENT);
        }
        dialog.show();
    }

    private LinearLayout createCardLayout() {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);

        GradientDrawable bg = new GradientDrawable();
        bg.setColor(colorSurface);
        bg.setCornerRadius(dp(12));
        bg.setStroke(dp(1), colorStroke);
        card.setBackground(bg);

        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.setMargins(0, 0, 0, dp(12));
        card.setLayoutParams(lp);
        card.setPadding(dp(16), dp(16), dp(16), dp(16));

        return card;
    }

    private Drawable createItemSelectorDrawable() {
        return createItemSelectorDrawable(0);
    }

    private Drawable createItemSelectorDrawable(int cornerRadius) {
        int rippleColor = isDark ? Color.parseColor("#33ffffff") : Color.parseColor("#1f000000");
        Drawable mask;
        if (cornerRadius > 0) {
            GradientDrawable gd = new GradientDrawable();
            gd.setCornerRadius(cornerRadius);
            gd.setColor(Color.WHITE);
            mask = gd;
        } else {
            mask = new ColorDrawable(Color.WHITE);
        }
        return new RippleDrawable(
                ColorStateList.valueOf(rippleColor),
                null,
                mask
        );
    }

    private int dp(float dp) {
        return (int) TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, dp, getResources().getDisplayMetrics());
    }
}
