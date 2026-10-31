package r10;

import android.content.ComponentName;
import android.net.Uri;
import android.os.Process;
import android.os.UserHandle;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.android.launcher3.util.ComponentKey;
import com.teslacoilsw.launcher.search.AppSearchResultsView;
import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class a {
    public static final ga.a a(ArrayList arrayList, ComponentKey componentKey) {
        Object obj;
        b3.h0 h0Var = AppSearchResultsView.f46177o0;
        int size = arrayList.size();
        int i5 = 0;
        while (true) {
            if (i5 >= size) {
                obj = null;
                break;
            }
            obj = arrayList.get(i5);
            ga.a aVar = (ga.a) obj;
            if (Intrinsics.b(componentKey.f21251a, aVar.f57279y) && Intrinsics.b(componentKey.f21252b, aVar.o)) {
                break;
            }
            i5++;
        }
        return (ga.a) obj;
    }

    public static final String b(String str) {
        Uri uri = a1.f85090m;
        return r70.j.F0(r70.j.F0(r70.j.F0(r70.j.F0(r70.j.F0(r70.j.F0(r70.j.F0(r70.j.F0(r70.j.F0(r70.j.F0(r70.j.F0(r70.j.F0(r70.j.F0(r70.j.F0(r70.j.F0(r70.j.F0(r70.j.F0(r70.j.F0(str, "½", " +1/2 ", false), "⅓", " +1/3 ", false), "¼", " +1/4 ", false), "⅕", " +1/5 ", false), "⅙", " +1/6 ", false), "⅐", " +1/7 ", false), "⅛", " +1/8 ", false), "⅑", " +1/9 ", false), "⅒", " +1/10 ", false), "⅔", " +2/3 ", false), "⅖", " +2/5 ", false), "¾", " +3/4 ", false), "⅗", " +3/5 ", false), "⅘", " +4/5 ", false), "⅚", " +5/6 ", false), "⅜", " +3/8 ", false), "⅝", " +5/8 ", false), "⅞", " +7/8 ", false);
    }

    public static final String c(String str) {
        Uri uri = a1.f85090m;
        return r70.j.F0(r70.j.F0(r70.j.F0(r70.j.F0(r70.j.F0(r70.j.F0(r70.j.F0(r70.j.F0(r70.j.F0(r70.j.F0(str, "⁰", "^0 ", false), "¹", "^1 ", false), "²", "^2 ", false), "³", "^3 ", false), "⁴", "^4 ", false), "⁵", "^5 ", false), "⁶", "^6 ", false), "⁷", "^7 ", false), "⁸", "^8 ", false), "⁹", "^9 ", false);
    }

    public static View d(View view) {
        if (view.hasOnClickListeners()) {
            return view;
        }
        if (!(view instanceof ViewGroup)) {
            return null;
        }
        ViewGroup viewGroup = (ViewGroup) view;
        int i5 = 0;
        while (true) {
            if (!(i5 < viewGroup.getChildCount())) {
                return null;
            }
            int i11 = i5 + 1;
            View childAt = viewGroup.getChildAt(i5);
            if (childAt == null) {
                throw new IndexOutOfBoundsException();
            }
            b3.h0 h0Var = AppSearchResultsView.f46177o0;
            View viewD = d(childAt);
            if (viewD != null) {
                return viewD;
            }
            i5 = i11;
        }
    }

    public static CharSequence e(View view) {
        if (!(view instanceof ViewGroup)) {
            if (view instanceof TextView) {
                return ((TextView) view).getText();
            }
            return null;
        }
        ViewGroup viewGroup = (ViewGroup) view;
        int i5 = 0;
        while (true) {
            if (!(i5 < viewGroup.getChildCount())) {
                return null;
            }
            int i11 = i5 + 1;
            View childAt = viewGroup.getChildAt(i5);
            if (childAt == null) {
                throw new IndexOutOfBoundsException();
            }
            b3.h0 h0Var = AppSearchResultsView.f46177o0;
            CharSequence charSequenceE = e(childAt);
            if (charSequenceE != null) {
                return charSequenceE;
            }
            i5 = i11;
        }
    }

    public static Uri f(ComponentName componentName, UserHandle userHandle) {
        Uri.Builder builder = new Uri.Builder();
        builder.scheme("appIcon");
        builder.authority(componentName.flattenToShortString());
        if (!Intrinsics.b(userHandle, Process.myUserHandle())) {
            builder.fragment(String.valueOf(((ja.h) ja.h.f69294h.f95127b).d(userHandle)));
        }
        return builder.build();
    }

    public static Uri g(String str) {
        UserHandle userHandleMyUserHandle = Process.myUserHandle();
        return f(aa.d0.m(str, userHandleMyUserHandle).f21251a, userHandleMyUserHandle);
    }
}
