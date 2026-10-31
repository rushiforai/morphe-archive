package a6;

import android.text.Editable;
import android.text.SpannableStringBuilder;
import java.lang.reflect.Array;
import java.util.ArrayList;
import v30.e;

/* loaded from: classes2.dex */
public final class d extends SpannableStringBuilder {

    /* renamed from: a, reason: collision with root package name */
    public final Class f408a;

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f409b;

    public d(Class cls, CharSequence charSequence) {
        super(charSequence);
        this.f409b = new ArrayList();
        e.d(cls, "watcherClass cannot be null");
        this.f408a = cls;
    }

    public final c a(Object obj) {
        int i5 = 0;
        while (true) {
            ArrayList arrayList = this.f409b;
            if (i5 >= arrayList.size()) {
                return null;
            }
            c cVar = (c) arrayList.get(i5);
            if (cVar.f406a == obj) {
                return cVar;
            }
            i5++;
        }
    }

    @Override // android.text.SpannableStringBuilder, android.text.Editable, java.lang.Appendable
    public final Editable append(CharSequence charSequence) {
        super.append(charSequence);
        return this;
    }

    public final boolean b(Object obj) {
        if (obj != null) {
            return this.f408a == obj.getClass();
        }
        return false;
    }

    @Override // android.text.SpannableStringBuilder, android.text.Editable
    public final Editable delete(int i5, int i11) {
        super.delete(i5, i11);
        return this;
    }

    @Override // android.text.SpannableStringBuilder, android.text.Spanned
    public final int getSpanEnd(Object obj) {
        c cVarA;
        if (b(obj) && (cVarA = a(obj)) != null) {
            obj = cVarA;
        }
        return super.getSpanEnd(obj);
    }

    @Override // android.text.SpannableStringBuilder, android.text.Spanned
    public final int getSpanFlags(Object obj) {
        c cVarA;
        if (b(obj) && (cVarA = a(obj)) != null) {
            obj = cVarA;
        }
        return super.getSpanFlags(obj);
    }

    @Override // android.text.SpannableStringBuilder, android.text.Spanned
    public final int getSpanStart(Object obj) {
        c cVarA;
        if (b(obj) && (cVarA = a(obj)) != null) {
            obj = cVarA;
        }
        return super.getSpanStart(obj);
    }

    @Override // android.text.SpannableStringBuilder, android.text.Spanned
    public final Object[] getSpans(int i5, int i11, Class cls) {
        if (this.f408a != cls) {
            return super.getSpans(i5, i11, cls);
        }
        c[] cVarArr = (c[]) super.getSpans(i5, i11, c.class);
        Object[] objArr = (Object[]) Array.newInstance((Class<?>) cls, cVarArr.length);
        for (int i12 = 0; i12 < cVarArr.length; i12++) {
            objArr[i12] = cVarArr[i12].f406a;
        }
        return objArr;
    }

    @Override // android.text.SpannableStringBuilder, android.text.Editable
    public final Editable insert(int i5, CharSequence charSequence) {
        super.insert(i5, charSequence);
        return this;
    }

    @Override // android.text.SpannableStringBuilder, android.text.Spanned
    public final int nextSpanTransition(int i5, int i11, Class cls) {
        if (cls == null || this.f408a == cls) {
            cls = c.class;
        }
        return super.nextSpanTransition(i5, i11, cls);
    }

    @Override // android.text.SpannableStringBuilder, android.text.Spannable
    public final void removeSpan(Object obj) {
        c cVarA;
        if (b(obj)) {
            cVarA = a(obj);
            if (cVarA != null) {
                obj = cVarA;
            }
        } else {
            cVarA = null;
        }
        super.removeSpan(obj);
        if (cVarA != null) {
            this.f409b.remove(cVarA);
        }
    }

    @Override // android.text.SpannableStringBuilder, android.text.Editable
    public final /* bridge */ /* synthetic */ Editable replace(int i5, int i11, CharSequence charSequence) {
        replace(i5, i11, charSequence);
        return this;
    }

    @Override // android.text.SpannableStringBuilder, android.text.Spannable
    public final void setSpan(Object obj, int i5, int i11, int i12) {
        if (b(obj)) {
            c cVar = new c(obj);
            this.f409b.add(cVar);
            obj = cVar;
        }
        super.setSpan(obj, i5, i11, i12);
    }

    @Override // android.text.SpannableStringBuilder, java.lang.CharSequence
    public final CharSequence subSequence(int i5, int i11) {
        return new d(this.f408a, this, i5, i11);
    }

