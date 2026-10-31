package com.bytedance.adsdk.ugeno.lt;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.SparseIntArray;
import android.view.View;
import android.view.ViewGroup;
import com.bytedance.adsdk.ugeno.fby.ul;
import com.bytedance.adsdk.ugeno.lt.dj;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes2.dex */
public class lud extends ViewGroup implements com.bytedance.adsdk.ugeno.lt.ycx {

    /* renamed from: dj, reason: collision with root package name */
    private int f22408dj;

    /* renamed from: dy, reason: collision with root package name */
    private List<sya> f22409dy;

    /* renamed from: ea, reason: collision with root package name */
    private int f22410ea;
    private Drawable fby;

    /* renamed from: jc, reason: collision with root package name */
    private int f22411jc;

    /* renamed from: jw, reason: collision with root package name */
    private int f22412jw;

    /* renamed from: lt, reason: collision with root package name */
    private int f22413lt;
    private int lud;

    /* renamed from: ok, reason: collision with root package name */
    private int f22414ok;
    private dj.ycx pmi;

    /* renamed from: ry, reason: collision with root package name */
    private int[] f22415ry;
    private int sya;
    private dj syc;

    /* renamed from: ul, reason: collision with root package name */
    private Drawable f22416ul;
    private com.bytedance.adsdk.ugeno.lud wie;
    private SparseIntArray xkz;
    private int ycx;

    /* renamed from: zb, reason: collision with root package name */
    private int f22417zb;

    public static class ycx extends ViewGroup.MarginLayoutParams implements zb {
        public static final Parcelable.Creator<ycx> CREATOR = new Parcelable.Creator<ycx>() { // from class: com.bytedance.adsdk.ugeno.lt.lud.ycx.1
            @Override // android.os.Parcelable.Creator
            /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
            public ycx createFromParcel(Parcel parcel) {
                return new ycx(parcel);
            }

            @Override // android.os.Parcelable.Creator
            /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
            public ycx[] newArray(int i5) {
                return new ycx[i5];
            }
        };

        /* renamed from: dj, reason: collision with root package name */
        private int f22418dj;
        private int fby;

        /* renamed from: jc, reason: collision with root package name */
        private boolean f22419jc;

        /* renamed from: jw, reason: collision with root package name */
        private int f22420jw;

        /* renamed from: lt, reason: collision with root package name */
        private int f22421lt;
        private float lud;
        private float sya;

        /* renamed from: ul, reason: collision with root package name */
        private int f22422ul;
        private int ycx;

        /* renamed from: zb, reason: collision with root package name */
        private float f22423zb;

        public ycx(ycx ycxVar) {
            super((ViewGroup.MarginLayoutParams) ycxVar);
            this.ycx = 1;
            this.f22423zb = 0.0f;
            this.sya = 0.0f;
            this.f22418dj = -1;
            this.lud = -1.0f;
            this.f22421lt = -1;
            this.f22422ul = -1;
            this.fby = 16777215;
            this.f22420jw = 16777215;
            this.ycx = ycxVar.ycx;
            this.f22423zb = ycxVar.f22423zb;
            this.sya = ycxVar.sya;
            this.f22418dj = ycxVar.f22418dj;
            this.lud = ycxVar.lud;
            this.f22421lt = ycxVar.f22421lt;
            this.f22422ul = ycxVar.f22422ul;
            this.fby = ycxVar.fby;
            this.f22420jw = ycxVar.f22420jw;
            this.f22419jc = ycxVar.f22419jc;
        }

        @Override // android.os.Parcelable
        public int describeContents() {
            return 0;
        }

        @Override // com.bytedance.adsdk.ugeno.lt.zb
        public float dj() {
            return this.f22423zb;
        }

        @Override // com.bytedance.adsdk.ugeno.lt.zb
        public int dy() {
            return ((ViewGroup.MarginLayoutParams) this).bottomMargin;
        }

        @Override // com.bytedance.adsdk.ugeno.lt.zb
        public boolean ea() {
            return this.f22419jc;
        }

        @Override // com.bytedance.adsdk.ugeno.lt.zb
        public int fby() {
            return this.f22422ul;
        }

        @Override // com.bytedance.adsdk.ugeno.lt.zb
        public int jc() {
            return this.f22420jw;
        }

        @Override // com.bytedance.adsdk.ugeno.lt.zb
        public int jw() {
            return this.fby;
        }

        @Override // com.bytedance.adsdk.ugeno.lt.zb
        public int lt() {
            return this.f22418dj;
        }

        @Override // com.bytedance.adsdk.ugeno.lt.zb
        public float lud() {
            return this.sya;
        }

        @Override // com.bytedance.adsdk.ugeno.lt.zb
        public float ok() {
            return this.lud;
        }

        @Override // com.bytedance.adsdk.ugeno.lt.zb
        public int ry() {
            return ((ViewGroup.MarginLayoutParams) this).leftMargin;
        }

        @Override // com.bytedance.adsdk.ugeno.lt.zb
        public int sya() {
            return this.ycx;
        }

        @Override // com.bytedance.adsdk.ugeno.lt.zb
        public int syc() {
            return ((ViewGroup.MarginLayoutParams) this).rightMargin;
        }

        @Override // com.bytedance.adsdk.ugeno.lt.zb
        public int ul() {
            return this.f22421lt;
        }

        @Override // android.os.Parcelable
        public void writeToParcel(Parcel parcel, int i5) {
            parcel.writeInt(this.ycx);
            parcel.writeFloat(this.f22423zb);
            parcel.writeFloat(this.sya);
            parcel.writeInt(this.f22418dj);
            parcel.writeFloat(this.lud);
            parcel.writeInt(this.f22421lt);
            parcel.writeInt(this.f22422ul);
            parcel.writeInt(this.fby);
            parcel.writeInt(this.f22420jw);
            parcel.writeByte(this.f22419jc ? (byte) 1 : (byte) 0);
            parcel.writeInt(((ViewGroup.MarginLayoutParams) this).bottomMargin);
            parcel.writeInt(((ViewGroup.MarginLayoutParams) this).leftMargin);
            parcel.writeInt(((ViewGroup.MarginLayoutParams) this).rightMargin);
            parcel.writeInt(((ViewGroup.MarginLayoutParams) this).topMargin);
            parcel.writeInt(((ViewGroup.MarginLayoutParams) this).height);
            parcel.writeInt(((ViewGroup.MarginLayoutParams) this).width);
        }

