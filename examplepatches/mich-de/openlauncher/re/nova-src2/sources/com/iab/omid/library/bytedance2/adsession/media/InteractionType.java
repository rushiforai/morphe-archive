package com.iab.omid.library.bytedance2.adsession.media;

import com.tiktok.appevents.edp.TTEDPEventConstants;

/* loaded from: classes3.dex */
public enum InteractionType {
    CLICK(TTEDPEventConstants.EDP_EVENT_NAME_CLICK),
    INVITATION_ACCEPTED("invitationAccept");

    String interactionType;

    InteractionType(String str) {
        this.interactionType = str;
    }

    @Override // java.lang.Enum
    public String toString() {
        return this.interactionType;
    }
}
