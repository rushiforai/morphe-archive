.class public final Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsgOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg;",
        "Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsgOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg;->i()Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg;

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

.method public synthetic constructor <init>(Ll/g3w;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearIcon()Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg;->a(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearRoomId()Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg;->b(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearText()Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg;->c(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getIcon()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg;->getIcon()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getIconBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg;->getIconBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getRoomId()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg;->getRoomId()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getText()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg;->getText()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getTextBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg;->getTextBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public setIcon(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg;->d(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setIconBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg;->e(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setRoomId(J)Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg;->f(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setText(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg;->g(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setTextBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg;->h(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardEventMsg;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
