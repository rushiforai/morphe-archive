.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView$a;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public call()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView$a;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->M1(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;)Landroid/view/View$OnClickListener;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView$a;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->M1(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;)Landroid/view/View$OnClickListener;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView$a;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 20
    .line 21
    invoke-interface {v0, p0}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method
