package defpackage;

import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Build;
import java.io.File;
import java.lang.ref.WeakReference;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kva implements gx5 {
    public static final /* synthetic */ int f = 0;
    public final hva a;
    public final k92 b;
    public final lig c;
    public final gz1 d;
    public volatile /* synthetic */ int e;

    static {
        AtomicIntegerFieldUpdater.newUpdater(kva.class, "e");
    }

    public kva(hva hvaVar) {
        this.a = hvaVar;
        int i = 1;
        this.b = o7f.c(flb.p0(qq7.h(), new fz4(u3b.d, i)));
        ms msVar = new ms();
        msVar.b = new WeakReference(this);
        msVar.c = new ks(msVar, this);
        msVar.d = new ls(msVar);
        lig ligVar = new lig(this);
        this.c = ligVar;
        iq1 iq1Var = new iq1(hvaVar.f);
        ArrayList arrayList = (ArrayList) iq1Var.d;
        ArrayList arrayList2 = (ArrayList) iq1Var.f;
        ox5 ox5Var = hvaVar.b;
        Object obj = ox5Var.n.a.get(flb.h);
        if (((Boolean) (obj == null ? Boolean.TRUE : obj)).booleanValue()) {
            ((ArrayList) iq1Var.e).add(new lg9(10));
            arrayList2.add(new lg9(11));
        }
        int i2 = 0;
        kt ktVar = new kt(i2);
        s1b s1bVar = n1b.a;
        iq1Var.s(ktVar, s1bVar.b(Uri.class));
        int i3 = 4;
        iq1Var.s(new kt(i3), s1bVar.b(Integer.class));
        arrayList.add(new f09(new xr(0), s1bVar.b(d7e.class)));
        iq1Var.r(new q80(i2), s1bVar.b(d7e.class));
        iq1Var.r(new q80(i3), s1bVar.b(d7e.class));
        iq1Var.r(new q80(9), s1bVar.b(d7e.class));
        iq1Var.r(new q80(6), s1bVar.b(Drawable.class));
        iq1Var.r(new q80(i), s1bVar.b(Bitmap.class));
        q84 q84Var = ix5.a;
        Object obj2 = ox5Var.n.a.get(ix5.a);
        int iIntValue = ((Number) (obj2 == null ? 4 : obj2)).intValue();
        int i4 = pyb.a;
        oyb oybVar = new oyb(iIntValue);
        int i5 = Build.VERSION.SDK_INT;
        Object obj3 = h54.a;
        if (i5 >= 29) {
            Object obj4 = ox5Var.n.a.get(ix5.c);
            if (((Boolean) (obj4 == null ? Boolean.TRUE : obj4)).booleanValue()) {
                Object obj5 = ox5Var.n.a.get(ix5.b);
                if (((h54) (obj5 == null ? obj3 : obj5)).equals(obj3)) {
                    arrayList2.add(new fz1(new hqc(oybVar), i2));
                }
            }
        }
        Object obj6 = ox5Var.n.a.get(ix5.b);
        arrayList2.add(new fz1(new ur0(oybVar, (h54) (obj6 != null ? obj6 : obj3)), i2));
        iq1Var.s(new kt(i), s1bVar.b(File.class));
        iq1Var.r(new q80(8), s1bVar.b(d7e.class));
        int i6 = 3;
        iq1Var.r(new q80(i6), s1bVar.b(ByteBuffer.class));
        int i7 = 5;
        iq1Var.s(new kt(i7), s1bVar.b(String.class));
        iq1Var.s(new kt(i6), s1bVar.b(g59.class));
        arrayList.add(new f09(new xr(1), s1bVar.b(d7e.class)));
        arrayList.add(new f09(new xr(2), s1bVar.b(d7e.class)));
        iq1Var.r(new q80(7), s1bVar.b(d7e.class));
        iq1Var.r(new q80(2), s1bVar.b(byte[].class));
        iq1Var.r(new q80(i7), s1bVar.b(d7e.class));
        ((ArrayList) iq1Var.b).add(new cz3(this, msVar, ligVar));
        this.d = new gz1(nk7.z0((ArrayList) iq1Var.b), nk7.z0((ArrayList) iq1Var.c), nk7.z0((ArrayList) iq1Var.d), nk7.z0((ArrayList) iq1Var.e), nk7.z0((ArrayList) iq1Var.f));
    }

    public final th3 a(rx5 rx5Var) {
        return gr7.n(rx5Var, vx0.G(this.b, (ib2) this.a.c.getValue(), new iva(this, rx5Var, null, 0), 2));
    }

    /* JADX WARN: Code restructure failed: missing block: B:109:0x018d, code lost:
    
        if (r1.a(r9) == r10) goto L138;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:124:0x01ae  */
    /* JADX WARN: Removed duplicated region for block: B:133:0x01e1  */
    /* JADX WARN: Removed duplicated region for block: B:139:0x0210  */
    /* JADX WARN: Removed duplicated region for block: B:142:0x021a A[Catch: all -> 0x003f, TryCatch #5 {all -> 0x003f, blocks: (B:15:0x003a, B:140:0x0214, B:142:0x021a, B:143:0x0223, B:145:0x0227, B:148:0x0233, B:149:0x0238, B:28:0x006a, B:114:0x0196, B:116:0x019a, B:118:0x01a0, B:120:0x01a6, B:122:0x01aa, B:125:0x01b0, B:127:0x01ba, B:129:0x01c6, B:130:0x01c9), top: B:177:0x002c }] */
    /* JADX WARN: Removed duplicated region for block: B:143:0x0223 A[Catch: all -> 0x003f, TryCatch #5 {all -> 0x003f, blocks: (B:15:0x003a, B:140:0x0214, B:142:0x021a, B:143:0x0223, B:145:0x0227, B:148:0x0233, B:149:0x0238, B:28:0x006a, B:114:0x0196, B:116:0x019a, B:118:0x01a0, B:120:0x01a6, B:122:0x01aa, B:125:0x01b0, B:127:0x01ba, B:129:0x01c6, B:130:0x01c9), top: B:177:0x002c }] */
    /* JADX WARN: Removed duplicated region for block: B:158:0x024d A[Catch: all -> 0x0258, TryCatch #1 {all -> 0x0258, blocks: (B:156:0x0249, B:158:0x024d, B:160:0x0254, B:161:0x0257, B:164:0x025a), top: B:170:0x0249 }] */
    /* JADX WARN: Removed duplicated region for block: B:164:0x025a A[Catch: all -> 0x0258, TRY_LEAVE, TryCatch #1 {all -> 0x0258, blocks: (B:156:0x0249, B:158:0x024d, B:160:0x0254, B:161:0x0257, B:164:0x025a), top: B:170:0x0249 }] */
    /* JADX WARN: Removed duplicated region for block: B:8:0x001c  */
    /* JADX WARN: Type inference failed for: r17v0, types: [java.lang.Object, kva] */
    /* JADX WARN: Type inference failed for: r1v26 */
    /* JADX WARN: Type inference failed for: r1v27 */
    /* JADX WARN: Type inference failed for: r1v29, types: [java.lang.Object, rx5] */
    /* JADX WARN: Type inference failed for: r3v15, types: [z46] */
    /* JADX WARN: Type inference failed for: r3v17, types: [java.lang.Object, z46] */
    /* JADX WARN: Type inference failed for: r3v18, types: [rx5] */
    /* JADX WARN: Type inference failed for: r3v19 */
    /* JADX WARN: Type inference failed for: r3v22 */
    /* JADX WARN: Type inference failed for: r3v23, types: [z46] */
    /* JADX WARN: Type inference failed for: r3v26 */
    /* JADX WARN: Type inference failed for: r3v3, types: [int] */
    /* JADX WARN: Type inference failed for: r3v30 */
    /* JADX WARN: Type inference failed for: r3v31 */
    /* JADX WARN: Type inference failed for: r3v32 */
    /* JADX WARN: Type inference failed for: r3v4, types: [java.lang.Object, z46] */
    /* JADX WARN: Type inference failed for: r4v1 */
    /* JADX WARN: Type inference failed for: r4v19, types: [java.lang.Object, rx5] */
    /* JADX WARN: Type inference failed for: r4v2, types: [rx5] */
    /* JADX WARN: Type inference failed for: r4v20 */
    /* JADX WARN: Type inference failed for: r4v21, types: [java.lang.Object, z46] */
    /* JADX WARN: Type inference failed for: r4v22 */
    /* JADX WARN: Type inference failed for: r4v23 */
    /* JADX WARN: Type inference failed for: r4v24, types: [rx5] */
    /* JADX WARN: Type inference failed for: r4v27 */
    /* JADX WARN: Type inference failed for: r4v31 */
    /* JADX WARN: Type inference failed for: r4v32 */
    /* JADX WARN: Type inference failed for: r4v33 */
    /* JADX WARN: Type inference failed for: r4v34 */
    /* JADX WARN: Type inference failed for: r4v35 */
    /* JADX WARN: Type inference failed for: r4v36 */
    /* JADX WARN: Type inference failed for: r4v9, types: [rx5] */
    /* JADX WARN: Type inference failed for: r5v0, types: [rx5] */
    /* JADX WARN: Type inference failed for: r5v1, types: [vbb] */
    /* JADX WARN: Type inference failed for: r5v2 */
    /* JADX WARN: Type inference failed for: r5v22 */
    /* JADX WARN: Type inference failed for: r5v27 */
    /* JADX WARN: Type inference failed for: r7v4, types: [x45] */
    /* JADX WARN: Type inference failed for: r7v8, types: [x45] */
    /* JADX WARN: Type inference failed for: r8v18 */
    /* JADX WARN: Type inference failed for: r8v19 */
    /* JADX WARN: Type inference failed for: r8v21 */
    /* JADX WARN: Type inference fix 'apply assigned field type' failed
    java.lang.UnsupportedOperationException: ArgType.getObject(), call class: class jadx.core.dex.instructions.args.ArgType$UnknownArg
    	at jadx.core.dex.instructions.args.ArgType.getObject(ArgType.java:593)
    	at jadx.core.dex.attributes.nodes.ClassTypeVarsAttr.getTypeVarsMapFor(ClassTypeVarsAttr.java:35)
    	at jadx.core.dex.nodes.utils.TypeUtils.replaceClassGenerics(TypeUtils.java:177)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.insertExplicitUseCast(FixTypesVisitor.java:397)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryFieldTypeWithNewCasts(FixTypesVisitor.java:359)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.applyFieldType(FixTypesVisitor.java:309)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:94)
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(defpackage.rx5 r18, int r19, defpackage.p92 r20) {
        /*
            Method dump skipped, instruction units count: 619
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kva.b(rx5, int, p92):java.lang.Object");
    }

    public final Object c(rx5 rx5Var, p92 p92Var) {
        return ((rx5Var.c instanceof fy5) || (rx5Var.q instanceof vva) || ((wx6) k40.b0(rx5Var, wx5.e)) != null) ? o7f.s(new mw9(this, rx5Var, null, 12), p92Var) : b(rx5Var, 1, p92Var);
    }

    public final pva d() {
        return (pva) this.a.d.getValue();
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x001e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void e(defpackage.r14 r4, defpackage.rfd r5, defpackage.z46 r6) {
        /*
            r3 = this;
            rx5 r3 = r4.b
            ew5 r0 = r4.a
            boolean r1 = r5 instanceof defpackage.hsd
            if (r1 != 0) goto Lb
            if (r5 == 0) goto L28
            goto L1e
        Lb:
            q84 r1 = defpackage.wx5.a
            java.lang.Object r1 = defpackage.k40.b0(r3, r1)
            yrd r1 = (defpackage.yrd) r1
            r2 = r5
            hsd r2 = (defpackage.hsd) r2
            csd r4 = r1.a(r2, r4)
            boolean r1 = r4 instanceof defpackage.th8
            if (r1 == 0) goto L22
        L1e:
            r5.n(r0)
            goto L28
        L22:
            r6.getClass()
            r4.a()
        L28:
            r6.getClass()
            qx5 r3 = r3.d
            if (r3 == 0) goto L32
            r3.a()
        L32:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kva.e(r14, rfd, z46):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x001e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void f(defpackage.w0d r4, defpackage.rfd r5, defpackage.z46 r6) {
        /*
            r3 = this;
            rx5 r3 = r4.b
            ew5 r0 = r4.a
            boolean r1 = r5 instanceof defpackage.hsd
            if (r1 != 0) goto Lb
            if (r5 == 0) goto L28
            goto L1e
        Lb:
            q84 r1 = defpackage.wx5.a
            java.lang.Object r1 = defpackage.k40.b0(r3, r1)
            yrd r1 = (defpackage.yrd) r1
            r2 = r5
            hsd r2 = (defpackage.hsd) r2
            csd r4 = r1.a(r2, r4)
            boolean r1 = r4 instanceof defpackage.th8
            if (r1 == 0) goto L22
        L1e:
            r5.b(r0)
            goto L28
        L22:
            r6.getClass()
            r4.a()
        L28:
            r6.getClass()
            qx5 r3 = r3.d
            if (r3 == 0) goto L32
            r3.k()
        L32:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kva.f(w0d, rfd, z46):void");
    }
}
