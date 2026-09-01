package defpackage;

import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import com.google.android.recaptcha.internal.zzfx;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zzf extends p4d implements b55 {
    public final /* synthetic */ int b;
    public final /* synthetic */ Object c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ zzf(Object obj, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.c = obj;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.c;
        switch (i) {
            case 0:
                return new zzf((b0g) obj2, n92Var, 0);
            case 1:
                return new zzf((m0g) obj2, n92Var, 1);
            case 2:
                return new zzf((m0g) obj2, n92Var, 2);
            default:
                return new zzf((jrf) obj2, n92Var, 3);
        }
    }

    @Override // defpackage.b55
    public final /* bridge */ /* synthetic */ Object invoke(Object obj, Object obj2) throws zzfx {
        int i = this.b;
        c1e c1eVar = c1e.a;
        fdg fdgVar = (fdg) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
            case 0:
                return ((zzf) create(fdgVar, n92Var)).invokeSuspend(c1eVar);
            case 1:
                return ((zzf) create(fdgVar, n92Var)).invokeSuspend(c1eVar);
            case 2:
                return ((zzf) create(fdgVar, n92Var)).invokeSuspend(c1eVar);
            default:
                ((zzf) create(fdgVar, n92Var)).invokeSuspend(c1eVar);
                return c1eVar;
        }
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) throws zzfx {
        int i = this.b;
        Object obj2 = this.c;
        switch (i) {
            case 0:
                d87 d87Var = d87.T0;
                br7.v(obj);
                b0g b0gVar = (b0g) obj2;
                Cursor cursorQuery = b0gVar.a.query(Uri.parse("content://com.google.android.gsf.gservices"), null, null, new String[]{"android_id"}, null);
                String strValueOf = "";
                if (cursorQuery != null && cursorQuery.moveToFirst() && cursorQuery.getColumnCount() >= 2) {
                    try {
                        strValueOf = String.valueOf(Long.parseLong(cursorQuery.getString(1)));
                        break;
                    } catch (Exception unused) {
                    }
                    cursorQuery.close();
                }
                if (strValueOf.length() == 0) {
                    if (Build.VERSION.SDK_INT > 34) {
                        throw new zzfx(d87Var, d87.Q, (String) null, 12);
                    }
                    throw new zzfx(d87Var, d87.R, (String) null, 12);
                }
                etf etfVarW = ktf.w();
                gtf gtfVarV = itf.v();
                gtfVarV.h(strValueOf);
                etfVarW.h(d46.Q(gtfVarV.e()));
                return en7.Z(b0gVar, (ktf) etfVarW.e());
            case 1:
                br7.v(obj);
                etf etfVarW2 = ktf.w();
                itf itfVarG = m0g.g(Build.MANUFACTURER);
                itf itfVarG2 = m0g.g(Build.MODEL);
                itf itfVarG3 = m0g.g(Build.DEVICE);
                itf itfVarG4 = m0g.g(Build.HARDWARE);
                itf itfVarG5 = m0g.g(Build.FINGERPRINT);
                itf itfVarG6 = m0g.g(Build.PRODUCT);
                itf itfVarG7 = m0g.g(Build.BOARD);
                itf itfVarG8 = m0g.g(Build.BRAND);
                itf itfVarG9 = m0g.g(k80.D0(Build.SUPPORTED_ABIS, ",", "[", "]", null, 56));
                long j = Build.TIME;
                gtf gtfVarV2 = itf.v();
                gtfVarV2.c();
                ((itf) gtfVarV2.b).x();
                etfVarW2.h(d46.R(itfVarG, itfVarG2, itfVarG3, itfVarG4, itfVarG5, itfVarG6, itfVarG7, itfVarG8, itfVarG9, (itf) gtfVarV2.e(), m0g.g(Build.ID), m0g.g(Build.BOOTLOADER), m0g.g(Build.DISPLAY), m0g.g(Build.TYPE), m0g.g(Build.TAGS)));
                return en7.Z((m0g) obj2, (ktf) etfVarW2.e());
            case 2:
                br7.v(obj);
                int i2 = Build.VERSION.SDK_INT;
                etf etfVarW3 = ktf.w();
                gtf gtfVarV3 = itf.v();
                gtfVarV3.h(String.valueOf(i2));
                etfVarW3.h(d46.Q(gtfVarV3.e()));
                return en7.Z((m0g) obj2, (ktf) etfVarW3.e());
            default:
                br7.v(obj);
                zzfx zzfxVar = new zzfx(d87.T0, d87.x0, (String) null, 12);
                jrf jrfVar = (jrf) obj2;
                if (!jrfVar.B() || jrfVar.C().v().m() == 0) {
                    throw zzfxVar;
                }
                return c1e.a;
        }
    }
}
