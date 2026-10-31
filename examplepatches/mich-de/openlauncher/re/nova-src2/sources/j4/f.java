package j4;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.content.res.XmlResourceParser;
import android.util.Xml;
import android.view.LayoutInflater;
import android.view.ViewGroup;
import androidx.constraintlayout.widget.ConstraintLayout;

/* loaded from: classes2.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public final float f68953a;

    /* renamed from: b, reason: collision with root package name */
    public final float f68954b;

    /* renamed from: c, reason: collision with root package name */
    public final float f68955c;

    /* renamed from: d, reason: collision with root package name */
    public final float f68956d;

    /* renamed from: e, reason: collision with root package name */
    public final int f68957e;

    public f(Context context, XmlResourceParser xmlResourceParser) throws Resources.NotFoundException {
        this.f68953a = Float.NaN;
        this.f68954b = Float.NaN;
        this.f68955c = Float.NaN;
        this.f68956d = Float.NaN;
        this.f68957e = -1;
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(Xml.asAttributeSet(xmlResourceParser), p.f69058j);
        int indexCount = typedArrayObtainStyledAttributes.getIndexCount();
        for (int i5 = 0; i5 < indexCount; i5++) {
            int index = typedArrayObtainStyledAttributes.getIndex(i5);
            if (index == 0) {
                int resourceId = typedArrayObtainStyledAttributes.getResourceId(index, this.f68957e);
                this.f68957e = resourceId;
                String resourceTypeName = context.getResources().getResourceTypeName(resourceId);
                context.getResources().getResourceName(resourceId);
                if ("layout".equals(resourceTypeName)) {
                    new m().b((ConstraintLayout) LayoutInflater.from(context).inflate(resourceId, (ViewGroup) null));
                }
            } else if (index == 1) {
                this.f68956d = typedArrayObtainStyledAttributes.getDimension(index, this.f68956d);
            } else if (index == 2) {
                this.f68954b = typedArrayObtainStyledAttributes.getDimension(index, this.f68954b);
            } else if (index == 3) {
                this.f68955c = typedArrayObtainStyledAttributes.getDimension(index, this.f68955c);
            } else if (index == 4) {
                this.f68953a = typedArrayObtainStyledAttributes.getDimension(index, this.f68953a);
            }
        }
        typedArrayObtainStyledAttributes.recycle();
    }
}
