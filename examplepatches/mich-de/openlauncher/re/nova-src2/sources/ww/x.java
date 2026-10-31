package ww;

import android.widget.AutoCompleteTextView;
import com.stripe.android.core.model.Country;
import java.util.Iterator;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class x implements AutoCompleteTextView.Validator {

    /* renamed from: a, reason: collision with root package name */
    public final g f94859a;

    /* renamed from: b, reason: collision with root package name */
    public final pu.f0 f94860b;

    public x(g gVar, pu.f0 f0Var) {
        this.f94859a = gVar;
        this.f94860b = f0Var;
    }

    @Override // android.widget.AutoCompleteTextView.Validator
    public final CharSequence fixText(CharSequence charSequence) {
        return charSequence == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : charSequence;
    }

    @Override // android.widget.AutoCompleteTextView.Validator
    public final boolean isValid(CharSequence charSequence) {
        Object next;
        Iterator it = this.f94859a.f94775b.iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            if (Intrinsics.b(((Country) next).f42573b, String.valueOf(charSequence))) {
                break;
            }
        }
        this.f94860b.invoke(next);
        return ((Country) next) != null;
    }
}
