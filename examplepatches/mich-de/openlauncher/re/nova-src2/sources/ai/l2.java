package ai;

import android.os.Bundle;
import java.lang.reflect.InvocationTargetException;

/* loaded from: classes3.dex */
public final class l2 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ String f13105a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f13106b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ long f13107c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ long f13108d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Bundle f13109e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ boolean f13110f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ boolean f13111g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ boolean f13112h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ t2 f13113i;

    public l2(t2 t2Var, String str, String str2, long j11, long j12, Bundle bundle, boolean z11, boolean z12, boolean z13) {
        this.f13105a = str;
        this.f13106b = str2;
        this.f13107c = j11;
        this.f13108d = j12;
        this.f13109e = bundle;
        this.f13110f = z11;
        this.f13111g = z12;
        this.f13112h = z13;
        this.f13113i = t2Var;
    }

    @Override // java.lang.Runnable
    public final void run() throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        this.f13113i.M(this.f13105a, this.f13106b, this.f13107c, this.f13108d, this.f13109e, this.f13110f, this.f13111g, this.f13112h);
    }
}
