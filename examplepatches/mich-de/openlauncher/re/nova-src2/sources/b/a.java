package b;

import ads_mobile_sdk.lg0;
import ads_mobile_sdk.pb3;
import ads_mobile_sdk.sv2;
import ads_mobile_sdk.t02;
import ads_mobile_sdk.uo3;
import ads_mobile_sdk.wk3;
import ads_mobile_sdk.z93;
import android.os.Build;
import java.lang.ref.WeakReference;

/* loaded from: classes2.dex */
public final class a implements bb {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15779a;

    public /* synthetic */ a(int i5) {
        this.f15779a = i5;
    }

    @Override // b.m5
    public final Object get() {
        switch (this.f15779a) {
            case 0:
                String str = Build.HOST;
                k9.L(str);
                return str;
            case 1:
                return new m0();
            case 2:
                return new com.google.gson.r();
            case 3:
                return new o1();
            case 4:
                return new z2();
            case 5:
                return 1;
            case 6:
                return new uo3();
            case 7:
                return new lg0();
            case 8:
                return new o6();
            case 9:
                return new r7();
            case 10:
                return new pb3();
            case 11:
                return new z93();
            case 12:
                return wk3.f11316a;
            case 13:
                return wk3.a$1;
            case 14:
                return new sv2();
            case 15:
                t02 t02Var = new t02();
                t02Var.f9750a = new WeakReference(null);
                t02Var.f9751b = new WeakReference(null);
                t02Var.f9752c = new WeakReference(null);
                t02Var.f9753d = new WeakReference(null);
                return t02Var;
            case 16:
                return new ads_mobile_sdk.v3();
            default:
                return new wb();
        }
    }
}
