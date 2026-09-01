package defpackage;

import android.content.Context;
import android.os.Process;
import android.util.Log;
import androidx.datastore.core.CorruptionException;
import java.util.LinkedHashSet;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x86 {
    public static final /* synthetic */ fj6[] d = {n1b.a.h(new v4a(h41.NO_RECEIVER, x86.class, "dataStore", "getDataStore(Landroid/content/Context;)Landroidx/datastore/core/DataStore;", 0))};
    public final String a;
    public final ThreadLocal b;
    public final tt2 c;

    public x86(Context context, String str) {
        ly9 ly9Var;
        context.getClass();
        this.a = str;
        this.b = new ThreadLocal();
        final int i = 0;
        yl3 yl3Var = new yl3(new x45(this) { // from class: w86
            public final /* synthetic */ x86 b;

            {
                this.b = this;
            }

            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                int i2 = i;
                x86 x86Var = this.b;
                switch (i2) {
                    case 0:
                        CorruptionException corruptionException = (CorruptionException) obj;
                        corruptionException.getClass();
                        Log.w(n1b.a.b(x86.class).j(), "CorruptionException in " + x86Var.a + " DataStore running in process " + Process.myPid(), corruptionException);
                        return new b78(true);
                    default:
                        Context context2 = (Context) obj;
                        context2.getClass();
                        String str2 = x86Var.a;
                        LinkedHashSet linkedHashSet = x6c.a;
                        linkedHashSet.getClass();
                        return d46.Q(new w6c(context2, str2, y6c.a, new n79(linkedHashSet, null, 17), new m14(3, 6, (n92) null)));
                }
            }
        });
        final int i2 = 1;
        x45 x45Var = new x45(this) { // from class: w86
            public final /* synthetic */ x86 b;

            {
                this.b = this;
            }

            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                int i22 = i2;
                x86 x86Var = this.b;
                switch (i22) {
                    case 0:
                        CorruptionException corruptionException = (CorruptionException) obj;
                        corruptionException.getClass();
                        Log.w(n1b.a.b(x86.class).j(), "CorruptionException in " + x86Var.a + " DataStore running in process " + Process.myPid(), corruptionException);
                        return new b78(true);
                    default:
                        Context context2 = (Context) obj;
                        context2.getClass();
                        String str2 = x86Var.a;
                        LinkedHashSet linkedHashSet = x6c.a;
                        linkedHashSet.getClass();
                        return d46.Q(new w6c(context2, str2, y6c.a, new n79(linkedHashSet, null, 17), new m14(3, 6, (n92) null)));
                }
            }
        };
        r13 r13Var = xg3.a;
        vz2 vz2Var = vz2.c;
        m2d m2dVarH = qq7.h();
        vz2Var.getClass();
        my9 my9Var = new my9(str, yl3Var, x45Var, o7f.c(flb.p0(vz2Var, m2dVarH)));
        d[0].getClass();
        ly9 ly9Var2 = my9Var.f;
        if (ly9Var2 == null) {
            synchronized (my9Var.e) {
                try {
                    if (my9Var.f == null) {
                        Context applicationContext = context.getApplicationContext();
                        yl3 yl3Var2 = my9Var.b;
                        x45 x45Var2 = my9Var.c;
                        applicationContext.getClass();
                        List list = (List) x45Var2.invoke(applicationContext);
                        sb2 sb2Var = my9Var.d;
                        int i3 = 18;
                        cn cnVar = new cn(applicationContext, i3, my9Var);
                        list.getClass();
                        my9Var.f = new ly9(new ly9(new mu2(new wg4(no3.g, zu2.p, new bd9(4, cnVar)), d46.Q(new r91(list, (n92) null, i3)), yl3Var2, sb2Var)));
                    }
                    ly9Var = my9Var.f;
                    ly9Var.getClass();
                } catch (Throwable th) {
                    throw th;
                }
            }
            ly9Var2 = ly9Var;
        }
        this.c = ly9Var2;
    }

    public final void a(x45 x45Var) {
    }
}
