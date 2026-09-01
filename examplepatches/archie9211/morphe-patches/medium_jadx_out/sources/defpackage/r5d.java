package defpackage;

import com.drew.metadata.exif.makernotes.CanonMakernoteDirectory;
import com.drew.metadata.exif.makernotes.LeicaMakernoteDirectory;
import com.drew.metadata.exif.makernotes.NikonType2MakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.iptc.IptcDirectory;
import com.drew.metadata.mov.metadata.QuickTimeMetadataDirectory;
import com.drew.metadata.mp4.media.Mp4VideoDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class r5d {
    public static final r5d[] i = {new r5d(false, 3, 5, 8, 8, 1, 3, 5), new r5d(false, 5, 7, 10, 10, 1, 5, 7), new r5d(true, 5, 7, 16, 6, 1, 5, 7), new r5d(false, 8, 10, 12, 12, 1, 8, 10), new r5d(true, 10, 11, 14, 6, 2, 10, 11), new r5d(false, 12, 12, 14, 14, 1, 12, 12), new r5d(true, 16, 14, 24, 10, 1, 16, 14), new r5d(false, 18, 14, 16, 16, 1, 18, 14), new r5d(false, 22, 18, 18, 18, 1, 22, 18), new r5d(true, 22, 18, 16, 10, 2, 22, 18), new r5d(false, 30, 20, 20, 20, 1, 30, 20), new r5d(true, 32, 24, 16, 14, 2, 32, 24), new r5d(false, 36, 24, 22, 22, 1, 36, 24), new r5d(false, 44, 28, 24, 24, 1, 44, 28), new r5d(true, 49, 28, 22, 14, 2, 49, 28), new r5d(false, 62, 36, 14, 14, 4, 62, 36), new r5d(false, 86, 42, 16, 16, 4, 86, 42), new r5d(false, 114, 48, 18, 18, 4, 114, 48), new r5d(false, 144, 56, 20, 20, 4, 144, 56), new r5d(false, 174, 68, 22, 22, 4, 174, 68), new r5d(false, Mp4VideoDirectory.TAG_WIDTH, 84, 24, 24, 4, 102, 42), new r5d(false, 280, PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, 14, 14, 16, 140, 56), new r5d(false, 368, 144, 16, 16, 16, 92, 36), new r5d(false, 456, 192, 18, 18, 16, 114, 48), new r5d(false, 576, CanonMakernoteDirectory.TAG_SENSOR_INFO_ARRAY, 20, 20, 16, 144, 56), new r5d(false, IptcDirectory.TAG_JOB_ID, 272, 22, 22, 16, 174, 68), new r5d(false, LeicaMakernoteDirectory.TAG_CCD_VERSION, IptcDirectory.TAG_TIME_SENT, 24, 24, 16, 136, 56), new r5d(false, PhotoshopDirectory.TAG_SLICES, 408, 18, 18, 36, NikonType2MakernoteDirectory.TAG_UNKNOWN_30, 68), new r5d(false, QuickTimeMetadataDirectory.TAG_LOCATION_DATE, 496, 20, 20, 36, 163, 62), new kt2(false, 1558, 620, 22, 22, 36, -1, 62)};
    public final boolean a;
    public final int b;
    public final int c;
    public final int d;
    public final int e;
    public final int f;
    public final int g;
    public final int h;

    public r5d(boolean z, int i2, int i3, int i4, int i5, int i6, int i7, int i8) {
        this.a = z;
        this.b = i2;
        this.c = i3;
        this.d = i4;
        this.e = i5;
        this.f = i6;
        this.g = i7;
        this.h = i8;
    }

    public static r5d e(int i2, s5d s5dVar) {
        for (int i3 = 0; i3 < 30; i3++) {
            r5d r5dVar = i[i3];
            if (!(s5dVar == s5d.FORCE_SQUARE && r5dVar.a) && ((s5dVar != s5d.FORCE_RECTANGLE || r5dVar.a) && i2 <= r5dVar.b)) {
                return r5dVar;
            }
        }
        ay0.e("Can't find a symbol arrangement that matches the message. Data codewords: ".concat(String.valueOf(i2)));
        return null;
    }

    public int a(int i2) {
        return this.g;
    }

    public final int b() {
        int i2 = this.f;
        int i3 = 1;
        if (i2 != 1) {
            i3 = 2;
            if (i2 != 2 && i2 != 4) {
                if (i2 == 16) {
                    return 4;
                }
                if (i2 == 36) {
                    return 6;
                }
                ygf.f("Cannot handle this number of data regions");
                return 0;
            }
        }
        return i3;
    }

    public int c() {
        return this.b / this.g;
    }

    public final int d() {
        int i2 = this.f;
        if (i2 == 1 || i2 == 2) {
            return 1;
        }
        if (i2 == 4) {
            return 2;
        }
        if (i2 == 16) {
            return 4;
        }
        if (i2 == 36) {
            return 6;
        }
        ygf.f("Cannot handle this number of data regions");
        return 0;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder(this.a ? "Rectangular Symbol:" : "Square Symbol:");
        sb.append(" data region ");
        int i2 = this.d;
        sb.append(i2);
        sb.append('x');
        int i3 = this.e;
        sb.append(i3);
        sb.append(", symbol size ");
        sb.append((b() * i2) + (b() << 1));
        sb.append('x');
        sb.append((d() * i3) + (d() << 1));
        sb.append(", symbol data size ");
        sb.append(b() * i2);
        sb.append('x');
        sb.append(d() * i3);
        sb.append(", codewords ");
        sb.append(this.b);
        sb.append('+');
        sb.append(this.c);
        return sb.toString();
    }
}
