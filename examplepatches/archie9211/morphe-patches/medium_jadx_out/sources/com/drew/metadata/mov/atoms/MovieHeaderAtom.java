package com.drew.metadata.mov.atoms;

import com.drew.lang.DateUtil;
import com.drew.lang.Rational;
import com.drew.lang.SequentialReader;
import com.drew.metadata.mov.QuickTimeDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class MovieHeaderAtom extends FullAtom {
    private long creationTime;
    private long currentTime;
    private long duration;
    private int[] matrixStructure;
    private long modificationTime;
    private long nextTrackID;
    private long posterTime;
    private int preferredRate;
    private int preferredVolume;
    private long previewDuration;
    private long previewTime;
    private long selectionDuration;
    private long selectionTime;
    private long timescale;

    public MovieHeaderAtom(SequentialReader sequentialReader, Atom atom) {
        super(sequentialReader, atom);
        this.creationTime = sequentialReader.getUInt32();
        this.modificationTime = sequentialReader.getUInt32();
        this.timescale = sequentialReader.getUInt32();
        this.duration = sequentialReader.getUInt32();
        this.preferredRate = sequentialReader.getInt32();
        this.preferredVolume = sequentialReader.getInt16();
        sequentialReader.skip(10L);
        this.matrixStructure = new int[]{sequentialReader.getInt32(), sequentialReader.getInt32(), sequentialReader.getInt32(), sequentialReader.getInt32(), sequentialReader.getInt32(), sequentialReader.getInt32(), sequentialReader.getInt32(), sequentialReader.getInt32(), sequentialReader.getInt32()};
        this.previewTime = sequentialReader.getUInt32();
        this.previewDuration = sequentialReader.getUInt32();
        this.posterTime = sequentialReader.getUInt32();
        this.selectionTime = sequentialReader.getUInt32();
        this.selectionDuration = sequentialReader.getUInt32();
        this.currentTime = sequentialReader.getUInt32();
        this.nextTrackID = sequentialReader.getUInt32();
    }

    public final void addMetadata(QuickTimeDirectory quickTimeDirectory) {
        quickTimeDirectory.setObject(256, DateUtil.get1Jan1904EpochDate(this.creationTime));
        quickTimeDirectory.setObject(257, DateUtil.get1Jan1904EpochDate(this.modificationTime));
        quickTimeDirectory.setLong(259, this.duration);
        quickTimeDirectory.setLong(258, this.timescale);
        quickTimeDirectory.setObject(260, new Rational(this.duration, this.timescale));
        int i = this.preferredRate;
        quickTimeDirectory.setDouble(261, (((double) (i & 65535)) / 16.0d) + ((double) (((-65536) & i) >> 16)));
        int i2 = this.preferredVolume;
        quickTimeDirectory.setDouble(262, (((double) (i2 & 255)) / 8.0d) + ((double) ((65280 & i2) >> 8)));
        quickTimeDirectory.setLong(263, this.previewTime);
        quickTimeDirectory.setLong(264, this.previewDuration);
        quickTimeDirectory.setLong(265, this.posterTime);
        quickTimeDirectory.setLong(266, this.selectionTime);
        quickTimeDirectory.setLong(267, this.selectionDuration);
        quickTimeDirectory.setLong(268, this.currentTime);
        quickTimeDirectory.setLong(269, this.nextTrackID);
    }
}
