package defpackage;

import android.content.res.AssetManager;
import android.os.Build;
import com.apollographql.apollo.exception.ApolloException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.Serializable;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.Executor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class i00 {
    public boolean a;
    public final Object b;
    public Object c;
    public final Object d;
    public Object e;
    public final Object f;
    public Object g;
    public Object h;

    public i00(int[] iArr, int[] iArr2, xi1 xi1Var) {
        Integer numValueOf;
        this.b = xi1Var;
        this.c = iArr;
        this.d = new h49(c(iArr));
        this.e = iArr2;
        this.f = new h49(d(iArr, iArr2));
        if (iArr.length == 0) {
            numValueOf = null;
        } else {
            int i = iArr[0];
            int i2 = 1;
            int length = iArr.length - 1;
            if (1 <= length) {
                while (true) {
                    int i3 = iArr[i2];
                    i = i > i3 ? i3 : i;
                    if (i2 == length) {
                        break;
                    } else {
                        i2++;
                    }
                }
            }
            numValueOf = Integer.valueOf(i);
        }
        this.h = new au6(numValueOf != null ? numValueOf.intValue() : 0, 90, 200);
    }

    public static int c(int[] iArr) {
        int length = iArr.length;
        int i = Integer.MAX_VALUE;
        int i2 = 0;
        while (true) {
            if (i2 >= length) {
                if (i == Integer.MAX_VALUE) {
                    break;
                }
                return i;
            }
            int i3 = iArr[i2];
            if (i3 <= 0) {
                break;
            }
            if (i > i3) {
                i = i3;
            }
            i2++;
        }
        return 0;
    }

    public static int d(int[] iArr, int[] iArr2) {
        int iC = c(iArr);
        int length = iArr2.length;
        int iMin = Integer.MAX_VALUE;
        for (int i = 0; i < length; i++) {
            if (iArr[i] == iC) {
                iMin = Math.min(iMin, iArr2[i]);
            }
        }
        if (iMin == Integer.MAX_VALUE) {
            return 0;
        }
        return iMin;
    }

    public void a(s44 s44Var) {
        s44Var.getClass();
        this.h = ((s44) this.h).c(s44Var);
    }

    public j00 b() {
        hv8 hv8Var = (hv8) this.b;
        UUID uuid = (UUID) this.c;
        du8 du8Var = (du8) this.d;
        s44 s44Var = (s44) this.h;
        Map map = (Map) this.f;
        if (map == null) {
            map = fy3.a;
        }
        return new j00(uuid, hv8Var, du8Var, (List) this.e, (ApolloException) this.g, map, s44Var, this.a);
    }

    public void e(ip6 ip6Var) {
        iq1 iq1Var = (iq1) this.g;
        if (iq1Var == null || ip6Var != ((ip6) this.h) || iq1Var.a()) {
            this.h = ip6Var;
            iq1Var = new iq1((mx) this.b, il7.C((mkd) this.c, ip6Var), (List) this.e, (m73) this.d, (yy4) this.f);
        }
        this.g = iq1Var;
    }

    public FileInputStream f(AssetManager assetManager, String str) {
        try {
            return assetManager.openFd(str).createInputStream();
        } catch (FileNotFoundException e) {
            String message = e.getMessage();
            if (message == null || !message.contains("compressed")) {
                return null;
            }
            ((u2a) this.c).B();
            return null;
        }
    }

    public void g(int i, Serializable serializable) {
        ((Executor) this.b).execute(new uy1(this, i, serializable, 2));
    }

    public i00(mx mxVar, mkd mkdVar, boolean z, m73 m73Var, yy4 yy4Var, List list) {
        this.b = mxVar;
        this.c = mkdVar;
        this.a = z;
        this.d = m73Var;
        this.f = yy4Var;
        this.e = list;
    }

    public i00(AssetManager assetManager, Executor executor, u2a u2aVar, String str, File file) {
        this.a = false;
        this.b = executor;
        this.c = u2aVar;
        this.f = str;
        this.e = file;
        int i = Build.VERSION.SDK_INT;
        byte[] bArr = null;
        if (i >= 24) {
            if (i >= 31) {
                bArr = vc2.k;
            } else {
                switch (i) {
                    case 24:
                    case 25:
                        bArr = vc2.o;
                        break;
                    case 26:
                        bArr = vc2.n;
                        break;
                    case 27:
                        bArr = vc2.m;
                        break;
                    case 28:
                    case 29:
                    case 30:
                        bArr = vc2.l;
                        break;
                }
            }
        }
        this.d = bArr;
    }

    public i00(hv8 hv8Var, UUID uuid, du8 du8Var, List list, Map map, ApolloException apolloException) {
        hv8Var.getClass();
        uuid.getClass();
        this.b = hv8Var;
        this.c = uuid;
        this.d = du8Var;
        this.e = list;
        this.f = map;
        this.g = apolloException;
        this.h = by3.a;
    }
}
