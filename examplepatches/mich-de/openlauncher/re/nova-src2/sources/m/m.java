package m;

import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import androidx.appcompat.widget.Toolbar;
import h6.y0;
import n4.u0;
import n4.v0;
import r.n2;

/* loaded from: classes.dex */
public abstract class m extends androidx.fragment.app.m0 implements n, u0 {
    private static final String DELEGATE_TAG = "androidx:appcompat";
    private s mDelegate;
    private Resources mResources;

    public m() {
        getSavedStateRegistry().b(DELEGATE_TAG, new a7.a(this));
        addOnContextAvailableListener(new l(this));
    }

    public final void Y() {
        y0.f(getWindow().getDecorView(), this);
        y0.g(getWindow().getDecorView(), this);
        u90.b.a0(getWindow().getDecorView(), this);
        fg.a.O(getWindow().getDecorView(), this);
    }

    @Override // g.o, android.app.Activity
    public void addContentView(View view, ViewGroup.LayoutParams layoutParams) {
        Y();
        getDelegate().b(view, layoutParams);
    }

    @Override // android.app.Activity, android.view.ContextThemeWrapper, android.content.ContextWrapper
    public void attachBaseContext(Context context) {
        super.attachBaseContext(getDelegate().e(context));
    }

    @Override // android.app.Activity
    public void closeOptionsMenu() {
        b supportActionBar = getSupportActionBar();
        if (getWindow().hasFeature(0)) {
            if (supportActionBar == null || !supportActionBar.a()) {
                super.closeOptionsMenu();
            }
        }
    }

    @Override // n4.i, android.app.Activity, android.view.Window.Callback
    public boolean dispatchKeyEvent(KeyEvent keyEvent) {
        int keyCode = keyEvent.getKeyCode();
        b supportActionBar = getSupportActionBar();
        if (keyCode == 82 && supportActionBar != null && supportActionBar.k(keyEvent)) {
            return true;
        }
        return super.dispatchKeyEvent(keyEvent);
    }

    @Override // android.app.Activity
    public <T extends View> T findViewById(int i5) {
        return (T) getDelegate().f(i5);
    }

    public s getDelegate() {
        if (this.mDelegate == null) {
            q qVar = s.f75338a;
            this.mDelegate = new f0(this, this);
        }
        return this.mDelegate;
    }

    public c getDrawerToggleDelegate() {
        return getDelegate().i();
    }

    @Override // android.app.Activity
    public MenuInflater getMenuInflater() {
        return getDelegate().j();
    }

    @Override // android.view.ContextThemeWrapper, android.content.ContextWrapper, android.content.Context
    public Resources getResources() {
        Resources resources = this.mResources;
        if (resources == null) {
            int i5 = n2.f84827a;
        }
        return resources == null ? super.getResources() : resources;
    }

    public b getSupportActionBar() {
        return getDelegate().k();
    }

    @Override // n4.u0
    public Intent getSupportParentActivityIntent() {
        return n4.f.c(this);
    }

    @Override // android.app.Activity
    public void invalidateOptionsMenu() {
        getDelegate().m();
    }

    @Override // g.o, android.app.Activity, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        getDelegate().o(configuration);
        if (this.mResources != null) {
            this.mResources.updateConfiguration(super.getResources().getConfiguration(), super.getResources().getDisplayMetrics());
        }
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public void onContentChanged() {
        onSupportContentChanged();
    }

    public void onCreateSupportNavigateUpTaskStack(v0 v0Var) {
        v0Var.c(this);
    }

    @Override // androidx.fragment.app.m0, android.app.Activity
    public void onDestroy() {
        super.onDestroy();
        getDelegate().q();
    }

    @Override // android.app.Activity, android.view.KeyEvent.Callback
    public boolean onKeyDown(int i5, KeyEvent keyEvent) {
        return super.onKeyDown(i5, keyEvent);
    }

    public void onLocalesChanged(w4.g gVar) {
    }

