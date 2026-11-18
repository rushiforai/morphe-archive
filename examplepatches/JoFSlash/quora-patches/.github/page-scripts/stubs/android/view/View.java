package android.view;

/** Test stand-in: the page patches only ask a View for its context and a few setters. */
public class View {
    public android.content.Context getContext() {
        return null;
    }

    public android.content.res.Resources getResources() {
        return null;
    }

    public void setKeepScreenOn(boolean keepScreenOn) {
    }

    public void setBackgroundColor(int color) {
    }

    public void setOnLongClickListener(OnLongClickListener listener) {
    }

    public void setPadding(int left, int top, int right, int bottom) {
    }

    public interface OnLongClickListener {
        boolean onLongClick(View v);
    }
}
