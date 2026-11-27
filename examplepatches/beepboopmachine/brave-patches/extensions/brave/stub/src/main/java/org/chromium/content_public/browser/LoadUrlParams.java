package org.chromium.content_public.browser;

import org.chromium.url.GURL;

public class LoadUrlParams {
    public String a;
    public int d;

    public LoadUrlParams(int pageTransition, String url) {
        this.d = pageTransition;
        this.a = url;
    }

    public LoadUrlParams(String url) {
        this(0, url);
    }

    public LoadUrlParams(int pageTransition, GURL gurl) {
        this.d = pageTransition;
        this.a = gurl != null ? gurl.k() : "";
    }

    public LoadUrlParams(GURL gurl) {
        this(0, gurl);
    }
}
