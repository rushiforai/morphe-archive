package sg;

import android.os.Bundle;
import com.google.android.gms.common.ConnectionResult;

/* loaded from: classes.dex */
public final class c0 extends r {

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ e f87418g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c0(e eVar, int i5, Bundle bundle) {
        super(eVar, i5, bundle);
        this.f87418g = eVar;
    }

    @Override // sg.r
    public final boolean a() {
        this.f87418g.zzc.a(ConnectionResult.f31777k);
        return true;
    }

    @Override // sg.r
    public final void b(ConnectionResult connectionResult) {
        e eVar = this.f87418g;
        eVar.getClass();
        eVar.zzc.a(connectionResult);
    }
}
