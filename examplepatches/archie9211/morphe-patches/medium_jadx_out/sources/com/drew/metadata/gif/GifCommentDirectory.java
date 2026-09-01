package com.drew.metadata.gif;

import com.drew.metadata.Directory;
import com.drew.metadata.StringValue;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class GifCommentDirectory extends Directory {
    public static final int TAG_COMMENT = 1;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        map.put(1, "Comment");
    }

    public GifCommentDirectory(StringValue stringValue) {
        setDescriptor(new GifCommentDescriptor(this));
        setStringValue(1, stringValue);
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "GIF Comment";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
