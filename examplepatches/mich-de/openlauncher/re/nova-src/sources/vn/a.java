package vn;

import com.tiktok.appevents.edp.TTEDPEventConstants;

/* loaded from: classes3.dex */
public enum a {
    CLICK(TTEDPEventConstants.EDP_EVENT_NAME_CLICK),
    /* JADX INFO: Fake field, exist only in values array */
    INVITATION_ACCEPTED("invitationAccept");


    /* renamed from: a, reason: collision with root package name */
    public final String f92860a;

    a(String str) {
        this.f92860a = str;
    }

    @Override // java.lang.Enum
    public final String toString() {
        return this.f92860a;
    }
}
