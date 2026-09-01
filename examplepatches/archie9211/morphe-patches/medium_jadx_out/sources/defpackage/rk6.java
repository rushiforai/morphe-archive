package defpackage;

import android.graphics.Rect;
import android.text.Layout;
import android.text.Spannable;
import android.view.View;
import android.view.ViewTreeObserver;
import android.widget.TextView;
import com.medium.android.common.post.paragraph.ParagraphView;
import java.lang.ref.WeakReference;
import java.util.List;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class rk6 implements ViewTreeObserver.OnPreDrawListener {
    public final /* synthetic */ int a;
    public final /* synthetic */ View b;
    public final /* synthetic */ Object c;

    public /* synthetic */ rk6(int i, View view, Object obj) {
        this.a = i;
        this.b = view;
        this.c = obj;
    }

    @Override // android.view.ViewTreeObserver.OnPreDrawListener
    public final boolean onPreDraw() {
        Layout layout;
        x45 x45Var;
        int i = this.a;
        boolean z = false;
        Object obj = this.c;
        View view = this.b;
        switch (i) {
            case 0:
                l78 l78Var = (l78) obj;
                WeakHashMap weakHashMap = ute.a;
                z4f z4fVarA = nte.a(view);
                if (z4fVarA != null && z4fVarA.a.u(8)) {
                    z = true;
                }
                l78Var.setValue(Boolean.valueOf(z));
                break;
            default:
                ParagraphView paragraphView = (ParagraphView) view;
                WeakReference weakReference = (WeakReference) obj;
                TextView textView = paragraphView.c;
                if (textView != null) {
                    CharSequence text = textView.getText();
                    Spannable spannable = text instanceof Spannable ? (Spannable) text : null;
                    if (spannable != null && textView.getLocalVisibleRect(new Rect())) {
                        Object[] spans = spannable.getSpans(0, spannable.length(), fl5.class);
                        spans.getClass();
                        List<fl5> listQ0 = k80.Q0(spans);
                        if (!listQ0.isEmpty() && (layout = textView.getLayout()) != null) {
                            for (fl5 fl5Var : listQ0) {
                                int spanStart = spannable.getSpanStart(fl5Var);
                                Integer numValueOf = Integer.valueOf(spanStart);
                                if (spanStart < 0) {
                                    numValueOf = null;
                                }
                                if (numValueOf != null) {
                                    int iIntValue = numValueOf.intValue();
                                    int spanEnd = spannable.getSpanEnd(fl5Var);
                                    Integer numValueOf2 = Integer.valueOf(spanEnd);
                                    if (spanEnd < 0) {
                                        numValueOf2 = null;
                                    }
                                    if (numValueOf2 != null) {
                                        int iIntValue2 = numValueOf2.intValue();
                                        int lineForOffset = layout.getLineForOffset(iIntValue);
                                        int lineForOffset2 = layout.getLineForOffset(iIntValue2);
                                        int lineTop = layout.getLineTop(lineForOffset);
                                        int lineBottom = layout.getLineBottom(lineForOffset2);
                                        Rect rect = new Rect();
                                        paragraphView.getLocalVisibleRect(rect);
                                        if (lineTop >= rect.top && lineBottom <= rect.bottom && (x45Var = (x45) weakReference.get()) != null) {
                                            x45Var.invoke(fl5Var.b);
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                break;
        }
        return true;
    }
}
