package b5;

import a5.a1;
import android.view.accessibility.AccessibilityManager;
import android.widget.AutoCompleteTextView;
import com.google.android.material.internal.CheckableImageButton;
import java.util.WeakHashMap;

/* loaded from: classes2.dex */
public final class b implements AccessibilityManager.TouchExplorationStateChangeListener {

    /* renamed from: a, reason: collision with root package name */
    public final f10.o f17534a;

    public b(f10.o oVar) {
        this.f17534a = oVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof b) {
            return this.f17534a.equals(((b) obj).f17534a);
        }
        return false;
    }

    public final int hashCode() {
        return this.f17534a.hashCode();
    }

    @Override // android.view.accessibility.AccessibilityManager.TouchExplorationStateChangeListener
    public final void onTouchExplorationStateChanged(boolean z11) {
        fk.i iVar = (fk.i) this.f17534a.f54201b;
        AutoCompleteTextView autoCompleteTextView = iVar.f55188h;
        if (autoCompleteTextView == null || autoCompleteTextView.getInputType() != 0) {
            return;
        }
        CheckableImageButton checkableImageButton = iVar.f55223d;
        int i5 = z11 ? 2 : 1;
        WeakHashMap weakHashMap = a1.f250a;
        checkableImageButton.setImportantForAccessibility(i5);
    }
}
