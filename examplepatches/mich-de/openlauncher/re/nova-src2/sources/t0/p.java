package t0;

import androidx.compose.runtime.snapshots.SnapshotStateList;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import p1.s2;

/* loaded from: classes2.dex */
public final /* synthetic */ class p implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f88164a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ y1 f88165b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function1 f88166c;

    public /* synthetic */ p(y1 y1Var, Function1 function1, int i5) {
        this.f88164a = i5;
        this.f88165b = y1Var;
        this.f88166c = function1;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f88164a) {
            case 0:
                m3.l0 l0Var = (m3.l0) obj;
                y1 y1Var = this.f88165b;
                if (y1Var != null) {
                    ((s2) y1Var.f88303a).setValue(l0Var);
                }
                Function1 function1 = this.f88166c;
                if (function1 != null) {
                    function1.invoke(l0Var);
                }
                return Unit.f71706a;
            default:
                y1 y1Var2 = this.f88165b;
                SnapshotStateList snapshotStateList = y1Var2.f88305c;
                Function1 function12 = this.f88166c;
                snapshotStateList.add(function12);
                return new b00.g0(17, y1Var2, function12);
        }
    }
}
