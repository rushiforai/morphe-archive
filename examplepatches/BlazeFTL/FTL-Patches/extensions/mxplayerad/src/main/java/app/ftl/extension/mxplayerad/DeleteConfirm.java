package app.ftl.extension.mxplayerad;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.view.ViewGroup;
import android.widget.Button;

public final class DeleteConfirm {
    private DeleteConfirm() {
    }

    public static boolean show(Context context, DialogInterface.OnClickListener onConfirm) {
        try {
            if (context instanceof Activity && ((Activity) context).isFinishing()) return false;

            AlertDialog dialog = new AlertDialog.Builder(context)
                    .setTitle("Delete")
                    .setMessage("The following file will be deleted permanently.")
                    .setPositiveButton("OK", onConfirm)
                    .setNegativeButton("Cancel", null)
                    .create();
            dialog.show();

            try {
                Button ok = dialog.getButton(DialogInterface.BUTTON_POSITIVE);
                ViewGroup.LayoutParams lp = ok.getLayoutParams();
                if (lp instanceof ViewGroup.MarginLayoutParams) {
                    float density = context.getResources().getDisplayMetrics().density;
                    ((ViewGroup.MarginLayoutParams) lp).leftMargin += (int) (16 * density);
                    ok.setLayoutParams(lp);
                }
            } catch (Throwable ignored) {
            }
            return true;
        } catch (Throwable t) {
            return false;
        }
    }
}
