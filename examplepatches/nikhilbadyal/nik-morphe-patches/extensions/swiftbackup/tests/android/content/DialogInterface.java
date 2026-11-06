package android.content;

/** Host-side callbacks mirror the Android signatures while never presenting or accepting real dialogs. */
public interface DialogInterface {
    interface OnDismissListener { void onDismiss(DialogInterface dialog); }
    interface OnClickListener { void onClick(DialogInterface dialog, int which); }
    interface OnMultiChoiceClickListener { void onClick(DialogInterface dialog, int which, boolean checked); }
}
