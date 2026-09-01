package gen.model;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.g04;
import defpackage.hg8;
import defpackage.i04;
import defpackage.n1b;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\f\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000e¨\u0006\u000f"}, d2 = {"Lgen/model/NewsletterV3Type;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "hg8", "NEWSLETTER_TYPE_UNKNOWN", "NEWSLETTER_TYPE_COLLECTION", "NEWSLETTER_TYPE_AUTHOR", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class NewsletterV3Type implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ NewsletterV3Type[] $VALUES;
    public static final ProtoAdapter<NewsletterV3Type> ADAPTER;
    public static final hg8 Companion;
    public static final NewsletterV3Type NEWSLETTER_TYPE_AUTHOR;
    public static final NewsletterV3Type NEWSLETTER_TYPE_COLLECTION;
    public static final NewsletterV3Type NEWSLETTER_TYPE_UNKNOWN;
    private final int value;

    private static final /* synthetic */ NewsletterV3Type[] $values() {
        return new NewsletterV3Type[]{NEWSLETTER_TYPE_UNKNOWN, NEWSLETTER_TYPE_COLLECTION, NEWSLETTER_TYPE_AUTHOR};
    }

    static {
        NewsletterV3Type newsletterV3Type = new NewsletterV3Type("NEWSLETTER_TYPE_UNKNOWN", 0, 0);
        NEWSLETTER_TYPE_UNKNOWN = newsletterV3Type;
        NEWSLETTER_TYPE_COLLECTION = new NewsletterV3Type("NEWSLETTER_TYPE_COLLECTION", 1, 1);
        NEWSLETTER_TYPE_AUTHOR = new NewsletterV3Type("NEWSLETTER_TYPE_AUTHOR", 2, 2);
        NewsletterV3Type[] newsletterV3TypeArr$values = $values();
        $VALUES = newsletterV3TypeArr$values;
        $ENTRIES = new i04(newsletterV3TypeArr$values);
        Companion = new hg8();
        ADAPTER = new NewsletterV3Type$Companion$ADAPTER$1(n1b.a.b(NewsletterV3Type.class), Syntax.PROTO_2, newsletterV3Type);
    }

    private NewsletterV3Type(String str, int i, int i2) {
        this.value = i2;
    }

    public static final NewsletterV3Type fromValue(int i) {
        Companion.getClass();
        return hg8.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static NewsletterV3Type valueOf(String str) {
        return (NewsletterV3Type) Enum.valueOf(NewsletterV3Type.class, str);
    }

    public static NewsletterV3Type[] values() {
        return (NewsletterV3Type[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
