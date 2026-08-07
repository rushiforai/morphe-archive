.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->O(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e$a;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e$a;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 4
    .line 5
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/messages/AllPairsAct;->e2(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    const-string p0, "message_tab"

    .line 13
    .line 14
    const-string p1, "online"

    .line 15
    .line 16
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    filled-new-array {p0}, [Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string p1, "e_all_match_click"

    .line 25
    .line 26
    const-string v0, "p_messages_view"

    .line 27
    .line 28
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method
