/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */


package app.morphe.extension.instagram.entity;

import app.morphe.extension.crimera.PikoUtils;

public class DeveloperOptionsItem {

    private long mobileConfigSpecifier;
    private String universalName;
    private String paramName;
    private String universalId;
    private String paramId;

    public DeveloperOptionsItem(long mobileConfigSpecifier, String universalName, String paramName) {
        this.mobileConfigSpecifier = mobileConfigSpecifier;
        this.universalName = universalName;
        this.paramName = paramName;

        this.universalId = this.getUniversalId(mobileConfigSpecifier);
        this.paramId = this.getParamId(mobileConfigSpecifier);
    }

    public DeveloperOptionsItem(long mobileConfigSpecifier) {
        this.mobileConfigSpecifier = mobileConfigSpecifier;
        this.universalName = "";
        this.paramName = "";

        this.universalId = this.getUniversalId(mobileConfigSpecifier);
        this.paramId = this.getParamId(mobileConfigSpecifier);
    }

    /**
     * Whether the app's universal id helper could be reached. Resolved once: this runs on every
     * flag the app checks, so a build where the helper has moved would otherwise throw, log a
     * stack trace and walk the reflection path thousands of times a minute.
     */
    private static Boolean universalIdHelperUsable;

    private Class<?> getUniversalIdHelperClass() throws Exception {
        return Class.forName("X.0B3D");
    }

    /**
     * Name of the helper method, rewritten by the patch alongside the class above. piko hardcodes
     * it at the call site, where nothing can reach it.
     */
    private String getUniversalIdHelperMethodName() {
        return "A00";
    }

    public String getUniversalId(long mobileConfigSpecifier) {
        if (Boolean.FALSE.equals(universalIdHelperUsable)) {
            return "0";
        }
        try {
            Class<?> universalIdHelperClass = this.getUniversalIdHelperClass();
            int universalId = (int) new Entity().getMethod(
                    universalIdHelperClass, this.getUniversalIdHelperMethodName(), new Class[]{long.class}, mobileConfigSpecifier);
            universalIdHelperUsable = Boolean.TRUE;
            return String.valueOf(universalId);
        } catch (Exception e){
            if (universalIdHelperUsable == null) {
                universalIdHelperUsable = Boolean.FALSE;
                PikoUtils.logger(e);
            }
        }
        return "0";
    }

    public String getParamId(long mobileConfigSpecifier) {
        try{
            long shifted = mobileConfigSpecifier >>> 16;
            boolean flag = ((mobileConfigSpecifier >>> 62) & 1L) == 1L;
            Object paramId = flag ? (shifted & 0xffff) : (shifted & 0xfff);
            return String.valueOf(paramId);
        } catch (Exception e){
            PikoUtils.logger(e);
        }
        return "0";
    }

    public long getMobileConfigSpecifier() {
        return mobileConfigSpecifier;
    }

    public void setMobileConfigSpecifier(long mobileConfigSpecifier) {
        this.mobileConfigSpecifier = mobileConfigSpecifier;
    }

    public String getUniversalName() {
        return universalName;
    }

    public void setUniversalName(String universalName) {
        this.universalName = universalName;
    }

    public String getParamName() {
        return paramName;
    }

    public void setParamName(String paramName) {
        this.paramName = paramName;
    }

    public String getUniversalId() {
        return universalId;
    }

    public void setUniversalId(String universalId) {
        this.universalId = universalId;
    }

    public String getParamId() {
        return paramId;
    }

    public void setParamId(String paramId) {
        this.paramId = paramId;
    }

    public String getConfigId(){
        return this.getUniversalId() + "::" + this.getParamId();
    }

    @java.lang.Override
    public java.lang.String toString() {
        return "DeveloperOptionsItem{" +
                "mobileConfigSpecifier=" + mobileConfigSpecifier +
                ", universalName='" + universalName + '\'' +
                ", paramName='" + paramName + '\'' +
                ", universalId='" + universalId + '\'' +
                ", paramId='" + paramId + '\'' +
                '}';
    }
}
