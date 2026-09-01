package com.drew.metadata.mov.atoms;

import com.drew.lang.SequentialReader;
import com.drew.metadata.mov.QuickTimeDirectory;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class FileTypeCompatibilityAtom extends Atom {
    ArrayList<String> compatibleBrands;
    String majorBrand;
    long minorVersion;

    public FileTypeCompatibilityAtom(SequentialReader sequentialReader, Atom atom) {
        super(atom);
        this.majorBrand = sequentialReader.getString(4);
        this.minorVersion = sequentialReader.getUInt32();
        this.compatibleBrands = new ArrayList<>((int) ((this.size / 16) >> 2));
        for (int i = 16; i < this.size; i += 4) {
            this.compatibleBrands.add(sequentialReader.getString(4));
        }
    }

    public final void addMetadata(QuickTimeDirectory quickTimeDirectory) {
        quickTimeDirectory.setString(4096, this.majorBrand);
        quickTimeDirectory.setLong(4097, this.minorVersion);
        ArrayList<String> arrayList = this.compatibleBrands;
        quickTimeDirectory.setObjectArray(4098, (String[]) arrayList.toArray(new String[arrayList.size()]));
    }
}
