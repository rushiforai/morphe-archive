package com.drew.metadata.exif.makernotes;

import com.drew.metadata.MetadataException;
import com.drew.metadata.TagDescriptor;
import com.medium.android.profile.ui.premium.cfCC.mgKMENwrbHf;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class AppleRunTimeMakernoteDescriptor extends TagDescriptor<AppleRunTimeMakernoteDirectory> {
    public AppleRunTimeMakernoteDescriptor(AppleRunTimeMakernoteDirectory appleRunTimeMakernoteDirectory) {
        super(appleRunTimeMakernoteDirectory);
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        return i != 1 ? i != 4 ? super.getDescription(i) : getValueDescription() : getFlagsDescription();
    }

    public final String getValueDescription() {
        try {
            return String.format("%d seconds", Long.valueOf(((AppleRunTimeMakernoteDirectory) this._directory).getLong(4) / ((AppleRunTimeMakernoteDirectory) this._directory).getLong(3)));
        } catch (MetadataException unused) {
            return null;
        }
    }

    public final String getFlagsDescription() {
        try {
            int i = ((AppleRunTimeMakernoteDirectory) this._directory).getInt(1);
            StringBuilder sb = new StringBuilder();
            if ((i & 1) == 1) {
                sb.append("Valid");
            } else {
                sb.append("Invalid");
            }
            if ((i & 2) != 0) {
                sb.append(", rounded");
            }
            if ((i & 4) != 0) {
                sb.append(mgKMENwrbHf.fBTEdJEDYGe);
            }
            if ((i & 8) != 0) {
                sb.append(", negative infinity");
            }
            if ((i & 16) != 0) {
                sb.append(", indefinite");
            }
            return sb.toString();
        } catch (MetadataException unused) {
            return null;
        }
    }
}
