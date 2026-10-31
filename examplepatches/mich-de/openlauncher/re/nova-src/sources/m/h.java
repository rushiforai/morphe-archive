package m;

import android.content.DialogInterface;
import android.media.MediaCodec;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import androidx.preference.PreferenceFragment;
import androidx.preference.PreferenceFragmentCompat;
import java.lang.ref.WeakReference;
import java.util.ArrayDeque;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes2.dex */
public final class h extends Handler {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f75265a;

    /* renamed from: b, reason: collision with root package name */
    public Object f75266b;

    public /* synthetic */ h() {
        this.f75265a = 0;
    }

    /* JADX WARN: Removed duplicated region for block: B:47:0x008f  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x009a A[ORIG_RETURN, RETURN] */
    @Override // android.os.Handler
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void handleMessage(Message message) throws MediaCodec.CryptoException {
        we.c cVar;
        switch (this.f75265a) {
            case 0:
                int i5 = message.what;
                if (i5 == -3 || i5 == -2 || i5 == -1) {
                    ((DialogInterface.OnClickListener) message.obj).onClick((DialogInterface) ((WeakReference) this.f75266b).get(), message.what);
                    return;
                } else {
                    if (i5 != 1) {
                        return;
                    }
                    ((DialogInterface) message.obj).dismiss();
                    return;
                }
            case 1:
                if (message.what != 1) {
                    return;
                }
                ((PreferenceFragment) this.f75266b).f14798b.getClass();
                return;
            case 2:
                if (message.what != 1) {
                    return;
                }
                ((PreferenceFragmentCompat) this.f75266b).f14805b.getClass();
                return;
            default:
                we.d dVar = (we.d) this.f75266b;
                dVar.getClass();
                int i11 = message.what;
                we.c cVar2 = null;
                if (i11 == 0) {
                    cVar = (we.c) message.obj;
                    try {
                        dVar.f94220a.queueInputBuffer(cVar.f94213a, 0, cVar.f94214b, cVar.f94216d, cVar.f94217e);
                    } catch (RuntimeException e3) {
                        AtomicReference atomicReference = dVar.f94223d;
                        while (!atomicReference.compareAndSet(null, e3) && atomicReference.get() == null) {
                        }
                    }
                } else {
                    if (i11 != 1) {
                        if (i11 != 2) {
                            AtomicReference atomicReference2 = dVar.f94223d;
                            IllegalStateException illegalStateException = new IllegalStateException(String.valueOf(message.what));
                            while (!atomicReference2.compareAndSet(null, illegalStateException) && atomicReference2.get() == null) {
                            }
                        } else {
                            dVar.f94224e.d();
                        }
                        if (cVar2 == null) {
                            ArrayDeque arrayDeque = we.d.f94218g;
                            synchronized (arrayDeque) {
                                arrayDeque.add(cVar2);
                            }
                            return;
                        }
                        return;
                    }
                    cVar = (we.c) message.obj;
                    int i12 = cVar.f94213a;
                    MediaCodec.CryptoInfo cryptoInfo = cVar.f94215c;
                    long j11 = cVar.f94216d;
                    int i13 = cVar.f94217e;
                    try {
                        synchronized (we.d.f94219h) {
                            dVar.f94220a.queueSecureInputBuffer(i12, 0, cryptoInfo, j11, i13);
                        }
                    } catch (RuntimeException e11) {
                        AtomicReference atomicReference3 = dVar.f94223d;
                        while (!atomicReference3.compareAndSet(null, e11) && atomicReference3.get() == null) {
                        }
                    }
                }
                cVar2 = cVar;
                if (cVar2 == null) {
                }
        }
    }

    public /* synthetic */ h(Object obj, int i5) {
        this.f75265a = i5;
        this.f75266b = obj;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h(we.d dVar, Looper looper) {
        super(looper);
        this.f75265a = 3;
        this.f75266b = dVar;
    }
}
