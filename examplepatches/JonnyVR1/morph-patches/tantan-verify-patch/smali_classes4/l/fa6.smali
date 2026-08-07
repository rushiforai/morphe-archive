.class public final synthetic Ll/fa6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;

.field public final synthetic b:Lcom/p1/mobile/putong/data/UserLiveLabel;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;Lcom/p1/mobile/putong/data/UserLiveLabel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fa6;->a:Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;

    iput-object p2, p0, Ll/fa6;->b:Lcom/p1/mobile/putong/data/UserLiveLabel;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fa6;->a:Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;

    iget-object p0, p0, Ll/fa6;->b:Lcom/p1/mobile/putong/data/UserLiveLabel;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->M0(Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;Lcom/p1/mobile/putong/data/UserLiveLabel;Landroid/view/View;)V

    return-void
.end method
