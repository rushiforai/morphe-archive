.class public Ll/y4w;
.super Ll/q4w;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/q4w<",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkMomentMessage$MomentLike;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/q4w;-><init>()V

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
            "Lcom/p1/mobile/longlink/msg/connector/LongLinkMomentMessage$MomentLike;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMomentMessage$MomentLike;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    const-string p0, "moment.single.like"

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Lcom/p1/mobile/putong/data/PushMessage;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/q4w;->e(Lcom/p1/mobile/putong/data/PushMessage;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;->MSG_TYPE_MOMENT_LIKE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic populatePushMessage(Lcom/p1/mobile/putong/data/PushMessage;Ll/pq60;Lcom/google/protobuf/q;)V
    .locals 0

    .line 19
    check-cast p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMomentMessage$MomentLike;

    invoke-virtual {p0, p1, p2, p3}, Ll/y4w;->populatePushMessage(Lcom/p1/mobile/putong/data/PushMessage;Ll/pq60;Lcom/p1/mobile/longlink/msg/connector/LongLinkMomentMessage$MomentLike;)V

    return-void
.end method

.method public populatePushMessage(Lcom/p1/mobile/putong/data/PushMessage;Ll/pq60;Lcom/p1/mobile/longlink/msg/connector/LongLinkMomentMessage$MomentLike;)V
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/PushMessageContent;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 7
    .line 8
    const-string p1, "moment"

    .line 9
    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->type:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMomentMessage$MomentLike;->getOtherUserId()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    .line 17
    .line 18
    return-void
.end method
