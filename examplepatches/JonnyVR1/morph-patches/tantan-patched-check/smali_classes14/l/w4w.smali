.class public Ll/w4w;
.super Ll/q4w;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/q4w<",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkMomentMessage$MomentCancelLike;",
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
            "Lcom/p1/mobile/longlink/msg/connector/LongLinkMomentMessage$MomentCancelLike;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMomentMessage$MomentCancelLike;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    const-string p0, "moment.single.unlike"

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;->MSG_TYPE_MOMENT_CANCEL_LIKE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic populatePushMessage(Lcom/p1/mobile/putong/data/PushMessage;Ll/pq60;Lcom/google/protobuf/q;)V
    .locals 0

    .line 25
    check-cast p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMomentMessage$MomentCancelLike;

    invoke-virtual {p0, p1, p2, p3}, Ll/w4w;->populatePushMessage(Lcom/p1/mobile/putong/data/PushMessage;Ll/pq60;Lcom/p1/mobile/longlink/msg/connector/LongLinkMomentMessage$MomentCancelLike;)V

    return-void
.end method

.method public populatePushMessage(Lcom/p1/mobile/putong/data/PushMessage;Ll/pq60;Lcom/p1/mobile/longlink/msg/connector/LongLinkMomentMessage$MomentCancelLike;)V
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
    invoke-static {}, Lcom/p1/mobile/putong/data/IdBoxed;->new_()Lcom/p1/mobile/putong/data/IdBoxed;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    iput-object p2, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->parent:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 13
    .line 14
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->parent:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 17
    .line 18
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMomentMessage$MomentCancelLike;->getMid()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, p0, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    .line 23
    .line 24
    return-void
.end method
