package android.app;
import android.content.Context;
import android.content.DialogInterface;
public class AlertDialog implements DialogInterface {
    public void show() {}
    public void dismiss() {}
    public void cancel() {}
    public void setCanceledOnTouchOutside(boolean cancel) {}
    public static class Builder {
        public Builder(Context context) {}
        public Builder setTitle(CharSequence title) { return this; }
        public Builder setMessage(CharSequence message) { return this; }
        public Builder setPositiveButton(CharSequence text, DialogInterface.OnClickListener l) { return this; }
        public Builder setNegativeButton(CharSequence text, DialogInterface.OnClickListener l) { return this; }
        public Builder setCancelable(boolean cancelable) { return this; }
        public Builder setItems(CharSequence[] items, DialogInterface.OnClickListener l) { return this; }
        public AlertDialog create() { throw new RuntimeException(); }
        public AlertDialog show() { throw new RuntimeException(); }
    }
}
