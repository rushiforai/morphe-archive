package android.support.v7.widget;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;

/**
 * "CompileOnly" class
 * <p>
 * This class will not be included and "replaced" by the real package's class.
 */
public class RecyclerView extends ViewGroup {
    public RecyclerView(Context context) {
        super(context);
    }

    @Override
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
    }

    /**
     * "CompileOnly" method, which the patch adds to the class. It returns the adapter position of the item,
     * which the class looks up with a method that is obfuscated.
     */
    public static int patch_getChildAdapterPosition(RecyclerView parent, View child) {
        return -1;
    }
}