        @Override // com.bytedance.adsdk.ugeno.lt.zb
        public int xkz() {
            return ((ViewGroup.MarginLayoutParams) this).topMargin;
        }

        @Override // com.bytedance.adsdk.ugeno.lt.zb
        public int ycx() {
            return ((ViewGroup.MarginLayoutParams) this).width;
        }

        @Override // com.bytedance.adsdk.ugeno.lt.zb
        public int zb() {
            return ((ViewGroup.MarginLayoutParams) this).height;
        }

        public void dj(int i5) {
            this.f22418dj = i5;
        }

        public void sya(int i5) {
            this.ycx = i5;
        }

        public void ycx(float f11) {
            this.f22423zb = f11;
        }

        public void zb(float f11) {
            this.sya = f11;
        }

        public void sya(float f11) {
            this.lud = f11;
        }

        @Override // com.bytedance.adsdk.ugeno.lt.zb
        public void ycx(int i5) {
            this.f22421lt = i5;
        }

        @Override // com.bytedance.adsdk.ugeno.lt.zb
        public void zb(int i5) {
            this.f22422ul = i5;
        }

        public ycx(ViewGroup.LayoutParams layoutParams) {
            super(layoutParams);
            this.ycx = 1;
            this.f22423zb = 0.0f;
            this.sya = 0.0f;
            this.f22418dj = -1;
            this.lud = -1.0f;
            this.f22421lt = -1;
            this.f22422ul = -1;
            this.fby = 16777215;
            this.f22420jw = 16777215;
        }

        public ycx(int i5, int i11) {
            super(new ViewGroup.LayoutParams(i5, i11));
            this.ycx = 1;
            this.f22423zb = 0.0f;
            this.sya = 0.0f;
            this.f22418dj = -1;
            this.lud = -1.0f;
            this.f22421lt = -1;
            this.f22422ul = -1;
            this.fby = 16777215;
            this.f22420jw = 16777215;
        }

        public ycx(ViewGroup.MarginLayoutParams marginLayoutParams) {
            super(marginLayoutParams);
            this.ycx = 1;
            this.f22423zb = 0.0f;
            this.sya = 0.0f;
            this.f22418dj = -1;
            this.lud = -1.0f;
            this.f22421lt = -1;
            this.f22422ul = -1;
            this.fby = 16777215;
            this.f22420jw = 16777215;
        }

        public ycx(Parcel parcel) {
            super(0, 0);
            this.ycx = 1;
            this.f22423zb = 0.0f;
            this.sya = 0.0f;
            this.f22418dj = -1;
            this.lud = -1.0f;
            this.f22421lt = -1;
            this.f22422ul = -1;
            this.fby = 16777215;
            this.f22420jw = 16777215;
            this.ycx = parcel.readInt();
            this.f22423zb = parcel.readFloat();
            this.sya = parcel.readFloat();
            this.f22418dj = parcel.readInt();
            this.lud = parcel.readFloat();
            this.f22421lt = parcel.readInt();
            this.f22422ul = parcel.readInt();
            this.fby = parcel.readInt();
            this.f22420jw = parcel.readInt();
            this.f22419jc = parcel.readByte() != 0;
            ((ViewGroup.MarginLayoutParams) this).bottomMargin = parcel.readInt();
            ((ViewGroup.MarginLayoutParams) this).leftMargin = parcel.readInt();
            ((ViewGroup.MarginLayoutParams) this).rightMargin = parcel.readInt();
            ((ViewGroup.MarginLayoutParams) this).topMargin = parcel.readInt();
            ((ViewGroup.MarginLayoutParams) this).height = parcel.readInt();
            ((ViewGroup.MarginLayoutParams) this).width = parcel.readInt();
        }
    }

    public lud(Context context) {
        super(context, null);
        this.f22413lt = -1;
        this.syc = new dj(this);
        this.f22409dy = new ArrayList();
        this.pmi = new dj.ycx();
    }

    private boolean dj(int i5, int i11) {
        return lud(i5, i11) ? ycx() ? (this.f22411jc & 1) != 0 : (this.f22412jw & 1) != 0 : ycx() ? (this.f22411jc & 2) != 0 : (this.f22412jw & 2) != 0;
    }

    private boolean lt(int i5) {
        if (i5 >= 0 && i5 < this.f22409dy.size()) {
            for (int i11 = i5 + 1; i11 < this.f22409dy.size(); i11++) {
                if (this.f22409dy.get(i11).zb() > 0) {
                    return false;
                }
            }
            if (ycx()) {
                return (this.f22412jw & 4) != 0;
            }
            if ((this.f22411jc & 4) != 0) {
                return true;
            }
        }
        return false;
    }

    private boolean lud(int i5, int i11) {
        for (int i12 = 1; i12 <= i11; i12++) {
            View viewSya = sya(i5 - i12);
            if (viewSya != null && viewSya.getVisibility() != 8) {
                return false;
            }
        }
        return true;
    }

    @Override // android.view.ViewGroup
    public void addView(View view, int i5, ViewGroup.LayoutParams layoutParams) {
        if (this.xkz == null) {
            this.xkz = new SparseIntArray(getChildCount());
        }
        this.f22415ry = this.syc.ycx(view, i5, layoutParams, this.xkz);
        super.addView(view, i5, layoutParams);
    }

