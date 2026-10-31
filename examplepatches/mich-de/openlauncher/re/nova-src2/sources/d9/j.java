package d9;

import ab.z;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Handler;
import android.os.IBinder;
import android.text.method.LinkMovementMethod;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.view.inputmethod.InputMethodManager;
import android.widget.AdapterView;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.RadioButton;
import android.widget.ScrollView;
import android.widget.TextView;
import com.afollestad.materialdialogs.MaterialDialog$DialogException;
import com.afollestad.materialdialogs.internal.MDButton;
import com.afollestad.materialdialogs.internal.MDRootLayout;
import com.google.android.gms.internal.consent_sdk.e0;
import com.google.android.gms.internal.measurement.k2;
import p10.c0;

/* loaded from: classes2.dex */
public final class j extends Dialog implements View.OnClickListener, AdapterView.OnItemClickListener, DialogInterface.OnShowListener {

    /* renamed from: a, reason: collision with root package name */
    public final MDRootLayout f49060a;

    /* renamed from: b, reason: collision with root package name */
    public DialogInterface.OnShowListener f49061b;

    /* renamed from: c, reason: collision with root package name */
    public final f f49062c;

    /* renamed from: d, reason: collision with root package name */
    public final ListView f49063d;

    /* renamed from: e, reason: collision with root package name */
    public final ImageView f49064e;

    /* renamed from: f, reason: collision with root package name */
    public final TextView f49065f;

    /* renamed from: g, reason: collision with root package name */
    public final View f49066g;

    /* renamed from: h, reason: collision with root package name */
    public final TextView f49067h;

    /* renamed from: i, reason: collision with root package name */
    public final EditText f49068i;

    /* renamed from: j, reason: collision with root package name */
    public final TextView f49069j;

    /* renamed from: k, reason: collision with root package name */
    public final MDButton f49070k;

    /* renamed from: l, reason: collision with root package name */
    public final MDButton f49071l;

    /* renamed from: m, reason: collision with root package name */
    public final MDButton f49072m;
    public final int n;

