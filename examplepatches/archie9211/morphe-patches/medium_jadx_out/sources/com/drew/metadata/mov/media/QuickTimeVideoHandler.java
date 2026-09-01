package com.drew.metadata.mov.media;

import com.drew.lang.SequentialReader;
import com.drew.metadata.Metadata;
import com.drew.metadata.mov.QuickTimeContext;
import com.drew.metadata.mov.QuickTimeDirectory;
import com.drew.metadata.mov.QuickTimeMediaHandler;
import com.drew.metadata.mov.atoms.Atom;
import com.drew.metadata.mov.atoms.TimeToSampleAtom;
import com.drew.metadata.mov.atoms.VideoInformationMediaHeaderAtom;
import com.drew.metadata.mov.atoms.VideoSampleDescriptionAtom;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class QuickTimeVideoHandler extends QuickTimeMediaHandler<QuickTimeVideoDirectory> {
    public QuickTimeVideoHandler(Metadata metadata, QuickTimeContext quickTimeContext) {
        super(metadata, quickTimeContext);
    }

    @Override // com.drew.imaging.quicktime.QuickTimeHandler
    public final QuickTimeDirectory createDirectory() {
        return new QuickTimeVideoDirectory();
    }

    @Override // com.drew.metadata.mov.QuickTimeMediaHandler
    public final String getMediaInformation() {
        return "vmhd";
    }

    @Override // com.drew.metadata.mov.QuickTimeMediaHandler
    public final void processMediaInformation(SequentialReader sequentialReader, Atom atom) {
        new VideoInformationMediaHeaderAtom(sequentialReader, atom).addMetadata((QuickTimeVideoDirectory) this.directory);
    }

    @Override // com.drew.metadata.mov.QuickTimeMediaHandler
    public final void processSampleDescription(SequentialReader sequentialReader, Atom atom) {
        new VideoSampleDescriptionAtom(sequentialReader, atom).addMetadata((QuickTimeVideoDirectory) this.directory);
    }

    @Override // com.drew.metadata.mov.QuickTimeMediaHandler
    public final void processTimeToSample(SequentialReader sequentialReader, Atom atom, QuickTimeContext quickTimeContext) {
        new TimeToSampleAtom(sequentialReader, atom).addMetadata((QuickTimeVideoDirectory) this.directory, quickTimeContext);
    }

    @Override // com.drew.imaging.quicktime.QuickTimeHandler
    public final QuickTimeVideoDirectory createDirectory() {
        return new QuickTimeVideoDirectory();
    }
}
