package androidx.recyclerview.widget;

import android.content.Context;
import android.view.ViewGroup;

/** Compile-only surface of Instagram's RecyclerView. Never included in the extension. */
public abstract class RecyclerView extends ViewGroup {
    public RecyclerView(Context context) { super(context); }
    public abstract int getScrollState();
}
