package com.drew.metadata.mov;

import com.drew.imaging.quicktime.QuickTimeHandler;
import com.drew.lang.SequentialByteArrayReader;
import com.drew.metadata.Metadata;
import com.drew.metadata.mov.atoms.Atom;
import com.drew.metadata.mov.metadata.QuickTimeMetadataDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class QuickTimeMetadataHandler extends QuickTimeHandler<QuickTimeDirectory> {
    public QuickTimeMetadataHandler(Metadata metadata) {
        super(metadata);
    }

    @Override // com.drew.imaging.quicktime.QuickTimeHandler
    public final QuickTimeDirectory createDirectory() {
        return new QuickTimeMetadataDirectory();
    }

    @Override // com.drew.imaging.quicktime.QuickTimeHandler
    public QuickTimeHandler<?> processAtom(Atom atom, byte[] bArr, QuickTimeContext quickTimeContext) {
        if (bArr != null) {
            SequentialByteArrayReader sequentialByteArrayReader = new SequentialByteArrayReader(bArr, 0);
            if (atom.type.equals(QuickTimeAtomTypes.ATOM_KEYS)) {
                processKeys(sequentialByteArrayReader);
                return this;
            }
            if (atom.type.equals("data")) {
                processData(bArr, sequentialByteArrayReader);
            }
        }
        return this;
    }

    public abstract void processData(byte[] bArr, SequentialByteArrayReader sequentialByteArrayReader);

    public abstract void processKeys(SequentialByteArrayReader sequentialByteArrayReader);

    @Override // com.drew.imaging.quicktime.QuickTimeHandler
    public boolean shouldAcceptAtom(Atom atom) {
        return atom.type.equals("hdlr") || atom.type.equals(QuickTimeAtomTypes.ATOM_KEYS) || atom.type.equals("data");
    }

    @Override // com.drew.imaging.quicktime.QuickTimeHandler
    public boolean shouldAcceptContainer(Atom atom) {
        return atom.type.equals("ilst");
    }
}
