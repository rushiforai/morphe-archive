package com.drew.metadata.mp4.media;

import com.drew.imaging.mp4.Mp4Handler;
import com.drew.lang.ByteArrayReader;
import com.drew.lang.ByteTrie;
import com.drew.lang.SequentialByteArrayReader;
import com.drew.metadata.Metadata;
import com.drew.metadata.exif.ExifReader;
import com.drew.metadata.iptc.IptcReader;
import com.drew.metadata.mp4.Mp4BoxTypes;
import com.drew.metadata.mp4.Mp4Context;
import com.drew.metadata.mp4.Mp4Directory;
import com.drew.metadata.photoshop.PhotoshopReader;
import com.drew.metadata.xmp.XmpReader;
import java.io.EOFException;
import java.nio.ByteBuffer;
import java.util.UUID;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class Mp4UuidBoxHandler extends Mp4Handler<Mp4UuidBoxDirectory> {
    private static final ByteTrie<UuidType> _uuidLookup;

    /* JADX INFO: renamed from: com.drew.metadata.mp4.media.Mp4UuidBoxHandler$1, reason: invalid class name */
    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$drew$metadata$mp4$media$Mp4UuidBoxHandler$UuidType;

        static {
            int[] iArr = new int[UuidType.values().length];
            $SwitchMap$com$drew$metadata$mp4$media$Mp4UuidBoxHandler$UuidType = iArr;
            try {
                iArr[UuidType.Exif.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$drew$metadata$mp4$media$Mp4UuidBoxHandler$UuidType[UuidType.IptcIim.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$drew$metadata$mp4$media$Mp4UuidBoxHandler$UuidType[UuidType.PhotoshopImageResources.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                $SwitchMap$com$drew$metadata$mp4$media$Mp4UuidBoxHandler$UuidType[UuidType.Xmp.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public enum UuidType {
        Unknown,
        Exif,
        PhotoshopImageResources,
        IptcIim,
        PiffTrackEncryptionBox,
        GeoJp2WorldFileBox,
        PiffSampleEncryptionBox,
        GeoJp2GeoTiffBox,
        Xmp,
        PiffProtectionSystemSpecificHeaderBox
    }

    static {
        ByteTrie<UuidType> byteTrie = new ByteTrie<>();
        _uuidLookup = byteTrie;
        byteTrie.setDefaultValue(UuidType.Unknown);
        byteTrie.addPath(UuidType.Exif, new byte[]{5, 55, -51, -85, -99, 12, 68, 49, -89, 42, -6, 86, 31, 42, 17, 62});
        byteTrie.addPath(UuidType.PhotoshopImageResources, new byte[]{44, 76, 1, 0, -123, 4, 64, -71, -96, 62, 86, 33, 72, -42, -33, -21});
        byteTrie.addPath(UuidType.IptcIim, new byte[]{51, -57, -92, -46, -72, 29, 71, 35, -96, -70, -15, -93, -32, -105, -83, 56});
        byteTrie.addPath(UuidType.PiffTrackEncryptionBox, new byte[]{-119, 116, -37, -50, 123, -25, 76, 81, -124, -7, 113, 72, -7, -120, 37, 84});
        byteTrie.addPath(UuidType.GeoJp2WorldFileBox, new byte[]{-106, -87, -15, -15, -36, -104, 64, 45, -89, -82, -42, -114, 52, 69, 24, 9});
        byteTrie.addPath(UuidType.PiffSampleEncryptionBox, new byte[]{-94, 57, 79, 82, 90, -101, 79, 20, -94, 68, 108, 66, 124, 100, -115, -12});
        byteTrie.addPath(UuidType.GeoJp2GeoTiffBox, new byte[]{-79, 75, -8, -67, 8, 61, 75, 67, -91, -82, -116, -41, -43, -90, -50, 3});
        byteTrie.addPath(UuidType.Xmp, new byte[]{-66, 122, -49, -53, -105, -87, 66, -24, -100, 113, -103, -108, -111, -29, -81, -84});
        byteTrie.addPath(UuidType.PiffProtectionSystemSpecificHeaderBox, new byte[]{-48, -118, 79, 24, 16, -13, 74, -126, -74, -56, 50, -40, -85, -95, -125, -45});
    }

    public Mp4UuidBoxHandler(Metadata metadata) {
        super(metadata);
    }

    private static String getUuid(byte[] bArr) {
        ByteBuffer byteBufferWrap = ByteBuffer.wrap(bArr);
        return new UUID(byteBufferWrap.getLong(), byteBufferWrap.getLong()).toString();
    }

    @Override // com.drew.imaging.mp4.Mp4Handler
    public final Mp4Directory getDirectory() {
        return new Mp4UuidBoxDirectory();
    }

    @Override // com.drew.imaging.mp4.Mp4Handler
    public final Mp4Handler<?> processBox(String str, byte[] bArr, long j, Mp4Context mp4Context) throws EOFException {
        if (bArr != null && bArr.length >= 16) {
            ByteTrie<UuidType> byteTrie = _uuidLookup;
            byteTrie.getClass();
            UuidType uuidTypeFind = byteTrie.find(bArr, 0, bArr.length);
            if (uuidTypeFind != null) {
                int i = AnonymousClass1.$SwitchMap$com$drew$metadata$mp4$media$Mp4UuidBoxHandler$UuidType[uuidTypeFind.ordinal()];
                if (i != 1) {
                    if (i == 2) {
                        new IptcReader().extract(new SequentialByteArrayReader(bArr, 16), this.metadata, bArr.length - 16, this.directory);
                        return this;
                    }
                    if (i == 3) {
                        new PhotoshopReader().extract(new SequentialByteArrayReader(bArr, 16), bArr.length - 16, this.metadata, this.directory);
                        return this;
                    }
                    if (i == 4) {
                        new XmpReader().extract(bArr, 16, bArr.length - 16, this.metadata, this.directory);
                        return this;
                    }
                    SequentialByteArrayReader sequentialByteArrayReader = new SequentialByteArrayReader(bArr, 0);
                    String uuid = getUuid(sequentialByteArrayReader.getBytes(16));
                    byte[] bytes = sequentialByteArrayReader.getBytes(sequentialByteArrayReader.available());
                    ((Mp4UuidBoxDirectory) this.directory).setString(Mp4UuidBoxDirectory.TAG_UUID.intValue(), uuid);
                    ((Mp4UuidBoxDirectory) this.directory).setByteArray(Mp4UuidBoxDirectory.TAG_USER_DATA.intValue(), bytes);
                    return this;
                }
                new ExifReader().extract(new ByteArrayReader(bArr, 16), this.metadata, 0, this.directory);
            }
        }
        return this;
    }

    @Override // com.drew.imaging.mp4.Mp4Handler
    public final boolean shouldAcceptBox(String str) {
        return str.equals(Mp4BoxTypes.BOX_USER_DEFINED);
    }

    @Override // com.drew.imaging.mp4.Mp4Handler
    public final boolean shouldAcceptContainer(String str) {
        return false;
    }

    @Override // com.drew.imaging.mp4.Mp4Handler
    public final Mp4UuidBoxDirectory getDirectory() {
        return new Mp4UuidBoxDirectory();
    }
}
