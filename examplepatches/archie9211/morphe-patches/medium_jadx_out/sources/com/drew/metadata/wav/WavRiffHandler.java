package com.drew.metadata.wav;

import com.drew.imaging.riff.RiffHandler;
import com.drew.lang.ByteArrayReader;
import com.drew.metadata.Metadata;
import com.drew.metadata.MetadataException;
import java.io.IOException;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class WavRiffHandler implements RiffHandler {
    private String _currentList = "";
    private final WavDirectory _directory;

    public WavRiffHandler(Metadata metadata) {
        WavDirectory wavDirectory = new WavDirectory();
        this._directory = wavDirectory;
        metadata.addDirectory(wavDirectory);
    }

    @Override // com.drew.imaging.riff.RiffHandler
    public final void addError(String str) {
        this._directory.addError(str);
    }

    @Override // com.drew.imaging.riff.RiffHandler
    public final void processChunk(String str, byte[] bArr) {
        try {
            if (!str.equals(WavDirectory.CHUNK_FORMAT)) {
                if (!str.equals("data")) {
                    HashMap<String, Integer> map = WavDirectory._tagIntegerMap;
                    if (map.containsKey(str)) {
                        this._directory.setObject(map.get(str).intValue(), new String(bArr).substring(0, bArr.length - 1));
                        return;
                    }
                    return;
                }
                try {
                    if (this._directory.containsTag(4)) {
                        double length = ((double) bArr.length) / this._directory.getDouble(4);
                        int i = (int) length;
                        int iPow = i / ((int) Math.pow(60.0d, 2.0d));
                        Integer numValueOf = Integer.valueOf(iPow);
                        int iPow2 = (i / ((int) Math.pow(60.0d, 1.0d))) - (iPow * 60);
                        this._directory.setObject(16, String.format("%1$02d:%2$02d:%3$02d", numValueOf, Integer.valueOf(iPow2), Integer.valueOf((int) Math.round((length / Math.pow(60.0d, 0.0d)) - ((double) (iPow2 * 60))))));
                        return;
                    }
                    return;
                } catch (MetadataException unused) {
                    this._directory.addError("Error calculating duration: bytes per second not found");
                    return;
                }
            }
            ByteArrayReader byteArrayReader = new ByteArrayReader(bArr, 0);
            byteArrayReader.setMotorolaByteOrder(false);
            short int16 = byteArrayReader.getInt16(0);
            short int162 = byteArrayReader.getInt16(2);
            int int32 = byteArrayReader.getInt32(4);
            int int322 = byteArrayReader.getInt32(8);
            short int163 = byteArrayReader.getInt16(12);
            if (int16 != 1) {
                HashMap<Integer, String> map2 = WavDirectory._audioEncodingMap;
                boolean zContainsKey = map2.containsKey(Integer.valueOf(int16));
                WavDirectory wavDirectory = this._directory;
                if (zContainsKey) {
                    wavDirectory.setString(1, map2.get(Integer.valueOf(int16)));
                } else {
                    wavDirectory.setObject(1, "Unknown");
                }
            } else {
                this._directory.setInt(6, byteArrayReader.getInt16(14));
                this._directory.setString(1, WavDirectory._audioEncodingMap.get(Integer.valueOf(int16)));
            }
            this._directory.setInt(2, int162);
            this._directory.setInt(3, int32);
            this._directory.setInt(4, int322);
            this._directory.setInt(5, int163);
        } catch (IOException e) {
            this._directory.addError(e.getMessage());
        }
    }

    @Override // com.drew.imaging.riff.RiffHandler
    public final boolean shouldAcceptChunk(String str) {
        if (str.equals(WavDirectory.CHUNK_FORMAT)) {
            return true;
        }
        return (this._currentList.equals(WavDirectory.LIST_INFO) && WavDirectory._tagIntegerMap.containsKey(str)) || str.equals("data");
    }

    @Override // com.drew.imaging.riff.RiffHandler
    public final boolean shouldAcceptList(String str) {
        if (str.equals(WavDirectory.LIST_INFO)) {
            this._currentList = WavDirectory.LIST_INFO;
            return true;
        }
        this._currentList = "";
        return false;
    }

    @Override // com.drew.imaging.riff.RiffHandler
    public final boolean shouldAcceptRiffIdentifier(String str) {
        return str.equals(WavDirectory.FORMAT);
    }
}
