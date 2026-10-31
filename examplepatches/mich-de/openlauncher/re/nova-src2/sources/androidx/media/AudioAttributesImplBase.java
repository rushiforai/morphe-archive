package androidx.media;

import b.c0;
import java.util.Arrays;

/* loaded from: classes2.dex */
public class AudioAttributesImplBase implements AudioAttributesImpl {

    /* renamed from: a, reason: collision with root package name */
    public int f14735a = 0;

    /* renamed from: b, reason: collision with root package name */
    public int f14736b = 0;

    /* renamed from: c, reason: collision with root package name */
    public int f14737c = 0;

    /* renamed from: d, reason: collision with root package name */
    public int f14738d = -1;

    public final boolean equals(Object obj) {
        int i5;
        if (!(obj instanceof AudioAttributesImplBase)) {
            return false;
        }
        AudioAttributesImplBase audioAttributesImplBase = (AudioAttributesImplBase) obj;
        if (this.f14736b == audioAttributesImplBase.f14736b) {
            int i11 = this.f14737c;
            int i12 = audioAttributesImplBase.f14737c;
            int i13 = audioAttributesImplBase.f14738d;
            if (i13 == -1) {
                int i14 = audioAttributesImplBase.f14735a;
                int i15 = AudioAttributesCompat.f14731b;
                if ((i12 & 1) != 1) {
                    i5 = 4;
                    if ((i12 & 4) != 4) {
                        switch (i14) {
                            case 2:
                                i5 = 0;
                                break;
                            case 3:
                                i5 = 8;
                                break;
                            case 4:
                                break;
                            case 5:
                            case 7:
                            case 8:
                            case 9:
                            case 10:
                                i5 = 5;
                                break;
                            case 6:
                                i5 = 2;
                                break;
                            case 11:
                                i5 = 10;
                                break;
                            case 12:
                            default:
                                i5 = 3;
                                break;
                            case 13:
                                i5 = 1;
                                break;
                        }
                    } else {
                        i5 = 6;
                    }
                } else {
                    i5 = 7;
                }
            } else {
                i5 = i13;
            }
            if (i5 == 6) {
                i12 |= 4;
            } else if (i5 == 7) {
                i12 |= 1;
            }
            if (i11 == (i12 & 273) && this.f14735a == audioAttributesImplBase.f14735a && this.f14738d == i13) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Integer.valueOf(this.f14736b), Integer.valueOf(this.f14737c), Integer.valueOf(this.f14735a), Integer.valueOf(this.f14738d)});
    }

    public final String toString() {
        String strH;
        StringBuilder sb2 = new StringBuilder("AudioAttributesCompat:");
        if (this.f14738d != -1) {
            sb2.append(" stream=");
            sb2.append(this.f14738d);
            sb2.append(" derived");
        }
        sb2.append(" usage=");
        int i5 = this.f14735a;
        int i11 = AudioAttributesCompat.f14731b;
        switch (i5) {
            case 0:
                strH = "USAGE_UNKNOWN";
                break;
            case 1:
                strH = "USAGE_MEDIA";
                break;
            case 2:
                strH = "USAGE_VOICE_COMMUNICATION";
                break;
            case 3:
                strH = "USAGE_VOICE_COMMUNICATION_SIGNALLING";
                break;
            case 4:
                strH = "USAGE_ALARM";
                break;
            case 5:
                strH = "USAGE_NOTIFICATION";
                break;
            case 6:
                strH = "USAGE_NOTIFICATION_RINGTONE";
                break;
            case 7:
                strH = "USAGE_NOTIFICATION_COMMUNICATION_REQUEST";
                break;
            case 8:
                strH = "USAGE_NOTIFICATION_COMMUNICATION_INSTANT";
                break;
            case 9:
                strH = "USAGE_NOTIFICATION_COMMUNICATION_DELAYED";
                break;
            case 10:
                strH = "USAGE_NOTIFICATION_EVENT";
                break;
            case 11:
                strH = "USAGE_ASSISTANCE_ACCESSIBILITY";
                break;
            case 12:
                strH = "USAGE_ASSISTANCE_NAVIGATION_GUIDANCE";
                break;
            case 13:
                strH = "USAGE_ASSISTANCE_SONIFICATION";
                break;
            case 14:
                strH = "USAGE_GAME";
                break;
            case 15:
            default:
                strH = c0.h(i5, "unknown usage ");
                break;
            case 16:
                strH = "USAGE_ASSISTANT";
                break;
        }
        sb2.append(strH);
        sb2.append(" content=");
        sb2.append(this.f14736b);
        sb2.append(" flags=0x");
        sb2.append(Integer.toHexString(this.f14737c).toUpperCase());
        return sb2.toString();
    }
}
