.class public final synthetic Ll/o2c0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function3;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/Counter;

    check-cast p2, Lcom/p1/mobile/putong/data/ConversationCounter;

    check-cast p3, Ljava/lang/Boolean;

    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    invoke-static {p1, p2, p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatHeaderView;->D(Lcom/p1/mobile/putong/data/Counter;Lcom/p1/mobile/putong/data/ConversationCounter;Z)Ll/bkj0;

    move-result-object p0

    return-object p0
.end method
