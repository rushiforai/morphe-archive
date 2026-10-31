package fb;

import aa.z;
import ab.f0;
import android.os.Handler;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.KeyEvent;
import android.view.View;
import android.widget.ImageButton;
import bm.t;
import com.android.launcher3.ExtendedEditText;
import com.android.launcher3.widget.picker.WidgetsFullSheet;
import fa.l0;
import java.util.ArrayList;
import java.util.List;
import o9.n0;
import za.d;

/* loaded from: classes2.dex */
public final class c implements TextWatcher, n0, View.OnKeyListener {

    /* renamed from: a, reason: collision with root package name */
    public io.sentry.internal.debugmeta.c f54581a;

    /* renamed from: b, reason: collision with root package name */
    public ExtendedEditText f54582b;

    /* renamed from: c, reason: collision with root package name */
    public ImageButton f54583c;

    /* renamed from: d, reason: collision with root package name */
    public WidgetsFullSheet f54584d;

    /* renamed from: e, reason: collision with root package name */
    public String f54585e;

    @Override // o9.n0
    public final void F() {
        ExtendedEditText extendedEditText = this.f54582b;
        extendedEditText.clearFocus();
        ((d) d.p(extendedEditText.getContext())).h();
    }

    @Override // android.text.TextWatcher
    public final void afterTextChanged(Editable editable) {
        ImageButton imageButton = this.f54583c;
        WidgetsFullSheet widgetsFullSheet = this.f54584d;
        io.sentry.internal.debugmeta.c cVar = this.f54581a;
        Handler handler = (Handler) cVar.f67327a;
        String string = editable.toString();
        this.f54585e = string;
        if (string.isEmpty()) {
            handler.removeCallbacksAndMessages(null);
            widgetsFullSheet.q();
            imageButton.setVisibility(8);
            return;
        }
        widgetsFullSheet.c();
        String str = this.f54585e;
        t tVar = (t) cVar.f67328b;
        ArrayList arrayList = new ArrayList();
        ((List) tVar.f18113e).stream().filter(new z(3)).forEach(new f0(7, str, arrayList));
        handler.post(new l0(this, str, arrayList));
        imageButton.setVisibility(0);
    }

    @Override // android.text.TextWatcher
    public final void beforeTextChanged(CharSequence charSequence, int i5, int i11, int i12) {
    }

    @Override // android.view.View.OnKeyListener
    public final boolean onKey(View view, int i5, KeyEvent keyEvent) {
        if (i5 != 66 || keyEvent.getAction() != 1) {
            return false;
        }
        ExtendedEditText extendedEditText = this.f54582b;
        extendedEditText.clearFocus();
        ((d) d.p(extendedEditText.getContext())).h();
        return true;
    }

    @Override // android.text.TextWatcher
    public final void onTextChanged(CharSequence charSequence, int i5, int i11, int i12) {
    }
}
