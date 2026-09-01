package com.drew.metadata.mov.media;

import com.drew.lang.SequentialReader;
import com.drew.metadata.Metadata;
import com.drew.metadata.mov.QuickTimeContext;
import com.drew.metadata.mov.QuickTimeDirectory;
import com.drew.metadata.mov.QuickTimeMediaHandler;
import com.drew.metadata.mov.atoms.Atom;
import com.drew.metadata.mov.atoms.MusicSampleDescriptionAtom;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class QuickTimeMusicHandler extends QuickTimeMediaHandler<QuickTimeMusicDirectory> {
    public QuickTimeMusicHandler(Metadata metadata, QuickTimeContext quickTimeContext) {
        super(metadata, quickTimeContext);
    }

    @Override // com.drew.imaging.quicktime.QuickTimeHandler
    public final QuickTimeDirectory createDirectory() {
        return new QuickTimeMusicDirectory();
    }

    @Override // com.drew.metadata.mov.QuickTimeMediaHandler
    public final String getMediaInformation() {
        return null;
    }

    @Override // com.drew.metadata.mov.QuickTimeMediaHandler
    public final void processSampleDescription(SequentialReader sequentialReader, Atom atom) {
        new MusicSampleDescriptionAtom(sequentialReader, atom);
    }

    @Override // com.drew.imaging.quicktime.QuickTimeHandler
    public final QuickTimeMusicDirectory createDirectory() {
        return new QuickTimeMusicDirectory();
    }

    @Override // com.drew.metadata.mov.QuickTimeMediaHandler
    public final void processMediaInformation(SequentialReader sequentialReader, Atom atom) {
    }

    @Override // com.drew.metadata.mov.QuickTimeMediaHandler
    public final void processTimeToSample(SequentialReader sequentialReader, Atom atom, QuickTimeContext quickTimeContext) {
    }
}
