package b;

import android.view.View;
import com.android.launcher3.dragndrop.AddItemActivity;
import com.android.launcher3.widget.LocalColorExtractor;
import java.util.function.Consumer;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final /* synthetic */ class l2 implements Consumer {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15936a;

    public /* synthetic */ l2(int i5) {
        this.f15936a = i5;
    }

    @Override // java.util.function.Consumer
    public final void accept(Object obj) {
        switch (this.f15936a) {
            case 0:
                sb it = (sb) obj;
                Intrinsics.g(it, "it");
                it.onResume();
                Unit unit = Unit.f71706a;
                break;
            case 1:
                sb it2 = (sb) obj;
                Intrinsics.g(it2, "it");
                it2.onPause();
                Unit unit2 = Unit.f71706a;
                break;
            case 2:
                sb it3 = (sb) obj;
                Intrinsics.g(it3, "it");
                it3.d();
                Unit unit3 = Unit.f71706a;
                break;
            case 3:
                sb it4 = (sb) obj;
                Intrinsics.g(it4, "it");
                it4.onDestroy();
                Unit unit4 = Unit.f71706a;
                break;
            case 4:
                sb it5 = (sb) obj;
                Intrinsics.g(it5, "it");
                it5.a$1();
                Unit unit5 = Unit.f71706a;
                break;
            case 5:
                sb it6 = (sb) obj;
                Intrinsics.g(it6, "it");
                it6.onStop();
                Unit unit6 = Unit.f71706a;
                break;
            case 6:
                sb it7 = (sb) obj;
                Intrinsics.g(it7, "it");
                it7.c();
                Unit unit7 = Unit.f71706a;
                break;
            case 7:
                sb it8 = (sb) obj;
                Intrinsics.g(it8, "it");
                it8.b$1();
                Unit unit8 = Unit.f71706a;
                break;
            case 8:
                ((Runnable) obj).run();
                break;
            case 9:
                ((LocalColorExtractor) obj).getClass();
                break;
            case 10:
                ((View) obj).cancelLongPress();
                break;
            default:
                ((AddItemActivity) ((za.b) obj)).finish();
                break;
        }
    }
}
