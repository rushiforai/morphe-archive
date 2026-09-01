package com.drew.metadata.gif;

import com.drew.metadata.TagDescriptor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class GifAnimationDescriptor extends TagDescriptor<GifAnimationDirectory> {
    public GifAnimationDescriptor(GifAnimationDirectory gifAnimationDirectory) {
        super(gifAnimationDirectory);
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        return i != 1 ? super.getDescription(i) : getIterationCountDescription();
    }

    public final String getIterationCountDescription() {
        Integer integer = ((GifAnimationDirectory) this._directory).getInteger(1);
        if (integer == null) {
            return null;
        }
        if (integer.intValue() == 0) {
            return "Infinite";
        }
        if (integer.intValue() == 1) {
            return "Once";
        }
        if (integer.intValue() == 2) {
            return "Twice";
        }
        return integer.toString() + " times";
    }
}
