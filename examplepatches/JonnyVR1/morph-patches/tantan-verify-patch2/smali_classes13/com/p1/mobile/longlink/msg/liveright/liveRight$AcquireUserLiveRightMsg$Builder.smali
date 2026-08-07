.class public final Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsgOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;",
        "Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsgOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;->j()Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0}, Lcom/google/protobuf/GeneratedMessageLite$b;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>(Ll/x4r0;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearAction()Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;->a(Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearServerTimeInSeconds()Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;->b(Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearUserLiveRight()Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;->c(Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getAction()Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;->getAction()Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getActionValue()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;->getActionValue()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getServerTimeInSeconds()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;->getServerTimeInSeconds()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getUserLiveRight()Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;->getUserLiveRight()Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public hasUserLiveRight()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;->hasUserLiveRight()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public mergeUserLiveRight(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;->d(Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setAction(Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;->e(Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setActionValue(I)Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;->f(Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setServerTimeInSeconds(J)Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;->g(Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUserLiveRight(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight$Builder;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;->h(Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight$Builder;)V

    return-object p0
.end method

.method public setUserLiveRight(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;->i(Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
