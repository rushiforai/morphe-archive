package fa;

import android.content.Intent;
import android.content.pm.ShortcutInfo;
import android.util.Pair;
import android.view.View;
import com.android.launcher3.folder.FolderIcon;
import com.android.launcher3.model.WidgetItem;
import com.android.launcher3.shortcuts.ShortcutKey;
import com.teslacoilsw.launcher.util.NamedIntent;
import e10.s2;
import java.util.function.Function;
import java.util.stream.Stream;

/* loaded from: classes.dex */
public final /* synthetic */ class n implements Function {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f54444a;

    public /* synthetic */ n(int i5) {
        this.f54444a = i5;
    }

    @Override // java.util.function.Function
    public final Object apply(Object obj) {
        switch (this.f54444a) {
            case 0:
                return ShortcutKey.b((ShortcutInfo) obj);
            case 1:
                return ((ShortcutKey) obj).f21251a.getPackageName();
            case 2:
                return ((ShortcutInfo) obj).getPackage();
            case 3:
                return ((ShortcutKey) obj).f21251a.getClassName();
            case 4:
                return ((ShortcutInfo) obj).getId();
            case 5:
                ga.j jVar = (ga.j) obj;
                ShortcutKey shortcutKeyD = jVar.f57290b == 6 ? ShortcutKey.d(jVar.d(), jVar.o) : null;
                NamedIntent namedIntent = jVar.f57308v;
                ShortcutKey shortcutKeyD2 = namedIntent != null ? namedIntent.d() : null;
                NamedIntent namedIntent2 = jVar.f57309w;
                return Stream.of((Object[]) new ShortcutKey[]{shortcutKeyD, shortcutKeyD2, namedIntent2 != null ? namedIntent2.d() : null});
            case 6:
                return (NamedIntent) ((s2) obj).l();
            case 7:
                return ((NamedIntent) obj).d();
            case 8:
                return (ga.h) ((Pair) obj).first;
            case 9:
                return (WidgetItem) ((Pair) obj).second;
            case 10:
                return ((Intent) obj).getComponent();
            default:
                aa.n nVar = FolderIcon.f21127f0;
                return (ga.j) ((View) obj).getTag();
        }
    }
}
