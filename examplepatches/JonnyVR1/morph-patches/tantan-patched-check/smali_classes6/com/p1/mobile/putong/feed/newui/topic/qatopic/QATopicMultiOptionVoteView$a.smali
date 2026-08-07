.class public Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->v(Ll/l1i;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/l1i;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;Ll/l1i;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView$a;->b:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView$a;->a:Ll/l1i;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView$a;->a:Ll/l1i;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/l1i;->h()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView$a;->b:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView$a;->a:Ll/l1i;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->w(Ll/l1i;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView$a;->b:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;

    .line 17
    .line 18
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->T(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;)Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Ll/l1i;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView$a;->b:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;

    .line 39
    .line 40
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->w(Ll/l1i;)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView$a;->b:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;

    .line 45
    .line 46
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->T(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;)Ljava/util/List;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 51
    .line 52
    .line 53
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView$a;->b:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;

    .line 54
    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView$a;->a:Ll/l1i;

    .line 56
    .line 57
    invoke-virtual {p0}, Ll/l1i;->e()I

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->V(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;I)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView$a;->a:Ll/l1i;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/l1i;->h()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView$a;->b:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->S(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;)Landroid/graphics/drawable/Drawable;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/4 p1, 0x0

    .line 16
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView$a;->a:Ll/l1i;

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->w(Ll/l1i;)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView$a;->b:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;

    .line 26
    .line 27
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->T(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;)Ljava/util/List;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Ll/l1i;

    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView$a;->b:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;

    .line 48
    .line 49
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->w(Ll/l1i;)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView$a;->b:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;

    .line 54
    .line 55
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->T(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;)Ljava/util/List;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 60
    .line 61
    .line 62
    return-void
.end method
