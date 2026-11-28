package app.nicoid.patches;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;

/** Recovered from the v2.2.0 candidate JVM bytecode; not claimed as the original text. */
public final class SwipeInterfaceMerge220 {
    private static final String TYPE = "Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;";
    public static void apply(MutableClass target, ClassDef delta) {
        if (!TYPE.equals(delta.getType())) return;
        Set<String> old = new HashSet<>(Arrays.asList("Ld/h/l/j;", "Ld/h/l/f;"));
        List<String> legacy = Arrays.asList("Ld/h/l/i;", "Ld/h/l/e;");
        List<String> modern = Arrays.asList(
            "Landroidx/core/view/NestedScrollingParent;",
            "Landroidx/core/view/NestedScrollingParent2;",
            "Landroidx/core/view/NestedScrollingParent3;",
            "Landroidx/core/view/NestedScrollingChild;",
            "Landroidx/core/view/NestedScrollingChild2;",
            "Landroidx/core/view/NestedScrollingChild3;");
        Set<String> supplied = new HashSet<>(delta.getInterfaces());
        Set<String> expected = new HashSet<>(old);
        expected.addAll(legacy);
        if (!new HashSet<>(target.getInterfaces()).equals(old)) throw new IllegalStateException("Unexpected SwipeRefreshLayout input ABI");
        if (supplied.equals(old)) return;
        boolean addModern = !supplied.equals(expected);
        if (addModern) expected.addAll(modern);
        if (!supplied.equals(expected)) throw new IllegalStateException("Unexpected SwipeRefreshLayout delta ABI");
        Set<String> required = new HashSet<>(Arrays.asList(
            "a(Landroid/view/View;I)V", "a(Landroid/view/View;IIIII)V", "a(Landroid/view/View;II[II)V",
            "a(Landroid/view/View;Landroid/view/View;II)V", "b(Landroid/view/View;Landroid/view/View;II)Z", "a(Landroid/view/View;IIIII[I)V"));
        if (addModern) required.addAll(Arrays.asList(
            "onStartNestedScroll(Landroid/view/View;Landroid/view/View;I)Z",
            "onNestedScrollAccepted(Landroid/view/View;Landroid/view/View;I)V",
            "onStopNestedScroll(Landroid/view/View;)V", "onNestedScroll(Landroid/view/View;IIII)V",
            "onNestedPreScroll(Landroid/view/View;II[I)V", "onNestedFling(Landroid/view/View;FFZ)Z",
            "onNestedPreFling(Landroid/view/View;FF)Z", "getNestedScrollAxes()I",
            "onStartNestedScroll(Landroid/view/View;Landroid/view/View;II)Z",
            "onNestedScrollAccepted(Landroid/view/View;Landroid/view/View;II)V",
            "onStopNestedScroll(Landroid/view/View;I)V", "onNestedScroll(Landroid/view/View;IIIII)V",
            "onNestedPreScroll(Landroid/view/View;II[II)V", "onNestedScroll(Landroid/view/View;IIIII[I)V",
            "setNestedScrollingEnabled(Z)V", "isNestedScrollingEnabled()Z", "startNestedScroll(I)Z",
            "stopNestedScroll()V", "hasNestedScrollingParent()Z", "dispatchNestedScroll(IIII[I)Z",
            "dispatchNestedPreScroll(II[I[I)Z", "dispatchNestedFling(FFZ)Z", "dispatchNestedPreFling(FF)Z",
            "startNestedScroll(II)Z", "stopNestedScroll(I)V", "hasNestedScrollingParent(I)Z",
            "dispatchNestedScroll(IIII[II)Z", "dispatchNestedPreScroll(II[I[II)Z", "dispatchNestedScroll(IIII[II[I)V"));
        for (Method method : target.getMethods()) {
            if (method.getImplementation() == null || (method.getAccessFlags() & 1) == 0 || (method.getAccessFlags() & 8) != 0) continue;
            StringBuilder signature = new StringBuilder(method.getName()).append('(');
            for (CharSequence parameter : method.getParameterTypes()) signature.append(parameter);
            signature.append(')').append(method.getReturnType());
            required.remove(signature.toString());
        }
        if (!required.isEmpty()) throw new IllegalStateException("Missing callbacks: " + required);
        target.getInterfaces().addAll(legacy);
        if (addModern) target.getInterfaces().addAll(modern);
    }
}
