package com.drew.metadata.heif;

import com.drew.imaging.heif.HeifHandler;
import com.drew.lang.SequentialByteArrayReader;
import com.drew.lang.SequentialReader;
import com.drew.metadata.Metadata;
import com.drew.metadata.heif.boxes.Box;
import com.drew.metadata.heif.boxes.FileTypeBox;
import com.drew.metadata.heif.boxes.FullBox;
import com.drew.metadata.heif.boxes.HandlerBox;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class HeifBoxHandler extends HeifHandler<HeifDirectory> {
    HandlerBox handlerBox;
    private HeifHandlerFactory handlerFactory;

    public HeifBoxHandler(Metadata metadata) {
        super(metadata);
        this.handlerFactory = new HeifHandlerFactory(this);
    }

    private void processFileType(SequentialReader sequentialReader, Box box) {
        FileTypeBox fileTypeBox = new FileTypeBox(sequentialReader, box);
        fileTypeBox.addMetadata(this.directory);
        if (fileTypeBox.getCompatibleBrands().contains("mif1")) {
            return;
        }
        this.directory.addError("File Type Box does not contain required brand, mif1");
    }

    @Override // com.drew.imaging.heif.HeifHandler
    public final HeifDirectory getDirectory() {
        return new HeifDirectory();
    }

    @Override // com.drew.imaging.heif.HeifHandler
    public final HeifHandler<?> processBox(Box box, byte[] bArr) {
        if (bArr == null) {
            return this;
        }
        SequentialByteArrayReader sequentialByteArrayReader = new SequentialByteArrayReader(bArr, 0);
        if (box.type.equals("ftyp")) {
            processFileType(sequentialByteArrayReader, box);
            return this;
        }
        if (!box.type.equals("hdlr")) {
            return this;
        }
        HandlerBox handlerBox = new HandlerBox(sequentialByteArrayReader, box);
        this.handlerBox = handlerBox;
        return this.handlerFactory.getHandler(handlerBox, this.metadata);
    }

    @Override // com.drew.imaging.heif.HeifHandler
    public final void processContainer(Box box, SequentialReader sequentialReader) {
        if (box.type.equals("meta")) {
            new FullBox(sequentialReader, box);
        }
    }

    @Override // com.drew.imaging.heif.HeifHandler
    public final boolean shouldAcceptBox(Box box) {
        return Arrays.asList("ftyp", "hdlr", HeifBoxTypes.BOX_HVC1).contains(box.type);
    }

    @Override // com.drew.imaging.heif.HeifHandler
    public final boolean shouldAcceptContainer(Box box) {
        return box.type.equals("meta") || box.type.equals(HeifContainerTypes.BOX_IMAGE_PROPERTY) || box.type.equals(HeifContainerTypes.BOX_ITEM_PROPERTY);
    }
}
