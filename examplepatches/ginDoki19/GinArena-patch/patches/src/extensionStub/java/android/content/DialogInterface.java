package android.content;
public interface DialogInterface {
    void cancel();
    void dismiss();
    interface OnClickListener {
        void onClick(DialogInterface dialog, int which);
    }
}
