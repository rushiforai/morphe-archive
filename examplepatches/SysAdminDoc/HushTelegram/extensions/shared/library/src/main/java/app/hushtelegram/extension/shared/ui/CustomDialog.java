/*
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Forked from MorpheApp/morphe-patches (GPL-3.0), by way of
 * icysymmetra/tiktok-patches-for-morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * Imported carrying no notice of its own. Morphe hard forked ReVanced, so parts of
 * this file may originate there.
 */
package app.hushtelegram.extension.shared.ui;

import android.app.Dialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.pm.ApplicationInfo;
import android.content.res.ColorStateList;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.graphics.drawable.StateListDrawable;
import android.text.Spanned;
import android.text.TextUtils;
import android.text.method.LinkMovementMethod;
import android.util.Pair;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.List;

import app.hushtelegram.extension.shared.Logger;
import app.hushtelegram.extension.shared.Utils;

/**
 * A utility class for creating a customizable dialog with a title, message or EditText, and up to three buttons (OK, Cancel, Neutral).
 * The dialog supports themed colors, rounded corners, and dynamic button layout based on screen width. It is dismissible by default.
 */
public class CustomDialog {
    private final Context context;
    private final Dialog dialog;
    private final LinearLayout mainLayout;

    /**
     * Creates a custom dialog with a styled layout, including a title, message, buttons, and an optional EditText.
     * The dialog's appearance adapts to the app's dark mode setting, with rounded corners and customizable button actions.
     * Buttons use a single row when their labels fit within the available content width.
     * Otherwise they stack with the primary action first and allow labels to wrap.
     *
     * @param context                     Context used to create the dialog.
     * @param title                       Title text of the dialog.
     * @param message                     Message text of the dialog (supports Spanned for HTML), or null if replaced by EditText.
     * @param editText                    EditText to include in the dialog, or null if no EditText is needed.
     * @param okButtonText                OK button text, or null to use the default "OK" string.
     * @param onOkClick                   Action to perform when the OK button is clicked.
     * @param onCancelClick               Action to perform when the Cancel button is clicked, or null if no Cancel button is needed.
     * @param neutralButtonText           Neutral button text, or null if no Neutral button is needed.
     * @param onNeutralClick              Action to perform when the Neutral button is clicked, or null if no Neutral button is needed.
     * @param dismissDialogOnNeutralClick If the dialog should be dismissed when the Neutral button is clicked.
     * @return The Dialog and its main LinearLayout container.
     */
    public static Pair<Dialog, LinearLayout> create(Context context, CharSequence title, CharSequence message,
                                                    @Nullable EditText editText, CharSequence okButtonText,
                                                    Runnable onOkClick, Runnable onCancelClick,
                                                    @Nullable CharSequence neutralButtonText,
                                                    @Nullable Runnable onNeutralClick,
                                                    boolean dismissDialogOnNeutralClick) {
        Logger.printDebug(() -> "Creating custom dialog with title: " + title);
        CustomDialog customDialog = new CustomDialog(context, title, message, editText,
                okButtonText, onOkClick, onCancelClick,
                neutralButtonText, onNeutralClick, dismissDialogOnNeutralClick, null);
        return new Pair<>(customDialog.dialog, customDialog.mainLayout);
    }

    /** Places custom content in the dialog's scroll area, with an optional Cancel action. */
    public static Pair<Dialog, LinearLayout> createWithContent(Context context, CharSequence title, View content,
                                                              @Nullable Runnable onCancelClick) {
        CustomDialog customDialog = new CustomDialog(context, title, null, null, null, null,
                onCancelClick, null, null, true, content);
        return new Pair<>(customDialog.dialog, customDialog.mainLayout);
    }

