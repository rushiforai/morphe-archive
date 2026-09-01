package com.drew.metadata.heif.boxes;

import com.drew.lang.SequentialReader;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ItemProtectionBox extends FullBox {
    int protectionCount;
    ArrayList<ProtectionSchemeInfoBox> protectionSchemes;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static class ProtectionSchemeInfoBox extends Box {

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        public class OriginalFormatBox extends Box {
            String dataFormat;

            public OriginalFormatBox(SequentialReader sequentialReader, Box box) {
                super(sequentialReader);
                this.dataFormat = sequentialReader.getString(4);
            }
        }

        public ProtectionSchemeInfoBox(SequentialReader sequentialReader, Box box) {
            super(box);
        }
    }

    public ItemProtectionBox(SequentialReader sequentialReader, Box box) {
        super(sequentialReader, box);
        this.protectionCount = sequentialReader.getUInt16();
        this.protectionSchemes = new ArrayList<>(this.protectionCount);
        for (int i = 1; i <= this.protectionCount; i++) {
            this.protectionSchemes.add(new ProtectionSchemeInfoBox(box));
        }
    }
}
