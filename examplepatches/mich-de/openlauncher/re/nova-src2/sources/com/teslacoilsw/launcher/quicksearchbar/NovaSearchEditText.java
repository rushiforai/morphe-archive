package com.teslacoilsw.launcher.quicksearchbar;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.text.Editable;
import android.text.SpannableString;
import android.text.SpannableStringBuilder;
import android.text.style.ForegroundColorSpan;
import android.util.AttributeSet;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;
import b.c0;
import b00.t;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import jz.f;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import l10.o;
import l10.w;
import org.jetbrains.annotations.NotNull;
import r4.a;
import r70.k;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u00012\u00020\u0002B\u0017\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\b¨\u0006\t"}, d2 = {"Lcom/teslacoilsw/launcher/quicksearchbar/NovaSearchEditText;", "Landroid/widget/FrameLayout;", "Ll10/o;", "Landroid/content/Context;", "context", "Landroid/util/AttributeSet;", "attrs", "<init>", "(Landroid/content/Context;Landroid/util/AttributeSet;)V", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class NovaSearchEditText extends FrameLayout implements o {

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ int f46155f = 0;

    /* renamed from: a, reason: collision with root package name */
    public ImageView f46156a;

    /* renamed from: b, reason: collision with root package name */
    public EditText f46157b;

    /* renamed from: c, reason: collision with root package name */
    public TextView f46158c;

    /* renamed from: d, reason: collision with root package name */
    public CharSequence f46159d;

    /* renamed from: e, reason: collision with root package name */
    public t f46160e;

    public NovaSearchEditText(@NotNull Context context, @NotNull AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    @Override // l10.o
    public final void a(w wVar, int i5) {
        c(wVar.f74464a.f74458e.f90179b);
    }

    public final EditText b() {
        EditText editText = this.f46157b;
        if (editText != null) {
            return editText;
        }
        Intrinsics.m("editText");
        throw null;
    }

    public final void c(int i5) {
        Drawable textCursorDrawable;
        if (Build.VERSION.SDK_INT >= 29 && (textCursorDrawable = b().getTextCursorDrawable()) != null) {
            textCursorDrawable.setTint(i5);
        }
        ImageView imageView = this.f46156a;
        if (imageView == null) {
            Intrinsics.m("clearIcon");
            throw null;
        }
        imageView.setImageTintList(ColorStateList.valueOf(i5));
        b().setTextColor(i5);
        b().setHintTextColor(a.n(i5, 128));
        TextView textView = this.f46158c;
        if (textView != null) {
            textView.setTextColor(a.n(i5, 128));
        } else {
            Intrinsics.m("suggestedSearchResultText");
            throw null;
        }
    }

    public final void d(boolean z11) {
        TextView textView = this.f46158c;
        if (textView != null) {
            textView.setVisibility(z11 ? 0 : 8);
        } else {
            Intrinsics.m("suggestedSearchResultText");
            throw null;
        }
    }

    public final void e(CharSequence charSequence) {
        String string;
        this.f46159d = charSequence;
        Editable text = b().getText();
        if (text == null || (string = text.toString()) == null) {
            string = b.f42142b;
        }
        if (k.U0(string) || k.U0(charSequence)) {
            TextView textView = this.f46158c;
            if (textView != null) {
                textView.setText(b.f42142b);
                return;
            } else {
                Intrinsics.m("suggestedSearchResultText");
                throw null;
            }
        }
        SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder();
        SpannableString spannableString = new SpannableString(string);
        spannableString.setSpan(new ForegroundColorSpan(0), 0, string.length() - 1, 33);
        spannableStringBuilder.append((CharSequence) spannableString);
        if (!k.j1(charSequence, string, true)) {
            spannableStringBuilder.append((CharSequence) " - ");
            spannableStringBuilder.append(charSequence);
            TextView textView2 = this.f46158c;
            if (textView2 != null) {
                textView2.setText(SpannableString.valueOf(spannableStringBuilder));
                return;
            } else {
                Intrinsics.m("suggestedSearchResultText");
                throw null;
            }
        }
        int length = string.length();
        if (length < 0) {
            throw new IllegalArgumentException(c0.i(length, "Requested character count ", " is less than zero.").toString());
        }
        int length2 = charSequence.length();
        if (length > length2) {
            length = length2;
        }
        spannableStringBuilder.append(charSequence.subSequence(length, charSequence.length()));
        TextView textView3 = this.f46158c;
        if (textView3 != null) {
            textView3.setText(SpannableString.valueOf(spannableStringBuilder));
        } else {
            Intrinsics.m("suggestedSearchResultText");
            throw null;
        }
    }

    @Override // android.view.View
    public final void onFinishInflate() {
        super.onFinishInflate();
        this.f46156a = (ImageView) findViewById(2131427680);
        this.f46157b = (EditText) findViewById(2131427941);
        this.f46158c = (TextView) findViewById(2131428941);
        b().addTextChangedListener(new f(this, 1));
        ImageView imageView = this.f46156a;
        if (imageView != null) {
            imageView.setOnClickListener(new l10.f(this, 1));
        } else {
            Intrinsics.m("clearIcon");
            throw null;
        }
    }
}
