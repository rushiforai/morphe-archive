package iq;

import android.webkit.JavascriptInterface;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public interface f {
    @JavascriptInterface
    @NotNull
    String getInitParams();

    @JavascriptInterface
    void onError(@NotNull String str);

    @JavascriptInterface
    void onReady();

    @JavascriptInterface
    void onSuccess(@NotNull String str);
}
