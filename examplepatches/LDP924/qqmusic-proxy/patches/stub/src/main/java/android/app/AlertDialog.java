package android.app;

import android.content.Context;
import android.content.DialogInterface;
import android.view.View;

public class AlertDialog {
    public static class Builder {
        public Builder(Context ctx) {}
        public Builder setTitle(CharSequence t) { return this; }
        public Builder setView(View v) { return this; }
        public Builder setPositiveButton(CharSequence t, DialogInterface.OnClickListener l) { return this; }
        public Builder setNegativeButton(CharSequence t, DialogInterface.OnClickListener l) { return this; }
        public AlertDialog show() { return null; }
    }
}
