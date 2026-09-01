package com.apollographql.apollo.exception;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\n\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/apollographql/apollo/exception/ApolloWebSocketForceCloseException;", "Lcom/apollographql/apollo/exception/ApolloException;", "apollo-api"}, k = 1, mv = {2, 0, 0}, xi = 48)
public final /* data */ class ApolloWebSocketForceCloseException extends ApolloException {
    static {
        new ApolloWebSocketForceCloseException("closeConnection() was called", null);
    }

    public final boolean equals(Object obj) {
        return this == obj || (obj instanceof ApolloWebSocketForceCloseException);
    }

    public final int hashCode() {
        return 1630789127;
    }

    @Override // java.lang.Throwable
    public final String toString() {
        return "ApolloWebSocketForceCloseException";
    }
}
