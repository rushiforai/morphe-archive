package bg;

import androidx.recyclerview.widget.u1;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.google.android.gms.internal.measurement.ef;
import com.google.android.gms.internal.measurement.j1;
import com.google.android.gms.internal.measurement.pc;
import com.google.android.gms.internal.measurement.we;
import com.google.android.gms.internal.measurement.xe;
import com.google.android.gms.internal.measurement.y0;
import java.io.InputStream;
import kotlin.io.CloseableKt;

/* loaded from: classes3.dex */
public class g implements xe {

    /* renamed from: a, reason: collision with root package name */
    public boolean f17888a;

    public /* synthetic */ g(boolean z11, boolean z12) {
        this.f17888a = z11;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.google.android.gms.internal.measurement.xe
    public /* bridge */ /* synthetic */ Object a(we weVar) {
        pc pcVarA;
        InputStream inputStreamD = j1.d(weVar);
        try {
            boolean z11 = this.f17888a;
            int i5 = u1.FLAG_APPEARED_IN_PRE_LAYOUT;
            if (z11) {
                if (inputStreamD instanceof ef) {
                    long length = ((ef) inputStreamD).zza().length();
                    if (length == 0) {
                        i5 = EventBridgeChannel.QUEUE_CAPACITY;
                    } else if (length < 4096) {
                        i5 = (int) length;
                    }
                }
                pcVarA = pc.a(y0.h(i5, inputStreamD), true);
            } else {
                pcVarA = pc.a(y0.h(u1.FLAG_APPEARED_IN_PRE_LAYOUT, inputStreamD), false);
            }
            CloseableKt.a(inputStreamD, null);
            return pcVarA;
        } catch (Throwable th2) {
            try {
                throw th2;
            } catch (Throwable th3) {
                CloseableKt.a(inputStreamD, th2);
                throw th3;
            }
        }
    }

    public g b() {
        return new g(this.f17888a, false);
    }

    public synchronized void c() {
        this.f17888a = false;
    }

    public synchronized boolean d() {
        if (this.f17888a) {
            return false;
        }
        this.f17888a = true;
        notifyAll();
        return true;
    }

    public void e(boolean z11) {
    }

    public void f(boolean z11) {
    }

    public void g(boolean z11) {
        this.f17888a = z11;
    }

    public g(int i5) {
        switch (i5) {
            case 1:
                break;
            case 6:
                this.f17888a = false;
                break;
            default:
                this.f17888a = true;
                break;
        }
    }
}
