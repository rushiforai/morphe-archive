.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e$b;
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e$b;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;

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
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e$b;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v0, Landroid/content/Intent;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e$b;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-class v1, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestAct;

    .line 20
    .line 21
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 25
    .line 26
    .line 27
    const-string p0, "e_more_groups_click"

    .line 28
    .line 29
    const-string p1, "p_messages_view"

    .line 30
    .line 31
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method
