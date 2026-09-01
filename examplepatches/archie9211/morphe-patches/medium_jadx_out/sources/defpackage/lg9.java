package defpackage;

import android.os.Build;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.ServiceConfigurationError;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class lg9 implements m45 {
    public final /* synthetic */ int a;

    public /* synthetic */ lg9(int i) {
        this.a = i;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        ServiceConfigurationError serviceConfigurationError;
        int i = this.a;
        Object obj = null;
        int i2 = 0;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
                return c1eVar;
            case 6:
                return new g49(0.0f);
            case 7:
                return new g49(0.0f);
            case 8:
                return c1eVar;
            case 9:
                return new npa(new ou(Float.valueOf(0.0f), d46.i, obj, 12));
            case 10:
                List listF1 = bu1.f1((List) m0c.a.getValue(), new js4(29));
                ArrayList arrayList = new ArrayList();
                int size = listF1.size();
                while (i2 < size) {
                    ((wp8) listF1.get(i2)).getClass();
                    arrayList.add(new f09(new wd8(new oo7(24)), n1b.a.b(d7e.class)));
                    i2++;
                }
                return arrayList;
            case 11:
                List listF12 = bu1.f1((List) m0c.b.getValue(), new lva(i2));
                ArrayList arrayList2 = new ArrayList();
                int size2 = listF12.size();
                while (i2 < size2) {
                    ((dd5) listF12.get(i2)).getClass();
                    arrayList2.add(Build.VERSION.SDK_INT >= 28 ? new qv() : new bd5());
                    i2++;
                }
                return arrayList2;
            case 12:
            case 13:
            case 14:
                return c1eVar;
            case 15:
                return new kz0();
            case 16:
                return new lkb();
            case 17:
                return new mkb();
            case 18:
                return new oob(new LinkedHashMap());
            case 19:
            case 20:
                return null;
            case 21:
                return new yrb(0);
            case 22:
                return null;
            case 23:
                try {
                    return nk7.z0(szb.O0(szb.F0(Arrays.asList(new wp8()).iterator())));
                } finally {
                }
            case 24:
                try {
                    return nk7.z0(szb.O0(szb.F0(Arrays.asList(new dd5()).iterator())));
                } finally {
                }
            case 25:
                juc jucVar = juc.a;
                return new r07(r1a.a);
            case 26:
                return new w4c(null, null, null, 31);
            case 27:
                return new x4c(bmb.a(4.0f), bmb.a(4.0f), bmb.a(0.0f));
            case 28:
                return g8c.a;
            default:
                return c1eVar;
        }
    }
}
