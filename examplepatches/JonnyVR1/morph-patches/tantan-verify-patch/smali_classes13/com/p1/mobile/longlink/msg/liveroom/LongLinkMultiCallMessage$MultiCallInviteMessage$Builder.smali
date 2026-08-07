.class public final Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessageOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessageOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;->h()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;

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

.method public synthetic constructor <init>(Ll/m3w;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearMultiCallInvite()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;->a(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearType()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;->b(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getMultiCallInvite()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;->getMultiCallInvite()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getType()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage$Type;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;->getType()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage$Type;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getTypeValue()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;->getTypeValue()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasMultiCallInvite()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;->hasMultiCallInvite()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public mergeMultiCallInvite(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;->c(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setMultiCallInvite(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;->d(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite$Builder;)V

    return-object p0
.end method

.method public setMultiCallInvite(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;->e(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setType(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage$Type;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;->f(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage$Type;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setTypeValue(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;->g(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
