package com.tiktok.appevents.contents;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.contents.TTContentsEvent;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public class TTViewContentEvent extends TTContentsEvent {
    public TTViewContentEvent(String str, JSONObject jSONObject, String str2) {
        super(str, jSONObject, str2);
    }

    public static TTContentsEvent.Builder newBuilder() {
        return new TTContentsEvent.Builder(TTContentsEventConstants.ContentsEventName.EVENT_NAME_VIEW_CONTENT, b.f42142b);
    }

    public static TTContentsEvent.Builder newBuilder(String str) {
        return new TTContentsEvent.Builder(TTContentsEventConstants.ContentsEventName.EVENT_NAME_VIEW_CONTENT, str);
    }
}
