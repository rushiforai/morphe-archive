.class public final Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEventOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;",
        "Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEventOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->j()Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

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
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearEventName()Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->a(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearStatus()Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->b(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearVersion()Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->c(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getEventName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->getEventName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getEventNameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->getEventNameBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getStatus()Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->getStatus()Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getVersion()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->getVersion()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public hasStatus()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->hasStatus()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public mergeStatus(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;)Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->d(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setEventName(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->e(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setEventNameBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->f(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setStatus(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel$Builder;)Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->g(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel$Builder;)V

    return-object p0
.end method

.method public setStatus(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;)Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->h(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setVersion(J)Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->i(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
