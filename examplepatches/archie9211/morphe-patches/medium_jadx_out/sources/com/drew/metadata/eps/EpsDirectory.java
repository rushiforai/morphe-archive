package com.drew.metadata.eps;

import com.drew.metadata.Directory;
import com.medium.android.data.catalog.KnyB.uvlZTF;
import defpackage.ho2;
import defpackage.lv8;
import java.util.HashMap;
import sprig.b.VPIE.dpBiLjNeNsiASg;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class EpsDirectory extends Directory {
    public static final int TAG_AUTHOR = 2;
    public static final int TAG_BOUNDING_BOX = 3;
    public static final int TAG_COLOR_TYPE = 30;
    public static final int TAG_CONTINUE_LINE = 36;
    public static final int TAG_COPYRIGHT = 4;
    public static final int TAG_CREATION_DATE = 5;
    public static final int TAG_CREATOR = 6;
    public static final int TAG_DOCUMENT_DATA = 16;
    public static final int TAG_DSC_VERSION = 1;
    public static final int TAG_EMULATION = 17;
    public static final int TAG_EXTENSIONS = 18;
    public static final int TAG_FOR = 7;
    public static final int TAG_IMAGE_DATA = 8;
    public static final int TAG_IMAGE_HEIGHT = 29;
    public static final int TAG_IMAGE_WIDTH = 28;
    public static final int TAG_KEYWORDS = 9;
    public static final int TAG_LANGUAGE_LEVEL = 19;
    public static final int TAG_MODIFY_DATE = 10;
    public static final int TAG_OPERATOR_INTERNVENTION = 22;
    public static final int TAG_OPERATOR_MESSAGE = 23;
    public static final int TAG_ORIENTATION = 20;
    public static final int TAG_PAGES = 11;
    public static final int TAG_PAGE_ORDER = 21;
    public static final int TAG_PROOF_MODE = 24;
    public static final int TAG_RAM_SIZE = 31;
    public static final int TAG_REQUIREMENTS = 25;
    public static final int TAG_ROUTING = 12;
    public static final int TAG_SUBJECT = 13;
    public static final int TAG_TIFF_PREVIEW_OFFSET = 33;
    public static final int TAG_TIFF_PREVIEW_SIZE = 32;
    public static final int TAG_TITLE = 14;
    public static final int TAG_VERSION = 15;
    public static final int TAG_VM_LOCATION = 26;
    public static final int TAG_VM_USAGE = 27;
    public static final int TAG_WMF_PREVIEW_OFFSET = 35;
    public static final int TAG_WMF_PREVIEW_SIZE = 34;
    static final HashMap<String, Integer> _tagIntegerMap;
    static final HashMap<Integer, String> _tagNameMap;

    public EpsDirectory() {
        setDescriptor(new EpsDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "EPS";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        HashMap<String, Integer> map2 = new HashMap<>();
        _tagIntegerMap = map2;
        map2.put("%!PS-Adobe-", 1);
        map2.put("%%Author", 2);
        map2.put("%%BoundingBox", 3);
        map2.put("%%Copyright", 4);
        map2.put("%%CreationDate", 5);
        map2.put("%%Creator", 6);
        map2.put("%%For", 7);
        map2.put("%ImageData", 8);
        map2.put("%%Keywords", 9);
        map2.put("%%ModDate", 10);
        map2.put("%%Pages", 11);
        map2.put("%%Routing", 12);
        map2.put("%%Subject", 13);
        map2.put("%%Title", 14);
        map2.put("%%Version", 15);
        map2.put("%%DocumentData", 16);
        ho2.M(17, map2, "%%Emulation", 18, uvlZTF.PCf);
        ho2.M(19, map2, "%%LanguageLevel", 20, "%%Orientation");
        ho2.M(21, map2, "%%PageOrder", 22, "%%OperatorIntervention");
        ho2.M(23, map2, "%%OperatorMessage", 24, "%%ProofMode");
        ho2.M(25, map2, "%%Requirements", 26, "%%VMlocation");
        ho2.M(27, map2, "%%VMusage", 28, "Image Width");
        ho2.M(29, map2, "Image Height", 30, "Color Type");
        ho2.M(31, map2, "Ram Size", 32, "TIFFPreview");
        ho2.M(33, map2, "TIFFPreviewOffset", 34, "WMFPreview");
        ho2.M(35, map2, "WMFPreviewOffset", 36, "%%+");
        map.put(36, "Line Continuation");
        map.put(3, "Bounding Box");
        map.put(4, "Copyright");
        map.put(16, "Document Data");
        lv8.x(17, map, "Emulation", 18, "Extensions");
        lv8.x(19, map, "Language Level", 20, "Orientation");
        map.put(21, "Page Order");
        map.put(15, "Version");
        map.put(8, "Image Data");
        map.put(28, "Image Width");
        lv8.x(29, map, "Image Height", 30, "Color Type");
        map.put(31, "Ram Size");
        map.put(6, "Creator");
        map.put(5, "Creation Date");
        map.put(7, "For");
        map.put(25, "Requirements");
        map.put(12, "Routing");
        map.put(14, "Title");
        map.put(1, "DSC Version");
        map.put(11, "Pages");
        map.put(22, "Operator Intervention");
        lv8.x(23, map, "Operator Message", 24, "Proof Mode");
        lv8.x(26, map, "VM Location", 27, "VM Usage");
        map.put(2, "Author");
        map.put(9, "Keywords");
        map.put(10, dpBiLjNeNsiASg.YxWrUcFNb);
        map.put(13, "Subject");
        map.put(32, "TIFF Preview Size");
        lv8.x(33, map, "TIFF Preview Offset", 34, "WMF Preview Size");
        map.put(35, "WMF Preview Offset");
    }
}
