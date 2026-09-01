package defpackage;

import android.R;
import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.graphics.drawable.Drawable;
import android.util.Log;
import android.view.ContextThemeWrapper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.ListAdapter;
import android.widget.TextView;
import androidx.appcompat.app.AlertController$RecycleListView;
import com.google.android.gms.internal.fido.Hg.kSWQKWZ;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import com.medium.android.tag.recommendedposts.sB.mBTDfueQiGWRV;
import java.io.File;
import java.lang.ref.WeakReference;
import java.security.GeneralSecurityException;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;
import javax.crypto.AEADBadTagException;
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class ad implements l5, k60, eeg {
    public final /* synthetic */ int a;
    public int b;
    public Object c;

    public ad(int i, byte b) {
        this.a = i;
        switch (i) {
            case 14:
                this.c = new LinkedHashMap();
                break;
            default:
                this.b = 255;
                this.c = null;
                break;
        }
    }

    public static ad e() {
        ad adVar = new ad((char) 0, 1);
        adVar.c = r7a.DEFAULT;
        return adVar;
    }

    public static void i(String str) {
        if (str.equalsIgnoreCase(":memory:")) {
            return;
        }
        int length = str.length() - 1;
        int i = 0;
        boolean z = false;
        while (i <= length) {
            boolean z2 = g76.Q(str.charAt(!z ? i : length), 32) <= 0;
            if (z) {
                if (!z2) {
                    break;
                } else {
                    length--;
                }
            } else if (z2) {
                i++;
            } else {
                z = true;
            }
        }
        if (str.subSequence(i, length + 1).toString().length() == 0) {
            return;
        }
        Log.w("SupportSQLite", "deleting the database file: ".concat(str));
        try {
            SQLiteDatabase.deleteDatabase(new File(str));
        } catch (Exception e) {
            Log.w("SupportSQLite", "delete failed: ", e);
        }
    }

    @Override // defpackage.k60
    public int H() {
        return this.b;
    }

    @Override // defpackage.k60
    public String R() {
        Object obj = ((AtomicReference) this.c).get();
        obj.getClass();
        return (String) obj;
    }

    public void a(long j) {
        if (g(j)) {
            return;
        }
        int i = this.b;
        long[] jArrCopyOf = (long[]) this.c;
        if (i >= jArrCopyOf.length) {
            jArrCopyOf = Arrays.copyOf(jArrCopyOf, Math.max(i + 1, jArrCopyOf.length * 2));
            this.c = jArrCopyOf;
        }
        jArrCopyOf[i] = j;
        if (i >= this.b) {
            this.b = i + 1;
        }
    }

    public u90 c() {
        return new u90(this.b, (r7a) this.c);
    }

    @Override // defpackage.l5
    public boolean d(View view) {
        ((BottomSheetBehavior) this.c).L(this.b);
        return true;
    }

    public void f() {
        int i = this.b;
        this.b = i + 1;
        if (i >= 10) {
            this.b = 0;
            Iterator it2 = ((LinkedHashMap) this.c).values().iterator();
            while (it2.hasNext()) {
                ArrayList arrayList = (ArrayList) it2.next();
                if (arrayList.size() <= 1) {
                    wva wvaVar = (wva) bu1.z0(arrayList);
                    if ((wvaVar != null ? (ew5) wvaVar.a.get() : null) == null) {
                        it2.remove();
                    }
                } else {
                    int size = arrayList.size();
                    int i2 = 0;
                    for (int i3 = 0; i3 < size; i3++) {
                        int i4 = i3 - i2;
                        if (((wva) arrayList.get(i4)).a.get() == null) {
                            arrayList.remove(i4);
                            i2++;
                        }
                    }
                    if (arrayList.isEmpty()) {
                        it2.remove();
                    }
                }
            }
        }
    }

    public boolean g(long j) {
        int i = this.b;
        for (int i2 = 0; i2 < i; i2++) {
            if (((long[]) this.c)[i2] == j) {
                return true;
            }
        }
        return false;
    }

    public bd h() {
        wc wcVar = (wc) this.c;
        ContextThemeWrapper contextThemeWrapper = wcVar.a;
        bd bdVar = new bd(contextThemeWrapper, this.b);
        View view = wcVar.e;
        zc zcVar = bdVar.g;
        if (view != null) {
            zcVar.u = view;
        } else {
            CharSequence charSequence = wcVar.d;
            if (charSequence != null) {
                zcVar.d = charSequence;
                TextView textView = zcVar.s;
                if (textView != null) {
                    textView.setText(charSequence);
                }
            }
            Drawable drawable = wcVar.c;
            if (drawable != null) {
                zcVar.q = drawable;
                ImageView imageView = zcVar.r;
                if (imageView != null) {
                    imageView.setVisibility(0);
                    zcVar.r.setImageDrawable(drawable);
                }
            }
        }
        CharSequence charSequence2 = wcVar.f;
        if (charSequence2 != null) {
            zcVar.e = charSequence2;
            TextView textView2 = zcVar.t;
            if (textView2 != null) {
                textView2.setText(charSequence2);
            }
        }
        CharSequence charSequence3 = wcVar.g;
        if (charSequence3 != null) {
            zcVar.b(-1, charSequence3, wcVar.h);
        }
        CharSequence charSequence4 = wcVar.i;
        if (charSequence4 != null) {
            zcVar.b(-2, charSequence4, wcVar.j);
        }
        if (wcVar.m != null) {
            AlertController$RecycleListView alertController$RecycleListView = (AlertController$RecycleListView) wcVar.b.inflate(zcVar.y, (ViewGroup) null);
            int i = wcVar.o ? zcVar.z : zcVar.A;
            ListAdapter ycVar = wcVar.m;
            if (ycVar == null) {
                ycVar = new yc(contextThemeWrapper, i, R.id.text1, null);
            }
            zcVar.v = ycVar;
            zcVar.w = wcVar.p;
            if (wcVar.n != null) {
                alertController$RecycleListView.setOnItemClickListener(new vc(wcVar, zcVar));
            }
            if (wcVar.o) {
                alertController$RecycleListView.setChoiceMode(1);
            }
            zcVar.f = alertController$RecycleListView;
        }
        bdVar.setCancelable(wcVar.k);
        if (wcVar.k) {
            bdVar.setCanceledOnTouchOutside(true);
        }
        bdVar.setOnCancelListener(null);
        bdVar.setOnDismissListener(null);
        nx7 nx7Var = wcVar.l;
        if (nx7Var != null) {
            bdVar.setOnKeyListener(nx7Var);
        }
        return bdVar;
    }

    public void j(int i, int i2) {
        int i3 = i2 + i;
        char[] cArr = (char[]) this.c;
        if (cArr.length <= i3) {
            int i4 = i * 2;
            if (i3 < i4) {
                i3 = i4;
            }
            this.c = Arrays.copyOf(cArr, i3);
        }
    }

    public boolean k() {
        return ((bn3) this.c) != null;
    }

    public void l(int i, q90 q90Var) {
        while (true) {
            int i2 = i >> 1;
            if (i2 == 0) {
                break;
            }
            q90 q90Var2 = ((q90[]) this.c)[i2];
            q90Var2.getClass();
            if (g76.R(0L, q90Var.g - q90Var2.g) <= 0) {
                break;
            }
            q90Var2.f = i;
            ((q90[]) this.c)[i] = q90Var2;
            i = i2;
        }
        ((q90[]) this.c)[i] = q90Var;
        q90Var.f = i;
    }

    public void m(z25 z25Var, int i, int i2) {
        ((w73) this.c).x(new t2d(z25Var), i, i2);
    }

    public bo4 n(h00 h00Var) {
        h00Var.getClass();
        int i = this.b;
        f17 f17Var = (f17) this.c;
        if (i < f17Var.getSize()) {
            return ((g00) f17Var.get(i)).a(h00Var, new ad(i + 1, 4, f17Var));
        }
        ygf.f("Check failed.");
        return null;
    }

    @Override // defpackage.k60
    public void o(String str) {
        ((AtomicReference) this.c).set(str);
    }

    public cc6 p() {
        cc6 tc6Var;
        Object obj;
        jl1 jl1Var = (jl1) this.c;
        byte bI = jl1Var.I();
        if (bI == 1) {
            return s(true);
        }
        if (bI == 0) {
            return s(false);
        }
        if (bI != 6) {
            if (bI == 8) {
                return q();
            }
            jl1.q(jl1Var, "Cannot read Json element because of unexpected ".concat(guc.Z(bI)), 0, null, 6);
            throw null;
        }
        int i = this.b + 1;
        this.b = i;
        if (i == 200) {
            md6 md6Var = new md6(this, null);
            tb2 tb2Var = ow2.a;
            pw2 pw2Var = new pw2();
            pw2Var.a = md6Var;
            pw2Var.b = pw2Var;
            tb2 tb2Var2 = ow2.a;
            pw2Var.c = tb2Var2;
            while (true) {
                obj = pw2Var.c;
                n92 n92Var = pw2Var.b;
                if (n92Var == null) {
                    break;
                }
                if (g76.L(tb2Var2, obj)) {
                    try {
                        md6 md6Var2 = pw2Var.a;
                        pwd.B(3, md6Var2);
                        md6 md6Var3 = new md6(md6Var2.e, n92Var);
                        md6Var3.d = pw2Var;
                        Object objInvokeSuspend = md6Var3.invokeSuspend(c1e.a);
                        if (objInvokeSuspend != tb2.COROUTINE_SUSPENDED) {
                            n92Var.resumeWith(objInvokeSuspend);
                        }
                    } catch (Throwable th) {
                        n92Var.resumeWith(new ajb(th));
                    }
                } else {
                    pw2Var.c = tb2Var2;
                    n92Var.resumeWith(obj);
                }
            }
            br7.v(obj);
            tc6Var = (cc6) obj;
        } else {
            byte bJ = jl1Var.j((byte) 6);
            if (jl1Var.I() == 4) {
                jl1.q(jl1Var, "Unexpected leading comma", 0, null, 6);
                throw null;
            }
            LinkedHashMap linkedHashMap = new LinkedHashMap();
            while (true) {
                if (!jl1Var.f()) {
                    break;
                }
                String strM = jl1Var.m();
                jl1Var.j((byte) 5);
                linkedHashMap.put(strM, p());
                bJ = jl1Var.i();
                if (bJ != 4) {
                    if (bJ != 7) {
                        jl1.q(jl1Var, "Expected end of the object or comma", 0, null, 6);
                        throw null;
                    }
                }
            }
            if (bJ == 6) {
                jl1Var.j((byte) 7);
            } else if (bJ == 4) {
                m40.P(jl1Var, "object");
                throw null;
            }
            tc6Var = new tc6(linkedHashMap);
        }
        this.b--;
        return tc6Var;
    }

    public ob6 q() {
        jl1 jl1Var = (jl1) this.c;
        byte bI = jl1Var.i();
        if (jl1Var.I() == 4) {
            jl1.q(jl1Var, "Unexpected leading comma", 0, null, 6);
            throw null;
        }
        ArrayList arrayList = new ArrayList();
        while (jl1Var.f()) {
            arrayList.add(p());
            bI = jl1Var.i();
            if (bI != 4) {
                boolean z = bI == 9;
                int i = jl1Var.c;
                if (!z) {
                    jl1.q(jl1Var, "Expected end of the array or comma", i, null, 4);
                    throw null;
                }
            }
        }
        if (bI == 8) {
            jl1Var.j((byte) 9);
        } else if (bI == 4) {
            m40.P(jl1Var, "array");
            throw null;
        }
        return new ob6(arrayList);
    }

    public yc6 s(boolean z) {
        jl1 jl1Var = (jl1) this.c;
        String strN = !z ? jl1Var.n() : jl1Var.m();
        return (z || !g76.L(strN, "null")) ? new lc6(strN, z) : oc6.INSTANCE;
    }

    public void t() {
        nk1 nk1Var = nk1.c;
        char[] cArr = (char[]) this.c;
        nk1Var.getClass();
        cArr.getClass();
        synchronized (nk1Var) {
            int i = nk1Var.b;
            if (cArr.length + i < b80.a) {
                nk1Var.b = i + cArr.length;
                nk1Var.a.addLast(cArr);
            }
        }
    }

    public String toString() {
        switch (this.a) {
            case 8:
                return new String((char[]) this.c, 0, this.b);
            default:
                return super.toString();
        }
    }

    public void u(long j) {
        int i = this.b;
        int i2 = 0;
        while (i2 < i) {
            if (j == ((long[]) this.c)[i2]) {
                int i3 = this.b - 1;
                while (i2 < i3) {
                    long[] jArr = (long[]) this.c;
                    int i4 = i2 + 1;
                    jArr[i2] = jArr[i4];
                    i2 = i4;
                }
                this.b--;
                return;
            }
            i2++;
        }
    }

    public void v(q90 q90Var) {
        q90 q90Var2;
        int i = q90Var.f;
        if (i == -1) {
            ay0.e("Failed requirement.");
            return;
        }
        int i2 = this.b;
        q90 q90Var3 = ((q90[]) this.c)[i2];
        q90Var3.getClass();
        q90Var.f = -1;
        ((q90[]) this.c)[i2] = null;
        this.b = i2 - 1;
        if (q90Var == q90Var3) {
            return;
        }
        int iR = g76.R(0L, q90Var3.g - q90Var.g);
        if (iR == 0) {
            ((q90[]) this.c)[i] = q90Var3;
            q90Var3.f = i;
            return;
        }
        if (iR >= 0) {
            l(i, q90Var3);
            return;
        }
        while (true) {
            int i3 = i << 1;
            int i4 = i3 + 1;
            int i5 = this.b;
            if (i4 > i5) {
                if (i3 > i5) {
                    break;
                }
                q90Var2 = ((q90[]) this.c)[i3];
                q90Var2.getClass();
            } else {
                q90Var2 = ((q90[]) this.c)[i3];
                q90Var2.getClass();
                q90 q90Var4 = ((q90[]) this.c)[i4];
                q90Var4.getClass();
                if (g76.R(0L, q90Var4.g - q90Var2.g) >= 0) {
                    q90Var2 = q90Var4;
                }
            }
            if (g76.R(0L, q90Var2.g - q90Var3.g) <= 0) {
                break;
            }
            int i6 = q90Var2.f;
            q90Var2.f = i;
            ((q90[]) this.c)[i] = q90Var2;
            i = i6;
        }
        ((q90[]) this.c)[i] = q90Var3;
        q90Var3.f = i;
    }

    public void w(cx7 cx7Var, ew5 ew5Var, Map map, long j) {
        LinkedHashMap linkedHashMap = (LinkedHashMap) this.c;
        Object arrayList = linkedHashMap.get(cx7Var);
        if (arrayList == null) {
            arrayList = new ArrayList();
            linkedHashMap.put(cx7Var, arrayList);
        }
        ArrayList arrayList2 = (ArrayList) arrayList;
        wva wvaVar = new wva(new WeakReference(ew5Var), map, j);
        if (!arrayList2.isEmpty()) {
            int size = arrayList2.size();
            int i = 0;
            while (true) {
                if (i >= size) {
                    break;
                }
                wva wvaVar2 = (wva) arrayList2.get(i);
                if (j < wvaVar2.c) {
                    i++;
                } else if (wvaVar2.a.get() == ew5Var) {
                    arrayList2.set(i, wvaVar);
                } else {
                    arrayList2.add(i, wvaVar);
                }
            }
        } else {
            arrayList2.add(wvaVar);
        }
        f();
    }

    public void x(String str) {
        str.getClass();
        int length = str.length();
        if (length == 0) {
            return;
        }
        j(this.b, length);
        str.getChars(0, str.length(), (char[]) this.c, this.b);
        this.b += length;
    }

    @Override // defpackage.eeg
    public int zza() {
        switch (this.a) {
        }
        return this.b;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // defpackage.eeg
    public byte[] b(int i, byte[] bArr, byte[] bArr2) throws GeneralSecurityException {
        byte[] bArrG;
        byte[] bArrO;
        Object[] objArr = 0;
        int i2 = 28;
        switch (this.a) {
            case 19:
                f1g f1gVar = (f1g) this.c;
                if (bArr2.length < i) {
                    ygf.l("ciphertext too short");
                    return null;
                }
                byte[] bArrCopyOfRange = Arrays.copyOfRange(bArr2, i, bArr2.length);
                byte[] bArrCopyOf = Arrays.copyOf(bArr, f1gVar.a);
                int i3 = f1gVar.a;
                byte[] bArrCopyOfRange2 = Arrays.copyOfRange(bArr, i3, f1gVar.b + i3);
                o2b o2bVar = new o2b(24, (boolean) (objArr == true ? 1 : 0));
                o2bVar.c = null;
                o2bVar.d = null;
                o2bVar.e = null;
                o2bVar.b = f1gVar;
                o2bVar.c = new ujf(i2, qvg.a(bArrCopyOf));
                o2bVar.d = new ujf(i2, qvg.a(bArrCopyOfRange2));
                return yug.a(o2bVar.N()).b(bArrCopyOfRange, vx0.w);
            default:
                if (bArr2.length < i) {
                    ygf.l("ciphertext too short");
                    return null;
                }
                byte[] bArrCopyOfRange3 = Arrays.copyOfRange(bArr2, i, bArr2.length);
                tag tagVar = new tag();
                tagVar.b = null;
                tagVar.c = null;
                tagVar.a = (dbg) this.c;
                tagVar.b = new ujf(i2, qvg.a(bArr));
                vag vagVarB = tagVar.b();
                rug rugVar = new rug(((qvg) vagVarB.i.b).b(), vagVarB.j);
                byte[][] bArr3 = {vx0.w};
                int length = bArrCopyOfRange3.length;
                byte[] bArr4 = rugVar.c;
                if (length < bArr4.length + 16) {
                    ygf.l("Ciphertext too short.");
                    return null;
                }
                if (!ejg.b(bArr4, bArrCopyOfRange3)) {
                    ygf.l("Decryption failed (OutputPrefix mismatch).");
                    return null;
                }
                Cipher cipher = (Cipher) rug.g.get();
                byte[] bArrCopyOfRange4 = Arrays.copyOfRange(bArrCopyOfRange3, bArr4.length, bArr4.length + 16);
                byte[] bArr5 = (byte[]) bArrCopyOfRange4.clone();
                bArr5[8] = (byte) (bArr5[8] & 127);
                bArr5[12] = (byte) (bArr5[12] & 127);
                cipher.init(2, new SecretKeySpec(rugVar.b, "AES"), new IvParameterSpec(bArr5));
                int length2 = bArr4.length + 16;
                int length3 = bArrCopyOfRange3.length - length2;
                byte[] bArrDoFinal = cipher.doFinal(bArrCopyOfRange3, length2, length3);
                if (length3 == 0 && bArrDoFinal == null && "The Android Project".equals(System.getProperty("java.vendor"))) {
                    bArrDoFinal = new byte[0];
                }
                byte[][] bArr6 = (byte[][]) Arrays.copyOf(bArr3, 2);
                bArr6[1] = bArrDoFinal;
                int length4 = bArr6.length;
                rkg rkgVar = rugVar.a;
                if (length4 == 0) {
                    bArrO = rkgVar.O(16, rug.f);
                } else {
                    byte[] bArrO2 = rkgVar.O(16, rug.e);
                    for (int i4 = 0; i4 < bArr6.length - 1; i4++) {
                        byte[] bArr7 = bArr6[i4];
                        if (bArr7 == null) {
                            bArr7 = new byte[0];
                        }
                        bArrO2 = il7.G(mk7.M(bArrO2), rkgVar.O(16, bArr7));
                    }
                    byte[] bArr8 = bArr6[bArr6.length - 1];
                    if (bArr8.length >= 16) {
                        if (bArr8.length < bArrO2.length) {
                            ay0.e(kSWQKWZ.aEhJnGKpCw);
                            return null;
                        }
                        int length5 = bArr8.length - bArrO2.length;
                        bArrG = Arrays.copyOf(bArr8, bArr8.length);
                        for (int i5 = 0; i5 < bArrO2.length; i5++) {
                            int i6 = length5 + i5;
                            bArrG[i6] = (byte) (bArrG[i6] ^ bArrO2[i5]);
                        }
                    } else {
                        if (bArr8.length >= 16) {
                            ay0.e("x must be smaller than a block.");
                            return null;
                        }
                        byte[] bArrCopyOf2 = Arrays.copyOf(bArr8, 16);
                        bArrCopyOf2[bArr8.length] = -128;
                        bArrG = il7.G(bArrCopyOf2, mk7.M(bArrO2));
                    }
                    bArrO = rkgVar.O(16, bArrG);
                }
                if (MessageDigest.isEqual(bArrCopyOfRange4, bArrO)) {
                    return bArrDoFinal;
                }
                throw new AEADBadTagException(mBTDfueQiGWRV.IIwImZVSklL);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x005e  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x008f  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x009f  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x00a9  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00ad  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:22:0x007a -> B:23:0x0080). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object r(defpackage.pw2 r13, defpackage.kn0 r14) {
        /*
            r12 = this;
            java.lang.Object r0 = r12.c
            jl1 r0 = (defpackage.jl1) r0
            boolean r1 = r14 instanceof defpackage.nd6
            if (r1 == 0) goto L17
            r1 = r14
            nd6 r1 = (defpackage.nd6) r1
            int r2 = r1.h
            r3 = -2147483648(0xffffffff80000000, float:-0.0)
            r4 = r2 & r3
            if (r4 == 0) goto L17
            int r2 = r2 - r3
            r1.h = r2
            goto L1c
        L17:
            nd6 r1 = new nd6
            r1.<init>(r12, r14)
        L1c:
            java.lang.Object r14 = r1.f
            tb2 r2 = defpackage.tb2.COROUTINE_SUSPENDED
            int r3 = r1.h
            r4 = 0
            r5 = 0
            r6 = 6
            r7 = 7
            r8 = 4
            r9 = 1
            if (r3 == 0) goto L42
            if (r3 != r9) goto L3c
            java.lang.String r12 = r1.e
            java.util.LinkedHashMap r13 = r1.d
            ad r0 = r1.c
            pw2 r3 = r1.b
            defpackage.br7.v(r14)
            r11 = r1
            r1 = r13
            r13 = r3
            r3 = r11
            goto L80
        L3c:
            java.lang.String r12 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r12)
            return r5
        L42:
            defpackage.br7.v(r14)
            byte r14 = r0.j(r6)
            byte r3 = r0.I()
            if (r3 == r8) goto Lbb
            java.util.LinkedHashMap r0 = new java.util.LinkedHashMap
            r0.<init>()
        L54:
            java.lang.Object r3 = r12.c
            jl1 r3 = (defpackage.jl1) r3
            boolean r10 = r3.f()
            if (r10 == 0) goto La3
            java.lang.String r14 = r3.m()
            r10 = 5
            r3.j(r10)
            r1.b = r13
            r1.c = r12
            r1.d = r0
            r1.e = r14
            r1.h = r9
            r13.getClass()
            r13.b = r1
            tb2 r3 = defpackage.tb2.COROUTINE_SUSPENDED
            if (r3 != r2) goto L7a
            return r2
        L7a:
            r11 = r0
            r0 = r12
            r12 = r14
            r14 = r3
            r3 = r1
            r1 = r11
        L80:
            cc6 r14 = (defpackage.cc6) r14
            r1.put(r12, r14)
            java.lang.Object r12 = r0.c
            jl1 r12 = (defpackage.jl1) r12
            byte r14 = r12.i()
            if (r14 == r8) goto L9f
            if (r14 != r7) goto L94
            r12 = r0
            r0 = r1
            goto La3
        L94:
            java.lang.Object r12 = r0.c
            jl1 r12 = (defpackage.jl1) r12
            r13 = 0
            java.lang.String r13 = com.drew.imaging.raf.yvq.AXoTRPEGKEve.RZbfeBRZy
            defpackage.jl1.q(r12, r13, r4, r5, r6)
            throw r5
        L9f:
            r12 = r0
            r0 = r1
            r1 = r3
            goto L54
        La3:
            java.lang.Object r12 = r12.c
            jl1 r12 = (defpackage.jl1) r12
            if (r14 != r6) goto Lad
            r12.j(r7)
            goto Laf
        Lad:
            if (r14 == r8) goto Lb5
        Laf:
            tc6 r12 = new tc6
            r12.<init>(r0)
            return r12
        Lb5:
            java.lang.String r13 = "object"
            defpackage.m40.P(r12, r13)
            throw r5
        Lbb:
            java.lang.String r12 = "Unexpected leading comma"
            defpackage.jl1.q(r0, r12, r4, r5, r6)
            throw r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ad.r(pw2, kn0):java.lang.Object");
    }

    public /* synthetic */ ad(int i, int i2, Object obj) {
        this.a = i2;
        this.c = obj;
        this.b = i;
    }

    public ad(h42 h42Var, int i) {
        this.a = 18;
        vp7.p(h42Var);
        this.c = h42Var;
        this.b = i;
    }

    public ad(f1g f1gVar) {
        this.a = 19;
        this.c = f1gVar;
        this.b = f1gVar.a + f1gVar.b;
    }

    public ad(dbg dbgVar) {
        this.a = 20;
        this.c = dbgVar;
        this.b = dbgVar.a;
    }

    public ad(ku3 ku3Var, jl1 jl1Var) {
        this.a = 9;
        this.c = jl1Var;
    }

    public ad(String str, int i) {
        this.a = 3;
        this.b = i;
        this.c = new AtomicReference(str);
    }

    public /* synthetic */ ad(char c, int i) {
        this.a = i;
    }

    public ad(w73 w73Var, int i) {
        this.a = 15;
        this.c = w73Var;
        this.a = 15;
        this.b = i;
    }

    public ad(int i, yqa[] yqaVarArr) {
        this.a = 17;
        this.b = i;
        this.c = yqaVarArr;
    }

    public ad(Context context) {
        this.a = 0;
        int iF = bd.f(context, 0);
        this.c = new wc(new ContextThemeWrapper(context, bd.f(context, iF)));
        this.b = iF;
    }
}
