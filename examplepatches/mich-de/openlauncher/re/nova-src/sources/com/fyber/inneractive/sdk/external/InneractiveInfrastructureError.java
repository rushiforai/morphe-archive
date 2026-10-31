package com.fyber.inneractive.sdk.external;

import com.fyber.inneractive.sdk.flow.i;
import com.fyber.inneractive.sdk.network.t;
import java.util.ArrayList;

/* loaded from: classes.dex */
public class InneractiveInfrastructureError extends InneractiveError {

    /* renamed from: a, reason: collision with root package name */
    public final InneractiveErrorCode f27999a;

    /* renamed from: b, reason: collision with root package name */
    public final i f28000b;

    /* renamed from: c, reason: collision with root package name */
    public final Throwable f28001c;

    /* renamed from: d, reason: collision with root package name */
    public Exception f28002d;

    /* renamed from: e, reason: collision with root package name */
    public final ArrayList f28003e;

    public InneractiveInfrastructureError(InneractiveErrorCode inneractiveErrorCode, i iVar) {
        this(inneractiveErrorCode, iVar, null);
    }

    public void addReportedError(t tVar) {
        this.f28003e.add(tVar);
    }

    @Override // com.fyber.inneractive.sdk.external.InneractiveError
    public String description() {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(this.f27999a);
        if (this.f28001c != null) {
            sb2.append(" : ");
            sb2.append(this.f28001c);
        }
        return sb2.toString();
    }

    public Throwable getCause() {
        Exception exc = this.f28002d;
        return exc == null ? this.f28001c : exc;
    }

    public InneractiveErrorCode getErrorCode() {
        return this.f27999a;
    }

    public i getFyberMarketplaceAdLoadFailureReason() {
        return this.f28000b;
    }

    public boolean isErrorAlreadyReported(t tVar) {
        return this.f28003e.contains(tVar);
    }

    public void setCause(Exception exc) {
        this.f28002d = exc;
    }

    public InneractiveInfrastructureError(InneractiveErrorCode inneractiveErrorCode, i iVar, Throwable th2) {
        this.f28003e = new ArrayList();
        this.f27999a = inneractiveErrorCode;
        this.f28000b = iVar;
        this.f28001c = th2;
    }
}