    @Override // androidx.fragment.app.m0, g.o, android.app.Activity, android.view.Window.Callback
    public final boolean onMenuItemSelected(int i5, MenuItem menuItem) {
        if (super.onMenuItemSelected(i5, menuItem)) {
            return true;
        }
        b supportActionBar = getSupportActionBar();
        if (menuItem.getItemId() != 16908332 || supportActionBar == null || (supportActionBar.d() & 4) == 0) {
            return false;
        }
        return onSupportNavigateUp();
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public boolean onMenuOpened(int i5, Menu menu) {
        return super.onMenuOpened(i5, menu);
    }

    public void onNightModeChanged(int i5) {
    }

    @Override // g.o, android.app.Activity, android.view.Window.Callback
    public void onPanelClosed(int i5, Menu menu) {
        super.onPanelClosed(i5, menu);
    }

    @Override // android.app.Activity
    public void onPostCreate(Bundle bundle) {
        super.onPostCreate(bundle);
        getDelegate().r();
    }

    @Override // androidx.fragment.app.m0, android.app.Activity
    public void onPostResume() {
        super.onPostResume();
        getDelegate().s();
    }

    public void onPrepareSupportNavigateUpTaskStack(v0 v0Var) {
    }

    @Override // androidx.fragment.app.m0, android.app.Activity
    public void onStart() {
        super.onStart();
        getDelegate().t();
    }

    @Override // androidx.fragment.app.m0, android.app.Activity
    public void onStop() {
        super.onStop();
        getDelegate().u();
    }

    @Override // m.n
    public void onSupportActionModeFinished(androidx.appcompat.view.b bVar) {
    }

    @Override // m.n
    public void onSupportActionModeStarted(androidx.appcompat.view.b bVar) {
    }

    @Deprecated
    public void onSupportContentChanged() {
    }

    public boolean onSupportNavigateUp() {
        Intent supportParentActivityIntent = getSupportParentActivityIntent();
        if (supportParentActivityIntent == null) {
            return false;
        }
        if (!supportShouldUpRecreateTask(supportParentActivityIntent)) {
            supportNavigateUpTo(supportParentActivityIntent);
            return true;
        }
        v0 v0VarD = v0.d(this);
        onCreateSupportNavigateUpTaskStack(v0VarD);
        onPrepareSupportNavigateUpTaskStack(v0VarD);
        v0VarD.e();
        try {
            n4.b.d(this);
            return true;
        } catch (IllegalStateException unused) {
            finish();
            return true;
        }
    }

    @Override // android.app.Activity
    public void onTitleChanged(CharSequence charSequence, int i5) {
        super.onTitleChanged(charSequence, i5);
        getDelegate().C(charSequence);
    }

    @Override // m.n
    public androidx.appcompat.view.b onWindowStartingSupportActionMode(androidx.appcompat.view.a aVar) {
        return null;
    }

    @Override // android.app.Activity
    public void openOptionsMenu() {
        b supportActionBar = getSupportActionBar();
        if (getWindow().hasFeature(0)) {
            if (supportActionBar == null || !supportActionBar.l()) {
                super.openOptionsMenu();
            }
        }
    }

    @Override // g.o, android.app.Activity
    public void setContentView(int i5) {
        Y();
        getDelegate().x(i5);
    }

    public void setSupportActionBar(Toolbar toolbar) {
        getDelegate().A(toolbar);
    }

    @Deprecated
    public void setSupportProgress(int i5) {
    }

    @Deprecated
    public void setSupportProgressBarIndeterminate(boolean z11) {
    }

    @Deprecated
    public void setSupportProgressBarIndeterminateVisibility(boolean z11) {
    }

    @Deprecated
    public void setSupportProgressBarVisibility(boolean z11) {
    }

    @Override // android.app.Activity, android.view.ContextThemeWrapper, android.content.ContextWrapper, android.content.Context
    public void setTheme(int i5) {
        super.setTheme(i5);
        getDelegate().B(i5);
    }

    public androidx.appcompat.view.b startSupportActionMode(androidx.appcompat.view.a aVar) {
        return getDelegate().D(aVar);
    }

    public void supportInvalidateOptionsMenu() {
        getDelegate().m();
    }

    public void supportNavigateUpTo(Intent intent) {
        n4.f.e(this, intent);
    }

    public boolean supportRequestWindowFeature(int i5) {
        return getDelegate().w(i5);
    }

    public boolean supportShouldUpRecreateTask(Intent intent) {
        return n4.f.h(this, intent);
    }

    @Override // g.o, android.app.Activity
    public void setContentView(View view) {
        Y();
        getDelegate().y(view);
    }

    @Override // g.o, android.app.Activity
    public void setContentView(View view, ViewGroup.LayoutParams layoutParams) {
        Y();
        getDelegate().z(view, layoutParams);
    }
}
