package nb;

import android.content.Context;
import android.text.TextUtils;
import com.bytedance.sdk.component.zb.ycx.ea;
import com.bytedance.sdk.openadsdk.oty.sya;
import com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h;
import java.io.File;
import java.util.concurrent.TimeUnit;

/* loaded from: classes2.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static Context f78093a;

    /* renamed from: b, reason: collision with root package name */
    public static String f78094b;

    /* renamed from: c, reason: collision with root package name */
    public static ea f78095c;

    public static ea a() {
        if (f78095c == null) {
            ea.ycx ycxVar = new ea.ycx("v_config");
            TimeUnit timeUnit = TimeUnit.MILLISECONDS;
            f78095c = ycxVar.ycx(h.f42227c, timeUnit).zb(h.f42227c, timeUnit).sya(h.f42227c, timeUnit).ycx();
        }
        return f78095c;
    }

    public static String b() {
        if (TextUtils.isEmpty(f78094b)) {
            try {
                File file = new File(f78093a.getFilesDir(), "ttad_dir");
                if (!file.exists()) {
                    file.mkdirs();
                }
                f78094b = file.getAbsolutePath();
            } catch (Throwable th2) {
                sya.ycx(th2, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOUE7U=", "becpkAyfZsmGQ9A=", "XOs5owq4bMikT9FcmR20HlLqKJontXs=", 40);
            }
        }
        return f78094b;
    }
}
