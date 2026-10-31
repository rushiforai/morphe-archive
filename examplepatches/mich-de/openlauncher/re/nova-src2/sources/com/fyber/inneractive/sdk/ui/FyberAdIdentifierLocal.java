package com.fyber.inneractive.sdk.ui;

import android.animation.Animator;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.content.res.ColorStateList;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.text.TextUtils;
import android.util.Property;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.fyber.inneractive.sdk.R;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.config.global.r;
import com.fyber.inneractive.sdk.network.w0;
import com.fyber.inneractive.sdk.ui.IFyberAdIdentifier;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.o;

/* loaded from: classes3.dex */
public class FyberAdIdentifierLocal extends IFyberAdIdentifier implements View.OnClickListener {

    /* renamed from: m, reason: collision with root package name */
    public ImageView f31129m;
    public TextView n;
    public boolean o;

    /* renamed from: p, reason: collision with root package name */
    public Animator f31130p;

    /* renamed from: q, reason: collision with root package name */
    public float f31131q;

    /* renamed from: r, reason: collision with root package name */
    public Bitmap f31132r;

    public FyberAdIdentifierLocal(r rVar) {
        super(rVar);
        this.o = false;
        this.f31131q = 0.0f;
    }

    @Override // com.fyber.inneractive.sdk.ui.IFyberAdIdentifier
    public final void a(ViewGroup viewGroup) {
        LayoutInflater layoutInflaterFrom = LayoutInflater.from(viewGroup.getContext());
        ViewGroup viewGroup2 = (ViewGroup) viewGroup.findViewById(R.id.ia_identifier_overlay);
        int i5 = 0;
        ViewGroup viewGroup3 = (ViewGroup) layoutInflaterFrom.inflate(R.layout.ia_layout_fyber_ad_identifier, viewGroup2, false);
        this.f31129m = (ImageView) viewGroup3.findViewById(R.id.ia_fyber_identifier_image);
        TextView textView = (TextView) viewGroup3.findViewById(R.id.ia_fyber_identifier_text);
        this.n = textView;
        if (this.f31148j) {
            int i11 = this.f31140b;
            int i12 = this.f31141c;
            if (textView != null && textView.getLayoutParams() != null) {
                textView.getLayoutParams().width = o.b(i11);
                textView.getLayoutParams().height = o.b(i12);
            }
            ImageView imageView = this.f31129m;
            int i13 = this.f31142d;
            int i14 = this.f31143e;
            if (imageView != null && imageView.getLayoutParams() != null) {
                imageView.getLayoutParams().width = o.b(i13);
                imageView.getLayoutParams().height = o.b(i14);
            }
            TextView textView2 = this.n;
            int i15 = this.f31144f;
            if (textView2 != null) {
                textView2.setTextSize(i15);
            }
            a(this.f31129m, this.f31145g);
            this.n.setOnClickListener(this);
            this.n.setText(this.f31146h);
            String str = this.f31147i;
            if (!TextUtils.isEmpty(str)) {
                IAConfigManager.Q.f27759s.a(new w0(new a(this), viewGroup2.getContext(), new com.fyber.inneractive.sdk.cache.c(str)));
            }
        }
        IFyberAdIdentifier.Corner corner = this.f31149k;
        if (corner == IFyberAdIdentifier.Corner.TOP_LEFT || corner == IFyberAdIdentifier.Corner.BOTTOM_LEFT) {
            viewGroup3.removeView(this.n);
            viewGroup3.addView(this.n);
            viewGroup3.setLayoutDirection(0);
        }
        viewGroup3.addOnLayoutChangeListener(new b(this));
        this.f31129m.setOnClickListener(this);
        a();
        viewGroup2.addView(viewGroup3);
        IFyberAdIdentifier.Corner corner2 = this.f31149k;
        corner2.getClass();
        int i16 = i.f31162a[corner2.ordinal()];
        if (i16 == 1) {
            i5 = 51;
        } else if (i16 == 2) {
            i5 = 53;
        } else if (i16 == 3) {
            i5 = 83;
        } else if (i16 == 4) {
            i5 = 85;
        }
        o.a(viewGroup3, i5);
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        if (view != this.f31129m) {
            if (view == this.n && this.f31150l == com.fyber.inneractive.sdk.config.global.features.a.OPEN) {
                a();
                IFyberAdIdentifier.ClickListener clickListener = this.f31139a;
                if (clickListener != null) {
                    clickListener.a();
                    return;
                }
                return;
            }
            return;
        }
        if (this.f31130p != null) {
            return;
        }
        AnimatorSet animatorSet = new AnimatorSet();
        ImageView imageView = this.f31129m;
        Property property = View.ROTATION_X;
        ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(imageView, (Property<ImageView, Float>) property, 90.0f);
        ObjectAnimator objectAnimatorOfInt = ObjectAnimator.ofInt(this.f31129m, "imageAlpha", 255, 25);
        AnimatorSet animatorSet2 = new AnimatorSet();
        animatorSet2.playTogether(objectAnimatorOfFloat, objectAnimatorOfInt);
        animatorSet2.addListener(new c(this, animatorSet));
        animatorSet2.setDuration(225L);
        this.f31130p = animatorSet2;
        animatorSet2.start();
        ObjectAnimator objectAnimatorOfFloat2 = ObjectAnimator.ofFloat(this.f31129m, (Property<ImageView, Float>) property, 0.0f);
        ObjectAnimator objectAnimatorOfInt2 = ObjectAnimator.ofInt(this.f31129m, "imageAlpha", 25, 255);
        AnimatorSet animatorSet3 = new AnimatorSet();
        animatorSet3.playTogether(objectAnimatorOfFloat2, objectAnimatorOfInt2);
        animatorSet3.setDuration(225L);
        ObjectAnimator objectAnimatorOfFloat3 = ObjectAnimator.ofFloat(this.n, (Property<TextView, Float>) View.TRANSLATION_X, this.o ? this.f31131q : 0.0f);
        objectAnimatorOfFloat3.setDuration(450L);
        animatorSet.setDuration(450L);
        animatorSet.playTogether(objectAnimatorOfFloat3, animatorSet3);
        animatorSet.addListener(new d(this));
    }

    public final void a() {
        this.o = false;
        this.f31129m.setImageResource(R.drawable.ia_fyber_info_button);
        a(this.f31129m, this.f31145g);
        Animator animator = this.f31130p;
        if (animator != null) {
            animator.removeAllListeners();
            this.f31130p = null;
        }
    }

    public static void a(ImageView imageView, String str) {
        if (!TextUtils.isEmpty(str)) {
            try {
                imageView.setImageTintList(ColorStateList.valueOf(Color.parseColor(str)));
                return;
            } catch (Exception unused) {
                IAlog.f("could not parse color %s", str);
                return;
            }
        }
        imageView.setImageTintList(null);
    }
}
