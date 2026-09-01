package defpackage;

import android.app.Activity;
import android.content.ClipData;
import android.os.Build;
import android.text.Selection;
import android.text.Spannable;
import android.view.DragEvent;
import android.view.View;
import android.widget.TextView;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class s20 {
    public static boolean a(DragEvent dragEvent, TextView textView, Activity activity) {
        m82 l82Var;
        activity.requestDragAndDropPermissions(dragEvent);
        int offsetForPosition = textView.getOffsetForPosition(dragEvent.getX(), dragEvent.getY());
        textView.beginBatchEdit();
        try {
            Selection.setSelection((Spannable) textView.getText(), offsetForPosition);
            ClipData clipData = dragEvent.getClipData();
            if (Build.VERSION.SDK_INT >= 31) {
                l82Var = new l82(clipData, 3);
            } else {
                n82 n82Var = new n82();
                n82Var.b = clipData;
                n82Var.c = 3;
                l82Var = n82Var;
            }
            ute.k(textView, l82Var.build());
            textView.endBatchEdit();
            return true;
        } catch (Throwable th) {
            textView.endBatchEdit();
            throw th;
        }
    }

    public static boolean b(DragEvent dragEvent, View view, Activity activity) {
        m82 l82Var;
        activity.requestDragAndDropPermissions(dragEvent);
        ClipData clipData = dragEvent.getClipData();
        if (Build.VERSION.SDK_INT >= 31) {
            l82Var = new l82(clipData, 3);
        } else {
            n82 n82Var = new n82();
            n82Var.b = clipData;
            n82Var.c = 3;
            l82Var = n82Var;
        }
        ute.k(view, l82Var.build());
        return true;
    }
}
