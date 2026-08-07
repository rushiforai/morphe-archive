.class public Ll/k4w;
.super Ll/l4w;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/l4w<",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AuthAck;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ll/pq60;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ll/pq60;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/y20;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ll/pq60;",
            ">;",
            "Ll/y20<",
            "Ll/pq60;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/l4w;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/k4w;->a:Ll/y20;

    .line 5
    .line 6
    iput-object p2, p0, Ll/k4w;->b:Ll/y20;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Lcom/google/protobuf/q;Ll/pq60;)Z
    .locals 1

    .line 1
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AuthAck;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AuthAck;->getCode()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AuthResCode;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AuthResCode;->AUTH_SUCC:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AuthResCode;

    .line 8
    .line 9
    if-ne p1, v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/k4w;->a:Ll/y20;

    .line 12
    .line 13
    invoke-interface {p0, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object p0, p0, Ll/k4w;->b:Ll/y20;

    .line 18
    .line 19
    invoke-interface {p0, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    :goto_0
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method public b()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AuthAck;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AuthAck;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public f()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;->MSG_TYPE_AUTH_ACK:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;

    .line 2
    .line 3
    return-object p0
.end method
