package m;

import android.content.Context;
import android.content.ContextWrapper;
import android.view.View;
import b.u4;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/* loaded from: classes2.dex */
public final class i0 implements View.OnClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final View f75293a;

    /* renamed from: b, reason: collision with root package name */
    public final String f75294b;

    /* renamed from: c, reason: collision with root package name */
    public Method f75295c;

    /* renamed from: d, reason: collision with root package name */
    public Context f75296d;

    public i0(View view, String str) {
        this.f75293a = view;
        this.f75294b = str;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        String str;
        Method method;
        if (this.f75295c == null) {
            View view2 = this.f75293a;
            Context context = view2.getContext();
            while (true) {
                String str2 = this.f75294b;
                if (context == null) {
                    int id2 = view2.getId();
                    if (id2 == -1) {
                        str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                    } else {
                        str = " with id '" + view2.getContext().getResources().getResourceEntryName(id2) + "'";
                    }
                    StringBuilder sbK = u4.k("Could not find method ", str2, "(View) in a parent or ancestor Context for android:onClick attribute defined on view ");
                    sbK.append(view2.getClass());
                    sbK.append(str);
                    throw new IllegalStateException(sbK.toString());
                }
                try {
                    if (!context.isRestricted() && (method = context.getClass().getMethod(str2, View.class)) != null) {
                        this.f75295c = method;
                        this.f75296d = context;
                    }
                } catch (NoSuchMethodException unused) {
                }
                context = context instanceof ContextWrapper ? ((ContextWrapper) context).getBaseContext() : null;
            }
        }
        try {
            this.f75295c.invoke(this.f75296d, view);
        } catch (IllegalAccessException e3) {
            throw new IllegalStateException("Could not execute non-public method for android:onClick", e3);
        } catch (InvocationTargetException e11) {
            throw new IllegalStateException("Could not execute method for android:onClick", e11);
        }
    }
}
