.class public final synthetic Ll/we6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;

.field public final synthetic b:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

.field public final synthetic c:Lcom/p1/mobile/putong/app/PutongAct;

.field public final synthetic d:Lcom/p1/mobile/putong/core/data/Conversation;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/we6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;

    iput-object p2, p0, Ll/we6;->b:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    iput-object p3, p0, Ll/we6;->c:Lcom/p1/mobile/putong/app/PutongAct;

    iput-object p4, p0, Ll/we6;->d:Lcom/p1/mobile/putong/core/data/Conversation;

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/we6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;

    iget-object v1, p0, Ll/we6;->b:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    iget-object v2, p0, Ll/we6;->c:Lcom/p1/mobile/putong/app/PutongAct;

    iget-object p0, p0, Ll/we6;->d:Lcom/p1/mobile/putong/core/data/Conversation;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->j0(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/putong/core/data/Conversation;Landroid/view/View;)Z

    move-result p0

    return p0
.end method
