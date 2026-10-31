package androidx.fragment.app;

import android.content.Context;
import android.content.Intent;
import android.content.IntentSender;
import android.os.Bundle;
import android.util.AttributeSet;
import android.view.MenuItem;
import android.view.View;
import java.io.FileDescriptor;
import java.io.PrintWriter;

/* loaded from: classes.dex */
public abstract class m0 extends g.o implements n4.a {
    static final String LIFECYCLE_TAG = "android:support:lifecycle";
    boolean mCreated;
    final h6.c0 mFragmentLifecycleRegistry;
    final q0 mFragments;
    boolean mResumed;
    boolean mStopped;

    public m0() {
        this.mFragments = new q0(new l0(this));
        this.mFragmentLifecycleRegistry = new h6.c0(this);
        this.mStopped = true;
        W();
    }

    public static boolean X(h1 h1Var) {
        h6.t tVar = h6.t.f59442c;
        boolean zX = false;
        for (h0 h0Var : h1Var.f14571c.f()) {
            if (h0Var != null) {
                if (h0Var.getHost() != null) {
                    zX |= X(h0Var.getChildFragmentManager());
                }
                y1 y1Var = h0Var.mViewLifecycleOwner;
                if (y1Var != null && ((h6.c0) y1Var.getLifecycle()).f59342d.compareTo(h6.t.f59443d) >= 0) {
                    h0Var.mViewLifecycleOwner.d();
                    zX = true;
                }
                if (h0Var.mLifecycleRegistry.f59342d.compareTo(h6.t.f59443d) >= 0) {
                    h0Var.mLifecycleRegistry.h(tVar);
                    zX = true;
                }
            }
        }
        return zX;
    }

    public final void W() {
        getSavedStateRegistry().b(LIFECYCLE_TAG, new i0(this, 0));
        final int i5 = 0;
        addOnConfigurationChangedListener(new z4.a(this) { // from class: androidx.fragment.app.j0

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ m0 f14599b;

            {
                this.f14599b = this;
            }

            @Override // z4.a
            public final void accept(Object obj) {
                switch (i5) {
                    case 0:
                        this.f14599b.mFragments.a();
                        break;
                    default:
                        this.f14599b.mFragments.a();
                        break;
                }
            }
        });
        final int i11 = 1;
        addOnNewIntentListener(new z4.a(this) { // from class: androidx.fragment.app.j0

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ m0 f14599b;

            {
                this.f14599b = this;
            }

            @Override // z4.a
            public final void accept(Object obj) {
                switch (i11) {
                    case 0:
                        this.f14599b.mFragments.a();
                        break;
                    default:
                        this.f14599b.mFragments.a();
                        break;
                }
            }
        });
        addOnContextAvailableListener(new i.b() { // from class: androidx.fragment.app.k0
            @Override // i.b
            public final void a(g.o oVar) {
                l0 l0Var = this.f14601a.mFragments.f14658a;
                l0Var.f14684d.b(l0Var, l0Var, null);
            }
        });
    }

    public final View dispatchFragmentsOnCreateView(View view, String str, Context context, AttributeSet attributeSet) {
        return this.mFragments.f14658a.f14684d.f14574f.onCreateView(view, str, context, attributeSet);
    }

    @Override // android.app.Activity
    public void dump(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        super.dump(str, fileDescriptor, printWriter, strArr);
        if (shouldDumpInternalState(strArr)) {
            printWriter.print(str);
            printWriter.print("Local FragmentActivity ");
            printWriter.print(Integer.toHexString(System.identityHashCode(this)));
            printWriter.println(" State:");
            String str2 = str + "  ";
            printWriter.print(str2);
            printWriter.print("mCreated=");
            printWriter.print(this.mCreated);
            printWriter.print(" mResumed=");
            printWriter.print(this.mResumed);
            printWriter.print(" mStopped=");
            printWriter.print(this.mStopped);
            if (getApplication() != null) {
                n6.a.a(this).b(str2, printWriter);
            }
            this.mFragments.f14658a.f14684d.w(str, fileDescriptor, printWriter, strArr);
        }
    }

    public h1 getSupportFragmentManager() {
        return this.mFragments.f14658a.f14684d;
    }

    @Deprecated
    public n6.a getSupportLoaderManager() {
        return n6.a.a(this);
    }

    public void markFragmentsCreated() {
        h1 supportFragmentManager;
        do {
            supportFragmentManager = getSupportFragmentManager();
            h6.t tVar = h6.t.f59440a;
        } while (X(supportFragmentManager));
    }

    @Override // g.o, android.app.Activity
    public void onActivityResult(int i5, int i11, Intent intent) {
        this.mFragments.a();
        super.onActivityResult(i5, i11, intent);
    }

    @Deprecated
    public void onAttachFragment(h0 h0Var) {
    }

