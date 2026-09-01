package defpackage;

import android.R;
import android.content.res.TypedArray;
import android.os.Message;
import android.view.View;
import androidx.appcompat.widget.Toolbar;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u5 implements View.OnClickListener {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ u5(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        Message message;
        Message message2;
        Message message3;
        int i = this.a;
        Message messageObtain = null;
        messageObtain = null;
        Object obj = this.b;
        switch (i) {
            case 0:
                ((l6) obj).b();
                break;
            case 1:
                zc zcVar = (zc) obj;
                if (view == zcVar.g && (message3 = zcVar.i) != null) {
                    messageObtain = Message.obtain(message3);
                } else if (view == zcVar.j && (message2 = zcVar.l) != null) {
                    messageObtain = Message.obtain(message2);
                } else if (view == zcVar.m && (message = zcVar.o) != null) {
                    messageObtain = Message.obtain(message);
                }
                if (messageObtain != null) {
                    messageObtain.sendToTarget();
                }
                zcVar.C.obtainMessage(1, zcVar.b).sendToTarget();
                break;
            case 2:
                cw0 cw0Var = (cw0) obj;
                if (cw0Var.k && cw0Var.isShowing()) {
                    if (!cw0Var.m) {
                        TypedArray typedArrayObtainStyledAttributes = cw0Var.getContext().obtainStyledAttributes(new int[]{R.attr.windowCloseOnTouchOutside});
                        cw0Var.l = typedArrayObtainStyledAttributes.getBoolean(0, true);
                        typedArrayObtainStyledAttributes.recycle();
                        cw0Var.m = true;
                    }
                    if (cw0Var.l) {
                        cw0Var.cancel();
                    }
                    break;
                }
                break;
            default:
                und undVar = ((Toolbar) obj).L;
                sx7 sx7Var = undVar != null ? undVar.b : null;
                if (sx7Var != null) {
                    sx7Var.collapseActionView();
                }
                break;
        }
    }
}
