package q;

import android.content.Context;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.view.ActionProvider;
import android.view.ContextMenu;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.SubMenu;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import androidx.recyclerview.widget.u1;
import e10.z2;
import java.util.ArrayList;

/* loaded from: classes2.dex */
public final class m implements t4.a {
    public n A;
    public MenuItem.OnActionExpandListener B;

    /* renamed from: a, reason: collision with root package name */
    public final int f83257a;

    /* renamed from: b, reason: collision with root package name */
    public final int f83258b;

    /* renamed from: c, reason: collision with root package name */
    public final int f83259c;

    /* renamed from: d, reason: collision with root package name */
    public final int f83260d;

    /* renamed from: e, reason: collision with root package name */
    public CharSequence f83261e;

    /* renamed from: f, reason: collision with root package name */
    public CharSequence f83262f;

    /* renamed from: g, reason: collision with root package name */
    public Intent f83263g;

    /* renamed from: h, reason: collision with root package name */
    public char f83264h;

    /* renamed from: j, reason: collision with root package name */
    public char f83266j;

    /* renamed from: l, reason: collision with root package name */
    public Drawable f83268l;
    public final k n;
    public c0 o;

    /* renamed from: p, reason: collision with root package name */
    public MenuItem.OnMenuItemClickListener f83270p;

    /* renamed from: q, reason: collision with root package name */
    public CharSequence f83271q;

    /* renamed from: r, reason: collision with root package name */
    public CharSequence f83272r;

    /* renamed from: y, reason: collision with root package name */
    public int f83279y;

    /* renamed from: z, reason: collision with root package name */
    public View f83280z;

    /* renamed from: i, reason: collision with root package name */
    public int f83265i = u1.FLAG_APPEARED_IN_PRE_LAYOUT;

    /* renamed from: k, reason: collision with root package name */
    public int f83267k = u1.FLAG_APPEARED_IN_PRE_LAYOUT;

    /* renamed from: m, reason: collision with root package name */
    public int f83269m = 0;

    /* renamed from: s, reason: collision with root package name */
    public ColorStateList f83273s = null;

    /* renamed from: t, reason: collision with root package name */
    public PorterDuff.Mode f83274t = null;

    /* renamed from: u, reason: collision with root package name */
    public boolean f83275u = false;

    /* renamed from: v, reason: collision with root package name */
    public boolean f83276v = false;

    /* renamed from: w, reason: collision with root package name */
    public boolean f83277w = false;

    /* renamed from: x, reason: collision with root package name */
    public int f83278x = 16;
    public boolean C = false;

    public m(k kVar, int i5, int i11, int i12, int i13, CharSequence charSequence, int i14) {
        this.n = kVar;
        this.f83257a = i11;
        this.f83258b = i5;
        this.f83259c = i12;
        this.f83260d = i13;
        this.f83261e = charSequence;
        this.f83279y = i14;
    }

    public static void a(int i5, int i11, String str, StringBuilder sb2) {
        if ((i5 & i11) == i11) {
            sb2.append(str);
        }
    }

    @Override // t4.a
    public final n b() {
        return this.A;
    }

    @Override // t4.a
    public final t4.a c(n nVar) {
        this.f83280z = null;
        this.A = nVar;
        this.n.p(true);
        n nVar2 = this.A;
        if (nVar2 != null) {
            nVar2.f83282b = new c(this, 1);
            nVar2.f83283c.setVisibilityListener(nVar2);
        }
        return this;
    }

    @Override // android.view.MenuItem
    public final boolean collapseActionView() {
        if ((this.f83279y & 8) == 0) {
            return false;
        }
        if (this.f83280z == null) {
            return true;
        }
        MenuItem.OnActionExpandListener onActionExpandListener = this.B;
        if (onActionExpandListener == null || onActionExpandListener.onMenuItemActionCollapse(this)) {
            return this.n.d(this);
        }
        return false;
    }

    public final Drawable d(Drawable drawable) {
        if (drawable != null && this.f83277w && (this.f83275u || this.f83276v)) {
            drawable = drawable.mutate();
            if (this.f83275u) {
                drawable.setTintList(this.f83273s);
            }
            if (this.f83276v) {
                drawable.setTintMode(this.f83274t);
            }
            this.f83277w = false;
        }
        return drawable;
    }

    public final boolean e() {
        n nVar;
        if ((this.f83279y & 8) != 0) {
            if (this.f83280z == null && (nVar = this.A) != null) {
                this.f83280z = nVar.f83283c.onCreateActionView(this);
            }
            if (this.f83280z != null) {
                return true;
            }
        }
        return false;
    }

