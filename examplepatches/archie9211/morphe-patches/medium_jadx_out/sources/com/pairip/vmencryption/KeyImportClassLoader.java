package com.pairip.vmencryption;

import android.util.Log;
import dalvik.system.PathClassLoader;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class KeyImportClassLoader extends PathClassLoader {
    private static final String TAG = "KeyImportClassLoader";
    protected final Map<String, String> classReplacementsMap;

    public KeyImportClassLoader(String dexPath, ClassLoader parent) {
        super(dexPath, parent);
        this.classReplacementsMap = resolveClassReplacementsMap();
    }

    @Override // java.lang.ClassLoader
    protected Class<?> loadClass(String name, boolean resolve) throws ClassNotFoundException {
        String str = this.classReplacementsMap.containsKey(name) ? this.classReplacementsMap.get(name) : name;
        if (!str.equals(name)) {
            Log.d(TAG, String.format("Loading class %s (replacement for %s)", str, name));
        }
        try {
            return super.loadClass(str, resolve);
        } catch (ClassNotFoundException e) {
            if (!str.equals(name)) {
                throw new ClassNotFoundException(String.format("Failed to load class %s (replacement for %s)", str, name), e);
            }
            throw e;
        }
    }

    private static Map<String, String> resolveClassReplacementsMap() {
        HashMap map = new HashMap();
        for (String str : KeyImportConstants.classLoaderReplacements.split(";")) {
            String[] strArrSplit = str.split("->");
            if (strArrSplit.length == 2) {
                map.put(strArrSplit[0], strArrSplit[1]);
            }
        }
        return map;
    }
}
