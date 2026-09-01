package defpackage;

import android.content.res.Resources;
import android.graphics.Bitmap;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class a6c extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ j6c d;
    public final /* synthetic */ Bitmap e;
    public final /* synthetic */ nhc f;
    public final /* synthetic */ Resources g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ a6c(j6c j6cVar, Bitmap bitmap, nhc nhcVar, Resources resources, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = j6cVar;
        this.e = bitmap;
        this.f = nhcVar;
        this.g = resources;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new a6c(this.d, this.e, this.f, this.g, n92Var, 0);
            default:
                return new a6c(this.d, this.e, this.f, this.g, n92Var, 1);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = (sb2) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((a6c) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        Resources resources = this.g;
        Bitmap bitmap = this.e;
        j6c j6cVar = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 != 0) {
                    if (i2 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                try {
                    vx0.c0(f76.F(j6cVar), null, null, new eub(j6cVar, bitmap, null, 6), 3);
                    return c1eVar;
                } catch (UnsupportedOperationException e) {
                    wld.a.e(e, "Failed to generate image for save it.", new Object[0]);
                    String string = resources.getString(R.string.failed_to_generate_image);
                    string.getClass();
                    this.c = 1;
                    return nhc.c(this.f, string, null, null, this, 14) == tb2Var ? tb2Var : c1eVar;
                }
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 != 0) {
                    if (i3 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                try {
                    vx0.c0(f76.F(j6cVar), null, null, new mw9(j6cVar, bitmap, null, 26), 3);
                    return c1eVar;
                } catch (UnsupportedOperationException e2) {
                    wld.a.e(e2, "Failed to generate image for share it to Instagram.", new Object[0]);
                    String string2 = resources.getString(R.string.failed_to_generate_image);
                    string2.getClass();
                    this.c = 1;
                    return nhc.c(this.f, string2, null, null, this, 14) == tb2Var2 ? tb2Var2 : c1eVar;
                }
        }
    }
}