    @Override // android.view.MenuItem
    public final boolean expandActionView() {
        if (!e()) {
            return false;
        }
        MenuItem.OnActionExpandListener onActionExpandListener = this.B;
        if (onActionExpandListener == null || onActionExpandListener.onMenuItemActionExpand(this)) {
            return this.n.f(this);
        }
        return false;
    }

    public final void f(boolean z11) {
        if (z11) {
            this.f83278x |= 32;
        } else {
            this.f83278x &= -33;
        }
    }

    @Override // android.view.MenuItem
    public final ActionProvider getActionProvider() {
        throw new UnsupportedOperationException("This is not supported, use MenuItemCompat.getActionProvider()");
    }

    @Override // android.view.MenuItem
    public final View getActionView() {
        View view = this.f83280z;
        if (view != null) {
            return view;
        }
        n nVar = this.A;
        if (nVar == null) {
            return null;
        }
        View viewOnCreateActionView = nVar.f83283c.onCreateActionView(this);
        this.f83280z = viewOnCreateActionView;
        return viewOnCreateActionView;
    }

    @Override // t4.a, android.view.MenuItem
    public final int getAlphabeticModifiers() {
        return this.f83267k;
    }

    @Override // android.view.MenuItem
    public final char getAlphabeticShortcut() {
        return this.f83266j;
    }

    @Override // t4.a, android.view.MenuItem
    public final CharSequence getContentDescription() {
        return this.f83271q;
    }

    @Override // android.view.MenuItem
    public final int getGroupId() {
        return this.f83258b;
    }

    @Override // android.view.MenuItem
    public final Drawable getIcon() {
        Drawable drawable = this.f83268l;
        if (drawable != null) {
            return d(drawable);
        }
        int i5 = this.f83269m;
        if (i5 == 0) {
            return null;
        }
        Drawable drawableB0 = z2.b0(this.n.f83232a, i5);
        this.f83269m = 0;
        this.f83268l = drawableB0;
        return d(drawableB0);
    }

    @Override // t4.a, android.view.MenuItem
    public final ColorStateList getIconTintList() {
        return this.f83273s;
    }

    @Override // t4.a, android.view.MenuItem
    public final PorterDuff.Mode getIconTintMode() {
        return this.f83274t;
    }

    @Override // android.view.MenuItem
    public final Intent getIntent() {
        return this.f83263g;
    }

    @Override // android.view.MenuItem
    public final int getItemId() {
        return this.f83257a;
    }

    @Override // android.view.MenuItem
    public final ContextMenu.ContextMenuInfo getMenuInfo() {
        return null;
    }

    @Override // t4.a, android.view.MenuItem
    public final int getNumericModifiers() {
        return this.f83265i;
    }

    @Override // android.view.MenuItem
    public final char getNumericShortcut() {
        return this.f83264h;
    }

    @Override // android.view.MenuItem
    public final int getOrder() {
        return this.f83259c;
    }

    @Override // android.view.MenuItem
    public final SubMenu getSubMenu() {
        return this.o;
    }

    @Override // android.view.MenuItem
    public final CharSequence getTitle() {
        return this.f83261e;
    }

    @Override // android.view.MenuItem
    public final CharSequence getTitleCondensed() {
        CharSequence charSequence = this.f83262f;
        return charSequence != null ? charSequence : this.f83261e;
    }

    @Override // t4.a, android.view.MenuItem
    public final CharSequence getTooltipText() {
        return this.f83272r;
    }

    @Override // android.view.MenuItem
    public final boolean hasSubMenu() {
        return this.o != null;
    }

    @Override // android.view.MenuItem
    public final boolean isActionViewExpanded() {
        return this.C;
    }

    @Override // android.view.MenuItem
    public final boolean isCheckable() {
        return (this.f83278x & 1) == 1;
    }

    @Override // android.view.MenuItem
    public final boolean isChecked() {
        return (this.f83278x & 2) == 2;
    }

    @Override // android.view.MenuItem
    public final boolean isEnabled() {
        return (this.f83278x & 16) != 0;
    }

    @Override // android.view.MenuItem
    public final boolean isVisible() {
        n nVar = this.A;
        return (nVar == null || !nVar.f83283c.overridesItemVisibility()) ? (this.f83278x & 8) == 0 : (this.f83278x & 8) == 0 && this.A.f83283c.isVisible();
    }

