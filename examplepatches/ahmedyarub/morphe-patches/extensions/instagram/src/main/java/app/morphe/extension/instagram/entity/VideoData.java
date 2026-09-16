/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */


package app.morphe.extension.instagram.entity;

import java.util.Map;
import java.util.HashMap;
import app.morphe.extension.crimera.PikoUtils;

import app.morphe.extension.crimera.downloader.MediaType;

public class VideoData extends Entity implements MediaInterface {

    /**
     * The video variant, held untyped. piko names VideoVersionIntf and
     * ImmutablePandoVideoVersion outright, but 446 moved both from
     * com.instagram.model.mediasize to com.instagram.api.schemas, and a hard reference to a class
     * that has moved is a NoClassDefFoundError the moment a variant is constructed — which is
     * every download. Everything this class needs is reached reflectively anyway.
     */
    private final Object obj;
    private final boolean isPandoVideoVersion;

    public VideoData(Object obj) {
        super(obj);

        this.obj = obj;
        this.isPandoVideoVersion = obj != null &&
                obj.getClass().getName().endsWith(".ImmutablePandoVideoVersion");
    }

    private Map immutablePandoVideoVersionMap(){
        try{
            return (Map) super.getMethod("methodname");
        } catch (Exception e) {
            PikoUtils.logger(e);
        }
        return new HashMap();
    }

    private Map videoVersionMap(){
        try{
            return (Map) super.getMethod("methodname");
        } catch (Exception e) {
            PikoUtils.logger(e);
        }
        return new HashMap();
    }

    public Integer getHeight() throws Exception {
        if(this.isPandoVideoVersion){
            return (Integer) this.immutablePandoVideoVersionMap().getOrDefault("height",0);
        }
        return (Integer) this.videoVersionMap().getOrDefault("height",0);
    }

    public Integer getWidth() throws Exception {
        if(this.isPandoVideoVersion){
            return (Integer) this.immutablePandoVideoVersionMap().getOrDefault("width",0);
        }
        return (Integer) this.videoVersionMap().getOrDefault("width",0);
    }

    private Integer getCodec() throws Exception {
        if(this.isPandoVideoVersion){
            return (Integer) this.immutablePandoVideoVersionMap().getOrDefault("type",0);
        }
        return (Integer) this.videoVersionMap().getOrDefault("type",0);
    }

    public String getVariantTag() {
        try{
            return this.getHeight()+"x"+this.getWidth()+"-"+this.getCodec();
        } catch (Exception e) {
            return "unknown";
        }
    }

    public String getUrl() throws Exception {
        return (String) super.getMethod(this.obj, "getUrl");
    }

    public MediaType getMediaType(){
        return MediaType.VIDEO;
    }

}