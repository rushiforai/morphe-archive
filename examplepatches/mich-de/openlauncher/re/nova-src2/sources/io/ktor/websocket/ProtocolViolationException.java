package io.ktor.websocket;

import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import t70.y;

@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00060\u0001j\u0002`\u00022\b\u0012\u0004\u0012\u00020\u00000\u0003¨\u0006\u0004"}, d2 = {"Lio/ktor/websocket/ProtocolViolationException;", "Ljava/lang/Exception;", "Lkotlin/Exception;", "Lt70/y;", "ktor-websockets"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class ProtocolViolationException extends Exception implements y {
    @Override // t70.y
    public final Throwable a() {
        Intrinsics.g(null, "violation");
        ProtocolViolationException protocolViolationException = new ProtocolViolationException();
        protocolViolationException.initCause(this);
        return protocolViolationException;
    }

    @Override // java.lang.Throwable
    public final String getMessage() {
        return "Received illegal frame: null";
    }
}
