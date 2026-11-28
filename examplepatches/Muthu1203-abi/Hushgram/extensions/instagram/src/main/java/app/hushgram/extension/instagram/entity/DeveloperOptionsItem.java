/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 * https://github.com/crimera/piko/commit/04987953674f98b3f302dc7a8da7492ae96b5267
 *
 * Modified for HushGram (Instagram), 2026.
 * See NOTICE for GPLv3 §7(b) attribution terms.
 */
package app.hushgram.extension.instagram.entity;

import app.hushgram.extension.shared.Logger;

/** A readable view of one Instagram MobileConfig experiment specifier. */
public final class DeveloperOptionsItem {
    private long mobileConfigSpecifier;
    private String universalName;
    private String paramName;
    private String universalId;
    private String paramId;

    private static volatile Class<?> universalIdHelperClassCache;

    public DeveloperOptionsItem(long mobileConfigSpecifier, String universalName, String paramName) {
        this.mobileConfigSpecifier = mobileConfigSpecifier;
        this.universalName = universalName;
        this.paramName = paramName;
        this.universalId = getUniversalId(mobileConfigSpecifier);
        this.paramId = getParamId(mobileConfigSpecifier);
    }

    public DeveloperOptionsItem(long mobileConfigSpecifier) {
        this(mobileConfigSpecifier, "", "");
    }

    private static Class<?> getUniversalIdHelperClass() throws ClassNotFoundException {
        Class<?> cached = universalIdHelperClassCache;
        if (cached != null) return cached;
        Class<?> resolved = Class.forName("X.0B3D");
        universalIdHelperClassCache = resolved;
        return resolved;
    }

    public String getUniversalId(long mobileConfigSpecifier) {
        try {
            java.lang.reflect.Method method = getUniversalIdHelperClass().getDeclaredMethod("A00", long.class);
            method.setAccessible(true);
            return String.valueOf(((Number) method.invoke(null, mobileConfigSpecifier)).intValue());
        } catch (Exception e) {
            Logger.printException(() -> "Could not read Instagram MobileConfig universal ID", e);
            return "0";
        }
    }

    public String getParamId(long mobileConfigSpecifier) {
        long shifted = mobileConfigSpecifier >>> 16;
        boolean wideId = ((mobileConfigSpecifier >>> 62) & 1L) == 1L;
        return String.valueOf(wideId ? shifted & 0xffff : shifted & 0xfff);
    }

    public long getMobileConfigSpecifier() { return mobileConfigSpecifier; }
    public void setMobileConfigSpecifier(long value) { mobileConfigSpecifier = value; }
    public String getUniversalName() { return universalName; }
    public void setUniversalName(String value) { universalName = value; }
    public String getParamName() { return paramName; }
    public void setParamName(String value) { paramName = value; }
    public String getUniversalId() { return universalId; }
    public void setUniversalId(String value) { universalId = value; }
    public String getParamId() { return paramId; }
    public void setParamId(String value) { paramId = value; }
    public String getConfigId() { return getUniversalId() + "::" + getParamId(); }

    @Override
    public String toString() {
        return "DeveloperOptionsItem{" +
                "mobileConfigSpecifier=" + mobileConfigSpecifier +
                ", universalName='" + universalName + '\'' +
                ", paramName='" + paramName + '\'' +
                ", universalId='" + universalId + '\'' +
                ", paramId='" + paramId + '\'' +
                '}';
    }
}
