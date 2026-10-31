package ads_mobile_sdk;

import android.os.BadParcelableException;
import android.os.Parcel;
import b.ed;

/* loaded from: classes.dex */
public final class sl2 extends b.s8 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ tl2 f9609a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public sl2(tl2 tl2Var) {
        super("com.google.android.play.core.prewarm.protocol.IPrewarmServiceCallback", 0);
        this.f9609a = tl2Var;
    }

    @Override // b.s8
    public final boolean a(int i5, Parcel parcel, Parcel parcel2) {
        if (i5 != 1) {
            return false;
        }
        int iDataAvail = parcel.dataAvail();
        if (iDataAvail > 0) {
            throw new BadParcelableException(ed.i("Parcel data not fully consumed, unread size: ", iDataAvail));
        }
        tl2 tl2Var = this.f9609a;
        if (tl2Var.f9989a != null) {
            tl2.f9987c.a("detach", new Object[0]);
            k33 k33Var = tl2Var.f9989a;
            k33Var.getClass();
            k33Var.b(new f33(k33Var, 0));
        }
        return true;
    }
}