    @Override // android.text.SpannableStringBuilder, android.text.Editable, java.lang.Appendable
    public final SpannableStringBuilder append(CharSequence charSequence) {
        super.append(charSequence);
        return this;
    }

    @Override // android.text.SpannableStringBuilder, android.text.Editable
    public final SpannableStringBuilder delete(int i5, int i11) {
        super.delete(i5, i11);
        return this;
    }

    @Override // android.text.SpannableStringBuilder, android.text.Editable
    public final SpannableStringBuilder insert(int i5, CharSequence charSequence) {
        super.insert(i5, charSequence);
        return this;
    }

    @Override // android.text.SpannableStringBuilder, android.text.Editable
    public final /* bridge */ /* synthetic */ Editable replace(int i5, int i11, CharSequence charSequence, int i12, int i13) {
        replace(i5, i11, charSequence, i12, i13);
        return this;
    }

    @Override // android.text.SpannableStringBuilder, android.text.Editable, java.lang.Appendable
    public final Appendable append(CharSequence charSequence) {
        super.append(charSequence);
        return this;
    }

    @Override // android.text.SpannableStringBuilder, android.text.Editable
    public final Editable insert(int i5, CharSequence charSequence, int i11, int i12) {
        super.insert(i5, charSequence, i11, i12);
        return this;
    }

    @Override // android.text.SpannableStringBuilder, android.text.Editable
    public final SpannableStringBuilder replace(int i5, int i11, CharSequence charSequence) {
        ArrayList arrayList;
        int i12 = 0;
        while (true) {
            arrayList = this.f409b;
            if (i12 >= arrayList.size()) {
                break;
            }
            ((c) arrayList.get(i12)).f407b.incrementAndGet();
            i12++;
        }
        super.replace(i5, i11, charSequence);
        for (int i13 = 0; i13 < arrayList.size(); i13++) {
            ((c) arrayList.get(i13)).f407b.decrementAndGet();
        }
        return this;
    }

    @Override // android.text.SpannableStringBuilder, android.text.Editable, java.lang.Appendable
    public final Editable append(char c11) {
        super.append(c11);
        return this;
    }

    @Override // android.text.SpannableStringBuilder, android.text.Editable
    public final SpannableStringBuilder insert(int i5, CharSequence charSequence, int i11, int i12) {
        super.insert(i5, charSequence, i11, i12);
        return this;
    }

    public d(Class cls, d dVar, int i5, int i11) {
        super(dVar, i5, i11);
        this.f409b = new ArrayList();
        e.d(cls, "watcherClass cannot be null");
        this.f408a = cls;
    }

    @Override // android.text.SpannableStringBuilder, android.text.Editable, java.lang.Appendable
    public final SpannableStringBuilder append(char c11) {
        super.append(c11);
        return this;
    }

    @Override // android.text.SpannableStringBuilder, android.text.Editable, java.lang.Appendable
    public final Appendable append(char c11) {
        super.append(c11);
        return this;
    }

    @Override // android.text.SpannableStringBuilder, android.text.Editable, java.lang.Appendable
    public final Editable append(CharSequence charSequence, int i5, int i11) {
        super.append(charSequence, i5, i11);
        return this;
    }

    @Override // android.text.SpannableStringBuilder, android.text.Editable, java.lang.Appendable
    public final SpannableStringBuilder append(CharSequence charSequence, int i5, int i11) {
        super.append(charSequence, i5, i11);
        return this;
    }

    @Override // android.text.SpannableStringBuilder, android.text.Editable, java.lang.Appendable
    public final Appendable append(CharSequence charSequence, int i5, int i11) {
        super.append(charSequence, i5, i11);
        return this;
    }

    @Override // android.text.SpannableStringBuilder
    public final SpannableStringBuilder append(CharSequence charSequence, Object obj, int i5) {
        super.append(charSequence, obj, i5);
        return this;
    }

    @Override // android.text.SpannableStringBuilder, android.text.Editable
    public final SpannableStringBuilder replace(int i5, int i11, CharSequence charSequence, int i12, int i13) {
        ArrayList arrayList;
        int i14 = 0;
        while (true) {
            arrayList = this.f409b;
            if (i14 >= arrayList.size()) {
                break;
            }
            ((c) arrayList.get(i14)).f407b.incrementAndGet();
            i14++;
        }
        super.replace(i5, i11, charSequence, i12, i13);
        for (int i15 = 0; i15 < arrayList.size(); i15++) {
            ((c) arrayList.get(i15)).f407b.decrementAndGet();
        }
        return this;
    }
}
