package androidx.recyclerview.widget;

import android.content.Context;
import android.widget.LinearLayout;

/** Test-only view container. Real cell interfaces are separately resolved from both APK fixtures. */
public final class RecyclerView extends LinearLayout {
    public RecyclerView(Context context) { super(context); }
}
