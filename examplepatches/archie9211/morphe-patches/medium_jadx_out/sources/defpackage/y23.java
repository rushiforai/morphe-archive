package defpackage;

import android.app.ActivityManager;
import android.content.Context;
import android.media.AudioAttributes;
import android.media.AudioFocusRequest;
import android.media.AudioManager;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.speech.tts.TextToSpeech;
import android.speech.tts.Voice;
import com.medium.proto.event.PostAudioStopped;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class y23 implements bud {
    public final Context a;
    public final sk0 b;
    public final ax2 c;
    public final qn7 d;
    public final sb2 e;
    public boolean f;
    public wtd g;
    public String h;
    public float j;
    public int k;
    public boolean m;
    public long n;
    public final vq6 s;
    public final s23 t;
    public final x23 u;
    public final vq6 v;
    public List i = ey3.a;
    public float l = 1.0f;
    public final xpc o = vv2.j(xtd.a);
    public final xpc p = vv2.j(null);
    public final xpc q = vv2.j(Boolean.FALSE);
    public final r23 r = new TextToSpeech.OnInitListener() { // from class: r23
        @Override // android.speech.tts.TextToSpeech.OnInitListener
        public final void onInit(int i) {
            xpc xpcVar = this.a.q;
            if (i == 0) {
                Boolean bool = Boolean.TRUE;
                xpcVar.getClass();
                xpcVar.m(null, bool);
                wld.a.a("TextToSpeech initialized successfully", new Object[0]);
                return;
            }
            Boolean bool2 = Boolean.FALSE;
            xpcVar.getClass();
            xpcVar.m(null, bool2);
            wld.a.a("TextToSpeech initialization failed", new Object[0]);
        }
    };

    /* JADX WARN: Type inference failed for: r1v9, types: [r23] */
    /* JADX WARN: Type inference failed for: r2v3, types: [s23] */
    public y23(Context context, sk0 sk0Var, ax2 ax2Var, qn7 qn7Var, sb2 sb2Var) {
        this.a = context;
        this.b = sk0Var;
        this.c = ax2Var;
        this.d = qn7Var;
        this.e = sb2Var;
        yw6 yw6Var = yw6.NONE;
        this.s = vx0.d0(yw6Var, new n7(28));
        this.t = new AudioManager.OnAudioFocusChangeListener() { // from class: s23
            @Override // android.media.AudioManager.OnAudioFocusChangeListener
            public final void onAudioFocusChange(int i) {
                y23 y23Var = this.a;
                if (i == -2 || i == -1) {
                    y23Var.m = y23Var.f;
                    y23Var.f("", "tts_audio_focus_loss", false);
                } else if (i == 1 && y23Var.m) {
                    y23Var.h();
                }
            }
        };
        this.u = new x23(this);
        this.v = vx0.d0(yw6Var, new nh2(6, this));
    }

    public final Object a(n92 n92Var) {
        c();
        int i = 2;
        Object objD = dm2.D(this.q, new mx2(i, i, null), n92Var);
        return objD == tb2.COROUTINE_SUSPENDED ? objD : c1e.a;
    }

    public final long b() {
        Iterator it2 = this.i.subList(0, (int) this.j).iterator();
        long jA = 0;
        while (it2.hasNext()) {
            jA += ((aud) it2.next()).a(this.l);
        }
        return jA;
    }

    public final TextToSpeech c() {
        return (TextToSpeech) this.v.getValue();
    }

    public final Set d() {
        Set<Voice> voices = c().getVoices();
        if (voices == null) {
            voices = ny3.a;
        }
        return bu1.q1(bu1.f1(voices, new u23(1, new u23(0, new u23(2, new js4(16))))));
    }

    public final boolean e() {
        ActivityManager activityManager;
        return Build.VERSION.SDK_INT >= 28 && (activityManager = (ActivityManager) this.a.getSystemService(ActivityManager.class)) != null && activityManager.isBackgroundRestricted();
    }

    public final void f(String str, String str2, boolean z) {
        wld.a.a("Pause reading", new Object[0]);
        this.f = false;
        wtd wtdVar = this.g;
        String str3 = wtdVar != null ? wtdVar.a : null;
        if (z && str3 != null) {
            long j = this.n;
            long jB = b();
            Iterator it2 = this.i.iterator();
            long jA = 0;
            while (it2.hasNext()) {
                jA += ((aud) it2.next()).a(this.l);
            }
            long j2 = (long) (this.l * 200.0f);
            str.getClass();
            str2.getClass();
            rqd.a(this.c.b, new PostAudioStopped(null, str3, Long.valueOf(j), Long.valueOf(jB), Long.valueOf(jA), Long.valueOf(j2), null, 65, null), str, str2, false, null, null, 56);
        }
        c().stop();
        wtd wtdVar2 = this.g;
        if (wtdVar2 != null) {
            ytd ytdVar = new ytd(wtdVar2, this.j, this.k, this.f, this.l, !d().isEmpty(), e());
            xpc xpcVar = this.o;
            xpcVar.getClass();
            xpcVar.m(null, ytdVar);
        }
    }

    public final boolean g() {
        int iRequestAudioFocus;
        Object systemService = this.a.getSystemService("audio");
        systemService.getClass();
        AudioManager audioManager = (AudioManager) systemService;
        int i = Build.VERSION.SDK_INT;
        s23 s23Var = this.t;
        if (i >= 26) {
            AudioFocusRequest.Builder builder = new AudioFocusRequest.Builder(1);
            AudioAttributes.Builder builder2 = new AudioAttributes.Builder();
            builder2.setUsage(1);
            builder2.setContentType(1);
            builder.setAudioAttributes(builder2.build());
            builder.setFocusGain(1);
            builder.setAcceptsDelayedFocusGain(true);
            builder.setOnAudioFocusChangeListener(s23Var, (Handler) this.s.getValue());
            iRequestAudioFocus = audioManager.requestAudioFocus(builder.build());
        } else {
            iRequestAudioFocus = audioManager.requestAudioFocus(s23Var, 3, 1);
        }
        return iRequestAudioFocus == 1;
    }

    public final void h() {
        wld.a.a("Resume reading", new Object[0]);
        if (g()) {
            Iterator it2 = this.i.iterator();
            int i = 0;
            while (true) {
                if (!it2.hasNext()) {
                    i = -1;
                    break;
                } else if (g76.L(((aud) it2.next()).a, this.h)) {
                    break;
                } else {
                    i++;
                }
            }
            Iterator it3 = bu1.s0(this.i, i >= 0 ? i : 0).iterator();
            while (it3.hasNext()) {
                i((aud) it3.next());
            }
            this.n = b();
            wtd wtdVar = this.g;
            if (wtdVar != null) {
                ytd ytdVar = new ytd(wtdVar, this.j, this.k, this.f, this.l, !d().isEmpty(), e());
                xpc xpcVar = this.o;
                xpcVar.getClass();
                xpcVar.m(null, ytdVar);
            }
        }
    }

    public final void i(aud audVar) {
        c().speak(audVar.b, 1, new Bundle(), audVar.a);
    }
}
