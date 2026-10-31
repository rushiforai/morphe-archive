package r60;

import android.view.View;
import android.widget.TableLayout;

/* loaded from: classes4.dex */
public final class c extends q60.b {

    /* renamed from: b, reason: collision with root package name */
    public final TableLayout f85554b;

    public c(View view, int i5, boolean z11) {
        TableLayout tableLayout;
        super(view);
        setIsRecyclable(z11);
        if (i5 != 0) {
            tableLayout = (TableLayout) a(i5);
        } else {
            if (!(view instanceof TableLayout)) {
                throw new IllegalStateException("Root view is not TableLayout. Please provide TableLayout ID explicitly");
            }
            tableLayout = (TableLayout) view;
        }
        this.f85554b = tableLayout;
    }
}
