package com.google.android.material.timepicker;

import android.content.Context;
import android.content.res.Resources;
import android.view.View;

/* loaded from: classes3.dex */
public final class s extends a {

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f34517e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ TimeModel f34518f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s(Context context, TimeModel timeModel, int i5) {
        super(context, 2132018216);
        this.f34517e = i5;
        switch (i5) {
            case 1:
                this.f34518f = timeModel;
                super(context, 2132018218);
                break;
            default:
                this.f34518f = timeModel;
                break;
        }
    }

    @Override // com.google.android.material.timepicker.a, a5.b
    public final void d(View view, b5.g gVar) {
        switch (this.f34517e) {
            case 0:
                super.d(view, gVar);
                Resources resources = view.getResources();
                TimeModel timeModel = this.f34518f;
                gVar.C(resources.getString(timeModel.f34470c == 1 ? 2132018215 : 2132018217, String.valueOf(timeModel.b())));
                break;
            default:
                super.d(view, gVar);
                gVar.C(view.getResources().getString(2132018219, String.valueOf(this.f34518f.f34472e)));
                break;
        }
    }
}