    /* JADX WARN: Illegal instructions before constructor call */
    public j(f fVar) throws IllegalAccessException, NoSuchFieldException, Resources.NotFoundException, SecurityException, IllegalArgumentException {
        int i5;
        CharSequence[] charSequenceArr;
        CharSequence[] charSequenceArr2;
        int i11;
        Context context = fVar.f49036a;
        boolean zT = c0.T(fVar.L == 2, context, 2130969647);
        fVar.L = zT ? 2 : 1;
        super(context, zT ? 2132083076 : 2132083077);
        new Handler();
        this.f49062c = fVar;
        LayoutInflater layoutInflaterFrom = LayoutInflater.from(context);
        if (fVar.f49046k != null) {
            i5 = 2131624216;
        } else {
            CharSequence[] charSequenceArr3 = fVar.f49042g;
            i5 = ((charSequenceArr3 == null || charSequenceArr3.length <= 0) && fVar.B == null) ? 2131624215 : 2131624218;
        }
        this.f49060a = (MDRootLayout) layoutInflaterFrom.inflate(i5, (ViewGroup) null);
        setCancelable(true);
        setCanceledOnTouchOutside(true);
        if (fVar.E == 0) {
            fVar.E = c0.U(context, 2130969637, c0.U(getContext(), 2130968931, 0));
        }
        if (fVar.E != 0) {
            GradientDrawable gradientDrawable = new GradientDrawable();
            gradientDrawable.setCornerRadius(context.getResources().getDimension(2131166020));
            gradientDrawable.setColor(fVar.E);
            this.f49060a.setBackground(gradientDrawable);
        }
        fVar.f49048m = c0.S(context, 2130969660, fVar.f49048m);
        fVar.o = c0.S(context, 2130969659, fVar.o);
        fVar.n = c0.S(context, 2130969658, fVar.n);
        fVar.f49047l = c0.U(context, 2130969665, fVar.f49047l);
        fVar.f49039d = c0.U(context, 2130969663, c0.U(getContext(), 16842806, 0));
        int iU = c0.U(context, 2130969645, c0.U(getContext(), 16842808, 0));
        fVar.f49040e = iU;
        fVar.F = c0.U(context, 2130969653, iU);
        this.f49065f = (TextView) this.f49060a.findViewById(2131429031);
        this.f49064e = (ImageView) this.f49060a.findViewById(2131428202);
        this.f49066g = this.f49060a.findViewById(2131429033);
        this.f49067h = (TextView) this.f49060a.findViewById(2131427749);
        this.f49063d = (ListView) this.f49060a.findViewById(2131427750);
        this.f49070k = (MDButton) this.f49060a.findViewById(2131427612);
        this.f49071l = (MDButton) this.f49060a.findViewById(2131427611);
        this.f49072m = (MDButton) this.f49060a.findViewById(2131427610);
        this.f49070k.setVisibility(fVar.f49043h != null ? 0 : 8);
        this.f49071l.setVisibility(fVar.f49044i != null ? 0 : 8);
        this.f49072m.setVisibility(fVar.f49045j != null ? 0 : 8);
        if (fVar.A != null) {
            this.f49064e.setVisibility(0);
            this.f49064e.setImageDrawable(fVar.A);
        } else {
            Drawable drawableV = c0.V(context, 2130969650);
            if (drawableV != null) {
                this.f49064e.setVisibility(0);
                this.f49064e.setImageDrawable(drawableV);
            } else {
                this.f49064e.setVisibility(8);
            }
        }
        TypedArray typedArrayObtainStyledAttributes = context.getTheme().obtainStyledAttributes(new int[]{2130969652});
        try {
            int dimensionPixelSize = typedArrayObtainStyledAttributes.getDimensionPixelSize(0, -1);
            typedArrayObtainStyledAttributes.recycle();
            dimensionPixelSize = c0.T(false, context, 2130969651) ? context.getResources().getDimensionPixelSize(2131166038) : dimensionPixelSize;
            if (dimensionPixelSize > -1) {
                this.f49064e.setAdjustViewBounds(true);
                this.f49064e.setMaxHeight(dimensionPixelSize);
                this.f49064e.setMaxWidth(dimensionPixelSize);
                this.f49064e.requestLayout();
            }
            int iU2 = c0.U(context, 2130969649, c0.U(getContext(), 2130969648, 0));
            MDRootLayout mDRootLayout = this.f49060a;
            mDRootLayout.f20173p.setColor(iU2);
            mDRootLayout.invalidate();
            TextView textView = this.f49065f;
            if (textView != null) {
                c(textView, fVar.f49059z);
                this.f49065f.setTextColor(fVar.f49039d);
                this.f49065f.setGravity(k2.b(fVar.G));
                TextView textView2 = this.f49065f;
                int iF = b.c0.F(fVar.G);
                textView2.setTextAlignment(iF != 1 ? iF != 2 ? 5 : 6 : 4);
                CharSequence charSequence = fVar.f49037b;
                if (charSequence == null) {
                    this.f49066g.setVisibility(8);
                } else {
                    this.f49065f.setText(charSequence);
                    this.f49066g.setVisibility(0);
                }
            }
            TextView textView3 = this.f49067h;
            if (textView3 != null) {
                textView3.setMovementMethod(new LinkMovementMethod());
                c(this.f49067h, fVar.f49058y);
                this.f49067h.setLineSpacing(0.0f, 1.2f);
                ColorStateList colorStateList = fVar.f49049p;
                if (colorStateList == null) {
                    this.f49067h.setLinkTextColor(c0.U(getContext(), 16842806, 0));
                } else {
                    this.f49067h.setLinkTextColor(colorStateList);
                }
                this.f49067h.setTextColor(fVar.f49040e);
                this.f49067h.setGravity(k2.b(fVar.H));
                TextView textView4 = this.f49067h;
                int iF2 = b.c0.F(fVar.H);
                textView4.setTextAlignment(iF2 != 1 ? iF2 != 2 ? 5 : 6 : 4);
                CharSequence charSequence2 = fVar.f49041f;
                if (charSequence2 != null) {
                    this.f49067h.setText(charSequence2);
                    this.f49067h.setVisibility(0);
                } else {
                    this.f49067h.setVisibility(8);
                }
            }
            MDRootLayout mDRootLayout2 = this.f49060a;
            mDRootLayout2.n = fVar.K;
            if (mDRootLayout2.getResources().getConfiguration().getLayoutDirection() == 1) {
                int iF3 = b.c0.F(mDRootLayout2.n);
                if (iF3 == 0) {
                    mDRootLayout2.n = 3;
                } else if (iF3 == 2) {
                    mDRootLayout2.n = 1;
                }
            }
            MDRootLayout mDRootLayout3 = this.f49060a;
            int i12 = fVar.I;
            for (MDButton mDButton : mDRootLayout3.f20164e) {
                if (mDButton != null) {
                    mDButton.f20155b = i12;
                }
            }
            MDRootLayout mDRootLayout4 = this.f49060a;
            mDRootLayout4.f20165f = fVar.M;
            mDRootLayout4.invalidate();
            boolean zT2 = c0.T(true, context, 16843660);
            zT2 = zT2 ? c0.T(true, context, 2130970124) : zT2;
            MDButton mDButton2 = this.f49070k;
            c(mDButton2, fVar.f49059z);
            mDButton2.setAllCaps(zT2);
            mDButton2.setText(fVar.f49043h);
            mDButton2.setTextColor(fVar.f49048m);
            MDButton mDButton3 = this.f49070k;
            c cVar = c.f49028a;
            mDButton3.f20157d = a(cVar, true);
            if (mDButton3.f20154a) {
                mDButton3.a(true, true);
            }
            MDButton mDButton4 = this.f49070k;
            mDButton4.f20158e = a(cVar, false);
            if (!mDButton4.f20154a) {
                mDButton4.a(false, true);
            }
            this.f49070k.setTag(cVar);
            this.f49070k.setOnClickListener(this);
            this.f49070k.setVisibility(0);
            MDButton mDButton5 = this.f49072m;
            c(mDButton5, fVar.f49059z);
            mDButton5.setAllCaps(zT2);
            mDButton5.setText(fVar.f49045j);
            mDButton5.setTextColor(fVar.n);
            MDButton mDButton6 = this.f49072m;
            c cVar2 = c.f49030c;
            mDButton6.f20157d = a(cVar2, true);
            if (mDButton6.f20154a) {
                mDButton6.a(true, true);
            }
            MDButton mDButton7 = this.f49072m;
            mDButton7.f20158e = a(cVar2, false);
            if (!mDButton7.f20154a) {
                mDButton7.a(false, true);
            }
            this.f49072m.setTag(cVar2);
            this.f49072m.setOnClickListener(this);
            this.f49072m.setVisibility(0);
            MDButton mDButton8 = this.f49071l;
            c(mDButton8, fVar.f49059z);
            mDButton8.setAllCaps(zT2);
            mDButton8.setText(fVar.f49044i);
            mDButton8.setTextColor(fVar.o);
            MDButton mDButton9 = this.f49071l;
            c cVar3 = c.f49029b;
            mDButton9.f20157d = a(cVar3, true);
            if (mDButton9.f20154a) {
                mDButton9.a(true, true);
            }
            MDButton mDButton10 = this.f49071l;
            mDButton10.f20158e = a(cVar3, false);
            if (!mDButton10.f20154a) {
                mDButton10.a(false, true);
            }
            this.f49071l.setTag(cVar3);
            this.f49071l.setOnClickListener(this);
            this.f49071l.setVisibility(0);
            ListView listView = this.f49063d;
            if (listView != null && (((charSequenceArr2 = fVar.f49042g) != null && charSequenceArr2.length > 0) || fVar.B != null)) {
                Drawable drawableV2 = c0.V(context, 2130969656);
                listView.setSelector(drawableV2 == null ? c0.V(getContext(), 2130969656) : drawableV2);
                if (fVar.B == null) {
                    this.n = 1;
                    int iF4 = b.c0.F(this.n);
                    if (iF4 == 0) {
                        i11 = 2131624222;
                    } else if (iF4 == 1) {
                        i11 = 2131624224;
                    } else {
                        if (iF4 != 2) {
                            throw new IllegalArgumentException("Not a valid list type");
                        }
                        i11 = 2131624223;
                    }
                    fVar.B = new b(this, i11);
                }
            }
            EditText editText = (EditText) this.f49060a.findViewById(16908297);
            this.f49068i = editText;
            if (editText != null) {
                c(editText, fVar.f49058y);
                EditText editText2 = this.f49068i;
                if (editText2 != null) {
                    editText2.addTextChangedListener(new e(this, 0));
                }
                this.f49068i.setHint((CharSequence) null);
                this.f49068i.setSingleLine();
                this.f49068i.setTextColor(fVar.f49040e);
                this.f49068i.setHintTextColor(c0.s(0.3f, fVar.f49040e));
                e0.e0(this.f49068i, fVar.f49047l);
                TextView textView5 = (TextView) this.f49060a.findViewById(2131428361);
                this.f49069j = textView5;
                textView5.setVisibility(8);
                this.f49069j = null;
            }
            if (fVar.f49046k != null) {
                ((MDRootLayout) this.f49060a.findViewById(2131428712)).f20169j = true;
                FrameLayout frameLayout = (FrameLayout) this.f49060a.findViewById(2131427802);
                View view = fVar.f49046k;
                if (view.getParent() != null) {
                    ((ViewGroup) view.getParent()).removeView(view);
                }
                if (fVar.D) {
                    Resources resources = getContext().getResources();
                    int dimensionPixelSize2 = resources.getDimensionPixelSize(2131166035);
                    ScrollView scrollView = new ScrollView(getContext());
                    int dimensionPixelSize3 = resources.getDimensionPixelSize(2131166033);
                    int dimensionPixelSize4 = resources.getDimensionPixelSize(2131166032);
                    scrollView.setClipToPadding(false);
                    if (view instanceof EditText) {
                        scrollView.setPadding(dimensionPixelSize2, dimensionPixelSize3, dimensionPixelSize2, dimensionPixelSize4);
                    } else {
                        scrollView.setPadding(0, dimensionPixelSize3, 0, dimensionPixelSize4);
                        view.setPadding(dimensionPixelSize2, 0, dimensionPixelSize2, 0);
                    }
                    scrollView.addView(view, new FrameLayout.LayoutParams(-1, -2));
                    view = scrollView;
                }
                frameLayout.addView(view, new ViewGroup.LayoutParams(-1, -2));
            }
            DialogInterface.OnDismissListener onDismissListener = fVar.C;
            if (onDismissListener != null) {
                setOnDismissListener(onDismissListener);
            }
            super.setOnShowListener(this);
            ListView listView2 = this.f49063d;
            if (listView2 != null && (((charSequenceArr = fVar.f49042g) != null && charSequenceArr.length != 0) || fVar.B != null)) {
                listView2.setAdapter((ListAdapter) fVar.B);
                if (this.n != 0 || fVar.f49056w != null) {
                    this.f49063d.setOnItemClickListener(this);
                }
            }
            super.setContentView(this.f49060a);
            ListView listView3 = this.f49063d;
            if (listView3 == null) {
                return;
            }
            listView3.getViewTreeObserver().addOnGlobalLayoutListener(new d(this, 0));
        } catch (Throwable th2) {
            typedArrayObtainStyledAttributes.recycle();
            throw th2;
        }
    }

