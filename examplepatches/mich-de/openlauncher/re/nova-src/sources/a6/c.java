package a6;

import android.os.Build;
import android.text.Editable;
import android.text.SpanWatcher;
import android.text.Spannable;
import android.text.TextWatcher;
import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: classes2.dex */
public final class c implements TextWatcher, SpanWatcher {

    /* renamed from: a, reason: collision with root package name */
    public final Object f406a;

    /* renamed from: b, reason: collision with root package name */
    public final AtomicInteger f407b = new AtomicInteger(0);

    public c(Object obj) {
        this.f406a = obj;
    }

    @Override // android.text.TextWatcher
    public final void afterTextChanged(Editable editable) {
        ((TextWatcher) this.f406a).afterTextChanged(editable);
    }

    @Override // android.text.TextWatcher
    public final void beforeTextChanged(CharSequence charSequence, int i5, int i11, int i12) {
        ((TextWatcher) this.f406a).beforeTextChanged(charSequence, i5, i11, i12);
    }

    @Override // android.text.SpanWatcher
    public final void onSpanAdded(Spannable spannable, Object obj, int i5, int i11) {
        this.f407b.get();
        ((SpanWatcher) this.f406a).onSpanAdded(spannable, obj, i5, i11);
    }

    /* JADX WARN: Removed duplicated region for block: B:9:0x0014 A[PHI: r11
      0x0014: PHI (r11v1 int) = (r11v0 int), (r11v3 int) binds: [B:3:0x0009, B:7:0x000f] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // android.text.SpanWatcher
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void onSpanChanged(Spannable spannable, Object obj, int i5, int i11, int i12, int i13) {
        int i14;
        int i15;
        this.f407b.get();
        if (Build.VERSION.SDK_INT >= 28) {
            i14 = i5;
            i15 = i12;
        } else {
            if (i5 > i11) {
                i5 = 0;
            }
            if (i12 > i13) {
                i14 = i5;
                i15 = 0;
            }
        }
        ((SpanWatcher) this.f406a).onSpanChanged(spannable, obj, i14, i11, i15, i13);
    }

    @Override // android.text.SpanWatcher
    public final void onSpanRemoved(Spannable spannable, Object obj, int i5, int i11) {
        this.f407b.get();
        ((SpanWatcher) this.f406a).onSpanRemoved(spannable, obj, i5, i11);
    }

    @Override // android.text.TextWatcher
    public final void onTextChanged(CharSequence charSequence, int i5, int i11, int i12) {
        ((TextWatcher) this.f406a).onTextChanged(charSequence, i5, i11, i12);
    }
}
