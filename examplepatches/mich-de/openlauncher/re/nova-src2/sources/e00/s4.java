package e00;

import android.content.Context;
import androidx.compose.runtime.snapshots.SnapshotStateList;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;

/* loaded from: classes4.dex */
public final class s4 implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f50969a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ p1.e1 f50970b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ t70.j0 f50971c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ SnapshotStateList f50972d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ SnapshotStateList f50973e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Context f50974f;

    public s4(int i5, p1.e1 e1Var, t70.j0 j0Var, SnapshotStateList snapshotStateList, SnapshotStateList snapshotStateList2, Context context) {
        this.f50969a = i5;
        this.f50970b = e1Var;
        this.f50971c = j0Var;
        this.f50972d = snapshotStateList;
        this.f50973e = snapshotStateList2;
        this.f50974f = context;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        if (this.f50969a >= 0 && !((Boolean) this.f50970b.getValue()).booleanValue()) {
            t70.m0.t(this.f50971c, null, null, new x4(this.f50972d, this.f50969a, this.f50973e, this.f50974f, null), 3);
        }
        return Unit.f71706a;
    }
}
