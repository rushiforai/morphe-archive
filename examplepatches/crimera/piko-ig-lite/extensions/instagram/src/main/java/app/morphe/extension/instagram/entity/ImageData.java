/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */


package app.morphe.extension.instagram.entity;

import com.instagram.model.mediasize.ExtendedImageUrl;

public class ImageData {
    private final ExtendedImageUrl obj;

    public ImageData(Object obj) {
        this.obj = (ExtendedImageUrl) obj;
    }

    public Integer getHeight() throws Exception {
        return Integer.valueOf(this.obj.getHeight());
    }

    public Integer getWidth() throws Exception {
        return Integer.valueOf(this.obj.getWidth());
    }

    public String getUrl() throws Exception {
        return this.obj.getUrl();
    }

    /**
     * The wrapped `ExtendedImageUrl`. The patch-emitted cache bridge reads the real width/height
     * from this object, which is what the feed's cache key is built from.
     */
    public Object getObject() {
        return this.obj;
    }
}
