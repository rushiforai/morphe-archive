package fk;

import android.text.Editable;
import android.view.View;
import android.widget.AutoCompleteTextView;
import com.stripe.android.core.model.Country;
import com.stripe.android.core.model.CountryCode;
import com.stripe.android.view.CardNumberEditText;
import com.stripe.android.view.CountryTextInputLayout;
import com.stripe.android.view.CvcEditText;
import com.stripe.android.view.ExpiryDateEditText;
import com.stripe.android.view.StripeEditText;
import java.util.Iterator;
import java.util.Locale;
import java.util.Set;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KProperty;

/* loaded from: classes3.dex */
public final /* synthetic */ class a implements View.OnFocusChangeListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f55165a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f55166b;

    public /* synthetic */ a(Object obj, int i5) {
        this.f55165a = i5;
        this.f55166b = obj;
    }

    @Override // android.view.View.OnFocusChangeListener
    public final void onFocusChange(View view, boolean z11) {
        Object next;
        Editable text;
        int i5 = this.f55165a;
        Object obj = this.f55166b;
        switch (i5) {
            case 0:
                d dVar = (d) obj;
                dVar.s(dVar.t());
                break;
            case 1:
                i iVar = (i) obj;
                iVar.f55192l = z11;
                iVar.p();
                if (!z11) {
                    iVar.s(false);
                    iVar.f55193m = false;
                    break;
                }
                break;
            case 2:
                CardNumberEditText cardNumberEditText = (CardNumberEditText) obj;
                int i11 = CardNumberEditText.L;
                if (!z11) {
                    hq.f fVarI = cardNumberEditText.i();
                    int iH = cardNumberEditText.h();
                    String str = fVarI.f59964d;
                    if (str.length() != iH && !r70.k.U0(str)) {
                        cardNumberEditText.f(true);
                        break;
                    }
                }
                break;
            case 3:
                CountryTextInputLayout countryTextInputLayout = (CountryTextInputLayout) obj;
                AutoCompleteTextView autoCompleteTextView = countryTextInputLayout.D0;
                if (z11) {
                    autoCompleteTextView.showDropDown();
                    break;
                } else {
                    String countryName = autoCompleteTextView.getText().toString();
                    Set set = cr.e.f47799a;
                    Locale localeG = CountryTextInputLayout.G();
                    Intrinsics.g(countryName, "countryName");
                    Iterator it = cr.e.b(localeG).iterator();
                    while (true) {
                        if (it.hasNext()) {
                            next = it.next();
                            if (Intrinsics.b(((Country) next).f42573b, countryName)) {
                            }
                        } else {
                            next = null;
                        }
                    }
                    Country country = (Country) next;
                    CountryCode countryCode = country != null ? country.f42572a : null;
                    if (countryCode != null) {
                        countryTextInputLayout.H(countryCode);
                        break;
                    } else {
                        Set set2 = cr.e.f47799a;
                        CountryCode.Companion.getClass();
                        if (cr.e.a(cr.d.a(countryName), CountryTextInputLayout.G()) != null) {
                            countryTextInputLayout.H(cr.d.a(countryName));
                            break;
                        }
                    }
                }
                break;
            case 4:
                CvcEditText cvcEditText = (CvcEditText) obj;
                int i12 = CvcEditText.f45474x;
                if (!z11) {
                    String strD = cvcEditText.d();
                    StringBuilder sb2 = new StringBuilder();
                    int length = strD.length();
                    for (int i13 = 0; i13 < length; i13++) {
                        char cCharAt = strD.charAt(i13);
                        if (Character.isDigit(cCharAt)) {
                            sb2.append(cCharAt);
                        }
                    }
                    String string = sb2.toString();
                    int iA = cvcEditText.f45475v.a();
                    if (!r70.k.U0(string) && !kotlin.collections.c.f1(new Integer[]{3, Integer.valueOf(iA)}).contains(Integer.valueOf(string.length()))) {
                        cvcEditText.f(true);
                        break;
                    }
                }
                break;
            case 5:
                ExpiryDateEditText expiryDateEditText = (ExpiryDateEditText) obj;
                KProperty[] kPropertyArr = ExpiryDateEditText.f45477z;
                if (!z11 && (text = expiryDateEditText.getText()) != null && text.length() != 0 && !expiryDateEditText.f45479w) {
                    expiryDateEditText.f(true);
                    break;
                }
                break;
            default:
                StripeEditText stripeEditText = (StripeEditText) obj;
                Iterator it2 = stripeEditText.f45513s.iterator();
                while (it2.hasNext()) {
                    ((View.OnFocusChangeListener) it2.next()).onFocusChange(view, z11);
                }
                View.OnFocusChangeListener onFocusChangeListener = stripeEditText.f45514t;
                if (onFocusChangeListener != null) {
                    onFocusChangeListener.onFocusChange(view, z11);
                    break;
                }
                break;
        }
    }
}
