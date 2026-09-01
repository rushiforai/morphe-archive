package defpackage;

import j$.util.DesugarTimeZone;
import java.text.SimpleDateFormat;
import java.util.Locale;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ev2 {
    public static final Set d = k80.S0(new String[]{"env", "version", "variant", "service"});
    public final String a;
    public final f66 b;
    public final SimpleDateFormat c;

    public ev2(String str, f66 f66Var) {
        f66Var.getClass();
        this.a = str;
        this.b = f66Var;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.US);
        simpleDateFormat.setTimeZone(DesugarTimeZone.getTimeZone("UTC"));
        this.c = simpleDateFormat;
    }
}
