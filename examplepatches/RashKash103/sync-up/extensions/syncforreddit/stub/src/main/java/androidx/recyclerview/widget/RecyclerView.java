package androidx.recyclerview.widget;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;

/**
 * Named as the recycler library is named in the app: the class keeps its name through the
 * minifier, and only its members are renamed, so each one is declared here under the name the
 * app actually carries.
 *
 * <p>Compile only.
 */
public abstract class RecyclerView extends ViewGroup {
    public RecyclerView(Context context) {
        super(context);
    }

    /** {@code getAdapter()}. */
    public h e0() {
        return null;
    }

    /** {@code getLayoutManager()}. */
    public p r0() {
        return null;
    }

    /**
     * What a row is drawn into, and the view it holds: a row of a settings screen is drawn
     * through one, and reaching into that view is how a row shows anything the app does not.
     */
    public static class c0 {
        public View itemView;
    }

    /** {@code RecyclerView.Adapter}. */
    public static class h {
        /** {@code getItemCount()}. */
        public int n() {
            return 0;
        }

        /**
         * {@code getItemId(int)}. The feed's adapter answers this out of the {@code hash} column
         * of its cursor, which is the one thing about a post that does not move when the rows
         * around it are swept away.
         */
        public long o(int position) {
            return 0L;
        }
    }

    /** {@code RecyclerView.LayoutManager}. */
    public static class p {
        /** {@code getPosition(View)}, the adapter position a laid-out child was drawn for. */
        public int n0(View child) {
            return 0;
        }

        /** {@code scrollToPosition(int)}, which every manager carries. */
        public void D1(int position) {
        }
    }
}
