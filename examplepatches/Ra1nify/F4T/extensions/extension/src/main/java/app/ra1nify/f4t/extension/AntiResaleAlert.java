package app.ra1nify.f4t.extension;

import android.app.Activity;
import android.app.Application;
import android.app.Dialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.text.Editable;
import android.text.InputType;
import android.text.TextWatcher;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.view.inputmethod.EditorInfo;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Toast;

import java.util.regex.Pattern;

/** Anti-resale notice: a toast on every launch plus a one-time notice per bundle version. */
public final class AntiResaleAlert {
    private static final String PREFS_NAME = "ra1nify_f4t_alert";
    private static final String KEY_NO_ALERT_VERSION = "no_alert_version";
    private static final Pattern REPO_PATTERN =
            Pattern.compile("ra1nify/f4t", Pattern.CASE_INSENSITIVE);

    private static final String TEXT_TOAST = "Morphed by Ra1nify";
    private static final String TEXT_HINT = "Enter the repo address to continue";
    private static final String TEXT_CHECKBOX = "Don't show again";
    private static final String TEXT_CONFIRM = "Confirm";
    private static final String TEXT_CONFUSED = "ん？";

    private static final long CONFIRM_TOAST_THROTTLE_MS = 800L;
    private static final long FIRST_DELAY_MS = 1000L;
    private static final long RETRY_DELAY_MS = 600L;
    private static final int MAX_FOCUS_RETRIES = 6;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private static boolean registered;
    private static boolean toastShown;
    private static boolean showScheduled;
    private static boolean dialogShowing;
    private static boolean dismissedThisProcess;
    private static long lastConfusedAt;
    private static String pendingText = "";
    private static Activity currentActivity;
    private static Dialog currentDialog;

    private AntiResaleAlert() {
    }

    /** Entry point called from the patched Application.onCreate(). */
    public static void onAppCreate(Application application) {
        try {
            if (registered) return;
            registered = true;
            application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                @Override
                public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
                }

                @Override
                public void onActivityStarted(Activity activity) {
                }

                @Override
                public void onActivityResumed(Activity activity) {
                    onResumed(activity);
                }

                @Override
                public void onActivityPaused(Activity activity) {
                }

                @Override
                public void onActivityStopped(Activity activity) {
                }

                @Override
                public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
                }