    @Override // android.view.ViewGroup
    public boolean checkLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return layoutParams instanceof ycx;
    }

    @Override // android.view.ViewGroup
    public ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return layoutParams instanceof ycx ? new ycx((ycx) layoutParams) : layoutParams instanceof ViewGroup.MarginLayoutParams ? new ycx((ViewGroup.MarginLayoutParams) layoutParams) : new ycx(layoutParams);
    }

    @Override // com.bytedance.adsdk.ugeno.lt.ycx
    public int getAlignContent() {
        return this.lud;
    }

    @Override // com.bytedance.adsdk.ugeno.lt.ycx
    public int getAlignItems() {
        return this.f22408dj;
    }

    public Drawable getDividerDrawableHorizontal() {
        return this.f22416ul;
    }

    public Drawable getDividerDrawableVertical() {
        return this.fby;
    }

    @Override // com.bytedance.adsdk.ugeno.lt.ycx
    public int getFlexDirection() {
        return this.ycx;
    }

    @Override // com.bytedance.adsdk.ugeno.lt.ycx
    public int getFlexItemCount() {
        return getChildCount();
    }

    public List<sya> getFlexLines() {
        ArrayList arrayList = new ArrayList(this.f22409dy.size());
        for (sya syaVar : this.f22409dy) {
            if (syaVar.zb() != 0) {
                arrayList.add(syaVar);
            }
        }
        return arrayList;
    }

    @Override // com.bytedance.adsdk.ugeno.lt.ycx
    public List<sya> getFlexLinesInternal() {
        return this.f22409dy;
    }

    @Override // com.bytedance.adsdk.ugeno.lt.ycx
    public int getFlexWrap() {
        return this.f22417zb;
    }

    public int getJustifyContent() {
        return this.sya;
    }

    @Override // com.bytedance.adsdk.ugeno.lt.ycx
    public int getLargestMainSize() {
        Iterator<sya> it = this.f22409dy.iterator();
        int iMax = Integer.MIN_VALUE;
        while (it.hasNext()) {
            iMax = Math.max(iMax, it.next().lud);
        }
        return iMax;
    }

    @Override // com.bytedance.adsdk.ugeno.lt.ycx
    public int getMaxLine() {
        return this.f22413lt;
    }

    public int getShowDividerHorizontal() {
        return this.f22412jw;
    }

    public int getShowDividerVertical() {
        return this.f22411jc;
    }

    @Override // com.bytedance.adsdk.ugeno.lt.ycx
    public int getSumOfCrossSize() {
        int size = this.f22409dy.size();
        int i5 = 0;
        for (int i11 = 0; i11 < size; i11++) {
            sya syaVar = this.f22409dy.get(i11);
            if (dj(i11)) {
                i5 += ycx() ? this.f22410ea : this.f22414ok;
            }
            if (lt(i11)) {
                i5 += ycx() ? this.f22410ea : this.f22414ok;
            }
            i5 += syaVar.f22432ul;
        }
        return i5;
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        com.bytedance.adsdk.ugeno.lud ludVar = this.wie;
        if (ludVar != null) {
            ludVar.ul();
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        com.bytedance.adsdk.ugeno.lud ludVar = this.wie;
        if (ludVar != null) {
            ludVar.fby();
        }
    }

    @Override // android.view.View
    public void onDraw(Canvas canvas) {
        if (this.fby == null && this.f22416ul == null) {
            return;
        }
        if (this.f22412jw == 0 && this.f22411jc == 0) {
            return;
        }
        int iYcx = ul.ycx(this);
        int i5 = this.ycx;
        if (i5 == 0) {
            ycx(canvas, iYcx == 1, this.f22417zb == 2);
            return;
        }
        if (i5 == 1) {
            ycx(canvas, iYcx != 1, this.f22417zb == 2);
            return;
        }
        if (i5 == 2) {
            boolean z11 = iYcx == 1;
            if (this.f22417zb == 2) {
                z11 = !z11;
            }
            zb(canvas, z11, false);
            return;
        }
        if (i5 != 3) {
            return;
        }
        boolean z12 = iYcx == 1;
        if (this.f22417zb == 2) {
            z12 = !z12;
        }
        zb(canvas, z12, true);
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        boolean z12;
        lud ludVar;
        int i14;
        int i15;
        int i16;
        int i17;
        boolean z13;
        lud ludVar2;
        int i18;
        int i19;
        int i21;
        int i22;
        boolean z14;
        com.bytedance.adsdk.ugeno.lud ludVar3 = this.wie;
        if (ludVar3 != null) {
            ludVar3.lt();
        }
        int iYcx = ul.ycx(this);
        int i23 = this.ycx;
        if (i23 == 0) {
            if (iYcx == 1) {
                z12 = true;
                ludVar = this;
                i14 = i5;
                i17 = i11;
                i16 = i13;
                i15 = i12;
            } else {
                z12 = false;
                ludVar = this;
                i14 = i5;
                i15 = i12;
                i16 = i13;
                i17 = i11;
            }
            ludVar.ycx(z12, i14, i17, i15, i16);
        } else if (i23 == 1) {
            if (iYcx != 1) {
                z13 = true;
                ludVar2 = this;
                i18 = i5;
                i22 = i11;
                i21 = i13;
                i19 = i12;
            } else {
                z13 = false;
                ludVar2 = this;
                i18 = i5;
                i19 = i12;
                i21 = i13;
                i22 = i11;
            }
            ludVar2.ycx(z13, i18, i22, i19, i21);
        } else if (i23 == 2) {
            z14 = iYcx == 1;
            if (this.f22417zb == 2) {
                z14 = !z14;
            }
            ycx(z14, false, i5, i11, i12, i13);
        } else {
            if (i23 != 3) {
                throw new IllegalStateException("Invalid flex direction is set: " + this.ycx);
            }
            z14 = iYcx == 1;
            if (this.f22417zb == 2) {
                z14 = !z14;
            }
            ycx(z14, true, i5, i11, i12, i13);
        }
        com.bytedance.adsdk.ugeno.lud ludVar4 = this.wie;
        if (ludVar4 != null) {
            ludVar4.ycx(i5, i11, i12, i13);
        }
    }

    @Override // android.view.View
    public void onMeasure(int i5, int i11) {
        com.bytedance.adsdk.ugeno.lud ludVar = this.wie;
        if (ludVar != null) {
            int[] iArrYcx = ludVar.ycx(i5, i11);
            ycx(iArrYcx[0], iArrYcx[1]);
        } else {
            ycx(i5, i11);
        }
        com.bytedance.adsdk.ugeno.lud ludVar2 = this.wie;
        if (ludVar2 != null) {
            ludVar2.lud();
        }
    }

    @Override // android.view.View
    public void onSizeChanged(int i5, int i11, int i12, int i13) {
        super.onSizeChanged(i5, i11, i12, i13);
        com.bytedance.adsdk.ugeno.lud ludVar = this.wie;
        if (ludVar != null) {
            ludVar.zb(i5, i11, i12, i13);
        }
    }

    @Override // android.view.View
    public void onWindowFocusChanged(boolean z11) {
        super.onWindowFocusChanged(z11);
        com.bytedance.adsdk.ugeno.lud ludVar = this.wie;
        if (ludVar != null) {
            ludVar.ycx(z11);
        }
    }

    public void setAlignContent(int i5) {
        if (this.lud != i5) {
            this.lud = i5;
            requestLayout();
        }
    }

    public void setAlignItems(int i5) {
        if (this.f22408dj != i5) {
            this.f22408dj = i5;
            requestLayout();
        }
    }

    public void setDividerDrawable(Drawable drawable) {
        setDividerDrawableHorizontal(drawable);
        setDividerDrawableVertical(drawable);
    }

    public void setDividerDrawableHorizontal(Drawable drawable) {
        if (drawable == this.f22416ul) {
            return;
        }
        this.f22416ul = drawable;
        if (drawable != null) {
            this.f22410ea = drawable.getIntrinsicHeight();
        } else {
            this.f22410ea = 0;
        }
        zb();
        requestLayout();
    }

    public void setDividerDrawableVertical(Drawable drawable) {
        if (drawable == this.fby) {
            return;
        }
        this.fby = drawable;
        if (drawable != null) {
            this.f22414ok = drawable.getIntrinsicWidth();
        } else {
            this.f22414ok = 0;
        }
        zb();
        requestLayout();
    }

    public void setFlexDirection(int i5) {
        if (this.ycx != i5) {
            this.ycx = i5;
            requestLayout();
        }
    }

    @Override // com.bytedance.adsdk.ugeno.lt.ycx
    public void setFlexLines(List<sya> list) {
        this.f22409dy = list;
    }

    public void setFlexWrap(int i5) {
        if (this.f22417zb != i5) {
            this.f22417zb = i5;
            requestLayout();
        }
    }

    public void setJustifyContent(int i5) {
        if (this.sya != i5) {
            this.sya = i5;
            requestLayout();
        }
    }

    public void setMaxLine(int i5) {
        if (this.f22413lt != i5) {
            this.f22413lt = i5;
            requestLayout();
        }
    }

    public void setShowDivider(int i5) {
        setShowDividerVertical(i5);
        setShowDividerHorizontal(i5);
    }

    public void setShowDividerHorizontal(int i5) {
        if (i5 != this.f22412jw) {
            this.f22412jw = i5;
            requestLayout();
        }
    }

    public void setShowDividerVertical(int i5) {
        if (i5 != this.f22411jc) {
            this.f22411jc = i5;
            requestLayout();
        }
    }

    public View sya(int i5) {
        if (i5 < 0) {
            return null;
        }
        int[] iArr = this.f22415ry;
        if (i5 >= iArr.length) {
            return null;
        }
        return getChildAt(iArr[i5]);
    }

    @Override // com.bytedance.adsdk.ugeno.lt.ycx
    public int ycx(View view) {
        return 0;
    }

    @Override // com.bytedance.adsdk.ugeno.lt.ycx
    public View zb(int i5) {
        return sya(i5);
    }

    private void ycx(int i5, int i11) {
        if (this.xkz == null) {
            this.xkz = new SparseIntArray(getChildCount());
        }
        if (this.syc.zb(this.xkz)) {
            this.f22415ry = this.syc.ycx(this.xkz);
        }
        int i12 = this.ycx;
        if (i12 == 0 || i12 == 1) {
            zb(i5, i11);
        } else if (i12 == 2 || i12 == 3) {
            sya(i5, i11);
        } else {
            throw new IllegalStateException("Invalid value for the flex direction is set: " + this.ycx);
        }
    }

    private void zb(int i5, int i11) {
        this.f22409dy.clear();
        this.pmi.ycx();
        this.syc.ycx(this.pmi, i5, i11);
        this.f22409dy = this.pmi.ycx;
        this.syc.ycx(i5, i11);
        if (this.f22408dj == 3) {
            for (sya syaVar : this.f22409dy) {
                int iMax = Integer.MIN_VALUE;
                for (int i12 = 0; i12 < syaVar.fby; i12++) {
                    View viewSya = sya(syaVar.syc + i12);
                    if (viewSya != null && viewSya.getVisibility() != 8) {
                        ycx ycxVar = (ycx) viewSya.getLayoutParams();
                        iMax = this.f22417zb != 2 ? Math.max(iMax, viewSya.getMeasuredHeight() + Math.max(syaVar.f22430ok - viewSya.getBaseline(), ((ViewGroup.MarginLayoutParams) ycxVar).topMargin) + ((ViewGroup.MarginLayoutParams) ycxVar).bottomMargin) : Math.max(iMax, viewSya.getMeasuredHeight() + ((ViewGroup.MarginLayoutParams) ycxVar).topMargin + Math.max(viewSya.getBaseline() + (syaVar.f22430ok - viewSya.getMeasuredHeight()), ((ViewGroup.MarginLayoutParams) ycxVar).bottomMargin));
                    }
                }
                syaVar.f22432ul = iMax;
            }
        }
        this.syc.zb(i5, i11, getPaddingBottom() + getPaddingTop());
        this.syc.ycx();
        ycx(this.ycx, i5, i11, this.pmi.f22399zb);
    }

    private boolean lud(int i5) {
        for (int i11 = 0; i11 < i5; i11++) {
            if (this.f22409dy.get(i11).zb() > 0) {
                return false;
            }
        }
        return true;
    }

    private void sya(int i5, int i11) {
        this.f22409dy.clear();
        this.pmi.ycx();
        this.syc.zb(this.pmi, i5, i11);
        this.f22409dy = this.pmi.ycx;
        this.syc.ycx(i5, i11);
        this.syc.zb(i5, i11, getPaddingRight() + getPaddingLeft());
        this.syc.ycx();
        ycx(this.ycx, i5, i11, this.pmi.f22399zb);
    }

    private boolean dj(int i5) {
        if (i5 >= 0 && i5 < this.f22409dy.size()) {
            if (lud(i5)) {
                return ycx() ? (this.f22412jw & 1) != 0 : (this.f22411jc & 1) != 0;
            }
            if (ycx()) {
                return (this.f22412jw & 2) != 0;
            }
            if ((this.f22411jc & 2) != 0) {
                return true;
            }
        }
        return false;
    }

    @Override // com.bytedance.adsdk.ugeno.lt.ycx
    public View ycx(int i5) {
        return getChildAt(i5);
    }

    private void ycx(int i5, int i11, int i12, int i13) {
        int paddingBottom;
        int largestMainSize;
        int iResolveSizeAndState;
        int iResolveSizeAndState2;
        int mode = View.MeasureSpec.getMode(i11);
        int size = View.MeasureSpec.getSize(i11);
        int mode2 = View.MeasureSpec.getMode(i12);
        int size2 = View.MeasureSpec.getSize(i12);
        if (i5 == 0 || i5 == 1) {
            paddingBottom = getPaddingBottom() + getPaddingTop() + getSumOfCrossSize();
            largestMainSize = getLargestMainSize();
        } else {
            if (i5 != 2 && i5 != 3) {
                throw new IllegalArgumentException("Invalid flex direction: ".concat(String.valueOf(i5)));
            }
            paddingBottom = getLargestMainSize();
            largestMainSize = getPaddingRight() + getPaddingLeft() + getSumOfCrossSize();
        }
        if (mode == Integer.MIN_VALUE) {
            if (size < largestMainSize) {
                i13 = View.combineMeasuredStates(i13, 16777216);
            } else {
                size = largestMainSize;
            }
            iResolveSizeAndState = View.resolveSizeAndState(size, i11, i13);
        } else if (mode == 0) {
            iResolveSizeAndState = View.resolveSizeAndState(largestMainSize, i11, i13);
        } else if (mode == 1073741824) {
            if (size < largestMainSize) {
                i13 = View.combineMeasuredStates(i13, 16777216);
            }
            iResolveSizeAndState = View.resolveSizeAndState(size, i11, i13);
        } else {
            throw new IllegalStateException("Unknown width mode is set: ".concat(String.valueOf(mode)));
        }
        if (mode2 == Integer.MIN_VALUE) {
            if (size2 < paddingBottom) {
                i13 = View.combineMeasuredStates(i13, 256);
            } else {
                size2 = paddingBottom;
            }
            iResolveSizeAndState2 = View.resolveSizeAndState(size2, i12, i13);
        } else if (mode2 == 0) {
            iResolveSizeAndState2 = View.resolveSizeAndState(paddingBottom, i12, i13);
        } else if (mode2 == 1073741824) {
            if (size2 < paddingBottom) {
                i13 = View.combineMeasuredStates(i13, 256);
            }
            iResolveSizeAndState2 = View.resolveSizeAndState(size2, i12, i13);
        } else {
            throw new IllegalStateException("Unknown height mode is set: ".concat(String.valueOf(mode2)));
        }
        setMeasuredDimension(iResolveSizeAndState, iResolveSizeAndState2);
    }

    private void zb(Canvas canvas, boolean z11, boolean z12) {
        int i5;
        int i11;
        int bottom;
        int top;
        int paddingTop = getPaddingTop();
        int iMax = Math.max(0, (getHeight() - getPaddingBottom()) - paddingTop);
        int size = this.f22409dy.size();
        for (int i12 = 0; i12 < size; i12++) {
            sya syaVar = this.f22409dy.get(i12);
            for (int i13 = 0; i13 < syaVar.fby; i13++) {
                int i14 = syaVar.syc + i13;
                View viewSya = sya(i14);
                if (viewSya != null && viewSya.getVisibility() != 8) {
                    ycx ycxVar = (ycx) viewSya.getLayoutParams();
                    if (dj(i14, i13)) {
                        if (z12) {
                            top = viewSya.getBottom() + ((ViewGroup.MarginLayoutParams) ycxVar).bottomMargin;
                        } else {
                            top = (viewSya.getTop() - ((ViewGroup.MarginLayoutParams) ycxVar).topMargin) - this.f22410ea;
                        }
                        zb(canvas, syaVar.ycx, top, syaVar.f22432ul);
                    }
                    if (i13 == syaVar.fby - 1 && (this.f22412jw & 4) > 0) {
                        if (z12) {
                            bottom = (viewSya.getTop() - ((ViewGroup.MarginLayoutParams) ycxVar).topMargin) - this.f22410ea;
                        } else {
                            bottom = viewSya.getBottom() + ((ViewGroup.MarginLayoutParams) ycxVar).bottomMargin;
                        }
                        zb(canvas, syaVar.ycx, bottom, syaVar.f22432ul);
                    }
                }
            }
            if (dj(i12)) {
                if (z11) {
                    i11 = syaVar.sya;
                } else {
                    i11 = syaVar.ycx - this.f22414ok;
                }
                ycx(canvas, i11, paddingTop, iMax);
            }
            if (lt(i12) && (this.f22411jc & 4) > 0) {
                if (z11) {
                    i5 = syaVar.ycx - this.f22414ok;
                } else {
                    i5 = syaVar.sya;
                }
                ycx(canvas, i5, paddingTop, iMax);
            }
        }
    }

    @Override // com.bytedance.adsdk.ugeno.lt.ycx
    public boolean ycx() {
        int i5 = this.ycx;
        return i5 == 0 || i5 == 1;
    }

    /* JADX WARN: Removed duplicated region for block: B:41:0x00d5  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void ycx(boolean z11, int i5, int i11, int i12, int i13) {
        float measuredWidth;
        float f11;
        float f12;
        int i14;
        boolean z12;
        int i15;
        int i16;
        int i17;
        int i18;
        View view;
        sya syaVar;
        int paddingLeft = getPaddingLeft();
        int paddingRight = getPaddingRight();
        int i19 = i12 - i5;
        int paddingBottom = (i13 - i11) - getPaddingBottom();
        int paddingTop = getPaddingTop();
        int size = this.f22409dy.size();
        for (int i21 = 0; i21 < size; i21++) {
            sya syaVar2 = this.f22409dy.get(i21);
            if (dj(i21)) {
                int i22 = this.f22410ea;
                paddingBottom -= i22;
                paddingTop += i22;
            }
            int i23 = paddingBottom;
            int i24 = this.sya;
            char c11 = 4;
            int i25 = 2;
            boolean z13 = true;
            if (i24 == 0) {
                measuredWidth = paddingLeft;
                f11 = i19 - paddingRight;
            } else if (i24 == 1) {
                int i26 = syaVar2.lud;
                f11 = i26 - paddingLeft;
                measuredWidth = (i19 - i26) + paddingRight;
            } else if (i24 == 2) {
                int i27 = syaVar2.lud;
                measuredWidth = paddingLeft + ((i19 - i27) / 2.0f);
                f11 = (i19 - paddingRight) - ((i19 - i27) / 2.0f);
            } else {
                if (i24 == 3) {
                    measuredWidth = paddingLeft;
                    f12 = (i19 - syaVar2.lud) / (syaVar2.zb() != 1 ? r7 - 1 : 1.0f);
                    f11 = i19 - paddingRight;
                } else if (i24 == 4) {
                    int iZb = syaVar2.zb();
                    float f13 = iZb != 0 ? (i19 - syaVar2.lud) / iZb : 0.0f;
                    float f14 = f13 / 2.0f;
                    measuredWidth = paddingLeft + f14;
                    float f15 = (i19 - paddingRight) - f14;
                    f12 = f13;
                    f11 = f15;
                } else if (i24 == 5) {
                    f12 = syaVar2.zb() != 0 ? (i19 - syaVar2.lud) / (r3 + 1) : 0.0f;
                    measuredWidth = paddingLeft + f12;
                    f11 = (i19 - paddingRight) - f12;
                } else {
                    throw new IllegalStateException("Invalid justifyContent is set: " + this.sya);
                }
                float fMax = Math.max(f12, 0.0f);
                i14 = 0;
                while (i14 < syaVar2.fby) {
                    int i28 = syaVar2.syc + i14;
                    View viewSya = sya(i28);
                    char c12 = c11;
                    if (viewSya != null) {
                        boolean z14 = z13;
                        if (viewSya.getVisibility() != 8) {
                            ycx ycxVar = (ycx) viewSya.getLayoutParams();
                            float f16 = measuredWidth + ((ViewGroup.MarginLayoutParams) ycxVar).leftMargin;
                            float f17 = f11 - ((ViewGroup.MarginLayoutParams) ycxVar).rightMargin;
                            if (dj(i28, i14)) {
                                int i29 = this.f22414ok;
                                float f18 = i29;
                                f16 += f18;
                                f17 -= f18;
                                i18 = i29;
                            } else {
                                i18 = 0;
                            }
                            float f19 = f17;
                            int i31 = (i14 != syaVar2.fby + (-1) || (this.f22411jc & 4) <= 0) ? 0 : this.f22414ok;
                            if (this.f22417zb == i25) {
                                if (z11) {
                                    i15 = i25;
                                    i16 = i14;
                                    view = viewSya;
                                    z12 = z14;
                                    this.syc.ycx(view, syaVar2, Math.round(f19) - viewSya.getMeasuredWidth(), i23 - viewSya.getMeasuredHeight(), Math.round(f19), i23);
                                } else {
                                    i16 = i14;
                                    view = viewSya;
                                    z12 = z14;
                                    i15 = i25;
                                    this.syc.ycx(view, syaVar2, Math.round(f16), i23 - view.getMeasuredHeight(), view.getMeasuredWidth() + Math.round(f16), i23);
                                }
                                i17 = i23;
                            } else {
                                i16 = i14;
                                view = viewSya;
                                z12 = z14;
                                i15 = i25;
                                i17 = i23;
                                if (z11) {
                                    this.syc.ycx(view, syaVar2, Math.round(f19) - view.getMeasuredWidth(), paddingTop, Math.round(f19), view.getMeasuredHeight() + paddingTop);
                                } else {
                                    int i32 = paddingTop;
                                    this.syc.ycx(view, syaVar2, Math.round(f16), i32, view.getMeasuredWidth() + Math.round(f16), view.getMeasuredHeight() + i32);
                                    paddingTop = i32;
                                }
                            }
                            measuredWidth = f16 + view.getMeasuredWidth() + fMax + ((ViewGroup.MarginLayoutParams) ycxVar).rightMargin;
                            float measuredWidth2 = f19 - ((view.getMeasuredWidth() + fMax) + ((ViewGroup.MarginLayoutParams) ycxVar).leftMargin);
                            if (z11) {
                                syaVar = syaVar2;
                                syaVar.ycx(view, i31, 0, i18, 0);
                            } else {
                                syaVar = syaVar2;
                                syaVar.ycx(view, i18, 0, i31, 0);
                            }
                            syaVar2 = syaVar;
                            f11 = measuredWidth2;
                            i14 = i16 + 1;
                            c11 = c12;
                            i25 = i15;
                            z13 = z12;
                            i23 = i17;
                        } else {
                            z12 = z14;
                        }
                    } else {
                        z12 = z13;
                    }
                    i15 = i25;
                    i16 = i14;
                    i17 = i23;
                    i14 = i16 + 1;
                    c11 = c12;
                    i25 = i15;
                    z13 = z12;
                    i23 = i17;
                }
                int i33 = syaVar2.f22432ul;
                paddingTop += i33;
                paddingBottom = i23 - i33;
            }
            f12 = 0.0f;
            float fMax2 = Math.max(f12, 0.0f);
            i14 = 0;
            while (i14 < syaVar2.fby) {
            }
            int i332 = syaVar2.f22432ul;
            paddingTop += i332;
            paddingBottom = i23 - i332;
        }
    }

    private void zb(Canvas canvas, int i5, int i11, int i12) {
        Drawable drawable = this.f22416ul;
        if (drawable == null) {
            return;
        }
        drawable.setBounds(i5, i11, i12 + i5, this.f22410ea + i11);
        this.f22416ul.draw(canvas);
    }

    @Override // com.bytedance.adsdk.ugeno.lt.ycx
    public int zb(int i5, int i11, int i12) {
        return ViewGroup.getChildMeasureSpec(i5, i11, i12);
    }

    private void zb() {
        if (this.f22416ul == null && this.fby == null) {
            setWillNotDraw(true);
        } else {
            setWillNotDraw(false);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:41:0x00d6  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void ycx(boolean z11, boolean z12, int i5, int i11, int i12, int i13) {
        float measuredHeight;
        float f11;
        float f12;
        int i14;
        char c11;
        int i15;
        int i16;
        int i17;
        int i18;
        sya syaVar;
        int paddingTop = getPaddingTop();
        int paddingBottom = getPaddingBottom();
        int paddingRight = getPaddingRight();
        int paddingLeft = getPaddingLeft();
        int i19 = i13 - i11;
        int i21 = (i12 - i5) - paddingRight;
        int size = this.f22409dy.size();
        for (int i22 = 0; i22 < size; i22++) {
            sya syaVar2 = this.f22409dy.get(i22);
            if (dj(i22)) {
                int i23 = this.f22414ok;
                paddingLeft += i23;
                i21 -= i23;
            }
            int i24 = i21;
            int i25 = this.sya;
            char c12 = 4;
            int i26 = 1;
            if (i25 == 0) {
                measuredHeight = paddingTop;
                f11 = i19 - paddingBottom;
            } else if (i25 == 1) {
                int i27 = syaVar2.lud;
                f11 = i27 - paddingTop;
                measuredHeight = (i19 - i27) + paddingBottom;
            } else if (i25 == 2) {
                int i28 = syaVar2.lud;
                measuredHeight = paddingTop + ((i19 - i28) / 2.0f);
                f11 = (i19 - paddingBottom) - ((i19 - i28) / 2.0f);
            } else {
                if (i25 == 3) {
                    measuredHeight = paddingTop;
                    f12 = (i19 - syaVar2.lud) / (syaVar2.zb() != 1 ? r13 - 1 : 1.0f);
                    f11 = i19 - paddingBottom;
                } else if (i25 == 4) {
                    int iZb = syaVar2.zb();
                    f12 = iZb != 0 ? (i19 - syaVar2.lud) / iZb : 0.0f;
                    float f13 = f12 / 2.0f;
                    measuredHeight = paddingTop + f13;
                    f11 = (i19 - paddingBottom) - f13;
                } else if (i25 == 5) {
                    f12 = syaVar2.zb() != 0 ? (i19 - syaVar2.lud) / (r5 + 1) : 0.0f;
                    measuredHeight = paddingTop + f12;
                    f11 = (i19 - paddingBottom) - f12;
                } else {
                    throw new IllegalStateException("Invalid justifyContent is set: " + this.sya);
                }
                float fMax = Math.max(f12, 0.0f);
                i14 = 0;
                while (i14 < syaVar2.fby) {
                    int i29 = syaVar2.syc + i14;
                    int i31 = i26;
                    View viewSya = sya(i29);
                    if (viewSya != null) {
                        c11 = c12;
                        if (viewSya.getVisibility() != 8) {
                            ycx ycxVar = (ycx) viewSya.getLayoutParams();
                            float f14 = measuredHeight + ((ViewGroup.MarginLayoutParams) ycxVar).topMargin;
                            float f15 = f11 - ((ViewGroup.MarginLayoutParams) ycxVar).bottomMargin;
                            if (dj(i29, i14)) {
                                i18 = this.f22410ea;
                                float f16 = i18;
                                f14 += f16;
                                f15 -= f16;
                            } else {
                                i18 = 0;
                            }
                            float f17 = f15;
                            int i32 = (i14 != syaVar2.fby - i31 || (this.f22412jw & 4) <= 0) ? 0 : this.f22410ea;
                            if (z11) {
                                if (z12) {
                                    i16 = i31;
                                    i15 = i14;
                                    this.syc.ycx(viewSya, syaVar2, true, i24 - viewSya.getMeasuredWidth(), Math.round(f17) - viewSya.getMeasuredHeight(), i24, Math.round(f17));
                                } else {
                                    i15 = i14;
                                    i16 = i31;
                                    this.syc.ycx(viewSya, syaVar2, true, i24 - viewSya.getMeasuredWidth(), Math.round(f14), i24, viewSya.getMeasuredHeight() + Math.round(f14));
                                }
                                i17 = i24;
                            } else {
                                i15 = i14;
                                i16 = i31;
                                i17 = i24;
                                if (z12) {
                                    this.syc.ycx(viewSya, syaVar2, false, paddingLeft, Math.round(f17) - viewSya.getMeasuredHeight(), viewSya.getMeasuredWidth() + paddingLeft, Math.round(f17));
                                } else {
                                    int i33 = paddingLeft;
                                    this.syc.ycx(viewSya, syaVar2, false, i33, Math.round(f14), viewSya.getMeasuredWidth() + i33, viewSya.getMeasuredHeight() + Math.round(f14));
                                    paddingLeft = i33;
                                }
                            }
                            measuredHeight = f14 + viewSya.getMeasuredHeight() + fMax + ((ViewGroup.MarginLayoutParams) ycxVar).bottomMargin;
                            float measuredHeight2 = f17 - ((viewSya.getMeasuredHeight() + fMax) + ((ViewGroup.MarginLayoutParams) ycxVar).topMargin);
                            if (z12) {
                                syaVar = syaVar2;
                                syaVar.ycx(viewSya, 0, i32, 0, i18);
                            } else {
                                syaVar = syaVar2;
                                syaVar.ycx(viewSya, 0, i18, 0, i32);
                            }
                            syaVar2 = syaVar;
                            f11 = measuredHeight2;
                        }
                        i14 = i15 + 1;
                        c12 = c11;
                        i26 = i16;
                        i24 = i17;
                    } else {
                        c11 = c12;
                    }
                    i15 = i14;
                    i16 = i31;
                    i17 = i24;
                    i14 = i15 + 1;
                    c12 = c11;
                    i26 = i16;
                    i24 = i17;
                }
                int i34 = syaVar2.f22432ul;
                paddingLeft += i34;
                i21 = i24 - i34;
            }
            f12 = 0.0f;
            float fMax2 = Math.max(f12, 0.0f);
            i14 = 0;
            while (i14 < syaVar2.fby) {
            }
            int i342 = syaVar2.f22432ul;
            paddingLeft += i342;
            i21 = i24 - i342;
        }
    }

    private void ycx(Canvas canvas, boolean z11, boolean z12) {
        int i5;
        int i11;
        int right;
        int left;
        int paddingLeft = getPaddingLeft();
        int iMax = Math.max(0, (getWidth() - getPaddingRight()) - paddingLeft);
        int size = this.f22409dy.size();
        for (int i12 = 0; i12 < size; i12++) {
            sya syaVar = this.f22409dy.get(i12);
            for (int i13 = 0; i13 < syaVar.fby; i13++) {
                int i14 = syaVar.syc + i13;
                View viewSya = sya(i14);
                if (viewSya != null && viewSya.getVisibility() != 8) {
                    ycx ycxVar = (ycx) viewSya.getLayoutParams();
                    if (dj(i14, i13)) {
                        if (z11) {
                            left = viewSya.getRight() + ((ViewGroup.MarginLayoutParams) ycxVar).rightMargin;
                        } else {
                            left = (viewSya.getLeft() - ((ViewGroup.MarginLayoutParams) ycxVar).leftMargin) - this.f22414ok;
                        }
                        ycx(canvas, left, syaVar.f22433zb, syaVar.f22432ul);
                    }
                    if (i13 == syaVar.fby - 1 && (this.f22411jc & 4) > 0) {
                        if (z11) {
                            right = (viewSya.getLeft() - ((ViewGroup.MarginLayoutParams) ycxVar).leftMargin) - this.f22414ok;
                        } else {
                            right = viewSya.getRight() + ((ViewGroup.MarginLayoutParams) ycxVar).rightMargin;
                        }
                        ycx(canvas, right, syaVar.f22433zb, syaVar.f22432ul);
                    }
                }
            }
            if (dj(i12)) {
                if (z12) {
                    i11 = syaVar.f22424dj;
                } else {
                    i11 = syaVar.f22433zb - this.f22410ea;
                }
                zb(canvas, paddingLeft, i11, iMax);
            }
            if (lt(i12) && (this.f22412jw & 4) > 0) {
                if (z12) {
                    i5 = syaVar.f22433zb - this.f22410ea;
                } else {
                    i5 = syaVar.f22424dj;
                }
                zb(canvas, paddingLeft, i5, iMax);
            }
        }
    }

    private void ycx(Canvas canvas, int i5, int i11, int i12) {
        Drawable drawable = this.fby;
        if (drawable == null) {
            return;
        }
        drawable.setBounds(i5, i11, this.f22414ok + i5, i12 + i11);
        this.fby.draw(canvas);
    }

    @Override // com.bytedance.adsdk.ugeno.lt.ycx
    public int ycx(View view, int i5, int i11) {
        int i12;
        int i13;
        if (ycx()) {
            i12 = dj(i5, i11) ? this.f22414ok : 0;
            if ((this.f22411jc & 4) <= 0) {
                return i12;
            }
            i13 = this.f22414ok;
        } else {
            i12 = dj(i5, i11) ? this.f22410ea : 0;
            if ((this.f22412jw & 4) <= 0) {
                return i12;
            }
            i13 = this.f22410ea;
        }
        return i12 + i13;
    }

    @Override // com.bytedance.adsdk.ugeno.lt.ycx
    public void ycx(sya syaVar) {
        if (ycx()) {
            if ((this.f22411jc & 4) > 0) {
                int i5 = syaVar.lud;
                int i11 = this.f22414ok;
                syaVar.lud = i5 + i11;
                syaVar.f22429lt += i11;
                return;
            }
            return;
        }
        if ((this.f22412jw & 4) > 0) {
            int i12 = syaVar.lud;
            int i13 = this.f22410ea;
            syaVar.lud = i12 + i13;
            syaVar.f22429lt += i13;
        }
    }

    @Override // com.bytedance.adsdk.ugeno.lt.ycx
    public int ycx(int i5, int i11, int i12) {
        return ViewGroup.getChildMeasureSpec(i5, i11, i12);
    }

    @Override // com.bytedance.adsdk.ugeno.lt.ycx
    public void ycx(View view, int i5, int i11, sya syaVar) {
        if (dj(i5, i11)) {
            if (ycx()) {
                int i12 = syaVar.lud;
                int i13 = this.f22414ok;
                syaVar.lud = i12 + i13;
                syaVar.f22429lt += i13;
                return;
            }
            int i14 = syaVar.lud;
            int i15 = this.f22410ea;
            syaVar.lud = i14 + i15;
            syaVar.f22429lt += i15;
        }
    }

    public void ycx(com.bytedance.adsdk.ugeno.zb.sya syaVar) {
        this.wie = syaVar;
    }
}
