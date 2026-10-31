package g20;

import android.content.Context;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.text.Editable;
import android.text.Html;
import h6.c1;
import kotlin.jvm.internal.Intrinsics;
import org.xml.sax.XMLReader;

/* loaded from: classes.dex */
public final class x implements Html.TagHandler {

    /* renamed from: a, reason: collision with root package name */
    public final Context f57013a;

    /* renamed from: b, reason: collision with root package name */
    public int f57014b = -1;

    public x(Context context) {
        this.f57013a = context;
    }

    @Override // android.text.Html.TagHandler
    public final void handleTag(boolean z11, String str, Editable editable, XMLReader xMLReader) {
        Drawable colorDrawable;
        if (Intrinsics.b(str, "icon")) {
            if (z11) {
                this.f57014b = editable.length();
                return;
            }
            String string = editable.subSequence(this.f57014b, editable.length()).toString();
            boolean zB = Intrinsics.b(string, "work");
            Context context = this.f57013a;
            if (zB) {
                colorDrawable = context.getDrawable(2131231504);
                Intrinsics.d(colorDrawable);
            } else if (Intrinsics.b(string, "dual")) {
                colorDrawable = context.getDrawable(2131231541);
                Intrinsics.d(colorDrawable);
            } else {
                colorDrawable = new ColorDrawable(0);
            }
            if (!(colorDrawable instanceof ColorDrawable)) {
                colorDrawable.setBounds(0, 0, c1.h(context, 48), c1.h(context, 48));
            }
            editable.setSpan(new f(colorDrawable, 0), this.f57014b, editable.length(), 33);
            this.f57014b = -1;
        }
    }
}
