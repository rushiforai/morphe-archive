package org.chromium.chrome.browser.tab;

import android.content.Context;
import org.chromium.content_public.browser.WebContents;
import org.chromium.url.GURL;

public class TabImpl implements Tab {
    @Override public int getId() { return 0; }
    @Override public GURL getUrl() { return null; }
    @Override public WebContents getWebContents() { return null; }
    @Override public boolean isIncognito() { return false; }
    @Override public boolean isClosing() { return false; }
    @Override public Context getContext() { return null; }
    @Override public Context p() { return null; }
    public int destroyInternal(boolean z) { return 0; }
}
