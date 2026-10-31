package p00;

import ab.e0;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.FunctionReferenceImpl;

/* loaded from: classes4.dex */
public final /* synthetic */ class s extends FunctionReferenceImpl implements Function3 {

    /* renamed from: d, reason: collision with root package name */
    public static final s f81376d = new s(3, v9.o.class, "inflate", "inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lcom/android/launcher3/databinding/DraweranimationPreviewBinding;", 0);

    @Override // kotlin.jvm.functions.Function3
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        ViewGroup viewGroup = (ViewGroup) obj2;
        boolean zBooleanValue = ((Boolean) obj3).booleanValue();
        View viewInflate = ((LayoutInflater) obj).inflate(2131624105, viewGroup, false);
        if (zBooleanValue) {
            viewGroup.addView(viewInflate);
        }
        int i5 = 2131427856;
        ImageView imageView = (ImageView) e0.x(2131427856, viewInflate);
        if (imageView != null) {
            i5 = 2131427913;
            ImageView imageView2 = (ImageView) e0.x(2131427913, viewInflate);
            if (imageView2 != null) {
                i5 = 2131429249;
                if (((FrameLayout) e0.x(2131429249, viewInflate)) != null) {
                    return new v9.o((FrameLayout) viewInflate, imageView, imageView2);
                }
            }
        }
        throw new NullPointerException("Missing required view with ID: ".concat(viewInflate.getResources().getResourceName(i5)));
    }
}
