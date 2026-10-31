package com.teslacoilsw.launcher.appwidget;

import android.content.Context;
import android.content.MutableContextWrapper;
import android.os.Build;
import android.view.LayoutInflater;
import android.widget.TextView;
import java.lang.reflect.Method;
import kotlin.jvm.internal.Intrinsics;
import w20.m;

/* loaded from: classes4.dex */
public final class b extends MutableContextWrapper {

    /* renamed from: b, reason: collision with root package name */
    public static final Method f45715b;

    /* renamed from: c, reason: collision with root package name */
    public static final boolean f45716c;

    /* renamed from: a, reason: collision with root package name */
    public LayoutInflater f45717a;

    static {
        Method method = null;
        if (m.f93692b && Build.VERSION.SDK_INT == 29) {
            try {
                Object objInvoke = Class.class.getDeclaredMethod("getDeclaredMethod", String.class, new Class[0].getClass()).invoke(TextView.class, "setFlagForClockWidgetTextViewWidth", new Class[]{Boolean.TYPE});
                Intrinsics.e(objInvoke, "null cannot be cast to non-null type java.lang.reflect.Method");
                method = (Method) objInvoke;
            } catch (Exception unused) {
            }
        }
        f45715b = method;
        f45716c = method != null;
    }

    public b(Context context) {
        super(context);
    }

    @Override // android.content.ContextWrapper, android.content.Context
    public final Object getSystemService(String str) {
        if (!f45716c || !"layout_inflater".equals(str)) {
            return super.getSystemService(str);
        }
        if (this.f45717a == null) {
            LayoutInflater layoutInflaterCloneInContext = LayoutInflater.from(getBaseContext()).cloneInContext(this);
            this.f45717a = layoutInflaterCloneInContext;
            Intrinsics.d(layoutInflaterCloneInContext);
            layoutInflaterCloneInContext.setFactory(new a());
        }
        return this.f45717a;
    }

    @Override // android.content.MutableContextWrapper
    public final void setBaseContext(Context context) {
        this.f45717a = null;
        super.setBaseContext(context);
    }
}
