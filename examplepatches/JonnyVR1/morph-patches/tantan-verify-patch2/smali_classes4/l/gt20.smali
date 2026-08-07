.class public final synthetic Ll/gt20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ucj;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/data/Message;

    check-cast p2, Lcom/p1/mobile/putong/core/data/ChatGroup;

    check-cast p3, Lcom/p1/mobile/putong/data/User;

    check-cast p4, Lcom/p1/mobile/putong/core/data/Conversation;

    check-cast p5, Ll/uxj0;

    invoke-static {p1, p2, p3, p4, p5}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->E2(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;Ll/uxj0;)Ll/ovb0;

    move-result-object p0

    return-object p0
.end method
