package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public enum zzry implements zzatw {
    TEL(0),
    SMS(1),
    CALLTO(2),
    WTAI(3),
    RTSP(4),
    MARKET(5),
    GEO(6),
    SKYPE(7),
    WHATSAPP(8),
    ITMS(20),
    ITMS_BOOKS(9),
    ITMS_BOOKSS(27),
    GLASS(10),
    ITMS_APPS(11),
    ITMS_APPSS(19),
    ITMS_SERVICES(22),
    GOOGLEASSISTANT(12),
    ASSISTANT_SETTINGS(13),
    SSH(14),
    INTENT(15),
    SIP(16),
    GOOGLEHOME(17),
    CHROMECAST(18),
    PAY(21),
    GOOGLEAPP(23),
    CID(24),
    WEBCAL(25),
    YOUTUBE(26),
    FILE(28),
    CONTENT(29),
    HELPFULINTERRUPTION(30),
    GOOGLECHROMEACTION(31),
    GOOGLECHROME(32),
    GOOGLECHROMES(33);

    private static final zzatx zzI = new zzatx() { // from class: com.google.android.libraries.places.internal.zzrx
    };
    private final int zzK;

    zzry(int i5) {
        this.zzK = i5;
    }

    @Override // java.lang.Enum
    public final String toString() {
        return Integer.toString(this.zzK);
    }
}
