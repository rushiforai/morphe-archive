package androidx.preference;

import android.content.Context;
import android.content.res.TypedArray;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.View;
import androidx.compose.ui.node.LayoutNode;
import b5.g;
import com.google.android.material.datepicker.n;
import fg.a;
import r6.c;
import r6.h;

/* loaded from: classes2.dex */
public class Preference implements Comparable<Preference> {

    /* renamed from: a, reason: collision with root package name */
    public final Context f14769a;

    /* renamed from: b, reason: collision with root package name */
    public final int f14770b;

    /* renamed from: c, reason: collision with root package name */
    public final CharSequence f14771c;

    /* renamed from: d, reason: collision with root package name */
    public final CharSequence f14772d;

    /* renamed from: e, reason: collision with root package name */
    public final String f14773e;

    /* renamed from: f, reason: collision with root package name */
    public final String f14774f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f14775g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f14776h;

    /* renamed from: i, reason: collision with root package name */
    public final Object f14777i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f14778j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f14779k;

    /* renamed from: l, reason: collision with root package name */
    public c f14780l;

    public Preference(Context context, AttributeSet attributeSet, int i5) {
        this.f14770b = LayoutNode.NotPlacedPlaceOrder;
        this.f14775g = true;
        this.f14776h = true;
        this.f14778j = true;
        this.f14779k = true;
        new n(this, 9);
        this.f14769a = context;
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, h.f85544f, i5, 0);
        typedArrayObtainStyledAttributes.getResourceId(23, typedArrayObtainStyledAttributes.getResourceId(0, 0));
        String string = typedArrayObtainStyledAttributes.getString(26);
        this.f14773e = string == null ? typedArrayObtainStyledAttributes.getString(6) : string;
        CharSequence text = typedArrayObtainStyledAttributes.getText(34);
        this.f14771c = text == null ? typedArrayObtainStyledAttributes.getText(4) : text;
        CharSequence text2 = typedArrayObtainStyledAttributes.getText(33);
        this.f14772d = text2 == null ? typedArrayObtainStyledAttributes.getText(7) : text2;
        this.f14770b = typedArrayObtainStyledAttributes.getInt(28, typedArrayObtainStyledAttributes.getInt(8, LayoutNode.NotPlacedPlaceOrder));
        String string2 = typedArrayObtainStyledAttributes.getString(22);
        this.f14774f = string2 == null ? typedArrayObtainStyledAttributes.getString(13) : string2;
        typedArrayObtainStyledAttributes.getResourceId(27, typedArrayObtainStyledAttributes.getResourceId(3, 2131624305));
        typedArrayObtainStyledAttributes.getResourceId(35, typedArrayObtainStyledAttributes.getResourceId(9, 0));
        this.f14775g = typedArrayObtainStyledAttributes.getBoolean(21, typedArrayObtainStyledAttributes.getBoolean(2, true));
        boolean z11 = typedArrayObtainStyledAttributes.getBoolean(30, typedArrayObtainStyledAttributes.getBoolean(5, true));
        this.f14776h = z11;
        typedArrayObtainStyledAttributes.getBoolean(29, typedArrayObtainStyledAttributes.getBoolean(1, true));
        if (typedArrayObtainStyledAttributes.getString(19) == null) {
            typedArrayObtainStyledAttributes.getString(10);
        }
        typedArrayObtainStyledAttributes.getBoolean(16, typedArrayObtainStyledAttributes.getBoolean(16, z11));
        typedArrayObtainStyledAttributes.getBoolean(17, typedArrayObtainStyledAttributes.getBoolean(17, z11));
        if (typedArrayObtainStyledAttributes.hasValue(18)) {
            this.f14777i = h(typedArrayObtainStyledAttributes, 18);
        } else if (typedArrayObtainStyledAttributes.hasValue(11)) {
            this.f14777i = h(typedArrayObtainStyledAttributes, 11);
        }
        typedArrayObtainStyledAttributes.getBoolean(31, typedArrayObtainStyledAttributes.getBoolean(12, true));
        if (typedArrayObtainStyledAttributes.hasValue(32)) {
            typedArrayObtainStyledAttributes.getBoolean(32, typedArrayObtainStyledAttributes.getBoolean(14, true));
        }
        typedArrayObtainStyledAttributes.getBoolean(24, typedArrayObtainStyledAttributes.getBoolean(15, false));
        typedArrayObtainStyledAttributes.getBoolean(25, typedArrayObtainStyledAttributes.getBoolean(25, true));
        typedArrayObtainStyledAttributes.getBoolean(20, typedArrayObtainStyledAttributes.getBoolean(20, false));
        typedArrayObtainStyledAttributes.recycle();
    }

    public CharSequence a() {
        c cVar = this.f14780l;
        return cVar != null ? cVar.f(this) : this.f14772d;
    }

    public boolean b() {
        return this.f14775g && this.f14778j && this.f14779k;
    }

    public void c() {
    }

    @Override // java.lang.Comparable
    public final int compareTo(Preference preference) {
        Preference preference2 = preference;
        int i5 = preference2.f14770b;
        int i11 = this.f14770b;
        if (i11 != i5) {
            return i11 - i5;
        }
        CharSequence charSequence = preference2.f14771c;
        CharSequence charSequence2 = this.f14771c;
        if (charSequence2 == charSequence) {
            return 0;
        }
        if (charSequence2 == null) {
            return 1;
        }
        if (charSequence == null) {
            return -1;
        }
        return charSequence2.toString().compareToIgnoreCase(preference2.f14771c.toString());
    }

    public void d(boolean z11) {
    }

    public void g() {
    }

    public Object h(TypedArray typedArray, int i5) {
        return null;
    }

    public void i(g gVar) {
    }

    public void j(View view) {
        if (b() && this.f14776h) {
            g();
        }
    }

    public boolean k() {
        return !b();
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder();
        CharSequence charSequence = this.f14771c;
        if (!TextUtils.isEmpty(charSequence)) {
            sb2.append(charSequence);
            sb2.append(' ');
        }
        CharSequence charSequenceA = a();
        if (!TextUtils.isEmpty(charSequenceA)) {
            sb2.append(charSequenceA);
            sb2.append(' ');
        }
        if (sb2.length() > 0) {
            sb2.setLength(sb2.length() - 1);
        }
        return sb2.toString();
    }

    public Preference(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, a.o(context, 2130969843, 16842894));
    }
}
