package com.google.android.material.datepicker;

import a5.a1;
import android.content.res.Resources;
import android.os.Bundle;
import android.view.ContextThemeWrapper;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.GridView;
import android.widget.ListAdapter;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.recyclerview.widget.h1;
import com.google.android.material.button.MaterialButton;

/* loaded from: classes3.dex */
public final class MaterialCalendar<S> extends PickerFragment<S> {

    /* renamed from: b, reason: collision with root package name */
    public int f34195b;

    /* renamed from: c, reason: collision with root package name */
    public CalendarConstraints f34196c;

    /* renamed from: d, reason: collision with root package name */
    public Month f34197d;

    /* renamed from: e, reason: collision with root package name */
    public int f34198e;

    /* renamed from: f, reason: collision with root package name */
    public d f34199f;

    /* renamed from: g, reason: collision with root package name */
    public RecyclerView f34200g;

    /* renamed from: h, reason: collision with root package name */
    public RecyclerView f34201h;

    /* renamed from: i, reason: collision with root package name */
    public View f34202i;

    /* renamed from: j, reason: collision with root package name */
    public View f34203j;

    /* renamed from: k, reason: collision with root package name */
    public View f34204k;

    /* renamed from: l, reason: collision with root package name */
    public View f34205l;

    public final void n(Month month) {
        s sVar = (s) this.f34201h.getAdapter();
        int i5 = sVar.f34275a.f34187a.i(month);
        int i11 = i5 - sVar.f34275a.f34187a.i(this.f34197d);
        boolean z11 = Math.abs(i11) > 3;
        boolean z12 = i11 > 0;
        this.f34197d = month;
        if (z11 && z12) {
            this.f34201h.scrollToPosition(i5 - 3);
            this.f34201h.post(new g(this, i5, 0));
        } else if (!z11) {
            this.f34201h.post(new g(this, i5, 0));
        } else {
            this.f34201h.scrollToPosition(i5 + 3);
            this.f34201h.post(new g(this, i5, 0));
        }
    }

    public final void o(int i5) {
        this.f34198e = i5;
        if (i5 == 2) {
            this.f34200g.getLayoutManager().scrollToPosition(this.f34197d.f34233c - ((x) this.f34200g.getAdapter()).f34281a.f34196c.f34187a.f34233c);
            this.f34204k.setVisibility(0);
            this.f34205l.setVisibility(8);
            this.f34202i.setVisibility(8);
            this.f34203j.setVisibility(8);
            return;
        }
        if (i5 == 1) {
            this.f34204k.setVisibility(8);
            this.f34205l.setVisibility(0);
            this.f34202i.setVisibility(0);
            this.f34203j.setVisibility(0);
            n(this.f34197d);
        }
    }