    public static void c(TextView textView, Typeface typeface) {
        if (typeface == null) {
            return;
        }
        textView.setPaintFlags(textView.getPaintFlags() | 128);
        textView.setTypeface(typeface);
    }

    public final Drawable a(c cVar, boolean z11) {
        f fVar = this.f49062c;
        if (z11) {
            fVar.getClass();
            Drawable drawableV = c0.V(fVar.f49036a, 2130969642);
            return drawableV != null ? drawableV : c0.V(getContext(), 2130969642);
        }
        int iOrdinal = cVar.ordinal();
        if (iOrdinal == 1) {
            fVar.getClass();
            Drawable drawableV2 = c0.V(fVar.f49036a, 2130969639);
            if (drawableV2 != null) {
                return drawableV2;
            }
            Drawable drawableV3 = c0.V(getContext(), 2130969639);
            int i5 = fVar.f49038c;
            if (drawableV3 instanceof RippleDrawable) {
                ((RippleDrawable) drawableV3).setColor(ColorStateList.valueOf(i5));
            }
            return drawableV3;
        }
        if (iOrdinal != 2) {
            fVar.getClass();
            Drawable drawableV4 = c0.V(fVar.f49036a, 2130969640);
            if (drawableV4 != null) {
                return drawableV4;
            }
            Drawable drawableV5 = c0.V(getContext(), 2130969640);
            int i11 = fVar.f49038c;
            if (drawableV5 instanceof RippleDrawable) {
                ((RippleDrawable) drawableV5).setColor(ColorStateList.valueOf(i11));
            }
            return drawableV5;
        }
        fVar.getClass();
        Drawable drawableV6 = c0.V(fVar.f49036a, 2130969638);
        if (drawableV6 != null) {
            return drawableV6;
        }
        Drawable drawableV7 = c0.V(getContext(), 2130969638);
        int i12 = fVar.f49038c;
        if (drawableV7 instanceof RippleDrawable) {
            ((RippleDrawable) drawableV7).setColor(ColorStateList.valueOf(i12));
        }
        return drawableV7;
    }

