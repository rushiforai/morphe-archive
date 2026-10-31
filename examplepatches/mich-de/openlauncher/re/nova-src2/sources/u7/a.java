package u7;

import android.os.Build;
import kotlin.jvm.internal.Intrinsics;
import x7.q;

/* loaded from: classes.dex */
public final class a extends c {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f90661b;

    /* renamed from: c, reason: collision with root package name */
    public final int f90662c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a(v7.e tracker, int i5) {
        super(tracker);
        this.f90661b = i5;
        switch (i5) {
            case 2:
                Intrinsics.g(tracker, "tracker");
                super(tracker);
                this.f90662c = 7;
                break;
            case 3:
                Intrinsics.g(tracker, "tracker");
                super(tracker);
                this.f90662c = 7;
                break;
            case 4:
                Intrinsics.g(tracker, "tracker");
                super(tracker);
                this.f90662c = 9;
                break;
            default:
                Intrinsics.g(tracker, "tracker");
                this.f90662c = 6;
                break;
        }
    }

    @Override // u7.c
    public final int a() {
        switch (this.f90661b) {
        }
        return this.f90662c;
    }

    @Override // u7.c
    public final boolean b(q qVar) {
        switch (this.f90661b) {
            case 0:
                return qVar.f95180j.f79654b;
            case 1:
                return qVar.f95180j.f79656d;
            case 2:
                return qVar.f95180j.f79653a == 2;
            case 3:
                int i5 = qVar.f95180j.f79653a;
                return i5 == 3 || (Build.VERSION.SDK_INT >= 30 && i5 == 6);
            default:
                return qVar.f95180j.f79657e;
        }
    }

    @Override // u7.c
    public final boolean c(Object obj) {
        boolean zBooleanValue;
        switch (this.f90661b) {
            case 0:
                zBooleanValue = ((Boolean) obj).booleanValue();
                break;
            case 1:
                zBooleanValue = ((Boolean) obj).booleanValue();
                break;
            case 2:
                t7.e value = (t7.e) obj;
                Intrinsics.g(value, "value");
                return (value.f88763a && value.f88764b) ? false : true;
            case 3:
                t7.e value2 = (t7.e) obj;
                Intrinsics.g(value2, "value");
                return !value2.f88763a || value2.f88765c;
            default:
                zBooleanValue = ((Boolean) obj).booleanValue();
                break;
        }
        return !zBooleanValue;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a(v7.a tracker) {
        super(tracker);
        this.f90661b = 1;
        Intrinsics.g(tracker, "tracker");
        this.f90662c = 5;
    }
}
