package b4;

import android.os.Parcelable;
import android.util.SparseArray;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class w extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f17529j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ x f17530k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ w(x xVar, int i5) {
        super(0);
        this.f17529j = i5;
        this.f17530k = xVar;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f17529j) {
            case 0:
                SparseArray<Parcelable> sparseArray = new SparseArray<>();
                this.f17530k.A.saveHierarchyState(sparseArray);
                break;
            case 1:
                x xVar = this.f17530k;
                xVar.E.invoke(xVar.A);
                x7.u uVar = xVar.B;
                if (uVar != null) {
                    uVar.y();
                }
                xVar.B = null;
                break;
            case 2:
                x xVar2 = this.f17530k;
                xVar2.D.invoke(xVar2.A);
                break;
            default:
                x xVar3 = this.f17530k;
                xVar3.C.invoke(xVar3.A);
                break;
        }
        return Unit.f71706a;
    }
}
