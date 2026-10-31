package jz;

import android.content.ComponentName;
import android.os.Process;
import android.os.UserHandle;
import com.android.launcher3.model.WidgetItem;
import com.android.launcher3.widget.LauncherAppWidgetProviderInfo;
import com.teslacoilsw.launcher.NovaShortcutCreateActivity;
import java.text.Collator;
import java.util.Comparator;
import kotlin.jvm.internal.Intrinsics;
import uy.s;

/* loaded from: classes.dex */
public final class m implements Comparator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f70551a;

    /* renamed from: b, reason: collision with root package name */
    public Object f70552b;

    /* renamed from: c, reason: collision with root package name */
    public Cloneable f70553c;

    public m(int i5) {
        this.f70551a = i5;
        switch (i5) {
            case 1:
                break;
            default:
                this.f70552b = Process.myUserHandle();
                this.f70553c = Collator.getInstance();
                break;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:41:0x0091  */
    @Override // java.util.Comparator
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int compare(Object obj, Object obj2) {
        int i5;
        int i11;
        switch (this.f70551a) {
            case 0:
                WidgetItem widgetItem = (WidgetItem) obj;
                WidgetItem widgetItem2 = (WidgetItem) obj2;
                if (Intrinsics.b(widgetItem.f21251a.getPackageName(), "com.teslacoilsw.launcher")) {
                    ComponentName componentName = widgetItem.f21251a;
                    ComponentName componentName2 = NovaShortcutCreateActivity.f45669p;
                    boolean zB = Intrinsics.b(componentName, componentName2);
                    boolean zB2 = Intrinsics.b(widgetItem2.f21251a, componentName2);
                    LauncherAppWidgetProviderInfo launcherAppWidgetProviderInfo = widgetItem.f21171d;
                    boolean zM = launcherAppWidgetProviderInfo != null ? launcherAppWidgetProviderInfo.m() : false;
                    LauncherAppWidgetProviderInfo launcherAppWidgetProviderInfo2 = widgetItem2.f21171d;
                    boolean zM2 = launcherAppWidgetProviderInfo2 != null ? launcherAppWidgetProviderInfo2.m() : false;
                    if (zB2 ^ zB) {
                        if (!zB) {
                            return 1;
                        }
                    } else if (!(zM ^ zM2)) {
                        boolean zEquals = ((UserHandle) this.f70552b).equals(widgetItem.f21252b);
                        if (!((!r0.equals(widgetItem2.f21252b)) ^ (!zEquals))) {
                            int iCompare = ((Collator) this.f70553c).compare(widgetItem.f21173f, widgetItem2.f21173f);
                            if (iCompare != 0) {
                                return iCompare;
                            }
                            int i12 = widgetItem.f21174g;
                            int i13 = widgetItem.f21175h;
                            int i14 = i12 * i13;
                            int i15 = widgetItem2.f21174g;
                            int i16 = widgetItem2.f21175h;
                            int i17 = i15 * i16;
                            return i14 == i17 ? Integer.compare(i13, i16) : Integer.compare(i14, i17);
                        }
                        if (!zEquals) {
                            return 1;
                        }
                    } else if (!zM) {
                        return 1;
                    }
                }
                return -1;
            default:
                s sVar = (s) obj;
                s sVar2 = (s) obj2;
                if (sVar instanceof uy.j) {
                    if (!(sVar2 instanceof uy.j)) {
                        return -1;
                    }
                    int iB = sVar.f91754f - sVar2.f91754f;
                    if (iB == 0) {
                        iB = ((y9.i) this.f70552b).b(sVar.f91749a, sVar2.f91749a);
                    }
                    if (iB != 0) {
                        return iB;
                    }
                    i5 = sVar.f91753e;
                    i11 = sVar2.f91753e;
                } else {
                    if (sVar2 instanceof uy.j) {
                        return 1;
                    }
                    int iB2 = ((y9.i) this.f70552b).b(sVar.f91749a, sVar2.f91749a);
                    if (iB2 == 0) {
                        iB2 = sVar.f91754f - sVar2.f91754f;
                    }
                    if (iB2 != 0) {
                        return iB2;
                    }
                    i5 = sVar.f91753e;
                    i11 = sVar2.f91753e;
                }
                return i5 - i11;
        }
    }
}
