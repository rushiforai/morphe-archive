package androidx.recyclerview.widget;
import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
/** Compile-only API; supplied by TikTok at runtime. */
public abstract class RecyclerView extends ViewGroup {
    public RecyclerView(Context context) { super(context); }
    public abstract int getScrollState();
    public abstract LayoutManager getLayoutManager();
    public abstract int getChildAdapterPosition(View child);
    public abstract long getChildItemId(View child);
    public abstract static class LayoutManager { public abstract int getItemCount(); }
}
