.class public Ll/y980;
.super Ll/jk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jk2<",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkSeekTimeout;",
        "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/wbg0;Ll/zod;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wbg0<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;",
            ">;",
            "Ll/zod;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ll/jk2;-><init>(Ll/wbg0;Ll/zod;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public B(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkSeekTimeout;Ljava/lang/String;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkSeekTimeout;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkSeekTimeout;->getSeekId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const-string p2, "pk_seek_timeout"

    .line 8
    .line 9
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-object p0
.end method

.method public b()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkSeekTimeout;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkSeekTimeout;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "live.pk.seek.timeout"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic q(Lcom/google/protobuf/q;Ljava/lang/String;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkSeekTimeout;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/y980;->B(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkSeekTimeout;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic z(Ljava/lang/String;Lcom/google/protobuf/q;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkSeekTimeout;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/y980;->C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkSeekTimeout;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
