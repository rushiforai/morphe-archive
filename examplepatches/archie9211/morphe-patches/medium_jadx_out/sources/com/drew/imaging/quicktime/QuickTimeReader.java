package com.drew.imaging.quicktime;

import com.drew.lang.StreamReader;
import com.drew.metadata.mov.QuickTimeContext;
import com.drew.metadata.mov.atoms.Atom;
import java.io.IOException;
import java.io.InputStream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class QuickTimeReader {
    private QuickTimeReader() {
    }

    public static void extract(InputStream inputStream, QuickTimeHandler<?> quickTimeHandler) {
        StreamReader streamReader = new StreamReader(inputStream);
        streamReader.setMotorolaByteOrder(true);
        processAtoms(streamReader, -1L, quickTimeHandler, new QuickTimeContext());
    }

    private static void processAtoms(StreamReader streamReader, long j, QuickTimeHandler<?> quickTimeHandler, QuickTimeContext quickTimeContext) {
        while (true) {
            if (j != -1) {
                try {
                    if (streamReader.getPosition() >= j) {
                        return;
                    }
                } catch (IOException e) {
                    quickTimeHandler.addError(e.getMessage());
                    return;
                }
            }
            Atom atom = new Atom(streamReader);
            long j2 = atom.size;
            if (j2 > 2147483647L) {
                quickTimeHandler.addError("Atom size too large.");
                return;
            }
            if (j2 < 8) {
                quickTimeHandler.addError("Atom size too small.");
                return;
            }
            if (quickTimeHandler.shouldAcceptContainer(atom)) {
                processAtoms(streamReader, (atom.size + streamReader.getPosition()) - 8, quickTimeHandler.processAtom(atom, null, quickTimeContext), quickTimeContext);
            } else {
                boolean zShouldAcceptAtom = quickTimeHandler.shouldAcceptAtom(atom);
                long j3 = atom.size;
                if (zShouldAcceptAtom) {
                    quickTimeHandler = quickTimeHandler.processAtom(atom, streamReader.getBytes(((int) j3) - 8), quickTimeContext);
                } else if (j3 > 8) {
                    streamReader.skip(j3 - 8);
                } else if (j3 == -1) {
                    return;
                }
            }
        }
    }
}
