package com.facebook.ads.redexgen.X;

import android.animation.AnimatorSet;
import android.animation.ValueAnimator;
import android.view.View;
import android.view.ViewOutlineProvider;
import android.widget.RelativeLayout;
import java.lang.ref.WeakReference;

/* renamed from: com.facebook.ads.redexgen.X.eI, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1678eI extends RelativeLayout {
    public static String[] A04 = {"Z7YDROQZDOzGgLZ6JRzm0VB6SZj4zDor", "PEDxZ1hmcJv2HtokqPZuboN03zqPqfuu", "ZN3aiXgGzfL", "UoQOzdqMFdmvRVk6jZTbQbhJ01APWmUd", "BWydKlRDXGFiivyHlYlBLR13h8bygoZy", "calSGpe10AH6YV6oPZJsWkhcYoOFDSm8", "CqyCvSup05V", "6oqVw1T1HmkJfSZKyFG8rr7XXeYSScI0"};
    public static final int A05 = (int) (AbstractC2385px.A02 * 4.0f);
    public int A00;
    public C5B A01;
    public WeakReference<InterfaceC1682eM> A02;
    public final InterfaceC1550cD A03;

    public C1678eI(C0958Hi c0958Hi, InterfaceC1550cD interfaceC1550cD) {
        super(c0958Hi);
        this.A00 = 0;
        this.A03 = interfaceC1550cD;
        AbstractC2426qc.A0K((View) this.A03);
        addView(this.A03.getView(), new RelativeLayout.LayoutParams(-1, -1));
    }

    private void A00(AnimatorSet animatorSet, final int i5, final boolean z11) {
        ValueAnimator valueAnimatorOfFloat = ValueAnimator.ofFloat(0.0f, 1.0f);
        valueAnimatorOfFloat.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.facebook.ads.redexgen.X.eY
            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public final void onAnimationUpdate(ValueAnimator valueAnimator) {
                this.A01.A04(z11, i5, valueAnimator);
            }
        });
        animatorSet.playTogether(valueAnimatorOfFloat);
    }

    public final void A01(AnimatorSet animatorSet, boolean z11) {
        if (z11) {
            this.A03.getView().setClipToOutline(true);
            C1684eO c1684eO = new C1684eO(this);
            this.A03.getView().setOutlineProvider(c1684eO);
            if (this.A01 != null) {
                this.A01.setClipToOutline(true);
                this.A01.setOutlineProvider(c1684eO);
            }
            A00(animatorSet, A05, true);
            return;
        }
        this.A03.getView().setClipToOutline(false);
        this.A03.getView().setOutlineProvider(ViewOutlineProvider.BACKGROUND);
        if (this.A01 != null) {
            this.A01.setClipToOutline(false);
            this.A01.setOutlineProvider(ViewOutlineProvider.BACKGROUND);
        }
        A00(animatorSet, this.A00, false);
    }

    public final void A02(BP bp2) {
        addView(bp2, new RelativeLayout.LayoutParams(-1, -1));
        this.A01 = (C5B) bp2;
    }

    public final void A03(BP bp2) {
        AbstractC2426qc.A0K(bp2);
        this.A01 = null;
    }

    public final /* synthetic */ void A04(boolean z11, int i5, ValueAnimator valueAnimator) {
        float fFloatValue = ((Float) valueAnimator.getAnimatedValue()).floatValue();
        if (!z11) {
            String[] strArr = A04;
            if (strArr[5].charAt(24) == strArr[4].charAt(24)) {
                throw new RuntimeException();
            }
            A04[1] = "wCqIAiIIVzI7O3YweFiI0wV5bXgPpHOB";
            fFloatValue = 1.0f - fFloatValue;
        }
        float interpolatedTime = i5;
        this.A00 = (int) (interpolatedTime * fFloatValue);
        requestLayout();
    }

    public final boolean A05() {
        return this.A03.AAV();
    }

    public int getCurrentPosition() {
        return this.A03.getCurrentPosition();
    }

    @Override // android.widget.RelativeLayout, android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        ((View) this.A03).layout(this.A00, this.A00, getWidth() - this.A00, getHeight() - this.A00);
        if (this.A01 != null) {
            this.A01.layout(this.A00, this.A00, getWidth() - this.A00, getHeight() - this.A00);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x00b2  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00ee  */
    @Override // android.widget.RelativeLayout, android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void onMeasure(int i5, int i11) {
        boolean z11 = false;
        int heightSpecSize = this.A03.getVideoWidth() + (this.A00 * 2);
        int heightSpecMode = this.A03.getVideoHeight() + (this.A00 * 2);
        int height = getDefaultSize(heightSpecSize, i5);
        int widthSpecMode = getDefaultSize(heightSpecMode, i11);
        if (heightSpecSize > 0 && heightSpecMode > 0) {
            z11 = true;
            int widthSpecSize = View.MeasureSpec.getMode(i5);
            String[] strArr = A04;
            String str = strArr[5];
            String str2 = strArr[4];
            int mVideoWidth = str.charAt(24);
            if (mVideoWidth == str2.charAt(24)) {
                throw new RuntimeException();
            }
            A04[1] = "CDDJeYuNvDEJubiWpvjZnzRFdpaPIWUA";
            int width = View.MeasureSpec.getSize(i5);
            int mVideoHeight = View.MeasureSpec.getMode(i11);
            int mVideoWidth2 = View.MeasureSpec.getSize(i11);
            if (widthSpecSize != 1073741824 || mVideoHeight != 1073741824) {
                if (widthSpecSize == 1073741824) {
                    height = width;
                    widthSpecMode = (height * heightSpecMode) / heightSpecSize;
                    if (mVideoHeight == Integer.MIN_VALUE && widthSpecMode > mVideoWidth2) {
                        widthSpecMode = mVideoWidth2;
                    }
                } else if (mVideoHeight == 1073741824) {
                    widthSpecMode = mVideoWidth2;
                    height = (widthSpecMode * heightSpecSize) / heightSpecMode;
                    String[] strArr2 = A04;
                    String str3 = strArr2[7];
                    String str4 = strArr2[0];
                    int mVideoWidth3 = str3.charAt(1);
                    if (mVideoWidth3 != str4.charAt(1)) {
                        String[] strArr3 = A04;
                        strArr3[7] = "6OY3VkVRTo9gTvB5T4EFQBtDC7FaIDf0";
                        strArr3[0] = "lXHmnICBdoyL7DjWTMRRGmshSxtLnfI6";
                        if (widthSpecSize == Integer.MIN_VALUE) {
                            if (height > width) {
                                height = width;
                            }
                        }
                    } else if (widthSpecSize == Integer.MIN_VALUE) {
                    }
                } else {
                    height = heightSpecSize;
                    widthSpecMode = heightSpecMode;
                    if (mVideoHeight == Integer.MIN_VALUE && widthSpecMode > mVideoWidth2) {
                        widthSpecMode = mVideoWidth2;
                        height = (widthSpecMode * heightSpecSize) / heightSpecMode;
                    }
                    if (widthSpecSize == Integer.MIN_VALUE && height > width) {
                        height = width;
                        widthSpecMode = (height * heightSpecMode) / heightSpecSize;
                    }
                }
            } else {
                height = width;
                widthSpecMode = mVideoWidth2;
                int mVideoWidth4 = heightSpecSize * widthSpecMode;
                if (mVideoWidth4 < height * heightSpecMode) {
                    height = (widthSpecMode * heightSpecSize) / heightSpecMode;
                } else {
                    int i12 = heightSpecSize * widthSpecMode;
                    int width2 = height * heightSpecMode;
                    int mVideoWidth5 = A04[3].charAt(9);
                    if (mVideoWidth5 != 104) {
                        A04[3] = "fC7LLJ1Dm89Wzyv9Y7CU7RKyEHK0kUw2";
                        if (i12 > width2) {
                            widthSpecMode = (height * heightSpecMode) / heightSpecSize;
                        }
                    } else if (i12 > width2) {
                    }
                }
            }
        }
        setMeasuredDimension(height, widthSpecMode);
        int mVideoWidth6 = A04[3].charAt(9);
        if (mVideoWidth6 != 104) {
            A04[1] = "jUvlMuc6V7f2FSIr4bukaecFyxTPY1HC";
            if (!z11) {
                return;
            }
        } else if (!z11) {
            return;
        }
        if (this.A02 != null && this.A02.get() != null) {
            this.A02.get().AHd();
        }
    }

    public void setRoundedCornersVideoStyle(float f11) {
        this.A03.getView().setClipToOutline(true);
        this.A03.getView().setOutlineProvider(new C1683eN(this, f11));
    }

    public void setViewImplInflationListener(InterfaceC1682eM interfaceC1682eM) {
        this.A02 = new WeakReference<>(interfaceC1682eM);
    }
}
