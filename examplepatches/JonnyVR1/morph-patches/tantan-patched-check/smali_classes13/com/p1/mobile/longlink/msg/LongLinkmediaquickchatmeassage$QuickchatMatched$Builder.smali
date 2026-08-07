.class public final Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatchedOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;",
        "Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatchedOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->r()Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

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

.method public synthetic constructor <init>(Ll/i4w;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearOtherUserID()Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->a(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearQueryOtherUserToken()Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->b(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearQuickchatType()Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->c(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearRtcChannel()Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->d(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearRtcChannelWaittingTime()Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->e(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearRtcToken()Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->f(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getOtherUserID()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->getOtherUserID()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getOtherUserIDBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->getOtherUserIDBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getQueryOtherUserToken()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->getQueryOtherUserToken()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getQueryOtherUserTokenBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->getQueryOtherUserTokenBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getQuickchatType()Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->getQuickchatType()Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatType;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getQuickchatTypeValue()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->getQuickchatTypeValue()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getRtcChannel()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->getRtcChannel()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getRtcChannelBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->getRtcChannelBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getRtcChannelWaittingTime()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->getRtcChannelWaittingTime()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getRtcToken()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->getRtcToken()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getRtcTokenBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->getRtcTokenBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public setOtherUserID(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->g(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setOtherUserIDBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->h(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setQueryOtherUserToken(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->i(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setQueryOtherUserTokenBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->j(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setQuickchatType(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatType;)Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->k(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatType;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setQuickchatTypeValue(I)Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->l(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setRtcChannel(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->m(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setRtcChannelBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->n(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setRtcChannelWaittingTime(J)Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->o(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setRtcToken(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->p(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setRtcTokenBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->q(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
