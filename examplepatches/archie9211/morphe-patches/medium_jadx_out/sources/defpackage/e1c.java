package defpackage;

import java.util.Locale;
import java.util.UUID;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e1c {
    public final bmd a;
    public final upe b;

    public e1c(bmd bmdVar, upe upeVar) {
        bmdVar.getClass();
        upeVar.getClass();
        this.a = bmdVar;
        this.b = upeVar;
    }

    public final y0c a(y0c y0cVar) {
        String str;
        this.b.getClass();
        UUID uuidRandomUUID = UUID.randomUUID();
        uuidRandomUUID.getClass();
        String string = uuidRandomUUID.toString();
        string.getClass();
        String lowerCase = tuc.L(string, "-", "").toLowerCase(Locale.ROOT);
        lowerCase.getClass();
        String str2 = (y0cVar == null || (str = y0cVar.b) == null) ? lowerCase : str;
        int i = y0cVar != null ? y0cVar.c + 1 : 0;
        this.a.getClass();
        return new y0c(lowerCase, str2, i, bmd.a().b);
    }
}
