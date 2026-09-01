package com.drew.metadata.mov.metadata;

import com.drew.imaging.quicktime.QuickTimeHandler;
import com.drew.lang.SequentialByteArrayReader;
import com.drew.metadata.Metadata;
import com.drew.metadata.mov.QuickTimeContext;
import com.drew.metadata.mov.QuickTimeMetadataHandler;
import com.drew.metadata.mov.atoms.Atom;
import java.io.EOFException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class QuickTimeDirectoryHandler extends QuickTimeMetadataHandler {
    private String currentData;

    public QuickTimeDirectoryHandler(Metadata metadata) {
        super(metadata);
    }

    @Override // com.drew.metadata.mov.QuickTimeMetadataHandler, com.drew.imaging.quicktime.QuickTimeHandler
    public final QuickTimeHandler<?> processAtom(Atom atom, byte[] bArr, QuickTimeContext quickTimeContext) throws EOFException {
        if (bArr == null) {
            if (QuickTimeMetadataDirectory._tagIntegerMap.containsKey(atom.type)) {
                this.currentData = atom.type;
                return this;
            }
            this.currentData = null;
            return this;
        }
        SequentialByteArrayReader sequentialByteArrayReader = new SequentialByteArrayReader(bArr, 0);
        if (!atom.type.equals("data") || this.currentData == null) {
            this.currentData = new String(sequentialByteArrayReader.getBytes(4));
            return this;
        }
        processData(bArr, sequentialByteArrayReader);
        return this;
    }

    @Override // com.drew.metadata.mov.QuickTimeMetadataHandler
    public final void processData(byte[] bArr, SequentialByteArrayReader sequentialByteArrayReader) throws EOFException {
        sequentialByteArrayReader.skip(8L);
        Object str = new String(sequentialByteArrayReader.getBytes(bArr.length - 8));
        Integer num = QuickTimeMetadataDirectory._tagIntegerMap.get(this.currentData);
        if (num != null) {
            this.directory.setObject(num.intValue(), str);
        }
    }

    @Override // com.drew.metadata.mov.QuickTimeMetadataHandler, com.drew.imaging.quicktime.QuickTimeHandler
    public final boolean shouldAcceptAtom(Atom atom) {
        return atom.type.equals("data");
    }

    @Override // com.drew.metadata.mov.QuickTimeMetadataHandler, com.drew.imaging.quicktime.QuickTimeHandler
    public final boolean shouldAcceptContainer(Atom atom) {
        return QuickTimeMetadataDirectory._tagIntegerMap.containsKey(atom.type) || atom.type.equals("ilst");
    }

    @Override // com.drew.metadata.mov.QuickTimeMetadataHandler
    public final void processKeys(SequentialByteArrayReader sequentialByteArrayReader) {
    }
}
