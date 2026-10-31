package androidx.appcompat.app;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.widget.ListView;
import l.a;

/* loaded from: classes2.dex */
public class AlertController$RecycleListView extends ListView {

    /* renamed from: a, reason: collision with root package name */
    public final int f13603a;

    /* renamed from: b, reason: collision with root package name */
    public final int f13604b;

    public AlertController$RecycleListView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, a.f72905t);
        this.f13604b = typedArrayObtainStyledAttributes.getDimensionPixelOffset(0, -1);
        this.f13603a = typedArrayObtainStyledAttributes.getDimensionPixelOffset(1, -1);
    }
}
