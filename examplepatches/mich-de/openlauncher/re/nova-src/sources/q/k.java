package q;

import android.content.ActivityNotFoundException;
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
import android.util.Log;
import android.util.SparseArray;
import android.view.KeyCharacterMap;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.SubMenu;
import android.view.View;
import android.view.ViewConfiguration;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

/* loaded from: classes2.dex */
public class k implements Menu {

    /* renamed from: y, reason: collision with root package name */
    public static final int[] f83231y = {1, 4, 5, 3, 2, 0};

    /* renamed from: a, reason: collision with root package name */
    public final Context f83232a;

    /* renamed from: b, reason: collision with root package name */
    public final Resources f83233b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f83234c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f83235d;

    /* renamed from: e, reason: collision with root package name */
    public i f83236e;

    /* renamed from: f, reason: collision with root package name */
    public final ArrayList f83237f;

    /* renamed from: g, reason: collision with root package name */
    public final ArrayList f83238g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f83239h;

    /* renamed from: i, reason: collision with root package name */
    public final ArrayList f83240i;

    /* renamed from: j, reason: collision with root package name */
    public final ArrayList f83241j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f83242k;

    /* renamed from: m, reason: collision with root package name */
    public CharSequence f83244m;
    public Drawable n;
    public View o;

    /* renamed from: v, reason: collision with root package name */
    public m f83251v;

    /* renamed from: x, reason: collision with root package name */
    public boolean f83253x;

    /* renamed from: l, reason: collision with root package name */
    public int f83243l = 0;

    /* renamed from: p, reason: collision with root package name */
    public boolean f83245p = false;

    /* renamed from: q, reason: collision with root package name */
    public boolean f83246q = false;

    /* renamed from: r, reason: collision with root package name */
    public boolean f83247r = false;

    /* renamed from: s, reason: collision with root package name */
    public boolean f83248s = false;

    /* renamed from: t, reason: collision with root package name */
    public final ArrayList f83249t = new ArrayList();

    /* renamed from: u, reason: collision with root package name */
    public final CopyOnWriteArrayList f83250u = new CopyOnWriteArrayList();

    /* renamed from: w, reason: collision with root package name */
    public boolean f83252w = false;

    public k(Context context) {
        boolean zM;
        boolean z11 = false;
        this.f83232a = context;
        Resources resources = context.getResources();
        this.f83233b = resources;
        this.f83237f = new ArrayList();
        this.f83238g = new ArrayList();
        this.f83239h = true;
        this.f83240i = new ArrayList();
        this.f83241j = new ArrayList();
        this.f83242k = true;
        if (resources.getConfiguration().keyboard != 1) {
            ViewConfiguration viewConfiguration = ViewConfiguration.get(context);
            if (Build.VERSION.SDK_INT >= 28) {
                zM = a5.l.m(viewConfiguration);
            } else {
                Resources resources2 = context.getResources();
                int identifier = resources2.getIdentifier("config_showMenuShortcutsWhenKeyboardPresent", "bool", "android");
                zM = identifier != 0 && resources2.getBoolean(identifier);
            }
            if (zM) {
                z11 = true;
            }
        }
        this.f83235d = z11;
    }

    public final m a(int i5, int i11, int i12, CharSequence charSequence) {
        int i13;
        int i14 = ((-65536) & i12) >> 16;
        if (i14 < 0 || i14 >= 6) {
            throw new IllegalArgumentException("order does not contain a valid category.");
        }
        int i15 = (f83231y[i14] << 16) | (65535 & i12);
        m mVar = new m(this, i5, i11, i12, i15, charSequence, this.f83243l);
        ArrayList arrayList = this.f83237f;
        int size = arrayList.size() - 1;
        while (true) {
            if (size < 0) {
                i13 = 0;
                break;
            }
            if (((m) arrayList.get(size)).f83260d <= i15) {
                i13 = size + 1;
                break;
            }
            size--;
        }
        arrayList.add(i13, mVar);
        p(true);
        return mVar;
    }

    @Override // android.view.Menu
    public final MenuItem add(CharSequence charSequence) {
        return a(0, 0, 0, charSequence);
    }

