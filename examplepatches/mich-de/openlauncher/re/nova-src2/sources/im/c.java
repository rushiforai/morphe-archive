package im;

import gm.g;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;

/* loaded from: classes.dex */
public final class c implements gm.f {

    /* renamed from: a, reason: collision with root package name */
    public static final SimpleDateFormat f61640a;

    static {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.US);
        f61640a = simpleDateFormat;
        simpleDateFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
    }

    @Override // gm.b
    public final void encode(Object obj, Object obj2) {
        ((g) obj2).a(f61640a.format((Date) obj));
    }
}
