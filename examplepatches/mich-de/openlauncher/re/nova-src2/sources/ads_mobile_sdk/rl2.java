package ads_mobile_sdk;

import android.os.Bundle;
import android.os.Parcel;
import android.os.RemoteException;
import android.util.Log;
import b.y8;
import java.util.ArrayList;

/* loaded from: classes.dex */
public final class rl2 extends e13 {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ hi2 f9227b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ fi.j f9228c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ tl2 f9229d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public rl2(tl2 tl2Var, fi.j jVar, hi2 hi2Var, fi.j jVar2) {
        super(jVar);
        this.f9229d = tl2Var;
        this.f9227b = hi2Var;
        this.f9228c = jVar2;
    }

    @Override // ads_mobile_sdk.e13
    public final void a() {
        tl2 tl2Var = this.f9229d;
        String str = tl2Var.f9990b;
        try {
            y8 y8Var = tl2Var.f9989a.n;
            ArrayList arrayListA = tl2.a(this.f9227b);
            Bundle bundle = new Bundle();
            sl2 sl2Var = new sl2(tl2Var);
            b.i7 i7Var = (b.i7) y8Var;
            i7Var.getClass();
            Parcel parcelObtain = Parcel.obtain();
            parcelObtain.writeInterfaceToken(i7Var.f74936c);
            parcelObtain.writeString(str);
            parcelObtain.writeTypedList(arrayListA);
            parcelObtain.writeInt(1);
            bundle.writeToParcel(parcelObtain, 0);
            parcelObtain.writeStrongBinder(sl2Var);
            try {
                i7Var.f74935b.transact(1, parcelObtain, null, 1);
            } finally {
                parcelObtain.recycle();
            }
        } catch (RemoteException e3) {
            c7 c7Var = tl2.f9987c;
            Object[] objArr = {str};
            c7Var.getClass();
            if (Log.isLoggable("PlayCore", 6)) {
                Log.e("PlayCore", c7.a((String) c7Var.f1694a, "prewarm(%s)", objArr), e3);
            }
            this.f9228c.b(new RuntimeException(e3));
        }
    }
}
