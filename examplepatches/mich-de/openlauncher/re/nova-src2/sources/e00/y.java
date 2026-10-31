package e00;

import android.content.Context;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;

/* loaded from: classes4.dex */
public final /* synthetic */ class y implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f51164a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ w20.l f51165b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Context f51166c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ p1.e1 f51167d;

    public /* synthetic */ y(w20.l lVar, Context context, p1.e1 e1Var, int i5) {
        this.f51164a = i5;
        this.f51165b = lVar;
        this.f51166c = context;
        this.f51167d = e1Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:9:0x001b  */
    @Override // kotlin.jvm.functions.Function1
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj) {
        switch (this.f51164a) {
            case 0:
                this.f51167d.setValue(Boolean.valueOf(this.f51165b.a(this.f51166c)));
                return new s(1);
            default:
                Boolean bool = (Boolean) obj;
                if (bool.booleanValue()) {
                    w20.l lVar = this.f51165b;
                    if (lVar.a(this.f51166c)) {
                        this.f51167d.setValue(bool);
                    } else {
                        lVar.c();
                    }
                }
                return Unit.f71706a;
        }
    }
}
