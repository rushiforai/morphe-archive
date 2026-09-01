package defpackage;

import android.speech.tts.Voice;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uwe {
    public final Voice a;
    public final boolean b;
    public final String c;
    public final String d;

    public uwe(Voice voice, boolean z) {
        this.a = voice;
        this.b = z;
        String displayCountry = voice.getLocale().getDisplayCountry();
        displayCountry.getClass();
        this.c = displayCountry;
        String displayLanguage = voice.getLocale().getDisplayLanguage();
        displayLanguage.getClass();
        this.d = qo7.m(displayLanguage, ka9.a.f().d());
    }

    public final String a() {
        Voice voice = this.a;
        int iCodePointAt = Character.codePointAt(voice.getLocale().getCountry(), 0) - (-127397);
        int iCodePointAt2 = Character.codePointAt(voice.getLocale().getCountry(), 1) - (-127397);
        char[] chars = Character.toChars(iCodePointAt);
        chars.getClass();
        String str = new String(chars);
        char[] chars2 = Character.toChars(iCodePointAt2);
        chars2.getClass();
        return str.concat(new String(chars2));
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!uwe.class.equals(obj != null ? obj.getClass() : null)) {
            return false;
        }
        obj.getClass();
        uwe uweVar = (uwe) obj;
        return this.b == uweVar.b && g76.L(this.a.getName(), uweVar.a.getName()) && a().equals(uweVar.a()) && this.c.equals(uweVar.c) && this.d.equals(uweVar.d);
    }

    public final int hashCode() {
        return this.d.hashCode() + wgd.o((a().hashCode() + ((this.a.getName().hashCode() + ((this.b ? 1231 : 1237) * 31)) * 31)) * 31, 31, this.c);
    }

    public final String toString() {
        return "VoiceItem(voice=" + this.a + ", isChecked=" + this.b + ")";
    }
}
