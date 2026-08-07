.class public final synthetic Ll/wt20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Conversation;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wt20;->a:Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;

    iput-object p2, p0, Ll/wt20;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wt20;->a:Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;

    iget-object p0, p0, Ll/wt20;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->u3(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Lcom/p1/mobile/putong/core/data/Conversation;Landroid/view/View;)Z

    move-result p0

    return p0
.end method
