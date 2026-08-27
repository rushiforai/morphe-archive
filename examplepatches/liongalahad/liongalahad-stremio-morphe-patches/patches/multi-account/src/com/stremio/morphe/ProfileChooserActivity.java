package com.stremio.morphe;

import android.app.Activity;
import android.app.ActivityManager;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.StateListDrawable;
import android.os.Bundle;
import android.text.Editable;
import android.text.InputFilter;
import android.text.InputType;
import android.text.TextWatcher;
import android.util.Base64;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.List;

import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

public final class ProfileChooserActivity extends Activity implements View.OnClickListener {
    public static final String EXTRA_CANCEL_PENDING_ACCOUNT = "morphe.cancel_pending_account";
    private static final String EXTRA_VERIFY_TRANSLATIONS = "morphe.verify_translations";
    private interface PinCallback { void accept(String pin); }

    private static final class CenteredGlyphButton extends Button {
        private String glyph = "";

        CenteredGlyphButton(Context context) { super(context); }

        void setGlyph(String value) {
            glyph = value == null ? "" : value;
            setText("");
            invalidate();
        }

        @Override
        protected void onDraw(Canvas canvas) {
            if (glyph.isEmpty()) return;
            android.graphics.Paint paint = getPaint();
            paint.setColor(getCurrentTextColor());
            paint.setTextAlign(android.graphics.Paint.Align.LEFT);
            Rect bounds = new Rect();
            paint.getTextBounds(glyph, 0, glyph.length(), bounds);
            float x = (getWidth() - bounds.width()) / 2f - bounds.left;
            float y = (getHeight() - bounds.height()) / 2f - bounds.top;
            canvas.drawText(glyph, x, y, paint);
        }
    }

    private static final class BackDismissEditText extends EditText {
        private Runnable backAction;
        private Runnable submitAction;
        private long lastSubmitTime;

        BackDismissEditText(Context context) { super(context); }

        void setBackAction(Runnable action) { backAction = action; }

        void setSubmitAction(Runnable action) { submitAction = action; }

        void dispatchSubmit() {
            long now = android.os.SystemClock.uptimeMillis();
            if (submitAction != null && now - lastSubmitTime > 300L) {
                lastSubmitTime = now;
                submitAction.run();
            }
        }

        private boolean isSubmitKey(int keyCode) {
            return keyCode == KeyEvent.KEYCODE_ENTER || keyCode == KeyEvent.KEYCODE_NUMPAD_ENTER;
        }

        @Override
        public boolean onKeyDown(int keyCode, KeyEvent event) {
            if (isSubmitKey(keyCode)) return true;
            return super.onKeyDown(keyCode, event);
        }

        @Override
        public boolean onKeyUp(int keyCode, KeyEvent event) {
            if (isSubmitKey(keyCode)) {
                dispatchSubmit();
                return true;
            }
            return super.onKeyUp(keyCode, event);
        }

        @Override
        public boolean onKeyPreIme(int keyCode, KeyEvent event) {
            if (keyCode == KeyEvent.KEYCODE_BACK) {
                if (event.getAction() == KeyEvent.ACTION_UP && backAction != null) backAction.run();
                return true;
            }
            return super.onKeyPreIme(keyCode, event);
        }
    }

