package com.drew.metadata.mov.metadata;

import com.drew.imaging.avi.hzjl.bPUi;
import com.drew.metadata.exif.makernotes.LeicaType5MakernoteDirectory;
import com.drew.metadata.exif.makernotes.OlympusCameraSettingsMakernoteDirectory;
import com.drew.metadata.mov.QuickTimeDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import defpackage.ho2;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class QuickTimeMetadataDirectory extends QuickTimeDirectory {
    public static final int TAG_ALBUM = 1280;
    public static final int TAG_ARTIST = 1281;
    public static final int TAG_ARTWORK = 1282;
    public static final int TAG_AUTHOR = 1283;
    public static final int TAG_COLLECTION_USER = 1298;
    public static final int TAG_COMMENT = 1284;
    public static final int TAG_CONTENT_IDENTIFIER = 1308;
    public static final int TAG_COPYRIGHT = 1285;
    public static final int TAG_CREATION_DATE = 1286;
    public static final int TAG_DESCRIPTION = 1287;
    public static final int TAG_DIRECTION_FACING = 1305;
    public static final int TAG_DIRECTION_MOTION = 1306;
    public static final int TAG_DIRECTOR = 1288;
    public static final int TAG_DISPLAY_NAME = 1307;
    public static final int TAG_GENRE = 1290;
    public static final int TAG_INFORMATION = 1291;
    public static final int TAG_KEYWORDS = 1292;
    public static final int TAG_LOCATION_BODY = 1301;
    public static final int TAG_LOCATION_DATE = 1304;
    public static final int TAG_LOCATION_ISO6709 = 1293;
    public static final int TAG_LOCATION_NAME = 1300;
    public static final int TAG_LOCATION_NOTE = 1302;
    public static final int TAG_LOCATION_ROLE = 1303;
    public static final int TAG_MAKE = 1309;
    public static final int TAG_MODEL = 1310;
    public static final int TAG_ORIGINATING_SIGNATURE = 1311;
    public static final int TAG_PIXEL_DENSITY = 1312;
    public static final int TAG_PRODUCER = 1294;
    public static final int TAG_PUBLISHER = 1295;
    public static final int TAG_RATING_USER = 1299;
    public static final int TAG_SOFTWARE = 1296;
    public static final int TAG_TITLE = 1289;
    public static final int TAG_YEAR = 1297;
    static final HashMap<String, Integer> _tagIntegerMap;
    private static final HashMap<Integer, String> _tagNameMap;

    public QuickTimeMetadataDirectory() {
        setDescriptor(new QuickTimeMetadataDescriptor(this));
    }

    @Override // com.drew.metadata.mov.QuickTimeDirectory, com.drew.metadata.Directory
    public final String getName() {
        return "QuickTime Metadata";
    }

    @Override // com.drew.metadata.mov.QuickTimeDirectory, com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        HashMap<String, Integer> map2 = new HashMap<>();
        _tagIntegerMap = map2;
        map2.put("com.apple.quicktime.album", 1280);
        map2.put("com.apple.quicktime.artist", 1281);
        map2.put("com.apple.quicktime.artwork", 1282);
        map2.put("com.apple.quicktime.author", 1283);
        map2.put("com.apple.quicktime.comment", 1284);
        map2.put("com.apple.quicktime.copyright", 1285);
        map2.put("com.apple.quicktime.creationdate", 1286);
        map2.put("com.apple.quicktime.description", 1287);
        Integer numValueOf = Integer.valueOf(TAG_DIRECTOR);
        map2.put("com.apple.quicktime.director", numValueOf);
        map2.put("com.apple.quicktime.title", 1289);
        map2.put("com.apple.quicktime.genre", 1290);
        map2.put("com.apple.quicktime.information", 1291);
        map2.put("com.apple.quicktime.keywords", 1292);
        map2.put("com.apple.quicktime.location.ISO6709", 1293);
        Integer numValueOf2 = Integer.valueOf(TAG_PRODUCER);
        map2.put("com.apple.quicktime.producer", numValueOf2);
        map2.put("com.apple.quicktime.publisher", 1295);
        ho2.M(TAG_SOFTWARE, map2, "com.apple.quicktime.software", TAG_YEAR, "com.apple.quicktime.year");
        ho2.M(TAG_COLLECTION_USER, map2, "com.apple.quicktime.collection.user", 1299, "com.apple.quicktime.rating.user");
        ho2.M(1300, map2, "com.apple.quicktime.location.name", TAG_LOCATION_BODY, "com.apple.quicktime.location.body");
        ho2.M(TAG_LOCATION_NOTE, map2, "com.apple.quicktime.location.note", TAG_LOCATION_ROLE, "com.apple.quicktime.location.role");
        ho2.M(TAG_LOCATION_DATE, map2, "com.apple.quicktime.location.date", TAG_DIRECTION_FACING, "com.apple.quicktime.direction.facing");
        ho2.M(TAG_DIRECTION_MOTION, map2, "com.apple.quicktime.direction.motion", TAG_DISPLAY_NAME, "com.apple.quicktime.displayname");
        ho2.M(TAG_CONTENT_IDENTIFIER, map2, "com.apple.quicktime.content.identifier", TAG_MAKE, "com.apple.quicktime.make");
        ho2.M(TAG_MODEL, map2, "com.apple.quicktime.model", TAG_ORIGINATING_SIGNATURE, "com.apple.photos.originating.signature");
        ho2.M(1312, map2, "com.apple.quicktime.pixeldensity", 1024, "----");
        ho2.M(OlympusCameraSettingsMakernoteDirectory.TagFlashExposureComp, map2, "@PST", PhotoshopDirectory.TAG_LAYERS_GROUP_INFORMATION, "@ppi");
        ho2.M(1027, map2, "@pti", 1028, "@sti");
        ho2.M(1029, map2, "AACR", 1030, "CDEK");
        ho2.M(LeicaType5MakernoteDirectory.TagOriginalFileName, map2, "CDET", 1032, "GUID");
        ho2.M(PhotoshopDirectory.TAG_THUMBNAIL_OLD, map2, "VERS", PhotoshopDirectory.TAG_COPYRIGHT, "aART");
        ho2.M(PhotoshopDirectory.TAG_URL, map2, "akID", PhotoshopDirectory.TAG_THUMBNAIL, "albm");
        ho2.M(1037, map2, "apID", 1038, "atID");
        ho2.M(PhotoshopDirectory.TAG_ICC_PROFILE_BYTES, map2, "auth", 1040, "catg");
        ho2.M(PhotoshopDirectory.TAG_ICC_UNTAGGED_PROFILE, map2, "cnID", 1042, "covr");
        ho2.M(1043, map2, "cpil", PhotoshopDirectory.TAG_SEED_NUMBER, "cprt");
        ho2.M(PhotoshopDirectory.TAG_UNICODE_ALPHA_NAMES, map2, "desc", PhotoshopDirectory.TAG_INDEXED_COLOR_TABLE_COUNT, "disk");
        ho2.M(PhotoshopDirectory.TAG_TRANSPARENCY_INDEX, map2, "dscp", 1048, "egid");
        ho2.M(PhotoshopDirectory.TAG_GLOBAL_ALTITUDE, map2, "geID", PhotoshopDirectory.TAG_SLICES, "gnre");
        ho2.M(PhotoshopDirectory.TAG_WORKFLOW_URL, map2, "grup", PhotoshopDirectory.TAG_JUMP_TO_XPEP, "gshh");
        ho2.M(PhotoshopDirectory.TAG_ALPHA_IDENTIFIERS, map2, "gspm", PhotoshopDirectory.TAG_URL_LIST, "gspu");
        ho2.M(1055, map2, "gssd", 1056, "gsst");
        ho2.M(PhotoshopDirectory.TAG_VERSION, map2, "gstd", PhotoshopDirectory.TAG_EXIF_DATA_1, "hdvd");
        ho2.M(PhotoshopDirectory.TAG_EXIF_DATA_3, map2, "itnu", PhotoshopDirectory.TAG_XMP_DATA, "keyw");
        ho2.M(PhotoshopDirectory.TAG_CAPTION_DIGEST, map2, "ldes", PhotoshopDirectory.TAG_PRINT_SCALE, "pcst");
        ho2.M(1063, map2, "perf", PhotoshopDirectory.TAG_PIXEL_ASPECT_RATIO, "pgap");
        ho2.M(PhotoshopDirectory.TAG_LAYER_COMPS, map2, "plID", PhotoshopDirectory.TAG_ALTERNATE_DUOTONE_COLORS, "prID");
        ho2.M(PhotoshopDirectory.TAG_ALTERNATE_SPOT_COLORS, map2, "purd", 1068, "purl");
        ho2.M(PhotoshopDirectory.TAG_LAYER_SELECTION_IDS, map2, "rate", PhotoshopDirectory.TAG_HDR_TONING_INFO, "rldt");
        ho2.M(PhotoshopDirectory.TAG_PRINT_INFO, map2, "rtng", PhotoshopDirectory.TAG_LAYER_GROUPS_ENABLED_ID, "sfID");
        ho2.M(PhotoshopDirectory.TAG_COLOR_SAMPLERS, map2, "soaa", PhotoshopDirectory.TAG_MEASUREMENT_SCALE, "soal");
        ho2.M(PhotoshopDirectory.TAG_TIMELINE_INFORMATION, map2, "soar", PhotoshopDirectory.TAG_SHEET_DISCLOSURE, "soco");
        ho2.M(PhotoshopDirectory.TAG_DISPLAY_INFO, map2, "sonm", PhotoshopDirectory.TAG_ONION_SKINS, "sosn");
        ho2.M(1079, map2, "stik", PhotoshopDirectory.TAG_COUNT_INFORMATION, "titl");
        ho2.M(1081, map2, bPUi.SIm, PhotoshopDirectory.TAG_PRINT_INFO_2, "trkn");
        ho2.M(PhotoshopDirectory.TAG_PRINT_STYLE, map2, "tven", PhotoshopDirectory.TAG_MAC_NSPRINTINFO, "tves");
        ho2.M(PhotoshopDirectory.TAG_WIN_DEVMODE, map2, "tvnn", PhotoshopDirectory.TAG_AUTO_SAVE_FILE_PATH, "tvsh");
        ho2.M(PhotoshopDirectory.TAG_AUTO_SAVE_FORMAT, map2, "tvsn", PhotoshopDirectory.TAG_PATH_SELECTION_STATE, "yrrc");
        ho2.M(1089, map2, "�ART", 1090, "�alb");
        ho2.M(1091, map2, "�cmt", 1092, "�com");
        ho2.M(1093, map2, "�cpy", 1094, "�day");
        ho2.M(1095, map2, "�des", 1096, "�enc");
        ho2.M(1097, map2, "�gen", 1098, "�grp");
        ho2.M(1099, map2, "�lyr", 1100, "�nam");
        ho2.M(1101, map2, "�nrt", 1102, "�pub");
        ho2.M(1103, map2, "�too", 1104, "�trk");
        map2.put("�wrt", 1105);
        map.put(1280, "Album");
        map.put(1281, "Artist");
        map.put(1282, "Artwork");
        map.put(1283, "Author");
        map.put(1284, "Comment");
        map.put(1285, "Copyright");
        map.put(1286, "Creation Date");
        map.put(1287, "Description");
        map.put(numValueOf, "Director");
        map.put(1289, "Title");
        map.put(1290, "Genre");
        map.put(1291, "Information");
        map.put(1292, "Keywords");
        map.put(1293, "ISO 6709");
        map.put(numValueOf2, "Producer");
        map.put(1295, "Publisher");
        lv8.x(TAG_SOFTWARE, map, "Software", TAG_YEAR, "Year");
        lv8.x(TAG_COLLECTION_USER, map, "Collection User", 1299, "Rating User");
        lv8.x(1300, map, "Location Name", TAG_LOCATION_BODY, "Location Body");
        lv8.x(TAG_LOCATION_NOTE, map, "Location Note", TAG_LOCATION_ROLE, "Location Role");
        lv8.x(TAG_LOCATION_DATE, map, "Location Date", TAG_DIRECTION_FACING, "Direction Facing");
        lv8.x(TAG_DIRECTION_MOTION, map, "Direction Motion", TAG_DISPLAY_NAME, "Display Name");
        lv8.x(TAG_CONTENT_IDENTIFIER, map, "Content Identifier", TAG_MAKE, "Make");
        lv8.x(TAG_MODEL, map, "Model", TAG_ORIGINATING_SIGNATURE, "Originating Signature");
        lv8.x(1312, map, "Pixel Density", 1024, "iTunes Info");
        lv8.x(OlympusCameraSettingsMakernoteDirectory.TagFlashExposureComp, map, "Parent Short Title", PhotoshopDirectory.TAG_LAYERS_GROUP_INFORMATION, "Parent Product ID");
        lv8.x(1027, map, "Parent Title", 1028, "Short Title");
        lv8.x(1029, map, "Unknown_AACR?", 1030, "Unknown_CDEK?");
        lv8.x(LeicaType5MakernoteDirectory.TagOriginalFileName, map, "Unknown_CDET?", 1032, "GUID");
        lv8.x(PhotoshopDirectory.TAG_THUMBNAIL_OLD, map, "Product Version", PhotoshopDirectory.TAG_COPYRIGHT, "Album Artist");
        lv8.x(PhotoshopDirectory.TAG_URL, map, "Apple Store Account Type", PhotoshopDirectory.TAG_THUMBNAIL, "Album");
        lv8.x(1037, map, "Apple Store Account", 1038, "Album Title ID");
        lv8.x(PhotoshopDirectory.TAG_ICC_PROFILE_BYTES, map, "Author", 1040, "Category");
        lv8.x(PhotoshopDirectory.TAG_ICC_UNTAGGED_PROFILE, map, "Apple Store Catalog ID", 1042, "Cover Art");
        lv8.x(1043, map, "Compilation", PhotoshopDirectory.TAG_SEED_NUMBER, "Copyright");
        lv8.x(PhotoshopDirectory.TAG_UNICODE_ALPHA_NAMES, map, "Description", PhotoshopDirectory.TAG_INDEXED_COLOR_TABLE_COUNT, "Disk Number");
        lv8.x(PhotoshopDirectory.TAG_TRANSPARENCY_INDEX, map, "Description", 1048, "Episode Global Unique ID");
        lv8.x(PhotoshopDirectory.TAG_GLOBAL_ALTITUDE, map, "Genre ID", PhotoshopDirectory.TAG_SLICES, "Genre");
        lv8.x(PhotoshopDirectory.TAG_WORKFLOW_URL, map, "Grouping", PhotoshopDirectory.TAG_JUMP_TO_XPEP, "Google Host Header");
        lv8.x(PhotoshopDirectory.TAG_ALPHA_IDENTIFIERS, map, "Google Ping Message", PhotoshopDirectory.TAG_URL_LIST, "Google Ping URL");
        lv8.x(1055, map, "Google Source Data", 1056, "Google Start Time");
        lv8.x(PhotoshopDirectory.TAG_VERSION, map, "Google Track Duration", PhotoshopDirectory.TAG_EXIF_DATA_1, "HD Video");
        lv8.x(PhotoshopDirectory.TAG_EXIF_DATA_3, map, "iTunes U", PhotoshopDirectory.TAG_XMP_DATA, "Keyword");
        lv8.x(PhotoshopDirectory.TAG_CAPTION_DIGEST, map, "Long Description", PhotoshopDirectory.TAG_PRINT_SCALE, "Podcast");
        lv8.x(1063, map, "Performer", PhotoshopDirectory.TAG_PIXEL_ASPECT_RATIO, "Play Gap");
        lv8.x(PhotoshopDirectory.TAG_LAYER_COMPS, map, "Play List ID", PhotoshopDirectory.TAG_ALTERNATE_DUOTONE_COLORS, "Product ID");
        lv8.x(PhotoshopDirectory.TAG_ALTERNATE_SPOT_COLORS, map, "Purchase Date", 1068, "Podcast URL");
        lv8.x(PhotoshopDirectory.TAG_LAYER_SELECTION_IDS, map, "Rating Percent", PhotoshopDirectory.TAG_HDR_TONING_INFO, "Release Date");
        lv8.x(PhotoshopDirectory.TAG_PRINT_INFO, map, "Rating", PhotoshopDirectory.TAG_LAYER_GROUPS_ENABLED_ID, "Apple Store Country");
        lv8.x(PhotoshopDirectory.TAG_COLOR_SAMPLERS, map, "Sort Album Artist", PhotoshopDirectory.TAG_MEASUREMENT_SCALE, "Sort Album");
        lv8.x(PhotoshopDirectory.TAG_TIMELINE_INFORMATION, map, "Sort Artist", PhotoshopDirectory.TAG_SHEET_DISCLOSURE, "Sort Composer");
        lv8.x(PhotoshopDirectory.TAG_DISPLAY_INFO, map, "Sort Name", PhotoshopDirectory.TAG_ONION_SKINS, "Sort Show");
        lv8.x(1079, map, "Media Type", PhotoshopDirectory.TAG_COUNT_INFORMATION, "Title");
        lv8.x(1081, map, "Beats Per Minute", PhotoshopDirectory.TAG_PRINT_INFO_2, "Track Number");
        lv8.x(PhotoshopDirectory.TAG_PRINT_STYLE, map, "TV Episode ID", PhotoshopDirectory.TAG_MAC_NSPRINTINFO, "TV Episode");
        lv8.x(PhotoshopDirectory.TAG_WIN_DEVMODE, map, "TV Network Name", PhotoshopDirectory.TAG_AUTO_SAVE_FILE_PATH, "TV Show");
        lv8.x(PhotoshopDirectory.TAG_AUTO_SAVE_FORMAT, map, "TV Season", PhotoshopDirectory.TAG_PATH_SELECTION_STATE, "Year");
        lv8.x(1089, map, "Artist", 1090, "Album");
        lv8.x(1091, map, "Comment", 1092, "Composer");
        lv8.x(1093, map, "Copyright", 1094, "Content Create Date");
        lv8.x(1095, map, "Description", 1096, "Encoded By");
        lv8.x(1097, map, "Genre", 1098, "Grouping");
        lv8.x(1099, map, "Lyrics", 1100, "Title");
        lv8.x(1101, map, "Narrator", 1102, "Publisher");
        lv8.x(1103, map, "Encoder", 1104, "Track");
        map.put(1105, "Composer");
    }
}
