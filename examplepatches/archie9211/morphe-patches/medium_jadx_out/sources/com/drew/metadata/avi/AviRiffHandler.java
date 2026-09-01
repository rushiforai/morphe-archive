package com.drew.metadata.avi;

import com.drew.imaging.riff.RiffHandler;
import com.drew.lang.ByteArrayReader;
import com.drew.metadata.Metadata;
import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class AviRiffHandler implements RiffHandler {
    private final AviDirectory _directory;

    public AviRiffHandler(Metadata metadata) {
        AviDirectory aviDirectory = new AviDirectory();
        this._directory = aviDirectory;
        metadata.addDirectory(aviDirectory);
    }

    @Override // com.drew.imaging.riff.RiffHandler
    public final void addError(String str) {
        this._directory.addError(str);
    }

    @Override // com.drew.imaging.riff.RiffHandler
    public final void processChunk(String str, byte[] bArr) {
        try {
            if (!str.equals(AviDirectory.CHUNK_STREAM_HEADER)) {
                if (!str.equals(AviDirectory.CHUNK_MAIN_HEADER)) {
                    if (str.equals(AviDirectory.CHUNK_DATETIME_ORIGINAL)) {
                        String string = new ByteArrayReader(bArr, 0).getString(0, bArr.length, "ASCII");
                        if (string.length() == 26 && string.endsWith(String.valueOf(new char[]{'\n', 0}))) {
                            string = string.substring(0, 24);
                        }
                        this._directory.setObject(AviDirectory.TAG_DATETIME_ORIGINAL, string);
                        return;
                    }
                    return;
                }
                ByteArrayReader byteArrayReader = new ByteArrayReader(bArr, 0);
                byteArrayReader.setMotorolaByteOrder(false);
                int int32 = byteArrayReader.getInt32(24);
                int int322 = byteArrayReader.getInt32(32);
                int int323 = byteArrayReader.getInt32(36);
                this._directory.setInt(6, int322);
                this._directory.setInt(7, int323);
                this._directory.setInt(8, int32);
                return;
            }
            ByteArrayReader byteArrayReader2 = new ByteArrayReader(bArr, 0);
            byteArrayReader2.setMotorolaByteOrder(false);
            String str2 = new String(byteArrayReader2.getBytes(0, 4));
            String str3 = new String(byteArrayReader2.getBytes(4, 4));
            float float32 = byteArrayReader2.getFloat32(20);
            float float322 = byteArrayReader2.getFloat32(24);
            int int324 = byteArrayReader2.getInt32(32);
            if (!str2.equals("vids")) {
                if (!str2.equals("auds") || this._directory.containsTag(2)) {
                    return;
                }
                this._directory.setDouble(2, float322 / float32);
                return;
            }
            if (this._directory.containsTag(1)) {
                return;
            }
            float f = float322 / float32;
            this._directory.setDouble(1, f);
            double d = int324 / f;
            int i = (int) d;
            int iPow = i / ((int) Math.pow(60.0d, 2.0d));
            int iPow2 = (i / ((int) Math.pow(60.0d, 1.0d))) - (iPow * 60);
            this._directory.setObject(3, String.format("%1$02d:%2$02d:%3$02d", Integer.valueOf(iPow), Integer.valueOf(iPow2), Integer.valueOf((int) Math.round((d / Math.pow(60.0d, 0.0d)) - ((double) (iPow2 * 60))))));
            this._directory.setObject(4, str3);
        } catch (IOException e) {
            this._directory.addError(e.getMessage());
        }
    }

    @Override // com.drew.imaging.riff.RiffHandler
    public final boolean shouldAcceptChunk(String str) {
        return str.equals(AviDirectory.CHUNK_STREAM_HEADER) || str.equals(AviDirectory.CHUNK_MAIN_HEADER) || str.equals(AviDirectory.CHUNK_DATETIME_ORIGINAL);
    }

    @Override // com.drew.imaging.riff.RiffHandler
    public final boolean shouldAcceptList(String str) {
        return str.equals(AviDirectory.LIST_HEADER) || str.equals(AviDirectory.LIST_STREAM_HEADER) || str.equals(AviDirectory.FORMAT);
    }

    @Override // com.drew.imaging.riff.RiffHandler
    public final boolean shouldAcceptRiffIdentifier(String str) {
        return str.equals(AviDirectory.FORMAT);
    }
}
