package zv;

import h6.n0;
import kotlin.Function;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.FunctionAdapter;

/* loaded from: classes4.dex */
public final /* synthetic */ class f implements n0, FunctionAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f98698a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function1 f98699b;

    public /* synthetic */ f(Function1 function1, int i5) {
        this.f98698a = i5;
        this.f98699b = function1;
    }

    @Override // kotlin.jvm.internal.FunctionAdapter
    public final Function b() {
        switch (this.f98698a) {
        }
        return this.f98699b;
    }

    public final boolean equals(Object obj) {
        switch (this.f98698a) {
            case 0:
                if ((obj instanceof n0) && (obj instanceof FunctionAdapter)) {
                    break;
                }
                break;
            default:
                if ((obj instanceof n0) && (obj instanceof FunctionAdapter)) {
                    break;
                }
                break;
        }
        return this.f98699b.equals(((FunctionAdapter) obj).b());
    }

    public final int hashCode() {
        switch (this.f98698a) {
        }
        return this.f98699b.hashCode();
    }

    @Override // h6.n0
    public final /* synthetic */ void onChanged(Object obj) {
        switch (this.f98698a) {
            case 0:
                this.f98699b.invoke(obj);
                break;
            default:
                this.f98699b.invoke(obj);
                break;
        }
    }
}
