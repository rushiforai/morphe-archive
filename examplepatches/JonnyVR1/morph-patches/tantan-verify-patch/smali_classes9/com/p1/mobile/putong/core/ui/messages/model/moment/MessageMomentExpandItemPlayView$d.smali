.class public Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ie80$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "d"
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView$d;->a:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Exception;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView$d;->a:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;->g0()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView$d;->a:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;

    .line 7
    .line 8
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;->B(Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;)Ljava/util/Set;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Ll/ie80$b;

    .line 27
    .line 28
    invoke-interface {v0, p1}, Ll/ie80$b;->a(Ljava/lang/Exception;)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    return-void
.end method

.method public b(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView$d;->a:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;->B(Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;)Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ll/ie80$b;

    .line 22
    .line 23
    invoke-interface {v0, p1}, Ll/ie80$b;->b(I)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-void
.end method

.method public c()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView$d;->a:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;->h:Lv/VImage;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getAlpha()F

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/high16 v1, 0x3f800000    # 1.0f

    .line 10
    .line 11
    cmpg-float v0, v0, v1

    .line 12
    .line 13
    if-gez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView$d;->a:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;->h:Lv/VImage;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-wide/16 v1, 0xc8

    .line 28
    .line 29
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 34
    .line 35
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 43
    .line 44
    .line 45
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView$d;->a:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;

    .line 46
    .line 47
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;->B(Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;)Ljava/util/Set;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_1

    .line 60
    .line 61
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Ll/ie80$b;

    .line 66
    .line 67
    invoke-interface {v0}, Ll/ie80$b;->c()V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_1
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView$d;->e()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView$d;->a:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;

    .line 5
    .line 6
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;->B(Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;)Ljava/util/Set;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Ll/ie80$b;

    .line 25
    .line 26
    invoke-interface {v0}, Ll/ie80$b;->d()V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    return-void
.end method

.method public e()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView$d;->a:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;->P(Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView$d;->a:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;->h:Lv/VImage;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/high16 v1, 0x3f800000    # 1.0f

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-wide/16 v2, 0xc8

    .line 22
    .line 23
    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v4, Landroid/view/animation/LinearInterpolator;

    .line 28
    .line 29
    invoke-direct {v4}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v4}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView$d;->a:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;->f:Lv/VDraweeView;

    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    new-instance v0, Landroid/view/animation/LinearInterpolator;

    .line 56
    .line 57
    invoke-direct {v0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public f()Lcom/p1/mobile/putong/data/Video;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView$d;->a:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;->O(Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;)Lcom/p1/mobile/putong/data/Video;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public g()V
    .locals 0

    .line 1
    return-void
.end method

.method public getSurface()Landroid/view/Surface;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView$d;->a:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;->M(Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;)Landroid/view/Surface;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public onComplete()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView$d;->a:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;->B(Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;)Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Ll/ie80$b;

    .line 22
    .line 23
    invoke-interface {v1}, Ll/ie80$b;->onComplete()V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView$d;->a:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;->H(Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView$d;->a:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;

    .line 36
    .line 37
    const/4 v0, 0x1

    .line 38
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;->R(Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;Z)V

    .line 39
    .line 40
    .line 41
    :cond_1
    return-void
.end method

.method public onPause()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView$d;->a:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;->P(Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView$d;->a:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;->h:Lv/VImage;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/high16 v1, 0x3f800000    # 1.0f

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-wide/16 v1, 0xc8

    .line 22
    .line 23
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 28
    .line 29
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView$d;->a:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;

    .line 40
    .line 41
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;->B(Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;)Ljava/util/Set;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_0

    .line 54
    .line 55
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Ll/ie80$b;

    .line 60
    .line 61
    invoke-interface {v0}, Ll/ie80$b;->onPause()V

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView$d;->a:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;->h:Lv/VImage;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-wide/16 v2, 0xc8

    .line 15
    .line 16
    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v4, Landroid/view/animation/LinearInterpolator;

    .line 21
    .line 22
    invoke-direct {v4}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v4}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView$d;->a:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;->f:Lv/VDraweeView;

    .line 35
    .line 36
    invoke-virtual {v0}, Landroid/view/View;->getAlpha()F

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    cmpl-float v0, v0, v1

    .line 41
    .line 42
    if-lez v0, :cond_0

    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView$d;->a:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;->f:Lv/VDraweeView;

    .line 47
    .line 48
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 61
    .line 62
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 70
    .line 71
    .line 72
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView$d;->a:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;

    .line 73
    .line 74
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;->B(Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;)Ljava/util/Set;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-eqz v0, :cond_1

    .line 87
    .line 88
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    check-cast v0, Ll/ie80$b;

    .line 93
    .line 94
    invoke-interface {v0}, Ll/ie80$b;->onResume()V

    .line 95
    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_1
    return-void
.end method

.method public onStart()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView$d;->a:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;->B(Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;)Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ll/ie80$b;

    .line 22
    .line 23
    invoke-interface {v0}, Ll/ie80$b;->onStart()V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-void
.end method
