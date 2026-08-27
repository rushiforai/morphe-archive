package com.stremio.morphe;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.StateListDrawable;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.LinearLayout;
import android.widget.TextView;

public final class MorpheAccountsNavView extends LinearLayout {
    public static final int VIEW_ID = 0x4d4f52a0;
    private static final String META = "morphe_profiles";
    private static final String NAME = "name.";
    private static final String COLOR = "color.";
    private final TextView avatar;
    private final TextView label;
    private View backdrop;
    private View observedRoot;
    private boolean nativeMenuExpanded;
    private boolean destinationVisible;
    private boolean automaticNamePending;
    private final ViewTreeObserver.OnGlobalFocusChangeListener globalFocusListener =
            new ViewTreeObserver.OnGlobalFocusChangeListener() {
        @Override public void onGlobalFocusChanged(View oldFocus, View newFocus) {
            updateAccountFocusability(newFocus);
        }
    };
    private final Runnable synchronizeAccountFocusability = new Runnable() {
        @Override public void run() {
            updateAccountFocusability(getRootView().findFocus());
        }
    };
    private final Runnable profileNameRefresh = new Runnable() {
        @Override public void run() {
            updateProfile();
        }
    };
    public MorpheAccountsNavView(Context context, AttributeSet attrs) {
        super(context, attrs);
        setId(VIEW_ID);
        setTag("morphe_accounts_nav");
        setOrientation(HORIZONTAL);
        setGravity(Gravity.CENTER_VERTICAL);
        setBackground(containerBackground());
        // Match the native Compose tab bounds while preserving the avatar and
        // label axes used by the collapsed and expanded navigation menu. Apply
        // this after the inset background so its optical insets cannot replace
        // the content padding.
        setPadding(dp(6), dp(3), dp(8), dp(3));
        setFocusable(false);
        setFocusableInTouchMode(false);
        setClickable(true);
        setContentDescription("Switch account");
        setVisibility(GONE);

        Typeface semibold = appTypeface("plusjakartasans_semibold", Typeface.DEFAULT_BOLD);
        // The native menu requests weight 600 from a family whose next matching
        // registered face is the app's 700-weight Plus Jakarta Sans Bold.
        Typeface menuLabel = appTypeface("plusjakartasans_bold", Typeface.DEFAULT_BOLD);

        avatar = new TextView(context);
        avatar.setGravity(Gravity.CENTER);
        avatar.setTextAlignment(TEXT_ALIGNMENT_CENTER);
        avatar.setIncludeFontPadding(false);
        avatar.setPadding(0, 0, 0, 0);
        avatar.setTextColor(Color.WHITE);
        avatar.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        avatar.setTypeface(semibold);
        avatar.setTranslationX(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 0.5f,
                getResources().getDisplayMetrics()));
        avatar.setFocusable(false);
        addView(avatar, new LinearLayout.LayoutParams(dp(32), dp(32)));

        label = new TextView(context);
        label.setTextColor(focusTextColors());
        label.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        label.setTypeface(menuLabel);
        label.setGravity(Gravity.CENTER_VERTICAL);
        label.setSingleLine(true);
        label.setEllipsize(TextUtils.TruncateAt.END);
        label.setVisibility(INVISIBLE);
        LinearLayout.LayoutParams labelParams = new LinearLayout.LayoutParams(dp(92), dp(38));
        labelParams.leftMargin = dp(7);
        addView(label, labelParams);

