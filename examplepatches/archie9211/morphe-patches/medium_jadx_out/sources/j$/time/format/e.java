package j$.time.format;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class e implements f {
    public final f[] a;
    public final boolean b;

    /* JADX WARN: Illegal instructions before constructor call */
    public e(List list, boolean z) {
        ArrayList arrayList = (ArrayList) list;
        this((f[]) arrayList.toArray(new f[arrayList.size()]), z);
    }

    /* JADX WARN: Code restructure failed: missing block: B:12:0x0026, code lost:
    
        return true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x002c, code lost:
    
        if (r2 != false) goto L11;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x002f, code lost:
    
        return true;
     */
    @Override // j$.time.format.f
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean h(j$.time.format.t r7, java.lang.StringBuilder r8) {
        /*
            r6 = this;
            int r0 = r8.length()
            r1 = 1
            boolean r2 = r6.b
            if (r2 == 0) goto Le
            int r3 = r7.c
            int r3 = r3 + r1
            r7.c = r3
        Le:
            j$.time.format.f[] r6 = r6.a     // Catch: java.lang.Throwable -> L27
            int r3 = r6.length     // Catch: java.lang.Throwable -> L27
            r4 = 0
        L12:
            if (r4 >= r3) goto L2c
            r5 = r6[r4]     // Catch: java.lang.Throwable -> L27
            boolean r5 = r5.h(r7, r8)     // Catch: java.lang.Throwable -> L27
            if (r5 != 0) goto L29
            r8.setLength(r0)     // Catch: java.lang.Throwable -> L27
            if (r2 == 0) goto L2f
        L21:
            int r6 = r7.c
            int r6 = r6 - r1
            r7.c = r6
            return r1
        L27:
            r6 = move-exception
            goto L30
        L29:
            int r4 = r4 + 1
            goto L12
        L2c:
            if (r2 == 0) goto L2f
            goto L21
        L2f:
            return r1
        L30:
            if (r2 == 0) goto L37
            int r8 = r7.c
            int r8 = r8 - r1
            r7.c = r8
        L37:
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: j$.time.format.e.h(j$.time.format.t, java.lang.StringBuilder):boolean");
    }

    @Override // j$.time.format.f
    public final int i(q qVar, CharSequence charSequence, int i) {
        boolean z = this.b;
        f[] fVarArr = this.a;
        int i2 = 0;
        if (!z) {
            int length = fVarArr.length;
            while (i2 < length) {
                i = fVarArr[i2].i(qVar, charSequence, i);
                if (i < 0) {
                    return i;
                }
                i2++;
            }
            return i;
        }
        ArrayList arrayList = qVar.d;
        x xVarC = qVar.c();
        xVarC.getClass();
        x xVar = new x();
        ((HashMap) xVar.a).putAll(xVarC.a);
        xVar.b = xVarC.b;
        xVar.c = xVarC.c;
        xVar.d = xVarC.d;
        arrayList.add(xVar);
        int length2 = fVarArr.length;
        int i3 = i;
        while (i2 < length2) {
            i3 = fVarArr[i2].i(qVar, charSequence, i3);
            if (i3 < 0) {
                qVar.d.remove(r6.size() - 1);
                return i;
            }
            i2++;
        }
        qVar.d.remove(r6.size() - 2);
        return i3;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder();
        f[] fVarArr = this.a;
        if (fVarArr != null) {
            boolean z = this.b;
            sb.append(z ? "[" : "(");
            for (f fVar : fVarArr) {
                sb.append(fVar);
            }
            sb.append(z ? "]" : ")");
        }
        return sb.toString();
    }

    public e(f[] fVarArr, boolean z) {
        this.a = fVarArr;
        this.b = z;
    }
}
