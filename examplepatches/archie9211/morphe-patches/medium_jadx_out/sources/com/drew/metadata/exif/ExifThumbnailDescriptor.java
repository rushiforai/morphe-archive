package com.drew.metadata.exif;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ExifThumbnailDescriptor extends ExifDescriptorBase<ExifThumbnailDirectory> {
    public ExifThumbnailDescriptor(ExifThumbnailDirectory exifThumbnailDirectory) {
        super(exifThumbnailDirectory);
    }

    @Override // com.drew.metadata.exif.ExifDescriptorBase, com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        return i != 513 ? i != 514 ? super.getDescription(i) : getThumbnailLengthDescription() : getThumbnailOffsetDescription();
    }

    public final String getThumbnailLengthDescription() {
        String string = ((ExifThumbnailDirectory) this._directory).getString(514);
        if (string == null) {
            return null;
        }
        return string.concat(" bytes");
    }

    public final String getThumbnailOffsetDescription() {
        Integer adjustedThumbnailOffset = ((ExifThumbnailDirectory) this._directory).getAdjustedThumbnailOffset();
        if (adjustedThumbnailOffset == null) {
            return null;
        }
        return adjustedThumbnailOffset.intValue() + " bytes";
    }
}
