package defpackage;

import com.medium.android.admin.stagebranch.StageBranchDataAdapter;
import java.lang.reflect.Method;
import java.lang.reflect.Type;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class h8 extends i8 {
    public final /* synthetic */ int h;
    public jb6 i;
    public final /* synthetic */ Type[] j;
    public final /* synthetic */ Type k;
    public final /* synthetic */ Set l;
    public final /* synthetic */ Set m;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ h8(Type type, Set set, StageBranchDataAdapter stageBranchDataAdapter, Method method, int i, boolean z, Type[] typeArr, Type type2, Set set2, Set set3, int i2) {
        super(type, set, stageBranchDataAdapter, method, i, 1, z);
        this.h = i2;
        this.j = typeArr;
        this.k = type2;
        this.l = set2;
        this.m = set3;
    }

    @Override // defpackage.i8
    public final void a(x38 x38Var, j8 j8Var) {
        int i = this.h;
        Set set = this.m;
        Type type = this.k;
        Type[] typeArr = this.j;
        Set set2 = this.l;
        switch (i) {
            case 0:
                super.a(x38Var, j8Var);
                this.i = (vn7.u(typeArr[0], type) && set2.equals(set)) ? x38Var.c(j8Var, type, set) : x38Var.a(type, set, null);
                break;
            default:
                super.a(x38Var, j8Var);
                this.i = (vn7.u(typeArr[0], type) && set2.equals(set)) ? x38Var.c(j8Var, typeArr[0], set2) : x38Var.a(typeArr[0], set2, null);
                break;
        }
    }

    @Override // defpackage.i8
    public Object b(hd6 hd6Var) {
        switch (this.h) {
            case 1:
                return c(this.i.a(hd6Var));
            default:
                return super.b(hd6Var);
        }
    }

    @Override // defpackage.i8
    public void d(zd6 zd6Var, Object obj) {
        switch (this.h) {
            case 0:
                this.i.e(zd6Var, c(obj));
                break;
            default:
                super.d(zd6Var, obj);
                break;
        }
    }
}
