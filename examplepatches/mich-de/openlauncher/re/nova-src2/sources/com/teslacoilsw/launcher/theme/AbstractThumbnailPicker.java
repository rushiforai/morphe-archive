package com.teslacoilsw.launcher.theme;

import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.animation.PropertyValuesHolder;
import android.animation.ValueAnimator;
import android.app.Activity;
import android.app.Fragment;
import android.app.LoaderManager;
import android.content.Intent;
import android.content.Loader;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Bundle;
import android.os.SystemClock;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewPropertyAnimator;
import android.view.ViewStub;
import android.view.animation.DecelerateInterpolator;
import android.widget.AbsListView;
import android.widget.AdapterView;
import android.widget.FrameLayout;
import android.widget.GridView;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.ListAdapter;
import android.widget.TextView;
import androidx.appcompat.widget.Toolbar;
import androidx.cardview.widget.CardView;
import com.amplitude.core.events.Plan;
import com.teslacoilsw.launcher.widget.IsMeasuringGridView;
import e10.z2;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;
import mx.p1;
import og.i;
import ps.e0;
import r.j2;
import u20.n;
import u20.o;
import x30.g;

/* loaded from: classes4.dex */
public abstract class AbstractThumbnailPicker extends Fragment implements LoaderManager.LoaderCallbacks<List<? extends u20.e>>, AdapterView.OnItemClickListener, AbsListView.OnScrollListener {

    /* renamed from: a, reason: collision with root package name */
    public String f46286a;

    /* renamed from: b, reason: collision with root package name */
    public u20.d f46287b;

    /* renamed from: c, reason: collision with root package name */
    public Toolbar f46288c;

    /* renamed from: d, reason: collision with root package name */
    public IsMeasuringGridView f46289d;

    /* renamed from: e, reason: collision with root package name */
    public int f46290e;

    /* renamed from: f, reason: collision with root package name */
    public Intent f46291f = null;

    /* renamed from: g, reason: collision with root package name */
    public ImageView f46292g = null;

    /* renamed from: h, reason: collision with root package name */
    public boolean f46293h = true;

    /* renamed from: i, reason: collision with root package name */
    public int f46294i = 0;

    /* renamed from: j, reason: collision with root package name */
    public int f46295j = Integer.MIN_VALUE;

    /* renamed from: k, reason: collision with root package name */
    public long f46296k = SystemClock.uptimeMillis();

    /* renamed from: l, reason: collision with root package name */
    public boolean f46297l = false;

    /* renamed from: m, reason: collision with root package name */
    public boolean f46298m = false;

    public static Uri j(Activity activity, Bitmap bitmap) {
        try {
            File file = new File(activity.getCacheDir(), "_cropImageTemp");
            bitmap.compress(Bitmap.CompressFormat.PNG, 100, new FileOutputStream(file));
            return Uri.fromFile(file);
        } catch (FileNotFoundException e3) {
            throw new RuntimeException(e3);
        }
    }

    public final void a() {
        Toolbar toolbar = this.f46288c;
        toolbar.x(z2.b0(toolbar.getContext(), 2131230928));
        this.f46288c.y(new u20.a(this, 0));
        this.f46288c.A(e());
        ((ViewGroup) this.f46288c.getParent()).setBackgroundColor(d());
        if (this.f46291f == null) {
            ImageView imageView = this.f46292g;
            if (imageView != null) {
                this.f46288c.removeView(imageView);
                return;
            }
            return;
        }
        if (this.f46292g == null) {
            this.f46292g = new ImageView(this.f46288c.getContext());
            j2 j2Var = new j2(w20.e.k(48), -1);
            j2Var.f75187a = 8388629;
            this.f46292g.setLayoutParams(j2Var);
            this.f46288c.addView(this.f46292g);
            TypedValue typedValue = new TypedValue();
            this.f46292g.getContext().getTheme().resolveAttribute(2130969921, typedValue, true);
            this.f46292g.setBackgroundResource(typedValue.resourceId);
            this.f46292g.setImageResource(2131231426);
            this.f46292g.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
            this.f46292g.setOnClickListener(new u20.a(this, 1));
        }
    }

    public boolean b(Bitmap bitmap) {
        return true;
    }

