package aa;

import android.content.pm.ShortcutInfo;
import com.android.launcher3.LauncherProvider;
import java.util.List;
import java.util.function.Supplier;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes2.dex */
public final /* synthetic */ class v implements Supplier {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f657a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f658b;

    public /* synthetic */ v(Object obj, int i5) {
        this.f657a = i5;
        this.f658b = obj;
    }

    @Override // java.util.function.Supplier
    public final Object get() {
        int i5 = this.f657a;
        Object obj = this.f658b;
        switch (i5) {
            case 0:
                return ((ga.d) ((List) obj).get(0)).f57282b;
            case 1:
                return (ShortcutInfo) obj;
            case 2:
                return Integer.valueOf(jc0.d.t((jc0.d) obj));
            default:
                XmlPullParser xmlPullParser = (XmlPullParser) obj;
                Object obj2 = LauncherProvider.f20963e;
                return xmlPullParser;
        }
    }
}
