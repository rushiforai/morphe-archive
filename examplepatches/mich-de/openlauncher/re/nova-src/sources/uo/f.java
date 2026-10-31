package uo;

import com.amplitude.eventbridge.EventBridgeChannel;

/* loaded from: classes4.dex */
public final class f extends a {

    /* renamed from: d, reason: collision with root package name */
    public static final f f91426d = new f("A128CBC-HS256", 256);

    /* renamed from: e, reason: collision with root package name */
    public static final f f91427e = new f("A192CBC-HS384", 384);

    /* renamed from: f, reason: collision with root package name */
    public static final f f91428f = new f("A256CBC-HS512", EventBridgeChannel.QUEUE_CAPACITY);

    /* renamed from: g, reason: collision with root package name */
    public static final f f91429g = new f("A128CBC+HS256", 256);

    /* renamed from: h, reason: collision with root package name */
    public static final f f91430h = new f("A256CBC+HS512", EventBridgeChannel.QUEUE_CAPACITY);

    /* renamed from: i, reason: collision with root package name */
    public static final f f91431i = new f("A128GCM", 128);

    /* renamed from: j, reason: collision with root package name */
    public static final f f91432j = new f("A192GCM", 192);

    /* renamed from: k, reason: collision with root package name */
    public static final f f91433k = new f("A256GCM", 256);

    /* renamed from: l, reason: collision with root package name */
    public static final f f91434l = new f("XC20P", 256);

    /* renamed from: c, reason: collision with root package name */
    public final int f91435c;

    public f(String str, int i5) {
        super(str);
        this.f91435c = i5;
    }
}