    public String c() {
        return "picker";
    }

    public int d() {
        return -14606047;
    }

    public String e() {
        return this.f46286a;
    }

    public int f() {
        return this.f46290e;
    }

    public abstract Bitmap g(dy.d dVar, u20.e eVar, AtomicBoolean atomicBoolean);

    @Override // android.app.LoaderManager.LoaderCallbacks
    /* renamed from: h, reason: merged with bridge method [inline-methods] */
    public void onLoadFinished(Loader loader, List list) {
        int firstVisiblePosition;
        PickerActivity pickerActivity = (PickerActivity) getActivity();
        if (this.f46287b == null || pickerActivity == null) {
            firstVisiblePosition = -1;
        } else {
            IsMeasuringGridView isMeasuringGridView = this.f46289d;
            firstVisiblePosition = isMeasuringGridView != null ? isMeasuringGridView.getFirstVisiblePosition() : -1;
            this.f46287b.b();
        }
        this.f46287b = new u20.d(this, list);
        IsMeasuringGridView isMeasuringGridView2 = this.f46289d;
        u20.d dVar = this.f46287b;
        u20.b bVar = new u20.b(this, isMeasuringGridView2, dVar, dVar);
        IsMeasuringGridView isMeasuringGridView3 = this.f46289d;
        if (isMeasuringGridView3 != null) {
            isMeasuringGridView3.setAdapter((ListAdapter) bVar);
            this.f46289d.setRecyclerListener(this.f46287b);
            if (firstVisiblePosition != -1) {
                this.f46289d.setSelectionFromTop(firstVisiblePosition, 0);
            }
        }
    }

    public final void i() {
        for (int i5 = 0; i5 < this.f46289d.getChildCount(); i5++) {
            View childAt = this.f46289d.getChildAt(i5);
            int positionForView = this.f46289d.getPositionForView(childAt);
            if (positionForView != -1) {
                ListAdapter adapter = this.f46289d.getAdapter();
                if (!(adapter instanceof g)) {
                    this.f46287b.a(positionForView, childAt);
                } else if (childAt instanceof x30.c) {
                    ((g) adapter).a(positionForView, (x30.c) childAt);
                }
            }
        }
    }

