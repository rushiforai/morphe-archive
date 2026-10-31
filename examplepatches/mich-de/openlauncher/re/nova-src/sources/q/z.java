package q;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.SubMenu;
import z.c1;

/* loaded from: classes2.dex */
public class z extends c3.b implements Menu {

    /* renamed from: g, reason: collision with root package name */
    public final k f83305g;

    public z(Context context, k kVar) {
        super(context);
        if (kVar == null) {
            throw new IllegalArgumentException("Wrapped Object can not be null.");
        }
        this.f83305g = kVar;
    }

    @Override // android.view.Menu
    public final MenuItem add(CharSequence charSequence) {
        return n(this.f83305g.a(0, 0, 0, charSequence));
    }

    @Override // android.view.Menu
    public final int addIntentOptions(int i5, int i11, int i12, ComponentName componentName, Intent[] intentArr, Intent intent, int i13, MenuItem[] menuItemArr) {
        MenuItem[] menuItemArr2 = menuItemArr != null ? new MenuItem[menuItemArr.length] : null;
        int iAddIntentOptions = this.f83305g.addIntentOptions(i5, i11, i12, componentName, intentArr, intent, i13, menuItemArr2);
        if (menuItemArr2 != null) {
            int length = menuItemArr2.length;
            for (int i14 = 0; i14 < length; i14++) {
                menuItemArr[i14] = n(menuItemArr2[i14]);
            }
        }
        return iAddIntentOptions;
    }

    @Override // android.view.Menu
    public final SubMenu addSubMenu(CharSequence charSequence) {
        return this.f83305g.addSubMenu(0, 0, 0, charSequence);
    }

    @Override // android.view.Menu
    public final void clear() {
        c1 c1Var = (c1) this.f19223b;
        if (c1Var != null) {
            c1Var.clear();
        }
        this.f83305g.clear();
    }

    @Override // android.view.Menu
    public final void close() {
        this.f83305g.close();
    }

    @Override // android.view.Menu
    public final MenuItem findItem(int i5) {
        return n(this.f83305g.findItem(i5));
    }

    @Override // android.view.Menu
    public final MenuItem getItem(int i5) {
        return n(this.f83305g.getItem(i5));
    }

    @Override // android.view.Menu
    public final boolean hasVisibleItems() {
        return this.f83305g.hasVisibleItems();
    }

    @Override // android.view.Menu
    public final boolean isShortcutKey(int i5, KeyEvent keyEvent) {
        return this.f83305g.isShortcutKey(i5, keyEvent);
    }

    @Override // android.view.Menu
    public final boolean performIdentifierAction(int i5, int i11) {
        return this.f83305g.performIdentifierAction(i5, i11);
    }

    @Override // android.view.Menu
    public final boolean performShortcut(int i5, KeyEvent keyEvent, int i11) {
        return this.f83305g.performShortcut(i5, keyEvent, i11);
    }

    @Override // android.view.Menu
    public final void removeGroup(int i5) {
        if (((c1) this.f19223b) != null) {
            int i11 = 0;
            while (true) {
                c1 c1Var = (c1) this.f19223b;
                if (i11 >= c1Var.f97753c) {
                    break;
                }
                if (((t4.a) c1Var.f(i11)).getGroupId() == i5) {
                    ((c1) this.f19223b).h(i11);
                    i11--;
                }
                i11++;
            }
        }
        this.f83305g.removeGroup(i5);
    }

    @Override // android.view.Menu
    public final void removeItem(int i5) {
        if (((c1) this.f19223b) != null) {
            int i11 = 0;
            while (true) {
                c1 c1Var = (c1) this.f19223b;
                if (i11 >= c1Var.f97753c) {
                    break;
                }
                if (((t4.a) c1Var.f(i11)).getItemId() == i5) {
                    ((c1) this.f19223b).h(i11);
                    break;
                }
                i11++;
            }
        }
        this.f83305g.removeItem(i5);
    }

    @Override // android.view.Menu
    public final void setGroupCheckable(int i5, boolean z11, boolean z12) {
        this.f83305g.setGroupCheckable(i5, z11, z12);
    }

    @Override // android.view.Menu
    public final void setGroupEnabled(int i5, boolean z11) {
        this.f83305g.setGroupEnabled(i5, z11);
    }

    @Override // android.view.Menu
    public final void setGroupVisible(int i5, boolean z11) {
        this.f83305g.setGroupVisible(i5, z11);
    }

    @Override // android.view.Menu
    public final void setQwertyMode(boolean z11) {
        this.f83305g.setQwertyMode(z11);
    }

    @Override // android.view.Menu
    public final int size() {
        return this.f83305g.size();
    }

    @Override // android.view.Menu
    public final SubMenu addSubMenu(int i5) {
        return this.f83305g.addSubMenu(i5);
    }

    @Override // android.view.Menu
    public final MenuItem add(int i5) {
        return n(this.f83305g.add(i5));
    }

    @Override // android.view.Menu
    public final SubMenu addSubMenu(int i5, int i11, int i12, CharSequence charSequence) {
        return this.f83305g.addSubMenu(i5, i11, i12, charSequence);
    }

    @Override // android.view.Menu
    public final MenuItem add(int i5, int i11, int i12, CharSequence charSequence) {
        return n(this.f83305g.a(i5, i11, i12, charSequence));
    }

    @Override // android.view.Menu
    public final SubMenu addSubMenu(int i5, int i11, int i12, int i13) {
        return this.f83305g.addSubMenu(i5, i11, i12, i13);
    }

    @Override // android.view.Menu
    public final MenuItem add(int i5, int i11, int i12, int i13) {
        return n(this.f83305g.add(i5, i11, i12, i13));
    }
}