    @Override // g.o, n4.i, android.app.Activity
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mFragmentLifecycleRegistry.f(h6.s.ON_CREATE);
        i1 i1Var = this.mFragments.f14658a.f14684d;
        i1Var.I = false;
        i1Var.J = false;
        i1Var.P.f14608f = false;
        i1Var.u(1);
    }

    @Override // android.app.Activity, android.view.LayoutInflater.Factory2
    public View onCreateView(View view, String str, Context context, AttributeSet attributeSet) {
        View viewDispatchFragmentsOnCreateView = dispatchFragmentsOnCreateView(view, str, context, attributeSet);
        return viewDispatchFragmentsOnCreateView == null ? super.onCreateView(view, str, context, attributeSet) : viewDispatchFragmentsOnCreateView;
    }

    @Override // android.app.Activity
    public void onDestroy() {
        super.onDestroy();
        this.mFragments.f14658a.f14684d.l();
        this.mFragmentLifecycleRegistry.f(h6.s.ON_DESTROY);
    }

    @Override // g.o, android.app.Activity, android.view.Window.Callback
    public boolean onMenuItemSelected(int i5, MenuItem menuItem) {
        if (super.onMenuItemSelected(i5, menuItem)) {
            return true;
        }
        if (i5 == 6) {
            return this.mFragments.f14658a.f14684d.j(menuItem);
        }
        return false;
    }

    @Override // android.app.Activity
    public void onPause() {
        super.onPause();
        this.mResumed = false;
        this.mFragments.f14658a.f14684d.u(5);
        this.mFragmentLifecycleRegistry.f(h6.s.ON_PAUSE);
    }

    @Override // android.app.Activity
    public void onPostResume() {
        super.onPostResume();
        onResumeFragments();
    }

    @Override // g.o, android.app.Activity
    public void onRequestPermissionsResult(int i5, String[] strArr, int[] iArr) {
        this.mFragments.a();
        super.onRequestPermissionsResult(i5, strArr, iArr);
    }

    @Override // android.app.Activity
    public void onResume() {
        this.mFragments.a();
        super.onResume();
        this.mResumed = true;
        this.mFragments.f14658a.f14684d.A(true);
    }

    public void onResumeFragments() {
        this.mFragmentLifecycleRegistry.f(h6.s.ON_RESUME);
        i1 i1Var = this.mFragments.f14658a.f14684d;
        i1Var.I = false;
        i1Var.J = false;
        i1Var.P.f14608f = false;
        i1Var.u(7);
    }

    @Override // android.app.Activity
    public void onStart() {
        this.mFragments.a();
        super.onStart();
        this.mStopped = false;
        if (!this.mCreated) {
            this.mCreated = true;
            i1 i1Var = this.mFragments.f14658a.f14684d;
            i1Var.I = false;
            i1Var.J = false;
            i1Var.P.f14608f = false;
            i1Var.u(4);
        }
        this.mFragments.f14658a.f14684d.A(true);
        this.mFragmentLifecycleRegistry.f(h6.s.ON_START);
        i1 i1Var2 = this.mFragments.f14658a.f14684d;
        i1Var2.I = false;
        i1Var2.J = false;
        i1Var2.P.f14608f = false;
        i1Var2.u(5);
    }

    @Override // android.app.Activity
    public void onStateNotSaved() {
        this.mFragments.a();
    }

    @Override // android.app.Activity
    public void onStop() {
        super.onStop();
        this.mStopped = true;
        markFragmentsCreated();
        i1 i1Var = this.mFragments.f14658a.f14684d;
        i1Var.J = true;
        i1Var.P.f14608f = true;
        i1Var.u(4);
        this.mFragmentLifecycleRegistry.f(h6.s.ON_STOP);
    }

    public void setEnterSharedElementCallback(n4.t0 t0Var) {
        n4.b.h(this);
    }

    public void setExitSharedElementCallback(n4.t0 t0Var) {
        n4.b.i(this);
    }

    public void startActivityFromFragment(h0 h0Var, Intent intent, int i5) {
        startActivityFromFragment(h0Var, intent, i5, (Bundle) null);
    }

    @Deprecated
    public void startIntentSenderFromFragment(h0 h0Var, IntentSender intentSender, int i5, Intent intent, int i11, int i12, int i13, Bundle bundle) throws IntentSender.SendIntentException {
        if (i5 == -1) {
            n4.b.l(this, intentSender, i5, intent, i11, i12, i13, bundle);
        } else {
            h0Var.startIntentSenderForResult(intentSender, i5, intent, i11, i12, i13, bundle);
        }
    }

    public void supportFinishAfterTransition() {
        n4.b.e(this);
    }

    public void supportPostponeEnterTransition() {
        n4.b.f(this);
    }

    public void supportStartPostponedEnterTransition() {
        n4.b.m(this);
    }

    @Override // n4.a
    @Deprecated
    public final void validateRequestPermissionsRequestCode(int i5) {
    }

    public void startActivityFromFragment(h0 h0Var, Intent intent, int i5, Bundle bundle) {
        if (i5 == -1) {
            n4.b.k(this, intent, -1, bundle);
        } else {
            h0Var.startActivityForResult(intent, i5, bundle);
        }
    }

    @Override // android.app.Activity, android.view.LayoutInflater.Factory
    public View onCreateView(String str, Context context, AttributeSet attributeSet) {
        View viewDispatchFragmentsOnCreateView = dispatchFragmentsOnCreateView(null, str, context, attributeSet);
        return viewDispatchFragmentsOnCreateView == null ? super.onCreateView(str, context, attributeSet) : viewDispatchFragmentsOnCreateView;
    }

    public m0(int i5) {
        super(i5);
        this.mFragments = new q0(new l0(this));
        this.mFragmentLifecycleRegistry = new h6.c0(this);
        this.mStopped = true;
        W();
    }
}
