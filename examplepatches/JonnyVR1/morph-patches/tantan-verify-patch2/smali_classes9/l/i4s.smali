.class public Ll/i4s;
.super Ll/p4s;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/zod;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/p4s;-><init>(Ll/zod;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public A(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/p4s;->A(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/muj;->s(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 6
    .line 7
    .line 8
    const-string p1, "gift_message"

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->setLiveMessageType(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "live.chat.gift"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic x(Ljava/lang/String;Lcom/google/protobuf/q;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/i4s;->A(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
