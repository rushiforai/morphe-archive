package om;

import android.text.TextUtils;
import java.util.concurrent.TimeUnit;
import java.util.regex.Pattern;

/* loaded from: classes.dex */
public final class j {

    /* renamed from: b, reason: collision with root package name */
    public static final long f80527b = TimeUnit.HOURS.toSeconds(1);

    /* renamed from: c, reason: collision with root package name */
    public static final Pattern f80528c = Pattern.compile("\\AA[\\w-]{38}\\z");

    /* renamed from: d, reason: collision with root package name */
    public static j f80529d;

    /* renamed from: a, reason: collision with root package name */
    public final o7.a f80530a;

    public j(o7.a aVar) {
        this.f80530a = aVar;
    }

    public final boolean a(pm.b bVar) {
        if (TextUtils.isEmpty(bVar.f82667c)) {
            return true;
        }
        long j11 = bVar.f82670f + bVar.f82669e;
        TimeUnit timeUnit = TimeUnit.MILLISECONDS;
        this.f80530a.getClass();
        return j11 < timeUnit.toSeconds(System.currentTimeMillis()) + f80527b;
    }
}
