package gen.model;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.g04;
import defpackage.i04;
import defpackage.n1b;
import defpackage.xdc;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\u0017\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011j\u0002\b\u0012j\u0002\b\u0013j\u0002\b\u0014j\u0002\b\u0015j\u0002\b\u0016j\u0002\b\u0017j\u0002\b\u0018j\u0002\b\u0019¨\u0006\u001a"}, d2 = {"Lgen/model/SignalReason;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "xdc", "DISMISS_TOP_STORIES", "LESS_LIKE_POST", "DOWNVOTE_TAG", "DOWNVOTE_AUTHOR", "DOWNVOTE_COLLECTION", "DOWNVOTE_RECOMMENDER", "DISMISS_USER_SUGGESTION", "DOWNVOTE_TOPIC", "DISMISS_TOPIC", "DISMISS_POPCHUNK", "DISMISS_TODAYS_HIGHLIGHTS", "DISMISS_STORY", "MUTE_AUTHOR", "MUTE_COLLECTION", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class SignalReason implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ SignalReason[] $VALUES;
    public static final ProtoAdapter<SignalReason> ADAPTER;
    public static final xdc Companion;
    public static final SignalReason DISMISS_POPCHUNK;
    public static final SignalReason DISMISS_STORY;
    public static final SignalReason DISMISS_TODAYS_HIGHLIGHTS;
    public static final SignalReason DISMISS_TOPIC;
    public static final SignalReason DISMISS_TOP_STORIES;
    public static final SignalReason DISMISS_USER_SUGGESTION;
    public static final SignalReason DOWNVOTE_AUTHOR;
    public static final SignalReason DOWNVOTE_COLLECTION;
    public static final SignalReason DOWNVOTE_RECOMMENDER;
    public static final SignalReason DOWNVOTE_TAG;
    public static final SignalReason DOWNVOTE_TOPIC;
    public static final SignalReason LESS_LIKE_POST;
    public static final SignalReason MUTE_AUTHOR;
    public static final SignalReason MUTE_COLLECTION;
    private final int value;

    private static final /* synthetic */ SignalReason[] $values() {
        return new SignalReason[]{DISMISS_TOP_STORIES, LESS_LIKE_POST, DOWNVOTE_TAG, DOWNVOTE_AUTHOR, DOWNVOTE_COLLECTION, DOWNVOTE_RECOMMENDER, DISMISS_USER_SUGGESTION, DOWNVOTE_TOPIC, DISMISS_TOPIC, DISMISS_POPCHUNK, DISMISS_TODAYS_HIGHLIGHTS, DISMISS_STORY, MUTE_AUTHOR, MUTE_COLLECTION};
    }

    static {
        SignalReason signalReason = new SignalReason("DISMISS_TOP_STORIES", 0, 0);
        DISMISS_TOP_STORIES = signalReason;
        LESS_LIKE_POST = new SignalReason("LESS_LIKE_POST", 1, 1);
        DOWNVOTE_TAG = new SignalReason("DOWNVOTE_TAG", 2, 2);
        DOWNVOTE_AUTHOR = new SignalReason("DOWNVOTE_AUTHOR", 3, 3);
        DOWNVOTE_COLLECTION = new SignalReason("DOWNVOTE_COLLECTION", 4, 4);
        DOWNVOTE_RECOMMENDER = new SignalReason("DOWNVOTE_RECOMMENDER", 5, 5);
        DISMISS_USER_SUGGESTION = new SignalReason("DISMISS_USER_SUGGESTION", 6, 6);
        DOWNVOTE_TOPIC = new SignalReason("DOWNVOTE_TOPIC", 7, 7);
        DISMISS_TOPIC = new SignalReason("DISMISS_TOPIC", 8, 8);
        DISMISS_POPCHUNK = new SignalReason("DISMISS_POPCHUNK", 9, 9);
        DISMISS_TODAYS_HIGHLIGHTS = new SignalReason("DISMISS_TODAYS_HIGHLIGHTS", 10, 10);
        DISMISS_STORY = new SignalReason("DISMISS_STORY", 11, 11);
        MUTE_AUTHOR = new SignalReason("MUTE_AUTHOR", 12, 12);
        MUTE_COLLECTION = new SignalReason("MUTE_COLLECTION", 13, 13);
        SignalReason[] signalReasonArr$values = $values();
        $VALUES = signalReasonArr$values;
        $ENTRIES = new i04(signalReasonArr$values);
        Companion = new xdc();
        ADAPTER = new SignalReason$Companion$ADAPTER$1(n1b.a.b(SignalReason.class), Syntax.PROTO_2, signalReason);
    }

    private SignalReason(String str, int i, int i2) {
        this.value = i2;
    }

    public static final SignalReason fromValue(int i) {
        Companion.getClass();
        return xdc.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static SignalReason valueOf(String str) {
        return (SignalReason) Enum.valueOf(SignalReason.class, str);
    }

    public static SignalReason[] values() {
        return (SignalReason[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