        setOnClickListener(new OnClickListener() {
            @Override public void onClick(View view) {
                Intent intent = new Intent();
                intent.setClassName(getContext().getPackageName(), "com.stremio.morphe.ProfileChooserActivity");
                getContext().startActivity(intent);
            }
        });
    }

    @Override
    protected void onFocusChanged(boolean gainFocus, int direction, android.graphics.Rect previouslyFocusedRect) {
        super.onFocusChanged(gainFocus, direction, previouslyFocusedRect);
        avatar.setSelected(gainFocus);
        label.setSelected(gainFocus);
        updateLabelVisibility();
        setBackdropVisible(gainFocus);
        MorpheNavBridge.setAccountsFocused(gainFocus);
    }

    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_DPAD_DOWN) {
            if (requestNativeMenuFocus()) return true;
        }
        if (keyCode == KeyEvent.KEYCODE_DPAD_RIGHT) {
            if (requestContentFocus()) return true;
        }
        return super.onKeyDown(keyCode, event);
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        int backdropId = getResources().getIdentifier("morphe_nav_backdrop", "id", getContext().getPackageName());
        observedRoot = getRootView();
        backdrop = observedRoot.findViewById(backdropId);
        observedRoot.getViewTreeObserver().addOnGlobalFocusChangeListener(globalFocusListener);
        MorpheNavBridge.registerAccountsView(this);
        post(synchronizeAccountFocusability);
    }

    @Override
    protected void onDetachedFromWindow() {
        removeCallbacks(profileNameRefresh);
        removeCallbacks(synchronizeAccountFocusability);
        if (observedRoot != null && observedRoot.getViewTreeObserver().isAlive()) {
            observedRoot.getViewTreeObserver().removeOnGlobalFocusChangeListener(globalFocusListener);
        }
        observedRoot = null;
        setBackdropVisible(false);
        MorpheNavBridge.setAccountsFocused(false);
        super.onDetachedFromWindow();
    }

    @Override
    public void onWindowFocusChanged(boolean hasWindowFocus) {
        super.onWindowFocusChanged(hasWindowFocus);
        if (hasWindowFocus && destinationVisible) {
            post(synchronizeAccountFocusability);
            updateProfile();
            if (hasFocus()) {
                setBackdropVisible(true);
                MorpheNavBridge.setAccountsFocused(true);
                updateLabelVisibility();
            }
        } else {
            setBackdropVisible(false);
            MorpheNavBridge.setAccountsFocused(false);
        }
    }

    private boolean requestFirstFocusable(View view) {
        View focusable = firstFocusable(view);
        return focusable != null && focusable.requestFocus();
    }

    private View firstFocusable(View view) {
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                View focusable = firstFocusable(group.getChildAt(i));
                if (focusable != null) return focusable;
            }
        }
        return view.isFocusable() ? view : null;
    }

    private boolean requestNativeMenuFocus() {
        View root = getRootView();
        int sideId = getResources().getIdentifier("side_menu_fragment", "id", getContext().getPackageName());
        View sideMenu = root.findViewById(sideId);
        return sideMenu != null && requestFirstFocusable(sideMenu);
    }

    private boolean isDescendantOf(View child, View ancestor) {
        View current = child;
        while (current != null) {
            if (current == ancestor) return true;
            android.view.ViewParent parent = current.getParent();
            current = parent instanceof View ? (View) parent : null;
        }
        return false;
    }

    private void updateAccountFocusability(View focused) {
        if (focused == this) return;
        View root = getRootView();
        int sideId = getResources().getIdentifier("side_menu_fragment", "id", getContext().getPackageName());
        int contentId = getResources().getIdentifier("nav_host_fragment", "id", getContext().getPackageName());
        View sideMenu = root.findViewById(sideId);
        View content = root.findViewById(contentId);
        if (sideMenu != null && isDescendantOf(focused, sideMenu)) {
            setFocusable(true);
            setFocusableInTouchMode(true);
        } else if (content != null && isDescendantOf(focused, content)) {
            setFocusable(false);
            setFocusableInTouchMode(false);
        }
    }

    private boolean requestContentFocus() {
        View root = getRootView();
        int contentId = getResources().getIdentifier("nav_host_fragment", "id", getContext().getPackageName());
        View content = root.findViewById(contentId);
        return content != null && requestFirstFocusable(content);
    }

    private void setBackdropVisible(boolean visible) {
        if (backdrop != null) backdrop.setVisibility(visible && destinationVisible ? VISIBLE : GONE);
    }

    void onDestinationChanged(int destinationId) {
        int playerId = getResources().getIdentifier("player", "id", getContext().getPackageName());
        int loginId = getResources().getIdentifier("login", "id", getContext().getPackageName());
        if (destinationId != loginId) {
            MorpheIsolation.commitPendingAccountIfAuthenticated(getContext());
        }
        destinationVisible = destinationId != playerId && destinationId != loginId
                && MorpheIsolation.hasProfiles(getContext());
        setVisibility(destinationVisible ? VISIBLE : GONE);
        if (!destinationVisible) {
            removeCallbacks(profileNameRefresh);
            setBackdropVisible(false);
            MorpheNavBridge.setAccountsFocused(false);
            return;
        }
        updateProfile();
    }

    void setNativeMenuExpanded(boolean expanded) {
        nativeMenuExpanded = expanded;
        updateLabelVisibility();
    }

    private void updateLabelVisibility() {
        label.setVisibility(destinationVisible && (hasFocus() || nativeMenuExpanded)
                ? VISIBLE : INVISIBLE);
    }

    private void updateProfile() {
        if (!destinationVisible || !MorpheIsolation.hasProfiles(getContext())) return;
        String slot = MorpheIsolation.activeSlot(getContext(), "account_a");
        @SuppressWarnings("deprecation")
        SharedPreferences meta = getContext().getSharedPreferences(META, Context.MODE_MULTI_PROCESS);
        meta.getAll();
        String fallback = "account_b".equals(slot) ? "Account B" : "Account A";
        String synchronizedName = MorpheIsolation.synchronizedProfileName(getContext(), slot);
        automaticNamePending = synchronizedName == null;
        String name = synchronizedName == null ? meta.getString(NAME + slot, fallback) : synchronizedName;
        if (name == null || name.trim().isEmpty()) name = fallback;
        name = name.trim();
        int color = meta.getInt(COLOR + slot, Color.rgb(116, 82, 246));
        avatar.setText(name.substring(0, 1).toUpperCase());
        avatar.setBackground(avatarBackground(color));
        MorpheTextFit.apply(label, name, 13f, dp(90));
        setContentDescription("Switch account, current account " + name);
        removeCallbacks(profileNameRefresh);
        if (automaticNamePending && destinationVisible && isAttachedToWindow()) {
            postDelayed(profileNameRefresh, 2000L);
        }
    }

    private StateListDrawable avatarBackground(int color) {
        int outline = blend(color, Color.WHITE, 0.48f);
        GradientDrawable selected = oval(color);
        selected.setStroke(dp(3), outline);
        GradientDrawable normal = oval(color);
        normal.setStroke(dp(2), outline);
        StateListDrawable states = new StateListDrawable();
        states.addState(new int[]{android.R.attr.state_selected}, selected);
        states.addState(new int[]{}, normal);
        return states;
    }

    private StateListDrawable containerBackground() {
        GradientDrawable focused = rounded(Color.rgb(211, 209, 214));
        GradientDrawable normal = rounded(Color.TRANSPARENT);
        int verticalInset = Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 1.5f,
                getResources().getDisplayMetrics()));
        StateListDrawable states = new StateListDrawable();
        states.addState(new int[]{android.R.attr.state_focused},
                new InsetDrawable(focused, 0, verticalInset, 0, verticalInset));
        states.addState(new int[]{},
                new InsetDrawable(normal, 0, verticalInset, 0, verticalInset));
        return states;
    }

    private ColorStateList focusTextColors() {
        return new ColorStateList(
                new int[][]{new int[]{android.R.attr.state_selected}, new int[]{}},
                new int[]{Color.rgb(20, 19, 24), Color.WHITE});
    }

    private Typeface appTypeface(String name, Typeface fallback) {
        int id = getResources().getIdentifier(name, "font", getContext().getPackageName());
        if (id == 0) return fallback;
        try { return getResources().getFont(id); }
        catch (Exception ignored) { return fallback; }
    }

    private GradientDrawable oval(int color) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setShape(GradientDrawable.OVAL);
        drawable.setColor(color);
        return drawable;
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

    private int dp(int value) {
        return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value,
                getResources().getDisplayMetrics()));
    }
}
