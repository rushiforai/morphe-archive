package q;

import android.content.Context;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.view.ActionProvider;
import android.view.ContextMenu;
import android.view.KeyEvent;
import android.view.MenuItem;
import android.view.SubMenu;
import android.view.View;

/* loaded from: classes2.dex */
public final class a implements t4.a {

    /* renamed from: a, reason: collision with root package name */
    public CharSequence f83155a;

    /* renamed from: b, reason: collision with root package name */
    public CharSequence f83156b;

    /* renamed from: c, reason: collision with root package name */
    public Intent f83157c;

    /* renamed from: d, reason: collision with root package name */
    public char f83158d;

    /* renamed from: e, reason: collision with root package name */
    public int f83159e;

    /* renamed from: f, reason: collision with root package name */
    public char f83160f;

    /* renamed from: g, reason: collision with root package name */
    public int f83161g;

    /* renamed from: h, reason: collision with root package name */
    public Drawable f83162h;

    /* renamed from: i, reason: collision with root package name */
    public Context f83163i;

    /* renamed from: j, reason: collision with root package name */
    public CharSequence f83164j;

    /* renamed from: k, reason: collision with root package name */
    public CharSequence f83165k;

    /* renamed from: l, reason: collision with root package name */
    public ColorStateList f83166l;

    /* renamed from: m, reason: collision with root package name */
    public PorterDuff.Mode f83167m;
    public boolean n;
    public boolean o;

    /* renamed from: p, reason: collision with root package name */
    public int f83168p;

    public final void a() {
        Drawable drawable = this.f83162h;
        if (drawable != null) {
            if (this.n || this.o) {
                this.f83162h = drawable;
                Drawable drawableMutate = drawable.mutate();
                this.f83162h = drawableMutate;
                if (this.n) {
                    drawableMutate.setTintList(this.f83166l);
                }
                if (this.o) {
                    this.f83162h.setTintMode(this.f83167m);
                }
            }
        }
    }

    @Override // t4.a
    public final n b() {
        return null;
    }

    @Override // t4.a
    public final t4.a c(n nVar) {
        throw new UnsupportedOperationException();
    }

    @Override // android.view.MenuItem
    public final boolean collapseActionView() {
        return false;
    }

    @Override // android.view.MenuItem
    public final boolean expandActionView() {
        return false;
    }

    @Override // android.view.MenuItem
    public final ActionProvider getActionProvider() {
        throw new UnsupportedOperationException();
    }

    @Override // android.view.MenuItem
    public final View getActionView() {
        return null;
    }

    @Override // t4.a, android.view.MenuItem
    public final int getAlphabeticModifiers() {
        return this.f83161g;
    }

    @Override // android.view.MenuItem
    public final char getAlphabeticShortcut() {
        return this.f83160f;
    }

    @Override // t4.a, android.view.MenuItem
    public final CharSequence getContentDescription() {
        return this.f83164j;
    }

    @Override // android.view.MenuItem
    public final int getGroupId() {
        return 0;
    }

    @Override // android.view.MenuItem
    public final Drawable getIcon() {
        return this.f83162h;
    }

    @Override // t4.a, android.view.MenuItem
    public final ColorStateList getIconTintList() {
        return this.f83166l;
    }

    @Override // t4.a, android.view.MenuItem
    public final PorterDuff.Mode getIconTintMode() {
        return this.f83167m;
    }

    @Override // android.view.MenuItem
    public final Intent getIntent() {
        return this.f83157c;
    }

    @Override // android.view.MenuItem
    public final int getItemId() {
        return 16908332;
    }

    @Override // android.view.MenuItem
    public final ContextMenu.ContextMenuInfo getMenuInfo() {
        return null;
    }

    @Override // t4.a, android.view.MenuItem
    public final int getNumericModifiers() {
        return this.f83159e;
    }

    @Override // android.view.MenuItem
    public final char getNumericShortcut() {
        return this.f83158d;
    }

    @Override // android.view.MenuItem
    public final int getOrder() {
        return 0;
    }

    @Override // android.view.MenuItem
    public final SubMenu getSubMenu() {
        return null;
    }

    @Override // android.view.MenuItem
    public final CharSequence getTitle() {
        return this.f83155a;
    }

    @Override // android.view.MenuItem
    public final CharSequence getTitleCondensed() {
        CharSequence charSequence = this.f83156b;
        return charSequence != null ? charSequence : this.f83155a;
    }

    @Override // t4.a, android.view.MenuItem
    public final CharSequence getTooltipText() {
        return this.f83165k;
    }

    @Override // android.view.MenuItem
    public final boolean hasSubMenu() {
        return false;
    }

    @Override // android.view.MenuItem
    public final boolean isActionViewExpanded() {
        return false;
    }

    @Override // android.view.MenuItem
    public final boolean isCheckable() {
        return (this.f83168p & 1) != 0;
    }

    @Override // android.view.MenuItem
    public final boolean isChecked() {
        return (this.f83168p & 2) != 0;
    }

    @Override // android.view.MenuItem
    public final boolean isEnabled() {
        return (this.f83168p & 16) != 0;
    }

    @Override // android.view.MenuItem
    public final boolean isVisible() {
        return (this.f83168p & 8) == 0;
    }