    /**
     * Initializes a custom dialog with the specified parameters.
     *
     * @param context                     Context used to create the dialog.
     * @param title                       Title text of the dialog.
     * @param message                     Message text of the dialog, or null if replaced by EditText.
     * @param editText                    EditText to include in the dialog, or null if no EditText is needed.
     * @param okButtonText                OK button text, or null to use the default "OK" string.
     * @param onOkClick                   Action to perform when the OK button is clicked.
     * @param onCancelClick               Action to perform when the Cancel button is clicked, or null if no Cancel button is needed.
     * @param neutralButtonText           Neutral button text, or null if no Neutral button is needed.
     * @param onNeutralClick              Action to perform when the Neutral button is clicked, or null if no Neutral button is needed.
     * @param dismissDialogOnNeutralClick If the dialog should be dismissed when the Neutral button is clicked.
     */
    private CustomDialog(Context context, CharSequence title, CharSequence message, @Nullable EditText editText,
                         CharSequence okButtonText, Runnable onOkClick, Runnable onCancelClick,
                         @Nullable CharSequence neutralButtonText, @Nullable Runnable onNeutralClick,
                         boolean dismissDialogOnNeutralClick, @Nullable View content) {
        // Telegram disables framework RTL. Opt in for these views without changing its theme or flags.
        this.context = new ContextWrapper(context) {
            private final ApplicationInfo info = new ApplicationInfo(context.getApplicationInfo());
            { info.flags |= ApplicationInfo.FLAG_SUPPORTS_RTL; }
            @Override public ApplicationInfo getApplicationInfo() { return info; }
        };
        this.dialog = new Dialog(context);
        this.dialog.requestWindowFeature(Window.FEATURE_NO_TITLE); // Remove default title bar.
        if (!TextUtils.isEmpty(title)) dialog.setTitle(title);

        // Create main layout.
        mainLayout = createMainLayout();
        if (!TextUtils.isEmpty(title)) {
            mainLayout.setAccessibilityPaneTitle(title);
        }
        addTitle(title);
        addContent(message, editText, content);
        addButtons(okButtonText, onOkClick, onCancelClick, neutralButtonText, onNeutralClick, dismissDialogOnNeutralClick);

        // Set dialog content and window attributes.
        dialog.setContentView(mainLayout);
        Window window = dialog.getWindow();
        if (window != null) {
            Utils.setDialogWindowParameters(window, Gravity.CENTER, 0, 90, false);
        }
    }

    /**
     * Creates the main layout for the dialog with vertical orientation and rounded corners.
     *
     * @return The configured LinearLayout for the dialog.
     */
    private LinearLayout createMainLayout() {
        LinearLayout layout = new LinearLayout(context);
        layout.setOrientation(LinearLayout.VERTICAL);
        layout.setPadding(dp(24), dp(16), dp(24), dp(24));
        layout.setLayoutDirection(context.getResources().getConfiguration().getLayoutDirection());
        layout.setTextDirection(View.TEXT_DIRECTION_LOCALE);
        layout.setBackground(roundedBackground(Utils.getDialogBackgroundColor(), 12));

        return layout;
    }

    /**
     * Adds a title to the dialog if provided.
     *
     * @param title The title text to display.
     */
    private void addTitle(CharSequence title) {
        if (TextUtils.isEmpty(title)) return;

        TextView titleView = new TextView(context);
        titleView.setText(title);
        titleView.setTypeface(Typeface.DEFAULT_BOLD);
        titleView.setTextSize(18);
        titleView.setTextColor(Utils.getAppForegroundColor());
        titleView.setGravity(Gravity.CENTER);
        titleView.setAccessibilityHeading(true);
        // In Telegram's blues, as every HushTelegram title is, where the theme's dialog is dark
        // enough for every stop to read. A light theme keeps its own text colour.
        if (ShimmerTitle.readsOn(Utils.getDialogBackgroundColor())) ShimmerTitle.wear(titleView);

        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        params.setMargins(0, 0, 0, dp(16));
        titleView.setLayoutParams(params);

        mainLayout.addView(titleView);
    }

