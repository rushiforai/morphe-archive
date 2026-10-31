package com.vungle.ads.internal.downloader;

import ab.e0;
import java.util.Comparator;
import java.util.Map;

/* loaded from: classes4.dex */
public final class q implements Comparator {
    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        return e0.t((Integer) ((Map.Entry) obj2).getValue(), (Integer) ((Map.Entry) obj).getValue());
    }
}
