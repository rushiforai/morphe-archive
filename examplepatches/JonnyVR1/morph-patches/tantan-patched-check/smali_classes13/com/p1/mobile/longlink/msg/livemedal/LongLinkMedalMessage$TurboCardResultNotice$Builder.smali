.class public final Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNoticeOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;",
        "Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNoticeOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->i()Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

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

.method public synthetic constructor <init>(Ll/k3w;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearRoomId()Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->a(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearTotalAudience()Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->b(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearType()Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->c(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getRoomId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->getRoomId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getRoomIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->getRoomIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getTotalAudience()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->getTotalAudience()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getType()Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$CardTypeEnum;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->getType()Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$CardTypeEnum;

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
    check-cast p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->getTypeValue()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public setRoomId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->d(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setRoomIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->e(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setTotalAudience(J)Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->f(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setType(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$CardTypeEnum;)Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->g(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$CardTypeEnum;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setTypeValue(I)Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->h(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