    @Override // android.view.Menu
    public final int addIntentOptions(int i5, int i11, int i12, ComponentName componentName, Intent[] intentArr, Intent intent, int i13, MenuItem[] menuItemArr) {
        int i14;
        PackageManager packageManager = this.f83232a.getPackageManager();
        List<ResolveInfo> listQueryIntentActivityOptions = packageManager.queryIntentActivityOptions(componentName, intentArr, intent, 0);
        int size = listQueryIntentActivityOptions != null ? listQueryIntentActivityOptions.size() : 0;
        if ((i13 & 1) == 0) {
            removeGroup(i5);
        }
        for (int i15 = 0; i15 < size; i15++) {
            ResolveInfo resolveInfo = listQueryIntentActivityOptions.get(i15);
            int i16 = resolveInfo.specificIndex;
            Intent intent2 = new Intent(i16 < 0 ? intent : intentArr[i16]);
            ActivityInfo activityInfo = resolveInfo.activityInfo;
            intent2.setComponent(new ComponentName(activityInfo.applicationInfo.packageName, activityInfo.name));
            m mVarA = a(i5, i11, i12, resolveInfo.loadLabel(packageManager));
            mVarA.setIcon(resolveInfo.loadIcon(packageManager));
            mVarA.f83263g = intent2;
            if (menuItemArr != null && (i14 = resolveInfo.specificIndex) >= 0) {
                menuItemArr[i14] = mVarA;
            }
        }
        return size;
    }

    @Override // android.view.Menu
    public final SubMenu addSubMenu(CharSequence charSequence) {
        return addSubMenu(0, 0, 0, charSequence);
    }

    public final void b(w wVar, Context context) {
        this.f83250u.add(new WeakReference(wVar));
        wVar.e(context, this);
        this.f83242k = true;
    }

    public final void c(boolean z11) {
        if (this.f83248s) {
            return;
        }
        this.f83248s = true;
        CopyOnWriteArrayList copyOnWriteArrayList = this.f83250u;
        Iterator it = copyOnWriteArrayList.iterator();
        while (it.hasNext()) {
            WeakReference weakReference = (WeakReference) it.next();
            w wVar = (w) weakReference.get();
            if (wVar == null) {
                copyOnWriteArrayList.remove(weakReference);
            } else {
                wVar.b(this, z11);
            }
        }
        this.f83248s = false;
    }

    @Override // android.view.Menu
    public final void clear() {
        m mVar = this.f83251v;
        if (mVar != null) {
            d(mVar);
        }
        this.f83237f.clear();
        p(true);
    }

    public final void clearHeader() {
        this.n = null;
        this.f83244m = null;
        this.o = null;
        p(false);
    }

    @Override // android.view.Menu
    public final void close() {
        c(true);
    }

    public boolean d(m mVar) {
        CopyOnWriteArrayList copyOnWriteArrayList = this.f83250u;
        boolean zF = false;
        if (!copyOnWriteArrayList.isEmpty() && this.f83251v == mVar) {
            w();
            Iterator it = copyOnWriteArrayList.iterator();
            while (it.hasNext()) {
                WeakReference weakReference = (WeakReference) it.next();
                w wVar = (w) weakReference.get();
                if (wVar == null) {
                    copyOnWriteArrayList.remove(weakReference);
                } else {
                    zF = wVar.f(mVar);
                    if (zF) {
                        break;
                    }
                }
            }
            v();
            if (zF) {
                this.f83251v = null;
            }
        }
        return zF;
    }

    public boolean e(k kVar, MenuItem menuItem) {
        i iVar = this.f83236e;
        return iVar != null && iVar.a(kVar, menuItem);
    }

    public boolean f(m mVar) {
        CopyOnWriteArrayList copyOnWriteArrayList = this.f83250u;
        boolean zD = false;
        if (copyOnWriteArrayList.isEmpty()) {
            return false;
        }
        w();
        Iterator it = copyOnWriteArrayList.iterator();
        while (it.hasNext()) {
            WeakReference weakReference = (WeakReference) it.next();
            w wVar = (w) weakReference.get();
            if (wVar == null) {
                copyOnWriteArrayList.remove(weakReference);
            } else {
                zD = wVar.d(mVar);
                if (zD) {
                    break;
                }
            }
        }
        v();
        if (zD) {
            this.f83251v = mVar;
        }
        return zD;
    }

