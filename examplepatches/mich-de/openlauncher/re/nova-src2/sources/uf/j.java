package uf;

import android.graphics.drawable.Drawable;
import android.view.LayoutInflater;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.recyclerview.widget.m1;
import androidx.recyclerview.widget.s2;

/* loaded from: classes3.dex */
public final class j extends m1 {

    /* renamed from: a, reason: collision with root package name */
    public final String[] f91138a;

    /* renamed from: b, reason: collision with root package name */
    public final String[] f91139b;

    /* renamed from: c, reason: collision with root package name */
    public final Drawable[] f91140c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ m f91141d;

    public j(m mVar, String[] strArr, Drawable[] drawableArr) {
        this.f91141d = mVar;
        this.f91138a = strArr;
        this.f91139b = new String[strArr.length];
        this.f91140c = drawableArr;
    }

    @Override // androidx.recyclerview.widget.m1
    public final int getItemCount() {
        return this.f91138a.length;
    }

    @Override // androidx.recyclerview.widget.m1
    public final long getItemId(int i5) {
        return i5;
    }

    @Override // androidx.recyclerview.widget.m1
    public final void onBindViewHolder(s2 s2Var, int i5) {
        i iVar = (i) s2Var;
        TextView textView = iVar.f91134b;
        ImageView imageView = iVar.f91136d;
        TextView textView2 = iVar.f91135c;
        textView.setText(this.f91138a[i5]);
        String str = this.f91139b[i5];
        if (str == null) {
            textView2.setVisibility(8);
        } else {
            textView2.setText(str);
        }
        Drawable drawable = this.f91140c[i5];
        if (drawable == null) {
            imageView.setVisibility(8);
        } else {
            imageView.setImageDrawable(drawable);
        }
    }

    @Override // androidx.recyclerview.widget.m1
    public final s2 onCreateViewHolder(ViewGroup viewGroup, int i5) {
        m mVar = this.f91141d;
        return new i(mVar, LayoutInflater.from(mVar.getContext()).inflate(2131624118, viewGroup, false));
    }
}
