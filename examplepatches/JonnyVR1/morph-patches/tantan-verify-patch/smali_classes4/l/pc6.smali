.class public final synthetic Ll/pc6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemUserStatesView;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;

.field public final synthetic c:Lcom/p1/mobile/putong/app/PutongAct;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemUserStatesView;Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;Lcom/p1/mobile/putong/app/PutongAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pc6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemUserStatesView;

    iput-object p2, p0, Ll/pc6;->b:Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;

    iput-object p3, p0, Ll/pc6;->c:Lcom/p1/mobile/putong/app/PutongAct;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pc6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemUserStatesView;

    iget-object v1, p0, Ll/pc6;->b:Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;

    iget-object p0, p0, Ll/pc6;->c:Lcom/p1/mobile/putong/app/PutongAct;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemUserStatesView;->d(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemUserStatesView;Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;Lcom/p1/mobile/putong/app/PutongAct;Landroid/view/View;)V

    return-void
.end method