    /**
     * Adds a message or EditText to the dialog within a ScrollView.
     *
     * @param message  The message text to display (supports Spanned for HTML), or null if replaced by EditText.
     * @param editText The EditText to include, or null if no EditText is needed.
     */
    private void addContent(CharSequence message, @Nullable EditText editText, @Nullable View content) {
        // Create content container (message/EditText) inside a ScrollView only if message or editText is provided.
        if (message == null && editText == null && content == null) return;

        ScrollView scrollView = new ScrollView(context);
        scrollView.setVerticalScrollBarEnabled(true);
        scrollView.setScrollbarFadingEnabled(false);
        scrollView.setScrollBarStyle(View.SCROLLBARS_INSIDE_INSET);
        scrollView.setOverScrollMode(View.OVER_SCROLL_IF_CONTENT_SCROLLS);
        scrollView.setVerticalFadingEdgeEnabled(true);
        scrollView.setFadingEdgeLength(dp(16));
        scrollView.setScrollIndicators(View.SCROLL_INDICATOR_TOP | View.SCROLL_INDICATOR_BOTTOM);

        LinearLayout contentContainer = new LinearLayout(context);
        contentContainer.setOrientation(LinearLayout.VERTICAL);
        scrollView.addView(contentContainer);

        if (content != null) {
            ViewGroup parent = (ViewGroup) content.getParent();
            if (parent != null) parent.removeView(content);
            contentContainer.addView(content, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        } else if (editText != null) {
            scrollView.setPadding(dp(8), dp(8), dp(8), dp(8));
            scrollView.setBackground(roundedBackground(Utils.getEditTextBackground(), 10));
            scrollView.setClipToOutline(true);

            // Remove EditText from its current parent, if any.
            ViewGroup parent = (ViewGroup) editText.getParent();
            if (parent != null) parent.removeView(editText);
            // Style the EditText to match the dialog theme.
            editText.setTextColor(Utils.getAppForegroundColor());
            editText.setBackground(null);
            editText.setPadding(0, 0, 0, 0);
            contentContainer.addView(editText, new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT,
                    LinearLayout.LayoutParams.WRAP_CONTENT));
            // Message (if not replaced by EditText).
        } else {
            TextView messageView = new TextView(context);
            // Supports Spanned (HTML).
            messageView.setText(message);
            messageView.setTextSize(16);
            messageView.setTextColor(Utils.getAppForegroundColor());
            // Enable HTML link clicking if the message contains links.
            if (message instanceof Spanned) {
                messageView.setMovementMethod(LinkMovementMethod.getInstance());
            }
            contentContainer.addView(messageView, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));
        }

