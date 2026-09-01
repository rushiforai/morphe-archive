package com.drew.metadata.jfxx;

import com.drew.metadata.TagDescriptor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class JfxxDescriptor extends TagDescriptor<JfxxDirectory> {
    public JfxxDescriptor(JfxxDirectory jfxxDirectory) {
        super(jfxxDirectory);
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        return i != 5 ? super.getDescription(i) : getExtensionCodeDescription();
    }

    public final String getExtensionCodeDescription() {
        Integer integer = ((JfxxDirectory) this._directory).getInteger(5);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        if (iIntValue == 16) {
            return "Thumbnail coded using JPEG";
        }
        if (iIntValue == 17) {
            return "Thumbnail stored using 1 byte/pixel";
        }
        if (iIntValue == 19) {
            return "Thumbnail stored using 3 bytes/pixel";
        }
        return "Unknown extension code " + integer;
    }
}
