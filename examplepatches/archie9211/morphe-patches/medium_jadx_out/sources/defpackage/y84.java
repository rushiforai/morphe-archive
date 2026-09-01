package defpackage;

import android.app.Dialog;
import android.content.Intent;
import android.content.res.Configuration;
import android.os.Bundle;
import androidx.fragment.app.strictmode.GetRetainInstanceUsageViolation;
import com.facebook.FacebookException;
import com.medium.android.data.catalog.KnyB.uvlZTF;
import java.util.Arrays;
import java.util.Date;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Ly84;", "Lfb3;", "<init>", "()V", "facebook-common_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
public final class y84 extends fb3 {
    public n1f C0;

    @Override // defpackage.fb3, defpackage.j15
    public final void D() {
        Dialog dialog = this.x0;
        if (dialog != null) {
            t25 t25Var = u25.a;
            u25.b(new GetRetainInstanceUsageViolation(this, "Attempting to get retain instance for fragment " + this));
            u25.a(this).getClass();
            if (this.B) {
                dialog.setDismissMessage(null);
            }
        }
        super.D();
    }

    @Override // defpackage.j15
    public final void I() {
        this.E = true;
        n1f n1fVar = this.C0;
        if (y30.C(n1fVar)) {
            n1fVar.d();
        }
    }

    @Override // defpackage.fb3
    public final Dialog a0(Bundle bundle) {
        n1f n1fVar = this.C0;
        if (n1fVar != null) {
            return n1fVar;
        }
        m15 m15VarG = g();
        if (m15VarG != null) {
            Intent intent = m15VarG.getIntent();
            intent.getClass();
            m15VarG.setResult(-1, x98.e(intent, null, null));
            m15VarG.finish();
        }
        this.t0 = false;
        return super.a0(bundle);
    }

    @Override // defpackage.j15, android.content.ComponentCallbacks
    public final void onConfigurationChanged(Configuration configuration) {
        configuration.getClass();
        this.E = true;
        n1f n1fVar = this.C0;
        if (!y30.C(n1fVar) || this.a < 7) {
            return;
        }
        n1fVar.d();
    }

    @Override // defpackage.fb3, defpackage.j15
    public final void A(Bundle bundle) {
        m15 m15VarG;
        boolean z;
        n1f h94Var;
        String string;
        Bundle bundle2;
        super.A(bundle);
        if (this.C0 != null || (m15VarG = g()) == null) {
            return;
        }
        Intent intent = m15VarG.getIntent();
        intent.getClass();
        Bundle bundleI = x98.i(intent);
        final int i = 0;
        if (bundleI != null) {
            z = bundleI.getBoolean("is_fallback", false);
        } else {
            z = false;
        }
        String string2 = null;
        if (!z) {
            if (bundleI != null) {
                string = bundleI.getString("action");
            } else {
                string = null;
            }
            if (bundleI != null) {
                bundle2 = bundleI.getBundle(uvlZTF.PrWtZ);
            } else {
                bundle2 = null;
            }
            if (epe.J(string)) {
                f94 f94Var = f94.a;
                m15VarG.finish();
                return;
            }
            string.getClass();
            Date date = w3.l;
            w3 w3VarR = wgf.r();
            if (!wgf.B()) {
                string2 = f94.b();
            }
            if (bundle2 == null) {
                bundle2 = new Bundle();
            }
            i1f i1fVar = new i1f(this) { // from class: x84
                public final /* synthetic */ y84 b;

                {
                    this.b = this;
                }

                @Override // defpackage.i1f
                public final void P(Bundle bundle3, FacebookException facebookException) {
                    int i2 = i;
                    y84 y84Var = this.b;
                    switch (i2) {
                        case 0:
                            m15 m15VarG2 = y84Var.g();
                            if (m15VarG2 != null) {
                                Intent intent2 = m15VarG2.getIntent();
                                intent2.getClass();
                                m15VarG2.setResult(facebookException != null ? 0 : -1, x98.e(intent2, bundle3, facebookException));
                                m15VarG2.finish();
                                break;
                            }
                            break;
                        default:
                            m15 m15VarG3 = y84Var.g();
                            if (m15VarG3 != null) {
                                Intent intent3 = new Intent();
                                if (bundle3 == null) {
                                    bundle3 = new Bundle();
                                }
                                intent3.putExtras(bundle3);
                                m15VarG3.setResult(-1, intent3);
                                m15VarG3.finish();
                                break;
                            }
                            break;
                    }
                }
            };
            if (w3VarR != null) {
                bundle2.putString("app_id", w3VarR.h);
                bundle2.putString("access_token", w3VarR.e);
            } else {
                bundle2.putString("app_id", string2);
            }
            n1f.b(m15VarG);
            h94Var = new n1f(m15VarG, string, bundle2, ea7.FACEBOOK, i1fVar);
        } else {
            if (bundleI != null) {
                string2 = bundleI.getString("url");
            }
            if (epe.J(string2)) {
                f94 f94Var2 = f94.a;
                m15VarG.finish();
                return;
            }
            final int i2 = 1;
            String str = String.format("fb%s://bridge/", Arrays.copyOf(new Object[]{f94.b()}, 1));
            int i3 = h94.o;
            string2.getClass();
            n1f.b(m15VarG);
            h94Var = new h94(m15VarG, string2);
            h94Var.b = str;
            h94Var.c = new i1f(this) { // from class: x84
                public final /* synthetic */ y84 b;

                {
                    this.b = this;
                }

                @Override // defpackage.i1f
                public final void P(Bundle bundle3, FacebookException facebookException) {
                    int i22 = i2;
                    y84 y84Var = this.b;
                    switch (i22) {
                        case 0:
                            m15 m15VarG2 = y84Var.g();
                            if (m15VarG2 != null) {
                                Intent intent2 = m15VarG2.getIntent();
                                intent2.getClass();
                                m15VarG2.setResult(facebookException != null ? 0 : -1, x98.e(intent2, bundle3, facebookException));
                                m15VarG2.finish();
                                break;
                            }
                            break;
                        default:
                            m15 m15VarG3 = y84Var.g();
                            if (m15VarG3 != null) {
                                Intent intent3 = new Intent();
                                if (bundle3 == null) {
                                    bundle3 = new Bundle();
                                }
                                intent3.putExtras(bundle3);
                                m15VarG3.setResult(-1, intent3);
                                m15VarG3.finish();
                                break;
                            }
                            break;
                    }
                }
            };
        }
        this.C0 = h94Var;
    }
}