    @Override // android.view.Menu
    public final MenuItem findItem(int i5) {
        MenuItem menuItemFindItem;
        ArrayList arrayList = this.f83237f;
        int size = arrayList.size();
        for (int i11 = 0; i11 < size; i11++) {
            m mVar = (m) arrayList.get(i11);
            if (mVar.f83257a == i5) {
                return mVar;
            }
            if (mVar.hasSubMenu() && (menuItemFindItem = mVar.o.findItem(i5)) != null) {
                return menuItemFindItem;
            }
        }
        return null;
    }

    public final m g(int i5, KeyEvent keyEvent) {
        ArrayList arrayList = this.f83249t;
        arrayList.clear();
        h(arrayList, i5, keyEvent);
        if (arrayList.isEmpty()) {
            return null;
        }
        int metaState = keyEvent.getMetaState();
        KeyCharacterMap.KeyData keyData = new KeyCharacterMap.KeyData();
        keyEvent.getKeyData(keyData);
        int size = arrayList.size();
        if (size == 1) {
            return (m) arrayList.get(0);
        }
        boolean zN = n();
        for (int i11 = 0; i11 < size; i11++) {
            m mVar = (m) arrayList.get(i11);
            char c11 = zN ? mVar.f83266j : mVar.f83264h;
            char[] cArr = keyData.meta;
            if ((c11 == cArr[0] && (metaState & 2) == 0) || ((c11 == cArr[2] && (metaState & 2) != 0) || (zN && c11 == '\b' && i5 == 67))) {
                return mVar;
            }
        }
        return null;
    }

    @Override // android.view.Menu
    public final MenuItem getItem(int i5) {
        return (MenuItem) this.f83237f.get(i5);
    }

    public final void h(List list, int i5, KeyEvent keyEvent) {
        boolean zN = n();
        int modifiers = keyEvent.getModifiers();
        KeyCharacterMap.KeyData keyData = new KeyCharacterMap.KeyData();
        if (keyEvent.getKeyData(keyData) || i5 == 67) {
            ArrayList arrayList = this.f83237f;
            int size = arrayList.size();
            for (int i11 = 0; i11 < size; i11++) {
                m mVar = (m) arrayList.get(i11);
                if (mVar.hasSubMenu()) {
                    mVar.o.h(list, i5, keyEvent);
                }
                char c11 = zN ? mVar.f83266j : mVar.f83264h;
                if ((modifiers & 69647) == ((zN ? mVar.f83267k : mVar.f83265i) & 69647) && c11 != 0) {
                    char[] cArr = keyData.meta;
                    if ((c11 == cArr[0] || c11 == cArr[2] || (zN && c11 == '\b' && i5 == 67)) && mVar.isEnabled()) {
                        list.add(mVar);
                    }
                }
            }
        }
    }

    @Override // android.view.Menu
    public final boolean hasVisibleItems() {
        if (this.f83253x) {
            return true;
        }
        ArrayList arrayList = this.f83237f;
        int size = arrayList.size();
        for (int i5 = 0; i5 < size; i5++) {
            if (((m) arrayList.get(i5)).isVisible()) {
                return true;
            }
        }
        return false;
    }

    public final void i() {
        ArrayList arrayListL = l();
        if (this.f83242k) {
            CopyOnWriteArrayList copyOnWriteArrayList = this.f83250u;
            Iterator it = copyOnWriteArrayList.iterator();
            boolean zG = false;
            while (it.hasNext()) {
                WeakReference weakReference = (WeakReference) it.next();
                w wVar = (w) weakReference.get();
                if (wVar == null) {
                    copyOnWriteArrayList.remove(weakReference);
                } else {
                    zG |= wVar.g();
                }
            }
            ArrayList arrayList = this.f83240i;
            ArrayList arrayList2 = this.f83241j;
            if (zG) {
                arrayList.clear();
                arrayList2.clear();
                int size = arrayListL.size();
                for (int i5 = 0; i5 < size; i5++) {
                    m mVar = (m) arrayListL.get(i5);
                    if ((mVar.f83278x & 32) == 32) {
                        arrayList.add(mVar);
                    } else {
                        arrayList2.add(mVar);
                    }
                }
            } else {
                arrayList.clear();
                arrayList2.clear();
                arrayList2.addAll(l());
            }
            this.f83242k = false;
        }
    }

