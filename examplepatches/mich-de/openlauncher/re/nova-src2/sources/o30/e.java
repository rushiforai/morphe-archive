package o30;

import ai.w2;
import android.os.Binder;
import android.os.IBinder;
import android.os.Parcel;

/* loaded from: classes4.dex */
public final class e extends Binder implements p30.b {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f79478a;

    /* renamed from: b, reason: collision with root package name */
    public final c f79479b;

    /* renamed from: c, reason: collision with root package name */
    public final Runnable f79480c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ b f79481d;

    public e() {
        attachInterface(this, "com.android.vending.licensing.ILicenseResultListener");
    }

    @Override // android.os.IInterface
    public final IBinder asBinder() {
        return this;
    }

    @Override // android.os.Binder
    public final boolean onTransact(int i5, Parcel parcel, Parcel parcel2, int i11) {
        if (i5 == 1) {
            parcel.enforceInterface("com.android.vending.licensing.ILicenseResultListener");
            p(parcel.readInt(), parcel.readString(), parcel.readString());
            return true;
        }
        if (i5 != 1598968902) {
            return super.onTransact(i5, parcel, parcel2, i11);
        }
        parcel2.writeString("com.android.vending.licensing.ILicenseResultListener");
        return true;
    }

    @Override // p30.b
    public final void p(int i5, String str, String str2) {
        switch (this.f79478a) {
            case 0:
                ((f) this.f79481d).f79487e.post(new w2(this, str, i5, str2));
                break;
            default:
                ((i) this.f79481d).f79510e.post(new w2(i5, 5, this, str, str2));
                break;
        }
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public e(f fVar, c cVar) {
        this();
        this.f79478a = 0;
        this.f79481d = fVar;
        this.f79479b = cVar;
        ai.h hVar = new ai.h(this, 28);
        this.f79480c = hVar;
        fVar.f79487e.postDelayed(hVar, 12522L);
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public e(i iVar, c cVar) {
        this();
        this.f79478a = 1;
        this.f79481d = iVar;
        this.f79479b = cVar;
        zn.c cVar2 = new zn.c(this);
        this.f79480c = cVar2;
        iVar.f79510e.postDelayed(cVar2, com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c);
    }
}