    public final void b(DialogInterface dialogInterface) {
        DialogInterface.OnShowListener onShowListener = this.f49061b;
        if (onShowListener != null) {
            onShowListener.onShow(dialogInterface);
        }
    }

    @Override // android.app.Dialog, android.content.DialogInterface
    public final void dismiss() {
        InputMethodManager inputMethodManager;
        EditText editText = this.f49068i;
        if (editText != null && editText != null && (inputMethodManager = (InputMethodManager) this.f49062c.f49036a.getSystemService("input_method")) != null) {
            View currentFocus = getCurrentFocus();
            if (currentFocus == null) {
                currentFocus = this.f49060a;
            }
            IBinder windowToken = currentFocus.getWindowToken();
            if (windowToken != null) {
                inputMethodManager.hideSoftInputFromWindow(windowToken, 0);
            }
        }
        super.dismiss();
    }

    @Override // android.app.Dialog
    public final View findViewById(int i5) {
        return this.f49060a.findViewById(i5);
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        c cVar = (c) view.getTag();
        int iOrdinal = cVar.ordinal();
        f fVar = this.f49062c;
        if (iOrdinal == 0) {
            a.a aVar = fVar.f49050q;
            if (aVar != null) {
                aVar.X(this);
            }
            i iVar = fVar.f49051r;
            if (iVar != null) {
                iVar.d(cVar);
            }
            fVar.getClass();
            fVar.getClass();
            dismiss();
        } else if (iOrdinal == 1) {
            a.a aVar2 = fVar.f49050q;
            if (aVar2 != null) {
                aVar2.W(this);
            }
            i iVar2 = fVar.f49053t;
            if (iVar2 != null) {
                iVar2.d(cVar);
            }
            dismiss();
        } else if (iOrdinal == 2) {
            a.a aVar3 = fVar.f49050q;
            if (aVar3 != null) {
                aVar3.V(this);
            }
            i iVar3 = fVar.f49052s;
            if (iVar3 != null) {
                iVar3.d(cVar);
            }
            cancel();
        }
        ae.i iVar4 = fVar.f49054u;
        if (iVar4 != null) {
            iVar4.d(cVar);
        }
    }