    @Override // android.app.Fragment
    public final void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        getLoaderManager().initLoader(-1, null, this);
    }

    @Override // android.app.Fragment
    public void onActivityResult(int i5, int i11, Intent intent) {
        if (i5 != 123) {
            super.onActivityResult(i5, i11, intent);
            return;
        }
        if (i11 == -1) {
            if (intent == null) {
                intent = new Intent();
            }
            intent.putExtra(Plan.AMP_PLAN_SOURCE, c());
            getActivity().setResult(-1, intent);
            getActivity().finish();
        }
    }

    @Override // android.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        getResources();
        this.f46290e = w20.e.k(128);
        this.f46286a = getArguments().getString("title");
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // android.app.Fragment
    public final View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) throws Resources.NotFoundException {
        int i5 = this.f46290e;
        View viewInflate = layoutInflater.inflate(2131623976, viewGroup, false);
        ViewStub viewStub = (ViewStub) viewInflate.findViewById(2131428930);
        viewStub.setLayoutResource(2131624157);
        IsMeasuringGridView isMeasuringGridView = (IsMeasuringGridView) viewStub.inflate();
        if (-1 != isMeasuringGridView.f95048g) {
            isMeasuringGridView.f95048g = -1;
            isMeasuringGridView.a();
        }
        if (i5 != isMeasuringGridView.f95047f) {
            isMeasuringGridView.f95047f = i5;
            isMeasuringGridView.a();
        }
        if (2 != isMeasuringGridView.f95045d) {
            isMeasuringGridView.f95045d = 2;
            isMeasuringGridView.a();
        }
        int dimensionPixelSize = getResources().getDimensionPixelSize(2131166524);
        if (dimensionPixelSize != isMeasuringGridView.f95044c) {
            isMeasuringGridView.f95044c = dimensionPixelSize;
            isMeasuringGridView.a();
        }
        isMeasuringGridView.setScrollBarStyle(33554432);
        isMeasuringGridView.setClipToPadding(false);
        isMeasuringGridView.setDividerHeight(dimensionPixelSize);
        isMeasuringGridView.setOnItemClickListener(this);
        if (this instanceof AdapterView.OnItemLongClickListener) {
            isMeasuringGridView.setOnItemLongClickListener((AdapterView.OnItemLongClickListener) this);
        }
        isMeasuringGridView.setOnScrollListener(this);
        Toolbar toolbar = (Toolbar) viewInflate.findViewById(2131429059);
        this.f46288c = toolbar;
        toolbar.setBackground(null);
        a();
        this.f46289d = isMeasuringGridView;
        return viewInflate;
    }

    @Override // android.app.Fragment
    public final void onDestroy() {
        super.onDestroy();
        u20.d dVar = this.f46287b;
        if (dVar != null) {
            dVar.b();
        }
        this.f46289d = null;
        this.f46287b = null;
    }

    @Override // android.widget.AdapterView.OnItemClickListener
    public void onItemClick(AdapterView adapterView, View view, int i5, long j11) {
    }

    @Override // android.app.LoaderManager.LoaderCallbacks
    public final void onLoaderReset(Loader<List<? extends u20.e>> loader) {
    }

    @Override // android.app.Fragment
    public final void onPause() {
        super.onPause();
        p1.b(this);
    }

    @Override // android.widget.AbsListView.OnScrollListener
    public final void onScroll(AbsListView absListView, int i5, int i11, int i12) {
        if (i5 != 0) {
            this.f46293h = false;
        }
        long jUptimeMillis = SystemClock.uptimeMillis();
        if (this.f46294i == 2) {
            int i13 = i5 - this.f46295j;
            long j11 = jUptimeMillis - this.f46296k;
            if (j11 < 100) {
                return;
            }
            float fAbs = Math.abs(((i13 / j11) / (absListView instanceof GridView ? ((GridView) absListView).getNumColumns() : 1)) * 1000.0f);
            if (fAbs >= 20 && !this.f46297l) {
                this.f46297l = true;
                p1.a(this);
            } else if (fAbs < 10 && this.f46297l) {
                this.f46297l = false;
                p1.b(this);
            }
            float f11 = 60;
            if (fAbs >= f11 && !this.f46298m) {
                this.f46298m = true;
            } else if (fAbs < f11 && this.f46298m) {
                this.f46298m = false;
                i();
            }
        }
        this.f46295j = i5;
        this.f46296k = jUptimeMillis;
    }

    @Override // android.widget.AbsListView.OnScrollListener
    public final void onScrollStateChanged(AbsListView absListView, int i5) {
        this.f46293h = false;
        this.f46294i = i5;
        if (this.f46297l && i5 != 2) {
            this.f46297l = false;
            p1.b(this);
        }
        if (!this.f46298m || i5 == 2) {
            return;
        }
        this.f46298m = false;
        i();
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x021f  */
    @Override // android.app.Fragment
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void onViewCreated(View view, Bundle bundle) {
        int i5;
        super.onViewCreated(view, bundle);
        PickerActivity pickerActivity = (PickerActivity) getActivity();
        int iD = d();
        View view2 = pickerActivity.f46312s;
        if (view2 == null) {
            pickerActivity.f46310q.getChildAt(0).setVisibility(4);
            return;
        }
        ViewGroup viewGroup = (ViewGroup) view2.getParent();
        View viewInflate = LayoutInflater.from(viewGroup.getContext()).inflate(2131624065, viewGroup, false);
        TextView textView = (TextView) view2.findViewById(2131428412);
        TextView textView2 = (TextView) viewInflate.findViewById(2131428412);
        TextView textView3 = (TextView) viewInflate.findViewById(2131428230);
        ImageView imageView = (ImageView) viewInflate.findViewById(2131428202);
        textView3.setVisibility(8);
        textView2.setText(textView.getText());
        imageView.setImageDrawable(((ImageView) view2.findViewById(2131428202)).getDrawable().getConstantState().newDrawable(pickerActivity.getResources()));
        viewInflate.measure(View.MeasureSpec.makeMeasureSpec(view2.getMeasuredWidth(), 1073741824), View.MeasureSpec.makeMeasureSpec(view2.getMeasuredHeight(), 1073741824));
        ((ViewGroup) textView2.getParent()).removeView(textView2);
        int[] iArr = new int[2];
        view2.getLocationInWindow(iArr);
        int[] iArr2 = new int[2];
        pickerActivity.f46310q.getLocationInWindow(iArr2);
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(view2.getMeasuredWidth(), view2.getMeasuredHeight());
        layoutParams.leftMargin = iArr[0] - iArr2[0];
        int i11 = 1;
        layoutParams.topMargin = iArr[1] - iArr2[1];
        viewInflate.setLayoutParams(layoutParams);
        textView.getLocationInWindow(iArr);
        FrameLayout.LayoutParams layoutParams2 = new FrameLayout.LayoutParams(pickerActivity.f46310q.getMeasuredWidth(), textView.getMeasuredHeight() * 2);
        layoutParams2.leftMargin = iArr[0] - iArr2[0];
        layoutParams2.topMargin = iArr[1] - iArr2[1];
        textView2.setLayoutParams(layoutParams2);
        Toolbar toolbar = (Toolbar) pickerActivity.findViewById(2131429059);
        int i12 = 0;
        TextView textView4 = null;
        ImageView imageView2 = null;
        while (i12 < toolbar.getChildCount()) {
            View childAt = toolbar.getChildAt(i12);
            int i13 = i11;
            if (textView4 == null && (childAt instanceof TextView)) {
                textView4 = (TextView) childAt;
            } else if (imageView2 == null && (childAt instanceof ImageView)) {
                imageView2 = (ImageView) childAt;
            }
            i12++;
            i11 = i13;
        }
        int i14 = i11;
        textView4.getLocationInWindow(iArr);
        float textSize = textView2.getTextSize() / textView4.getTextSize();
        textView2.setTextSize(0, textView4.getTextSize());
        textView2.setScaleX(textSize);
        textView2.setScaleY(textSize);
        int i15 = (iArr[0] - iArr2[0]) - layoutParams2.leftMargin;
        int i16 = (iArr[i14] - iArr2[i14]) - layoutParams2.topMargin;
        ImageButton imageButton = new ImageButton(pickerActivity, null, 2130970239);
        imageButton.setImageDrawable(e0.D(imageView2.getDrawable()).getConstantState().newDrawable(pickerActivity.getResources()));
        FrameLayout.LayoutParams layoutParams3 = new FrameLayout.LayoutParams(imageView2.getMeasuredWidth(), imageView2.getMeasuredHeight());
        imageView2.getLocationInWindow(iArr);
        layoutParams3.leftMargin = iArr[0] - iArr2[0];
        layoutParams3.topMargin = iArr[i14] - iArr2[i14];
        imageButton.setLayoutParams(layoutParams3);
        pickerActivity.f46314u = textView2;
        pickerActivity.f46313t = viewInflate;
        pickerActivity.f46312s.setVisibility(4);
        ViewGroup viewGroup2 = (ViewGroup) pickerActivity.findViewById(2131429060);
        View viewFindViewById = pickerActivity.findViewById(2131429063);
        viewFindViewById.setVisibility(4);
        Fragment targetFragment = getTargetFragment();
        if (targetFragment == null || targetFragment.getView() == null) {
            return;
        }
        View viewFindViewById2 = view.findViewById(2131429060);
        viewFindViewById2.setAlpha(0.0f);
        View view3 = targetFragment.getView();
        View viewFindViewById3 = view3.findViewById(16908298);
        ViewPropertyAnimator viewPropertyAnimatorWithLayer = viewFindViewById3.animate().translationY(viewFindViewById3.getMeasuredHeight()).setDuration(600L).setInterpolator(zx.d.f98807c).withLayer();
        pickerActivity.f46310q.addView(pickerActivity.f46313t);
        pickerActivity.f46310q.addView(pickerActivity.f46314u);
        pickerActivity.f46310q.addView(imageButton);
        imageButton.setZ(pickerActivity.f46313t.getZ());
        pickerActivity.f46314u.setZ(pickerActivity.f46313t.getZ());
        CardView cardView = (CardView) pickerActivity.f46313t;
        float[] fArr = new float[i14];
        fArr[0] = 2.0f;
        PropertyValuesHolder propertyValuesHolderOfFloat = PropertyValuesHolder.ofFloat("scaleX", fArr);
        if (!v30.a.f92041e) {
            int i17 = pickerActivity.getResources().getDisplayMetrics().densityDpi;
            i5 = i17 != 240 ? i17 != 320 ? i17 != 480 ? (i17 == 560 || i17 != 640) ? 0 : 5 : 4 : 3 : 2;
        }
        float measuredHeight = viewGroup2.getMeasuredHeight();
        int measuredHeight2 = pickerActivity.f46313t.getMeasuredHeight();
        int paddingTop = cardView.getPaddingTop();
        i iVar = cardView.f13856e;
        PropertyValuesHolder propertyValuesHolderOfFloat2 = PropertyValuesHolder.ofFloat("scaleY", measuredHeight / (((measuredHeight2 - paddingTop) - cardView.getPaddingBottom()) + i5));
        pickerActivity.f46313t.setPivotY(cardView.getPaddingTop());
        pickerActivity.f46313t.setPivotX((r4.getMeasuredWidth() * 2) / 3.0f);
        pickerActivity.f46314u.setPivotY(0.0f);
        pickerActivity.f46314u.setPivotX(0.0f);
        float elevation = ((CardView) iVar.f80413c).getElevation();
        ValueAnimator valueAnimatorOfFloat = ValueAnimator.ofFloat(0.0f, 1.0f);
        cardView.e(((CardView) iVar.f80413c).getElevation());
        valueAnimatorOfFloat.addUpdateListener(new n(pickerActivity.getColor(2131101263), iD, cardView, elevation));
        valueAnimatorOfFloat.setInterpolator(zx.d.f98809e);
        PropertyValuesHolder propertyValuesHolderOfFloat3 = PropertyValuesHolder.ofFloat("translationY", (-((FrameLayout.LayoutParams) pickerActivity.f46313t.getLayoutParams()).topMargin) - cardView.getPaddingTop());
        PropertyValuesHolder propertyValuesHolderOfFloat4 = PropertyValuesHolder.ofFloat("translationY", i16);
        PropertyValuesHolder propertyValuesHolderOfFloat5 = PropertyValuesHolder.ofFloat("translationX", i15);
        PropertyValuesHolder propertyValuesHolderOfInt = PropertyValuesHolder.ofInt("textColor", -16777216, -1);
        propertyValuesHolderOfInt.setEvaluator(c8.a.f19830a);
        ObjectAnimator objectAnimatorOfPropertyValuesHolder = ObjectAnimator.ofPropertyValuesHolder(pickerActivity.f46314u, propertyValuesHolderOfFloat4, propertyValuesHolderOfFloat5, propertyValuesHolderOfInt, PropertyValuesHolder.ofFloat("scaleX", 1.0f), PropertyValuesHolder.ofFloat("scaleY", 1.0f));
        DecelerateInterpolator decelerateInterpolator = zx.d.f98810f;
        objectAnimatorOfPropertyValuesHolder.setInterpolator(decelerateInterpolator);
        ObjectAnimator objectAnimatorOfPropertyValuesHolder2 = ObjectAnimator.ofPropertyValuesHolder(pickerActivity.f46313t, propertyValuesHolderOfFloat, propertyValuesHolderOfFloat2, propertyValuesHolderOfFloat3);
        objectAnimatorOfPropertyValuesHolder2.setInterpolator(decelerateInterpolator);
        AnimatorSet animatorSet = new AnimatorSet();
        animatorSet.playTogether(valueAnimatorOfFloat, objectAnimatorOfPropertyValuesHolder2, objectAnimatorOfPropertyValuesHolder);
        animatorSet.setDuration(600L);
        animatorSet.addListener(new o(pickerActivity, viewPropertyAnimatorWithLayer, imageButton, viewFindViewById2, view3, viewFindViewById, viewFindViewById3));
        pickerActivity.f46311r = animatorSet;
        animatorSet.addListener(p1.f77227d);
        animatorSet.start();
    }

    @Override // android.app.Fragment
    public final void setUserVisibleHint(boolean z11) {
        super.setUserVisibleHint(z11);
        if (z11) {
            return;
        }
        p1.b(this);
    }
}
