package org.chromium.chrome.browser.tab;

import android.content.Context;
import org.chromium.content_public.browser.WebContents;
import org.chromium.url.GURL;

public interface Tab {
    int getId();
    GURL getUrl();
    WebContents getWebContents();
    boolean isIncognito();
    boolean isClosing();
    Context getContext();
    Context p();
}
