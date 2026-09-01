package com.drew.metadata.mp4;

import com.drew.imaging.mp4.Mp4Handler;
import com.drew.lang.DateUtil;
import com.drew.lang.Rational;
import com.drew.lang.SequentialByteArrayReader;
import com.drew.lang.SequentialReader;
import com.drew.metadata.Metadata;
import com.drew.metadata.mp4.media.Mp4HintHandler;
import com.drew.metadata.mp4.media.Mp4MetaHandler;
import com.drew.metadata.mp4.media.Mp4SoundHandler;
import com.drew.metadata.mp4.media.Mp4TextHandler;
import com.drew.metadata.mp4.media.Mp4UuidBoxHandler;
import com.drew.metadata.mp4.media.Mp4VideoHandler;
import java.io.EOFException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class Mp4BoxHandler extends Mp4Handler<Mp4Directory> {
    private static final Pattern COORDINATE_PATTERN = Pattern.compile("([+-]\\d+\\.\\d+)([+-]\\d+\\.\\d+)");

    public Mp4BoxHandler(Metadata metadata) {
        super(metadata);
    }

    private void processFileType(SequentialReader sequentialReader, long j) {
        Object string = sequentialReader.getString(4);
        long uInt32 = sequentialReader.getUInt32();
        ArrayList arrayList = new ArrayList();
        for (int i = 16; i < j; i += 4) {
            arrayList.add(sequentialReader.getString(4));
        }
        this.directory.setObject(1, string);
        this.directory.setLong(2, uInt32);
        this.directory.setObjectArray(3, (String[]) arrayList.toArray(new String[arrayList.size()]));
    }

    private void processMediaHeader(SequentialReader sequentialReader, Mp4Context mp4Context) {
        short uInt8 = sequentialReader.getUInt8();
        sequentialReader.skip(3L);
        if (uInt8 == 1) {
            mp4Context.creationTime = Long.valueOf(sequentialReader.getInt64());
            mp4Context.modificationTime = Long.valueOf(sequentialReader.getInt64());
            mp4Context.timeScale = Long.valueOf(sequentialReader.getInt32());
            mp4Context.duration = Long.valueOf(sequentialReader.getInt64());
        } else {
            mp4Context.creationTime = Long.valueOf(sequentialReader.getUInt32());
            mp4Context.modificationTime = Long.valueOf(sequentialReader.getUInt32());
            mp4Context.timeScale = Long.valueOf(sequentialReader.getUInt32());
            mp4Context.duration = Long.valueOf(sequentialReader.getUInt32());
        }
        short int16 = sequentialReader.getInt16();
        mp4Context.language = new String(new char[]{(char) (((int16 & 31744) >> 10) + 96), (char) (((int16 & 992) >> 5) + 96), (char) ((int16 & 31) + 96)});
    }

    private void processMovieHeader(SequentialReader sequentialReader) {
        long uInt32;
        long uInt322;
        long uInt323;
        long uInt324;
        short uInt8 = sequentialReader.getUInt8();
        sequentialReader.skip(3L);
        if (uInt8 == 1) {
            uInt32 = sequentialReader.getInt64();
            uInt322 = sequentialReader.getInt64();
            uInt323 = sequentialReader.getUInt32();
            uInt324 = sequentialReader.getInt64();
        } else {
            uInt32 = sequentialReader.getUInt32();
            uInt322 = sequentialReader.getUInt32();
            uInt323 = sequentialReader.getUInt32();
            uInt324 = sequentialReader.getUInt32();
        }
        int int32 = sequentialReader.getInt32();
        short int16 = sequentialReader.getInt16();
        sequentialReader.skip(2L);
        sequentialReader.skip(8L);
        Object obj = {sequentialReader.getInt32(), sequentialReader.getInt32(), sequentialReader.getInt32(), sequentialReader.getInt32(), sequentialReader.getInt32(), sequentialReader.getInt32(), sequentialReader.getInt32(), sequentialReader.getInt32(), sequentialReader.getInt32()};
        sequentialReader.skip(24L);
        long uInt325 = sequentialReader.getUInt32();
        this.directory.setObject(256, DateUtil.get1Jan1904EpochDate(uInt32));
        this.directory.setObject(257, DateUtil.get1Jan1904EpochDate(uInt322));
        this.directory.setLong(259, uInt324);
        this.directory.setLong(258, uInt323);
        this.directory.setObject(260, new Rational(uInt324, uInt323));
        this.directory.setObjectArray(271, obj);
        this.directory.setDouble(261, ((double) (((-65536) & int32) >> 16)) + (((double) (65535 & int32)) / Math.pow(2.0d, 4.0d)));
        this.directory.setDouble(262, ((double) ((65280 & int16) >> 8)) + (((double) (int16 & 255)) / Math.pow(2.0d, 2.0d)));
        this.directory.setLong(270, uInt325);
    }

    private void processTrackHeader(SequentialReader sequentialReader) {
        short uInt8 = sequentialReader.getUInt8();
        sequentialReader.skip(3L);
        if (uInt8 == 1) {
            sequentialReader.getInt64();
            sequentialReader.getInt64();
            sequentialReader.getInt32();
            sequentialReader.skip(4L);
            sequentialReader.getInt64();
        } else {
            sequentialReader.getUInt32();
            sequentialReader.getUInt32();
            sequentialReader.getUInt32();
            sequentialReader.skip(4L);
            sequentialReader.getUInt32();
        }
        sequentialReader.skip(8L);
        sequentialReader.getInt16();
        sequentialReader.getInt16();
        sequentialReader.getInt16();
        sequentialReader.skip(2L);
        int[] iArr = new int[9];
        for (int i = 0; i < 9; i++) {
            iArr[i] = sequentialReader.getInt32();
        }
        long int32 = sequentialReader.getInt32();
        long int322 = sequentialReader.getInt32();
        if (int32 == 0 || int322 == 0 || this.directory.getDoubleObject(512) != null) {
            return;
        }
        this.directory.setDouble(512, Math.toDegrees(Math.atan2(iArr[0] + iArr[3], iArr[1] + iArr[4])) - 45.0d);
    }

    private void processUserData(SequentialReader sequentialReader, int i) {
        String string = null;
        while (sequentialReader.getPosition() < i) {
            long uInt32 = sequentialReader.getUInt32();
            if (uInt32 <= 4) {
                break;
            }
            if (sequentialReader.getInt32() == -1451722374) {
                int uInt16 = sequentialReader.getUInt16();
                sequentialReader.skip(2L);
                string = sequentialReader.getString(uInt16, "UTF-8");
            } else if (uInt32 < 8) {
                return;
            } else {
                sequentialReader.skip(uInt32 - 8);
            }
        }
        if (string != null) {
            Matcher matcher = COORDINATE_PATTERN.matcher(string);
            if (matcher.find()) {
                double d = Double.parseDouble(matcher.group(1));
                double d2 = Double.parseDouble(matcher.group(2));
                this.directory.setDouble(8193, d);
                this.directory.setDouble(8194, d2);
            }
        }
    }

    @Override // com.drew.imaging.mp4.Mp4Handler
    public final Mp4Directory getDirectory() {
        return new Mp4Directory();
    }

    @Override // com.drew.imaging.mp4.Mp4Handler
    public final Mp4Handler<?> processBox(String str, byte[] bArr, long j, Mp4Context mp4Context) throws EOFException {
        if (bArr != null) {
            SequentialByteArrayReader sequentialByteArrayReader = new SequentialByteArrayReader(bArr, 0);
            if (str.equals("mvhd")) {
                processMovieHeader(sequentialByteArrayReader);
                return this;
            }
            if (str.equals("ftyp")) {
                processFileType(sequentialByteArrayReader, j);
                return this;
            }
            if (str.equals("hdlr")) {
                sequentialByteArrayReader.skip(4L);
                sequentialByteArrayReader.skip(4L);
                String string = sequentialByteArrayReader.getString(4);
                sequentialByteArrayReader.skip(12L);
                sequentialByteArrayReader.getNullTerminatedString(((int) j) - 32, Charset.defaultCharset(), false);
                if (string.equals("soun")) {
                    return new Mp4SoundHandler(this.metadata, mp4Context);
                }
                if (string.equals("vide")) {
                    return new Mp4VideoHandler(this.metadata, mp4Context);
                }
                if (string.equals("hint")) {
                    return new Mp4HintHandler(this.metadata, mp4Context);
                }
                if (string.equals("text")) {
                    return new Mp4TextHandler(this.metadata, mp4Context);
                }
                if (string.equals("meta")) {
                    return new Mp4MetaHandler(this.metadata, mp4Context);
                }
            } else {
                if (str.equals("mdhd")) {
                    processMediaHeader(sequentialByteArrayReader, mp4Context);
                    return this;
                }
                if (str.equals("tkhd")) {
                    processTrackHeader(sequentialByteArrayReader);
                    return this;
                }
                if (str.equals(Mp4BoxTypes.BOX_USER_DEFINED)) {
                    new Mp4UuidBoxHandler(this.metadata).processBox(str, bArr, j, mp4Context);
                    return this;
                }
                if (str.equals("udta")) {
                    processUserData(sequentialByteArrayReader, bArr.length);
                    return this;
                }
            }
        } else if (str.equals("cmov")) {
            this.directory.addError("Compressed MP4 movies not supported");
        }
        return this;
    }

    @Override // com.drew.imaging.mp4.Mp4Handler
    public final boolean shouldAcceptBox(String str) {
        return str.equals("ftyp") || str.equals("mvhd") || str.equals("hdlr") || str.equals("mdhd") || str.equals("tkhd") || str.equals("udta") || str.equals(Mp4BoxTypes.BOX_USER_DEFINED);
    }

    @Override // com.drew.imaging.mp4.Mp4Handler
    public final boolean shouldAcceptContainer(String str) {
        return str.equals("trak") || str.equals("meta") || str.equals("moov") || str.equals("mdia");
    }
}
