package c;

import android.content.res.HwResourcesImpl;
import android.content.res.Resources;
import android.graphics.drawable.AdaptiveIconDrawable;
import android.graphics.drawable.Drawable;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import kotlin.jvm.internal.Intrinsics;
import v30.e;
import w20.r;

/* loaded from: classes2.dex */
public final class a extends HwResourcesImpl {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f18681a;

    /* renamed from: b, reason: collision with root package name */
    public final Method f18682b;

    /* renamed from: c, reason: collision with root package name */
    public final Method f18683c;

    public a() throws IllegalAccessException, NoSuchFieldException, SecurityException, IllegalArgumentException {
        Field declaredField;
        boolean z11 = true;
        try {
            try {
                declaredField = HwResourcesImpl.class.getDeclaredField("isIconSupportCut");
                declaredField.setAccessible(true);
            } catch (Exception unused) {
            }
        } catch (NoSuchFieldException | SecurityException unused2) {
            declaredField = null;
        }
        if (declaredField != null) {
            z11 = declaredField.getBoolean(r.f93718a);
        }
        this.f18681a = z11;
        this.f18682b = e.j(HwResourcesImpl.class, "checkWhiteListApp", String.class);
        this.f18683c = e.j(HwResourcesImpl.class, "isCurrentHwTheme", String.class, String.class);
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x002c  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0043  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Drawable handleAddIconBackground(Resources resources, int i5, Drawable drawable) {
        if (drawable instanceof AdaptiveIconDrawable) {
            String resourcePackageName = ((HwResourcesImpl) this).mPackageName;
            if (resourcePackageName == null) {
                try {
                    resourcePackageName = resources.getResourcePackageName(i5);
                } catch (Throwable unused) {
                    resourcePackageName = null;
                }
            }
            if (resourcePackageName != null) {
                if (!this.f18681a) {
                    if (!Intrinsics.b(this.f18683c.invoke(this, getThemeDir(), "description.xml"), Boolean.TRUE)) {
                        Method method = this.f18682b;
                        boolean z11 = method != null ? Intrinsics.b(method.invoke(this, resourcePackageName), Boolean.TRUE) : false;
                        if (z11) {
                            return drawable;
                        }
                    }
                }
            }
        }
        return super.handleAddIconBackground(resources, i5, drawable);
    }
}
