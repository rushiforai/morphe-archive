package defpackage;

import android.os.Bundle;
import android.os.Parcelable;
import android.text.TextUtils;
import com.facebook.FacebookException;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qc5 extends ba7 {
    public static final Parcelable.Creator<qc5> CREATOR = new h74(9);
    public pc5 c;

    @Override // defpackage.ba7
    public final void b() {
        pc5 pc5Var = this.c;
        if (pc5Var != null) {
            pc5Var.d = false;
            pc5Var.c = null;
            this.c = null;
        }
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // defpackage.ba7
    public final String e() {
        return "get_token";
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x004a A[DONT_GENERATE] */
    /* JADX WARN: Removed duplicated region for block: B:25:0x004c A[Catch: all -> 0x008b, TRY_ENTER, TryCatch #1 {, blocks: (B:8:0x001a, B:13:0x0023, B:25:0x004c, B:28:0x0056, B:19:0x0043, B:16:0x0033), top: B:49:0x001a, inners: #0 }] */
    @Override // defpackage.ba7
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final int k(defpackage.m87 r8) {
        /*
            r7 = this;
            r8.getClass()
            pc5 r0 = new pc5
            p87 r1 = r7.d()
            m15 r1 = r1.e()
            if (r1 == 0) goto L10
            goto L14
        L10:
            android.content.Context r1 = defpackage.f94.a()
        L14:
            r0.<init>(r1, r8)
            r7.c = r0
            monitor-enter(r0)
            boolean r1 = r0.d     // Catch: java.lang.Throwable -> L8b
            r2 = 0
            r3 = 1
            if (r1 == 0) goto L23
            monitor-exit(r0)
        L21:
            r1 = r2
            goto L5f
        L23:
            int r1 = r0.j     // Catch: java.lang.Throwable -> L8b
            x98 r4 = defpackage.x98.a     // Catch: java.lang.Throwable -> L8b
            java.lang.Class<x98> r4 = defpackage.x98.class
            java.util.Set r5 = defpackage.ec2.a     // Catch: java.lang.Throwable -> L8b
            boolean r5 = r5.contains(r4)     // Catch: java.lang.Throwable -> L8b
            if (r5 == 0) goto L33
        L31:
            r1 = r2
            goto L47
        L33:
            x98 r5 = defpackage.x98.a     // Catch: java.lang.Throwable -> L42
            java.util.ArrayList r6 = defpackage.x98.b     // Catch: java.lang.Throwable -> L42
            int[] r1 = new int[]{r1}     // Catch: java.lang.Throwable -> L42
            d87 r1 = r5.g(r6, r1)     // Catch: java.lang.Throwable -> L42
            int r1 = r1.b     // Catch: java.lang.Throwable -> L42
            goto L47
        L42:
            r1 = move-exception
            defpackage.ec2.a(r4, r1)     // Catch: java.lang.Throwable -> L8b
            goto L31
        L47:
            r4 = -1
            if (r1 != r4) goto L4c
            monitor-exit(r0)
            goto L21
        L4c:
            android.content.Context r1 = r0.a     // Catch: java.lang.Throwable -> L8b
            android.content.Intent r1 = defpackage.x98.d(r1)     // Catch: java.lang.Throwable -> L8b
            if (r1 != 0) goto L56
            r1 = r2
            goto L5e
        L56:
            r0.d = r3     // Catch: java.lang.Throwable -> L8b
            android.content.Context r4 = r0.a     // Catch: java.lang.Throwable -> L8b
            r4.bindService(r1, r0, r3)     // Catch: java.lang.Throwable -> L8b
            r1 = r3
        L5e:
            monitor-exit(r0)
        L5f:
            if (r1 != 0) goto L62
            return r2
        L62:
            p87 r0 = r7.d()
            my6 r0 = r0.e
            if (r0 == 0) goto L7d
            java.lang.Object r0 = r0.a
            v97 r0 = (defpackage.v97) r0
            android.view.View r0 = r0.q0
            if (r0 == 0) goto L76
            r0.setVisibility(r2)
            goto L7d
        L76:
            java.lang.String r7 = "progressBar"
            defpackage.g76.g0(r7)
            r7 = 0
            throw r7
        L7d:
            lt r0 = new lt
            r1 = 8
            r0.<init>(r7, r1, r8)
            pc5 r7 = r7.c
            if (r7 == 0) goto L8a
            r7.c = r0
        L8a:
            return r3
        L8b:
            r7 = move-exception
            monitor-exit(r0)
            throw r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qc5.k(m87):int");
    }

    public final void l(m87 m87Var, Bundle bundle) {
        o87 o87Var;
        ce0 ce0Var;
        m87Var.getClass();
        bundle.getClass();
        try {
            w3 w3VarZ = vv2.z(bundle, h4.FACEBOOK_APPLICATION_SERVICE, m87Var.d);
            String str = m87Var.q;
            String string = bundle.getString("com.facebook.platform.extra.ID_TOKEN");
            if (string == null || string.length() == 0 || str == null || str.length() == 0) {
                ce0Var = null;
            } else {
                try {
                    ce0Var = new ce0(string, str);
                } catch (Exception e) {
                    throw new FacebookException(e.getMessage());
                }
            }
            o87Var = new o87(m87Var, n87.SUCCESS, w3VarZ, ce0Var, null, null);
        } catch (FacebookException e2) {
            m87 m87Var2 = d().g;
            String message = e2.getMessage();
            ArrayList arrayList = new ArrayList();
            if (message != null) {
                arrayList.add(message);
            }
            o87Var = new o87(m87Var2, n87.ERROR, null, TextUtils.join(": ", arrayList), null);
        }
        d().d(o87Var);
    }
}
