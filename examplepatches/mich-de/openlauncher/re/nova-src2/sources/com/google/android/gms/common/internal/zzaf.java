package com.google.android.gms.common.internal;

import com.google.android.gms.common.ConnectionResult;
import sg.w;

/* loaded from: classes.dex */
public final class zzaf extends Exception {

    /* renamed from: a, reason: collision with root package name */
    public final ConnectionResult f31880a;

    public zzaf(ConnectionResult connectionResult) {
        w.a("ResolvableConnectionException can only be created with a connection result containing a resolution.", (connectionResult.f31779g == 0 || connectionResult.f31780h == null) ? false : true);
        this.f31880a = connectionResult;
    }
}
