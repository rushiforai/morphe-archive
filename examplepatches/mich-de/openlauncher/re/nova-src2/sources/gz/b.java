package gz;

import android.content.ComponentName;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import fz.h0;
import java.util.List;
import kotlin.collections.EmptyList;
import z.c1;

/* loaded from: classes4.dex */
public abstract class b implements f {

    /* renamed from: a, reason: collision with root package name */
    public final c1 f58641a = new c1(0);

    @Override // gz.f
    public final boolean a() {
        return false;
    }

    @Override // gz.f
    public final boolean b() {
        return false;
    }

    @Override // gz.f
    public final Bitmap c(Context context, h0 h0Var, ComponentName componentName) {
        Integer num = (Integer) this.f58641a.get(componentName.flattenToShortString());
        if (num != null) {
            return h0.d(h0Var, context.getResources(), num.intValue());
        }
        return null;
    }

    @Override // gz.f
    public final long d() {
        return 0L;
    }

    @Override // gz.f
    public final Drawable e(Context context, ComponentName componentName, Drawable drawable) {
        return null;
    }

    @Override // gz.f
    public final Drawable f(Context context, h0 h0Var, ComponentName componentName) {
        Integer num = (Integer) this.f58641a.get(componentName.flattenToShortString());
        if (num != null) {
            try {
                return context.getResources().getDrawable(num.intValue());
            } catch (Exception unused) {
            }
        }
        return null;
    }

    @Override // gz.f
    public final List g() {
        return EmptyList.f71733a;
    }

    @Override // gz.f
    public final String getPackageName() {
        return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    }

    @Override // gz.f
    public final int h() {
        return 0;
    }

    @Override // gz.f
    public final Bitmap i(Context context, ComponentName componentName, Drawable drawable) {
        return null;
    }

    @Override // gz.f
    public final boolean isEmpty() {
        return false;
    }

    @Override // gz.f
    public final boolean j(ComponentName componentName) {
        return this.f58641a.containsKey(componentName.flattenToShortString());
    }
}
