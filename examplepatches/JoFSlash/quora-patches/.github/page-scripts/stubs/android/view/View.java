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

    public void setAlpha(float alpha) {
    }

    public boolean post(Runnable action) {
        return true;
    }

    public boolean postDelayed(Runnable action, long delayMillis) {
        return true;
    }

    public boolean isAttachedToWindow() {
        return false;
    }

    public void setOnClickListener(OnClickListener listener) {
    }

    public interface OnClickListener {
        void onClick(View v);
    }

    public interface OnLongClickListener {
        boolean onLongClick(View v);
    }
}