    @Override // android.widget.AdapterView.OnItemClickListener
    public final void onItemClick(AdapterView adapterView, View view, int i5, long j11) {
        if (view.isEnabled()) {
            f fVar = this.f49062c;
            if (fVar.f49056w != null) {
                if (view instanceof TextView) {
                    ((TextView) view).getText();
                } else {
                    TextView textView = (TextView) view.findViewById(16908310);
                    if (textView != null) {
                        textView.getText();
                    }
                }
                fVar.f49056w.j(this, i5);
                return;
            }
            int i11 = this.n;
            if (i11 == 0 || i11 == 1) {
                dismiss();
                g gVar = fVar.f49055v;
                if (gVar != null) {
                    CharSequence charSequence = fVar.f49042g[i5];
                    gVar.j(this, i5);
                    return;
                }
                return;
            }
            if (i11 == 3) {
                if (((CheckBox) view.findViewById(2131427763)).isEnabled()) {
                    throw null;
                }
                return;
            }
            if (i11 == 2) {
                RadioButton radioButton = (RadioButton) view.findViewById(2131427763);
                if (radioButton.isEnabled()) {
                    b bVar = (b) fVar.B;
                    if (fVar.f49043h == null) {
                        dismiss();
                        fVar.f49057x = i5;
                        fVar.getClass();
                    } else {
                        fVar.f49057x = i5;
                        radioButton.setChecked(true);
                        bVar.notifyDataSetChanged();
                    }
                }
            }
        }
    }

