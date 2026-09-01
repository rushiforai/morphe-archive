package defpackage;

import com.medium.android.admin.stagebranch.StageBranchDataAdapter;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Type;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class g8 extends i8 {
    public final /* synthetic */ int h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ g8(Type type, Set set, StageBranchDataAdapter stageBranchDataAdapter, Method method, int i, int i2, boolean z, int i3) {
        super(type, set, stageBranchDataAdapter, method, i, i2, z);
        this.h = i3;
    }

    @Override // defpackage.i8
    public Object b(hd6 hd6Var) {
        switch (this.h) {
            case 1:
                return c(hd6Var);
            default:
                return super.b(hd6Var);
        }
    }

    @Override // defpackage.i8
    public void d(zd6 zd6Var, Object obj) throws InvocationTargetException {
        switch (this.h) {
            case 0:
                jb6[] jb6VarArr = this.f;
                Object[] objArr = new Object[jb6VarArr.length + 2];
                objArr[0] = zd6Var;
                objArr[1] = obj;
                System.arraycopy(jb6VarArr, 0, objArr, 2, jb6VarArr.length);
                try {
                    this.d.invoke(this.c, objArr);
                } catch (IllegalAccessException unused) {
                    ywb.d();
                    return;
                }
                break;
            default:
                super.d(zd6Var, obj);
                break;
        }
    }
}
