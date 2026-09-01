package com.drew.metadata.heif.boxes;

import com.drew.lang.Charsets;
import com.drew.lang.SequentialByteArrayReader;
import com.drew.lang.SequentialReader;
import com.drew.metadata.heif.HeifDirectory;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ItemInfoBox extends FullBox {
    Map<Long, ItemInfoEntry> entries;
    long entryCount;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static class ItemInfoEntry extends FullBox {
        String contentEncoding;
        String contentType;
        String extensionType;
        long itemID;
        String itemName;
        long itemProtectionIndex;
        String itemType;
        String itemUriType;

        public ItemInfoEntry(SequentialReader sequentialReader, Box box) {
            super(sequentialReader, box);
            int i = this.version;
            if (i == 0 || i == 1) {
                this.itemID = sequentialReader.getUInt16();
                this.itemProtectionIndex = sequentialReader.getUInt16();
                int position = (int) ((box.size - sequentialReader.getPosition()) - 8);
                Charset charset = Charsets.UTF_8;
                this.itemName = sequentialReader.getNullTerminatedString(position, charset, false);
                this.contentType = sequentialReader.getNullTerminatedString((int) ((box.size - sequentialReader.getPosition()) - 8), charset, false);
                if ((box.size - sequentialReader.getPosition()) - 8 > 0) {
                    this.extensionType = sequentialReader.getNullTerminatedString((int) ((box.size - sequentialReader.getPosition()) - 8), charset, false);
                }
            }
            if (this.version == 1 && box.size - 28 >= 4) {
                this.contentEncoding = sequentialReader.getString(4);
            }
            int i2 = this.version;
            if (i2 >= 2) {
                if (i2 == 2) {
                    this.itemID = sequentialReader.getUInt16();
                } else if (i2 == 3) {
                    this.itemID = sequentialReader.getUInt32();
                }
                this.itemProtectionIndex = sequentialReader.getUInt16();
                this.itemType = sequentialReader.getString(4);
                int position2 = (int) ((box.size - sequentialReader.getPosition()) - 8);
                Charset charset2 = Charsets.UTF_8;
                this.itemName = sequentialReader.getNullTerminatedString(position2, charset2, false);
                if (!this.itemType.equals("mime")) {
                    if (this.itemType.equals("uri ")) {
                        this.itemUriType = sequentialReader.getString((int) ((box.size - sequentialReader.getPosition()) - 8));
                    }
                } else {
                    this.contentType = sequentialReader.getNullTerminatedString((int) ((box.size - sequentialReader.getPosition()) - 8), charset2, false);
                    if ((box.size - sequentialReader.getPosition()) - 8 > 0) {
                        this.contentEncoding = sequentialReader.getNullTerminatedString((int) ((box.size - sequentialReader.getPosition()) - 8), charset2, false);
                    }
                }
            }
        }

        public final String getItemType() {
            return this.itemType;
        }
    }

    public ItemInfoBox(SequentialReader sequentialReader, Box box) {
        super(sequentialReader, box);
        if (this.version == 0) {
            this.entryCount = sequentialReader.getUInt16();
        } else {
            this.entryCount = sequentialReader.getUInt32();
        }
        this.entries = new HashMap();
        for (int i = 1; i <= this.entryCount; i++) {
            ItemInfoEntry itemInfoEntry = new ItemInfoEntry(new SequentialByteArrayReader(sequentialReader.getBytes(((int) r0.size) - 8), 0), new Box(sequentialReader));
            this.entries.put(Long.valueOf(itemInfoEntry.itemID), itemInfoEntry);
        }
    }

    public final ItemInfoEntry getEntry(long j) {
        return this.entries.get(Long.valueOf(j));
    }

    public final void addMetadata(HeifDirectory heifDirectory) {
    }
}
