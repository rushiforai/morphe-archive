package defpackage;

import android.R;
import android.view.View;
import android.view.ViewGroup;
import androidx.compose.ui.platform.ComposeView;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class yy1 {
    public static final ViewGroup.LayoutParams a = new ViewGroup.LayoutParams(-2, -2);

    public static void a(xy1 xy1Var, mz1 mz1Var) {
        View childAt = ((ViewGroup) xy1Var.getWindow().getDecorView().findViewById(R.id.content)).getChildAt(0);
        ComposeView composeView = childAt instanceof ComposeView ? (ComposeView) childAt : null;
        if (composeView != null) {
            composeView.setParentCompositionContext(null);
            composeView.setContent(mz1Var);
            return;
        }
        ComposeView composeView2 = new ComposeView(xy1Var, null, 6);
        composeView2.setParentCompositionContext(null);
        composeView2.setContent(mz1Var);
        View decorView = xy1Var.getWindow().getDecorView();
        if (fp7.k(decorView) == null) {
            decorView.setTag(com.medium.reader.R.id.view_tree_lifecycle_owner, xy1Var);
        }
        if (hp7.z(decorView) == null) {
            decorView.setTag(com.medium.reader.R.id.view_tree_view_model_store_owner, xy1Var);
        }
        if (gp7.k(decorView) == null) {
            decorView.setTag(com.medium.reader.R.id.view_tree_saved_state_registry_owner, xy1Var);
        }
        xy1Var.setContentView(composeView2, a);
    }
}
