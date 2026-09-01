package com.drew.metadata.photoshop;

import com.drew.imaging.avi.hzjl.bPUi;
import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class PhotoshopDirectory extends Directory {
    public static final int TAG_ALPHA_CHANNELS = 1006;
    public static final int TAG_ALPHA_IDENTIFIERS = 1053;
    public static final int TAG_ALTERNATE_DUOTONE_COLORS = 1066;
    public static final int TAG_ALTERNATE_SPOT_COLORS = 1067;
    public static final int TAG_AUTO_SAVE_FILE_PATH = 1086;
    public static final int TAG_AUTO_SAVE_FORMAT = 1087;
    public static final int TAG_BACKGROUND_COLOR = 1010;
    public static final int TAG_BORDER_INFORMATION = 1009;
    public static final int TAG_CAPTION = 1008;
    public static final int TAG_CAPTION_DIGEST = 1061;
    public static final int TAG_CHANNELS_ROWS_COLUMNS_DEPTH_MODE = 1000;
    public static final int TAG_CLIPPING_PATH_NAME = 2999;
    public static final int TAG_COLOR_HALFTONING_INFORMATION = 1013;
    public static final int TAG_COLOR_SAMPLERS = 1073;
    public static final int TAG_COLOR_TRANSFER_FUNCTIONS = 1016;
    public static final int TAG_COPYRIGHT = 1034;
    public static final int TAG_COUNT_INFORMATION = 1080;
    public static final int TAG_DISPLAY_INFO = 1077;
    public static final int TAG_DISPLAY_INFO_OBSOLETE = 1007;
    public static final int TAG_DUOTONE_HALFTONING_INFORMATION = 1014;
    public static final int TAG_DUOTONE_IMAGE_INFORMATION = 1018;
    public static final int TAG_DUOTONE_TRANSFER_FUNCTIONS = 1017;
    public static final int TAG_EFFECTIVE_BLACK_AND_WHITE_VALUES = 1019;
    public static final int TAG_EFFECTS_VISIBLE = 1042;
    public static final int TAG_EPS_OPTIONS = 1021;
    public static final int TAG_EXIF_DATA_1 = 1058;
    public static final int TAG_EXIF_DATA_3 = 1059;
    public static final int TAG_GLOBAL_ALTITUDE = 1049;
    public static final int TAG_GLOBAL_ANGLE = 1037;
    public static final int TAG_GRAYSCALE_AND_MULTICHANNEL_HALFTONING_INFORMATION = 1012;
    public static final int TAG_GRAYSCALE_AND_MULTICHANNEL_TRANSFER_FUNCTION = 1015;
    public static final int TAG_GRID_AND_GUIDES_INFORMATION = 1032;
    public static final int TAG_HDR_TONING_INFO = 1070;
    public static final int TAG_ICC_PROFILE_BYTES = 1039;
    public static final int TAG_ICC_UNTAGGED_PROFILE = 1041;
    public static final int TAG_IMAGE_MODE_FOR_RAW_FORMAT_FILES = 1029;
    public static final int TAG_IMAGE_READY_7_ROLLOVER = 7003;
    public static final int TAG_IMAGE_READY_DATA_SETS = 7001;
    public static final int TAG_IMAGE_READY_ROLLOVER = 7004;
    public static final int TAG_IMAGE_READY_SAVE_LAYER_SETTINGS = 7005;
    public static final int TAG_IMAGE_READY_SELECTED_STATE = 7002;
    public static final int TAG_IMAGE_READY_VARIABLES_XML = 7000;
    public static final int TAG_IMAGE_READY_VERSION = 7006;
    public static final int TAG_INDEXED_COLOR_TABLE = 1003;
    public static final int TAG_INDEXED_COLOR_TABLE_COUNT = 1046;
    public static final int TAG_IPTC = 1028;
    public static final int TAG_JPEG_QUALITY = 1030;
    public static final int TAG_JUMP_TO_XPEP = 1052;
    public static final int TAG_LAYERS_GROUP_INFORMATION = 1026;
    public static final int TAG_LAYER_COMPS = 1065;
    public static final int TAG_LAYER_GROUPS_ENABLED_ID = 1072;
    public static final int TAG_LAYER_SELECTION_IDS = 1069;
    public static final int TAG_LAYER_STATE_INFORMATION = 1024;
    public static final int TAG_LIGHTROOM_WORKFLOW = 8000;
    public static final int TAG_MAC_NSPRINTINFO = 1084;
    public static final int TAG_MAC_PRINT_INFO = 1001;
    public static final int TAG_MEASUREMENT_SCALE = 1074;
    public static final int TAG_ONION_SKINS = 1078;
    public static final int TAG_ORIGIN_PATH_INFO = 3000;
    public static final int TAG_PATH_SELECTION_STATE = 1088;
    public static final int TAG_PIXEL_ASPECT_RATIO = 1064;
    public static final int TAG_PRINT_FLAGS = 1011;
    public static final int TAG_PRINT_FLAGS_INFO = 10000;
    public static final int TAG_PRINT_INFO = 1071;
    public static final int TAG_PRINT_INFO_2 = 1082;
    public static final int TAG_PRINT_SCALE = 1062;
    public static final int TAG_PRINT_STYLE = 1083;
    public static final int TAG_QUICK_MASK_INFORMATION = 1022;
    public static final int TAG_RESOLUTION_INFO = 1005;
    public static final int TAG_SEED_NUMBER = 1044;
    public static final int TAG_SHEET_DISCLOSURE = 1076;
    public static final int TAG_SLICES = 1050;
    public static final int TAG_SPOT_HALFTONE = 1043;
    public static final int TAG_THUMBNAIL = 1036;
    public static final int TAG_THUMBNAIL_OLD = 1033;
    public static final int TAG_TIMELINE_INFORMATION = 1075;
    public static final int TAG_TRANSPARENCY_INDEX = 1047;
    public static final int TAG_UNICODE_ALPHA_NAMES = 1045;
    public static final int TAG_URL = 1035;
    public static final int TAG_URL_LIST = 1054;
    public static final int TAG_VERSION = 1057;
    public static final int TAG_WATERMARK = 1040;
    public static final int TAG_WIN_DEVMODE = 1085;
    public static final int TAG_WORKFLOW_URL = 1051;
    public static final int TAG_XML = 1002;
    public static final int TAG_XMP_DATA = 1060;
    static final HashMap<Integer, String> _tagNameMap;

    public PhotoshopDirectory() {
        setDescriptor(new PhotoshopDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "Photoshop";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }

    public final byte[] getThumbnailBytes() {
        byte[] byteArray = getByteArray(TAG_THUMBNAIL);
        if (byteArray == null) {
            byteArray = getByteArray(TAG_THUMBNAIL_OLD);
        }
        if (byteArray == null || byteArray.length <= 28) {
            return null;
        }
        int length = byteArray.length - 28;
        byte[] bArr = new byte[length];
        System.arraycopy(byteArray, 28, bArr, 0, length);
        return bArr;
    }

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(TAG_CHANNELS_ROWS_COLUMNS_DEPTH_MODE, map, "Channels, Rows, Columns, Depth, Mode", TAG_MAC_PRINT_INFO, "Mac Print Info");
        lv8.x(TAG_XML, map, "XML Data", TAG_INDEXED_COLOR_TABLE, "Indexed Color Table");
        lv8.x(TAG_RESOLUTION_INFO, map, "Resolution Info", TAG_ALPHA_CHANNELS, "Alpha Channels");
        lv8.x(TAG_DISPLAY_INFO_OBSOLETE, map, "Display Info (Obsolete)", TAG_CAPTION, "Caption");
        lv8.x(TAG_BORDER_INFORMATION, map, "Border Information", TAG_BACKGROUND_COLOR, "Background Color");
        lv8.x(TAG_PRINT_FLAGS, map, bPUi.kUZAZ, TAG_GRAYSCALE_AND_MULTICHANNEL_HALFTONING_INFORMATION, "Grayscale and Multichannel Halftoning Information");
        lv8.x(TAG_COLOR_HALFTONING_INFORMATION, map, "Color Halftoning Information", TAG_DUOTONE_HALFTONING_INFORMATION, "Duotone Halftoning Information");
        lv8.x(TAG_GRAYSCALE_AND_MULTICHANNEL_TRANSFER_FUNCTION, map, "Grayscale and Multichannel Transfer Function", TAG_COLOR_TRANSFER_FUNCTIONS, "Color Transfer Functions");
        lv8.x(TAG_DUOTONE_TRANSFER_FUNCTIONS, map, "Duotone Transfer Functions", TAG_DUOTONE_IMAGE_INFORMATION, "Duotone Image Information");
        lv8.x(TAG_EFFECTIVE_BLACK_AND_WHITE_VALUES, map, "Effective Black and White Values", TAG_EPS_OPTIONS, "EPS Options");
        lv8.x(TAG_QUICK_MASK_INFORMATION, map, "Quick Mask Information", 1024, "Layer State Information");
        lv8.x(TAG_LAYERS_GROUP_INFORMATION, map, "Layers Group Information", 1028, "IPTC-NAA Record");
        lv8.x(1029, map, "Image Mode for Raw Format Files", 1030, "JPEG Quality");
        lv8.x(1032, map, "Grid and Guides Information", TAG_THUMBNAIL_OLD, "Photoshop 4.0 Thumbnail");
        lv8.x(TAG_COPYRIGHT, map, "Copyright Flag", TAG_URL, "URL");
        lv8.x(TAG_THUMBNAIL, map, "Thumbnail Data", 1037, "Global Angle");
        lv8.x(TAG_ICC_PROFILE_BYTES, map, "ICC Profile Bytes", 1040, "Watermark");
        lv8.x(TAG_ICC_UNTAGGED_PROFILE, map, "ICC Untagged Profile", 1042, "Effects Visible");
        lv8.x(1043, map, "Spot Halftone", TAG_SEED_NUMBER, "Seed Number");
        lv8.x(TAG_UNICODE_ALPHA_NAMES, map, "Unicode Alpha Names", TAG_INDEXED_COLOR_TABLE_COUNT, "Indexed Color Table Count");
        lv8.x(TAG_TRANSPARENCY_INDEX, map, "Transparency Index", TAG_GLOBAL_ALTITUDE, "Global Altitude");
        lv8.x(TAG_SLICES, map, "Slices", TAG_WORKFLOW_URL, "Workflow URL");
        lv8.x(TAG_JUMP_TO_XPEP, map, "Jump To XPEP", TAG_ALPHA_IDENTIFIERS, "Alpha Identifiers");
        lv8.x(TAG_URL_LIST, map, "URL List", TAG_VERSION, "Version Info");
        lv8.x(TAG_EXIF_DATA_1, map, "EXIF Data 1", TAG_EXIF_DATA_3, "EXIF Data 3");
        lv8.x(TAG_XMP_DATA, map, "XMP Data", TAG_CAPTION_DIGEST, "Caption Digest");
        lv8.x(TAG_PRINT_SCALE, map, "Print Scale", TAG_PIXEL_ASPECT_RATIO, "Pixel Aspect Ratio");
        lv8.x(TAG_LAYER_COMPS, map, "Layer Comps", TAG_ALTERNATE_DUOTONE_COLORS, "Alternate Duotone Colors");
        lv8.x(TAG_ALTERNATE_SPOT_COLORS, map, "Alternate Spot Colors", TAG_LAYER_SELECTION_IDS, "Layer Selection IDs");
        lv8.x(TAG_HDR_TONING_INFO, map, "HDR Toning Info", TAG_PRINT_INFO, "Print Info");
        lv8.x(TAG_LAYER_GROUPS_ENABLED_ID, map, "Layer Groups Enabled ID", TAG_COLOR_SAMPLERS, "Color Samplers");
        lv8.x(TAG_MEASUREMENT_SCALE, map, "Measurement Scale", TAG_TIMELINE_INFORMATION, "Timeline Information");
        lv8.x(TAG_SHEET_DISCLOSURE, map, "Sheet Disclosure", TAG_DISPLAY_INFO, "Display Info");
        lv8.x(TAG_ONION_SKINS, map, "Onion Skins", TAG_COUNT_INFORMATION, "Count information");
        lv8.x(TAG_PRINT_INFO_2, map, "Print Info 2", TAG_PRINT_STYLE, "Print Style");
        lv8.x(TAG_MAC_NSPRINTINFO, map, "Mac NSPrintInfo", TAG_WIN_DEVMODE, "Win DEVMODE");
        lv8.x(TAG_AUTO_SAVE_FILE_PATH, map, "Auto Save File Subpath", TAG_AUTO_SAVE_FORMAT, "Auto Save Format");
        lv8.x(TAG_PATH_SELECTION_STATE, map, "Subpath Selection State", TAG_CLIPPING_PATH_NAME, "Clipping Path Name");
        lv8.x(TAG_ORIGIN_PATH_INFO, map, "Origin Subpath Info", TAG_IMAGE_READY_VARIABLES_XML, "Image Ready Variables XML");
        lv8.x(TAG_IMAGE_READY_DATA_SETS, map, "Image Ready Data Sets", TAG_IMAGE_READY_SELECTED_STATE, "Image Ready Selected State");
        lv8.x(TAG_IMAGE_READY_7_ROLLOVER, map, "Image Ready 7 Rollover Expanded State", TAG_IMAGE_READY_ROLLOVER, "Image Ready Rollover Expanded State");
        lv8.x(TAG_IMAGE_READY_SAVE_LAYER_SETTINGS, map, "Image Ready Save Layer Settings", TAG_IMAGE_READY_VERSION, "Image Ready Version");
        lv8.x(TAG_LIGHTROOM_WORKFLOW, map, "Lightroom Workflow", TAG_PRINT_FLAGS_INFO, "Print Flags Information");
    }
}
