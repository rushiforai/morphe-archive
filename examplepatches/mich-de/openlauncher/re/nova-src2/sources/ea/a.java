package ea;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.Messenger;
import android.util.Log;
import android.util.Pair;
import b.c0;
import com.google.android.exoplayer2.ExoPlaybackException;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.teslacoilsw.launcher.NovaLauncher;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.lang.ref.WeakReference;
import java.util.Calendar;
import java.util.concurrent.CountDownLatch;
import we.j;
import wf.v;
import xf.f;
import ya.l0;

/* loaded from: classes2.dex */
public final class a implements Handler.Callback {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f52417a;

    /* renamed from: b, reason: collision with root package name */
    public Object f52418b;

    /* renamed from: c, reason: collision with root package name */
    public Object f52419c;

    public a(int i5) {
        this.f52417a = i5;
        switch (i5) {
            case 1:
                this.f52419c = new Messenger(new Handler(Looper.getMainLooper(), this));
                this.f52418b = new WeakReference(null);
                break;
        }
    }

    public Message a(NovaLauncher novaLauncher) {
        this.f52418b = new WeakReference(novaLauncher);
        Message messageObtain = Message.obtain();
        messageObtain.replyTo = (Messenger) this.f52419c;
        messageObtain.what = 0;
        return messageObtain;
    }

    @Override // android.os.Handler.Callback
    public final boolean handleMessage(Message message) throws Throwable {
        BufferedReader bufferedReader;
        boolean z11 = false;
        z11 = false;
        z11 = false;
        switch (this.f52417a) {
            case 0:
                if (b.f52423d != null && b.f52420a) {
                    int i5 = message.what;
                    BufferedReader bufferedReader2 = null;
                    if (i5 == 1) {
                        Calendar calendar = Calendar.getInstance();
                        String str = "log-" + (calendar.get(6) % 4);
                        if (!str.equals((String) this.f52418b)) {
                            l0.a((PrintWriter) this.f52419c);
                            this.f52419c = null;
                        }
                        try {
                            if (((PrintWriter) this.f52419c) == null) {
                                this.f52418b = str;
                                File file = new File(b.f52423d, str);
                                if (file.exists()) {
                                    Calendar calendar2 = Calendar.getInstance();
                                    calendar2.setTimeInMillis(file.lastModified());
                                    calendar2.add(10, 36);
                                    if (calendar.before(calendar2) && file.length() < 8388608) {
                                        z11 = true;
                                    }
                                }
                                this.f52419c = new PrintWriter(new FileWriter(file, z11));
                            }
                            ((PrintWriter) this.f52419c).println((String) message.obj);
                            ((PrintWriter) this.f52419c).flush();
                            b.f52422c.removeMessages(2);
                            b.f52422c.sendEmptyMessageDelayed(2, 5000L);
                        } catch (Exception e3) {
                            Log.e("FileLog", "Error writing logs to file", e3);
                            l0.a((PrintWriter) this.f52419c);
                            this.f52419c = null;
                        }
                    } else if (i5 == 2) {
                        l0.a((PrintWriter) this.f52419c);
                        this.f52419c = null;
                    } else if (i5 == 3) {
                        l0.a((PrintWriter) this.f52419c);
                        this.f52419c = null;
                        Pair pair = (Pair) message.obj;
                        if (pair.first != null) {
                            for (int i11 = 0; i11 < 4; i11++) {
                                PrintWriter printWriter = (PrintWriter) pair.first;
                                String strH = c0.h(i11, "log-");
                                File file2 = new File(b.f52423d, strH);
                                if (file2.exists()) {
                                    try {
                                        bufferedReader = new BufferedReader(new FileReader(file2));
                                    } catch (Exception unused) {
                                        bufferedReader = null;
                                    } catch (Throwable th2) {
                                        th = th2;
                                    }
                                    try {
                                        printWriter.println();
                                        printWriter.println("--- logfile: " + strH + " ---");
                                    } catch (Exception unused2) {
                                    } catch (Throwable th3) {
                                        th = th3;
                                        bufferedReader2 = bufferedReader;
                                        l0.a(bufferedReader2);
                                        throw th;
                                    }
                                    while (true) {
                                        String line = bufferedReader.readLine();
                                        if (line != null) {
                                            printWriter.println(line);
                                        } else {
                                            l0.a(bufferedReader);
                                        }
                                    }
                                }
                            }
                        }
                        ((CountDownLatch) pair.second).countDown();
                    }
                }
                return true;
            case 1:
                if (message.what != 0) {
                    return false;
                }
                za.d dVar = (za.d) ((WeakReference) this.f52418b).get();
                if (dVar != null) {
                    o9.a.M(dVar, false, UserMetadata.MAX_INTERNAL_KEY_SIZE);
                }
                return true;
            default:
                if (message.what != 0) {
                    return false;
                }
                int i12 = message.arg1;
                int i13 = message.arg2;
                int i14 = v.f94376a;
                long j11 = ((i12 & 4294967295L) << 32) | (4294967295L & i13);
                f fVar = (f) this.f52419c;
                if (this == fVar.f95794l1) {
                    if (j11 == Long.MAX_VALUE) {
                        fVar.f94291x0 = true;
                    } else {
                        try {
                            fVar.p0(j11);
                            fVar.x0();
                            fVar.f94295z0.f61571e++;
                            fVar.w0();
                            fVar.Y(j11);
                        } catch (ExoPlaybackException e11) {
                            fVar.f94293y0 = e11;
                        }
                    }
                }
                return true;
        }
    }

    public a(f fVar, j jVar) {
        this.f52417a = 2;
        this.f52419c = fVar;
        Handler handlerJ = v.j(this);
        this.f52418b = handlerJ;
        jVar.b(this, handlerJ);
    }
}
