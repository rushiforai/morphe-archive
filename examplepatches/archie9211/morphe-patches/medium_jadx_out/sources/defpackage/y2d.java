package defpackage;

import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class y2d extends b3d {
    public final /* synthetic */ int d = 1;
    public final Object e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y2d(z25 z25Var, String str) {
        super(z25Var, str);
        z25Var.getClass();
        str.getClass();
        this.e = z25Var.p(str);
    }

    @Override // defpackage.gnb
    public final void M(int i, String str) {
        int i2 = this.d;
        Object obj = this.e;
        switch (i2) {
            case 0:
                str.getClass();
                ((z2d) obj).M(i, str);
                return;
            case 1:
                str.getClass();
                f();
                ((h35) obj).s(i, str);
                return;
            default:
                str.getClass();
                f();
                qk7.z(25, "column index out of range");
                throw null;
        }
    }

    @Override // defpackage.b3d, defpackage.gnb
    public boolean P() {
        switch (this.d) {
            case 0:
                return ((z2d) this.e).P();
            default:
                return super.P();
        }
    }

    @Override // defpackage.gnb
    public final void c(int i, long j) {
        int i2 = this.d;
        Object obj = this.e;
        switch (i2) {
            case 0:
                ((z2d) obj).c(i, j);
                return;
            case 1:
                f();
                ((h35) obj).c(i, j);
                return;
            default:
                f();
                qk7.z(25, "column index out of range");
                throw null;
        }
    }

    @Override // java.lang.AutoCloseable
    public final void close() throws IOException {
        int i = this.d;
        Object obj = this.e;
        switch (i) {
            case 0:
                ((z2d) obj).close();
                break;
            case 1:
                ((h35) obj).close();
                this.c = true;
                break;
            default:
                this.c = true;
                break;
        }
    }

    @Override // defpackage.gnb
    public final void d(int i, byte[] bArr) {
        int i2 = this.d;
        Object obj = this.e;
        switch (i2) {
            case 0:
                ((z2d) obj).d(i, bArr);
                return;
            case 1:
                f();
                ((h35) obj).d(i, bArr);
                return;
            default:
                f();
                qk7.z(25, "column index out of range");
                throw null;
        }
    }

    @Override // defpackage.gnb
    public final String d0(int i) {
        switch (this.d) {
            case 0:
                return ((z2d) this.e).d0(i);
            case 1:
                f();
                qk7.z(21, "no row");
                throw null;
            default:
                f();
                qk7.z(21, "no row");
                throw null;
        }
    }

    @Override // defpackage.gnb
    public final void g(int i) {
        int i2 = this.d;
        Object obj = this.e;
        switch (i2) {
            case 0:
                ((z2d) obj).g(i);
                return;
            case 1:
                f();
                ((h35) obj).g(i);
                return;
            default:
                f();
                qk7.z(25, "column index out of range");
                throw null;
        }
    }

    @Override // defpackage.gnb
    public final byte[] getBlob(int i) {
        switch (this.d) {
            case 0:
                return ((z2d) this.e).getBlob(i);
            case 1:
                f();
                qk7.z(21, "no row");
                throw null;
            default:
                f();
                qk7.z(21, "no row");
                throw null;
        }
    }

    @Override // defpackage.gnb
    public final int getColumnCount() {
        switch (this.d) {
            case 0:
                break;
            case 1:
                f();
                break;
            default:
                f();
                break;
        }
        return 0;
    }

    @Override // defpackage.gnb
    public final String getColumnName(int i) {
        switch (this.d) {
            case 0:
                return ((z2d) this.e).getColumnName(i);
            case 1:
                f();
                qk7.z(21, "no row");
                throw null;
            default:
                f();
                qk7.z(21, "no row");
                throw null;
        }
    }

    @Override // defpackage.gnb
    public final long getLong(int i) {
        switch (this.d) {
            case 0:
                return ((z2d) this.e).getLong(i);
            case 1:
                f();
                qk7.z(21, "no row");
                throw null;
            default:
                f();
                qk7.z(21, "no row");
                throw null;
        }
    }

    @Override // defpackage.gnb
    public final boolean isNull(int i) {
        switch (this.d) {
            case 0:
                return ((z2d) this.e).isNull(i);
            case 1:
                f();
                qk7.z(21, "no row");
                throw null;
            default:
                f();
                qk7.z(21, "no row");
                throw null;
        }
    }

    @Override // defpackage.b3d, defpackage.gnb
    public void l() {
        int i = this.d;
        Object obj = this.e;
        switch (i) {
            case 0:
                ((z2d) obj).l();
                break;
            case 1:
                f();
                ((h35) obj).l();
                break;
            default:
                super.l();
                break;
        }
    }

    @Override // defpackage.b3d, defpackage.gnb
    public void reset() {
        switch (this.d) {
            case 0:
                ((z2d) this.e).reset();
                break;
            default:
                super.reset();
                break;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x006a  */
    @Override // defpackage.gnb
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean w0() throws java.lang.IllegalAccessException, java.lang.reflect.InvocationTargetException {
        /*
            r10 = this;
            int r0 = r10.d
            z25 r1 = r10.a
            java.lang.Object r2 = r10.e
            r3 = 0
            switch(r0) {
                case 0: goto L90;
                case 1: goto L85;
                default: goto La;
            }
        La:
            x2d r2 = (defpackage.x2d) r2
            int[] r10 = defpackage.a3d.a
            int r0 = r2.ordinal()
            r10 = r10[r0]
            r0 = 1
            if (r10 == r0) goto L7e
            r2 = 2
            if (r10 == r2) goto L7a
            r4 = 3
            if (r10 == r4) goto L76
            r5 = 4
            if (r10 == r5) goto L72
            r6 = 5
            if (r10 != r6) goto L6e
            java.lang.Integer r10 = java.lang.Integer.valueOf(r3)
            android.database.sqlite.SQLiteDatabase r6 = r1.a
            vq6 r7 = defpackage.z25.e
            java.lang.Object r8 = r7.getValue()
            java.lang.reflect.Method r8 = (java.lang.reflect.Method) r8
            if (r8 == 0) goto L6a
            vq6 r8 = defpackage.z25.d
            java.lang.Object r9 = r8.getValue()
            java.lang.reflect.Method r9 = (java.lang.reflect.Method) r9
            if (r9 == 0) goto L6a
            java.lang.Object r1 = r7.getValue()
            java.lang.reflect.Method r1 = (java.lang.reflect.Method) r1
            r1.getClass()
            java.lang.Object r7 = r8.getValue()
            java.lang.reflect.Method r7 = (java.lang.reflect.Method) r7
            r7.getClass()
            r8 = 0
            java.lang.Object r6 = r7.invoke(r6, r8)
            if (r6 == 0) goto L64
            java.lang.Object[] r5 = new java.lang.Object[r5]
            r5[r3] = r10
            r5[r0] = r8
            r5[r2] = r10
            r5[r4] = r8
            r1.invoke(r6, r5)
            goto L84
        L64:
            java.lang.String r10 = "Required value was null."
            defpackage.ygf.f(r10)
            goto L84
        L6a:
            r1.f()
            goto L84
        L6e:
            defpackage.ygf.a()
            goto L84
        L72:
            r1.m()
            goto L84
        L76:
            r1.f()
            goto L84
        L7a:
            r1.B()
            goto L84
        L7e:
            r1.L()
            r1.B()
        L84:
            return r3
        L85:
            r10.f()
            h35 r2 = (defpackage.h35) r2
            android.database.sqlite.SQLiteStatement r10 = r2.b
            r10.execute()
            return r3
        L90:
            z2d r2 = (defpackage.z2d) r2
            boolean r10 = r2.w0()
            java.lang.String r0 = r2.d0(r3)
            java.lang.String r2 = "wal"
            boolean r0 = r0.equalsIgnoreCase(r2)
            if (r0 == 0) goto La8
            android.database.sqlite.SQLiteDatabase r0 = r1.a
            r0.enableWriteAheadLogging()
            goto Lad
        La8:
            android.database.sqlite.SQLiteDatabase r0 = r1.a
            r0.disableWriteAheadLogging()
        Lad:
            return r10
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.y2d.w0():boolean");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y2d(z25 z25Var, String str, x2d x2dVar) {
        super(z25Var, str);
        z25Var.getClass();
        str.getClass();
        this.e = x2dVar;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y2d(z25 z25Var, String str, z2d z2dVar) {
        super(z25Var, str);
        z25Var.getClass();
        str.getClass();
        this.e = z2dVar;
    }
}
