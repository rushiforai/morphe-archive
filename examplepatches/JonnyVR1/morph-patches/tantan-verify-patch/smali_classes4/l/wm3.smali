.class public Ll/wm3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qa3;


# instance fields
.field public a:I

.field public final b:Z

.field public c:Lcom/sunshine/engine/particle/SceneView;

.field public d:Landroid/view/ViewGroup;

.field public e:Lcom/p1/mobile/putong/core/ui/home/BounceButton;

.field public f:Landroid/widget/FrameLayout;

.field public g:Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;

.field public h:Lv/VText;


# direct methods
.method public constructor <init>(Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/wm3;->a:I

    .line 6
    .line 7
    iput-boolean p1, p0, Ll/wm3;->b:Z

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    instance-of p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAct;

    .line 2
    .line 3
    invoke-static {p1}, Ll/oa3;->d(Z)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/b83;->k(Lcom/p1/mobile/android/app/Act;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iput-object p2, p0, Ll/wm3;->d:Landroid/view/ViewGroup;

    .line 2
    .line 3
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0, p2}, Ll/wm3;->g(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    iget-object p2, p0, Ll/wm3;->e:Lcom/p1/mobile/putong/core/ui/home/BounceButton;

    .line 11
    .line 12
    iget-boolean v0, p0, Ll/wm3;->b:Z

    .line 13
    .line 14
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->setBorderOuterCircle(Z)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/wm3;->h:Lv/VText;

    .line 18
    .line 19
    new-instance p2, Ll/vm3;

    .line 20
    .line 21
    invoke-direct {p2, p1}, Ll/vm3;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p0, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public b()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wm3;->e:Lcom/p1/mobile/putong/core/ui/home/BounceButton;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(I)V
    .locals 2

    .line 1
    iput p1, p0, Ll/wm3;->a:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p1, v0, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    :goto_0
    iget-object p1, p0, Ll/wm3;->e:Lcom/p1/mobile/putong/core/ui/home/BounceButton;

    .line 9
    .line 10
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    iget-object p1, p0, Ll/wm3;->e:Lcom/p1/mobile/putong/core/ui/home/BounceButton;

    .line 17
    .line 18
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-ne p1, v0, :cond_1

    .line 23
    .line 24
    iget-object p1, p0, Ll/wm3;->e:Lcom/p1/mobile/putong/core/ui/home/BounceButton;

    .line 25
    .line 26
    xor-int/lit8 v1, v0, 0x1

    .line 27
    .line 28
    invoke-static {p1, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Ll/wm3;->h:Lv/VText;

    .line 32
    .line 33
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Ll/wm3;->g:Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;

    .line 37
    .line 38
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Ll/wm3;->f:Landroid/widget/FrameLayout;

    .line 42
    .line 43
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Ll/wm3;->i()V

    .line 47
    .line 48
    .line 49
    :cond_1
    return-void
.end method

.method public d(Ljava/lang/CharSequence;I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wm3;->h:Lv/VText;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/wm3;->h:Lv/VText;

    .line 10
    .line 11
    const-string v1, "%sx"

    .line 12
    .line 13
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/wm3;->g:Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;

    .line 25
    .line 26
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->setProgress(I)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public bridge synthetic e()Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wm3;->h()Lcom/sunshine/engine/particle/SceneView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public g(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/xm3;->b(Ll/wm3;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public h()Lcom/sunshine/engine/particle/SceneView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wm3;->c:Lcom/sunshine/engine/particle/SceneView;

    .line 2
    .line 3
    return-object p0
.end method

.method public final i()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/wm3;->c:Lcom/sunshine/engine/particle/SceneView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget v0, p0, Ll/wm3;->a:I

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    const/4 v2, 0x1

    .line 13
    if-ne v0, v2, :cond_0

    .line 14
    .line 15
    move v0, v2

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v0, v1

    .line 18
    :goto_0
    iget-object v3, p0, Ll/wm3;->c:Lcom/sunshine/engine/particle/SceneView;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v4, p0, Ll/wm3;->d:Landroid/view/ViewGroup;

    .line 23
    .line 24
    invoke-static {v4}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    if-eqz v4, :cond_1

    .line 29
    .line 30
    move v1, v2

    .line 31
    :cond_1
    invoke-static {v3, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Ll/wm3;->c:Lcom/sunshine/engine/particle/SceneView;

    .line 35
    .line 36
    invoke-virtual {v1}, Lcom/sunshine/engine/base/AnimView;->e()V

    .line 37
    .line 38
    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    iget-object v0, p0, Ll/wm3;->c:Lcom/sunshine/engine/particle/SceneView;

    .line 42
    .line 43
    const-string v1, "animations/boost/config.xml"

    .line 44
    .line 45
    const-string v3, "animations/boost/pic"

    .line 46
    .line 47
    filled-new-array {v1, v3}, [Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v0, v1}, Lcom/sunshine/engine/base/AnimView;->d([Ljava/lang/String;)Z

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Ll/wm3;->c:Lcom/sunshine/engine/particle/SceneView;

    .line 55
    .line 56
    invoke-virtual {p0, v2}, Lcom/sunshine/engine/base/AnimView;->b(Z)Lcom/sunshine/engine/base/AnimView;

    .line 57
    .line 58
    .line 59
    :cond_2
    return-void
.end method

.method public j(Lcom/sunshine/engine/particle/SceneView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wm3;->c:Lcom/sunshine/engine/particle/SceneView;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/wm3;->i()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
