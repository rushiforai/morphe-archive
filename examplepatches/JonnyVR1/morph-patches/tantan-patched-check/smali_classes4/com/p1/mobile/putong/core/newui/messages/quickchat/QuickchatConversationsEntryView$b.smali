.class public Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView;->l()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView$b;->a:Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView$b;->a:Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView;->w()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView$b;->a:Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView;

    .line 7
    .line 8
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView;->j(Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView$b;->a:Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView;->a:Lv/VLinear;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView$b;->a:Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView;->j:Landroid/widget/RelativeLayout;

    .line 12
    .line 13
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView$b;->a:Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView;

    .line 17
    .line 18
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView;->j(Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView$b;->a:Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView;->l:Landroid/widget/RelativeLayout;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView$b;->a:Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView;->l:Landroid/widget/RelativeLayout;

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
