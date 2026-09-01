package defpackage;

import android.view.MenuItem;
import java.lang.reflect.Method;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p2d implements MenuItem.OnMenuItemClickListener {
    public static final Class[] d = {MenuItem.class};
    public final /* synthetic */ int a = 0;
    public Object b;
    public Object c;

    public p2d(wx7 wx7Var, MenuItem.OnMenuItemClickListener onMenuItemClickListener) {
        this.c = wx7Var;
        this.b = onMenuItemClickListener;
    }

    @Override // android.view.MenuItem.OnMenuItemClickListener
    public final boolean onMenuItemClick(MenuItem menuItem) {
        switch (this.a) {
            case 0:
                Object obj = this.b;
                Method method = (Method) this.c;
                boolean zBooleanValue = false;
                try {
                    if (method.getReturnType() == Boolean.TYPE) {
                        zBooleanValue = ((Boolean) method.invoke(obj, menuItem)).booleanValue();
                    } else {
                        method.invoke(obj, menuItem);
                        zBooleanValue = true;
                    }
                    break;
                } catch (Exception e) {
                    ik4.j(e);
                }
                return zBooleanValue;
            default:
                return ((MenuItem.OnMenuItemClickListener) this.b).onMenuItemClick(((wx7) this.c).h(menuItem));
        }
    }

    public /* synthetic */ p2d() {
    }
}
