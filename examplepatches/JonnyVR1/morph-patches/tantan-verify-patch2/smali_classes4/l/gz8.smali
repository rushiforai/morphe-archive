.class public final synthetic Ll/gz8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/ChatGroup;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/GroupApply;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/core/data/GroupApply;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gz8;->a:Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;

    iput-object p2, p0, Ll/gz8;->b:Lcom/p1/mobile/putong/core/data/ChatGroup;

    iput-object p3, p0, Ll/gz8;->c:Lcom/p1/mobile/putong/core/data/GroupApply;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gz8;->a:Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;

    iget-object v1, p0, Ll/gz8;->b:Lcom/p1/mobile/putong/core/data/ChatGroup;

    iget-object p0, p0, Ll/gz8;->c:Lcom/p1/mobile/putong/core/data/GroupApply;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->a(Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/core/data/GroupApply;Landroid/view/View;)V

    return-void
.end method
