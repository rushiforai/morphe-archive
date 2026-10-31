package io.sentry.transport;

import java.net.Authenticator;
import java.net.PasswordAuthentication;

/* loaded from: classes4.dex */
public final class j extends Authenticator {

    /* renamed from: a, reason: collision with root package name */
    public final String f67806a;

    /* renamed from: b, reason: collision with root package name */
    public final String f67807b;

    public j(String str, String str2) {
        this.f67806a = str;
        this.f67807b = str2;
    }

    @Override // java.net.Authenticator
    public final PasswordAuthentication getPasswordAuthentication() {
        if (getRequestorType() != Authenticator.RequestorType.PROXY) {
            return null;
        }
        return new PasswordAuthentication(this.f67806a, this.f67807b.toCharArray());
    }
}
