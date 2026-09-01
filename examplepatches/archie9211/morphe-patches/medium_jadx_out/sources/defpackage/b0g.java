package defpackage;

import android.content.ContentResolver;
import android.os.Build;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class b0g implements m1g {
    public final ContentResolver a;

    public b0g(ContentResolver contentResolver) {
        this.a = contentResolver;
    }

    @Override // defpackage.m1g
    public final ycg a(arf arfVar) {
        return new ycg(new zzf(this, null, 0));
    }

    @Override // defpackage.m1g
    public final /* synthetic */ ycg b(String str, arf arfVar, yu yuVar) {
        return wgd.g(this, str, arfVar);
    }

    @Override // defpackage.m1g
    public final /* synthetic */ ycg c(orf orfVar, j5d j5dVar) {
        return wgd.h();
    }

    @Override // defpackage.m1g
    public final /* synthetic */ wcg d(orf orfVar, yu yuVar) {
        return wgd.f(this, orfVar);
    }

    @Override // defpackage.m1g
    public final boolean e() {
        return true;
    }

    @Override // defpackage.m1g
    public final b1g f(Exception exc, i1g i1gVar) {
        int i = Build.VERSION.SDK_INT;
        btf btfVarV = ctf.v();
        btfVarV.c();
        ((ctf) btfVarV.b).x(16);
        int i2 = i > 34 ? 59 : 58;
        btfVarV.c();
        ((ctf) btfVarV.b).y(i2);
        return en7.b0(this, (ctf) btfVarV.e());
    }

    @Override // defpackage.m1g
    public final int zza() {
        return 17;
    }
}
