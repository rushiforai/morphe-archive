package defpackage;

import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.google.android.recaptcha.internal.zzfx;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xbg {
    public final fdg a;
    public final Integer b;
    public final long c;
    public final int d;

    public xbg(fdg fdgVar, int i, Integer num) {
        this.a = fdgVar;
        this.d = i;
        this.b = num;
        long jCurrentTimeMillis = System.currentTimeMillis();
        dpf dpfVarB = opf.b((int) ((jCurrentTimeMillis % 1000) * 1000000), jCurrentTimeMillis / 1000);
        opf.a(dpfVarB);
        long jV = dpfVarB.v();
        int iW = dpfVarB.w();
        ((SimpleDateFormat) opf.a.get()).format(new Date(jV * 1000));
        if (iW != 0) {
            if (iW % 1000000 == 0) {
                String.format(Locale.ENGLISH, "%1$03d", Integer.valueOf(iW / 1000000));
            } else if (iW % PhotoshopDirectory.TAG_CHANNELS_ROWS_COLUMNS_DEPTH_MODE == 0) {
                String.format(Locale.ENGLISH, "%1$06d", Integer.valueOf(iW / PhotoshopDirectory.TAG_CHANNELS_ROWS_COLUMNS_DEPTH_MODE));
            } else {
                String.format(Locale.ENGLISH, "%1$09d", Integer.valueOf(iW));
            }
        }
        this.c = System.currentTimeMillis();
    }

    public final void a(zzfx zzfxVar) {
        cqf cqfVarV = dqf.v();
        String strValueOf = String.valueOf(zzfxVar.a.b);
        cqfVarV.c();
        ((dqf) cqfVarV.b).w(strValueOf);
        int i = zzfxVar.b.b;
        cqfVarV.c();
        ((dqf) cqfVarV.b).x(i);
        int errorCode = zzfxVar.a().a.getErrorCode();
        cqfVarV.c();
        ((dqf) cqfVarV.b).z(errorCode);
        String str = zzfxVar.c;
        if (str != null) {
            cqfVarV.c();
            ((dqf) cqfVarV.b).y(str);
        }
        this.a.b(b(4), (dqf) cqfVarV.e());
    }

    public final jqf b(int i) {
        jqf jqfVarZ = kqf.z();
        jqfVarZ.c();
        ((kqf) jqfVarZ.b).L(this.d);
        String str = kbg.d;
        jqfVarZ.c();
        ((kqf) jqfVarZ.b).B(str);
        fdg fdgVar = this.a;
        String str2 = fdgVar.d;
        jqfVarZ.c();
        ((kqf) jqfVarZ.b).D(str2);
        adg adgVar = fdgVar.c;
        String str3 = adgVar.d;
        jqfVarZ.c();
        ((kqf) jqfVarZ.b).C(str3);
        int i2 = adgVar.e;
        jqfVarZ.c();
        ((kqf) jqfVarZ.b).M(i2);
        jqfVarZ.c();
        ((kqf) jqfVarZ.b).w(i);
        long j = this.c;
        dpf dpfVarB = opf.b((int) ((j % 1000) * 1000000), j / 1000);
        jqfVarZ.c();
        ((kqf) jqfVarZ.b).H(dpfVarB);
        long jCurrentTimeMillis = System.currentTimeMillis() - j;
        zmf zmfVarC = npf.c((int) ((jCurrentTimeMillis % 1000) * 1000000), jCurrentTimeMillis / 1000);
        jqfVarZ.c();
        ((kqf) jqfVarZ.b).E(zmfVarC);
        Integer num = this.b;
        if (num != null) {
            int iIntValue = num.intValue();
            jqfVarZ.c();
            ((kqf) jqfVarZ.b).J(iIntValue);
        }
        return jqfVarZ;
    }
}
