package com.drew.metadata.mov.metadata;

import com.drew.imaging.quicktime.QuickTimeHandler;
import com.drew.lang.ByteUtil;
import com.drew.lang.SequentialByteArrayReader;
import com.drew.metadata.Metadata;
import com.drew.metadata.mov.QuickTimeAtomTypes;
import com.drew.metadata.mov.QuickTimeContext;
import com.drew.metadata.mov.QuickTimeMetadataHandler;
import com.drew.metadata.mov.atoms.Atom;
import java.io.EOFException;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class QuickTimeDataHandler extends QuickTimeMetadataHandler {
    private int currentIndex;
    private ArrayList<String> keys;

    public QuickTimeDataHandler(Metadata metadata) {
        super(metadata);
        this.currentIndex = 0;
        this.keys = new ArrayList<>();
    }

    @Override // com.drew.metadata.mov.QuickTimeMetadataHandler, com.drew.imaging.quicktime.QuickTimeHandler
    public final QuickTimeHandler<?> processAtom(Atom atom, byte[] bArr, QuickTimeContext quickTimeContext) throws EOFException {
        if (bArr != null) {
            SequentialByteArrayReader sequentialByteArrayReader = new SequentialByteArrayReader(bArr, 0);
            if (atom.type.equals(QuickTimeAtomTypes.ATOM_KEYS)) {
                processKeys(sequentialByteArrayReader);
                return this;
            }
            if (atom.type.equals("data")) {
                processData(bArr, sequentialByteArrayReader);
                return this;
            }
        } else {
            int int32 = ByteUtil.getInt32(atom.type.getBytes(), 0, true);
            if (int32 > 0 && int32 < this.keys.size() + 1) {
                this.currentIndex = int32 - 1;
            }
        }
        return this;
    }

    @Override // com.drew.metadata.mov.QuickTimeMetadataHandler
    public final void processData(byte[] bArr, SequentialByteArrayReader sequentialByteArrayReader) throws EOFException {
        if (this.currentIndex >= this.keys.size()) {
            return;
        }
        int int32 = sequentialByteArrayReader.getInt32();
        sequentialByteArrayReader.skip(4L);
        Integer num = QuickTimeMetadataDirectory._tagIntegerMap.get(this.keys.get(this.currentIndex));
        if (num != null) {
            int length = bArr.length - 8;
            if (int32 == 1) {
                this.directory.setObject(num.intValue(), sequentialByteArrayReader.getString(length, "UTF-8"));
                return;
            }
            if (int32 != 27) {
                if (int32 == 30) {
                    int i = length / 4;
                    int[] iArr = new int[i];
                    for (int i2 = 0; i2 < i; i2++) {
                        iArr[i2] = sequentialByteArrayReader.getInt32();
                    }
                    this.directory.setObjectArray(num.intValue(), iArr);
                    return;
                }
                if (int32 != 13 && int32 != 14) {
                    if (int32 != 22) {
                        if (int32 != 23) {
                            return;
                        }
                        this.directory.setFloat(num.intValue(), sequentialByteArrayReader.getFloat32());
                        return;
                    } else {
                        byte[] bArr2 = new byte[4];
                        sequentialByteArrayReader.getBytes(bArr2, 4 - length, length);
                        this.directory.setInt(num.intValue(), new SequentialByteArrayReader(bArr2, 0).getInt32());
                        return;
                    }
                }
            }
            this.directory.setByteArray(num.intValue(), sequentialByteArrayReader.getBytes(length));
        }
    }

    @Override // com.drew.metadata.mov.QuickTimeMetadataHandler
    public final void processKeys(SequentialByteArrayReader sequentialByteArrayReader) throws EOFException {
        sequentialByteArrayReader.skip(4L);
        int int32 = sequentialByteArrayReader.getInt32();
        for (int i = 0; i < int32; i++) {
            int int322 = sequentialByteArrayReader.getInt32();
            if (int322 < 8) {
                this.directory.addError("Key size too small: " + int322);
                return;
            }
            sequentialByteArrayReader.skip(4L);
            this.keys.add(sequentialByteArrayReader.getString(int322 - 8, "UTF-8"));
        }
    }

    @Override // com.drew.metadata.mov.QuickTimeMetadataHandler, com.drew.imaging.quicktime.QuickTimeHandler
    public final boolean shouldAcceptAtom(Atom atom) {
        return atom.type.equals("hdlr") || atom.type.equals(QuickTimeAtomTypes.ATOM_KEYS) || atom.type.equals("data");
    }

    @Override // com.drew.metadata.mov.QuickTimeMetadataHandler, com.drew.imaging.quicktime.QuickTimeHandler
    public final boolean shouldAcceptContainer(Atom atom) {
        return atom.type.equals("ilst") || ByteUtil.getInt32(atom.type.getBytes(), 0, true) <= this.keys.size();
    }
}
