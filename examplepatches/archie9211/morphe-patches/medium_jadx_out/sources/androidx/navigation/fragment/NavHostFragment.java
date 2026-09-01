package androidx.navigation.fragment;

import android.content.Context;
import android.content.res.TypedArray;
import android.os.Bundle;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.fragment.app.FragmentContainerView;
import com.medium.reader.R;
import defpackage.bsa;
import defpackage.db8;
import defpackage.dsa;
import defpackage.em4;
import defpackage.j15;
import defpackage.km0;
import defpackage.kp7;
import defpackage.w5d;
import defpackage.z72;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\b\u0016\u0018\u00002\u00020\u00012\u00020\u0002B\u0007¢\u0006\u0004\b\u0003\u0010\u0004¨\u0006\u0005"}, d2 = {"Landroidx/navigation/fragment/NavHostFragment;", "Lj15;", "", "<init>", "()V", "navigation-fragment_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
public class NavHostFragment extends j15 {
    public final w5d m0 = new w5d(new em4(28, this));
    public View n0;
    public int o0;
    public boolean p0;

    @Override // defpackage.j15
    public final void A(Bundle bundle) {
        Y();
        if (bundle != null && bundle.getBoolean("android-support-nav:fragment:defaultHost", false)) {
            this.p0 = true;
            km0 km0Var = new km0(m());
            km0Var.g(this);
            km0Var.d(false);
        }
        super.A(bundle);
    }

    @Override // defpackage.j15
    public final View B(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        layoutInflater.getClass();
        Context context = layoutInflater.getContext();
        context.getClass();
        FragmentContainerView fragmentContainerView = new FragmentContainerView(context);
        int i = this.w;
        if (i == 0 || i == -1) {
            i = R.id.nav_host_fragment_container;
        }
        fragmentContainerView.setId(i);
        return fragmentContainerView;
    }

    @Override // defpackage.j15
    public final void D() {
        this.E = true;
        View view = this.n0;
        if (view != null && kp7.l(view) == Y()) {
            view.setTag(R.id.nav_controller_view_tag, null);
        }
        this.n0 = null;
    }

    @Override // defpackage.j15
    public final void G(Context context, AttributeSet attributeSet, Bundle bundle) {
        context.getClass();
        attributeSet.getClass();
        super.G(context, attributeSet, bundle);
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, bsa.b);
        typedArrayObtainStyledAttributes.getClass();
        int resourceId = typedArrayObtainStyledAttributes.getResourceId(0, 0);
        if (resourceId != 0) {
            this.o0 = resourceId;
        }
        typedArrayObtainStyledAttributes.recycle();
        TypedArray typedArrayObtainStyledAttributes2 = context.obtainStyledAttributes(attributeSet, dsa.c);
        typedArrayObtainStyledAttributes2.getClass();
        if (typedArrayObtainStyledAttributes2.getBoolean(0, false)) {
            this.p0 = true;
        }
        typedArrayObtainStyledAttributes2.recycle();
    }

    @Override // defpackage.j15
    public final void J(Bundle bundle) {
        if (this.p0) {
            bundle.putBoolean("android-support-nav:fragment:defaultHost", true);
        }
    }

    @Override // defpackage.j15
    public final void M(View view) {
        view.getClass();
        if (!(view instanceof ViewGroup)) {
            z72.e("created host view ", view, " is not a ViewGroup");
            return;
        }
        view.setTag(R.id.nav_controller_view_tag, Y());
        ViewGroup viewGroup = (ViewGroup) view;
        if (viewGroup.getParent() != null) {
            Object parent = viewGroup.getParent();
            parent.getClass();
            View view2 = (View) parent;
            this.n0 = view2;
            if (view2.getId() == this.w) {
                View view3 = this.n0;
                view3.getClass();
                view3.setTag(R.id.nav_controller_view_tag, Y());
            }
        }
    }

    public final db8 Y() {
        return (db8) this.m0.getValue();
    }

    @Override // defpackage.j15
    public final void z(Context context) {
        super.z(context);
        if (this.p0) {
            km0 km0Var = new km0(m());
            km0Var.g(this);
            km0Var.d(false);
        }
    }
}
