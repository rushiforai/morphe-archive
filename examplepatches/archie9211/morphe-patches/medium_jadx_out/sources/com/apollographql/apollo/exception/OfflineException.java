package com.apollographql.apollo.exception;

import java.io.IOException;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÆ\n\u0018\u00002\u00060\u0001j\u0002`\u0002¨\u0006\u0003"}, d2 = {"Lcom/apollographql/apollo/exception/OfflineException;", "Ljava/io/IOException;", "Lokio/IOException;", "apollo-api"}, k = 1, mv = {2, 0, 0}, xi = 48)
public final /* data */ class OfflineException extends IOException {
    public static final OfflineException a = new OfflineException("The device is offline");

    public final boolean equals(Object obj) {
        return this == obj || (obj instanceof OfflineException);
    }

    public final int hashCode() {
        return -155984151;
    }

    @Override // java.lang.Throwable
    public final String toString() {
        return "OfflineException";
    }
}
