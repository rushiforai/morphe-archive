package defpackage;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.res.TypedArray;
import android.content.res.XmlResourceParser;
import android.util.Log;
import android.util.Xml;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.constraintlayout.widget.ConstraintLayout;
import com.medium.android.common.post.text.Kmm.pUlNWdybf;
import java.lang.reflect.Array;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class u11 implements x60, lre {
    public final /* synthetic */ int a;
    public int b;
    public int c;
    public final Object d;

    public u11(Context context, XmlResourceParser xmlResourceParser) {
        this.a = 1;
        this.d = new ArrayList();
        this.c = -1;
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(Xml.asAttributeSet(xmlResourceParser), xra.h);
        int indexCount = typedArrayObtainStyledAttributes.getIndexCount();
        for (int i = 0; i < indexCount; i++) {
            int index = typedArrayObtainStyledAttributes.getIndex(i);
            if (index == 0) {
                this.b = typedArrayObtainStyledAttributes.getResourceId(index, this.b);
            } else if (index == 1) {
                int resourceId = typedArrayObtainStyledAttributes.getResourceId(index, this.c);
                this.c = resourceId;
                String resourceTypeName = context.getResources().getResourceTypeName(resourceId);
                context.getResources().getResourceName(resourceId);
                if ("layout".equals(resourceTypeName)) {
                    new j62().b((ConstraintLayout) LayoutInflater.from(context).inflate(resourceId, (ViewGroup) null));
                }
            }
        }
        typedArrayObtainStyledAttributes.recycle();
    }

    public byte a(int i, int i2) {
        return ((byte[][]) this.d)[i2][i];
    }

    @Override // defpackage.jre
    public boolean b() {
        return false;
    }

    @Override // defpackage.x60
    public void c(int i, Object obj) {
        ((x60) this.d).c(i + (this.c == 0 ? this.b : 0), obj);
    }

    @Override // defpackage.x60
    public void d(Object obj) {
        this.c++;
        ((x60) this.d).d(obj);
    }

    @Override // defpackage.x60
    public void e() {
        ((x60) this.d).e();
    }

    @Override // defpackage.x60
    public void f(int i, int i2, int i3) {
        int i4 = this.c == 0 ? this.b : 0;
        ((x60) this.d).f(i + i4, i2 + i4, i3);
    }

    @Override // defpackage.x60
    public void g(int i, int i2) {
        ((x60) this.d).g(i + (this.c == 0 ? this.b : 0), i2);
    }

    public void h(int i, int i2, int i3) {
        ((byte[][]) this.d)[i2][i] = (byte) i3;
    }

    @Override // defpackage.x60
    public void i() {
        if (this.c <= 0) {
            b22.a("OffsetApplier up called with no corresponding down");
        }
        this.c--;
        ((x60) this.d).i();
    }

    @Override // defpackage.jre
    public dx j(long j, dx dxVar, dx dxVar2, dx dxVar3) {
        return ((o2b) this.d).j(j, dxVar, dxVar2, dxVar3);
    }

    @Override // defpackage.x60
    public void k(int i, Object obj) {
        ((x60) this.d).k(i + (this.c == 0 ? this.b : 0), obj);
    }

    @Override // defpackage.x60
    public void l() {
    }

    @Override // defpackage.lre
    public int m() {
        return this.c;
    }

    @Override // defpackage.x60
    public void n(b55 b55Var, Object obj) {
        ((x60) this.d).n(b55Var, obj);
    }

    public void o(int i, int i2, boolean z) {
        ((byte[][]) this.d)[i2][i] = z ? (byte) 1 : (byte) 0;
    }

    public synchronized int p() {
        PackageInfo packageInfo;
        if (this.b == 0) {
            try {
                packageInfo = e9f.a((Context) this.d).a.getPackageManager().getPackageInfo(pUlNWdybf.OGINIBmIvq, 0);
            } catch (PackageManager.NameNotFoundException e) {
                Log.w("Metadata", "Failed to find package ".concat(e.toString()));
                packageInfo = null;
            }
            if (packageInfo != null) {
                this.b = packageInfo.versionCode;
            }
        }
        return this.b;
    }

    @Override // defpackage.lre
    public int q() {
        return this.b;
    }

    @Override // defpackage.jre
    public dx r(long j, dx dxVar, dx dxVar2, dx dxVar3) {
        return ((o2b) this.d).r(j, dxVar, dxVar2, dxVar3);
    }

    @Override // defpackage.jre
    public dx s(dx dxVar, dx dxVar2, dx dxVar3) {
        return ((o2b) this.d).j(t(dxVar, dxVar2, dxVar3), dxVar, dxVar2, dxVar3);
    }

    @Override // defpackage.jre
    public long t(dx dxVar, dx dxVar2, dx dxVar3) {
        return ((long) (q() + m())) * 1000000;
    }

    public String toString() {
        switch (this.a) {
            case 0:
                int i = this.b;
                int i2 = this.c;
                StringBuilder sb = new StringBuilder((i * 2 * i2) + 2);
                for (int i3 = 0; i3 < i2; i3++) {
                    byte[] bArr = ((byte[][]) this.d)[i3];
                    for (int i4 = 0; i4 < i; i4++) {
                        byte b = bArr[i4];
                        if (b == 0) {
                            sb.append(" 0");
                        } else if (b != 1) {
                            sb.append("  ");
                        } else {
                            sb.append(" 1");
                        }
                    }
                    sb.append('\n');
                }
                return sb.toString();
            default:
                return super.toString();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0050 A[Catch: all -> 0x002e, TryCatch #0 {, blocks: (B:3:0x0001, B:7:0x0007, B:9:0x0025, B:14:0x0030, B:16:0x0037, B:18:0x0049, B:26:0x006a, B:21:0x0050, B:23:0x0063, B:29:0x006e, B:33:0x007d), top: B:38:0x0001 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public synchronized int u() {
        /*
            r5 = this;
            monitor-enter(r5)
            int r0 = r5.c     // Catch: java.lang.Throwable -> L2e
            if (r0 == 0) goto L7
            monitor-exit(r5)
            return r0
        L7:
            java.lang.Object r0 = r5.d     // Catch: java.lang.Throwable -> L2e
            android.content.Context r0 = (android.content.Context) r0     // Catch: java.lang.Throwable -> L2e
            android.content.pm.PackageManager r1 = r0.getPackageManager()     // Catch: java.lang.Throwable -> L2e
            v60 r0 = defpackage.e9f.a(r0)     // Catch: java.lang.Throwable -> L2e
            java.lang.String r2 = "com.google.android.c2dm.permission.SEND"
            java.lang.String r3 = "com.google.android.gms"
            android.content.Context r0 = r0.a     // Catch: java.lang.Throwable -> L2e
            android.content.pm.PackageManager r0 = r0.getPackageManager()     // Catch: java.lang.Throwable -> L2e
            int r0 = r0.checkPermission(r2, r3)     // Catch: java.lang.Throwable -> L2e
            r2 = -1
            r3 = 0
            if (r0 != r2) goto L30
            java.lang.String r0 = "Metadata"
            java.lang.String r1 = "Google Play services missing or without correct permission."
            android.util.Log.e(r0, r1)     // Catch: java.lang.Throwable -> L2e
            monitor-exit(r5)
            return r3
        L2e:
            r0 = move-exception
            goto L81
        L30:
            boolean r0 = defpackage.gq7.D()     // Catch: java.lang.Throwable -> L2e
            r2 = 1
            if (r0 != 0) goto L50
            android.content.Intent r0 = new android.content.Intent     // Catch: java.lang.Throwable -> L2e
            java.lang.String r4 = "com.google.android.c2dm.intent.REGISTER"
            r0.<init>(r4)     // Catch: java.lang.Throwable -> L2e
            java.lang.String r4 = "com.google.android.gms"
            r0.setPackage(r4)     // Catch: java.lang.Throwable -> L2e
            java.util.List r0 = r1.queryIntentServices(r0, r3)     // Catch: java.lang.Throwable -> L2e
            if (r0 == 0) goto L50
            boolean r0 = r0.isEmpty()     // Catch: java.lang.Throwable -> L2e
            if (r0 != 0) goto L50
            goto L6a
        L50:
            android.content.Intent r0 = new android.content.Intent     // Catch: java.lang.Throwable -> L2e
            java.lang.String r4 = "com.google.iid.TOKEN_REQUEST"
            r0.<init>(r4)     // Catch: java.lang.Throwable -> L2e
            java.lang.String r4 = "com.google.android.gms"
            r0.setPackage(r4)     // Catch: java.lang.Throwable -> L2e
            java.util.List r0 = r1.queryBroadcastReceivers(r0, r3)     // Catch: java.lang.Throwable -> L2e
            r1 = 2
            if (r0 == 0) goto L6e
            boolean r0 = r0.isEmpty()     // Catch: java.lang.Throwable -> L2e
            if (r0 != 0) goto L6e
            r2 = r1
        L6a:
            r5.c = r2     // Catch: java.lang.Throwable -> L2e
            monitor-exit(r5)
            return r2
        L6e:
            java.lang.String r0 = "Metadata"
            java.lang.String r3 = "Failed to resolve IID implementation package, falling back"
            android.util.Log.w(r0, r3)     // Catch: java.lang.Throwable -> L2e
            boolean r0 = defpackage.gq7.D()     // Catch: java.lang.Throwable -> L2e
            if (r2 == r0) goto L7c
            goto L7d
        L7c:
            r2 = r1
        L7d:
            r5.c = r2     // Catch: java.lang.Throwable -> L2e
            monitor-exit(r5)
            return r2
        L81:
            monitor-exit(r5)     // Catch: java.lang.Throwable -> L2e
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.u11.u():int");
    }

    public u11(int i, int i2, int i3) {
        this.a = i3;
        switch (i3) {
            case 2:
                this.d = null;
                this.b = i;
                int i4 = i2 & 7;
                this.c = i4 == 0 ? 8 : i4;
                break;
            default:
                this.d = (byte[][]) Array.newInstance((Class<?>) Byte.TYPE, i2, i);
                this.b = i;
                this.c = i2;
                break;
        }
    }

    public u11(View view) {
        this.a = 6;
        this.d = view;
    }

    public u11(Context context) {
        this.a = 7;
        this.c = 0;
        this.d = context;
    }

    public u11(x60 x60Var, int i) {
        this.a = 3;
        this.d = x60Var;
        this.b = i;
    }

    public u11(int i, int i2, m45 m45Var) {
        this.a = 4;
        this.b = i;
        this.c = i2;
        this.d = m45Var;
    }

    public u11() {
        this.a = 2;
        this.d = new u11[256];
        this.b = 0;
        this.c = 0;
    }

    public u11(int i, int i2, yn3 yn3Var) {
        this.a = 5;
        this.b = i;
        this.c = i2;
        this.d = new o2b(new qn4(i, i2, yn3Var));
    }
}
