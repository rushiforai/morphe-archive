package com.drew.metadata.mov;

import com.drew.imaging.quicktime.QuickTimeHandler;
import com.drew.lang.DateUtil;
import com.drew.lang.SequentialByteArrayReader;
import com.drew.lang.SequentialReader;
import com.drew.metadata.Metadata;
import com.drew.metadata.mov.QuickTimeDirectory;
import com.drew.metadata.mov.atoms.Atom;
import com.drew.metadata.mov.media.QuickTimeMediaDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class QuickTimeMediaHandler<T extends QuickTimeDirectory> extends QuickTimeHandler<T> {
    public QuickTimeMediaHandler(Metadata metadata, QuickTimeContext quickTimeContext) {
        super(metadata);
        Long l = quickTimeContext.creationTime;
        if (l == null || quickTimeContext.modificationTime == null) {
            return;
        }
        this.directory.setObject(QuickTimeMediaDirectory.TAG_CREATION_TIME, DateUtil.get1Jan1904EpochDate(l.longValue()));
        this.directory.setObject(QuickTimeMediaDirectory.TAG_MODIFICATION_TIME, DateUtil.get1Jan1904EpochDate(quickTimeContext.modificationTime.longValue()));
    }

    public abstract String getMediaInformation();

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.drew.imaging.quicktime.QuickTimeHandler
    public final QuickTimeMediaHandler<?> processAtom(Atom atom, byte[] bArr, QuickTimeContext quickTimeContext) {
        if (bArr != null) {
            SequentialByteArrayReader sequentialByteArrayReader = new SequentialByteArrayReader(bArr, 0);
            if (atom.type.equals(getMediaInformation())) {
                processMediaInformation(sequentialByteArrayReader, atom);
                return this;
            }
            if (atom.type.equals("stsd")) {
                processSampleDescription(sequentialByteArrayReader, atom);
                return this;
            }
            if (atom.type.equals("stts")) {
                processTimeToSample(sequentialByteArrayReader, atom, quickTimeContext);
            }
        }
        return this;
    }

    public abstract void processMediaInformation(SequentialReader sequentialReader, Atom atom);

    public abstract void processSampleDescription(SequentialReader sequentialReader, Atom atom);

    public abstract void processTimeToSample(SequentialReader sequentialReader, Atom atom, QuickTimeContext quickTimeContext);

    @Override // com.drew.imaging.quicktime.QuickTimeHandler
    public final boolean shouldAcceptAtom(Atom atom) {
        return atom.type.equals(getMediaInformation()) || atom.type.equals("stsd") || atom.type.equals("stts");
    }

    @Override // com.drew.imaging.quicktime.QuickTimeHandler
    public final boolean shouldAcceptContainer(Atom atom) {
        return atom.type.equals("stbl") || atom.type.equals("minf") || atom.type.equals("gmhd") || atom.type.equals("tmcd");
    }

    @Override // com.drew.imaging.quicktime.QuickTimeHandler
    public final /* bridge */ /* synthetic */ QuickTimeHandler processAtom(Atom atom, byte[] bArr, QuickTimeContext quickTimeContext) {
        processAtom(atom, bArr, quickTimeContext);
        return this;
    }
}
