.class public final Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsgOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;",
        "Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsgOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->t()Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

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

.method public synthetic constructor <init>(Ll/r1w;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearAmount()Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->a(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearFromUser()Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->b(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearIcon()Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->c(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearSvgaUrl()Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->d(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearToUser()Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->e(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearType()Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->f(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getAmount()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->getAmount()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getFromUser()Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->getFromUser()Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getIcon()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->getIcon()Ljava/lang/String;

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
    check-cast p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->getIconBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getSvgaUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->getSvgaUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getSvgaUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->getSvgaUrlBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getToUser()Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->getToUser()Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getType()Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->getType()Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropType;

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
    check-cast p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->getTypeValue()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasFromUser()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->hasFromUser()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasToUser()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->hasToUser()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public mergeFromUser(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;)Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->g(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public mergeToUser(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;)Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->h(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setAmount(J)Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->i(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setFromUser(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask$Builder;)Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->j(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask$Builder;)V

    return-object p0
.end method

.method public setFromUser(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;)Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->k(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setIcon(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->l(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setIconBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->m(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSvgaUrl(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->n(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSvgaUrlBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->o(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setToUser(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask$Builder;)Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->p(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask$Builder;)V

    return-object p0
.end method

.method public setToUser(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;)Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->q(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setType(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropType;)Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->r(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropType;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setTypeValue(I)Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->s(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
