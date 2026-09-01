package defpackage;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Bundle;
import android.text.Layout;
import androidx.credentials.internal.FrameworkClassParsingException;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.mp4.media.Mp4VideoDirectory;
import com.medium.android.domain.post.models.AnchorType;
import com.medium.android.domain.post.models.Markup;
import com.medium.android.domain.post.models.MarkupType;
import com.medium.proto.model.RichTextModel;
import com.medium.reader.R;
import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class w2g {
    public static final d1g a;
    public static final mz1 b;
    public static final mz1 d;
    public static final mz1 j;
    public static final mz1 k;
    public static final d1g l;
    public static final d1g m;
    public static final da4 s;
    public static final da4 t;
    public static final da4[] u;
    public static Method v;
    public static Method w;
    public static boolean x;
    public static final mz1 c = new mz1(new a02(6), false, -1596758066);
    public static final mz1 e = new mz1(new a02(8), false, 265779409);
    public static final mz1 f = new mz1(new a02(9), false, 352595386);
    public static final mz1 g = new mz1(new a02(10), false, 1382909242);
    public static final mz1 h = new mz1(new a02(11), false, -1086282781);
    public static final mz1 i = new mz1(new a02(12), false, 330456098);
    public static final hpe n = new hpe(18);
    public static final dsb o = new dsb(0 == true ? 1 : 0);
    public static final esb p = new esb();
    public static final ff3 q = new ff3(2);
    public static final iz8 r = new iz8(1);

    /* JADX WARN: Multi-variable type inference failed */
    static {
        int i2 = 16;
        a = new d1g(i2, "RESUME_TOKEN", false);
        int i3 = 5;
        b = new mz1(new a02(i3), false, -224983255);
        int i4 = 7;
        d = new mz1(new a02(i4), false, 978472864);
        j = new mz1(new j02(i4), false, 1237255708);
        k = new mz1(new u02(i3), false, -767088998);
        l = new d1g(i2, "REMOVED_TASK", 0 == true ? 1 : 0);
        m = new d1g(i2, "CLOSED_EMPTY", 0 == true ? 1 : 0);
        da4 da4Var = new da4("auth_blockstore", 3L);
        da4 da4Var2 = new da4("blockstore_data_transfer", 1L);
        da4 da4Var3 = new da4("blockstore_notify_app_restore", 1L);
        da4 da4Var4 = new da4("blockstore_store_bytes_with_options", 2L);
        da4 da4Var5 = new da4("blockstore_is_end_to_end_encryption_available", 1L);
        da4 da4Var6 = new da4("blockstore_enable_cloud_backup", 1L);
        da4 da4Var7 = new da4("blockstore_delete_bytes", 2L);
        da4 da4Var8 = new da4("blockstore_retrieve_bytes_with_options", 3L);
        da4 da4Var9 = new da4("auth_clear_restore_credential", 1L);
        s = da4Var9;
        da4 da4Var10 = new da4("auth_create_restore_credential", 1L);
        da4 da4Var11 = new da4("auth_get_restore_credential", 1L);
        t = da4Var11;
        u = new da4[]{da4Var, da4Var2, da4Var3, da4Var4, da4Var5, da4Var6, da4Var7, da4Var8, da4Var9, da4Var10, da4Var11};
    }

    public static final h1 A(Object[] objArr) {
        objArr.getClass();
        return new h1(objArr);
    }

    public static final r28 B(r28 r28Var, hy8 hy8Var) {
        return r28Var.b(new iy8(hy8Var));
    }

    public static final r28 C(r28 r28Var, float f2) {
        return r28Var.b(new fy8(f2, f2, f2, f2));
    }

    public static final r28 D(r28 r28Var, float f2, float f3) {
        return r28Var.b(new fy8(f2, f3, f2, f3));
    }

    public static r28 E(r28 r28Var, float f2, float f3, int i2) {
        if ((i2 & 1) != 0) {
            f2 = 0.0f;
        }
        if ((i2 & 2) != 0) {
            f3 = 0.0f;
        }
        return D(r28Var, f2, f3);
    }

    public static final r28 F(r28 r28Var, float f2, float f3, float f4, float f5) {
        return r28Var.b(new fy8(f2, f3, f4, f5));
    }

    public static r28 G(r28 r28Var, float f2, float f3, float f4, float f5, int i2) {
        if ((i2 & 1) != 0) {
            f2 = 0.0f;
        }
        if ((i2 & 2) != 0) {
            f3 = 0.0f;
        }
        if ((i2 & 4) != 0) {
            f4 = 0.0f;
        }
        if ((i2 & 8) != 0) {
            f5 = 0.0f;
        }
        return F(r28Var, f2, f3, f4, f5);
    }

    public static final n65 H(x12 x12Var) {
        p65 p65Var = (p65) x12Var;
        p65Var.V(Mp4VideoDirectory.TAG_HORIZONTAL_RESOLUTION, b22.e);
        if (p65Var.S) {
            igc.y(p65Var.I);
        }
        Object objE = p65Var.E();
        t65 sjbVar = objE instanceof t65 ? (t65) objE : null;
        if (sjbVar == null) {
            sjbVar = new sjb(new m65(new n65(p65Var, p65Var.T, p65Var.q, p65Var.C, p65Var.h.t)), -1);
            p65Var.k0(sjbVar);
        }
        n65 n65Var = ((m65) sjbVar.a).a;
        n65Var.f.setValue(p65Var.l());
        p65Var.p(false);
        return n65Var;
    }

    public static final void I(int i2, int i3, Object[] objArr) {
        objArr.getClass();
        while (i2 < i3) {
            objArr[i2] = null;
            i2++;
        }
    }

    public static r28 J(did didVar, hw8 hw8Var, boolean z, boolean z2) {
        return new csb(didVar, hw8Var, z, z2);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object K(defpackage.vsb r11, long r12, defpackage.p92 r14) {
        /*
            boolean r0 = r14 instanceof defpackage.fsb
            if (r0 == 0) goto L13
            r0 = r14
            fsb r0 = (defpackage.fsb) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            fsb r0 = new fsb
            r0.<init>(r14)
        L18:
            java.lang.Object r14 = r0.d
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 1
            if (r2 == 0) goto L34
            if (r2 != r3) goto L2d
            oya r11 = r0.c
            vsb r12 = r0.b
            defpackage.br7.v(r14)
            r8 = r11
            r11 = r12
            goto L55
        L2d:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            r11 = 0
            return r11
        L34:
            defpackage.br7.v(r14)
            oya r8 = new oya
            r8.<init>()
            s78 r14 = defpackage.s78.Default
            m0 r4 = new m0
            r9 = 0
            r10 = 3
            r5 = r11
            r6 = r12
            r4.<init>(r5, r6, r8, r9, r10)
            r0.b = r5
            r0.c = r8
            r0.e = r3
            java.lang.Object r11 = r5.f(r14, r4, r0)
            if (r11 != r1) goto L54
            return r1
        L54:
            r11 = r5
        L55:
            float r12 = r8.a
            long r11 = r11.h(r12)
            ip8 r13 = new ip8
            r13.<init>(r11)
            return r13
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.w2g.K(vsb, long, p92):java.lang.Object");
    }

    public static final void L(fb9 fb9Var, ArrayList arrayList) {
        RichTextModel richTextModel;
        RichTextModel richTextModel2 = fb9Var.e;
        if (richTextModel2 != null) {
            richTextModel = richTextModel2;
        } else {
            RichTextModel richTextModel3 = new RichTextModel(null, null, null, 7, null);
            fb9Var.e = richTextModel3;
            richTextModel = richTextModel3;
        }
        fb9Var.e = RichTextModel.copy$default(richTextModel, null, arrayList, null, 5, null);
    }

    public static final String M(Object[] objArr, int i2, int i3, s1 s1Var) {
        StringBuilder sb = new StringBuilder((i3 * 3) + 2);
        sb.append("[");
        for (int i4 = 0; i4 < i3; i4++) {
            if (i4 > 0) {
                sb.append(", ");
            }
            Object obj = objArr[i2 + i4];
            if (obj == s1Var) {
                sb.append("(this Collection)");
            } else {
                sb.append(obj);
            }
        }
        sb.append("]");
        return sb.toString();
    }

    public static Bitmap N(Drawable drawable) {
        int intrinsicWidth = drawable.getIntrinsicWidth();
        int intrinsicHeight = drawable.getIntrinsicHeight();
        if (drawable instanceof BitmapDrawable) {
            BitmapDrawable bitmapDrawable = (BitmapDrawable) drawable;
            if (bitmapDrawable.getBitmap() != null) {
                return (intrinsicWidth == bitmapDrawable.getBitmap().getWidth() && intrinsicHeight == bitmapDrawable.getBitmap().getHeight()) ? bitmapDrawable.getBitmap() : Bitmap.createScaledBitmap(bitmapDrawable.getBitmap(), intrinsicWidth, intrinsicHeight, true);
            }
            ay0.e("bitmap is null");
            return null;
        }
        Rect bounds = drawable.getBounds();
        int i2 = bounds.left;
        int i3 = bounds.top;
        int i4 = bounds.right;
        int i5 = bounds.bottom;
        Bitmap bitmapCreateBitmap = Bitmap.createBitmap(intrinsicWidth, intrinsicHeight, Bitmap.Config.ARGB_8888);
        drawable.setBounds(0, 0, intrinsicWidth, intrinsicHeight);
        drawable.draw(new Canvas(bitmapCreateBitmap));
        drawable.setBounds(i2, i3, i4, i5);
        return bitmapCreateBitmap;
    }

    public static synchronized double O(final Context context) {
        return ((Double) S(new t2g(context) { // from class: com.android.billingclient.api.zzek
            @Override // defpackage.t2g
            public final Object zza() {
                return Double.valueOf(2.0d);
            }
        }, Double.valueOf(2.0d))).doubleValue();
    }

    public static synchronized long P(final Context context) {
        return ((Long) S(new t2g(context) { // from class: com.android.billingclient.api.zzej
            @Override // defpackage.t2g
            public final Object zza() {
                return 3L;
            }
        }, 3L)).longValue();
    }

    public static synchronized long Q(final Context context) {
        return ((Long) S(new t2g(context) { // from class: com.android.billingclient.api.zzeh
            @Override // defpackage.t2g
            public final Object zza() {
                return 100L;
            }
        }, 100L)).longValue();
    }

    public static synchronized long R(final Context context) {
        return ((Long) S(new t2g(context) { // from class: com.android.billingclient.api.zzei
            @Override // defpackage.t2g
            public final Object zza() {
                return 60000L;
            }
        }, 60000L)).longValue();
    }

    public static Object S(t2g t2gVar, Number number) {
        try {
            return t2gVar.zza();
        } catch (Exception e2) {
            rxf.i("RuntimeFlags", "Fail to get the runtime flags: ".concat(e2.toString()));
            return number;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:101:0x0169  */
    /* JADX WARN: Removed duplicated region for block: B:102:0x016d  */
    /* JADX WARN: Removed duplicated region for block: B:105:0x018f  */
    /* JADX WARN: Removed duplicated region for block: B:109:0x01c2  */
    /* JADX WARN: Removed duplicated region for block: B:111:0x01dd  */
    /* JADX WARN: Removed duplicated region for block: B:112:0x01e8  */
    /* JADX WARN: Removed duplicated region for block: B:117:0x02d8  */
    /* JADX WARN: Removed duplicated region for block: B:119:0x032e  */
    /* JADX WARN: Removed duplicated region for block: B:121:0x033c  */
    /* JADX WARN: Removed duplicated region for block: B:124:0x0348  */
    /* JADX WARN: Removed duplicated region for block: B:126:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:76:0x00d6  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x00d8  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x00e1  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x011d  */
    /* JADX WARN: Removed duplicated region for block: B:98:0x0134  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void a(final java.lang.String r57, final java.lang.String r58, final boolean r59, final int r60, final java.lang.String r61, final java.lang.Long r62, final defpackage.r28 r63, long r64, defpackage.m45 r66, defpackage.x12 r67, final int r68, final int r69) {
        /*
            Method dump skipped, instruction units count: 856
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.w2g.a(java.lang.String, java.lang.String, boolean, int, java.lang.String, java.lang.Long, r28, long, m45, x12, int, int):void");
    }

    public static final void b(ms0 ms0Var, ls0 ls0Var, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(2104406085);
        int i3 = i2 | (p65Var.f(ms0Var) ? 4 : 2) | (p65Var.f(ls0Var) ? 32 : 16) | 384;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                sc0 sc0Var = new sc0(0, ls0Var, js0.class, "onDismissed", "onDismissed()V", 0, 3);
                p65Var.j0(sc0Var);
                objM = sc0Var;
            }
            m45 m45Var = (m45) ((qh6) objM);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = new nx(12);
                p65Var.j0(objM2);
            }
            r28Var2 = o28.b;
            vv2.r(m45Var, bgf.N(wxb.a(r28Var2, false, (x45) objM2), "block_reposter_confirmation"), pxf.E(791090101, new ec(ls0Var, 17, ms0Var), p65Var), p65Var, 384);
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new af0(i2, 2, ms0Var, ls0Var, r28Var2);
        }
    }

    public static final void c(ms0 ms0Var, js0 js0Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        r28 r28Var2;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-681600753);
        int i3 = i2 | (p65Var2.f(ms0Var) ? 4 : 2) | (p65Var2.f(js0Var) ? 32 : 16) | 384;
        if (p65Var2.P(i3 & 1, (i3 & 147) != 146)) {
            v7c v7cVarF = t18.f(6, 2, p65Var2);
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = kyd.M(p65Var2);
                p65Var2.j0(objM);
            }
            sb2 sb2Var = (sb2) objM;
            boolean zH = p65Var2.h(sb2Var) | p65Var2.f(v7cVarF) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
            Object objM2 = p65Var2.M();
            if (zH || objM2 == uobVar) {
                objM2 = new ks0(sb2Var, v7cVarF, js0Var);
                p65Var2.j0(objM2);
            }
            mz1 mz1VarE = pxf.E(1362864467, new fd3(ms0Var, sb2Var, v7cVarF, js0Var, 22), p65Var2);
            p65Var = p65Var2;
            o28 o28Var = o28.b;
            qq7.a((m45) objM2, o28Var, v7cVarF, mz1VarE, p65Var, 3120, 0);
            r28Var2 = o28Var;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new af0(i2, 1, ms0Var, js0Var, r28Var2);
        }
    }

    public static final void d(m45 m45Var, r28 r28Var, boolean z, m3c m3cVar, fy2 fy2Var, mz1 mz1Var, x12 x12Var, int i2) {
        p65 p65Var;
        r28 r28Var2;
        boolean z2;
        m3c m3cVar2;
        int i3;
        r28 r28Var3;
        m3c m3cVar3;
        boolean z3;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1232125330);
        int i4 = i2 | (p65Var2.h(m45Var) ? 4 : 2) | 208304 | (p65Var2.f(fy2Var) ? 1048576 : 524288) | 12582912;
        int i5 = 0;
        if (p65Var2.P(i4 & 1, (38347923 & i4) != 38347922)) {
            p65Var2.U();
            if ((i2 & 1) == 0 || p65Var2.z()) {
                amb ambVar = ((x4c) p65Var2.j(a5c.a)).a;
                b89 b89Var = new b89(50.0f);
                amb ambVar2 = new amb(b89Var, b89Var, b89Var, b89Var);
                i3 = i4 & (-57345);
                r28Var3 = o28.b;
                m3cVar3 = ambVar2;
                z3 = true;
            } else {
                p65Var2.S();
                i3 = i4 & (-57345);
                r28Var3 = r28Var;
                z3 = z;
                m3cVar3 = m3cVar;
            }
            p65Var2.q();
            p65Var2.Y(483145880);
            l78 l78VarY = qo7.y(new uu1(z3 ? fy2Var.b : fy2Var.e), p65Var2);
            p65Var2.p(false);
            Object objM = p65Var2.M();
            if (objM == w12.a) {
                objM = new ql1(i5);
                p65Var2.j0(objM);
            }
            r28 r28VarA = wxb.a(r28Var3, false, (x45) objM);
            p65Var2.Y(-1593588247);
            l78 l78VarY2 = qo7.y(new uu1(z3 ? fy2Var.a : fy2Var.d), p65Var2);
            p65Var2.p(false);
            p65Var = p65Var2;
            br7.j(m45Var, r28VarA, z3, m3cVar3, ((uu1) l78VarY2.getValue()).a, uu1.b(1.0f, ((uu1) l78VarY.getValue()).a), null, 0.0f, null, pxf.E(-1849195083, new ov0(l78VarY, fy2Var, z3, mz1Var), p65Var2), p65Var, (i3 & 14) | 907542912, 128);
            r28Var2 = r28Var3;
            z2 = z3;
            m3cVar2 = m3cVar3;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
            z2 = z;
            m3cVar2 = m3cVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ke0(m45Var, r28Var2, z2, m3cVar2, fy2Var, mz1Var, i2, 2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:116:0x019d  */
    /* JADX WARN: Removed duplicated region for block: B:119:0x01ad  */
    /* JADX WARN: Removed duplicated region for block: B:121:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:33:0x0058  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x005d  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0073  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0078  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0090  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x0094  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x00ab  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x00b0  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x00d1  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x00d3  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x00dc  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void e(final defpackage.c09 r18, final java.lang.String r19, defpackage.r28 r20, defpackage.xd r21, defpackage.w82 r22, float r23, defpackage.bs0 r24, defpackage.x12 r25, final int r26, final int r27) {
        /*
            Method dump skipped, instruction units count: 443
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.w2g.e(c09, java.lang.String, r28, xd, w82, float, bs0, x12, int, int):void");
    }

    public static final void f(wp wpVar, r28 r28Var, x12 x12Var, int i2) {
        if ((i2 & 4) != 0) {
            r28Var = o28.b;
        }
        r28 r28Var2 = r28Var;
        ar0 ar0Var = z46.h;
        p65 p65Var = (p65) x12Var;
        boolean zF = p65Var.f(wpVar);
        Object objM = p65Var.M();
        if (zF || objM == w12.a) {
            objM = wgf.a(wpVar, 1);
            p65Var.j0(objM);
        }
        e((zr0) objM, null, r28Var2, ar0Var, v82.b, 1.0f, null, p65Var, 56, 0);
    }

    public static jy8 g(int i2, float f2) {
        if ((i2 & 1) != 0) {
            f2 = 0.0f;
        }
        float f3 = (i2 & 2) == 0 ? 24.0f : 0.0f;
        return new jy8(f2, f3, f2, f3);
    }

    public static jy8 h(float f2, float f3, float f4, float f5, int i2) {
        if ((i2 & 1) != 0) {
            f2 = 0.0f;
        }
        if ((i2 & 2) != 0) {
            f3 = 0.0f;
        }
        if ((i2 & 4) != 0) {
            f4 = 0.0f;
        }
        if ((i2 & 8) != 0) {
            f5 = 0.0f;
        }
        return new jy8(f2, f3, f4, f5);
    }

    public static final r28 i(r28 r28Var, float f2) {
        return f2 == 1.0f ? r28Var : xz5.Y(r28Var, 0.0f, 0.0f, f2, null, 520187);
    }

    public static int j(u11 u11Var, boolean z) {
        int i2 = u11Var.b;
        int i3 = u11Var.c;
        int i4 = z ? i3 : i2;
        if (!z) {
            i2 = i3;
        }
        byte[][] bArr = (byte[][]) u11Var.d;
        int i5 = 0;
        for (int i6 = 0; i6 < i4; i6++) {
            byte b2 = -1;
            int i7 = 0;
            for (int i8 = 0; i8 < i2; i8++) {
                byte b3 = z ? bArr[i6][i8] : bArr[i8][i6];
                if (b3 == b2) {
                    i7++;
                } else {
                    if (i7 >= 5) {
                        i5 += i7 - 2;
                    }
                    i7 = 1;
                    b2 = b3;
                }
            }
            if (i7 >= 5) {
                i5 = (i7 - 2) + i5;
            }
        }
        return i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x005c A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0068  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:19:0x005a -> B:21:0x005d). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object k(defpackage.u4d r8, defpackage.mb9 r9, defpackage.kn0 r10) {
        /*
            boolean r0 = r10 instanceof defpackage.h05
            if (r0 == 0) goto L13
            r0 = r10
            h05 r0 = (defpackage.h05) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            h05 r0 = new h05
            r0.<init>(r10)
        L18:
            java.lang.Object r10 = r0.d
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L36
            if (r2 != r4) goto L2f
            mb9 r8 = r0.c
            u4d r9 = r0.b
            defpackage.br7.v(r10)
            r7 = r9
            r9 = r8
            r8 = r7
            goto L5d
        L2f:
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r8)
            r8 = 0
            return r8
        L36:
            defpackage.br7.v(r10)
            w4d r10 = r8.e
            lb9 r10 = r10.s
            java.util.List r10 = r10.a
            int r2 = r10.size()
            r5 = r3
        L44:
            if (r5 >= r2) goto L79
            java.lang.Object r6 = r10.get(r5)
            rb9 r6 = (defpackage.rb9) r6
            boolean r6 = r6.d
            if (r6 == 0) goto L76
        L50:
            r0.b = r8
            r0.c = r9
            r0.e = r4
            java.lang.Object r10 = r8.a(r9, r0)
            if (r10 != r1) goto L5d
            return r1
        L5d:
            lb9 r10 = (defpackage.lb9) r10
            java.util.List r10 = r10.a
            int r2 = r10.size()
            r5 = r3
        L66:
            if (r5 >= r2) goto L79
            java.lang.Object r6 = r10.get(r5)
            rb9 r6 = (defpackage.rb9) r6
            boolean r6 = r6.d
            if (r6 == 0) goto L73
            goto L50
        L73:
            int r5 = r5 + 1
            goto L66
        L76:
            int r5 = r5 + 1
            goto L44
        L79:
            c1e r8 = defpackage.c1e.a
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.w2g.k(u4d, mb9, kn0):java.lang.Object");
    }

    public static final Object l(vb9 vb9Var, b55 b55Var, n92 n92Var) {
        Object objI0 = ((w4d) vb9Var).I0(new i05(n92Var.getContext(), b55Var, null, 0), n92Var);
        return objI0 == tb2.COROUTINE_SUSPENDED ? objI0 : c1e.a;
    }

    public static bo4 m(bo4 bo4Var, int i2) {
        nz0 nz0Var = nz0.SUSPEND;
        if (i2 < 0 && i2 != -2 && i2 != -1) {
            ywb.g(b09.w(i2, "Buffer size should be non-negative, BUFFERED, or CONFLATED, but was "));
            return null;
        }
        if (i2 == -1) {
            nz0Var = nz0.DROP_OLDEST;
            i2 = 0;
        }
        int i3 = i2;
        nz0 nz0Var2 = nz0Var;
        return bo4Var instanceof f65 ? km4.n((f65) bo4Var, null, i3, nz0Var2, 1) : new ek1(bo4Var, null, i3, nz0Var2, 2);
    }

    public static final float n(hy8 hy8Var, ip6 ip6Var) {
        return ip6Var == ip6.Ltr ? hy8Var.c(ip6Var) : hy8Var.b(ip6Var);
    }

    public static final float o(hy8 hy8Var, ip6 ip6Var) {
        return ip6Var == ip6.Ltr ? hy8Var.b(ip6Var) : hy8Var.c(ip6Var);
    }

    public static bf2 p(String str, Bundle bundle) {
        str.getClass();
        bundle.getClass();
        try {
            int iHashCode = str.hashCode();
            if (iHashCode != -1678407252) {
                if (iHashCode != -543568185) {
                    if (iHashCode == -95037569 && str.equals("androidx.credentials.TYPE_PUBLIC_KEY_CREDENTIAL")) {
                        try {
                            String string = bundle.getString("androidx.credentials.BUNDLE_KEY_REGISTRATION_RESPONSE_JSON");
                            string.getClass();
                            return new gg2(string, bundle);
                        } catch (Exception unused) {
                            throw new FrameworkClassParsingException();
                        }
                    }
                } else if (str.equals("android.credentials.TYPE_PASSWORD_CREDENTIAL")) {
                    return new cf2(bundle);
                }
            } else if (str.equals("androidx.credentials.TYPE_DIGITAL_CREDENTIAL")) {
                try {
                    String string2 = bundle.getString("androidx.credentials.BUNDLE_KEY_RESPONSE_JSON");
                    string2.getClass();
                    new Bundle().putString("androidx.credentials.BUNDLE_KEY_RESPONSE_JSON", string2);
                    cf2 cf2Var = new cf2();
                    if (string2.length() != 0) {
                        try {
                            new JSONObject(string2);
                            return cf2Var;
                        } catch (Exception unused2) {
                        }
                    }
                    throw new IllegalArgumentException("responseJson must not be empty, and must be a valid JSON");
                } catch (Exception unused3) {
                    throw new FrameworkClassParsingException();
                }
            }
            throw new FrameworkClassParsingException();
        } catch (FrameworkClassParsingException unused4) {
            cf2 cf2Var2 = new cf2();
            if (str.length() > 0) {
                return cf2Var2;
            }
            ay0.e("type should not be empty");
            return null;
        }
    }

    public static void q(Canvas canvas, boolean z) {
        Method method;
        int i2 = Build.VERSION.SDK_INT;
        if (i2 >= 29) {
            nm.k(canvas, z);
            return;
        }
        if (!x) {
            try {
                if (i2 == 28) {
                    Method declaredMethod = Class.class.getDeclaredMethod("getDeclaredMethod", String.class, new Class[0].getClass());
                    v = (Method) declaredMethod.invoke(Canvas.class, "insertReorderBarrier", new Class[0]);
                    w = (Method) declaredMethod.invoke(Canvas.class, "insertInorderBarrier", new Class[0]);
                } else {
                    v = Canvas.class.getDeclaredMethod("insertReorderBarrier", null);
                    w = Canvas.class.getDeclaredMethod("insertInorderBarrier", null);
                }
                Method method2 = v;
                if (method2 != null) {
                    method2.setAccessible(true);
                }
                Method method3 = w;
                if (method3 != null) {
                    method3.setAccessible(true);
                }
            } catch (IllegalAccessException | NoSuchMethodException | InvocationTargetException unused) {
            }
            x = true;
        }
        if (z) {
            try {
                Method method4 = v;
                if (method4 != null) {
                    method4.invoke(canvas, null);
                }
            } catch (IllegalAccessException | InvocationTargetException unused2) {
                return;
            }
        }
        if (z || (method = w) == null) {
            return;
        }
        method.invoke(canvas, null);
    }

    public static final bo4 r(bo4 bo4Var, ib2 ib2Var) {
        if (ib2Var.o0(cd7.g) == null) {
            return ib2Var.equals(zx3.a) ? bo4Var : bo4Var instanceof f65 ? km4.n((f65) bo4Var, ib2Var, 0, null, 6) : new ek1(bo4Var, ib2Var, 0, null, 12);
        }
        lg8.t("Flow context cannot contain job in it. Had ", ib2Var);
        return null;
    }

    public static final int s(x12 x12Var) {
        p65 p65Var = (p65) x12Var;
        p65Var.getClass();
        long j2 = p65Var.T;
        return (int) (j2 ^ (j2 >>> 32));
    }

    public static final mwa t(x12 x12Var) {
        mwa mwaVarY = ((p65) x12Var).y();
        if (mwaVarY != null) {
            mwaVarY.b |= 1;
            return mwaVarY;
        }
        ygf.f("no recompose scope found");
        return null;
    }

    public static final int u(Layout layout, int i2, boolean z) {
        if (i2 <= 0) {
            return 0;
        }
        if (i2 >= layout.getText().length()) {
            return layout.getLineCount() - 1;
        }
        int lineForOffset = layout.getLineForOffset(i2);
        int lineStart = layout.getLineStart(lineForOffset);
        int lineEnd = layout.getLineEnd(lineForOffset);
        if (lineStart == i2 || lineEnd == i2) {
            if (lineStart == i2) {
                if (z) {
                    return lineForOffset - 1;
                }
            } else if (!z) {
                return lineForOffset + 1;
            }
        }
        return lineForOffset;
    }

    public static final Object v(b78 b78Var, ny9 ny9Var, Serializable serializable) {
        b78Var.getClass();
        ny9Var.getClass();
        Object objCopyOf = b78Var.a.get(ny9Var);
        if (objCopyOf instanceof byte[]) {
            byte[] bArr = (byte[]) objCopyOf;
            objCopyOf = Arrays.copyOf(bArr, bArr.length);
        }
        return objCopyOf == null ? serializable : objCopyOf;
    }

    public static final List w(fb9 fb9Var) {
        RichTextModel richTextModel = fb9Var.e;
        if (richTextModel == null) {
            RichTextModel richTextModel2 = new RichTextModel(null, null, null, 7, null);
            fb9Var.e = richTextModel2;
            richTextModel = richTextModel2;
        }
        return richTextModel.paragraphs;
    }

    public static final List x(fb9 fb9Var) {
        RichTextModel richTextModel = fb9Var.e;
        if (richTextModel == null) {
            RichTextModel richTextModel2 = new RichTextModel(null, null, null, 7, null);
            fb9Var.e = richTextModel2;
            richTextModel = richTextModel2;
        }
        return richTextModel.sections;
    }

    public static final mx y(int i2, int i3, int i4, x12 x12Var, String str, List list) {
        String str2;
        int i5 = i2;
        str.getClass();
        list.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.Y(-193244005);
        String strR = vo7.R(p65Var, R.string.ellipsis);
        if (i4 <= 0) {
            strR = null;
        }
        String str3 = "";
        if (strR == null) {
            strR = "";
        }
        int length = strR.length();
        if (muc.b0(str)) {
            mx mxVar = new mx(str3);
            p65Var.p(false);
            return mxVar;
        }
        if (i5 > i3) {
            mx mxVar2 = new mx(muc.x0(i4, str).concat(strR));
            p65Var.p(false);
            return mxVar2;
        }
        if (i5 >= str.length()) {
            mx mxVar3 = new mx(muc.x0(i4, str).concat(strR));
            p65Var.p(false);
            return mxVar3;
        }
        int iMin = Math.min(i3, str.length());
        ArrayList<Markup> arrayList = new ArrayList();
        for (Object obj : list) {
            Markup markup = (Markup) obj;
            if (markup.getStart() <= markup.getEnd()) {
                arrayList.add(obj);
            }
        }
        int i6 = 1;
        if (str.length() - i3 > i4 + length) {
            String string = muc.k0(str, new n46(i3 + i4, str.length() - 1, 1)).toString();
            ArrayList<Markup> arrayList2 = new ArrayList();
            for (Object obj2 : arrayList) {
                if (((Markup) obj2).getStart() <= string.length()) {
                    arrayList2.add(obj2);
                }
            }
            arrayList = new ArrayList(cu1.k0(arrayList2, 10));
            for (Markup markupCopy$default : arrayList2) {
                if (markupCopy$default.getEnd() > string.length()) {
                    markupCopy$default = Markup.copy$default(markupCopy$default, null, 0, string.length(), null, null, null, 59, null);
                }
                arrayList.add(markupCopy$default);
            }
            str2 = ((Object) string) + strR;
        } else {
            str2 = str;
        }
        if (i5 > i4) {
            n46 n46Var = new n46(0, (i5 - i4) - 1, 1);
            int iQ0 = bu1.q0(n46Var);
            String string2 = muc.k0(str2, n46Var).toString();
            int i7 = iQ0 - length;
            ArrayList arrayList3 = new ArrayList(cu1.k0(arrayList, 10));
            for (Markup markup2 : arrayList) {
                int iMax = Math.max(0, markup2.getStart() - i7);
                arrayList3.add(Markup.copy$default(markup2, null, iMax, Math.max(iMax, markup2.getEnd() - i7), null, null, null, 57, null));
            }
            str2 = strR + ((Object) string2);
            i5 -= i7;
            iMin -= i7;
            arrayList = arrayList3;
        }
        ArrayList<Markup> arrayList4 = new ArrayList();
        for (Object obj3 : arrayList) {
            Markup markup3 = (Markup) obj3;
            if (markup3.getStart() < markup3.getEnd()) {
                arrayList4.add(obj3);
            }
        }
        kx kxVar = new kx();
        kxVar.d(str2);
        p65Var.Y(-1023802312);
        for (Markup markup4 : arrayList4) {
            int start = markup4.getStart();
            if (start < 0) {
                start = 0;
            }
            int end = markup4.getEnd();
            int length2 = str2.length();
            if (end > length2) {
                end = length2;
            }
            if (start < end) {
                MarkupType type = markup4.getType();
                int i8 = wj5.b[type.ordinal()];
                if (i8 == 1) {
                    p65Var.Y(898557358);
                    p65Var.p(false);
                    kxVar.b(new skc(0L, 0L, d05.h, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65531), start, end);
                } else if (i8 == 2) {
                    p65Var.Y(898874798);
                    p65Var.p(false);
                    kxVar.b(new skc(0L, 0L, (d05) null, new zz4(i6), (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65527), start, end);
                } else if (i8 != 3) {
                    p65Var.Y(-1217886535);
                    p65Var.p(false);
                    wld.a.m("Markup type not handle: " + type, new Object[0]);
                } else {
                    p65Var.Y(899234460);
                    AnchorType anchorType = markup4.getAnchorType();
                    int i9 = anchorType == null ? -1 : wj5.a[anchorType.ordinal()];
                    if (i9 == 1) {
                        p65Var.Y(899301761);
                        p65Var.p(false);
                        kxVar.b(new skc(0L, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, ohd.c, (i3c) null, 61439), start, end);
                    } else if (i9 != 2) {
                        p65Var.Y(-1217890362);
                        p65Var.p(false);
                        wld.a.m("Markup anchor type not handle: " + anchorType, new Object[0]);
                    } else {
                        p65Var.Y(899705784);
                        kxVar.b(new skc(((zo7) p65Var.j(kt7.b)).r, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), start, end);
                        p65Var.p(false);
                    }
                    p65Var.p(false);
                }
            }
        }
        p65Var.p(false);
        if (iMin > i5) {
            p65Var.Y(1822277936);
            kxVar.b(new skc(0L, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, ((zo7) p65Var.j(kt7.b)).j, (ohd) null, (i3c) null, 63487), i5, iMin);
        } else {
            p65Var.Y(1816066962);
        }
        p65Var.p(false);
        mx mxVarI = kxVar.i();
        p65Var.p(false);
        return mxVarI;
    }

    public static final void z(p65 p65Var, b55 b55Var) {
        b55Var.getClass();
        pwd.B(2, b55Var);
        b55Var.invoke(p65Var, 1);
    }
}
