package org.chromium.net.impl;

import org.chromium.net.NetworkException;

/* loaded from: classes5.dex */
public class NetworkExceptionImpl extends NetworkException {

    /* renamed from: a, reason: collision with root package name */
    public final int f80628a;

    /* renamed from: b, reason: collision with root package name */
    public final int f80629b;

    public NetworkExceptionImpl() {
        super("Network bound to request not found", null);
        this.f80628a = 9;
        this.f80629b = -4;
    }

    @Override // org.chromium.net.NetworkException
    public final int getCronetInternalErrorCode() {
        return this.f80629b;
    }

    @Override // org.chromium.net.NetworkException
    public final int getErrorCode() {
        return this.f80628a;
    }

    @Override // java.lang.Throwable
    public final String getMessage() {
        StringBuilder sb2 = new StringBuilder(super.getMessage());
        sb2.append(", ErrorCode=");
        sb2.append(this.f80628a);
        int i5 = this.f80629b;
        if (i5 != 0) {
            sb2.append(", InternalErrorCode=");
            sb2.append(i5);
        }
        sb2.append(", Retryable=");
        sb2.append(immediatelyRetryable());
        return sb2.toString();
    }

    @Override // org.chromium.net.NetworkException
    public final boolean immediatelyRetryable() {
        int i5 = this.f80628a;
        return i5 == 3 || i5 == 4 || i5 == 5 || i5 == 6 || i5 == 8;
    }
}
