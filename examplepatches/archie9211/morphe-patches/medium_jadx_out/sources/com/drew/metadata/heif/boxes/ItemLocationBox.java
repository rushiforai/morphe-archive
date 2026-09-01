package com.drew.metadata.heif.boxes;

import com.drew.lang.SequentialReader;
import java.util.Comparator;
import java.util.SortedSet;
import java.util.TreeSet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ItemLocationBox extends FullBox {
    long baseOffset;
    int baseOffsetSize;
    int constructionMethod;
    int dataReferenceIndex;
    int extentCount;
    SortedSet<Extent> extents;
    int indexSize;
    long itemCount;
    long itemID;
    int lengthSize;
    int offsetSize;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static class Extent {
        Long index;
        long itemId;
        long length;
        long offset;

        public Extent(long j, Long l, long j2, long j3) {
            this.itemId = j;
            this.index = l;
            this.offset = j2;
            this.length = j3;
        }

        public final long getItemId() {
            return this.itemId;
        }

        public final long getLength() {
            return this.length;
        }

        public final long getOffset() {
            return this.offset;
        }
    }

    public ItemLocationBox(SequentialReader sequentialReader, Box box) {
        super(sequentialReader, box);
        this.extents = new TreeSet(new Comparator<Extent>() { // from class: com.drew.metadata.heif.boxes.ItemLocationBox.1
            @Override // java.util.Comparator
            public final int compare(Extent extent, Extent extent2) {
                long j = extent.offset;
                long j2 = extent2.offset;
                if (j < j2) {
                    return -1;
                }
                return j == j2 ? 0 : 1;
            }
        });
        short uInt8 = sequentialReader.getUInt8();
        this.offsetSize = (uInt8 & 240) >> 4;
        this.lengthSize = uInt8 & 15;
        short uInt82 = sequentialReader.getUInt8();
        this.baseOffsetSize = (uInt82 & 240) >> 4;
        int i = this.version;
        if (i == 1 || i == 2) {
            this.indexSize = uInt82 & 15;
        }
        if (i < 2) {
            this.itemCount = sequentialReader.getUInt16();
        } else if (i == 2) {
            this.itemCount = sequentialReader.getUInt32();
        }
        int i2 = 0;
        while (i2 < this.itemCount) {
            int i3 = this.version;
            if (i3 < 2) {
                this.itemID = sequentialReader.getUInt16();
            } else if (i3 == 2) {
                this.itemID = sequentialReader.getUInt32();
            }
            int i4 = this.version;
            if (i4 == 1 || i4 == 2) {
                this.constructionMethod = sequentialReader.getUInt16() & 15;
            }
            this.dataReferenceIndex = sequentialReader.getUInt16();
            int i5 = this.baseOffsetSize;
            if (i5 == 4) {
                this.baseOffset = sequentialReader.getInt32();
            } else if (i5 == 8) {
                this.baseOffset = sequentialReader.getInt64();
            } else {
                this.baseOffset = 0L;
            }
            this.extentCount = sequentialReader.getUInt16();
            Long intFromUnknownByte = null;
            int i6 = 0;
            while (i6 < this.extentCount) {
                int i7 = this.version;
                if (i7 == 1 || (i7 == 2 && this.indexSize > 0)) {
                    intFromUnknownByte = getIntFromUnknownByte(this.indexSize, sequentialReader);
                }
                Long l = intFromUnknownByte;
                this.extents.add(new Extent(this.itemID, l, getIntFromUnknownByte(this.offsetSize, sequentialReader).longValue() + this.baseOffset, getIntFromUnknownByte(this.lengthSize, sequentialReader).longValue()));
                i6++;
                intFromUnknownByte = l;
                i2 = i2;
            }
            i2++;
        }
    }

    public final SortedSet<Extent> getExtents() {
        return this.extents;
    }

    public final Long getIntFromUnknownByte(int i, SequentialReader sequentialReader) {
        if (i == 1) {
            return Long.valueOf(sequentialReader.getUInt8());
        }
        if (i == 2) {
            return Long.valueOf(sequentialReader.getUInt16());
        }
        if (i == 4) {
            return Long.valueOf(sequentialReader.getUInt32());
        }
        if (i != 8) {
            return null;
        }
        return Long.valueOf(sequentialReader.getInt64());
    }
}