    @Override // android.content.DialogInterface.OnShowListener
    public final void onShow(DialogInterface dialogInterface) {
        EditText editText = this.f49068i;
        if (editText != null) {
            f fVar = this.f49062c;
            editText.post(new z(this, fVar, false, 19));
            if (this.f49068i.getText().length() > 0) {
                EditText editText2 = this.f49068i;
                editText2.setSelection(editText2.getText().length());
            }
        }
        b(dialogInterface);
    }

    @Override // android.app.Dialog
    public final void setContentView(int i5) {
        throw new IllegalAccessError("setContentView() is not supported in MaterialDialog. Specify a custom view in the Builder instead.");
    }

    @Override // android.app.Dialog
    public final void setOnShowListener(DialogInterface.OnShowListener onShowListener) {
        this.f49061b = onShowListener;
    }

    @Override // android.app.Dialog
    public final void setTitle(CharSequence charSequence) {
        this.f49065f.setText(charSequence);
    }

    @Override // android.app.Dialog
    public final void show() {
        try {
            super.show();
        } catch (WindowManager.BadTokenException unused) {
            throw new MaterialDialog$DialogException("Bad window token, you cannot show a dialog before an Activity is created or after it's hidden.");
        }
    }

    @Override // android.app.Dialog
    public final void setContentView(View view) {
        throw new IllegalAccessError("setContentView() is not supported in MaterialDialog. Specify a custom view in the Builder instead.");
    }

    @Override // android.app.Dialog
    public final void setTitle(int i5) {
        setTitle(this.f49062c.f49036a.getString(i5));
    }

    @Override // android.app.Dialog
    public final void setContentView(View view, ViewGroup.LayoutParams layoutParams) {
        throw new IllegalAccessError("setContentView() is not supported in MaterialDialog. Specify a custom view in the Builder instead.");
    }
}
