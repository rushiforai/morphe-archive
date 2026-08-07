.class public Ll/q510;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/e0m;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/q510$a;
    }
.end annotation


# instance fields
.field public final a:Ll/v1f;

.field public final b:Landroid/content/Context;

.field public c:Landroid/view/ViewGroup;

.field public d:Landroid/view/ViewGroup;

.field public e:Landroid/view/SurfaceView;

.field public f:Ll/p510;

.field public g:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/v1f;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/q510;->a:Ll/v1f;

    .line 5
    .line 6
    iput-object p1, p0, Ll/q510;->b:Landroid/content/Context;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/q510;->c:Landroid/view/ViewGroup;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Ll/q510;->d:Landroid/view/ViewGroup;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iget-object v0, p0, Ll/q510;->d:Landroid/view/ViewGroup;

    .line 20
    .line 21
    iget-object v1, p0, Ll/q510;->c:Landroid/view/ViewGroup;

    .line 22
    .line 23
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    iget-object v0, p0, Ll/q510;->c:Landroid/view/ViewGroup;

    .line 35
    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/q510;->c:Landroid/view/ViewGroup;

    .line 42
    .line 43
    const/4 v1, 0x1

    .line 44
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Ll/q510;->e()V

    .line 48
    .line 49
    .line 50
    :cond_1
    iget-object v0, p0, Ll/q510;->f:Ll/p510;

    .line 51
    .line 52
    if-eqz v0, :cond_2

    .line 53
    .line 54
    new-instance v1, Ll/q510$a;

    .line 55
    .line 56
    iget-object v2, p0, Ll/q510;->b:Landroid/content/Context;

    .line 57
    .line 58
    iget-object v3, p0, Ll/q510;->c:Landroid/view/ViewGroup;

    .line 59
    .line 60
    iget-object v4, p0, Ll/q510;->d:Landroid/view/ViewGroup;

    .line 61
    .line 62
    iget-object p0, p0, Ll/q510;->e:Landroid/view/SurfaceView;

    .line 63
    .line 64
    invoke-direct {v1, v2, v3, v4, p0}, Ll/q510$a;-><init>(Landroid/content/Context;Landroid/view/ViewGroup;Landroid/view/ViewGroup;Landroid/view/SurfaceView;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, v1}, Ll/p510;->d(Ll/q510$a;)V

    .line 68
    .line 69
    .line 70
    :cond_2
    :goto_0
    return-void
.end method

.method public b(Landroid/widget/FrameLayout;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/q510;->c()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/q510;->c:Landroid/view/ViewGroup;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    const/4 v0, -0x1

    .line 13
    if-ne p1, v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/q510;->c:Landroid/view/ViewGroup;

    .line 16
    .line 17
    invoke-static {}, Landroid/view/View;->generateViewId()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    invoke-virtual {p0, p1}, Landroid/view/View;->setId(I)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public c()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/q510;->e:Landroid/view/SurfaceView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iput-object v1, p0, Ll/q510;->e:Landroid/view/SurfaceView;

    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ll/q510;->c:Landroid/view/ViewGroup;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 13
    .line 14
    .line 15
    iput-object v1, p0, Ll/q510;->c:Landroid/view/ViewGroup;

    .line 16
    .line 17
    :cond_1
    return-void
.end method

.method public d(Ll/p510;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/q510;->f()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/q510;->f:Ll/p510;

    .line 5
    .line 6
    new-instance v0, Ll/q510$a;

    .line 7
    .line 8
    iget-object v1, p0, Ll/q510;->b:Landroid/content/Context;

    .line 9
    .line 10
    iget-object v2, p0, Ll/q510;->c:Landroid/view/ViewGroup;

    .line 11
    .line 12
    iget-object v3, p0, Ll/q510;->d:Landroid/view/ViewGroup;

    .line 13
    .line 14
    iget-object p0, p0, Ll/q510;->e:Landroid/view/SurfaceView;

    .line 15
    .line 16
    invoke-direct {v0, v1, v2, v3, p0}, Ll/q510$a;-><init>(Landroid/content/Context;Landroid/view/ViewGroup;Landroid/view/ViewGroup;Landroid/view/SurfaceView;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, v0}, Ll/p510;->d(Ll/q510$a;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final e()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/q510;->c:Landroid/view/ViewGroup;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Landroid/view/SurfaceView;

    .line 7
    .line 8
    iget-object v1, p0, Ll/q510;->b:Landroid/content/Context;

    .line 9
    .line 10
    invoke-direct {v0, v1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/q510;->e:Landroid/view/SurfaceView;

    .line 14
    .line 15
    iget-object v1, p0, Ll/q510;->c:Landroid/view/ViewGroup;

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/q510;->e:Landroid/view/SurfaceView;

    .line 21
    .line 22
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 23
    .line 24
    sget v2, Ll/bnl0;->e:I

    .line 25
    .line 26
    invoke-direct {v1, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/q510;->a:Ll/v1f;

    .line 33
    .line 34
    iget-object v0, v0, Ll/v1f;->c:Ll/a210;

    .line 35
    .line 36
    iget-object p0, p0, Ll/q510;->e:Landroid/view/SurfaceView;

    .line 37
    .line 38
    invoke-virtual {v0, p0}, Ll/a210;->h1(Landroid/view/SurfaceView;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q510;->f:Ll/p510;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/p510;->b()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/q510;->f:Ll/p510;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/p510;->c()V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Ll/q510;->f:Ll/p510;

    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public g()V
    .locals 0

    .line 1
    return-void
.end method

.method public h()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/q510;->c:Landroid/view/ViewGroup;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Ll/q510;->e:Landroid/view/SurfaceView;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-boolean v2, p0, Ll/q510;->g:Z

    .line 10
    .line 11
    if-nez v2, :cond_0

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    iput-boolean v2, p0, Ll/q510;->g:Z

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public i()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/q510;->c:Landroid/view/ViewGroup;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/q510;->e:Landroid/view/SurfaceView;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-boolean v1, p0, Ll/q510;->g:Z

    .line 10
    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    iput-boolean v1, p0, Ll/q510;->g:Z

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Ll/q510;->c:Landroid/view/ViewGroup;

    .line 23
    .line 24
    iget-object v2, p0, Ll/q510;->e:Landroid/view/SurfaceView;

    .line 25
    .line 26
    invoke-virtual {v0, v2, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object p0, p0, Ll/q510;->f:Ll/p510;

    .line 30
    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/p510;->a()V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public j()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/q510;->e:Landroid/view/SurfaceView;

    .line 3
    .line 4
    return-void
.end method

.method public k(Landroid/widget/FrameLayout;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q510;->d:Landroid/view/ViewGroup;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iput-object p1, p0, Ll/q510;->d:Landroid/view/ViewGroup;

    .line 9
    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    const/4 v0, -0x1

    .line 17
    if-ne p1, v0, :cond_1

    .line 18
    .line 19
    iget-object p0, p0, Ll/q510;->d:Landroid/view/ViewGroup;

    .line 20
    .line 21
    invoke-static {}, Landroid/view/View;->generateViewId()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    invoke-virtual {p0, p1}, Landroid/view/View;->setId(I)V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method
