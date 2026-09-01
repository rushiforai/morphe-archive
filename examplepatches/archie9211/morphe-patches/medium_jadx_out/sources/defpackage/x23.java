package defpackage;

import android.speech.tts.UtteranceProgressListener;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x23 extends UtteranceProgressListener {
    public final /* synthetic */ y23 a;

    public x23(y23 y23Var) {
        this.a = y23Var;
    }

    @Override // android.speech.tts.UtteranceProgressListener
    public final void onDone(String str) {
        wld.a.j(ka1.r("Utterance onDone: ", str), new Object[0]);
        y23 y23Var = this.a;
        if (g76.L(str, ((aud) bu1.H0(y23Var.i)).a)) {
            y23Var.f = false;
            wtd wtdVar = y23Var.g;
            if (wtdVar != null) {
                xpc xpcVar = y23Var.o;
                ytd ytdVar = new ytd(wtdVar, y23Var.j, y23Var.k, false, y23Var.l, !y23Var.d().isEmpty(), y23Var.e());
                xpcVar.getClass();
                xpcVar.m(null, ytdVar);
            }
        }
    }

    @Override // android.speech.tts.UtteranceProgressListener
    public final void onError(String str, int i) {
        wld.a.c("Utterance onError: utteranceId - " + str + ", errorCode: " + i, new Object[0]);
    }

    @Override // android.speech.tts.UtteranceProgressListener
    public final void onStart(String str) {
        wld.a.j(ka1.r("Utterance onStart: ", str), new Object[0]);
        if (str == null) {
            return;
        }
        y23 y23Var = this.a;
        y23Var.h = str;
        Iterator it2 = y23Var.i.iterator();
        int i = 0;
        while (true) {
            if (!it2.hasNext()) {
                i = -1;
                break;
            } else if (g76.L(((aud) it2.next()).a, str)) {
                break;
            } else {
                i++;
            }
        }
        y23Var.j = i >= 0 ? i : 0;
        int size = y23Var.i.size();
        y23Var.k = size;
        y23Var.f = true;
        wtd wtdVar = y23Var.g;
        if (wtdVar != null) {
            xpc xpcVar = y23Var.o;
            ytd ytdVar = new ytd(wtdVar, y23Var.j, size, true, y23Var.l, !y23Var.d().isEmpty(), y23Var.e());
            xpcVar.getClass();
            xpcVar.m(null, ytdVar);
        }
    }

    @Override // android.speech.tts.UtteranceProgressListener
    public final void onError(String str) {
        wld.a.c(ka1.r("Utterance onError: utteranceId - ", str), new Object[0]);
    }
}
