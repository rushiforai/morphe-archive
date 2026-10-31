package org.chromium.net;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Objects;

/* loaded from: classes5.dex */
public final class ProxyOptions {
    private final List<Proxy> mProxyList;

    public @interface Experimental {
    }

    public ProxyOptions(List<Proxy> list) {
        Objects.requireNonNull(list);
        if (list.isEmpty()) {
            throw new IllegalArgumentException("ProxyList cannot be empty");
        }
        int iIndexOf = list.indexOf(null);
        if (iIndexOf != -1 && iIndexOf != list.size() - 1) {
            throw new IllegalArgumentException("Null is allowed only as the last element in the proxy list");
        }
        this.mProxyList = new ArrayList(list);
    }

    public List<Proxy> getProxyList() {
        return Collections.unmodifiableList(this.mProxyList);
    }
}
