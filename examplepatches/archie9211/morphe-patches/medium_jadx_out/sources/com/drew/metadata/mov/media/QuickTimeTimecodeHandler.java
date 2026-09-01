package com.drew.metadata.mov.media;

import com.drew.lang.SequentialReader;
import com.drew.metadata.Metadata;
import com.drew.metadata.mov.QuickTimeAtomTypes;
import com.drew.metadata.mov.QuickTimeContext;
import com.drew.metadata.mov.QuickTimeDirectory;
import com.drew.metadata.mov.QuickTimeMediaHandler;
import com.drew.metadata.mov.atoms.Atom;
import com.drew.metadata.mov.atoms.TimecodeInformationMediaAtom;
import com.drew.metadata.mov.atoms.TimecodeSampleDescriptionAtom;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class QuickTimeTimecodeHandler extends QuickTimeMediaHandler<QuickTimeTimecodeDirectory> {
    public QuickTimeTimecodeHandler(Metadata metadata, QuickTimeContext quickTimeContext) {
        super(metadata, quickTimeContext);
    }

    @Override // com.drew.imaging.quicktime.QuickTimeHandler
    public final QuickTimeDirectory createDirectory() {
        return new QuickTimeTimecodeDirectory();
    }

    @Override // com.drew.metadata.mov.QuickTimeMediaHandler
    public final String getMediaInformation() {
        return QuickTimeAtomTypes.ATOM_TIMECODE_MEDIA_INFO;
    }

    @Override // com.drew.metadata.mov.QuickTimeMediaHandler
    public final void processMediaInformation(SequentialReader sequentialReader, Atom atom) {
        new TimecodeInformationMediaAtom(sequentialReader, atom).addMetadata((QuickTimeTimecodeDirectory) this.directory);
    }

    @Override // com.drew.metadata.mov.QuickTimeMediaHandler
    public final void processSampleDescription(SequentialReader sequentialReader, Atom atom) {
        new TimecodeSampleDescriptionAtom(sequentialReader, atom).addMetadata((QuickTimeTimecodeDirectory) this.directory);
    }

    @Override // com.drew.imaging.quicktime.QuickTimeHandler
    public final QuickTimeTimecodeDirectory createDirectory() {
        return new QuickTimeTimecodeDirectory();
    }

    @Override // com.drew.metadata.mov.QuickTimeMediaHandler
    public final void processTimeToSample(SequentialReader sequentialReader, Atom atom, QuickTimeContext quickTimeContext) {
    }
}
