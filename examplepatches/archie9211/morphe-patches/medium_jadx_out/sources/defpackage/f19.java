package defpackage;

import android.content.Context;
import android.net.Uri;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import com.medium.android.common.post.text.ParagraphEditText;
import com.medium.proto.model.SectionModel;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class f19 implements View.OnClickListener {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;

    public /* synthetic */ f19(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        int i = this.a;
        Object obj = this.c;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                ParagraphEditText paragraphEditText = (ParagraphEditText) obj;
                int i2 = ParagraphEditText.g;
                Context context = ((ParagraphEditText) obj2).getContext();
                context.getClass();
                InputMethodManager inputMethodManager = (InputMethodManager) context.getSystemService(InputMethodManager.class);
                if (inputMethodManager != null) {
                    inputMethodManager.showSoftInput(paragraphEditText, 1);
                }
                break;
            case 1:
                ((l19) obj2).b.invoke((SectionModel) obj);
                break;
            case 2:
                v19 v19Var = (v19) obj2;
                v19Var.c.c(Uri.parse((String) obj), v19Var.b);
                break;
            default:
                ((View.OnClickListener) obj).onClick(view);
                ((ahc) obj2).a(1);
                break;
        }
    }
}
