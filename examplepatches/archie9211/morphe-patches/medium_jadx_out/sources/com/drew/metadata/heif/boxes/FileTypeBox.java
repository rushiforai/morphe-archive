package com.drew.metadata.heif.boxes;

import com.drew.lang.SequentialReader;
import com.drew.metadata.heif.HeifDirectory;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class FileTypeBox extends Box {
    ArrayList<String> compatibleBrands;
    String majorBrand;
    long minorVersion;

    public FileTypeBox(SequentialReader sequentialReader, Box box) {
        super(box);
        this.majorBrand = sequentialReader.getString(4);
        this.minorVersion = sequentialReader.getUInt32();
        this.compatibleBrands = new ArrayList<>();
        for (int i = 16; i < this.size; i += 4) {
            this.compatibleBrands.add(sequentialReader.getString(4));
        }
    }

    public final void addMetadata(HeifDirectory heifDirectory) {
        heifDirectory.setString(1, this.majorBrand);
        heifDirectory.setLong(2, this.minorVersion);
        ArrayList<String> arrayList = this.compatibleBrands;
        heifDirectory.setObjectArray(3, (String[]) arrayList.toArray(new String[arrayList.size()]));
    }

    public final ArrayList<String> getCompatibleBrands() {
        return this.compatibleBrands;
    }
}
