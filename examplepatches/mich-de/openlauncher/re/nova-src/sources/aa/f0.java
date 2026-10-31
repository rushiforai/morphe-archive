package aa;

import android.content.ComponentName;
import android.content.Context;
import android.content.res.Resources;
import android.text.TextUtils;
import java.util.Calendar;
import java.util.Collections;
import java.util.Map;

/* loaded from: classes.dex */
public abstract class f0 {

    /* renamed from: e, reason: collision with root package name */
    public static final int f577e = Resources.getSystem().getIdentifier("config_icon_mask", "string", "android");

    /* renamed from: f, reason: collision with root package name */
    public static final Map f578f = Collections.EMPTY_MAP;

    /* renamed from: a, reason: collision with root package name */
    public Map f579a;

    /* renamed from: b, reason: collision with root package name */
    public final Context f580b;

    /* renamed from: c, reason: collision with root package name */
    public final ComponentName f581c;

    /* renamed from: d, reason: collision with root package name */
    public final ComponentName f582d;

    public f0(Context context) {
        this.f580b = context;
        String string = context.getString(2132017593);
        this.f581c = TextUtils.isEmpty(string) ? null : ComponentName.unflattenFromString(string);
        String string2 = context.getString(2132017625);
        this.f582d = TextUtils.isEmpty(string2) ? null : ComponentName.unflattenFromString(string2);
        this.f579a = f578f;
    }

    public static int a() {
        return Calendar.getInstance().get(5) - 1;
    }

    public abstract String b();
}
