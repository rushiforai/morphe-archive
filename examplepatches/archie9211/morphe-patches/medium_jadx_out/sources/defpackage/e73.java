package defpackage;

import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteTransactionListener;
import android.os.CancellationSignal;
import android.os.Handler;
import android.os.Looper;
import android.view.inputmethod.InputMethodManager;
import com.google.android.material.internal.It.KLTXZbnQvj;
import com.medium.android.common.post.text.Kmm.pUlNWdybf;
import com.medium.android.following.FollowingTab;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Iterator;
import java.util.LinkedHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final /* synthetic */ class e73 implements m45 {
    public final /* synthetic */ int a;

    public /* synthetic */ e73(int i) {
        this.a = i;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        Class<?> returnType;
        int i = this.a;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                g04 entries = g73.getEntries();
                int iP = ei7.P(cu1.k0(entries, 10));
                if (iP < 16) {
                    iP = 16;
                }
                LinkedHashMap linkedHashMap = new LinkedHashMap(iP);
                Iterator<E> it2 = entries.iterator();
                while (it2.hasNext()) {
                    z26 z26Var = ((g73) it2.next()).a;
                    linkedHashMap.put(z26Var.a, z26Var);
                }
                return linkedHashMap;
            case 1:
                return Boolean.TRUE;
            case 2:
                return new Handler(Looper.getMainLooper());
            case 3:
                sn3 sn3Var = nw3.a;
                return uy2.a;
            case 4:
                return new vj3(0.0f);
            case 5:
            case 6:
                return c1eVar;
            case 7:
                return Integer.valueOf(((t0) FollowingTab.getEntries()).getSize());
            case 8:
            case 9:
            case 10:
                return c1eVar;
            case 11:
                try {
                    Method declaredMethod = SQLiteDatabase.class.getDeclaredMethod("getThreadSession", null);
                    declaredMethod.setAccessible(true);
                    return declaredMethod;
                } catch (Throwable unused) {
                    return null;
                }
            case 12:
                try {
                    Method method = (Method) z25.d.getValue();
                    if (method == null || (returnType = method.getReturnType()) == null) {
                        return null;
                    }
                    Class<?> cls = Integer.TYPE;
                    return returnType.getDeclaredMethod("beginTransaction", cls, SQLiteTransactionListener.class, cls, CancellationSignal.class);
                } catch (Throwable unused2) {
                    return null;
                }
            case 13:
                return new g49(0.0f);
            case 14:
                return new g49(0.0f);
            case 15:
                throw new IllegalStateException("CompositionLocal LocalHostDefaultProvider not present");
            case 16:
                r13 r13Var = xg3.a;
                return ff7.a.f;
            case 17:
                return (gva) qpe.a.getValue();
            case 18:
                try {
                    Field declaredField = InputMethodManager.class.getDeclaredField(pUlNWdybf.CYVuHFDPodHEnNN);
                    declaredField.setAccessible(true);
                    Field declaredField2 = InputMethodManager.class.getDeclaredField("mNextServedView");
                    declaredField2.setAccessible(true);
                    Field declaredField3 = InputMethodManager.class.getDeclaredField(KLTXZbnQvj.kAlYBGqAs);
                    declaredField3.setAccessible(true);
                    return new uy5(declaredField3, declaredField, declaredField2);
                } catch (NoSuchFieldException unused3) {
                    return ty5.a;
                }
            case 19:
                sn3 sn3Var2 = s06.a;
                return ny2.a;
            case 20:
                return null;
            case 21:
                return new vj3(48.0f);
            case 22:
            case 23:
                return c1eVar;
            case 24:
                return ad6.b;
            case 25:
                return qc6.b;
            case 26:
                return mc6.b;
            case 27:
                return wc6.b;
            case 28:
                return rb6.b;
            default:
                return new ur6(0, 0);
        }
    }
}
