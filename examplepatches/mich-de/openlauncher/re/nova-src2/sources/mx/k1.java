package mx;

import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.recyclerview.widget.s2;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class k1 extends s2 implements View.OnClickListener {

    /* renamed from: h, reason: collision with root package name */
    public static final int[] f77192h = new int[0];

    /* renamed from: i, reason: collision with root package name */
    public static final int[] f77193i = {16842920};

    /* renamed from: b, reason: collision with root package name */
    public kb.a f77194b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f77195c;

    /* renamed from: d, reason: collision with root package name */
    public final ImageView f77196d;

    /* renamed from: e, reason: collision with root package name */
    public final TextView f77197e;

    /* renamed from: f, reason: collision with root package name */
    public final ImageView f77198f;

    /* renamed from: g, reason: collision with root package name */
    public final TextView f77199g;

    public k1(View view) {
        super(view);
        this.f77195c = false;
        this.f77196d = (ImageView) view.findViewById(2131428227);
        this.f77197e = (TextView) view.findViewById(16908308);
        this.f77198f = (ImageView) view.findViewById(16908294);
        this.f77199g = (TextView) view.findViewById(2131427776);
        ((TextView) view.findViewById(16908309)).setVisibility(8);
    }

    public final void a(boolean z11) {
        this.f77195c = z11;
        ImageView imageView = this.f77196d;
        Intrinsics.d(imageView);
        imageView.setImageState(z11 ? f77193i : f77192h, false);
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        if (!this.f77195c) {
            a(true);
            kb.a aVar = this.f77194b;
            if (aVar != null) {
                int adapterPosition = getAdapterPosition();
                Object objB = aVar.b(adapterPosition);
                if (objB instanceof lb.b) {
                    lb.b bVar = (lb.b) objB;
                    if (bVar.f74821a) {
                        return;
                    }
                    bVar.f74821a = true;
                    List listA = bVar.f74822b.a();
                    if (listA != null) {
                        int size = listA.size();
                        for (int i5 = 0; i5 < size; i5++) {
                            aVar.f71311a.add(adapterPosition + i5 + 1, listA.get(i5));
                        }
                        aVar.notifyItemRangeInserted(adapterPosition + 1, size);
                        return;
                    }
                    return;
                }
                return;
            }
            return;
        }
        a(false);
        kb.a aVar2 = this.f77194b;
        if (aVar2 != null) {
            int adapterPosition2 = getAdapterPosition();
            Object objB2 = aVar2.b(adapterPosition2);
            if (objB2 instanceof lb.b) {
                lb.b bVar2 = (lb.b) objB2;
                if (bVar2.f74821a) {
                    bVar2.f74821a = false;
                    List listA2 = bVar2.f74822b.a();
                    if (listA2 != null) {
                        int size2 = listA2.size();
                        for (int i11 = size2 - 1; i11 >= 0; i11--) {
                            aVar2.f71311a.remove(adapterPosition2 + i11 + 1);
                        }
                        aVar2.notifyItemRangeRemoved(adapterPosition2 + 1, size2);
                    }
                }
            }
        }
    }
}
