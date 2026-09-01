package com.drew.imaging.mp4;

import com.drew.lang.StreamReader;
import com.drew.metadata.mp4.Mp4Context;
import java.io.IOException;
import java.io.InputStream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class Mp4Reader {
    private Mp4Reader() {
    }

    public static void extract(InputStream inputStream, Mp4Handler<?> mp4Handler) {
        StreamReader streamReader = new StreamReader(inputStream);
        streamReader.setMotorolaByteOrder(true);
        processBoxes(streamReader, -1L, mp4Handler, new Mp4Context());
    }

    private static void processBoxes(StreamReader streamReader, long j, Mp4Handler<?> mp4Handler, Mp4Context mp4Context) {
        Mp4Context mp4Context2;
        Mp4Handler<?> mp4HandlerProcessBox = mp4Handler;
        while (true) {
            if (j != -1) {
                try {
                    if (streamReader.getPosition() >= j) {
                        return;
                    }
                } catch (IOException e) {
                    mp4HandlerProcessBox.addError(e.getMessage());
                    return;
                }
            }
            long uInt32 = streamReader.getUInt32();
            String string = streamReader.getString(4);
            boolean z = uInt32 == 1;
            if (z) {
                uInt32 = streamReader.getInt64();
            }
            long j2 = uInt32;
            if (j2 > 2147483647L) {
                mp4HandlerProcessBox.addError("Box size too large.");
                return;
            }
            if (j2 < 8) {
                mp4HandlerProcessBox.addError("Box size too small.");
                return;
            }
            if (mp4HandlerProcessBox.shouldAcceptContainer(string)) {
                mp4Context2 = mp4Context;
                processBoxes(streamReader, (streamReader.getPosition() + j2) - 8, mp4HandlerProcessBox.processBox(string, null, j2, mp4Context2), mp4Context2);
            } else {
                mp4Context2 = mp4Context;
                if (mp4HandlerProcessBox.shouldAcceptBox(string)) {
                    mp4HandlerProcessBox = mp4HandlerProcessBox.processBox(string, streamReader.getBytes(((int) j2) - 8), j2, mp4Context2);
                } else if (!z) {
                    streamReader.skip(j2 - 8);
                } else if (j2 < 16) {
                    return;
                } else {
                    streamReader.skip(j2 - 16);
                }
            }
            mp4Context = mp4Context2;
        }
    }
}
