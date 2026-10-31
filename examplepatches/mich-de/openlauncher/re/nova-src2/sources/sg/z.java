package sg;

import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.util.Log;
import b.s8;
import com.google.android.gms.common.internal.zzj;

/* loaded from: classes.dex */
public final class z extends s8 {

    /* renamed from: j, reason: collision with root package name */
    public e f87470j;

    /* renamed from: k, reason: collision with root package name */
    public final int f87471k;

    public z(e eVar, int i5) {
        super("com.google.android.gms.common.internal.IGmsCallbacks", 1);
        this.f87470j = eVar;
        this.f87471k = i5;
    }

    @Override // b.s8
    public final boolean T(int i5, Parcel parcel, Parcel parcel2) {
        int i11 = this.f87471k;
        if (i5 == 1) {
            int i12 = parcel.readInt();
            IBinder strongBinder = parcel.readStrongBinder();
            Bundle bundle = (Bundle) u90.b.j0(parcel, Bundle.CREATOR);
            u90.b.l0(parcel);
            w.i(this.f87470j, "onPostInitComplete can be called only once per call to getRemoteService");
            e eVar = this.f87470j;
            eVar.getClass();
            b0 b0Var = new b0(eVar, i12, strongBinder, bundle);
            y yVar = eVar.zzb;
            yVar.sendMessage(yVar.obtainMessage(1, i11, -1, b0Var));
            this.f87470j = null;
        } else if (i5 == 2) {
            parcel.readInt();
            u90.b.l0(parcel);
            Log.wtf("GmsClient", "received deprecated onAccountValidationComplete callback, ignoring", new Exception());
        } else {
            if (i5 != 3) {
                return false;
            }
            int i13 = parcel.readInt();
            IBinder strongBinder2 = parcel.readStrongBinder();
            zzj zzjVar = (zzj) u90.b.j0(parcel, zzj.CREATOR);
            u90.b.l0(parcel);
            e eVar2 = this.f87470j;
            w.i(eVar2, "onPostInitCompleteWithConnectionInfo can be called only once per call togetRemoteService");
            w.h(zzjVar);
            eVar2.zzc(zzjVar);
            Bundle bundle2 = zzjVar.f31881f;
            w.i(this.f87470j, "onPostInitComplete can be called only once per call to getRemoteService");
            e eVar3 = this.f87470j;
            eVar3.getClass();
            b0 b0Var2 = new b0(eVar3, i13, strongBinder2, bundle2);
            y yVar2 = eVar3.zzb;
            yVar2.sendMessage(yVar2.obtainMessage(1, i11, -1, b0Var2));
            this.f87470j = null;
        }
        parcel2.writeNoException();
        return true;
    }
}
