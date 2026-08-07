.class public Ll/i3j0;
.super Ll/jk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jk2<",
        "Lcom/p1/mobile/longlink/msg/liveright/liveRight$TopChatUpdateNotice;",
        "Lcom/p1/mobile/longlink/msg/liveright/liveRight$TopChatUpdateNotice;",
        ">;"
    }
.end annotation


# instance fields
.field public h:J


# direct methods
.method public constructor <init>(Ll/wbg0;Ll/zod;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wbg0<",
            "Lcom/p1/mobile/longlink/msg/liveright/liveRight$TopChatUpdateNotice;",
            "Lcom/p1/mobile/longlink/msg/liveright/liveRight$TopChatUpdateNotice;",
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
.method public B(Lcom/p1/mobile/longlink/msg/liveright/liveRight$TopChatUpdateNotice;Ljava/lang/String;)Z
    .locals 4

    .line 1
    const/4 p2, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return p2

    .line 5
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$TopChatUpdateNotice;->getTimestamp()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    iget-wide v2, p0, Ll/i3j0;->h:J

    .line 10
    .line 11
    cmp-long v0, v0, v2

    .line 12
    .line 13
    if-lez v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$TopChatUpdateNotice;->getTimestamp()J

    .line 16
    .line 17
    .line 18
    move-result-wide p1

    .line 19
    iput-wide p1, p0, Ll/i3j0;->h:J

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_1
    return p2
.end method

.method public C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveright/liveRight$TopChatUpdateNotice;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$TopChatUpdateNotice;
    .locals 0

    .line 1
    return-object p2
.end method

.method public b()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/p1/mobile/longlink/msg/liveright/liveRight$TopChatUpdateNotice;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$TopChatUpdateNotice;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "live.topChat.update"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic q(Lcom/google/protobuf/q;Ljava/lang/String;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$TopChatUpdateNotice;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/i3j0;->B(Lcom/p1/mobile/longlink/msg/liveright/liveRight$TopChatUpdateNotice;Ljava/lang/String;)Z

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
    check-cast p2, Lcom/p1/mobile/longlink/msg/liveright/liveRight$TopChatUpdateNotice;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/i3j0;->C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveright/liveRight$TopChatUpdateNotice;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$TopChatUpdateNotice;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
