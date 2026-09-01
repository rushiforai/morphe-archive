package com.drew.metadata.heif;

import com.drew.imaging.heif.HeifHandler;
import com.drew.metadata.Metadata;
import com.drew.metadata.heif.boxes.HandlerBox;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class HeifHandlerFactory {
    private static final String HANDLER_PICTURE = "pict";
    private HeifHandler<?> caller;

    public HeifHandlerFactory(HeifHandler<?> heifHandler) {
        this.caller = heifHandler;
    }

    public final HeifHandler<?> getHandler(HandlerBox handlerBox, Metadata metadata) {
        return handlerBox.getHandlerType().equals(HANDLER_PICTURE) ? new HeifPictureHandler(metadata) : this.caller;
    }
}
