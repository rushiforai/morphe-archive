.class public Ll/p4w;
.super Ll/g2w;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/g2w<",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkPushContentMessage$PushMessage;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/g2w;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public b()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/p1/mobile/longlink/msg/connector/LongLinkPushContentMessage$PushMessage;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkPushContentMessage$PushMessage;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const-string p0, "suggested.list"

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "push.common"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic populatePushMessage(Lcom/p1/mobile/putong/data/PushMessage;Ll/pq60;Lcom/google/protobuf/q;)V
    .locals 0

    .line 8
    check-cast p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkPushContentMessage$PushMessage;

    invoke-virtual {p0, p1, p2, p3}, Ll/p4w;->populatePushMessage(Lcom/p1/mobile/putong/data/PushMessage;Ll/pq60;Lcom/p1/mobile/longlink/msg/connector/LongLinkPushContentMessage$PushMessage;)V

    return-void
.end method

.method public populatePushMessage(Lcom/p1/mobile/putong/data/PushMessage;Ll/pq60;Lcom/p1/mobile/longlink/msg/connector/LongLinkPushContentMessage$PushMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/connector/LongLinkPushContentMessage$PushMessage;->getReqId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->reqId:Ljava/lang/String;

    .line 6
    .line 7
    return-void
.end method
