package com.drew.metadata.plist;

import com.drew.lang.SequentialByteArrayReader;
import defpackage.ay0;
import defpackage.ik4;
import java.io.EOFException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class BplistReader {
    private static final byte[] BPLIST_HEADER = {98, 112, 108, 105, 115, 116, 48, 48};
    private static final String PLIST_DTD = "<!DOCTYPE plist PUBLIC \"-//Apple Computer//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">";

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static class PropertyListResults {
        private final List<Object> objects;
        private final Trailer trailer;

        public PropertyListResults(List<Object> list, Trailer trailer) {
            this.objects = list;
            this.trailer = trailer;
        }

        public final Set<Map.Entry<Byte, Byte>> getEntrySet() {
            Object obj = this.objects.get((int) this.trailer.topObject);
            if (obj instanceof Map) {
                return ((Map) obj).entrySet();
            }
            return null;
        }

        public final List<Object> getObjects() {
            return this.objects;
        }

        public final Trailer getTrailer() {
            return this.trailer;
        }

        public final String toXML() {
            StringBuilder sb = new StringBuilder("<?xml version=\"1.0\" encoding=\"UTF-8\"?><!DOCTYPE plist PUBLIC \"-//Apple Computer//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\"><plist version=\"1.0\">");
            Set<Map.Entry<Byte, Byte>> entrySet = getEntrySet();
            if (entrySet != null) {
                sb.append("<dict>");
                for (Map.Entry<Byte, Byte> entry : entrySet) {
                    sb.append("<key>");
                    sb.append((String) this.objects.get(entry.getKey().byteValue()));
                    sb.append("</key><integer>");
                    sb.append(this.objects.get(entry.getValue().byteValue()).toString());
                    sb.append("</integer>");
                }
                sb.append("</dict>");
            }
            sb.append("</plist>");
            return sb.toString();
        }
    }

    private static void handleData(int i, byte b, SequentialByteArrayReader sequentialByteArrayReader, ArrayList<Object> arrayList) throws EOFException {
        int uInt16 = b & 15;
        if (uInt16 == 15) {
            if (((sequentialByteArrayReader.getByte() >> 4) & 15) != 1) {
                ay0.e("Invalid size marker");
                return;
            }
            int iPow = (int) Math.pow(2.0d, 15 & r1);
            if (iPow == 1) {
                uInt16 = sequentialByteArrayReader.getByte();
            } else if (iPow == 2) {
                uInt16 = sequentialByteArrayReader.getUInt16();
            }
        }
        arrayList.add(i, sequentialByteArrayReader.getBytes(uInt16));
    }

    private static void handleDict(int i, byte b, SequentialByteArrayReader sequentialByteArrayReader, ArrayList<Object> arrayList) {
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        int i2 = b & 15;
        byte[] bArr = new byte[i2];
        for (int i3 = 0; i3 < i2; i3++) {
            bArr[i3] = sequentialByteArrayReader.getByte();
        }
        for (int i4 = 0; i4 < i2; i4++) {
            linkedHashMap.put(Byte.valueOf(bArr[i4]), Byte.valueOf(sequentialByteArrayReader.getByte()));
        }
        arrayList.add(i, linkedHashMap);
    }

    private static void handleInt(int i, byte b, SequentialByteArrayReader sequentialByteArrayReader, ArrayList<Object> arrayList) {
        int iPow = (int) Math.pow(2.0d, b & 15);
        if (iPow == 1) {
            arrayList.add(i, Byte.valueOf(sequentialByteArrayReader.getByte()));
            return;
        }
        if (iPow == 2) {
            arrayList.add(i, Integer.valueOf(sequentialByteArrayReader.getUInt16()));
        } else if (iPow == 4) {
            arrayList.add(i, Long.valueOf(sequentialByteArrayReader.getUInt32()));
        } else if (iPow == 8) {
            arrayList.add(i, Long.valueOf(sequentialByteArrayReader.getInt64()));
        }
    }

    public static boolean isValid(byte[] bArr) {
        if (bArr.length < BPLIST_HEADER.length) {
            return false;
        }
        int i = 0;
        while (true) {
            byte[] bArr2 = BPLIST_HEADER;
            if (i >= bArr2.length) {
                return true;
            }
            if (bArr[i] != bArr2[i]) {
                return false;
            }
            i++;
        }
    }

    public static PropertyListResults parse(byte[] bArr) throws IOException {
        if (!isValid(bArr)) {
            ay0.e("Input is not a bplist");
            return null;
        }
        ArrayList arrayList = new ArrayList();
        Trailer trailer = readTrailer(bArr);
        SequentialByteArrayReader sequentialByteArrayReader = new SequentialByteArrayReader(bArr, (int) (trailer.offsetTableOffset + trailer.topObject));
        int i = (int) trailer.numObjects;
        int[] iArr = new int[i];
        for (long j = 0; j < trailer.numObjects; j++) {
            byte b = trailer.offsetIntSize;
            if (b == 1) {
                iArr[(int) j] = sequentialByteArrayReader.getByte();
            } else if (b == 2) {
                iArr[(int) j] = sequentialByteArrayReader.getUInt16();
            }
        }
        for (int i2 = 0; i2 < i; i2++) {
            SequentialByteArrayReader sequentialByteArrayReader2 = new SequentialByteArrayReader(bArr, iArr[i2]);
            byte b2 = sequentialByteArrayReader2.getByte();
            int i3 = (b2 >> 4) & 15;
            if (i3 == 1) {
                handleInt(i2, b2, sequentialByteArrayReader2, arrayList);
            } else if (i3 == 13) {
                handleDict(i2, b2, sequentialByteArrayReader2, arrayList);
            } else if (i3 == 4) {
                handleData(i2, b2, sequentialByteArrayReader2, arrayList);
            } else {
                if (i3 != 5) {
                    ik4.g("Un-handled objectFormat encountered");
                    return null;
                }
                arrayList.add(i2, sequentialByteArrayReader2.getString(b2 & 15));
            }
        }
        return new PropertyListResults(arrayList, trailer);
    }

    private static Trailer readTrailer(byte[] bArr) throws EOFException {
        SequentialByteArrayReader sequentialByteArrayReader = new SequentialByteArrayReader(bArr, bArr.length - 32);
        sequentialByteArrayReader.skip(5L);
        sequentialByteArrayReader.skip(1L);
        Trailer trailer = new Trailer();
        trailer.offsetIntSize = sequentialByteArrayReader.getByte();
        trailer.objectRefSize = sequentialByteArrayReader.getByte();
        trailer.numObjects = sequentialByteArrayReader.getInt64();
        trailer.topObject = sequentialByteArrayReader.getInt64();
        trailer.offsetTableOffset = sequentialByteArrayReader.getInt64();
        return trailer;
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static class Trailer {
        public static final int STRUCT_SIZE = 32;
        long numObjects;
        byte objectRefSize;
        byte offsetIntSize;
        long offsetTableOffset;
        long topObject;

        private Trailer() {
        }

        public Trailer(AnonymousClass1 anonymousClass1) {
        }
    }
}