        // Weight to take available space.
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                0,
                1.0f);
        scrollView.setLayoutParams(params);
        // Add ScrollView to main layout only if content exist.
        mainLayout.addView(scrollView);
    }

    /**
     * Adds buttons to the dialog, arranging them dynamically based on their widths.
     *
     * @param okButtonText                OK button text, or null to use the default "OK" string.
     * @param onOkClick                   Action for the OK button click.
     * @param onCancelClick               Action for the Cancel button click, or null if no Cancel button.
     * @param neutralButtonText           Neutral button text, or null if no Neutral button.
     * @param onNeutralClick              Action for the Neutral button click, or null if no Neutral button.
     * @param dismissDialogOnNeutralClick If the dialog should dismiss on Neutral button click.
     */
    private void addButtons(CharSequence okButtonText, Runnable onOkClick, Runnable onCancelClick,
                            @Nullable CharSequence neutralButtonText, @Nullable Runnable onNeutralClick,
                            boolean dismissDialogOnNeutralClick) {
        List<Button> buttons = new ArrayList<>();

        // Create buttons in order: Neutral, Cancel, OK.
        if (neutralButtonText != null && onNeutralClick != null) {
            Button neutralButton = createButton(neutralButtonText, onNeutralClick, false, dismissDialogOnNeutralClick);
            buttons.add(neutralButton);
        }
        if (onCancelClick != null) {
            Button cancelButton = createButton(context.getString(android.R.string.cancel), onCancelClick, false, true);
            buttons.add(cancelButton);
        }
        if (onOkClick != null) {
            Button okButton = createButton(
                    okButtonText != null ? okButtonText : context.getString(android.R.string.ok),
                    onOkClick, true, true);
            buttons.add(okButton);
        }

        ActionLayout buttonContainer = new ActionLayout(buttons);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT);
        params.topMargin = buttons.isEmpty() ? 0 : dp(16);
        buttonContainer.setLayoutParams(params);
        mainLayout.addView(buttonContainer);
    }

    /**
     * Creates a styled button with customizable text, click behavior, and appearance.
     *
     * @param text         The button text to display.
     * @param onClick      The action to perform on button click.
     * @param isOkButton   If this is the OK button, which uses distinct styling.
     * @param dismissDialog If the dialog should dismiss when the button is clicked.
     * @return The created Button.
     */
    private Button createButton(CharSequence text, Runnable onClick, boolean isOkButton, boolean dismissDialog) {
        Button button = new Button(context, null, 0);
        button.setText(text);
        button.setTextSize(14);
        button.setAllCaps(false);
        button.setSingleLine(false);
        button.setMaxLines(Integer.MAX_VALUE);
        button.setEllipsize(null);
        button.setGravity(Gravity.CENTER);
        button.setMinHeight(dp(48));
        button.setMinimumHeight(dp(48));
        button.setMinWidth(dp(48));
        button.setMinimumWidth(dp(48));
        button.setPadding(dp(16), dp(10), dp(16), dp(10));

        int backgroundColor = isOkButton
                ? Utils.getOkButtonBackgroundColor()
                : Utils.getCancelOrNeutralButtonBackgroundColor();
        int textColor = isOkButton ? Utils.getDialogBackgroundColor() : Utils.getAppForegroundColor();
        StateListDrawable states = new StateListDrawable();
        GradientDrawable focused = roundedBackground(backgroundColor, 8);
        focused.setStroke(dp(2), textColor);
        states.addState(new int[]{android.R.attr.state_focused}, focused);
        GradientDrawable hovered = roundedBackground(backgroundColor, 8);
        hovered.setStroke(dp(1), textColor);
        states.addState(new int[]{android.R.attr.state_hovered}, hovered);
        states.addState(new int[0], roundedBackground(backgroundColor, 8));
        int rippleColor = (textColor & 0x00ffffff) | 0x33000000;
        button.setBackground(new RippleDrawable(ColorStateList.valueOf(rippleColor), states,
                roundedBackground(textColor | 0xff000000, 8)));
        button.setTextColor(textColor);

        button.setOnClickListener(v -> {
            if (onClick != null) onClick.run();
            if (dismissDialog) dialog.dismiss();
        });

        return button;
    }

    private int dp(int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    private GradientDrawable roundedBackground(int color, int radius) {
        GradientDrawable background = new GradientDrawable();
        background.setColor(color);
        background.setCornerRadius(dp(radius));
        return background;
    }

    private final class ActionLayout extends LinearLayout {
        private final List<Button> buttons;
        private boolean stacked = true;

        ActionLayout(List<Button> buttons) {
            super(CustomDialog.this.context);
            this.buttons = buttons;
            setBaselineAligned(false);
            arrange();
        }

        @Override protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            int availableWidth = MeasureSpec.getSize(widthMeasureSpec) - getPaddingLeft() - getPaddingRight();
            int requiredWidth = Math.max(0, buttons.size() - 1) * dp(8);
            for (Button button : buttons) {
                button.measure(MeasureSpec.UNSPECIFIED, MeasureSpec.UNSPECIFIED);
                requiredWidth += button.getMeasuredWidth();
            }
            boolean shouldStack = buttons.size() <= 1
                    || MeasureSpec.getMode(widthMeasureSpec) != MeasureSpec.UNSPECIFIED && requiredWidth > availableWidth;
            if (stacked != shouldStack) {
                stacked = shouldStack;
                arrange();
            }
            if (!stacked) {
                for (Button button : buttons) {
                    LayoutParams params = (LayoutParams) button.getLayoutParams();
                    params.weight = button.getMeasuredWidth();
                }
            }
            super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        }

        private void arrange() {
            View focused = findFocus();
            removeAllViews();
            setOrientation(stacked ? VERTICAL : HORIZONTAL);
            for (int i = 0; i < buttons.size(); i++) {
                Button button = buttons.get(stacked ? buttons.size() - 1 - i : i);
                LayoutParams params = new LayoutParams(stacked ? LayoutParams.MATCH_PARENT : 0,
                        LayoutParams.WRAP_CONTENT);
                if (i > 0) {
                    if (stacked) params.topMargin = dp(8);
                    else params.setMarginStart(dp(8));
                }
                addView(button, params);
            }
            if (focused != null) focused.requestFocus();
        }
    }
}
