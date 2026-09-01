package defpackage;

import com.medium.android.core.models.ReadingContext;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class hw9 extends p4d implements b55 {
    public int b;
    public final /* synthetic */ sw9 c;
    public final /* synthetic */ yd4 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public hw9(sw9 sw9Var, yd4 yd4Var, n92 n92Var) {
        super(2, n92Var);
        this.c = sw9Var;
        this.d = yd4Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        return new hw9(this.c, this.d, n92Var);
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((hw9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.b;
        if (i == 0) {
            br7.v(obj);
            sw9 sw9Var = this.c;
            ReadingContext readingContext = sw9Var.c;
            if (!(readingContext instanceof ReadingContext.Catalog)) {
                if (readingContext instanceof ReadingContext.Default) {
                    return ey3.a;
                }
                ygf.a();
                return null;
            }
            String catalogId = ((ReadingContext.Catalog) readingContext).getCatalogId();
            this.b = 1;
            obj = sw9Var.m(catalogId, this.d, this);
            if (obj == tb2Var) {
                return tb2Var;
            }
        } else {
            if (i != 1) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
        }
        return (List) obj;
    }
}
