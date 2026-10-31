package com.tiktok.appevents;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.util.Base64;
import android.view.View;
import java.io.ByteArrayOutputStream;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes4.dex */
public class TTAppEvent implements Serializable {
    private static final AtomicLong counter = new AtomicLong(new Date().getTime());
    private static final long serialVersionUID = 2;
    private String eventId;
    private String eventName;
    private Boolean isEdp;
    private String propertiesJson;
    private String screenShot;
    private List<String> tiktokAppIds;
    private Date timeStamp;
    private final TTAppEventType type;
    private final Long uniqueId;
    private final TTUserInfo userInfo;

    public enum TTAppEventType {
        track,
        identify
    }

    public TTAppEvent(TTAppEventType tTAppEventType, String str, String str2, String str3, String[] strArr) {
        this(tTAppEventType, str, new Date(), str2, str3, strArr);
    }

    public Boolean getEdp() {
        return this.isEdp;
    }

    public String getEventId() {
        return this.eventId;
    }

    public String getEventName() {
        return this.eventName;
    }

    public String getPropertiesJson() {
        return this.propertiesJson;
    }

    public String getScreenShot() {
        return this.screenShot;
    }

    public List<String> getTiktokAppIds() {
        return this.tiktokAppIds;
    }

    public Date getTimeStamp() {
        return this.timeStamp;
    }

    public String getType() {
        return this.type.name();
    }

    public Long getUniqueId() {
        return this.uniqueId;
    }

    public TTUserInfo getUserInfo() {
        return this.userInfo;
    }

    public void setEdp(Boolean bool) {
        this.isEdp = bool;
    }

    public void setEventId(String str) {
        this.eventId = str;
    }

    public void setEventName(String str) {
        this.eventName = str;
    }

    public void setPropertiesJson(String str) {
        this.propertiesJson = str;
    }

    public void setScreenShot() {
        try {
            View decorView = TTLifecycleListener.getActivityRef().get().getWindow().getDecorView();
            Bitmap bitmapCreateBitmap = Bitmap.createBitmap(decorView.getWidth(), decorView.getHeight(), Bitmap.Config.RGB_565);
            decorView.draw(new Canvas(bitmapCreateBitmap));
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            bitmapCreateBitmap.compress(Bitmap.CompressFormat.JPEG, 5, byteArrayOutputStream);
            this.screenShot = Base64.encodeToString(byteArrayOutputStream.toByteArray(), 2);
        } catch (Throwable unused) {
        }
    }

    public void setTiktokAppIds(List<String> list) {
        this.tiktokAppIds = list;
    }

    public void setTimeStamp(Date date) {
        this.timeStamp = date;
    }

    public String toString() {
        StringBuilder sb2 = new StringBuilder("TTAppEvent{eventName='");
        sb2.append(this.eventName);
        sb2.append("', timeStamp=");
        sb2.append(this.timeStamp);
        sb2.append(", propertiesJson='");
        sb2.append(this.propertiesJson);
        sb2.append("', eventId='");
        sb2.append(this.eventId);
        sb2.append("', uniqueId=");
        sb2.append(this.uniqueId);
        sb2.append(", tiktokAppIds=");
        return fq.c.e(sb2, this.tiktokAppIds, AbstractJsonLexerKt.END_OBJ);
    }

    public TTAppEvent(TTAppEventType tTAppEventType, String str, Date date, String str2, String str3, String[] strArr) {
        this.tiktokAppIds = new ArrayList();
        this.type = tTAppEventType;
        this.eventName = str;
        this.timeStamp = date;
        this.propertiesJson = str2;
        this.eventId = str3;
        this.uniqueId = Long.valueOf(counter.getAndIncrement());
        this.userInfo = TTUserInfo.sharedInstance.m268clone();
        if (strArr == null || strArr.length <= 0) {
            return;
        }
        for (String str4 : strArr) {
            this.tiktokAppIds.add(str4);
        }
    }
}
