.class public final Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsgOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg;",
        "Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsgOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg;->i()Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg;

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

.method public synthetic constructor <init>(Ll/u3w;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearData()Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg;->a(Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearDelaySeconds()Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg;->b(Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearReportType()Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg;->c(Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getData()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg;->getData()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getDataBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg;->getDataBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getDelaySeconds()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg;->getDelaySeconds()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getReportType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg;->getReportType()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getReportTypeBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg;->getReportTypeBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public setData(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg;->d(Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setDataBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg;->e(Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setDelaySeconds(J)Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg;->f(Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setReportType(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg;->g(Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setReportTypeBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg;->h(Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
