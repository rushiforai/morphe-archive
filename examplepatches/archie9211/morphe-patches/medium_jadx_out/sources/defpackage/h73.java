package defpackage;

import com.medium.proto.obv.post.DeltaType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class h73 {
    public static DeltaType a(int i) {
        if (i == 99) {
            return DeltaType.FAILURE;
        }
        switch (i) {
            case 1:
                return DeltaType.INSERT_PARAGRAPH_AT;
            case 2:
                return DeltaType.REMOVE_PARAGRAPH_AT;
            case 3:
                return DeltaType.UPDATE_PARAGRAPH_AT;
            case 4:
                return DeltaType.UPDATE_TITLE;
            case 5:
                return DeltaType.UPDATE_SUBTITLE;
            case 6:
                return DeltaType.UPDATE_IMAGE;
            case 7:
                return DeltaType.UPDATE_CAPTION;
            case 8:
                return DeltaType.INSERT_SECTION_AT;
            case 9:
                return DeltaType.REMOVE_SECTION_AT;
            case 10:
                return DeltaType.UPDATE_SECTION_AT;
            case 11:
                return DeltaType.REVERT;
            case 12:
                return DeltaType.PUBLISH;
            case 13:
                return DeltaType.UPDATE_POST_DISPLAY;
            case 14:
                return DeltaType.CLONE;
            case 15:
                return DeltaType.TRANSLATE;
            case 16:
                return DeltaType.THROTTLE;
            case 17:
                return DeltaType.PREDEFINED;
            case 18:
                return DeltaType.UPDATE_SELECTION;
            case 19:
                return DeltaType.UPDATE_META_DESCRIPTION;
            case 20:
                return DeltaType.UPDATE_PREVIEW_IMAGE;
            default:
                return null;
        }
    }
}
