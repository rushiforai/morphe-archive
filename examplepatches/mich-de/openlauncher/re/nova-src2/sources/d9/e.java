package d9;

import android.text.Editable;
import android.text.TextWatcher;
import android.view.KeyEvent;
import com.google.android.gms.internal.consent_sdk.e0;
import com.stripe.android.view.BecsDebitAccountNumberEditText;
import com.stripe.android.view.CardBrandView;
import com.stripe.android.view.CardMultilineWidget;
import com.stripe.android.view.CardNumberEditText;
import com.stripe.android.view.CvcEditText;
import com.stripe.android.view.PostalCodeEditText;
import com.stripe.android.view.StripeEditText;
import com.teslacoilsw.launcher.search.AppSearchFloatingView;
import com.teslacoilsw.launcher.widget.AlphaOptimizedImageView;
import kotlin.Unit;
import kotlin.reflect.KProperty;
import ww.m;
import ww.m0;
import ww.s;

/* loaded from: classes2.dex */
public final class e implements TextWatcher {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f49034a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ KeyEvent.Callback f49035b;

    public /* synthetic */ e(KeyEvent.Callback callback, int i5) {
        this.f49034a = i5;
        this.f49035b = callback;
    }

    private final void a(Editable editable) {
    }

    private final void b(int i5, int i11, int i12, CharSequence charSequence) {
    }

    private final void c(int i5, int i11, int i12, CharSequence charSequence) {
    }

    private final void d(int i5, int i11, int i12, CharSequence charSequence) {
    }

    private final void e(int i5, int i11, int i12, CharSequence charSequence) {
    }

    private final void f(int i5, int i11, int i12, CharSequence charSequence) {
    }

    private final void g(int i5, int i11, int i12, CharSequence charSequence) {
    }

    private final void h(int i5, int i11, int i12, CharSequence charSequence) {
    }

    private final void i(int i5, int i11, int i12, CharSequence charSequence) {
    }

    private final void j(int i5, int i11, int i12, CharSequence charSequence) {
    }

    private final void k(int i5, int i11, int i12, CharSequence charSequence) {
    }

    private final void l(int i5, int i11, int i12, CharSequence charSequence) {
    }

    @Override // android.text.TextWatcher
    public final void afterTextChanged(Editable editable) {
        int i5 = this.f49034a;
        int i11 = 1;
        KeyEvent.Callback callback = this.f49035b;
        switch (i5) {
            case 0:
                break;
            case 1:
                AppSearchFloatingView appSearchFloatingView = (AppSearchFloatingView) callback;
                ((v9.e) appSearchFloatingView.V().f92298c).f92317a.L(String.valueOf(editable), false);
                AlphaOptimizedImageView alphaOptimizedImageView = (AlphaOptimizedImageView) appSearchFloatingView.V().f92302g;
                if (editable != null && editable.length() != 0) {
                    i11 = 0;
                }
                alphaOptimizedImageView.setVisibility(i11 == 0 ? 8 : 0);
                break;
            case 2:
                ((BecsDebitAccountNumberEditText) callback).f(false);
                break;
            case 3:
                CvcEditText cvcEditText = (CvcEditText) callback;
                cvcEditText.f(false);
                ft.b bVar = cvcEditText.f45475v;
                String strD = cvcEditText.d();
                StringBuilder sb2 = new StringBuilder();
                int length = strD.length();
                while (i < length) {
                    char cCharAt = strD.charAt(i);
                    if (Character.isDigit(cCharAt)) {
                        sb2.append(cCharAt);
                    }
                    i++;
                }
                if (bVar.c(sb2.toString())) {
                    cvcEditText.f45476w.getClass();
                    int i12 = CvcEditText.f45474x;
                    Unit unit = Unit.f71706a;
                    break;
                }
                break;
            case 4:
                ((PostalCodeEditText) callback).f(false);
                break;
            default:
                m mVar = ((StripeEditText) callback).f45506j;
                if (mVar != null) {
                    String string = editable != null ? editable.toString() : null;
                    if (string == null) {
                        string = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                    }
                    switch (mVar.f94811a) {
                        case 0:
                            CardMultilineWidget cardMultilineWidget = mVar.f94812b;
                            CvcEditText cvcEditText2 = cardMultilineWidget.f45451e;
                            KProperty[] kPropertyArr = CardMultilineWidget.f45446u;
                            CardNumberEditText cardNumberEditText = cardMultilineWidget.f45448b;
                            ft.b bVar2 = cardNumberEditText.B;
                            ft.b bVar3 = bVar2 != ft.b.f55894x ? bVar2 : null;
                            if (bVar3 == null) {
                                bVar3 = cardNumberEditText.f45469z;
                            }
                            if (bVar3.c(string)) {
                                cardMultilineWidget.a();
                                if (cardMultilineWidget.f45447a) {
                                    cardMultilineWidget.post(new ww.j(i11, cardMultilineWidget));
                                }
                            } else {
                                CardBrandView cardBrandView = cardMultilineWidget.f45449c;
                                if (!cardBrandView.c().f45440c.c(cvcEditText2.d())) {
                                    cardBrandView.f();
                                }
                            }
                            cvcEditText2.f(false);
                            break;
                        default:
                            CardMultilineWidget cardMultilineWidget2 = mVar.f94812b;
                            KProperty[] kPropertyArr2 = CardMultilineWidget.f45446u;
                            if ((cardMultilineWidget2.n || ((Boolean) cardMultilineWidget2.o.getValue(cardMultilineWidget2, CardMultilineWidget.f45446u[0])).booleanValue()) && cardMultilineWidget2.f45447a) {
                                PostalCodeEditText postalCodeEditText = cardMultilineWidget2.f45452f;
                                s sVar = postalCodeEditText.f45493v;
                                KProperty[] kPropertyArr3 = PostalCodeEditText.f45491w;
                                if ((((m0) sVar.getValue(postalCodeEditText, kPropertyArr3[0])) != m0.f94814b || !PostalCodeEditText.f45492x.matcher(postalCodeEditText.d()).matches()) && ((m0) postalCodeEditText.f45493v.getValue(postalCodeEditText, kPropertyArr3[0])) == m0.f94813a) {
                                    postalCodeEditText.d();
                                    break;
                                }
                            }
                            break;
                    }
                }
                break;
        }
    }

    @Override // android.text.TextWatcher
    public final void beforeTextChanged(CharSequence charSequence, int i5, int i11, int i12) {
        int i13 = this.f49034a;
    }

    @Override // android.text.TextWatcher
    public final void onTextChanged(CharSequence charSequence, int i5, int i11, int i12) throws IllegalAccessException, NoSuchFieldException, SecurityException, IllegalArgumentException {
        switch (this.f49034a) {
            case 0:
                int length = charSequence.toString().length();
                j jVar = (j) this.f49035b;
                f fVar = jVar.f49062c;
                fVar.getClass();
                boolean z11 = length == 0;
                jVar.f49070k.setEnabled(!z11);
                if (jVar.f49069j != null) {
                    fVar.getClass();
                    jVar.f49069j.setVisibility(8);
                    boolean z12 = (z11 && length == 0) || length < -1;
                    e0.e0(jVar.f49068i, z12 ? 0 : fVar.f49047l);
                    jVar.f49070k.setEnabled(!z12);
                }
                fVar.getClass();
                break;
        }
    }
}
