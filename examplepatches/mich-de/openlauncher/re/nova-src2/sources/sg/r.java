package sg;

import android.os.Bundle;
import com.google.android.gms.common.ConnectionResult;

/* loaded from: classes.dex */
public abstract class r {

    /* renamed from: a, reason: collision with root package name */
    public Boolean f87458a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f87459b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ e f87460c;

    /* renamed from: d, reason: collision with root package name */
    public final int f87461d;

    /* renamed from: e, reason: collision with root package name */
    public final Bundle f87462e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ e f87463f;

    public r(e eVar, int i5, Bundle bundle) {
        this.f87463f = eVar;
        Boolean bool = Boolean.TRUE;
        this.f87460c = eVar;
        this.f87458a = bool;
        this.f87459b = false;
        this.f87461d = i5;
        this.f87462e = bundle;
    }

    public abstract boolean a();

    public abstract void b(ConnectionResult connectionResult);
}
