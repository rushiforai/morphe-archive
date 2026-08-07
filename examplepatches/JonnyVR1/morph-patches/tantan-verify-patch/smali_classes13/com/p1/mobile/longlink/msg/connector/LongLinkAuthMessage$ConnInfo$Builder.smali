.class public final Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfoOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfoOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->u()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

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

.method public synthetic constructor <init>(Ll/a2w;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearLoc()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->a(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearLocale()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->b(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearRoomId()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->c(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearSide()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->d(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearSource()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->e(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearUa()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->f(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getLoc()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->getLoc()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getLocale()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->getLocale()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getLocaleBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->getLocaleBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getRoomId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->getRoomId()Ljava/lang/String;

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
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->getRoomIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getSide()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->getSide()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getSideValue()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->getSideValue()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getSource()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->getSource()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getSourceValue()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->getSourceValue()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getUa()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->getUa()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public hasLoc()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->hasLoc()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasUa()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->hasUa()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public mergeLoc(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->g(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public mergeUa(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->h(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setLoc(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location$Builder;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->i(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location$Builder;)V

    return-object p0
.end method

.method public setLoc(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->j(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setLocale(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->k(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setLocaleBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->l(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setRoomId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->m(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setRoomIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->n(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSide(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->o(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSideValue(I)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->p(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSource(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->q(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSourceValue(I)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->r(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUa(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent$Builder;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->s(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent$Builder;)V

    return-object p0
.end method

.method public setUa(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->t(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
