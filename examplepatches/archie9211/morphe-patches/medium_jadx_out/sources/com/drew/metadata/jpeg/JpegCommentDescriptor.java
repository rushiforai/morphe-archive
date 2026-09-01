package com.drew.metadata.jpeg;

import com.drew.metadata.TagDescriptor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class JpegCommentDescriptor extends TagDescriptor<JpegCommentDirectory> {
    public JpegCommentDescriptor(JpegCommentDirectory jpegCommentDirectory) {
        super(jpegCommentDirectory);
    }

    public final String getJpegCommentDescription() {
        return ((JpegCommentDirectory) this._directory).getString(0);
    }
}
