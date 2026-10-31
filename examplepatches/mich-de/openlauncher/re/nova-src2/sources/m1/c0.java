package m1;

import android.accessibilityservice.AccessibilityServiceInfo;
import android.os.Build;
import android.view.accessibility.AccessibilityManager;
import java.util.List;
import p1.e1;
import p1.s2;
import p1.y2;

/* loaded from: classes2.dex */
public final class c0 implements AccessibilityManager.AccessibilityStateChangeListener, y2 {

    /* renamed from: a, reason: collision with root package name */
    public final e1 f75673a = androidx.compose.runtime.d.k(Boolean.FALSE);

    /* renamed from: b, reason: collision with root package name */
    public final b0 f75674b = new b0();

    /* renamed from: c, reason: collision with root package name */
    public final a0 f75675c;

    public c0() {
        this.f75675c = Build.VERSION.SDK_INT >= 33 ? new a0(this) : null;
    }

    public static boolean a(AccessibilityManager accessibilityManager) {
        List<AccessibilityServiceInfo> enabledAccessibilityServiceList = accessibilityManager.getEnabledAccessibilityServiceList(16);
        int size = enabledAccessibilityServiceList.size();
        for (int i5 = 0; i5 < size; i5++) {
            String settingsActivityName = enabledAccessibilityServiceList.get(i5).getSettingsActivityName();
            if (settingsActivityName != null && r70.k.K0(settingsActivityName, "SwitchAccess", false)) {
                return true;
            }
        }
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x003d  */
    @Override // p1.y2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object getValue() {
        boolean z11 = false;
        if (((Boolean) ((s2) this.f75673a).getValue()).booleanValue()) {
            b0 b0Var = this.f75674b;
            if (b0Var != null ? ((Boolean) ((s2) b0Var.f75670a).getValue()).booleanValue() : false) {
                z11 = true;
            } else {
                a0 a0Var = this.f75675c;
                if (a0Var != null ? ((Boolean) ((s2) a0Var.f75668a).getValue()).booleanValue() : false) {
                }
            }
        }
        return Boolean.valueOf(z11);
    }

    @Override // android.view.accessibility.AccessibilityManager.AccessibilityStateChangeListener
    public final void onAccessibilityStateChanged(boolean z11) {
        ((s2) this.f75673a).setValue(Boolean.valueOf(z11));
    }
}
