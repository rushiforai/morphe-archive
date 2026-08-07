.class public Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView;->m()V
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView$c;->a:Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView$c;->a:Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView;->x()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView$c;->a:Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView;->l:Landroid/widget/RelativeLayout;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView$c;->a:Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView;->h(Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView;)Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView;->i(Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView;Lcom/p1/mobile/android/app/Act;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView$c;->a:Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView;->b:Lv/VLinear;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView$c;->a:Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView;->e:Landroid/view/View;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView$c;->a:Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView;

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView;->f:Lv/VLinear;

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView$c;->a:Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView;->a:Lv/VLinear;

    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView$c;->a:Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView;

    .line 32
    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView;->j:Landroid/widget/RelativeLayout;

    .line 34
    .line 35
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView$c;->a:Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryView;->j:Landroid/widget/RelativeLayout;

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 43
    .line 44
    .line 45
    return-void
.end method
