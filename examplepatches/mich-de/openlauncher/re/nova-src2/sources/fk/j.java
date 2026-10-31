package fk;

import android.text.Editable;

/* loaded from: classes3.dex */
public final class j extends tj.h {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ m f55197a;

    public j(m mVar) {
        this.f55197a = mVar;
    }

    @Override // android.text.TextWatcher
    public final void afterTextChanged(Editable editable) {
        this.f55197a.b().a();
    }

    @Override // tj.h, android.text.TextWatcher
    public final void beforeTextChanged(CharSequence charSequence, int i5, int i11, int i12) {
        this.f55197a.b().b();
    }
}
