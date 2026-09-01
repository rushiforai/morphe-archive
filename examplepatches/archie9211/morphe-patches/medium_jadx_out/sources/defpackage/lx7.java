package defpackage;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Bundle;
import android.os.Parcelable;
import android.util.SparseArray;
import android.view.KeyCharacterMap;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.SubMenu;
import android.view.View;
import android.view.ViewConfiguration;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class lx7 implements Menu {
    public static final int[] y = {1, 4, 5, 3, 2, 0};
    public final Context a;
    public final Resources b;
    public boolean c;
    public final boolean d;
    public jx7 e;
    public final ArrayList f;
    public final ArrayList g;
    public boolean h;
    public final ArrayList i;
    public final ArrayList j;
    public boolean k;
    public CharSequence m;
    public Drawable n;
    public View o;
    public sx7 v;
    public boolean x;
    public int l = 0;
    public boolean p = false;
    public boolean q = false;
    public boolean r = false;
    public boolean s = false;
    public final ArrayList t = new ArrayList();
    public final CopyOnWriteArrayList u = new CopyOnWriteArrayList();
    public boolean w = false;

    public lx7(Context context) {
        boolean zM;
        boolean z = false;
        this.a = context;
        Resources resources = context.getResources();
        this.b = resources;
        this.f = new ArrayList();
        this.g = new ArrayList();
        this.h = true;
        this.i = new ArrayList();
        this.j = new ArrayList();
        this.k = true;
        if (resources.getConfiguration().keyboard != 1) {
            ViewConfiguration viewConfiguration = ViewConfiguration.get(context);
            Method method = aue.a;
            if (Build.VERSION.SDK_INT >= 28) {
                zM = uy.M(viewConfiguration);
            } else {
                Resources resources2 = context.getResources();
                int identifier = resources2.getIdentifier("config_showMenuShortcutsWhenKeyboardPresent", "bool", "android");
                zM = identifier != 0 && resources2.getBoolean(identifier);
            }
            if (zM) {
                z = true;
            }
        }
        this.d = z;
    }

    public final sx7 a(int i, int i2, int i3, CharSequence charSequence) {
        int i4;
        int i5 = ((-65536) & i3) >> 16;
        if (i5 < 0 || i5 >= 6) {
            ay0.e("order does not contain a valid category.");
            return null;
        }
        int i6 = (y[i5] << 16) | (65535 & i3);
        sx7 sx7Var = new sx7(this, i, i2, i3, i6, charSequence, this.l);
        ArrayList arrayList = this.f;
        int size = arrayList.size() - 1;
        while (true) {
            if (size < 0) {
                i4 = 0;
                break;
            }
            if (((sx7) arrayList.get(size)).d <= i6) {
                i4 = size + 1;
                break;
            }
            size--;
        }
        arrayList.add(i4, sx7Var);
        p(true);
        return sx7Var;
    }

    @Override // android.view.Menu
    public final MenuItem add(int i) {
        return a(0, 0, 0, this.b.getString(i));
    }

    @Override // android.view.Menu
    public final int addIntentOptions(int i, int i2, int i3, ComponentName componentName, Intent[] intentArr, Intent intent, int i4, MenuItem[] menuItemArr) {
        int i5;
        PackageManager packageManager = this.a.getPackageManager();
        List<ResolveInfo> listQueryIntentActivityOptions = packageManager.queryIntentActivityOptions(componentName, intentArr, intent, 0);
        int size = listQueryIntentActivityOptions != null ? listQueryIntentActivityOptions.size() : 0;
        if ((i4 & 1) == 0) {
            removeGroup(i);
        }
        for (int i6 = 0; i6 < size; i6++) {
            ResolveInfo resolveInfo = listQueryIntentActivityOptions.get(i6);
            int i7 = resolveInfo.specificIndex;
            Intent intent2 = new Intent(i7 < 0 ? intent : intentArr[i7]);
            ActivityInfo activityInfo = resolveInfo.activityInfo;
            intent2.setComponent(new ComponentName(activityInfo.applicationInfo.packageName, activityInfo.name));
            sx7 sx7VarA = a(i, i2, i3, resolveInfo.loadLabel(packageManager));
            sx7VarA.setIcon(resolveInfo.loadIcon(packageManager));
            sx7VarA.g = intent2;
            if (menuItemArr != null && (i5 = resolveInfo.specificIndex) >= 0) {
                menuItemArr[i5] = sx7VarA;
            }
        }
        return size;
    }

    @Override // android.view.Menu
    public final SubMenu addSubMenu(int i, int i2, int i3, CharSequence charSequence) {
        sx7 sx7VarA = a(i, i2, i3, charSequence);
        dvc dvcVar = new dvc(this.a, this, sx7VarA);
        sx7VarA.o = dvcVar;
        dvcVar.setHeaderTitle(sx7VarA.e);
        return dvcVar;
    }

    public final void b(ky7 ky7Var, Context context) {
        this.u.add(new WeakReference(ky7Var));
        ky7Var.k(context, this);
        this.k = true;
    }

    public final void c(boolean z) {
        if (this.s) {
            return;
        }
        this.s = true;
        CopyOnWriteArrayList<WeakReference> copyOnWriteArrayList = this.u;
        for (WeakReference weakReference : copyOnWriteArrayList) {
            ky7 ky7Var = (ky7) weakReference.get();
            if (ky7Var == null) {
                copyOnWriteArrayList.remove(weakReference);
            } else {
                ky7Var.b(this, z);
            }
        }
        this.s = false;
    }

    @Override // android.view.Menu
    public final void clear() {
        sx7 sx7Var = this.v;
        if (sx7Var != null) {
            d(sx7Var);
        }
        this.f.clear();
        p(true);
    }

    public final void clearHeader() {
        this.n = null;
        this.m = null;
        this.o = null;
        p(false);
    }

    @Override // android.view.Menu
    public final void close() {
        c(true);
    }

    public boolean d(sx7 sx7Var) {
        CopyOnWriteArrayList<WeakReference> copyOnWriteArrayList = this.u;
        boolean zF = false;
        if (!copyOnWriteArrayList.isEmpty() && this.v == sx7Var) {
            w();
            for (WeakReference weakReference : copyOnWriteArrayList) {
                ky7 ky7Var = (ky7) weakReference.get();
                if (ky7Var != null) {
                    zF = ky7Var.f(sx7Var);
                    if (zF) {
                        break;
                    }
                } else {
                    copyOnWriteArrayList.remove(weakReference);
                }
            }
            v();
            if (zF) {
                this.v = null;
            }
        }
        return zF;
    }

    public boolean e(lx7 lx7Var, MenuItem menuItem) {
        jx7 jx7Var = this.e;
        return jx7Var != null && jx7Var.d(lx7Var, menuItem);
    }

    public boolean f(sx7 sx7Var) {
        CopyOnWriteArrayList<WeakReference> copyOnWriteArrayList = this.u;
        boolean zH = false;
        if (copyOnWriteArrayList.isEmpty()) {
            return false;
        }
        w();
        for (WeakReference weakReference : copyOnWriteArrayList) {
            ky7 ky7Var = (ky7) weakReference.get();
            if (ky7Var != null) {
                zH = ky7Var.h(sx7Var);
                if (zH) {
                    break;
                }
            } else {
                copyOnWriteArrayList.remove(weakReference);
            }
        }
        v();
        if (zH) {
            this.v = sx7Var;
        }
        return zH;
    }

    @Override // android.view.Menu
    public final MenuItem findItem(int i) {
        MenuItem menuItemFindItem;
        ArrayList arrayList = this.f;
        int size = arrayList.size();
        for (int i2 = 0; i2 < size; i2++) {
            sx7 sx7Var = (sx7) arrayList.get(i2);
            if (sx7Var.a == i) {
                return sx7Var;
            }
            if (sx7Var.hasSubMenu() && (menuItemFindItem = sx7Var.o.findItem(i)) != null) {
                return menuItemFindItem;
            }
        }
        return null;
    }

    public final sx7 g(int i, KeyEvent keyEvent) {
        ArrayList arrayList = this.t;
        arrayList.clear();
        h(arrayList, i, keyEvent);
        if (arrayList.isEmpty()) {
            return null;
        }
        int metaState = keyEvent.getMetaState();
        KeyCharacterMap.KeyData keyData = new KeyCharacterMap.KeyData();
        keyEvent.getKeyData(keyData);
        int size = arrayList.size();
        if (size == 1) {
            return (sx7) arrayList.get(0);
        }
        boolean zN = n();
        for (int i2 = 0; i2 < size; i2++) {
            sx7 sx7Var = (sx7) arrayList.get(i2);
            char c = zN ? sx7Var.j : sx7Var.h;
            char[] cArr = keyData.meta;
            if ((c == cArr[0] && (metaState & 2) == 0) || ((c == cArr[2] && (metaState & 2) != 0) || (zN && c == '\b' && i == 67))) {
                return sx7Var;
            }
        }
        return null;
    }

    @Override // android.view.Menu
    public final MenuItem getItem(int i) {
        return (MenuItem) this.f.get(i);
    }

    public final void h(ArrayList arrayList, int i, KeyEvent keyEvent) {
        boolean zN = n();
        int modifiers = keyEvent.getModifiers();
        KeyCharacterMap.KeyData keyData = new KeyCharacterMap.KeyData();
        if (keyEvent.getKeyData(keyData) || i == 67) {
            ArrayList arrayList2 = this.f;
            int size = arrayList2.size();
            for (int i2 = 0; i2 < size; i2++) {
                sx7 sx7Var = (sx7) arrayList2.get(i2);
                if (sx7Var.hasSubMenu()) {
                    sx7Var.o.h(arrayList, i, keyEvent);
                }
                char c = zN ? sx7Var.j : sx7Var.h;
                if ((modifiers & 69647) == ((zN ? sx7Var.k : sx7Var.i) & 69647) && c != 0) {
                    char[] cArr = keyData.meta;
                    if ((c == cArr[0] || c == cArr[2] || (zN && c == '\b' && i == 67)) && sx7Var.isEnabled()) {
                        arrayList.add(sx7Var);
                    }
                }
            }
        }
    }

    @Override // android.view.Menu
    public final boolean hasVisibleItems() {
        if (this.x) {
            return true;
        }
        ArrayList arrayList = this.f;
        int size = arrayList.size();
        for (int i = 0; i < size; i++) {
            if (((sx7) arrayList.get(i)).isVisible()) {
                return true;
            }
        }
        return false;
    }

    public final void i() {
        ArrayList arrayListL = l();
        if (this.k) {
            CopyOnWriteArrayList<WeakReference> copyOnWriteArrayList = this.u;
            boolean zD = false;
            for (WeakReference weakReference : copyOnWriteArrayList) {
                ky7 ky7Var = (ky7) weakReference.get();
                if (ky7Var == null) {
                    copyOnWriteArrayList.remove(weakReference);
                } else {
                    zD |= ky7Var.d();
                }
            }
            ArrayList arrayList = this.i;
            ArrayList arrayList2 = this.j;
            if (zD) {
                arrayList.clear();
                arrayList2.clear();
                int size = arrayListL.size();
                for (int i = 0; i < size; i++) {
                    sx7 sx7Var = (sx7) arrayListL.get(i);
                    if ((sx7Var.x & 32) == 32) {
                        arrayList.add(sx7Var);
                    } else {
                        arrayList2.add(sx7Var);
                    }
                }
            } else {
                arrayList.clear();
                arrayList2.clear();
                arrayList2.addAll(l());
            }
            this.k = false;
        }
    }

    @Override // android.view.Menu
    public final boolean isShortcutKey(int i, KeyEvent keyEvent) {
        return g(i, keyEvent) != null;
    }

    public String j() {
        return "android:menu:actionviewstates";
    }

    public final ArrayList l() {
        boolean z = this.h;
        ArrayList arrayList = this.g;
        if (!z) {
            return arrayList;
        }
        arrayList.clear();
        ArrayList arrayList2 = this.f;
        int size = arrayList2.size();
        for (int i = 0; i < size; i++) {
            sx7 sx7Var = (sx7) arrayList2.get(i);
            if (sx7Var.isVisible()) {
                arrayList.add(sx7Var);
            }
        }
        this.h = false;
        this.k = true;
        return arrayList;
    }

    public boolean m() {
        return this.w;
    }

    public boolean n() {
        return this.c;
    }

    public boolean o() {
        return this.d;
    }

    public final void p(boolean z) {
        if (this.p) {
            this.q = true;
            if (z) {
                this.r = true;
                return;
            }
            return;
        }
        if (z) {
            this.h = true;
            this.k = true;
        }
        CopyOnWriteArrayList<WeakReference> copyOnWriteArrayList = this.u;
        if (copyOnWriteArrayList.isEmpty()) {
            return;
        }
        w();
        for (WeakReference weakReference : copyOnWriteArrayList) {
            ky7 ky7Var = (ky7) weakReference.get();
            if (ky7Var == null) {
                copyOnWriteArrayList.remove(weakReference);
            } else {
                ky7Var.i();
            }
        }
        v();
    }

    @Override // android.view.Menu
    public final boolean performIdentifierAction(int i, int i2) {
        return q(findItem(i), null, i2);
    }

    @Override // android.view.Menu
    public final boolean performShortcut(int i, KeyEvent keyEvent, int i2) {
        sx7 sx7VarG = g(i, keyEvent);
        boolean zQ = sx7VarG != null ? q(sx7VarG, null, i2) : false;
        if ((i2 & 2) != 0) {
            c(true);
        }
        return zQ;
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x001a  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0051  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0058  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x0064  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean q(android.view.MenuItem r7, defpackage.ky7 r8, int r9) {
        /*
            Method dump skipped, instruction units count: 211
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.lx7.q(android.view.MenuItem, ky7, int):boolean");
    }

    public final void r(ky7 ky7Var) {
        CopyOnWriteArrayList<WeakReference> copyOnWriteArrayList = this.u;
        for (WeakReference weakReference : copyOnWriteArrayList) {
            ky7 ky7Var2 = (ky7) weakReference.get();
            if (ky7Var2 == null || ky7Var2 == ky7Var) {
                copyOnWriteArrayList.remove(weakReference);
            }
        }
    }

    @Override // android.view.Menu
    public final void removeGroup(int i) {
        ArrayList arrayList = this.f;
        int size = arrayList.size();
        int i2 = 0;
        int i3 = 0;
        while (true) {
            if (i3 >= size) {
                i3 = -1;
                break;
            } else if (((sx7) arrayList.get(i3)).b == i) {
                break;
            } else {
                i3++;
            }
        }
        if (i3 >= 0) {
            int size2 = arrayList.size() - i3;
            while (true) {
                int i4 = i2 + 1;
                if (i2 >= size2 || ((sx7) arrayList.get(i3)).b != i) {
                    break;
                }
                if (i3 >= 0 && i3 < arrayList.size()) {
                    arrayList.remove(i3);
                }
                i2 = i4;
            }
            p(true);
        }
    }

    @Override // android.view.Menu
    public final void removeItem(int i) {
        ArrayList arrayList = this.f;
        int size = arrayList.size();
        int i2 = 0;
        while (true) {
            if (i2 >= size) {
                i2 = -1;
                break;
            } else if (((sx7) arrayList.get(i2)).a == i) {
                break;
            } else {
                i2++;
            }
        }
        if (i2 < 0 || i2 >= arrayList.size()) {
            return;
        }
        arrayList.remove(i2);
        p(true);
    }

    public final void s(Bundle bundle) {
        MenuItem menuItemFindItem;
        if (bundle == null) {
            return;
        }
        SparseArray<Parcelable> sparseParcelableArray = bundle.getSparseParcelableArray(j());
        int size = this.f.size();
        for (int i = 0; i < size; i++) {
            MenuItem item = getItem(i);
            View actionView = item.getActionView();
            if (actionView != null && actionView.getId() != -1) {
                actionView.restoreHierarchyState(sparseParcelableArray);
            }
            if (item.hasSubMenu()) {
                ((dvc) item.getSubMenu()).s(bundle);
            }
        }
        int i2 = bundle.getInt("android:menu:expandedactionview");
        if (i2 <= 0 || (menuItemFindItem = findItem(i2)) == null) {
            return;
        }
        menuItemFindItem.expandActionView();
    }

    @Override // android.view.Menu
    public final void setGroupCheckable(int i, boolean z, boolean z2) {
        ArrayList arrayList = this.f;
        int size = arrayList.size();
        for (int i2 = 0; i2 < size; i2++) {
            sx7 sx7Var = (sx7) arrayList.get(i2);
            if (sx7Var.b == i) {
                sx7Var.x = (sx7Var.x & (-5)) | (z2 ? 4 : 0);
                sx7Var.setCheckable(z);
            }
        }
    }

    @Override // android.view.Menu
    public void setGroupDividerEnabled(boolean z) {
        this.w = z;
    }

    @Override // android.view.Menu
    public final void setGroupEnabled(int i, boolean z) {
        ArrayList arrayList = this.f;
        int size = arrayList.size();
        for (int i2 = 0; i2 < size; i2++) {
            sx7 sx7Var = (sx7) arrayList.get(i2);
            if (sx7Var.b == i) {
                sx7Var.setEnabled(z);
            }
        }
    }

    @Override // android.view.Menu
    public final void setGroupVisible(int i, boolean z) {
        ArrayList arrayList = this.f;
        int size = arrayList.size();
        boolean z2 = false;
        for (int i2 = 0; i2 < size; i2++) {
            sx7 sx7Var = (sx7) arrayList.get(i2);
            if (sx7Var.b == i) {
                int i3 = sx7Var.x;
                int i4 = (i3 & (-9)) | (z ? 0 : 8);
                sx7Var.x = i4;
                if (i3 != i4) {
                    z2 = true;
                }
            }
        }
        if (z2) {
            p(true);
        }
    }

    @Override // android.view.Menu
    public void setQwertyMode(boolean z) {
        this.c = z;
        p(false);
    }

    @Override // android.view.Menu
    public final int size() {
        return this.f.size();
    }

    public final void t(Bundle bundle) {
        int size = this.f.size();
        SparseArray<? extends Parcelable> sparseArray = null;
        for (int i = 0; i < size; i++) {
            MenuItem item = getItem(i);
            View actionView = item.getActionView();
            if (actionView != null && actionView.getId() != -1) {
                if (sparseArray == null) {
                    sparseArray = new SparseArray<>();
                }
                actionView.saveHierarchyState(sparseArray);
                if (item.isActionViewExpanded()) {
                    bundle.putInt("android:menu:expandedactionview", item.getItemId());
                }
            }
            if (item.hasSubMenu()) {
                ((dvc) item.getSubMenu()).t(bundle);
            }
        }
        if (sparseArray != null) {
            bundle.putSparseParcelableArray(j(), sparseArray);
        }
    }

    public final void u(int i, CharSequence charSequence, int i2, Drawable drawable, View view) {
        if (view != null) {
            this.o = view;
            this.m = null;
            this.n = null;
        } else {
            if (i > 0) {
                this.m = this.b.getText(i);
            } else if (charSequence != null) {
                this.m = charSequence;
            }
            if (i2 > 0) {
                this.n = this.a.getDrawable(i2);
            } else if (drawable != null) {
                this.n = drawable;
            }
            this.o = null;
        }
        p(false);
    }

    public final void v() {
        this.p = false;
        if (this.q) {
            this.q = false;
            p(this.r);
        }
    }

    public final void w() {
        if (this.p) {
            return;
        }
        this.p = true;
        this.q = false;
        this.r = false;
    }

    @Override // android.view.Menu
    public final MenuItem add(CharSequence charSequence) {
        return a(0, 0, 0, charSequence);
    }

    @Override // android.view.Menu
    public final MenuItem add(int i, int i2, int i3, CharSequence charSequence) {
        return a(i, i2, i3, charSequence);
    }

    @Override // android.view.Menu
    public final MenuItem add(int i, int i2, int i3, int i4) {
        return a(i, i2, i3, this.b.getString(i4));
    }

    @Override // android.view.Menu
    public final SubMenu addSubMenu(int i) {
        return addSubMenu(0, 0, 0, this.b.getString(i));
    }

    @Override // android.view.Menu
    public final SubMenu addSubMenu(CharSequence charSequence) {
        return addSubMenu(0, 0, 0, charSequence);
    }

    @Override // android.view.Menu
    public final SubMenu addSubMenu(int i, int i2, int i3, int i4) {
        return addSubMenu(i, i2, i3, this.b.getString(i4));
    }

    public lx7 k() {
        return this;
    }
}
