.class public final synthetic Ll/xg6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/tcj;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/android/app/c;

    check-cast p2, Lcom/p1/mobile/putong/data/Counter;

    check-cast p3, Lcom/p1/mobile/putong/data/ConversationCounter;

    check-cast p4, Ljava/lang/Boolean;

    invoke-static {p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->N4(Lcom/p1/mobile/android/app/c;Lcom/p1/mobile/putong/data/Counter;Lcom/p1/mobile/putong/data/ConversationCounter;Ljava/lang/Boolean;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method
