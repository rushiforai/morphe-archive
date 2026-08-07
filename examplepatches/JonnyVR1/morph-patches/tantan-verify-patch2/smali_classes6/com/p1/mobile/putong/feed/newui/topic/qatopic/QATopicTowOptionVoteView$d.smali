.class public Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$d;
.super Ll/cog;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->v(Ll/l1i;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic f:Ll/l1i;

.field public final synthetic g:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;IILl/l1i;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$d;->g:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;

    .line 2
    .line 3
    iput-object p4, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$d;->f:Ll/l1i;

    .line 4
    .line 5
    invoke-direct {p0, p2, p3}, Ll/cog;-><init>(II)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Z)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/aog;->a(Z)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    invoke-virtual {p0, p1}, Ll/aog;->c(Z)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-ne v0, p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$d;->g:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$d;->f:Ll/l1i;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/l1i;->c()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->a0(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const/16 v0, 0x8

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 26
    .line 27
    .line 28
    :cond_0
    const/4 p1, 0x0

    .line 29
    const/4 v0, 0x0

    .line 30
    invoke-virtual {p0, p1, v0}, Ll/cog;->onAnimationStart(Landroid/animation/Animator;Z)V

    .line 31
    .line 32
    .line 33
    return-void
.end method
