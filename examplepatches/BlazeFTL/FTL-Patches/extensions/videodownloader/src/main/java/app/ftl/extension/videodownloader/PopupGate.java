package app.ftl.extension.videodownloader;

import android.app.Activity;
import android.net.Uri;
import android.os.Build;
import android.webkit.WebResourceRequest;
import android.webkit.WebView;

public final class PopupGate {
    private PopupGate() {
    }

    public static boolean intercept(WebView view, WebResourceRequest request) {
        try {
            if (!request.isForMainFrame() || request.hasGesture()) {
                return false;
            }
            if (Build.VERSION.SDK_INT >= 24 && request.isRedirect()) {
                return false;
            }
            Uri target = request.getUrl();
            String url = target.toString();
            if (!url.startsWith("http")) {
                return false;
            }
            String page = view.getUrl();
            if (page == null || !page.startsWith("http")) {
                return false;
            }
            String targetHost = target.getHost();
            String pageHost = Uri.parse(page).getHost();
            if (targetHost == null || pageHost == null) {
                return false;
            }
            if (PopupUtil.sameSite(PopupUtil.norm(targetHost), PopupUtil.norm(pageHost))) {
                return false;
            }
            Activity activity = PopupUtil.activityOf(view.getContext());
            if (activity == null) {
                return false;
            }
            check(activity, url, page, view);
            return true;
        } catch (Throwable t) {
            return false;
        }
    }

    private static void check(final Activity activity, final String url, String page, final WebView view) {
        String host = Uri.parse(url).getHost();
        if (host == null) {
            host = "";
        }
        if (PopupStore.get(activity, PopupStore.REDIRECT, host) == PopupStore.BLOCK) {
            return;
        }
        if (activity.isFinishing() || !PopupUtil.tryAcquire()) {
            return;
        }
        String ruleHost = host.length() > 0 ? host : null;
        int[] choices = ruleHost != null
                ? new int[]{PopupPrompt.ALLOW_ONCE, PopupPrompt.BLOCK_ONCE, PopupPrompt.ALWAYS_BLOCK}
                : new int[]{PopupPrompt.ALLOW_ONCE, PopupPrompt.BLOCK_ONCE};
        PopupPrompt.show(activity, page, url, "A page tried to redirect you", ruleHost, choices,
                new PopupPrompt.Callback() {
                    @Override
                    public void onChoice(int choice, String key) {
                        if (choice == PopupPrompt.ALLOW_ONCE) {
                            view.loadUrl(url);
                        } else if (choice == PopupPrompt.ALWAYS_BLOCK && key != null) {
                            PopupStore.put(activity, PopupStore.REDIRECT, key, PopupStore.BLOCK);
                        }
                    }
                });
    }
}