    private static final String TAG = "MorpheAccounts";
    private static final String META = "morphe_profiles";
    private static final String IDS = "profile_ids";
    private static final String NEXT = "next_profile";
    private static final String NAME = "name.";
    private static final String MANUAL_NAME = "manual_name.";
    private static final String COLOR = "color.";
    private static final String PIN_SALT = "pin_salt.";
    private static final String PIN_HASH = "pin_hash.";
    private static final String ISOLATION_VERSION = "isolation_version";
    private static final int CURRENT_ISOLATION_VERSION = 2;
    private static final String ACCOUNT_A = "account_a";
    private static final String ACCOUNT_B = "account_b";
    private static final int MAX_PROFILES = 5;
    private static final int PROFILE_ID_BASE = 0x4d4f5200;
    private static final int ADD_ID = 0x4d4f5280;
    private static final int EXIT_ID = 0x4d4f5283;
    private static final int[] PALETTE = new int[] {
            Color.rgb(116, 82, 246), Color.rgb(47, 111, 237),
            Color.rgb(0, 137, 123), Color.rgb(46, 125, 50),
            Color.rgb(245, 124, 0), Color.rgb(198, 40, 40),
            Color.rgb(173, 20, 87), Color.rgb(69, 79, 99)
    };
    private final List<String> profileIds = new ArrayList<String>();
    private final List<Button> avatars = new ArrayList<Button>();
    private final List<TextView> names = new ArrayList<TextView>();
    private final List<TextView> badges = new ArrayList<TextView>();
    private SharedPreferences profilePrefs;
    private String activeSlot;
    private String selectedSlot;
    private LinearLayout profileRow;
    private Button addButton;
    private Button exitButton;
    private TextView hint;
    private Typeface appRegular;
    private Typeface appSemibold;
    private MorpheStrings strings;
    private boolean controlsLocked;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Window window = getWindow();
        window.addFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN);
        window.setStatusBarColor(Color.rgb(12, 11, 18));
        window.setNavigationBarColor(Color.rgb(12, 11, 18));

        appRegular = appTypeface("plusjakartasans_regular", Typeface.DEFAULT);
        appSemibold = appTypeface("plusjakartasans_semibold", Typeface.DEFAULT_BOLD);

        profilePrefs = MorpheIsolation.freshProfileMetadata(this);
        String startupIsolationError = null;
        boolean cancelPending = getIntent().getBooleanExtra(EXTRA_CANCEL_PENDING_ACCOUNT, false);
        if (!MorpheIsolation.reconcilePendingAccount(this, cancelPending)) {
            startupIsolationError = "Could not remove the incomplete account: "
                    + MorpheIsolation.getLastError();
        }
        profilePrefs = MorpheIsolation.freshProfileMetadata(this);
        initializeProfiles();
        if (profileIds.isEmpty()) {
            activeSlot = null;
        } else {
            activeSlot = MorpheIsolation.activeSlot(this, profileIds.get(0));
            if (!profileIds.contains(activeSlot)) {
                String previousSlot = activeSlot;
                activeSlot = profileIds.get(0);
                if (!MorpheIsolation.commitActiveSlot(this, previousSlot, activeSlot)) {
                    Log.e(TAG, "Could not repair active account: " + MorpheIsolation.getLastError());
                }
            }
        }
        strings = MorpheStrings.forAccount(this, activeSlot);
        boolean verifyTranslations = getIntent().getBooleanExtra(EXTRA_VERIFY_TRANSLATIONS, false);
        Log.i(TAG, "Account picker locale=" + strings.localeTag()
                + ", supported=" + MorpheStrings.supportedLocaleCount()
                + (verifyTranslations ? ", catalogueComplete="
                + MorpheStrings.verifySupportedTranslations() : ""));
        syncAutomaticProfileNames();
        selectedSlot = activeSlot;

        if (profileIds.isEmpty()) {
            if (!profilePrefs.edit().putInt(ISOLATION_VERSION, CURRENT_ISOLATION_VERSION).commit()) {
                startupIsolationError = "Could not initialize account storage";
            }
        } else if (profilePrefs.getInt(ISOLATION_VERSION, 0) < CURRENT_ISOLATION_VERSION) {
            if (!MorpheIsolation.migrateLegacyBoundaryData(this)) {
                startupIsolationError = "Isolation cleanup failed: " + MorpheIsolation.getLastError();
            } else if (!profilePrefs.edit().putInt(ISOLATION_VERSION, CURRENT_ISOLATION_VERSION).commit()) {
                startupIsolationError = "Could not record the isolation upgrade";
            }
        }
        if (startupIsolationError != null) startupIsolationError = localizedError(startupIsolationError);

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setGravity(Gravity.CENTER_HORIZONTAL);
        root.setPadding(dp(36), dp(24), dp(36), dp(22));
        root.setBackgroundColor(Color.rgb(12, 11, 18));

        TextView title = text(strings.chooseAccount(), 30, Color.WHITE);
        title.setTypeface(appSemibold);
        title.setGravity(Gravity.CENTER);
        root.addView(title, new LinearLayout.LayoutParams(-2, -2));

        TextView subtitle = text(strings.accountPrivacy(), 16,
                Color.rgb(183, 181, 194));
        subtitle.setGravity(Gravity.CENTER);
        LinearLayout.LayoutParams subtitleParams = new LinearLayout.LayoutParams(-2, -2);
        subtitleParams.topMargin = dp(6);
        subtitleParams.bottomMargin = dp(19);
        root.addView(subtitle, subtitleParams);

        HorizontalScrollView scroll = new HorizontalScrollView(this);
        scroll.setHorizontalScrollBarEnabled(false);
        scroll.setFillViewport(true);
        profileRow = new LinearLayout(this);
        profileRow.setOrientation(LinearLayout.HORIZONTAL);
        profileRow.setGravity(Gravity.CENTER);
        scroll.addView(profileRow, new HorizontalScrollView.LayoutParams(-2, -2));
        root.addView(scroll, new LinearLayout.LayoutParams(-1, dp(184)));

        String defaultHint = strings.pickerHint(profileIds.isEmpty());
        hint = text(defaultHint, 15, Color.rgb(183, 181, 194));
        if (startupIsolationError != null) hint.setText(startupIsolationError);
        hint.setGravity(Gravity.CENTER);
        LinearLayout.LayoutParams hintParams = new LinearLayout.LayoutParams(-2, -2);
        hintParams.topMargin = dp(9);
        root.addView(hint, hintParams);

        exitButton = new Button(this);
        exitButton.setId(EXIT_ID);
        exitButton.setTag("exit");
        exitButton.setText(strings.quit());
        exitButton.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        exitButton.setTextColor(Color.WHITE);
        exitButton.setTypeface(appSemibold);
        exitButton.setAllCaps(false);
        exitButton.setFocusableInTouchMode(true);
        exitButton.setOnClickListener(this);
        exitButton.setBackground(actionBackground());
        LinearLayout.LayoutParams exitParams = new LinearLayout.LayoutParams(dp(190), dp(54));
        exitParams.topMargin = dp(17);
        root.addView(exitButton, exitParams);

        setContentView(root);
        rebuildProfiles();
        requestSelectedFocus();
    }

    private void initializeProfiles() {
        profileIds.clear();
        String stored = profilePrefs.getString(IDS, "");
        if (stored != null && !stored.isEmpty()) {
            for (String id : stored.split("\\|")) {
                if (isValidSlot(id) && !profileIds.contains(id) && profileIds.size() < MAX_PROFILES) {
                    profileIds.add(id);
                }
            }
        }
        SharedPreferences.Editor editor = profilePrefs.edit();
        if (!profilePrefs.contains(NEXT)) editor.putInt(NEXT, 1);
        for (int i = 0; i < profileIds.size(); i++) {
            String id = profileIds.get(i);
            if (!profilePrefs.contains(NAME + id)) {
                editor.putString(NAME + id, "Profile " + (i + 1));
            }
            if (!profilePrefs.contains(MANUAL_NAME + id)) {
                String fallback = ACCOUNT_A.equals(id) ? "Account A"
                        : ACCOUNT_B.equals(id) ? "Account B" : "Profile " + (i + 1);
                String storedName = profilePrefs.getString(NAME + id, fallback);
                if (storedName != null && !fallback.equals(storedName.trim())) {
                    editor.putBoolean(MANUAL_NAME + id, true);
                }
            }
            if (!profilePrefs.contains(COLOR + id)) {
                editor.putInt(COLOR + id, PALETTE[i % PALETTE.length]);
            }
        }
        editor.apply();
    }

    private void rebuildProfiles() {
        profileRow.removeAllViews();
        avatars.clear();
        names.clear();
        badges.clear();

        for (int i = 0; i < profileIds.size(); i++) {
            final String slot = profileIds.get(i);
            LinearLayout item = new LinearLayout(this);
            item.setOrientation(LinearLayout.VERTICAL);
            item.setGravity(Gravity.CENTER_HORIZONTAL);

            Button avatar = avatarButton(PROFILE_ID_BASE + i, slot);
            avatar.setOnFocusChangeListener(new View.OnFocusChangeListener() {
                @Override public void onFocusChange(View view, boolean focused) {
                    if (focused) {
                        selectedSlot = slot;
                        refreshProfiles();
                    }
                }
            });
            avatar.setOnLongClickListener(new View.OnLongClickListener() {
                @Override public boolean onLongClick(View view) {
                    if (controlsLocked) return true;
                    selectedSlot = slot;
                    manageProfile(slot);
                    return true;
                }
            });
            if (i > 0) avatar.setNextFocusLeftId(PROFILE_ID_BASE + i - 1);
            avatar.setNextFocusDownId(EXIT_ID);
            item.addView(avatar, new LinearLayout.LayoutParams(dp(106), dp(106)));

            TextView label = text(profileName(slot), 17, Color.WHITE);
            label.setTypeface(appSemibold);
            label.setGravity(Gravity.CENTER);
            label.setSingleLine(true);
            LinearLayout.LayoutParams labelParams = new LinearLayout.LayoutParams(dp(150), dp(35));
            labelParams.topMargin = dp(6);
            item.addView(label, labelParams);

            TextView badge = text("", 12, Color.rgb(164, 140, 255));
            badge.setGravity(Gravity.CENTER);
            item.addView(badge, new LinearLayout.LayoutParams(dp(150), dp(26)));

            avatars.add(avatar);
            names.add(label);
            badges.add(badge);
            LinearLayout.LayoutParams itemParams = new LinearLayout.LayoutParams(dp(166), dp(176));
            itemParams.leftMargin = dp(5);
            itemParams.rightMargin = dp(5);
            profileRow.addView(item, itemParams);
        }

        LinearLayout addItem = new LinearLayout(this);
        addItem.setOrientation(LinearLayout.VERTICAL);
        addItem.setGravity(Gravity.CENTER_HORIZONTAL);
        addButton = avatarButton(ADD_ID, "add");
        addButton.setTextSize(TypedValue.COMPLEX_UNIT_SP, 42);
        ((CenteredGlyphButton) addButton).setGlyph("+");
        addButton.setContentDescription(strings.addAccount());
        addButton.setEnabled(profileIds.size() < MAX_PROFILES);
        addButton.setNextFocusDownId(EXIT_ID);
        if (!avatars.isEmpty()) {
            avatars.get(avatars.size() - 1).setNextFocusRightId(ADD_ID);
            addButton.setNextFocusLeftId(PROFILE_ID_BASE + avatars.size() - 1);
        }
        addItem.addView(addButton, new LinearLayout.LayoutParams(dp(106), dp(106)));
        TextView addLabel = text(strings.addAccount(), 17,
                profileIds.size() < MAX_PROFILES ? Color.WHITE : Color.rgb(105, 103, 114));
        addLabel.setGravity(Gravity.CENTER);
        MorpheTextFit.apply(addLabel, strings.addAccount(), 17f, dp(148));
        LinearLayout.LayoutParams addLabelParams = new LinearLayout.LayoutParams(dp(150), dp(35));
        addLabelParams.topMargin = dp(6);
        addItem.addView(addLabel, addLabelParams);
        addItem.addView(text("", 12, Color.TRANSPARENT), new LinearLayout.LayoutParams(dp(150), dp(26)));
        LinearLayout.LayoutParams addItemParams = new LinearLayout.LayoutParams(dp(166), dp(176));
        addItemParams.leftMargin = dp(5);
        addItemParams.rightMargin = dp(5);
        profileRow.addView(addItem, addItemParams);
        refreshProfiles();
    }

    private Button avatarButton(int id, String tag) {
        Button button = "add".equals(tag) ? new CenteredGlyphButton(this) : new Button(this);
        button.setId(id);
        button.setTag(tag);
        button.setTextSize(TypedValue.COMPLEX_UNIT_SP, 36);
        button.setTypeface(appSemibold);
        button.setTextColor(Color.WHITE);
        button.setAllCaps(false);
        button.setGravity(Gravity.CENTER);
        button.setTextAlignment(View.TEXT_ALIGNMENT_CENTER);
        button.setIncludeFontPadding(false);
        button.setPadding(0, 0, 0, 0);
        button.setMinWidth(0);
        button.setMinHeight(0);
        button.setFocusable(true);
        button.setFocusableInTouchMode(true);
        button.setOnClickListener(this);
        button.setLongClickable(true);
        return button;
    }

    private void refreshProfiles() {
        for (int i = 0; i < avatars.size(); i++) {
            String slot = profileIds.get(i);
            String name = profileName(slot);
            boolean active = slot.equals(activeSlot);
            avatars.get(i).setText(initial(name));
            avatars.get(i).setBackground(avatarBackground(profileColor(slot)));
            avatars.get(i).setContentDescription(name + (hasPin(slot) ? ", " + strings.pinProtected() : ""));
            MorpheTextFit.apply(names.get(i), name, 17f, dp(148));
            badges.get(i).setText(active ? "● " + strings.active() : hasPin(slot) ? "PIN" : "");
        }
        if (addButton != null) {
            addButton.setBackground(avatarBackground(Color.rgb(45, 43, 55)));
        }
    }

    private void requestSelectedFocus() {
        int index = profileIds.indexOf(selectedSlot);
        if (index < 0) index = 0;
        if (index < avatars.size()) avatars.get(index).requestFocus();
        else if (addButton != null) addButton.requestFocus();
    }

    private void restoreChooserFocus() {
        if (profileRow != null) {
            profileRow.postDelayed(new Runnable() {
                @Override public void run() { requestSelectedFocus(); }
            }, 150L);
        }
    }

    private String profileName(String slot) {
        String fallback = ACCOUNT_A.equals(slot) ? "Account A" : ACCOUNT_B.equals(slot) ? "Account B" : "Profile";
        String value = profilePrefs.getString(NAME + slot, fallback);
        return value == null || value.trim().isEmpty() ? fallback : value.trim();
    }

    private void syncAutomaticProfileNames() {
        for (String slot : profileIds) {
            MorpheIsolation.synchronizedProfileName(this, slot);
        }
    }

    private String initial(String value) {
        if (value == null) return "?";
        String trimmed = value.trim();
        return trimmed.isEmpty() ? "?" : trimmed.substring(0, 1).toUpperCase();
    }

    private int profileColor(String slot) {
        int index = Math.max(0, profileIds.indexOf(slot));
        return profilePrefs.getInt(COLOR + slot, PALETTE[index % PALETTE.length]);
    }

    private StateListDrawable avatarBackground(int color) {
        int outline = blend(color, Color.WHITE, 0.48f);
        GradientDrawable focused = oval(color);
        focused.setStroke(dp(4), outline);
        GradientDrawable normal = oval(color);
        normal.setStroke(dp(2), outline);
        GradientDrawable disabled = oval(Color.rgb(28, 27, 34));
        StateListDrawable states = new StateListDrawable();
        states.addState(new int[]{-android.R.attr.state_enabled}, disabled);
        states.addState(new int[]{android.R.attr.state_focused}, focused);
        states.addState(new int[]{}, normal);
        return states;
    }

    private GradientDrawable oval(int color) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setShape(GradientDrawable.OVAL);
        drawable.setColor(color);
        return drawable;
    }

    private StateListDrawable actionBackground() {
        GradientDrawable focused = rounded(Color.rgb(116, 82, 246));
        focused.setStroke(dp(2), Color.WHITE);
        GradientDrawable normal = rounded(Color.rgb(35, 33, 45));
        normal.setStroke(dp(1), Color.rgb(70, 67, 83));
        StateListDrawable states = new StateListDrawable();
        states.addState(new int[]{android.R.attr.state_focused}, focused);
        states.addState(new int[]{}, normal);
        return states;
    }

    private GradientDrawable rounded(int color) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setColor(color);
        drawable.setCornerRadius(dp(10));
        return drawable;
    }

    private int blend(int from, int to, float amount) {
        float inverse = 1f - amount;
        return Color.rgb(
                Math.round(Color.red(from) * inverse + Color.red(to) * amount),
                Math.round(Color.green(from) * inverse + Color.green(to) * amount),
                Math.round(Color.blue(from) * inverse + Color.blue(to) * amount));
    }

    private TextView text(String value, int sp, int color) {
        TextView view = new TextView(this);
        view.setText(value);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        view.setTextColor(color);
        view.setTypeface(appRegular);
        view.setIncludeFontPadding(false);
        return view;
    }

    private Typeface appTypeface(String name, Typeface fallback) {
        int id = getResources().getIdentifier(name, "font", getPackageName());
        if (id == 0) return fallback;
        try { return getResources().getFont(id); }
        catch (Exception ignored) { return fallback; }
    }

    private void applyAppTypeface(View view) {
        if (view instanceof TextView) {
            TextView textView = (TextView) view;
            textView.setTypeface(view instanceof Button ? appSemibold : appRegular);
        }
        if (view instanceof android.view.ViewGroup) {
            android.view.ViewGroup group = (android.view.ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) applyAppTypeface(group.getChildAt(i));
        }
    }

    private void applyDialogTypeface(AlertDialog dialog) {
        if (dialog.getWindow() != null) applyAppTypeface(dialog.getWindow().getDecorView());
    }

    private int dp(int value) {
        return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value,
                getResources().getDisplayMetrics()));
    }

    @Override
    public void onClick(View view) {
        if (controlsLocked) return;
        Object value = view.getTag();
        if (!(value instanceof String)) return;
        String tag = (String) value;
        if (profileIds.contains(tag)) {
            selectedSlot = tag;
            requestAccessAndOpen(tag);
        } else if ("add".equals(tag)) {
            addProfile();
        } else if ("exit".equals(tag)) {
            exitStremio();
        }
    }

    private void manageProfile(final String slot) {
        showProfileOptions(slot);
    }

    private void showProfileOptions(final String slot) {
        final boolean protectedProfile = hasPin(slot);
        String[] options = new String[] {
                strings.rename(), strings.changeColor(),
                protectedProfile ? strings.removePin() : strings.addPin(), strings.removeAccount()
        };
        AlertDialog dialog = new AlertDialog.Builder(this)
                .setTitle(profileName(slot))
                .setItems(options, new DialogInterface.OnClickListener() {
                    @Override public void onClick(DialogInterface dialog, int which) {
                        if (which == 0) authorizeManagement(slot, new Runnable() {
                            @Override public void run() { renameDialog(slot); }
                        });
                        else if (which == 1) authorizeManagement(slot, new Runnable() {
                            @Override public void run() { colorDialog(slot); }
                        });
                        else if (which == 2) {
                            if (protectedProfile) removePin(slot); else addPin(slot);
                        } else if (which == 3) authorizeManagement(slot, new Runnable() {
                            @Override public void run() { removeDialog(slot); }
                        });
                    }
                })
                .create();
        dialog.show();
        applyDialogTypeface(dialog);
    }

    private void authorizeManagement(final String slot, final Runnable action) {
        if (hasPin(slot)) {
            requestExistingPin(slot, strings.manageAccount(profileName(slot)), action);
        } else {
            action.run();
        }
    }

    private void renameDialog(final String slot) {
        final EditText input = new BackDismissEditText(this);
        input.setSingleLine(true);
        input.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_CAP_SENTENCES);
        input.setFilters(new InputFilter[]{new InputFilter.LengthFilter(12)});
        input.setText(profileName(slot));
        input.setSelectAllOnFocus(true);
        input.setTypeface(appRegular);
        showValidatedTextDialog(strings.renameAccount(), input, new PinCallback() {
            @Override public void accept(String value) {
                String name = value.trim();
                if (name.isEmpty() || name.length() > 12) return;
                profilePrefs.edit().putString(NAME + slot, name)
                        .putBoolean(MANUAL_NAME + slot, true).apply();
                selectedSlot = slot;
                rebuildProfiles();
                requestSelectedFocus();
            }
        });
    }

    private void colorDialog(final String slot) {
        final LinearLayout swatches = new LinearLayout(this);
        swatches.setOrientation(LinearLayout.HORIZONTAL);
        swatches.setGravity(Gravity.CENTER);
        swatches.setPadding(dp(12), dp(18), dp(12), dp(18));
        final AlertDialog[] holder = new AlertDialog[1];
        final Button[] buttons = new Button[PALETTE.length];
        int current = profileColor(slot);

        for (int i = 0; i < PALETTE.length; i++) {
            final int index = i;
            Button dot = new Button(this);
            dot.setId(0x4d4f5300 + i);
            dot.setText(PALETTE[i] == current ? "✓" : "");
            dot.setTextColor(Color.WHITE);
            dot.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
            dot.setTypeface(appSemibold);
            dot.setGravity(Gravity.CENTER);
            dot.setTextAlignment(View.TEXT_ALIGNMENT_CENTER);
            dot.setIncludeFontPadding(false);
            dot.setPadding(0, 0, 0, 0);
            dot.setMinWidth(0);
            dot.setMinHeight(0);
            dot.setFocusable(true);
            dot.setFocusableInTouchMode(true);
            dot.setContentDescription(strings.changeColor() + " " + (i + 1));
            dot.setBackground(colorSwatchBackground(PALETTE[i], PALETTE[i] == current));
            dot.setOnClickListener(new View.OnClickListener() {
                @Override public void onClick(View view) {
                    profilePrefs.edit().putInt(COLOR + slot, PALETTE[index]).apply();
                    selectedSlot = slot;
                    rebuildProfiles();
                    if (holder[0] != null) holder[0].dismiss();
                }
            });
            if (i > 0) dot.setNextFocusLeftId(0x4d4f5300 + i - 1);
            if (i < PALETTE.length - 1) dot.setNextFocusRightId(0x4d4f5300 + i + 1);
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(dp(42), dp(42));
            params.leftMargin = dp(5);
            params.rightMargin = dp(5);
            swatches.addView(dot, params);
            buttons[i] = dot;
        }

        int selectedIndex = 0;
        for (int i = 0; i < PALETTE.length; i++) {
            if (PALETTE[i] == current) selectedIndex = i;
        }
        final int focusIndex = selectedIndex;
        AlertDialog dialog = new AlertDialog.Builder(this)
                .setTitle(strings.changeColor())
                .setView(swatches)
                .setNegativeButton(strings.cancel(), null)
                .create();
        holder[0] = dialog;
        dialog.setOnShowListener(new DialogInterface.OnShowListener() {
            @Override public void onShow(DialogInterface ignored) { buttons[focusIndex].requestFocus(); }
        });
        dialog.setOnDismissListener(new DialogInterface.OnDismissListener() {
            @Override public void onDismiss(DialogInterface ignored) { restoreChooserFocus(); }
        });
        dialog.show();
        applyDialogTypeface(dialog);
    }

    private StateListDrawable colorSwatchBackground(int color, boolean selected) {
        GradientDrawable focused = oval(color);
        focused.setStroke(dp(4), Color.WHITE);
        GradientDrawable normal = oval(color);
        normal.setStroke(dp(selected ? 3 : 2), selected ? Color.WHITE : blend(color, Color.WHITE, 0.48f));
        StateListDrawable states = new StateListDrawable();
        states.addState(new int[]{android.R.attr.state_focused}, focused);
        states.addState(new int[]{}, normal);
        return states;
    }

    private void addPin(final String slot) {
        promptPin(strings.addPin(), strings.pinInstructions(), new PinCallback() {
            @Override public void accept(final String firstPin) {
                promptPin(strings.confirmPin(), strings.pinInstructions(), new PinCallback() {
                    @Override public void accept(String confirmation) {
                        if (!firstPin.equals(confirmation)) {
                            showMessage(strings.pinMismatchTitle(), strings.pinMismatchMessage());
                            return;
                        }
                        savePin(slot, firstPin);
                        refreshProfiles();
                        hint.setText(strings.pinAdded(profileName(slot)));
                    }
                });
            }
        });
    }

    private void removePin(final String slot) {
        requestExistingPin(slot, strings.currentPin(), new Runnable() {
            @Override public void run() {
                profilePrefs.edit().remove(PIN_SALT + slot).remove(PIN_HASH + slot).commit();
                refreshProfiles();
                hint.setText(strings.pinRemoved(profileName(slot)));
            }
        });
    }

    private void requestAccessAndOpen(final String slot) {
        if (hasPin(slot)) {
            requestExistingPin(slot, strings.enterPin() + " — " + profileName(slot), new Runnable() {
                @Override public void run() { openSlot(slot); }
            });
        } else {
            openSlot(slot);
        }
    }

    private void requestExistingPin(final String slot, String title, final Runnable onSuccess) {
        final EditText input = pinInput();
        final boolean[] submitted = new boolean[]{false};
        final AlertDialog dialog = new AlertDialog.Builder(this)
                .setTitle(title)
                .setView(input)
                .create();
        dialog.setOnDismissListener(new DialogInterface.OnDismissListener() {
            @Override public void onDismiss(DialogInterface ignored) {
                hideKeyboard(input);
                if (!submitted[0]) restoreChooserFocus();
            }
        });
        dialog.setOnShowListener(new DialogInterface.OnShowListener() {
            @Override public void onShow(DialogInterface ignored) {
                focusPinInput(dialog, input, new Runnable() {
                    @Override public void run() {
                        if (submitted[0]) return;
                        String pin = input.getText().toString();
                        if (pin.length() != 4) {
                            input.setError(strings.fourDigitsError());
                            return;
                        }
                        if (!verifyPin(slot, pin)) {
                            input.setText("");
                            input.setError(strings.incorrectPin());
                            return;
                        }
                        submitted[0] = true;
                        hideKeyboard(input);
                        dialog.dismiss();
                        onSuccess.run();
                    }
                });
            }
        });
        dialog.show();
        applyDialogTypeface(dialog);
    }

    private void promptPin(String title, String message, final PinCallback callback) {
        final EditText input = pinInput();
        final boolean[] submitted = new boolean[]{false};
        final AlertDialog dialog = new AlertDialog.Builder(this)
                .setTitle(title)
                .setMessage(message)
                .setView(input)
                .create();
        dialog.setOnDismissListener(new DialogInterface.OnDismissListener() {
            @Override public void onDismiss(DialogInterface ignored) {
                hideKeyboard(input);
                if (!submitted[0]) restoreChooserFocus();
            }
        });
        dialog.setOnShowListener(new DialogInterface.OnShowListener() {
            @Override public void onShow(DialogInterface ignored) {
                focusPinInput(dialog, input, new Runnable() {
                    @Override public void run() {
                        if (submitted[0]) return;
                        String pin = input.getText().toString();
                        if (!pin.matches("\\d{4}")) {
                            input.setError(strings.fourDigitsError());
                            return;
                        }
                        submitted[0] = true;
                        hideKeyboard(input);
                        dialog.dismiss();
                        callback.accept(pin);
                    }
                });
            }
        });
        dialog.show();
        applyDialogTypeface(dialog);
    }

    private EditText pinInput() {
        EditText input = new BackDismissEditText(this);
        input.setSingleLine(true);
        input.setGravity(Gravity.CENTER);
        input.setTextAlignment(View.TEXT_ALIGNMENT_CENTER);
        input.setTextSize(TypedValue.COMPLEX_UNIT_SP, 24);
        input.setTypeface(appRegular);
        input.setIncludeFontPadding(false);
        input.setInputType(InputType.TYPE_CLASS_NUMBER | InputType.TYPE_NUMBER_VARIATION_PASSWORD);
        input.setFilters(new InputFilter[]{new InputFilter.LengthFilter(4)});
        input.setPadding(dp(18), dp(10), dp(18), dp(10));
        return input;
    }

    private void focusPinInput(final AlertDialog dialog, final EditText input, final Runnable submit) {
        focusInput(dialog, input, submit);
        input.addTextChangedListener(new TextWatcher() {
            private boolean submitQueued;

            @Override public void beforeTextChanged(CharSequence text, int start, int count, int after) {}

            @Override public void onTextChanged(CharSequence text, int start, int before, int count) {}

            @Override public void afterTextChanged(Editable text) {
                if (text.length() != 4 || submitQueued) return;
                submitQueued = true;
                input.post(new Runnable() {
                    @Override public void run() {
                        submitQueued = false;
                        if (!dialog.isShowing() || input.getText().length() != 4) return;
                        if (input instanceof BackDismissEditText) {
                            ((BackDismissEditText) input).dispatchSubmit();
                        } else {
                            submit.run();
                        }
                    }
                });
            }
        });
    }

    private void showValidatedTextDialog(String title, final EditText input, final PinCallback callback) {
        final boolean[] submitted = new boolean[]{false};
        final AlertDialog dialog = new AlertDialog.Builder(this)
                .setTitle(title).setView(input).create();
        dialog.setOnDismissListener(new DialogInterface.OnDismissListener() {
            @Override public void onDismiss(DialogInterface ignored) {
                hideKeyboard(input);
                if (!submitted[0]) restoreChooserFocus();
            }
        });
        dialog.setOnShowListener(new DialogInterface.OnShowListener() {
            @Override public void onShow(DialogInterface ignored) {
                focusInput(dialog, input, new Runnable() {
                    @Override public void run() {
                        String value = input.getText().toString().trim();
                        if (value.isEmpty()) { input.setError(strings.nameRequiredError()); return; }
                        if (value.length() > 12) { input.setError(strings.nameLengthError()); return; }
                        submitted[0] = true;
                        hideKeyboard(input);
                        dialog.dismiss();
                        callback.accept(value);
                    }
                });
            }
        });
        dialog.show();
        applyDialogTypeface(dialog);
    }

    private void focusInput(final AlertDialog dialog, final EditText input, final Runnable submit) {
        if (input instanceof BackDismissEditText) {
            BackDismissEditText morpheInput = (BackDismissEditText) input;
            morpheInput.setBackAction(new Runnable() {
                @Override public void run() {
                    hideKeyboard(input);
                    dialog.dismiss();
                }
            });
            morpheInput.setSubmitAction(submit);
        }
        input.setImeOptions(EditorInfo.IME_ACTION_DONE);
        input.setOnEditorActionListener(new TextView.OnEditorActionListener() {
            @Override public boolean onEditorAction(TextView view, int actionId, KeyEvent event) {
                boolean enter = event != null && event.getKeyCode() == KeyEvent.KEYCODE_ENTER
                        && event.getAction() == KeyEvent.ACTION_UP;
                if (actionId == EditorInfo.IME_ACTION_DONE || enter) {
                    if (input instanceof BackDismissEditText) {
                        ((BackDismissEditText) input).dispatchSubmit();
                    } else {
                        submit.run();
                    }
                    return true;
                }
                return false;
            }
        });
        input.requestFocus();
        if (dialog.getWindow() != null) {
            dialog.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_VISIBLE);
        }
    }

    private void hideKeyboard(View input) {
        InputMethodManager manager = (InputMethodManager) getSystemService(INPUT_METHOD_SERVICE);
        if (manager != null && input != null) {
            manager.hideSoftInputFromWindow(input.getWindowToken(), 0);
            input.clearFocus();
        }
        if (getWindow() != null) {
            getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_HIDDEN);
        }
    }

    private boolean hasPin(String slot) {
        return profilePrefs.contains(PIN_SALT + slot) && profilePrefs.contains(PIN_HASH + slot);
    }

    private void savePin(String slot, String pin) {
        try {
            byte[] salt = new byte[16];
            new SecureRandom().nextBytes(salt);
            byte[] hash = derivePin(pin, salt);
            profilePrefs.edit()
                    .putString(PIN_SALT + slot, Base64.encodeToString(salt, Base64.NO_WRAP))
                    .putString(PIN_HASH + slot, Base64.encodeToString(hash, Base64.NO_WRAP))
                    .commit();
        } catch (Exception error) {
            Log.e(TAG, "Could not store access PIN", error);
            showMessage(strings.errorTitle(), strings.genericError());
        }
    }

    private boolean verifyPin(String slot, String pin) {
        try {
            String saltValue = profilePrefs.getString(PIN_SALT + slot, null);
            String hashValue = profilePrefs.getString(PIN_HASH + slot, null);
            if (saltValue == null || hashValue == null) return false;
            byte[] expected = Base64.decode(hashValue, Base64.NO_WRAP);
            byte[] actual = derivePin(pin, Base64.decode(saltValue, Base64.NO_WRAP));
            return MessageDigest.isEqual(expected, actual);
        } catch (Exception error) {
            Log.e(TAG, "Could not verify access PIN", error);
            return false;
        }
    }

    private byte[] derivePin(String pin, byte[] salt) throws Exception {
        PBEKeySpec spec = new PBEKeySpec(pin.toCharArray(), salt, 20000, 256);
        try {
            return SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1").generateSecret(spec).getEncoded();
        } finally {
            spec.clearPassword();
        }
    }

    private void addProfile() {
        if (profileIds.size() >= MAX_PROFILES) return;
        int previousNext = Math.max(1, profilePrefs.getInt(NEXT, 1));
        int next = previousNext;
        String id;
        do { id = "profile_" + next++; } while (profileIds.contains(id));
        boolean firstProfile = profileIds.isEmpty();
        profileIds.add(id);
        String name = strings.profileFallback(profileIds.size());
        int color = PALETTE[(profileIds.size() - 1) % PALETTE.length];
        if (!profilePrefs.edit().putString(IDS, joinIds()).putString(NAME + id, name)
                .putInt(COLOR + id, color).putInt(NEXT, next).commit()) {
            profileIds.remove(id);
            showMessage(strings.errorTitle(), strings.genericError());
            return;
        }
        if (!MorpheIsolation.beginPendingAccount(this, id, activeSlot, previousNext)) {
            profileIds.remove(id);
            profilePrefs.edit().putString(IDS, joinIds()).remove(NAME + id).remove(COLOR + id)
                    .putInt(NEXT, previousNext).commit();
            showMessage(strings.errorTitle(), strings.genericError());
            return;
        }
        if (firstProfile && !MorpheIsolation.initializeActiveSlot(this, id)) {
            MorpheIsolation.reconcilePendingAccount(this, true);
            profilePrefs = MorpheIsolation.freshProfileMetadata(this);
            initializeProfiles();
            showMessage(strings.errorTitle(), strings.genericError());
            return;
        }
        if (firstProfile) activeSlot = id;
        selectedSlot = id;
        if (!openSlot(id)) {
            if (!MorpheIsolation.reconcilePendingAccount(this, true)) {
                hint.setText(localizedError(MorpheIsolation.getLastError()));
            }
            profilePrefs = MorpheIsolation.freshProfileMetadata(this);
            initializeProfiles();
            activeSlot = profileIds.isEmpty() ? null
                    : MorpheIsolation.activeSlot(this, profileIds.get(0));
            selectedSlot = activeSlot;
            rebuildProfiles();
            requestSelectedFocus();
        }
    }

    private void removeDialog(final String slot) {
        if (profileIds.size() <= 1) {
            showMessage(strings.errorTitle(), strings.atLeastOneAccount());
            return;
        }
        final String name = profileName(slot);
        AlertDialog dialog = new AlertDialog.Builder(this)
                .setTitle(strings.removeTitle(name))
                .setMessage(strings.removeExplanation())
                .setNegativeButton(strings.cancel(), null)
                .setPositiveButton(strings.remove(), new DialogInterface.OnClickListener() {
                    @Override public void onClick(DialogInterface dialog, int which) { removeProfile(slot, name); }
                })
                .create();
        dialog.show();
        applyDialogTypeface(dialog);
    }

    private void removeProfile(String slot, String name) {
        final boolean removingActive = slot.equals(activeSlot);
        final List<String> remaining = new ArrayList<String>(profileIds);
        remaining.remove(slot);
        final String fallback = removingActive ? remaining.get(0) : activeSlot;

        if (removingActive) {
            setControlsEnabled(false);
            hint.setText(strings.removing(name));
            if (!MorpheIsolation.switchAccountRuntime(this, slot, fallback)) {
                hint.setText(localizedError(MorpheIsolation.getLastError()));
                setControlsEnabled(true);
                return;
            }
        }

        if (!MorpheIsolation.deleteProfilePreferences(this, slot)) {
            hint.setText(strings.errorTitle());
            setControlsEnabled(true);
            return;
        }

        if (!MorpheIsolation.deleteCoreProfile(this, slot, removingActive ? fallback : null)) {
            hint.setText(strings.errorTitle());
            setControlsEnabled(true);
            return;
        }
        if (removingActive) activeSlot = fallback;
        SharedPreferences.Editor metadataEditor = profilePrefs.edit().putString(IDS, joinIds(remaining));
        for (String key : profilePrefs.getAll().keySet()) {
            if (key.endsWith("." + slot)) metadataEditor.remove(key);
        }
        if (!metadataEditor.remove(NAME + slot).remove(COLOR + slot)
                .remove(PIN_SALT + slot).remove(PIN_HASH + slot).commit()) {
            hint.setText(strings.errorTitle());
            setControlsEnabled(true);
            selectedSlot = activeSlot;
            rebuildProfiles();
            requestSelectedFocus();
            return;
        }

        profileIds.clear();
        profileIds.addAll(remaining);
        selectedSlot = activeSlot;
        rebuildProfiles();
        requestSelectedFocus();
        hint.setText(strings.removed());
        if (removingActive) setControlsEnabled(true);
    }

    private String joinIds() {
        return joinIds(profileIds);
    }

    private String joinIds(List<String> ids) {
        StringBuilder builder = new StringBuilder();
        for (String id : ids) {
            if (builder.length() > 0) builder.append('|');
            builder.append(id);
        }
        return builder.toString();
    }

    private boolean isValidSlot(String slot) {
        return slot != null && slot.matches("[a-z0-9_]{1,32}");
    }

    private void setControlsEnabled(boolean enabled) {
        controlsLocked = !enabled;
        for (Button avatar : avatars) {
            avatar.setClickable(enabled);
            avatar.setLongClickable(enabled);
        }
        boolean canAddProfile = profileIds.size() < MAX_PROFILES;
        if (enabled) addButton.setEnabled(canAddProfile);
        addButton.setClickable(enabled && canAddProfile);
        exitButton.setClickable(enabled);
    }

    private boolean openSlot(final String slot) {
        if (!isValidSlot(slot) || !profileIds.contains(slot)) return false;

        if (slot.equals(activeSlot)) {
            Intent current = new Intent();
            current.setClassName(getPackageName(), "com.stremio.tv.MainActivity");
            current.addFlags(Intent.FLAG_ACTIVITY_REORDER_TO_FRONT | Intent.FLAG_ACTIVITY_SINGLE_TOP);
            startActivity(current);
            finish();
            return true;
        }

        setControlsEnabled(false);
        hint.setText(strings.opening(profileName(slot)));
        final String previousSlot = activeSlot;
        if (!MorpheIsolation.switchAccountRuntime(this, previousSlot, slot)) {
            hint.setText(localizedError(MorpheIsolation.getLastError()));
            setControlsEnabled(true);
            return false;
        }
        if (!MorpheIsolation.commitActiveSlot(this, previousSlot, slot)) {
            boolean rolledBack = MorpheIsolation.rollbackAccountSwitch(this, previousSlot, slot);
            hint.setText(rolledBack ? localizedError(MorpheIsolation.getLastError())
                    : strings.errorTitle());
            setControlsEnabled(true);
            return false;
        }
        activeSlot = slot;
        launchFreshMain();
        return true;
    }

    private void launchFreshMain() {
        Intent launch = new Intent();
        launch.setClassName(getPackageName(), "com.stremio.tv.MainActivity");
        launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
        startActivity(launch);
        finish();
    }

    private void showMessage(String title, String message) {
        AlertDialog dialog = new AlertDialog.Builder(this)
                .setTitle(title).setMessage(message).setPositiveButton(strings.ok(), null).create();
        dialog.show();
        applyDialogTypeface(dialog);
    }

    private String localizedError(String detail) {
        return detail == null || detail.trim().isEmpty() ? strings.errorTitle()
                : strings.errorTitle() + ": " + detail;
    }

    private void exitStremio() {
        ActivityManager manager = (ActivityManager) getSystemService(ACTIVITY_SERVICE);
        if (manager != null) {
            int chooserPid = android.os.Process.myPid();
            int appUid = android.os.Process.myUid();
            for (ActivityManager.RunningAppProcessInfo process : manager.getRunningAppProcesses()) {
                if (process.uid == appUid && process.pid != chooserPid) android.os.Process.killProcess(process.pid);
            }
        }
        Intent home = new Intent(Intent.ACTION_MAIN);
        home.addCategory(Intent.CATEGORY_HOME);
        home.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TOP);
        startActivity(home);
        finishAffinity();
    }
}
