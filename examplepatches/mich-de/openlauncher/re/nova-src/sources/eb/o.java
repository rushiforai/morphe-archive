package eb;

import android.os.Bundle;
import android.view.View;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.EditText;
import com.android.launcher3.widget.picker.WidgetsListHeader;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;

/* loaded from: classes2.dex */
public final class o extends View.AccessibilityDelegate {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f52511a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f52512b;

    public /* synthetic */ o(Object obj, int i5) {
        this.f52511a = i5;
        this.f52512b = obj;
    }

    @Override // android.view.View.AccessibilityDelegate
    public final void onInitializeAccessibilityNodeInfo(View view, AccessibilityNodeInfo accessibilityNodeInfo) {
        switch (this.f52511a) {
            case 0:
                if (((WidgetsListHeader) this.f52512b).f21357i) {
                    accessibilityNodeInfo.removeAction(SQLiteDatabase.OPEN_PRIVATECACHE);
                    accessibilityNodeInfo.addAction(524288);
                } else {
                    accessibilityNodeInfo.removeAction(524288);
                    accessibilityNodeInfo.addAction(SQLiteDatabase.OPEN_PRIVATECACHE);
                }
                super.onInitializeAccessibilityNodeInfo(view, accessibilityNodeInfo);
                break;
            default:
                super.onInitializeAccessibilityNodeInfo(view, accessibilityNodeInfo);
                EditText editText = ((fk.p) this.f52512b).f55236h.f34369d;
                if (editText != null) {
                    accessibilityNodeInfo.setLabeledBy(editText);
                    break;
                }
                break;
        }
    }

    @Override // android.view.View.AccessibilityDelegate
    public boolean performAccessibilityAction(View view, int i5, Bundle bundle) {
        switch (this.f52511a) {
            case 0:
                if (i5 != 262144 && i5 != 524288) {
                    return super.performAccessibilityAction(view, i5, bundle);
                }
                ((WidgetsListHeader) this.f52512b).callOnClick();
                return true;
            default:
                return super.performAccessibilityAction(view, i5, bundle);
        }
    }
}
