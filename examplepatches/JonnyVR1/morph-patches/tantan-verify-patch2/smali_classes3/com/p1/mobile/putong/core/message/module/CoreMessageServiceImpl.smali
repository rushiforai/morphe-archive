.class public Lcom/p1/mobile/putong/core/message/module/CoreMessageServiceImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/message/service/CoreMessageInnerService;


# annotations
.annotation build Lcom/tantanapp/android/injecter/facade/annotation/Route;
    name = "CoreMessageInnerService"
    path = "/message_service/service"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public ba(Ljava/lang/String;)I
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->platinumPinChatOriginLevel:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->get(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public d8(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    new-array p0, p0, [Ll/pf60;

    .line 3
    .line 4
    const/16 v0, 0x27

    .line 5
    .line 6
    invoke-static {p1, p2, v0, p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->g2(Landroid/content/Context;Ljava/lang/String;I[Ll/pf60;)Landroid/content/Intent;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public init(Landroid/content/Context;)V
    .locals 0

    return-void
.end method

.method public yi(Lcom/p1/mobile/putong/data/User;)Z
    .locals 0

    .line 1
    invoke-static {}, Ll/o3z;->g()Ll/o3z;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/o3z;->h(Lcom/p1/mobile/putong/data/User;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public zb(Ljava/lang/String;I)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->platinumPinChatOriginLevel:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->set(Ljava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
