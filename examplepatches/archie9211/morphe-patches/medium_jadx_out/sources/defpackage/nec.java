package defpackage;

import android.content.Context;
import android.os.Parcel;
import android.view.MenuItem;
import androidx.appcompat.widget.Toolbar;
import com.google.android.recaptcha.internal.zzad;
import com.medium.android.graphql.fragment.TagData;
import gen.model.SourceParameter;
import j$.util.Optional;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.security.GeneralSecurityException;
import java.security.Provider;
import java.security.Security;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.regex.Matcher;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class nec implements jx7, s3b, vlf, huf {
    public final /* synthetic */ int a;
    public Object b;

    public nec(Context context) {
        this.a = 8;
        hha hhaVar = new hha(context);
        vgf vgfVarA = vgf.a(new mya(hhaVar, vgf.a(bgf.N), new xsa(hhaVar)));
        this.b = vgf.a(new d2f(vgfVarA, 3, vgf.a(new qlb(vgfVarA))));
    }

    public static final String j() {
        vig vigVar = yig.c;
        int[] iArr = {491705403, 818579176, 1201981447, 810223592, 1243973908, -593404049, 554701476, 1889947178, 1780695788};
        int i = iArr[0];
        int i2 = iArr[1];
        int i3 = iArr[2];
        int i4 = iArr[3];
        int i5 = iArr[4];
        int i6 = iArr[5];
        int i7 = iArr[6];
        ByteBuffer byteBufferAllocate = ByteBuffer.allocate((iArr[7] % 1780695788) ^ lv8.f((i2 & (~i)) | i3, (i & i4) | i5, i6, i7));
        byteBufferAllocate.order(ByteOrder.LITTLE_ENDIAN);
        byteBufferAllocate.putShort((short) 5);
        byteBufferAllocate.putInt(78977249);
        byte[] bArrArray = byteBufferAllocate.array();
        return vigVar.d(bArrArray.length, bArrArray);
    }

    @Override // defpackage.jx7
    public void Y(lx7 lx7Var) {
        Toolbar toolbar = (Toolbar) this.b;
        h6 h6Var = toolbar.a.t;
        if (h6Var == null || !h6Var.j()) {
            Iterator it2 = toolbar.G.b.iterator();
            while (it2.hasNext()) {
                ((v15) ((ly7) it2.next())).a.s();
            }
        }
    }

    @Override // defpackage.vlf
    public Object a(String str) throws GeneralSecurityException {
        String[] strArr = {"GmsCore_OpenSSL", "AndroidOpenSSL", "Conscrypt"};
        ArrayList arrayList = new ArrayList();
        for (int i = 0; i < 3; i++) {
            Provider provider = Security.getProvider(strArr[i]);
            if (provider != null) {
                arrayList.add(provider);
            }
        }
        Iterator it2 = arrayList.iterator();
        Exception exc = null;
        while (it2.hasNext()) {
            try {
                return ((xlf) this.b).d(str, (Provider) it2.next());
            } catch (Exception e) {
                if (exc == null) {
                    exc = e;
                }
            }
        }
        throw new GeneralSecurityException("No good Provider found.", exc);
    }

    @Override // defpackage.s3b
    public void accept(Object obj, Object obj2) {
        int i = 1;
        switch (this.a) {
            case 9:
                akf akfVar = new akf((wfd) obj2, 0);
                tkf tkfVar = (tkf) ((dkf) obj).h();
                rq0 rq0Var = (rq0) this.b;
                Parcel parcelA = tkfVar.a();
                int i2 = hkf.a;
                parcelA.writeStrongBinder(akfVar);
                hkf.c(parcelA, rq0Var);
                tkfVar.c(1, parcelA);
                break;
            default:
                r16 r16Var = (r16) this.b;
                hag hagVar = new hag((wfd) obj2, i);
                p3g p3gVar = (p3g) ((neg) obj).h();
                Parcel parcelObtain = Parcel.obtain();
                parcelObtain.writeInterfaceToken("com.google.android.gms.recaptchabase.internal.IRecaptchaBaseService");
                int i3 = sxf.a;
                parcelObtain.writeStrongBinder(hagVar);
                parcelObtain.writeInt(1);
                r16Var.writeToParcel(parcelObtain, 0);
                p3gVar.a(1, parcelObtain);
                break;
        }
    }

    public void b(Object obj) {
        ((ArrayList) this.b).add(obj);
    }

    @Override // defpackage.huf
    public boolean c(Class cls) {
        for (huf hufVar : (huf[]) this.b) {
            if (hufVar.c(cls)) {
                return true;
            }
        }
        return false;
    }

    @Override // defpackage.jx7
    public boolean d(lx7 lx7Var, MenuItem menuItem) {
        return false;
    }

    public void e(Object obj) {
        ArrayList arrayList = (ArrayList) this.b;
        if (obj == null) {
            return;
        }
        if (obj instanceof Object[]) {
            Object[] objArr = (Object[]) obj;
            if (objArr.length > 0) {
                arrayList.ensureCapacity(arrayList.size() + objArr.length);
                Collections.addAll(arrayList, objArr);
                return;
            }
            return;
        }
        if (obj instanceof Collection) {
            arrayList.addAll((Collection) obj);
            return;
        }
        if (obj instanceof Iterable) {
            Iterator it2 = ((Iterable) obj).iterator();
            while (it2.hasNext()) {
                arrayList.add(it2.next());
            }
        } else if (obj instanceof Iterator) {
            Iterator it3 = (Iterator) obj;
            while (it3.hasNext()) {
                arrayList.add(it3.next());
            }
        } else {
            throw new UnsupportedOperationException("Don't know how to spread " + obj.getClass());
        }
    }

    public long f(long j) {
        f33 f33Var = (f33) this.b;
        if (qre.b(j) <= 0.0f || qre.c(j) <= 0.0f) {
            b26.b("maximumVelocity should be a positive value. You specified=" + ((Object) qre.g(j)));
        }
        return ok7.u(((tre) f33Var.b).b(qre.b(j)), ((tre) f33Var.c).b(qre.c(j)));
    }

    public ybd g(TagData tagData, zbd zbdVar, SourceParameter sourceParameter) {
        bo4 u50Var;
        tagData.getClass();
        zbdVar.getClass();
        String normalizedTagSlug = tagData.getNormalizedTagSlug();
        if (acd.a[zbdVar.ordinal()] != 1) {
            ygf.a();
            return null;
        }
        r0f r0fVar = (r0f) this.b;
        if (normalizedTagSlug != null) {
            u50Var = new hxe(r0fVar.a.n(normalizedTagSlug, true), 4);
        } else {
            u50Var = new u50(7, bt4.CANT_FOLLOW);
        }
        xbd xbdVar = new xbd(u50Var);
        String normalizedTagSlug2 = tagData.getNormalizedTagSlug();
        if (normalizedTagSlug2 == null) {
            ay0.e("Tag has no normalizedTagSlug");
            return null;
        }
        String displayTitle = tagData.getDisplayTitle();
        if (displayTitle != null) {
            return new ybd(normalizedTagSlug2, displayTitle, tagData.getFollowerCount(), tagData.getPostCount(), xbdVar, sourceParameter);
        }
        ywb.g(ev6.x("Tag with id ", normalizedTagSlug, " has no displayTitle"));
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object h(java.lang.String r8, defpackage.ntf r9, defpackage.p92 r10) throws com.google.android.recaptcha.internal.zzfx {
        /*
            r7 = this;
            d87 r0 = defpackage.d87.U0
            boolean r1 = r10 instanceof defpackage.gdg
            if (r1 == 0) goto L15
            r1 = r10
            gdg r1 = (defpackage.gdg) r1
            int r2 = r1.d
            r3 = -2147483648(0xffffffff80000000, float:-0.0)
            r4 = r2 & r3
            if (r4 == 0) goto L15
            int r2 = r2 - r3
            r1.d = r2
            goto L1a
        L15:
            gdg r1 = new gdg
            r1.<init>(r7, r10)
        L1a:
            java.lang.Object r10 = r1.b
            tb2 r2 = defpackage.tb2.COROUTINE_SUSPENDED
            int r3 = r1.d
            r4 = 0
            r5 = 8
            r6 = 1
            if (r3 == 0) goto L34
            if (r3 != r6) goto L2e
            defpackage.br7.v(r10)     // Catch: java.lang.Exception -> L2c com.google.android.recaptcha.internal.zzfx -> L8e
            goto L48
        L2c:
            r7 = move-exception
            goto L90
        L2e:
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r7)
            return r4
        L34:
            defpackage.br7.v(r10)
            java.lang.Object r7 = r7.b     // Catch: java.lang.Exception -> L2c com.google.android.recaptcha.internal.zzfx -> L8e
            tag r7 = (defpackage.tag) r7     // Catch: java.lang.Exception -> L2c com.google.android.recaptcha.internal.zzfx -> L8e
            byte[] r9 = r9.d()     // Catch: java.lang.Exception -> L2c com.google.android.recaptcha.internal.zzfx -> L8e
            r1.d = r6     // Catch: java.lang.Exception -> L2c com.google.android.recaptcha.internal.zzfx -> L8e
            java.lang.Object r10 = r7.a(r8, r9, r1)     // Catch: java.lang.Exception -> L2c com.google.android.recaptcha.internal.zzfx -> L8e
            if (r10 != r2) goto L48
            return r2
        L48:
            aeg r10 = (defpackage.aeg) r10     // Catch: java.lang.Exception -> L2c com.google.android.recaptcha.internal.zzfx -> L8e
            jrf r7 = defpackage.jrf.G()     // Catch: java.lang.Exception -> L2c com.google.android.recaptcha.internal.zzfx -> L55
            emf r7 = r10.b(r7)     // Catch: java.lang.Exception -> L2c com.google.android.recaptcha.internal.zzfx -> L55
            jrf r7 = (defpackage.jrf) r7     // Catch: java.lang.Exception -> L2c com.google.android.recaptcha.internal.zzfx -> L55
            return r7
        L55:
            r7 = move-exception
            d87 r8 = r7.b     // Catch: java.lang.Exception -> L2c com.google.android.recaptcha.internal.zzfx -> L8e
            d87 r9 = defpackage.d87.L     // Catch: java.lang.Exception -> L2c com.google.android.recaptcha.internal.zzfx -> L8e
            boolean r8 = defpackage.g76.L(r8, r9)     // Catch: java.lang.Exception -> L2c com.google.android.recaptcha.internal.zzfx -> L8e
            if (r8 == 0) goto L8d
            byte[] r7 = r10.b     // Catch: java.lang.Exception -> L2c com.google.android.recaptcha.internal.zzfx -> L8e
            otf r7 = defpackage.otf.w(r7)     // Catch: java.lang.Exception -> L80
            qtf r7 = r7.v()     // Catch: java.lang.Exception -> L80
            java.util.Map r8 = com.google.android.recaptcha.internal.zzfx.f     // Catch: java.lang.Exception -> L80
            java.lang.Object r7 = r8.get(r7)     // Catch: java.lang.Exception -> L80
            com.google.android.recaptcha.internal.zzfx r7 = (com.google.android.recaptcha.internal.zzfx) r7     // Catch: java.lang.Exception -> L80
            if (r7 != 0) goto L8d
            com.google.android.recaptcha.internal.zzfx r7 = new com.google.android.recaptcha.internal.zzfx     // Catch: java.lang.Exception -> L80
            d87 r8 = defpackage.d87.S0     // Catch: java.lang.Exception -> L80
            d87 r9 = defpackage.d87.E     // Catch: java.lang.Exception -> L80
            r10 = 12
            r7.<init>(r8, r9, r4, r10)     // Catch: java.lang.Exception -> L80
            goto L8d
        L80:
            r7 = move-exception
            com.google.android.recaptcha.internal.zzfx r8 = new com.google.android.recaptcha.internal.zzfx     // Catch: java.lang.Exception -> L2c com.google.android.recaptcha.internal.zzfx -> L8e
            d87 r9 = defpackage.d87.p     // Catch: java.lang.Exception -> L2c com.google.android.recaptcha.internal.zzfx -> L8e
            java.lang.String r7 = r7.getMessage()     // Catch: java.lang.Exception -> L2c com.google.android.recaptcha.internal.zzfx -> L8e
            r8.<init>(r0, r9, r7, r5)     // Catch: java.lang.Exception -> L2c com.google.android.recaptcha.internal.zzfx -> L8e
            r7 = r8
        L8d:
            throw r7     // Catch: java.lang.Exception -> L2c com.google.android.recaptcha.internal.zzfx -> L8e
        L8e:
            r7 = move-exception
            goto L9c
        L90:
            com.google.android.recaptcha.internal.zzfx r8 = new com.google.android.recaptcha.internal.zzfx
            d87 r9 = defpackage.d87.o
            java.lang.String r7 = r7.getMessage()
            r8.<init>(r0, r9, r7, r5)
            throw r8
        L9c:
            throw r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nec.h(java.lang.String, ntf, p92):java.lang.Object");
    }

    public void i(long j, long j2, long j3) throws zzad {
        int[] iArr = {2077486715, 1348529152, 196553492, 1547748370, 218381171, -1556364309, 1117142618, 1713258270, 1573363368};
        int i = iArr[0];
        int i2 = iArr[1];
        int i3 = iArr[2];
        int i4 = iArr[3];
        int i5 = iArr[4];
        int i6 = iArr[5];
        int i7 = iArr[6];
        int i8 = iArr[7];
        dmf dmfVar = new dmf(j, j2, j3);
        ArrayDeque arrayDeque = (ArrayDeque) this.b;
        if (arrayDeque.size() >= (lv8.f((i2 & (~i)) | i3, (i & i4) | i5, i6, i7) ^ (i8 % 1573363368))) {
            throw new zzad();
        }
        arrayDeque.push(dmfVar);
    }

    public dmf k() {
        return (dmf) Optional.ofNullable((dmf) ((ArrayDeque) this.b).peek()).orElseThrow(qlf.b);
    }

    @Override // defpackage.huf
    public ruf l(Class cls) {
        for (huf hufVar : (huf[]) this.b) {
            if (hufVar.c(cls)) {
                return hufVar.l(cls);
            }
        }
        ik4.k("No factory is available for message type: ".concat(cls.getName()));
        return null;
    }

    public /* synthetic */ nec(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    public /* synthetic */ nec(ckf ckfVar, rq0 rq0Var) {
        this.a = 9;
        this.b = rq0Var;
    }

    public /* synthetic */ nec(char c, int i) {
        this.a = i;
    }

    public nec(Matcher matcher) {
        this.a = 17;
        matcher.getClass();
        this.b = matcher;
    }

    public nec(gn9 gn9Var) {
        this.a = 6;
        gn9Var.getClass();
        this.b = gn9Var;
    }

    public nec(int i) {
        this.a = 1;
        this.b = new ArrayList(i);
    }

    public nec(int i, byte b) {
        this.a = i;
        switch (i) {
            case 11:
                this.b = new ArrayDeque();
                break;
            default:
                this.b = new f33();
                break;
        }
    }
}