    @Override // androidx.fragment.app.h0
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (bundle == null) {
            bundle = getArguments();
        }
        this.f34195b = bundle.getInt("THEME_RES_ID_KEY");
        if (bundle.getParcelable("GRID_SELECTOR_KEY") != null) {
            throw new ClassCastException();
        }
        this.f34196c = (CalendarConstraints) bundle.getParcelable("CALENDAR_CONSTRAINTS_KEY");
        if (bundle.getParcelable("DAY_VIEW_DECORATOR_KEY") != null) {
            throw new ClassCastException();
        }
        this.f34197d = (Month) bundle.getParcelable("CURRENT_MONTH_KEY");
    }

    @Override // androidx.fragment.app.h0
    public final View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) throws Resources.NotFoundException {
        int i5;
        int i11;
        ContextThemeWrapper contextThemeWrapper = new ContextThemeWrapper(getContext(), this.f34195b);
        this.f34199f = new d(contextThemeWrapper);
        LayoutInflater layoutInflaterCloneInContext = layoutInflater.cloneInContext(contextThemeWrapper);
        Month month = this.f34196c.f34187a;
        if (MaterialDatePicker.q(contextThemeWrapper, 16843277)) {
            i5 = 2131624247;
            i11 = 1;
        } else {
            i5 = 2131624242;
            i11 = 0;
        }
        View viewInflate = layoutInflaterCloneInContext.inflate(i5, viewGroup, false);
        Resources resources = requireContext().getResources();
        int dimensionPixelOffset = resources.getDimensionPixelOffset(2131166147) + resources.getDimensionPixelOffset(2131166149) + resources.getDimensionPixelSize(2131166148);
        int dimensionPixelSize = resources.getDimensionPixelSize(2131166132);
        int i12 = p.f34266d;
        viewInflate.setMinimumHeight(dimensionPixelOffset + dimensionPixelSize + (resources.getDimensionPixelOffset(2131166146) * (i12 - 1)) + (resources.getDimensionPixelSize(2131166127) * i12) + resources.getDimensionPixelOffset(2131166124));
        GridView gridView = (GridView) viewInflate.findViewById(2131428384);
        a1.k(gridView, new h(0));
        int i13 = this.f34196c.f34191e;
        gridView.setAdapter((ListAdapter) (i13 > 0 ? new e(i13) : new e()));
        gridView.setNumColumns(month.f34234d);
        gridView.setEnabled(false);
        this.f34201h = (RecyclerView) viewInflate.findViewById(2131428387);
        getContext();
        this.f34201h.setLayoutManager(new i(this, i11, i11));
        this.f34201h.setTag("MONTHS_VIEW_GROUP_TAG");
        s sVar = new s(contextThemeWrapper, this.f34196c, new j(this));
        this.f34201h.setAdapter(sVar);
        int integer = contextThemeWrapper.getResources().getInteger(2131492938);
        RecyclerView recyclerView = (RecyclerView) viewInflate.findViewById(2131428390);
        this.f34200g = recyclerView;
        if (recyclerView != null) {
            recyclerView.setHasFixedSize(true);
            this.f34200g.setLayoutManager(new GridLayoutManager(integer));
            this.f34200g.setAdapter(new x(this));
            this.f34200g.addItemDecoration(new k(this));
        }
        if (viewInflate.findViewById(2131428373) != null) {
            MaterialButton materialButton = (MaterialButton) viewInflate.findViewById(2131428373);
            materialButton.setTag("SELECTOR_TOGGLE_TAG");
            a1.k(materialButton, new l(this, 0));
            View viewFindViewById = viewInflate.findViewById(2131428375);
            this.f34202i = viewFindViewById;
            viewFindViewById.setTag("NAVIGATION_PREV_TAG");
            View viewFindViewById2 = viewInflate.findViewById(2131428374);
            this.f34203j = viewFindViewById2;
            viewFindViewById2.setTag("NAVIGATION_NEXT_TAG");
            this.f34204k = viewInflate.findViewById(2131428390);
            this.f34205l = viewInflate.findViewById(2131428383);
            o(1);
            materialButton.setText(this.f34197d.d());
            this.f34201h.addOnScrollListener(new m(this, sVar, materialButton));
            materialButton.setOnClickListener(new n(this, 0));
            this.f34203j.setOnClickListener(new f(this, sVar, 1));
            this.f34202i.setOnClickListener(new f(this, sVar, 0));
        }
        if (!MaterialDatePicker.q(contextThemeWrapper, 16843277)) {
            new h1().attachToRecyclerView(this.f34201h);
        }
        this.f34201h.scrollToPosition(sVar.f34275a.f34187a.i(this.f34197d));
        a1.k(this.f34201h, new h(1));
        return viewInflate;
    }

    @Override // androidx.fragment.app.h0
    public final void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putInt("THEME_RES_ID_KEY", this.f34195b);
        bundle.putParcelable("GRID_SELECTOR_KEY", null);
        bundle.putParcelable("CALENDAR_CONSTRAINTS_KEY", this.f34196c);
        bundle.putParcelable("DAY_VIEW_DECORATOR_KEY", null);
        bundle.putParcelable("CURRENT_MONTH_KEY", this.f34197d);
    }
}
