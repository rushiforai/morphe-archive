package com.drew.metadata;

import defpackage.ev6;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ErrorDirectory extends Directory {
    public ErrorDirectory(String str) {
        addError(str);
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "Error";
    }

    @Override // com.drew.metadata.Directory
    public final String getTagName(int i) {
        return "";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return new HashMap<>();
    }

    @Override // com.drew.metadata.Directory
    public final boolean hasTagName(int i) {
        return false;
    }

    @Override // com.drew.metadata.Directory
    public final void setObject(int i, Object obj) {
        throw new UnsupportedOperationException(ev6.x("Cannot add value to ", ErrorDirectory.class.getName(), "."));
    }

    public ErrorDirectory() {
    }
}
