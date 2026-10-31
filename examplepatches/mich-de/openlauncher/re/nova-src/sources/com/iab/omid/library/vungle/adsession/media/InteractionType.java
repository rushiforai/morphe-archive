package com.iab.omid.library.vungle.adsession.media;

import com.tiktok.appevents.edp.TTEDPEventConstants;

/* loaded from: classes3.dex */
public enum InteractionType {
    CLICK(TTEDPEventConstants.EDP_EVENT_NAME_CLICK),
    INVITATION_ACCEPTED("invitationAccept");

    public String interactionType;

    InteractionType(String str) {
        this.interactionType = str;
    }

    @Override // java.lang.Enum
    public String toString() {
        return this.interactionType;
    }
}
