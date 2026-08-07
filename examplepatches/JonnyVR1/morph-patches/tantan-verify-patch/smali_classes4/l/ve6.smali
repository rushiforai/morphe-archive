.class public final synthetic Ll/ve6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;

.field public final synthetic b:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ve6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;

    iput-object p2, p0, Ll/ve6;->b:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    iput p3, p0, Ll/ve6;->c:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ve6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;

    iget-object v1, p0, Ll/ve6;->b:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    iget p0, p0, Ll/ve6;->c:I

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->l0(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;ILandroid/view/View;)V

    return-void
.end method
