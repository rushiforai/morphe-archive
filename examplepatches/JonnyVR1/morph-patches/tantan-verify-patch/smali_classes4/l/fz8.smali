.class public final synthetic Ll/fz8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/ChatGroup;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fz8;->a:Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;

    iput-object p2, p0, Ll/fz8;->b:Lcom/p1/mobile/putong/core/data/ChatGroup;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fz8;->a:Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;

    iget-object p0, p0, Ll/fz8;->b:Lcom/p1/mobile/putong/core/data/ChatGroup;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->n(Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;Lcom/p1/mobile/putong/core/data/ChatGroup;Landroid/view/View;)V

    return-void
.end method
