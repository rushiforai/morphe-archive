package v;

import android.os.Build;
import android.util.Log;
import androidx.biometric.BiometricFragment;
import h6.m0;
import h6.n0;

/* loaded from: classes2.dex */
public final class a implements n0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f91811a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ BiometricFragment f91812b;

    public /* synthetic */ a(BiometricFragment biometricFragment, int i5) {
        this.f91811a = i5;
        this.f91812b = biometricFragment;
    }

    @Override // h6.n0
    public final void onChanged(Object obj) {
        switch (this.f91811a) {
            case 0:
                break;
            case 1:
                CharSequence charSequence = (CharSequence) obj;
                if (charSequence != null) {
                    BiometricFragment biometricFragment = this.f91812b;
                    if (biometricFragment.o()) {
                        biometricFragment.f13840b.f(2);
                        biometricFragment.f13840b.e(charSequence);
                    }
                    d dVar = biometricFragment.f13840b;
                    if (dVar.f91816d == null) {
                        dVar.f91816d = new m0();
                    }
                    d.g(dVar.f91816d, null);
                    break;
                }
                break;
            case 2:
                if (((Boolean) obj).booleanValue()) {
                    BiometricFragment biometricFragment2 = this.f91812b;
                    if (biometricFragment2.o()) {
                        String string = biometricFragment2.getString(2132017882);
                        if (string == null) {
                            string = biometricFragment2.getString(2132017715);
                        }
                        biometricFragment2.f13840b.f(2);
                        biometricFragment2.f13840b.e(string);
                    }
                    biometricFragment2.f13840b.getClass();
                    Log.w("BiometricFragment", "Failure not sent to client. Client is not awaiting a result.");
                    d dVar2 = biometricFragment2.f13840b;
                    if (dVar2.f91818f == null) {
                        dVar2.f91818f = new m0();
                    }
                    d.g(dVar2.f91818f, Boolean.FALSE);
                    break;
                }
                break;
            case 3:
                if (((Boolean) obj).booleanValue()) {
                    int i5 = Build.VERSION.SDK_INT;
                    BiometricFragment biometricFragment3 = this.f91812b;
                    if (i5 <= 28) {
                        biometricFragment3.f13840b.getClass();
                    }
                    biometricFragment3.f13840b.getClass();
                    biometricFragment3.p(13, biometricFragment3.getString(2132017715));
                    biometricFragment3.dismiss();
                    biometricFragment3.n(2);
                    d dVar3 = biometricFragment3.f13840b;
                    if (dVar3.f91819g == null) {
                        dVar3.f91819g = new m0();
                    }
                    d.g(dVar3.f91819g, Boolean.FALSE);
                    break;
                }
                break;
            default:
                if (((Boolean) obj).booleanValue()) {
                    BiometricFragment biometricFragment4 = this.f91812b;
                    biometricFragment4.n(1);
                    biometricFragment4.dismiss();
                    d dVar4 = biometricFragment4.f13840b;
                    if (dVar4.f91820h == null) {
                        dVar4.f91820h = new m0();
                    }
                    d.g(dVar4.f91820h, Boolean.FALSE);
                    break;
                }
                break;
        }
    }
}
