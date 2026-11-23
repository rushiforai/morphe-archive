package app.ftl.extension.videodownloader;

import android.app.Activity;
import android.os.Message;
import android.webkit.WebView;

import java.lang.ref.WeakReference;

public final class PopupWindowGate {
    private static WeakReference<WebView> openerView;
    private static String openerUrl;
    private static String hitExtra;

    private PopupWindowGate() {
    }

    public static void captureOpener(WebView view) {
        try {
            openerView = new WeakReference<WebView>(view);
            openerUrl = view.getUrl();
            WebView.HitTestResult result = view.getHitTestResult();
            hitExtra = result != null ? result.getExtra() : null;
        } catch (Throwable t) {
            openerView = null;
            openerUrl = null;
            hitExtra = null;
        }
    }

    public static boolean shouldBlock(Message resultMsg) {
        try {
            WebView view = openerView != null ? openerView.get() : null;
            Activity activity = view != null ? PopupUtil.activityOf(view.getContext()) : null;
            if (activity == null) {
                cancel(resultMsg);
                return true;
            }
            return isBlocked(activity, openerUrl != null ? openerUrl : "", hitExtra, resultMsg);
        } catch (Throwable t) {
            try {
                cancel(resultMsg);
            } catch (Throwable ignored) {
            }
            return true;
        }
    }

    private static boolean isBlocked(Activity activity, String opener, String hit, Message msg) {
        if (!PopupUtil.tryAcquire()) {
            cancel(msg);
            return true;
        }
        if (msg == null) {
            decide(activity, opener, hit);
            return true;
        }
        PopupProbe.start(activity, opener, msg);
        return true;
    }

    private static void cancel(Message msg) {
        if (msg != null && msg.obj instanceof WebView.WebViewTransport) {
            ((WebView.WebViewTransport) msg.obj).setWebView(null);
            msg.sendToTarget();
        }
    }

    static void decide(Activity activity, String opener, String url) {
        String host = PopupUtil.hostOf(url);
        if (host != null && !PopupUtil.sameSite(PopupUtil.hostOf(opener), host)) {
            int rule = PopupStore.get(activity, PopupStore.WINDOW, host);
            if (rule == PopupStore.BLOCK) {
                PopupUtil.release();
                return;
            }
            if (rule == PopupStore.ALLOW) {
                PopupUtil.release();
                PopupUtil.openUrl(activity, url);
                return;
            }
        }
        showDialog(activity, opener, url);
    }

    private static void showDialog(final Activity activity, String opener, final String url) {
        String host = PopupUtil.hostOf(url);
        String ruleHost = null;
        if (host != null && !PopupUtil.sameSite(PopupUtil.hostOf(opener), host)) {
            ruleHost = host;
        }
        int[] choices;
        if (ruleHost != null) {
            choices = new int[]{PopupPrompt.ALLOW_ONCE, PopupPrompt.ALWAYS_BLOCK, PopupPrompt.ALWAYS_ALLOW};
        } else if (url != null) {
            choices = new int[]{PopupPrompt.ALLOW_ONCE, PopupPrompt.BLOCK_ONCE};
        } else {
            choices = new int[]{PopupPrompt.BLOCK_ONCE};
        }
        PopupPrompt.show(activity, opener, url, "A page tried to open a new window", ruleHost, choices,
                new PopupPrompt.Callback() {
                    @Override
                    public void onChoice(int choice, String key) {
                        if (choice == PopupPrompt.ALLOW_ONCE) {
                            PopupUtil.openUrl(activity, url);
                        } else if (choice == PopupPrompt.ALWAYS_ALLOW) {
                            if (key != null) {
                                PopupStore.put(activity, PopupStore.WINDOW, key, PopupStore.ALLOW);
                            }
                            PopupUtil.openUrl(activity, url);
                        } else if (choice == PopupPrompt.ALWAYS_BLOCK && key != null) {
                            PopupStore.put(activity, PopupStore.WINDOW, key, PopupStore.BLOCK);
                        }
                    }
                });
    }
}
