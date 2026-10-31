package ads_mobile_sdk;

import android.content.Context;
import android.content.SharedPreferences;
import b.c0;
import java.util.UUID;

/* loaded from: classes2.dex */
public abstract class la2 {

    /* renamed from: a, reason: collision with root package name */
    public final String f6137a;

    /* renamed from: c, reason: collision with root package name */
    public final String f6138c;

    /* renamed from: e, reason: collision with root package name */
    public final String f6139e;

    /* renamed from: f, reason: collision with root package name */
    public final x7.c f6140f;

    /* renamed from: g, reason: collision with root package name */
    public final yy0 f6141g;

    static {
        new UUID(0L, 0L).toString();
    }

    public la2(Context context, String str, String str2, String str3) {
        if (x7.c.f95125c == null) {
            x7.c.f95125c = new x7.c(context);
        }
        this.f6140f = x7.c.f95125c;
        this.f6141g = yy0.a(context);
        this.f6137a = str;
        str.concat("_3p");
        this.f6138c = str2;
        str2.concat("_3p");
        this.f6139e = str3;
    }

    public final wy0 a(String str) {
        long jCurrentTimeMillis = System.currentTimeMillis();
        if (jCurrentTimeMillis < 0) {
            throw new IllegalStateException(c0.q(new StringBuilder(), this.f6139e, ": Invalid negative current timestamp. Updating PAID failed"));
        }
        String str2 = this.f6138c;
        Long lValueOf = Long.valueOf(jCurrentTimeMillis);
        x7.c cVar = this.f6140f;
        cVar.a(lValueOf, str2);
        cVar.a(str, this.f6137a);
        return new wy0(jCurrentTimeMillis, str);
    }

    public final wy0 a(long j11) {
        long jCurrentTimeMillis = System.currentTimeMillis();
        if (jCurrentTimeMillis >= 0) {
            x7.c cVar = this.f6140f;
            SharedPreferences sharedPreferences = (SharedPreferences) cVar.f95127b;
            SharedPreferences sharedPreferences2 = (SharedPreferences) cVar.f95127b;
            String str = this.f6138c;
            long j12 = sharedPreferences.getLong(str, -1L);
            if (j12 != -1) {
                if (jCurrentTimeMillis < j12) {
                    cVar.a(Long.valueOf(jCurrentTimeMillis), str);
                } else if (jCurrentTimeMillis >= j12 + j11) {
                    return a(UUID.randomUUID().toString());
                }
            }
            String string = sharedPreferences2.getString(this.f6137a, null);
            if (string == null) {
                return a(UUID.randomUUID().toString());
            }
            return new wy0(sharedPreferences2.getLong(str, -1L), string);
        }
        throw new IllegalStateException(c0.q(new StringBuilder(), this.f6139e, ": Invalid negative current timestamp. Updating PAID failed"));
    }
}