    @Override // android.view.MenuItem
    public final MenuItem setActionProvider(ActionProvider actionProvider) {
        throw new UnsupportedOperationException();
    }

    @Override // android.view.MenuItem
    public final MenuItem setActionView(View view) {
        throw new UnsupportedOperationException();
    }

    @Override // android.view.MenuItem
    public final MenuItem setAlphabeticShortcut(char c11) {
        this.f83160f = Character.toLowerCase(c11);
        return this;
    }

    @Override // android.view.MenuItem
    public final MenuItem setCheckable(boolean z11) {
        this.f83168p = (z11 ? 1 : 0) | (this.f83168p & (-2));
        return this;
    }

    @Override // android.view.MenuItem
    public final MenuItem setChecked(boolean z11) {
        this.f83168p = (z11 ? 2 : 0) | (this.f83168p & (-3));
        return this;
    }

    @Override // android.view.MenuItem
    public final MenuItem setContentDescription(CharSequence charSequence) {
        this.f83164j = charSequence;
        return this;
    }

    @Override // android.view.MenuItem
    public final MenuItem setEnabled(boolean z11) {
        this.f83168p = (z11 ? 16 : 0) | (this.f83168p & (-17));
        return this;
    }

    @Override // android.view.MenuItem
    public final MenuItem setIcon(Drawable drawable) {
        this.f83162h = drawable;
        a();
        return this;
    }

    @Override // t4.a, android.view.MenuItem
    public final MenuItem setIconTintList(ColorStateList colorStateList) {
        this.f83166l = colorStateList;
        this.n = true;
        a();
        return this;
    }

    @Override // t4.a, android.view.MenuItem
    public final MenuItem setIconTintMode(PorterDuff.Mode mode) {
        this.f83167m = mode;
        this.o = true;
        a();
        return this;
    }

    @Override // android.view.MenuItem
    public final MenuItem setIntent(Intent intent) {
        this.f83157c = intent;
        return this;
    }

    @Override // android.view.MenuItem
    public final MenuItem setNumericShortcut(char c11) {
        this.f83158d = c11;
        return this;
    }

    @Override // android.view.MenuItem
    public final MenuItem setOnActionExpandListener(MenuItem.OnActionExpandListener onActionExpandListener) {
        throw new UnsupportedOperationException();
    }

    @Override // android.view.MenuItem
    public final MenuItem setOnMenuItemClickListener(MenuItem.OnMenuItemClickListener onMenuItemClickListener) {
        return this;
    }

    @Override // android.view.MenuItem
    public final MenuItem setShortcut(char c11, char c12) {
        this.f83158d = c11;
        this.f83160f = Character.toLowerCase(c12);
        return this;
    }

    @Override // android.view.MenuItem
    public final void setShowAsAction(int i5) {
    }

    @Override // android.view.MenuItem
    public final MenuItem setShowAsActionFlags(int i5) {
        return this;
    }

    @Override // android.view.MenuItem
    public final MenuItem setTitle(CharSequence charSequence) {
        this.f83155a = charSequence;
        return this;
    }

    @Override // android.view.MenuItem
    public final MenuItem setTitleCondensed(CharSequence charSequence) {
        this.f83156b = charSequence;
        return this;
    }

    @Override // android.view.MenuItem
    public final MenuItem setTooltipText(CharSequence charSequence) {
        this.f83165k = charSequence;
        return this;
    }

    @Override // android.view.MenuItem
    public final MenuItem setVisible(boolean z11) {
        this.f83168p = (this.f83168p & 8) | (z11 ? 0 : 8);
        return this;
    }

    @Override // android.view.MenuItem
    public final MenuItem setActionView(int i5) {
        throw new UnsupportedOperationException();
    }

    @Override // t4.a, android.view.MenuItem
    public final MenuItem setAlphabeticShortcut(char c11, int i5) {
        this.f83160f = Character.toLowerCase(c11);
        this.f83161g = KeyEvent.normalizeMetaState(i5);
        return this;
    }

    @Override // t4.a, android.view.MenuItem
    public final t4.a setContentDescription(CharSequence charSequence) {
        this.f83164j = charSequence;
        return this;
    }

    @Override // t4.a, android.view.MenuItem
    public final MenuItem setNumericShortcut(char c11, int i5) {
        this.f83158d = c11;
        this.f83159e = KeyEvent.normalizeMetaState(i5);
        return this;
    }

    @Override // android.view.MenuItem
    public final MenuItem setTitle(int i5) {
        this.f83155a = this.f83163i.getResources().getString(i5);
        return this;
    }

    @Override // t4.a, android.view.MenuItem
    public final t4.a setTooltipText(CharSequence charSequence) {
        this.f83165k = charSequence;
        return this;
    }

    @Override // android.view.MenuItem
    public final MenuItem setIcon(int i5) {
        this.f83162h = this.f83163i.getDrawable(i5);
        a();
        return this;
    }

    @Override // t4.a, android.view.MenuItem
    public final MenuItem setShortcut(char c11, char c12, int i5, int i11) {
        this.f83158d = c11;
        this.f83159e = KeyEvent.normalizeMetaState(i5);
        this.f83160f = Character.toLowerCase(c12);
        this.f83161g = KeyEvent.normalizeMetaState(i11);
        return this;
    }
}
