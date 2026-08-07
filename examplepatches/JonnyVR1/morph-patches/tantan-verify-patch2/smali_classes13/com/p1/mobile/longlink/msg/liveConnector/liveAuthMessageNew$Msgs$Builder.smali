.class public final Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$MsgsOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs;",
        "Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$MsgsOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs;->j()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs;

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

.method public synthetic constructor <init>(Ll/w4r0;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public addAllMsgs(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs$Builder;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs;->a(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addMsgs(ILcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg$Builder;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs$Builder;
    .locals 1

    .line 16
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 17
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs;->b(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs;ILcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg$Builder;)V

    return-object p0
.end method

.method public addMsgs(ILcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs;->c(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs;ILcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;)V

    return-object p0
.end method

.method public addMsgs(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg$Builder;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs$Builder;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 15
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs;->d(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs;Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg$Builder;)V

    return-object p0
.end method

.method public addMsgs(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs;->e(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs;Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearMsgs()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs;->f(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getMsgs(I)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs;->getMsgs(I)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getMsgsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs;->getMsgsCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getMsgsList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs;->getMsgsList()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public removeMsgs(I)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs;->g(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setMsgs(ILcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg$Builder;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs;->h(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs;ILcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg$Builder;)V

    return-object p0
.end method

.method public setMsgs(ILcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs;->i(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs;ILcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
