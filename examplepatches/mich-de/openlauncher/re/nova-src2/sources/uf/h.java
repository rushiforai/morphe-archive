package uf;

import android.view.LayoutInflater;
import android.view.ViewGroup;
import androidx.recyclerview.widget.m1;
import androidx.recyclerview.widget.s2;
import h10.r0;

/* loaded from: classes3.dex */
public final class h extends m1 {

    /* renamed from: a, reason: collision with root package name */
    public final String[] f91130a;

    /* renamed from: b, reason: collision with root package name */
    public final float[] f91131b;

    /* renamed from: c, reason: collision with root package name */
    public int f91132c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ m f91133d;

    public h(m mVar, String[] strArr, float[] fArr) {
        this.f91133d = mVar;
        this.f91130a = strArr;
        this.f91131b = fArr;
    }

    @Override // androidx.recyclerview.widget.m1
    public final int getItemCount() {
        return this.f91130a.length;
    }

    @Override // androidx.recyclerview.widget.m1
    public final void onBindViewHolder(s2 s2Var, int i5) {
        k kVar = (k) s2Var;
        String[] strArr = this.f91130a;
        if (i5 < strArr.length) {
            kVar.f91142b.setText(strArr[i5]);
        }
        if (i5 == this.f91132c) {
            kVar.itemView.setSelected(true);
            kVar.f91143c.setVisibility(0);
        } else {
            kVar.itemView.setSelected(false);
            kVar.f91143c.setVisibility(4);
        }
        kVar.itemView.setOnClickListener(new r0(this, i5));
    }

    @Override // androidx.recyclerview.widget.m1
    public final s2 onCreateViewHolder(ViewGroup viewGroup, int i5) {
        return new k(LayoutInflater.from(this.f91133d.getContext()).inflate(2131624119, viewGroup, false));
    }
}
