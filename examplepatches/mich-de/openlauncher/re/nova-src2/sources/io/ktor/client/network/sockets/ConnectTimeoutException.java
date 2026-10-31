package io.ktor.client.network.sockets;

import java.net.ConnectException;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lio/ktor/client/network/sockets/ConnectTimeoutException;", "Ljava/net/ConnectException;", "ktor-client-core"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class ConnectTimeoutException extends ConnectException {

    /* renamed from: a, reason: collision with root package name */
    public final Throwable f66541a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ConnectTimeoutException(String message, Throwable th2) {
        super(message);
        Intrinsics.g(message, "message");
        this.f66541a = th2;
    }

    @Override // java.lang.Throwable
    public final Throwable getCause() {
        return this.f66541a;
    }
}