                @Override
                public void onActivityDestroyed(Activity activity) {
                    try {
                        if (activity == currentActivity) {
                            currentActivity = null;
                            dialogShowing = false;
                            currentDialog = null;
                        }
                    } catch (Throwable ignored) {
                    }
                }
            });
        } catch (Throwable ignored) {

        }
    }

    private static void onResumed(final Activity activity) {
        // Toast always; the notice only until it was accepted for this bundle version.
        try {
            currentActivity = activity;
            if (!toastShown) {
                toastShown = true;
                toast(activity, TEXT_TOAST);
            }
            if (dialogShowing || showScheduled || dismissedThisProcess) return;
            if (BuildInfo.VERSION.equals(noAlertVersion(activity))) return;
            scheduleShow(activity, 0);
        } catch (Throwable ignored) {
        }
    }

    private static void scheduleShow(final Activity activity, final int attempt) {
        if (showScheduled || dialogShowing) return;
        showScheduled = true;
        final long delay = attempt == 0 ? FIRST_DELAY_MS : RETRY_DELAY_MS;
        MAIN.postDelayed(new Runnable() {
            @Override
            public void run() {
                showScheduled = false;
                try {
                    final Activity target = currentActivity;
                    if (dialogShowing || dismissedThisProcess) return;
                    if (target == null || target.isFinishing() || target.isDestroyed()) return;
                    if (!BuildInfo.VERSION.equals(noAlertVersion(target)) && tryShow(target)) return;
                    if (attempt < MAX_FOCUS_RETRIES) scheduleShow(target, attempt + 1);
                } catch (Throwable ignored) {
                }
            }
        }, delay);
    }

    private static boolean tryShow(Activity activity) {
        if (!activity.hasWindowFocus()) return false;
        showDialog(activity);
        return true;
    }

    private static void showDialog(final Activity activity) {
        // Fullscreen and not dismissable: back and outside taps show the confused toast.
        if (dialogShowing) return;
        dialogShowing = true;

        final Dialog dialog = new Dialog(activity, android.R.style.Theme_DeviceDefault_Dialog_NoActionBar);
        currentDialog = dialog;
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        dialog.setCancelable(false);
        dialog.setCanceledOnTouchOutside(false);
        dialog.setOnKeyListener(new Dialog.OnKeyListener() {
            @Override
            public boolean onKey(android.content.DialogInterface d, int keyCode, KeyEvent event) {
                if (keyCode == KeyEvent.KEYCODE_BACK) {
                    confused(activity);
                    return true;
                }
                return false;
            }
        });
        dialog.setOnDismissListener(new android.content.DialogInterface.OnDismissListener() {
            @Override
            public void onDismiss(android.content.DialogInterface d) {
                dialogShowing = false;
                currentDialog = null;
            }
        });

        final Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new ColorDrawable(Color.BLACK));
            window.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        }

        final AlertRoot root = new AlertRoot(activity);
        root.setBackgroundColor(Color.BLACK);

        final ScrollView scroll = new ScrollView(activity);
        scroll.setFillViewport(true);
        scroll.setBackgroundColor(Color.BLACK);
        root.addView(scroll, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        final FrameLayout holder = new FrameLayout(activity);
        scroll.addView(holder, new ScrollView.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        final LinearLayout card = new LinearLayout(activity);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setGravity(Gravity.CENTER_HORIZONTAL);
        card.setClickable(true);
        final int padding = dp(activity, 20);
        card.setPadding(padding, padding, padding, padding);
        holder.addView(card, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.CENTER));
        root.setCard(card, activity);

        final MemeView meme = new MemeView(activity);
        final LinearLayout.LayoutParams memeParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(activity, 200));
        card.addView(meme, memeParams);

        final EditText input = new EditText(activity);
        input.setSingleLine(true);
        input.setHint(TEXT_HINT);
        input.setHintTextColor(0x99FFFFFF);
        input.setTextColor(Color.WHITE);
        input.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
        input.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        input.setImeOptions(EditorInfo.IME_ACTION_NONE);
        input.setText(pendingText);
        input.setSelection(input.getText().length());
        final GradientDrawable inputBackground = new GradientDrawable();
        inputBackground.setColor(0xFF000000);
        inputBackground.setCornerRadius(dp(activity, 8));
        inputBackground.setStroke(dp(activity, 1), 0x66FFFFFF);
        input.setBackground(inputBackground);
        final int inputPadding = dp(activity, 12);
        input.setPadding(inputPadding, inputPadding, inputPadding, inputPadding);
        final LinearLayout.LayoutParams inputParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        inputParams.topMargin = dp(activity, 14);
        card.addView(input, inputParams);

        final CheckBox noAlert = new CheckBox(activity);
        noAlert.setText(TEXT_CHECKBOX);
        noAlert.setTextColor(Color.WHITE);
        noAlert.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        noAlert.setButtonTintList(ColorStateList.valueOf(Color.WHITE));
        final LinearLayout.LayoutParams checkboxParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        checkboxParams.topMargin = dp(activity, 10);
        card.addView(noAlert, checkboxParams);

        final Button confirm = new Button(activity);
        confirm.setText(TEXT_CONFIRM);
        confirm.setTextColor(Color.BLACK);
        confirm.setBackgroundTintList(ColorStateList.valueOf(Color.WHITE));
        final LinearLayout.LayoutParams confirmParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        confirmParams.topMargin = dp(activity, 18);
        card.addView(confirm, confirmParams);

        input.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
            }

            @Override
            public void afterTextChanged(Editable s) {
                pendingText = s == null ? "" : s.toString();
            }
        });

        confirm.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                try {
                    final String typed = input.getText() == null ? "" : input.getText().toString().trim();
                    if (!REPO_PATTERN.matcher(typed).find()) {
                        confused(activity);
                        return;
                    }
                    if (noAlert.isChecked()) {
                        prefs(activity).edit().putString(KEY_NO_ALERT_VERSION, BuildInfo.VERSION).apply();
                    }
                    dismissedThisProcess = true;
                    pendingText = "";
                    dialog.dismiss();
                } catch (Throwable ignored) {
                }
            }
        });

        dialog.setContentView(root);
        dialog.show();

        final Window shownWindow = dialog.getWindow();
        if (shownWindow != null) {
            shownWindow.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
        }

        scroll.post(new Runnable() {
            @Override
            public void run() {
                try {
                    holder.setMinimumHeight(scroll.getHeight());
                } catch (Throwable ignored) {
                }
            }
        });

        meme.startAnimating();
        dialog.setOnDismissListener(new android.content.DialogInterface.OnDismissListener() {
            @Override
            public void onDismiss(android.content.DialogInterface d) {
                dialogShowing = false;
                currentDialog = null;
                meme.stopAnimating();
            }
        });
    }

    private static void confused(Activity activity) {
        try {
            final long now = SystemClock.uptimeMillis();
            if (now - lastConfusedAt < CONFIRM_TOAST_THROTTLE_MS) return;
            lastConfusedAt = now;
            toast(activity, TEXT_CONFUSED);
        } catch (Throwable ignored) {
        }
    }

    private static void toast(Activity activity, String text) {
        try {
            Toast.makeText(activity, text, Toast.LENGTH_SHORT).show();
        } catch (Throwable ignored) {
        }
    }

    private static SharedPreferences prefs(Context context) {
        return context.getApplicationContext().getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
    }

    private static String noAlertVersion(Context context) {
        try {
            return prefs(context).getString(KEY_NO_ALERT_VERSION, null);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static int dp(Context context, float value) {
        return (int) (value * context.getResources().getDisplayMetrics().density + 0.5f);
    }

    /** Reports taps outside the card. */
    private static final class AlertRoot extends FrameLayout {
        private View card;
        private Runnable onOutside;
        private long lastOutsideAt;

        AlertRoot(Context context) {
            super(context);
        }

        void setCard(View card, Context context) {
            this.card = card;
            this.onOutside = new Runnable() {
                @Override
                public void run() {

                    final long now = SystemClock.uptimeMillis();
                    if (now - lastOutsideAt < CONFIRM_TOAST_THROTTLE_MS) return;
                    lastOutsideAt = now;
                    try {
                        Toast.makeText(getContext(), TEXT_CONFUSED, Toast.LENGTH_SHORT).show();
                    } catch (Throwable ignored) {
                    }
                }
            };
        }

        @Override
        public boolean dispatchTouchEvent(MotionEvent event) {
            if (event.getActionMasked() == MotionEvent.ACTION_DOWN && card != null && onOutside != null) {
                final int[] location = new int[2];
                card.getLocationOnScreen(location);
                final float x = event.getRawX();
                final float y = event.getRawY();
                final boolean inside = x >= location[0] && x < location[0] + card.getWidth()
                        && y >= location[1] && y < location[1] + card.getHeight();
                if (!inside) onOutside.run();
            }
            return super.dispatchTouchEvent(event);
        }
    }
}
