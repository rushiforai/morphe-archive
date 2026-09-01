package defpackage;

import android.R;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Build;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class i10 extends m15 implements l10 {
    public f20 f;

    public i10() {
        n1 n1Var = (n1) this;
        getSavedStateRegistry().c("androidx:appcompat", new g10(n1Var));
        addOnContextAvailableListener(new h10(n1Var, 0));
    }

    @Override // defpackage.xy1, android.app.Activity
    public final void addContentView(View view, ViewGroup.LayoutParams layoutParams) {
        initializeViewTreeOwners();
        f20 f20Var = (f20) o();
        f20Var.v();
        ((ViewGroup) f20Var.A.findViewById(R.id.content)).addView(view, layoutParams);
        f20Var.m.a(f20Var.l.getCallback());
    }

    /* JADX WARN: Removed duplicated region for block: B:44:0x0092  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x009e  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00a4  */
    @Override // android.app.Activity, android.view.ContextThemeWrapper, android.content.ContextWrapper
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void attachBaseContext(android.content.Context r10) {
        /*
            Method dump skipped, instruction units count: 480
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.i10.attachBaseContext(android.content.Context):void");
    }

    @Override // android.app.Activity
    public final void closeOptionsMenu() {
        ((f20) o()).A();
        if (getWindow().hasFeature(0)) {
            super.closeOptionsMenu();
        }
    }

    @Override // defpackage.wy1, android.app.Activity, android.view.Window.Callback
    public final boolean dispatchKeyEvent(KeyEvent keyEvent) {
        keyEvent.getKeyCode();
        ((f20) o()).A();
        return super.dispatchKeyEvent(keyEvent);
    }

    @Override // android.app.Activity
    public final View findViewById(int i) {
        f20 f20Var = (f20) o();
        f20Var.v();
        return f20Var.l.findViewById(i);
    }

    @Override // android.app.Activity
    public final MenuInflater getMenuInflater() {
        f20 f20Var = (f20) o();
        r2d r2dVar = f20Var.o;
        if (r2dVar == null) {
            f20Var.A();
            v3f v3fVar = f20Var.n;
            r2dVar = new r2d(v3fVar != null ? v3fVar.b() : f20Var.k);
            f20Var.o = r2dVar;
        }
        return r2dVar;
    }

    @Override // android.view.ContextThemeWrapper, android.content.ContextWrapper, android.content.Context
    public final Resources getResources() {
        int i = dre.a;
        return super.getResources();
    }

    @Override // android.app.Activity
    public final void invalidateOptionsMenu() {
        f20 f20Var = (f20) o();
        if (f20Var.n != null) {
            f20Var.A();
            f20Var.n.getClass();
            f20Var.B(0);
        }
    }

    public final t10 o() {
        f20 f20Var = this.f;
        if (f20Var != null) {
            return f20Var;
        }
        s10 s10Var = t10.a;
        f20 f20Var2 = new f20(this, null, this, this);
        this.f = f20Var2;
        return f20Var2;
    }

    @Override // defpackage.xy1, android.app.Activity, android.content.ComponentCallbacks
    public final void onConfigurationChanged(Configuration configuration) throws IllegalAccessException {
        super.onConfigurationChanged(configuration);
        f20 f20Var = (f20) o();
        if (f20Var.F && f20Var.z) {
            f20Var.A();
            v3f v3fVar = f20Var.n;
            if (v3fVar != null) {
                v3fVar.e(v3fVar.a.getResources().getBoolean(com.medium.reader.R.bool.abc_action_bar_embed_tabs));
            }
        }
        j20 j20VarA = j20.a();
        Context context = f20Var.k;
        synchronized (j20VarA) {
            j20VarA.a.l(context);
        }
        f20Var.R = new Configuration(f20Var.k.getResources().getConfiguration());
        f20Var.m(false, false);
    }

    @Override // defpackage.m15, android.app.Activity
    public void onDestroy() {
        super.onDestroy();
        o().e();
    }

    @Override // android.app.Activity, android.view.KeyEvent.Callback
    public final boolean onKeyDown(int i, KeyEvent keyEvent) {
        Window window;
        if (Build.VERSION.SDK_INT >= 26 || keyEvent.isCtrlPressed() || KeyEvent.metaStateHasNoModifiers(keyEvent.getMetaState()) || keyEvent.getRepeatCount() != 0 || KeyEvent.isModifierKey(keyEvent.getKeyCode()) || (window = getWindow()) == null || window.getDecorView() == null || !window.getDecorView().dispatchKeyShortcutEvent(keyEvent)) {
            return super.onKeyDown(i, keyEvent);
        }
        return true;
    }

    @Override // defpackage.m15, defpackage.xy1, android.app.Activity, android.view.Window.Callback
    public final boolean onMenuItemSelected(int i, MenuItem menuItem) {
        if (super.onMenuItemSelected(i, menuItem)) {
            return true;
        }
        f20 f20Var = (f20) o();
        f20Var.A();
        v3f v3fVar = f20Var.n;
        if (menuItem.getItemId() != 16908332 || v3fVar == null || (((bod) v3fVar.e).b & 4) == 0) {
            return false;
        }
        return p();
    }

    @Override // android.app.Activity
    public final void onPostCreate(Bundle bundle) {
        super.onPostCreate(bundle);
        ((f20) o()).v();
    }

    @Override // defpackage.m15, android.app.Activity
    public final void onPostResume() {
        super.onPostResume();
        f20 f20Var = (f20) o();
        f20Var.A();
        v3f v3fVar = f20Var.n;
        if (v3fVar != null) {
            v3fVar.t = true;
        }
    }

    @Override // defpackage.m15, android.app.Activity
    public void onStart() throws IllegalAccessException {
        super.onStart();
        ((f20) o()).m(true, false);
    }

    @Override // defpackage.m15, android.app.Activity
    public void onStop() {
        super.onStop();
        f20 f20Var = (f20) o();
        f20Var.A();
        v3f v3fVar = f20Var.n;
        if (v3fVar != null) {
            v3fVar.t = false;
            kve kveVar = v3fVar.s;
            if (kveVar != null) {
                kveVar.a();
            }
        }
    }

    @Override // android.app.Activity
    public final void onTitleChanged(CharSequence charSequence, int i) {
        super.onTitleChanged(charSequence, i);
        o().l(charSequence);
    }

    @Override // android.app.Activity
    public final void openOptionsMenu() {
        ((f20) o()).A();
        if (getWindow().hasFeature(0)) {
            super.openOptionsMenu();
        }
    }

    public boolean p() {
        Intent intentA = hp7.A(this);
        if (intentA == null) {
            return false;
        }
        if (!shouldUpRecreateTask(intentA)) {
            navigateUpTo(intentA);
            return true;
        }
        xhg xhgVar = new xhg(this);
        Intent intentA2 = hp7.A(this);
        if (intentA2 == null) {
            intentA2 = hp7.A(this);
        }
        if (intentA2 != null) {
            ComponentName component = intentA2.getComponent();
            if (component == null) {
                component = intentA2.resolveActivity(((Context) xhgVar.c).getPackageManager());
            }
            xhgVar.d(component);
            ((ArrayList) xhgVar.b).add(intentA2);
        }
        xhgVar.e();
        try {
            finishAffinity();
            return true;
        } catch (IllegalStateException unused) {
            finish();
            return true;
        }
    }

    @Override // defpackage.xy1, android.app.Activity
    public final void setContentView(int i) {
        initializeViewTreeOwners();
        o().h(i);
    }

    @Override // android.app.Activity, android.view.ContextThemeWrapper, android.content.ContextWrapper, android.content.Context
    public final void setTheme(int i) {
        super.setTheme(i);
        ((f20) o()).X = i;
    }

    @Override // defpackage.xy1, android.app.Activity
    public void setContentView(View view) {
        initializeViewTreeOwners();
        o().i(view);
    }

    @Override // defpackage.xy1, android.app.Activity
    public final void setContentView(View view, ViewGroup.LayoutParams layoutParams) {
        initializeViewTreeOwners();
        o().j(view, layoutParams);
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public final void onContentChanged() {
    }
}