    @Override // android.view.MenuItem
    public final MenuItem setActionProvider(ActionProvider actionProvider) {
        throw new UnsupportedOperationException("This is not supported, use MenuItemCompat.setActionProvider()");
    }

    @Override // android.view.MenuItem
    public final MenuItem setActionView(View view) {
        int i5;
        this.f83280z = view;
        this.A = null;
        if (view != null && view.getId() == -1 && (i5 = this.f83257a) > 0) {
            view.setId(i5);
        }
        k kVar = this.n;
        kVar.f83242k = true;
        kVar.p(true);
        return this;
    }

    @Override // android.view.MenuItem
    public final MenuItem setAlphabeticShortcut(char c11) {
        if (this.f83266j == c11) {
            return this;
        }
        this.f83266j = Character.toLowerCase(c11);
        this.n.p(false);
        return this;
    }

    @Override // android.view.MenuItem
    public final MenuItem setCheckable(boolean z11) {
        int i5 = this.f83278x;
        int i11 = (z11 ? 1 : 0) | (i5 & (-2));
        this.f83278x = i11;
        if (i5 != i11) {
            this.n.p(false);
        }
        return this;
    }

    @Override // android.view.MenuItem
    public final MenuItem setChecked(boolean z11) {
        int i5 = this.f83278x;
        int i11 = i5 & 4;
        k kVar = this.n;
        if (i11 == 0) {
            int i12 = (i5 & (-3)) | (z11 ? 2 : 0);
            this.f83278x = i12;
            if (i5 != i12) {
                kVar.p(false);
            }
            return this;
        }
        ArrayList arrayList = kVar.f83237f;
        int size = arrayList.size();
        kVar.w();
        for (int i13 = 0; i13 < size; i13++) {
            m mVar = (m) arrayList.get(i13);
            if (mVar.f83258b == this.f83258b && (mVar.f83278x & 4) != 0 && mVar.isCheckable()) {
                boolean z12 = mVar == this;
                int i14 = mVar.f83278x;
                int i15 = (z12 ? 2 : 0) | (i14 & (-3));
                mVar.f83278x = i15;
                if (i14 != i15) {
                    mVar.n.p(false);
                }
            }
        }
        kVar.v();
        return this;
    }

    @Override // android.view.MenuItem
    public final /* bridge */ /* synthetic */ MenuItem setContentDescription(CharSequence charSequence) {
        setContentDescription(charSequence);
        return this;
    }

    @Override // android.view.MenuItem
    public final MenuItem setEnabled(boolean z11) {
        if (z11) {
            this.f83278x |= 16;
        } else {
            this.f83278x &= -17;
        }
        this.n.p(false);
        return this;
    }

    @Override // android.view.MenuItem
    public final MenuItem setIcon(Drawable drawable) {
        this.f83269m = 0;
        this.f83268l = drawable;
        this.f83277w = true;
        this.n.p(false);
        return this;
    }

    @Override // t4.a, android.view.MenuItem
    public final MenuItem setIconTintList(ColorStateList colorStateList) {
        this.f83273s = colorStateList;
        this.f83275u = true;
        this.f83277w = true;
        this.n.p(false);
        return this;
    }

    @Override // t4.a, android.view.MenuItem
    public final MenuItem setIconTintMode(PorterDuff.Mode mode) {
        this.f83274t = mode;
        this.f83276v = true;
        this.f83277w = true;
        this.n.p(false);
        return this;
    }

    @Override // android.view.MenuItem
    public final MenuItem setIntent(Intent intent) {
        this.f83263g = intent;
        return this;
    }

    @Override // android.view.MenuItem
    public final MenuItem setNumericShortcut(char c11) {
        if (this.f83264h == c11) {
            return this;
        }
        this.f83264h = c11;
        this.n.p(false);
        return this;
    }

    @Override // android.view.MenuItem
    public final MenuItem setOnActionExpandListener(MenuItem.OnActionExpandListener onActionExpandListener) {
        this.B = onActionExpandListener;
        return this;
    }

    @Override // android.view.MenuItem
    public final MenuItem setOnMenuItemClickListener(MenuItem.OnMenuItemClickListener onMenuItemClickListener) {
        this.f83270p = onMenuItemClickListener;
        return this;
    }

    @Override // android.view.MenuItem
    public final MenuItem setShortcut(char c11, char c12) {
        this.f83264h = c11;
        this.f83266j = Character.toLowerCase(c12);
        this.n.p(false);
        return this;
    }

