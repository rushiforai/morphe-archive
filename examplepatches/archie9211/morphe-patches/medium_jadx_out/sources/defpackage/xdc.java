package defpackage;

import gen.model.SignalReason;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class xdc {
    public static SignalReason a(int i) {
        switch (i) {
            case 0:
                return SignalReason.DISMISS_TOP_STORIES;
            case 1:
                return SignalReason.LESS_LIKE_POST;
            case 2:
                return SignalReason.DOWNVOTE_TAG;
            case 3:
                return SignalReason.DOWNVOTE_AUTHOR;
            case 4:
                return SignalReason.DOWNVOTE_COLLECTION;
            case 5:
                return SignalReason.DOWNVOTE_RECOMMENDER;
            case 6:
                return SignalReason.DISMISS_USER_SUGGESTION;
            case 7:
                return SignalReason.DOWNVOTE_TOPIC;
            case 8:
                return SignalReason.DISMISS_TOPIC;
            case 9:
                return SignalReason.DISMISS_POPCHUNK;
            case 10:
                return SignalReason.DISMISS_TODAYS_HIGHLIGHTS;
            case 11:
                return SignalReason.DISMISS_STORY;
            case 12:
                return SignalReason.MUTE_AUTHOR;
            case 13:
                return SignalReason.MUTE_COLLECTION;
            default:
                return null;
        }
    }
}
