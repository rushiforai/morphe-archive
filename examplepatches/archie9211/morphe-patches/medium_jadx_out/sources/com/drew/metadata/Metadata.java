package com.drew.metadata;

import defpackage.ay0;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class Metadata {
    private final List<Directory> _directories = new ArrayList();

    public final <T extends Directory> void addDirectory(T t) {
        if (t != null) {
            this._directories.add(t);
        } else {
            ay0.e("Directory may not be null.");
        }
    }

    public final boolean containsDirectoryOfType(Class<? extends Directory> cls) {
        Iterator<Directory> it2 = this._directories.iterator();
        while (it2.hasNext()) {
            if (cls.isAssignableFrom(it2.next().getClass())) {
                return true;
            }
        }
        return false;
    }

    public final Iterable<Directory> getDirectories() {
        return this._directories;
    }

    public final <T extends Directory> Collection<T> getDirectoriesOfType(Class<T> cls) {
        ArrayList arrayList = new ArrayList();
        for (Directory directory : this._directories) {
            if (cls.isAssignableFrom(directory.getClass())) {
                arrayList.add(directory);
            }
        }
        return arrayList;
    }

    public final int getDirectoryCount() {
        return this._directories.size();
    }

    public final <T extends Directory> T getFirstDirectoryOfType(Class<T> cls) {
        Iterator<Directory> it2 = this._directories.iterator();
        while (it2.hasNext()) {
            T t = (T) it2.next();
            if (cls.isAssignableFrom(t.getClass())) {
                return t;
            }
        }
        return null;
    }

    public final boolean hasErrors() {
        Iterator<T> it2 = this._directories.iterator();
        while (it2.hasNext()) {
            if (((Directory) it2.next()).hasErrors()) {
                return true;
            }
        }
        return false;
    }

    public final String toString() {
        int size = this._directories.size();
        return String.format("Metadata (%d %s)", Integer.valueOf(size), size == 1 ? "directory" : "directories");
    }
}
