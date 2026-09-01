package com.squareup.wire;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0004\n\u0002\b\u0006\u001a#\u0010\u0000\u001a\u0002H\u0001\"\u0004\b\u0000\u0010\u00012\b\u0010\u0002\u001a\u0004\u0018\u0001H\u00012\u0006\u0010\u0003\u001a\u0002H\u0001¢\u0006\u0002\u0010\u0004¨\u0006\u0005"}, d2 = {"get", "T", "value", "defaultValue", "(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", "wire-runtime"}, k = 2, mv = {2, 0, 0}, xi = 48)
public final class Wire {
    public static final <T> T get(T t, T t2) {
        return t == null ? t2 : t;
    }
}