    @Override // android.view.Menu
    public final boolean isShortcutKey(int i5, KeyEvent keyEvent) {
        return g(i5, keyEvent) != null;
    }

    public String j() {
        return "android:menu:actionviewstates";
    }

    public k k() {
        return this;
    }

    public final ArrayList l() {
        boolean z11 = this.f83239h;
        ArrayList arrayList = this.f83238g;
        if (!z11) {
            return arrayList;
        }
        arrayList.clear();
        ArrayList arrayList2 = this.f83237f;
        int size = arrayList2.size();
        for (int i5 = 0; i5 < size; i5++) {
            m mVar = (m) arrayList2.get(i5);
            if (mVar.isVisible()) {
                arrayList.add(mVar);
            }
        }
        this.f83239h = false;
        this.f83242k = true;
        return arrayList;
    }

    public boolean m() {
        return this.f83252w;
    }

    public boolean n() {
        return this.f83234c;
    }

    public boolean o() {
        return this.f83235d;
    }

    public final void p(boolean z11) {
        if (this.f83245p) {
            this.f83246q = true;
            if (z11) {
                this.f83247r = true;
                return;
            }
            return;
        }
        if (z11) {
            this.f83239h = true;
            this.f83242k = true;
        }
        CopyOnWriteArrayList copyOnWriteArrayList = this.f83250u;
        if (copyOnWriteArrayList.isEmpty()) {
            return;
        }
        w();
        Iterator it = copyOnWriteArrayList.iterator();
        while (it.hasNext()) {
            WeakReference weakReference = (WeakReference) it.next();
            w wVar = (w) weakReference.get();
            if (wVar == null) {
                copyOnWriteArrayList.remove(weakReference);
            } else {
                wVar.c();
            }
        }
        v();
    }

    @Override // android.view.Menu
    public final boolean performIdentifierAction(int i5, int i11) {
        return q(findItem(i5), null, i11);
    }

