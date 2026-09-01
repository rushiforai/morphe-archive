package defpackage;

import android.text.Layout;
import android.text.TextPaint;
import java.text.BreakIterator;
import java.util.Iterator;
import java.util.List;
import java.util.PriorityQueue;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ar implements b29 {
    public final String a;
    public final mkd b;
    public final List c;
    public final List d;
    public final yy4 e;
    public final m73 f;
    public final ys g;
    public final CharSequence h;
    public final pp6 i;
    public vwa j;
    public final boolean k;
    public final int l;

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:15:0x0072  */
    /* JADX WARN: Removed duplicated region for block: B:17:0x0076  */
    /* JADX WARN: Removed duplicated region for block: B:184:0x0390  */
    /* JADX WARN: Removed duplicated region for block: B:229:0x0449  */
    /* JADX WARN: Removed duplicated region for block: B:235:0x046b  */
    /* JADX WARN: Removed duplicated region for block: B:329:0x0660  */
    /* JADX WARN: Removed duplicated region for block: B:393:0x07bd  */
    /* JADX WARN: Type inference failed for: r15v11 */
    /* JADX WARN: Type inference failed for: r15v3 */
    /* JADX WARN: Type inference failed for: r15v4, types: [java.lang.Object, skc] */
    /* JADX WARN: Type inference failed for: r15v5 */
    /* JADX WARN: Type inference failed for: r15v6 */
    /* JADX WARN: Type inference failed for: r20v1 */
    /* JADX WARN: Type inference failed for: r20v3 */
    /* JADX WARN: Type inference failed for: r20v4 */
    /* JADX WARN: Type inference failed for: r20v5 */
    /* JADX WARN: Type inference failed for: r2v25 */
    /* JADX WARN: Type inference failed for: r2v26, types: [skc] */
    /* JADX WARN: Type inference failed for: r2v27 */
    /* JADX WARN: Type inference failed for: r2v28 */
    /* JADX WARN: Type inference failed for: r2v31 */
    /* JADX WARN: Type inference failed for: r2v33 */
    /* JADX WARN: Type inference failed for: r2v58 */
    /* JADX WARN: Type inference failed for: r2v71 */
    /* JADX WARN: Type inference failed for: r2v72 */
    /* JADX WARN: Type inference failed for: r35v0 */
    /* JADX WARN: Type inference failed for: r35v1, types: [lo0] */
    /* JADX WARN: Type inference failed for: r35v2 */
    /* JADX WARN: Type inference failed for: r4v9, types: [qg9] */
    /* JADX WARN: Type inference failed for: r9v72 */
    /* JADX WARN: Type inference failed for: r9v73, types: [mx3] */
    /* JADX WARN: Type inference failed for: r9v80 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public ar(java.lang.String r44, defpackage.mkd r45, java.util.List r46, java.util.List r47, defpackage.yy4 r48, defpackage.m73 r49) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 2353
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ar.<init>(java.lang.String, mkd, java.util.List, java.util.List, yy4, m73):void");
    }

    @Override // defpackage.b29
    public final boolean a() {
        vwa vwaVar = this.j;
        if (vwaVar != null ? vwaVar.w() : false) {
            return true;
        }
        if (!this.k && vx0.S(this.b)) {
            rz2 rz2Var = cx3.a;
            rz2 rz2Var2 = cx3.a;
            upc upcVarJ = (upc) rz2Var2.b;
            if (upcVarJ == null) {
                if (yw3.d()) {
                    upcVarJ = rz2Var2.J();
                    rz2Var2.b = upcVarJ;
                } else {
                    upcVarJ = o7f.h;
                }
            }
            if (((Boolean) upcVarJ.getValue()).booleanValue()) {
                return true;
            }
        }
        return false;
    }

    @Override // defpackage.b29
    public final float h() {
        pp6 pp6Var = this.i;
        float f = pp6Var.e;
        TextPaint textPaint = pp6Var.b;
        if (!Float.isNaN(f)) {
            return pp6Var.e;
        }
        BreakIterator lineInstance = BreakIterator.getLineInstance(textPaint.getTextLocale());
        CharSequence charSequence = pp6Var.a;
        lineInstance.setText(new sk1(charSequence, charSequence.length()));
        PriorityQueue priorityQueue = new PriorityQueue(10, gx1.l);
        int i = 0;
        for (int next = lineInstance.next(); next != -1; next = lineInstance.next()) {
            if (priorityQueue.size() < 10) {
                priorityQueue.add(new n46(i, next, 1));
            } else {
                n46 n46Var = (n46) priorityQueue.peek();
                if (n46Var != null && n46Var.b - n46Var.a < next - i) {
                    priorityQueue.poll();
                    priorityQueue.add(new n46(i, next, 1));
                }
            }
            i = next;
        }
        float desiredWidth = 0.0f;
        if (!priorityQueue.isEmpty()) {
            Iterator it2 = priorityQueue.iterator();
            if (!it2.hasNext()) {
                ywb.n();
                return 0.0f;
            }
            n46 n46Var2 = (n46) it2.next();
            desiredWidth = Layout.getDesiredWidth(pp6Var.b(), n46Var2.a, n46Var2.b, textPaint);
            while (it2.hasNext()) {
                n46 n46Var3 = (n46) it2.next();
                desiredWidth = Math.max(desiredWidth, Layout.getDesiredWidth(pp6Var.b(), n46Var3.a, n46Var3.b, textPaint));
            }
        }
        pp6Var.e = desiredWidth;
        return desiredWidth;
    }

    @Override // defpackage.b29
    public final float q() {
        return this.i.c();
    }
}
