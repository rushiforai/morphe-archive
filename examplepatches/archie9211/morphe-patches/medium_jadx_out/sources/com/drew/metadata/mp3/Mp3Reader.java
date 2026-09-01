package com.drew.metadata.mp3;

import com.drew.imaging.ImageProcessingException;
import com.drew.lang.StreamReader;
import com.drew.metadata.Metadata;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Array;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class Mp3Reader {
    /* JADX WARN: Removed duplicated region for block: B:14:0x009c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static int setBitrate(int r10, int r11, int r12) {
        /*
            Method dump skipped, instruction units count: 388
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.drew.metadata.mp3.Mp3Reader.setBitrate(int, int, int):int");
    }

    public final void extract(InputStream inputStream, Metadata metadata) {
        int i;
        Mp3Directory mp3Directory = new Mp3Directory();
        metadata.addDirectory(mp3Directory);
        try {
            int int32 = new StreamReader(inputStream).getInt32();
            int i2 = (1572864 & int32) >> 19;
            if (i2 == 0) {
                throw new ImageProcessingException("MPEG-2.5 not supported.", null);
            }
            if (i2 == 2) {
                mp3Directory.setObject(1, "MPEG-2");
                i = 2;
            } else if (i2 != 3) {
                i = 0;
            } else {
                mp3Directory.setObject(1, "MPEG-1");
                i = 1;
            }
            int i3 = (393216 & int32) >> 17;
            if (i3 == 0) {
                mp3Directory.setObject(2, "Not defined");
            } else if (i3 == 1) {
                mp3Directory.setObject(2, "Layer III");
            } else if (i3 == 2) {
                mp3Directory.setObject(2, "Layer II");
            } else if (i3 == 3) {
                mp3Directory.setObject(2, "Layer I");
            }
            int i4 = (61440 & int32) >> 12;
            if (i4 != 0 && i4 != 15) {
                mp3Directory.setInt(3, setBitrate(i4, i3, i));
            }
            int i5 = (int32 & 3072) >> 10;
            int[][] iArr = (int[][]) Array.newInstance((Class<?>) Integer.TYPE, 2, 3);
            int[] iArr2 = {44100, 48000, 32000};
            iArr[0] = iArr2;
            int[] iArr3 = {22050, 24000, 16000};
            iArr[1] = iArr3;
            if (i5 > 2) {
                mp3Directory.addError("Invalid frequency index.");
                i5 = -1;
            } else if (i == 2) {
                mp3Directory.setInt(4, iArr3[i5]);
                i5 = iArr[1][i5];
            } else if (i == 1) {
                mp3Directory.setInt(4, iArr2[i5]);
                i5 = iArr[0][i5];
            }
            int i6 = (int32 & 192) >> 6;
            if (i6 == 0) {
                mp3Directory.setObject(5, "Stereo");
            } else if (i6 == 1) {
                mp3Directory.setObject(5, "Joint stereo");
            } else if (i6 == 2) {
                mp3Directory.setObject(5, "Dual channel");
            } else if (i6 == 3) {
                mp3Directory.setObject(5, "Mono");
            }
            int i7 = (int32 & 8) >> 3;
            if (i7 == 0) {
                mp3Directory.setObject(7, "False");
            } else if (i7 == 1) {
                mp3Directory.setObject(7, "True");
            }
            int i8 = int32 & 3;
            if (i8 == 0) {
                mp3Directory.setObject(6, "none");
            } else if (i8 == 1) {
                mp3Directory.setObject(6, "50/15ms");
            } else if (i8 == 3) {
                mp3Directory.setObject(6, "CCITT j.17");
            }
            if (i5 == -1 || i4 == 0 || i4 == 15) {
                return;
            }
            mp3Directory.setObject(8, ((setBitrate(i4, i3, i) * 144000) / i5) + " bytes");
        } catch (ImageProcessingException e) {
            mp3Directory.addError(e.getMessage());
        } catch (IOException e2) {
            mp3Directory.addError(e2.getMessage());
        }
    }
}
