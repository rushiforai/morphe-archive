package com.drew.metadata.jpeg;

import com.drew.metadata.Directory;
import defpackage.ay0;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class HuffmanTablesDirectory extends Directory {
    public static final int TAG_NUMBER_OF_TABLES = 1;
    private static final HashMap<Integer, String> _tagNameMap;
    protected final List<HuffmanTable> tables = new ArrayList(4);
    static final byte[] TYPICAL_LUMINANCE_DC_LENGTHS = {0, 1, 5, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0};
    static final byte[] TYPICAL_LUMINANCE_DC_VALUES = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11};
    static final byte[] TYPICAL_CHROMINANCE_DC_LENGTHS = {0, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0};
    static final byte[] TYPICAL_CHROMINANCE_DC_VALUES = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11};
    static final byte[] TYPICAL_LUMINANCE_AC_LENGTHS = {0, 2, 1, 3, 3, 2, 4, 3, 5, 5, 4, 4, 0, 0, 1, 125};
    static final byte[] TYPICAL_LUMINANCE_AC_VALUES = {1, 2, 3, 0, 4, 17, 5, 18, 33, 49, 65, 6, 19, 81, 97, 7, 34, 113, 20, 50, -127, -111, -95, 8, 35, 66, -79, -63, 21, 82, -47, -16, 36, 51, 98, 114, -126, 9, 10, 22, 23, 24, 25, 26, 37, 38, 39, 40, 41, 42, 52, 53, 54, 55, 56, 57, 58, 67, 68, 69, 70, 71, 72, 73, 74, 83, 84, 85, 86, 87, 88, 89, 90, 99, 100, 101, 102, 103, 104, 105, 106, 115, 116, 117, 118, 119, 120, 121, 122, -125, -124, -123, -122, -121, -120, -119, -118, -110, -109, -108, -107, -106, -105, -104, -103, -102, -94, -93, -92, -91, -90, -89, -88, -87, -86, -78, -77, -76, -75, -74, -73, -72, -71, -70, -62, -61, -60, -59, -58, -57, -56, -55, -54, -46, -45, -44, -43, -42, -41, -40, -39, -38, -31, -30, -29, -28, -27, -26, -25, -24, -23, -22, -15, -14, -13, -12, -11, -10, -9, -8, -7, -6};
    static final byte[] TYPICAL_CHROMINANCE_AC_LENGTHS = {0, 2, 1, 2, 4, 4, 3, 4, 7, 5, 4, 4, 0, 1, 2, 119};
    static final byte[] TYPICAL_CHROMINANCE_AC_VALUES = {0, 1, 2, 3, 17, 4, 5, 33, 49, 6, 18, 65, 81, 7, 97, 113, 19, 34, 50, -127, 8, 20, 66, -111, -95, -79, -63, 9, 35, 51, 82, -16, 21, 98, 114, -47, 10, 22, 36, 52, -31, 37, -15, 23, 24, 25, 26, 38, 39, 40, 41, 42, 53, 54, 55, 56, 57, 58, 67, 68, 69, 70, 71, 72, 73, 74, 83, 84, 85, 86, 87, 88, 89, 90, 99, 100, 101, 102, 103, 104, 105, 106, 115, 116, 117, 118, 119, 120, 121, 122, -126, -125, -124, -123, -122, -121, -120, -119, -118, -110, -109, -108, -107, -106, -105, -104, -103, -102, -94, -93, -92, -91, -90, -89, -88, -87, -86, -78, -77, -76, -75, -74, -73, -72, -71, -70, -62, -61, -60, -59, -58, -57, -56, -55, -54, -46, -45, -44, -43, -42, -41, -40, -39, -38, -30, -29, -28, -27, -26, -25, -24, -23, -22, -14, -13, -12, -11, -10, -9, -8, -7, -6};

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static class HuffmanTable {
        private final byte[] _lengthBytes;
        private final HuffmanTableClass _tableClass;
        private final int _tableDestinationId;
        private final int _tableLength;
        private final byte[] _valueBytes;

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        public enum HuffmanTableClass {
            DC,
            AC,
            UNKNOWN;

            public static HuffmanTableClass typeOf(int i) {
                return i != 0 ? i != 1 ? UNKNOWN : AC : DC;
            }
        }

        public HuffmanTable(HuffmanTableClass huffmanTableClass, int i, byte[] bArr, byte[] bArr2) {
            if (bArr == null) {
                ay0.e("lengthBytes cannot be null.");
                throw null;
            }
            if (bArr2 == null) {
                ay0.e("valueBytes cannot be null.");
                throw null;
            }
            this._tableClass = huffmanTableClass;
            this._tableDestinationId = i;
            this._lengthBytes = bArr;
            this._valueBytes = bArr2;
            this._tableLength = bArr2.length + 17;
        }

        public final byte[] getLengthBytes() {
            byte[] bArr = this._lengthBytes;
            byte[] bArr2 = new byte[bArr.length];
            System.arraycopy(bArr, 0, bArr2, 0, bArr.length);
            return bArr2;
        }

        public final HuffmanTableClass getTableClass() {
            return this._tableClass;
        }

        public final int getTableDestinationId() {
            return this._tableDestinationId;
        }

        public final int getTableLength() {
            return this._tableLength;
        }

        public final byte[] getValueBytes() {
            byte[] bArr = this._valueBytes;
            byte[] bArr2 = new byte[bArr.length];
            System.arraycopy(bArr, 0, bArr2, 0, bArr.length);
            return bArr2;
        }

        public final boolean isOptimized() {
            return !isTypical();
        }

        public final boolean isTypical() {
            HuffmanTableClass huffmanTableClass = this._tableClass;
            return huffmanTableClass == HuffmanTableClass.DC ? (Arrays.equals(this._lengthBytes, HuffmanTablesDirectory.TYPICAL_LUMINANCE_DC_LENGTHS) && Arrays.equals(this._valueBytes, HuffmanTablesDirectory.TYPICAL_LUMINANCE_DC_VALUES)) || (Arrays.equals(this._lengthBytes, HuffmanTablesDirectory.TYPICAL_CHROMINANCE_DC_LENGTHS) && Arrays.equals(this._valueBytes, HuffmanTablesDirectory.TYPICAL_CHROMINANCE_DC_VALUES)) : huffmanTableClass == HuffmanTableClass.AC && ((Arrays.equals(this._lengthBytes, HuffmanTablesDirectory.TYPICAL_LUMINANCE_AC_LENGTHS) && Arrays.equals(this._valueBytes, HuffmanTablesDirectory.TYPICAL_LUMINANCE_AC_VALUES)) || (Arrays.equals(this._lengthBytes, HuffmanTablesDirectory.TYPICAL_CHROMINANCE_AC_LENGTHS) && Arrays.equals(this._valueBytes, HuffmanTablesDirectory.TYPICAL_CHROMINANCE_AC_VALUES)));
        }
    }

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        map.put(1, "Number of Tables");
    }

    public HuffmanTablesDirectory() {
        setDescriptor(new HuffmanTablesDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "Huffman";
    }

    public final int getNumberOfTables() {
        return getInt(1);
    }

    public final HuffmanTable getTable(int i) {
        return this.tables.get(i);
    }

    public final List<HuffmanTable> getTables() {
        return this.tables;
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }

    public final boolean isOptimized() {
        return !isTypical();
    }

    public final boolean isTypical() {
        if (this.tables.size() == 0) {
            return false;
        }
        Iterator<HuffmanTable> it2 = this.tables.iterator();
        while (it2.hasNext()) {
            if (!it2.next().isTypical()) {
                return false;
            }
        }
        return true;
    }
}
