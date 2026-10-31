package io.sentry;

import com.google.android.libraries.places.api.model.PlaceTypes;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.tiktok.util.TTConst;
import io.branch.search.internal.C3125e3;
import java.io.IOException;
import java.util.Arrays;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes4.dex */
public final class h3 implements i1 {

    /* renamed from: a, reason: collision with root package name */
    public int f67253a;

    /* renamed from: b, reason: collision with root package name */
    public String f67254b;

    /* renamed from: c, reason: collision with root package name */
    public String f67255c;

    /* renamed from: d, reason: collision with root package name */
    public String f67256d;

    /* renamed from: e, reason: collision with root package name */
    public Long f67257e;

    /* renamed from: f, reason: collision with root package name */
    public ConcurrentHashMap f67258f;

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || h3.class != obj.getClass()) {
            return false;
        }
        return i30.j.z(this.f67254b, ((h3) obj).f67254b);
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.f67254b});
    }

    @Override // io.sentry.i1
    public final void serialize(y1 y1Var, ILogger iLogger) throws IOException {
        e3 e3Var = (e3) y1Var;
        e3Var.f();
        e3Var.o(TTConst.TRACK_TYPE);
        e3Var.w(this.f67253a);
        if (this.f67254b != null) {
            e3Var.o(PlaceTypes.ADDRESS);
            e3Var.A(this.f67254b);
        }
        if (this.f67255c != null) {
            e3Var.o("package_name");
            e3Var.A(this.f67255c);
        }
        if (this.f67256d != null) {
            e3Var.o(TTEDPEventConstants.EDP_EVENT_PROPERTY_CLASS_NAME);
            e3Var.A(this.f67256d);
        }
        if (this.f67257e != null) {
            e3Var.o("thread_id");
            e3Var.z(this.f67257e);
        }
        ConcurrentHashMap concurrentHashMap = this.f67258f;
        if (concurrentHashMap != null) {
            for (String str : concurrentHashMap.keySet()) {
                C3125e3.a(this.f67258f, str, e3Var, str, iLogger);
            }
        }
        e3Var.i();
    }
}
