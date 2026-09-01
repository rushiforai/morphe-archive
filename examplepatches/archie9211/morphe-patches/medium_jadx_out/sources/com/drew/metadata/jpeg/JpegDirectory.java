package com.drew.metadata.jpeg;

import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class JpegDirectory extends Directory {
    public static final int TAG_COMPONENT_DATA_1 = 6;
    public static final int TAG_COMPONENT_DATA_2 = 7;
    public static final int TAG_COMPONENT_DATA_3 = 8;
    public static final int TAG_COMPONENT_DATA_4 = 9;
    public static final int TAG_COMPRESSION_TYPE = -3;
    public static final int TAG_DATA_PRECISION = 0;
    public static final int TAG_IMAGE_HEIGHT = 1;
    public static final int TAG_IMAGE_WIDTH = 3;
    public static final int TAG_NUMBER_OF_COMPONENTS = 5;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(-3, map, "Compression Type", 0, "Data Precision");
        lv8.x(3, map, "Image Width", 1, "Image Height");
        lv8.x(5, map, "Number of Components", 6, "Component 1");
        lv8.x(7, map, "Component 2", 8, "Component 3");
        map.put(9, "Component 4");
    }

    public JpegDirectory() {
        setDescriptor(new JpegDescriptor(this));
    }

    public final JpegComponent getComponent(int i) {
        return (JpegComponent) getObject(i + 6);
    }

    public final int getImageHeight() {
        return getInt(1);
    }

    public final int getImageWidth() {
        return getInt(3);
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "JPEG";
    }

    public final int getNumberOfComponents() {
        return getInt(5);
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
