.class public Ll/lyi;
.super Ll/mq2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/mq2<",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Follow;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/zod;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/mq2;-><init>(Ll/zod;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public A(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Follow;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
    .locals 7

    .line 1
    new-instance v6, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 2
    .line 3
    invoke-direct {v6}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Follow;->getFollower()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    .line 7
    .line 8
    .line 9
    move-result-object p3

    .line 10
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->getId()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p3

    .line 14
    iput-object p3, v6, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->followUserId:Ljava/lang/String;

    .line 15
    .line 16
    const-string p3, "otherFollowAnchor"

    .line 17
    .line 18
    iput-object p3, v6, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->followType:Ljava/lang/String;

    .line 19
    .line 20
    iget-object p3, p0, Ll/mq2;->c:Ll/zod;

    .line 21
    .line 22
    invoke-virtual {p3}, Ll/zod;->f()Z

    .line 23
    .line 24
    .line 25
    move-result p3

    .line 26
    if-eqz p3, :cond_0

    .line 27
    .line 28
    const-string p3, "follow_b"

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const-string p3, "follow_a"

    .line 32
    .line 33
    :goto_0
    iput-object p3, v6, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->followTrackName:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Follow;->getTempdata()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 36
    .line 37
    .line 38
    move-result-object p3

    .line 39
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->getId()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Follow;->getFollower()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    const/4 v4, 0x0

    .line 48
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Follow;->getTempdata()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 49
    .line 50
    .line 51
    move-result-object v5

    .line 52
    move-object v0, p0

    .line 53
    move-object v1, p1

    .line 54
    invoke-virtual/range {v0 .. v6}, Ll/mq2;->o(Ljava/lang/String;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    iget-object p1, v0, Ll/mq2;->c:Ll/zod;

    .line 59
    .line 60
    invoke-static {p0, p1}, Ll/afu;->e(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/zod;)V

    .line 61
    .line 62
    .line 63
    return-object p0
.end method

.method public b()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Follow;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Follow;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "live.live.follow"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic q(Lcom/google/protobuf/q;Ljava/lang/String;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Follow;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/lyi;->z(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Follow;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic x(Ljava/lang/String;Lcom/google/protobuf/q;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Follow;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/lyi;->A(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Follow;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public z(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Follow;Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Follow;->getRoomId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string p2, "no_care"

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2, p2}, Ll/mq2;->r(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method