    @Override // android.view.MenuItem
    public final void setShowAsAction(int i5) {
        int i11 = i5 & 3;
        if (i11 != 0 && i11 != 1 && i11 != 2) {
            throw new IllegalArgumentException("SHOW_AS_ACTION_ALWAYS, SHOW_AS_ACTION_IF_ROOM, and SHOW_AS_ACTION_NEVER are mutually exclusive.");
        }
        this.f83279y = i5;
        k kVar = this.n;
        kVar.f83242k = true;
        kVar.p(true);
    }

    @Override // android.view.MenuItem
    public final MenuItem setShowAsActionFlags(int i5) {
        setShowAsAction(i5);
        return this;
    }

    @Override // android.view.MenuItem
    public final MenuItem setTitle(CharSequence charSequence) {
        this.f83261e = charSequence;
        this.n.p(false);
        c0 c0Var = this.o;
        if (c0Var != null) {
            c0Var.setHeaderTitle(charSequence);
        }
        return this;
    }

    @Override // android.view.MenuItem
    public final MenuItem setTitleCondensed(CharSequence charSequence) {
        this.f83262f = charSequence;
        this.n.p(false);
        return this;
    }

    @Override // android.view.MenuItem
    public final /* bridge */ /* synthetic */ MenuItem setTooltipText(CharSequence charSequence) {
        setTooltipText(charSequence);
        return this;
    }

    @Override // android.view.MenuItem
    public final MenuItem setVisible(boolean z11) {
        int i5 = this.f83278x;
        int i11 = (z11 ? 0 : 8) | (i5 & (-9));
        this.f83278x = i11;
        if (i5 != i11) {
            k kVar = this.n;
            kVar.f83239h = true;
            kVar.p(true);
        }
        return this;
    }

    public final String toString() {
        CharSequence charSequence = this.f83261e;
        if (charSequence != null) {
            return charSequence.toString();
        }
        return null;
    }

    @Override // t4.a, android.view.MenuItem
    public final t4.a setContentDescription(CharSequence charSequence) {
        this.f83271q = charSequence;
        this.n.p(false);
        return this;
    }

    @Override // t4.a, android.view.MenuItem
    public final t4.a setTooltipText(CharSequence charSequence) {
        this.f83272r = charSequence;
        this.n.p(false);
        return this;
    }

    @Override // t4.a, android.view.MenuItem
    public final MenuItem setAlphabeticShortcut(char c11, int i5) {
        if (this.f83266j == c11 && this.f83267k == i5) {
            return this;
        }
        this.f83266j = Character.toLowerCase(c11);
        this.f83267k = KeyEvent.normalizeMetaState(i5);
        this.n.p(false);
        return this;
    }

    @Override // t4.a, android.view.MenuItem
    public final MenuItem setNumericShortcut(char c11, int i5) {
        if (this.f83264h == c11 && this.f83265i == i5) {
            return this;
        }
        this.f83264h = c11;
        this.f83265i = KeyEvent.normalizeMetaState(i5);
        this.n.p(false);
        return this;
    }

    @Override // t4.a, android.view.MenuItem
    public final MenuItem setShortcut(char c11, char c12, int i5, int i11) {
        this.f83264h = c11;
        this.f83265i = KeyEvent.normalizeMetaState(i5);
        this.f83266j = Character.toLowerCase(c12);
        this.f83267k = KeyEvent.normalizeMetaState(i11);
        this.n.p(false);
        return this;
    }

    @Override // android.view.MenuItem
    public final MenuItem setIcon(int i5) {
        this.f83268l = null;
        this.f83269m = i5;
        this.f83277w = true;
        this.n.p(false);
        return this;
    }

    @Override // android.view.MenuItem
    public final MenuItem setTitle(int i5) {
        setTitle(this.n.f83232a.getString(i5));
        return this;
    }

    @Override // android.view.MenuItem
    public final MenuItem setActionView(int i5) {
        int i11;
        k kVar = this.n;
        Context context = kVar.f83232a;
        View viewInflate = LayoutInflater.from(context).inflate(i5, (ViewGroup) new LinearLayout(context), false);
        this.f83280z = viewInflate;
        this.A = null;
        if (viewInflate != null && viewInflate.getId() == -1 && (i11 = this.f83257a) > 0) {
            viewInflate.setId(i11);
        }
        kVar.f83242k = true;
        kVar.p(true);
        return this;
    }
}