    @Override // android.view.Menu
    public final boolean performShortcut(int i5, KeyEvent keyEvent, int i11) {
        m mVarG = g(i5, keyEvent);
        boolean zQ = mVarG != null ? q(mVarG, null, i11) : false;
        if ((i11 & 2) != 0) {
            c(true);
        }
        return zQ;
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x001a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean q(MenuItem menuItem, w wVar, int i5) {
        boolean zExpandActionView;
        m mVar = (m) menuItem;
        if (mVar == null || !mVar.isEnabled()) {
            return false;
        }
        k kVar = mVar.n;
        MenuItem.OnMenuItemClickListener onMenuItemClickListener = mVar.f83270p;
        if ((onMenuItemClickListener == null || !onMenuItemClickListener.onMenuItemClick(mVar)) && !kVar.e(kVar, mVar)) {
            Intent intent = mVar.f83263g;
            if (intent != null) {
                try {
                    kVar.f83232a.startActivity(intent);
                } catch (ActivityNotFoundException e3) {
                    Log.e("MenuItemImpl", "Can't find activity to handle intent; ignoring", e3);
                }
            } else {
                n nVar = mVar.A;
                zExpandActionView = nVar != null && nVar.f83283c.onPerformDefaultAction();
            }
        }
        n nVar2 = mVar.A;
        boolean z11 = nVar2 != null && nVar2.f83283c.hasSubMenu();
        if (mVar.e()) {
            zExpandActionView |= mVar.expandActionView();
            if (zExpandActionView) {
                c(true);
            }
        } else if (mVar.hasSubMenu() || z11) {
            if ((i5 & 4) == 0) {
                c(false);
            }
            if (!mVar.hasSubMenu()) {
                c0 c0Var = new c0(this.f83232a, this, mVar);
                mVar.o = c0Var;
                c0Var.setHeaderTitle(mVar.f83261e);
            }
            c0 c0Var2 = mVar.o;
            if (z11) {
                nVar2.f83283c.onPrepareSubMenu(c0Var2);
            }
            CopyOnWriteArrayList copyOnWriteArrayList = this.f83250u;
            if (!copyOnWriteArrayList.isEmpty()) {
                zA = wVar != null ? wVar.a(c0Var2) : false;
                Iterator it = copyOnWriteArrayList.iterator();
                while (it.hasNext()) {
                    WeakReference weakReference = (WeakReference) it.next();
                    w wVar2 = (w) weakReference.get();
                    if (wVar2 == null) {
                        copyOnWriteArrayList.remove(weakReference);
                    } else if (!zA) {
                        zA = wVar2.a(c0Var2);
                    }
                }
            }
            zExpandActionView |= zA;
            if (!zExpandActionView) {
                c(true);
            }
        } else if ((i5 & 1) == 0) {
            c(true);
        }
        return zExpandActionView;
    }

    public final void r(w wVar) {
        CopyOnWriteArrayList copyOnWriteArrayList = this.f83250u;
        Iterator it = copyOnWriteArrayList.iterator();
        while (it.hasNext()) {
            WeakReference weakReference = (WeakReference) it.next();
            w wVar2 = (w) weakReference.get();
            if (wVar2 == null || wVar2 == wVar) {
                copyOnWriteArrayList.remove(weakReference);
            }
        }
    }

    @Override // android.view.Menu
    public final void removeGroup(int i5) {
        ArrayList arrayList = this.f83237f;
        int size = arrayList.size();
        int i11 = 0;
        int i12 = 0;
        while (true) {
            if (i12 >= size) {
                i12 = -1;
                break;
            } else if (((m) arrayList.get(i12)).f83258b == i5) {
                break;
            } else {
                i12++;
            }
        }
        if (i12 >= 0) {
            int size2 = arrayList.size() - i12;
            while (true) {
                int i13 = i11 + 1;
                if (i11 >= size2 || ((m) arrayList.get(i12)).f83258b != i5) {
                    break;
                }
                if (i12 >= 0 && i12 < arrayList.size()) {
                    arrayList.remove(i12);
                }
                i11 = i13;
            }
            p(true);
        }
    }

    @Override // android.view.Menu
    public final void removeItem(int i5) {
        ArrayList arrayList = this.f83237f;
        int size = arrayList.size();
        int i11 = 0;
        while (true) {
            if (i11 >= size) {
                i11 = -1;
                break;
            } else if (((m) arrayList.get(i11)).f83257a == i5) {
                break;
            } else {
                i11++;
            }
        }
        if (i11 < 0 || i11 >= arrayList.size()) {
            return;
        }
        arrayList.remove(i11);
        p(true);
    }

    public final void s(Bundle bundle) {
        MenuItem menuItemFindItem;
        if (bundle == null) {
            return;
        }
        SparseArray<Parcelable> sparseParcelableArray = bundle.getSparseParcelableArray(j());
        int size = this.f83237f.size();
        for (int i5 = 0; i5 < size; i5++) {
            MenuItem item = getItem(i5);
            View actionView = item.getActionView();
            if (actionView != null && actionView.getId() != -1) {
                actionView.restoreHierarchyState(sparseParcelableArray);
            }
            if (item.hasSubMenu()) {
                ((c0) item.getSubMenu()).s(bundle);
            }
        }
        int i11 = bundle.getInt("android:menu:expandedactionview");
        if (i11 <= 0 || (menuItemFindItem = findItem(i11)) == null) {
            return;
        }
        menuItemFindItem.expandActionView();
    }

    @Override // android.view.Menu
    public final void setGroupCheckable(int i5, boolean z11, boolean z12) {
        ArrayList arrayList = this.f83237f;
        int size = arrayList.size();
        for (int i11 = 0; i11 < size; i11++) {
            m mVar = (m) arrayList.get(i11);
            if (mVar.f83258b == i5) {
                mVar.f83278x = (mVar.f83278x & (-5)) | (z12 ? 4 : 0);
                mVar.setCheckable(z11);
            }
        }
    }

    @Override // android.view.Menu
    public void setGroupDividerEnabled(boolean z11) {
        this.f83252w = z11;
    }

    @Override // android.view.Menu
    public final void setGroupEnabled(int i5, boolean z11) {
        ArrayList arrayList = this.f83237f;
        int size = arrayList.size();
        for (int i11 = 0; i11 < size; i11++) {
            m mVar = (m) arrayList.get(i11);
            if (mVar.f83258b == i5) {
                mVar.setEnabled(z11);
            }
        }
    }

    @Override // android.view.Menu
    public final void setGroupVisible(int i5, boolean z11) {
        ArrayList arrayList = this.f83237f;
        int size = arrayList.size();
        boolean z12 = false;
        for (int i11 = 0; i11 < size; i11++) {
            m mVar = (m) arrayList.get(i11);
            if (mVar.f83258b == i5) {
                int i12 = mVar.f83278x;
                int i13 = (i12 & (-9)) | (z11 ? 0 : 8);
                mVar.f83278x = i13;
                if (i12 != i13) {
                    z12 = true;
                }
            }
        }
        if (z12) {
            p(true);
        }
    }

    @Override // android.view.Menu
    public void setQwertyMode(boolean z11) {
        this.f83234c = z11;
        p(false);
    }

    @Override // android.view.Menu
    public final int size() {
        return this.f83237f.size();
    }

    public final void t(Bundle bundle) {
        int size = this.f83237f.size();
        SparseArray<? extends Parcelable> sparseArray = null;
        for (int i5 = 0; i5 < size; i5++) {
            MenuItem item = getItem(i5);
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
                ((c0) item.getSubMenu()).t(bundle);
            }
        }
        if (sparseArray != null) {
            bundle.putSparseParcelableArray(j(), sparseArray);
        }
    }

