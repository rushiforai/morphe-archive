package com.drew.imaging.riff;

import com.drew.lang.SequentialReader;
import com.drew.metadata.avi.AviDirectory;
import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class RiffReader {
    public final void processChunks(SequentialReader sequentialReader, int i, RiffHandler riffHandler) {
        while (sequentialReader.getPosition() < i) {
            try {
                String str = new String(sequentialReader.getBytes(4));
                int int32 = sequentialReader.getInt32();
                if (int32 <= 0) {
                    riffHandler.addError("Invalid chunk size: " + int32);
                    return;
                }
                if (str.equals("LIST") || str.equals("RIFF")) {
                    String str2 = new String(sequentialReader.getBytes(4));
                    if (int32 < 4) {
                        riffHandler.addError("Chunk size too small.");
                    } else if (riffHandler.shouldAcceptList(str2)) {
                        processChunks(sequentialReader, int32 - 4, riffHandler);
                    } else {
                        sequentialReader.skip(int32 - 4);
                    }
                } else if (!str.equals(AviDirectory.CHUNK_DATETIME_ORIGINAL)) {
                    if (riffHandler.shouldAcceptChunk(str)) {
                        riffHandler.processChunk(str, sequentialReader.getBytes(int32));
                    } else {
                        sequentialReader.skip(int32);
                    }
                    if ((int32 & 1) == 1) {
                        sequentialReader.skip(1L);
                    }
                } else if (int32 < 2) {
                    riffHandler.addError("Chunk size too small.");
                } else {
                    riffHandler.processChunk(str, sequentialReader.getBytes(int32 - 2));
                    sequentialReader.skip(2L);
                }
            } catch (IOException e) {
                riffHandler.addError(e.getMessage());
                return;
            }
        }
    }

    public final void processRiff(SequentialReader sequentialReader, RiffHandler riffHandler) throws RiffProcessingException {
        sequentialReader.setMotorolaByteOrder(false);
        String string = sequentialReader.getString(4);
        if (!string.equals("RIFF")) {
            throw new RiffProcessingException("Invalid RIFF header: ".concat(string), null);
        }
        int int32 = sequentialReader.getInt32() - 4;
        if (riffHandler.shouldAcceptRiffIdentifier(sequentialReader.getString(4))) {
            processChunks(sequentialReader, int32, riffHandler);
        }
    }
}
