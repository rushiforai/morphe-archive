package k30;

import android.content.Context;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.LayoutInflater;
import android.view.ViewGroup;
import java.io.File;
import java.util.ArrayList;
import kotlin.jvm.internal.Ref;

/* loaded from: classes4.dex */
public final class m implements TextWatcher {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f71021a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f71022b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ ArrayList f71023c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ t70.j0 f71024d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ ViewGroup f71025e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ LayoutInflater f71026f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ w20.l f71027g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ Context f71028h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ c f71029i;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ String f71030j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ d9.j f71031k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f71032l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ h0 f71033m;
    public final /* synthetic */ String n;
    public final /* synthetic */ File o;

    public m(Ref.ObjectRef objectRef, boolean z11, ArrayList arrayList, t70.j0 j0Var, ViewGroup viewGroup, LayoutInflater layoutInflater, w20.l lVar, Context context, c cVar, String str, d9.j jVar, Ref.ObjectRef objectRef2, h0 h0Var, String str2, File file) {
        this.f71021a = objectRef;
        this.f71022b = z11;
        this.f71023c = arrayList;
        this.f71024d = j0Var;
        this.f71025e = viewGroup;
        this.f71026f = layoutInflater;
        this.f71027g = lVar;
        this.f71028h = context;
        this.f71029i = cVar;
        this.f71030j = str;
        this.f71031k = jVar;
        this.f71032l = objectRef2;
        this.f71033m = h0Var;
        this.n = str2;
        this.o = file;
    }

    @Override // android.text.TextWatcher
    public final void afterTextChanged(Editable editable) {
        String string;
        if (editable == null || (string = editable.toString()) == null) {
            string = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        r.f(this.f71021a, this.f71022b, this.f71023c, this.f71024d, this.f71025e, this.f71026f, this.f71027g, this.f71028h, this.f71029i, this.f71030j, this.f71031k, this.f71032l, this.f71033m, this.n, this.o, string, false);
    }

    @Override // android.text.TextWatcher
    public final void beforeTextChanged(CharSequence charSequence, int i5, int i11, int i12) {
    }

    @Override // android.text.TextWatcher
    public final void onTextChanged(CharSequence charSequence, int i5, int i11, int i12) {
    }
}
