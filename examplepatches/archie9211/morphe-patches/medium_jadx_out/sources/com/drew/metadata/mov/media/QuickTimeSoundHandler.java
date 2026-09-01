package com.drew.metadata.mov.media;

import com.drew.lang.SequentialReader;
import com.drew.metadata.Metadata;
import com.drew.metadata.mov.QuickTimeContext;
import com.drew.metadata.mov.QuickTimeDirectory;
import com.drew.metadata.mov.QuickTimeMediaHandler;
import com.drew.metadata.mov.atoms.Atom;
import com.drew.metadata.mov.atoms.SoundInformationMediaHeaderAtom;
import com.drew.metadata.mov.atoms.SoundSampleDescriptionAtom;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class QuickTimeSoundHandler extends QuickTimeMediaHandler<QuickTimeSoundDirectory> {
    public QuickTimeSoundHandler(Metadata metadata, QuickTimeContext quickTimeContext) {
        super(metadata, quickTimeContext);
    }

    @Override // com.drew.imaging.quicktime.QuickTimeHandler
    public final QuickTimeDirectory createDirectory() {
        return new QuickTimeSoundDirectory();
    }

    @Override // com.drew.metadata.mov.QuickTimeMediaHandler
    public final String getMediaInformation() {
        return "smhd";
    }

    @Override // com.drew.metadata.mov.QuickTimeMediaHandler
    public final void processMediaInformation(SequentialReader sequentialReader, Atom atom) {
        new SoundInformationMediaHeaderAtom(sequentialReader, atom).addMetadata((QuickTimeSoundDirectory) this.directory);
    }

    @Override // com.drew.metadata.mov.QuickTimeMediaHandler
    public final void processSampleDescription(SequentialReader sequentialReader, Atom atom) {
        new SoundSampleDescriptionAtom(sequentialReader, atom).addMetadata((QuickTimeSoundDirectory) this.directory);
    }

    @Override // com.drew.metadata.mov.QuickTimeMediaHandler
    public final void processTimeToSample(SequentialReader sequentialReader, Atom atom, QuickTimeContext quickTimeContext) {
        if (quickTimeContext.timeScale != null) {
            ((QuickTimeSoundDirectory) this.directory).setDouble(772, r1.longValue());
        }
    }

    @Override // com.drew.imaging.quicktime.QuickTimeHandler
    public final QuickTimeSoundDirectory createDirectory() {
        return new QuickTimeSoundDirectory();
    }
}