    public final void u(int i5, CharSequence charSequence, int i11, Drawable drawable, View view) {
        if (view != null) {
            this.o = view;
            this.f83244m = null;
            this.n = null;
        } else {
            if (i5 > 0) {
                this.f83244m = this.f83233b.getText(i5);
            } else if (charSequence != null) {
                this.f83244m = charSequence;
            }
            if (i11 > 0) {
                this.n = this.f83232a.getDrawable(i11);
            } else if (drawable != null) {
                this.n = drawable;
            }
            this.o = null;
        }
        p(false);
    }

    public final void v() {
        this.f83245p = false;
        if (this.f83246q) {
            this.f83246q = false;
            p(this.f83247r);
        }
    }

    public final void w() {
        if (this.f83245p) {
            return;
        }
        this.f83245p = true;
        this.f83246q = false;
        this.f83247r = false;
    }

    @Override // android.view.Menu
    public final MenuItem add(int i5) {
        return a(0, 0, 0, this.f83233b.getString(i5));
    }

    @Override // android.view.Menu
    public final SubMenu addSubMenu(int i5) {
        return addSubMenu(0, 0, 0, this.f83233b.getString(i5));
    }

    @Override // android.view.Menu
    public final MenuItem add(int i5, int i11, int i12, CharSequence charSequence) {
        return a(i5, i11, i12, charSequence);
    }

    @Override // android.view.Menu
    public final SubMenu addSubMenu(int i5, int i11, int i12, CharSequence charSequence) {
        m mVarA = a(i5, i11, i12, charSequence);
        c0 c0Var = new c0(this.f83232a, this, mVarA);
        mVarA.o = c0Var;
        c0Var.setHeaderTitle(mVarA.f83261e);
        return c0Var;
    }

    @Override // android.view.Menu
    public final MenuItem add(int i5, int i11, int i12, int i13) {
        return a(i5, i11, i12, this.f83233b.getString(i13));
    }

    @Override // android.view.Menu
    public final SubMenu addSubMenu(int i5, int i11, int i12, int i13) {
        return addSubMenu(i5, i11, i12, this.f83233b.getString(i13));
    }
}
