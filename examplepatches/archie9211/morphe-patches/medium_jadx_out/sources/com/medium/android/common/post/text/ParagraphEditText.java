package com.medium.android.common.post.text;

import android.content.Context;
import android.content.res.Resources;
import android.util.AttributeSet;
import android.view.View;
import android.widget.AutoCompleteTextView;
import com.medium.reader.R;
import defpackage.f19;
import defpackage.o20;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ParagraphEditText extends o20 {
    public static final /* synthetic */ int g = 0;
    public View e;
    public boolean f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ParagraphEditText(Context context) {
        super(context, null);
        context.getClass();
        setOnDismissListener(new AutoCompleteTextView.OnDismissListener() { // from class: g19
            @Override // android.widget.AutoCompleteTextView.OnDismissListener
            public final void onDismiss() {
                this.a.b(0);
            }
        });
        setOnClickListener(new f19(this, 0, this));
    }

    private final int getDropDownItemHeight() {
        Resources resources = getResources();
        return resources.getDimensionPixelSize(R.dimen.common_divider_height_thin) + resources.getDimensionPixelSize(R.dimen.common_avatar_size) + (resources.getDimensionPixelSize(R.dimen.common_padding_small) * 2);
    }

    private final View getSpacer() {
        View view = this.e;
        if (view != null) {
            return view;
        }
        View viewFindViewById = getRootView().findViewById(R.id.common_edit_post_autocomplete_spacer);
        this.e = viewFindViewById;
        return viewFindViewById;
    }

    public final void b(int i) {
        int iMin = (int) Math.min(3.0d, i);
        setDropDownHeight(iMin < 3 ? -2 : getDropDownItemHeight() * iMin);
        View spacer = getSpacer();
        if (spacer == null) {
            return;
        }
        if (!isPopupShowing()) {
            iMin = 0;
        }
        int dropDownItemHeight = getDropDownItemHeight() * iMin;
        int i2 = spacer.getLayoutParams().height;
        int iMax = (int) Math.max(0.0d, getDropDownVerticalOffset() + dropDownItemHeight);
        spacer.getLayoutParams().height = iMax;
        spacer.requestLayout();
        if (iMin <= 0 || iMax <= i2) {
            return;
        }
        requestFocus();
    }

    @Override // android.widget.AutoCompleteTextView, android.widget.Filter.FilterListener
    public final void onFilterComplete(int i) {
        b(i);
        super.onFilterComplete(i);
    }

    @Override // android.widget.AutoCompleteTextView, android.widget.TextView, android.view.View
    public final void onWindowFocusChanged(boolean z) {
        if (this.f) {
            return;
        }
        super.onWindowFocusChanged(z);
    }

    public final void setShouldWindowFocusWait(boolean z) {
        this.f = z;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ParagraphEditText(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        context.getClass();
        setOnDismissListener(new AutoCompleteTextView.OnDismissListener() { // from class: g19
            @Override // android.widget.AutoCompleteTextView.OnDismissListener
            public final void onDismiss() {
                this.a.b(0);
            }
        });
        setOnClickListener(new f19(this, 0, this));
    }
}
