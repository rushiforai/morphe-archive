.class public Ll/j04;
.super Ll/o510;
.source "SourceFile"


# instance fields
.field public b:Landroid/widget/FrameLayout;

.field public c:Landroid/view/SurfaceView;

.field public d:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Long;",
            "Landroid/view/SurfaceView;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ljava/util/Map$Entry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map$Entry<",
            "Ljava/lang/Long;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/o510;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/j04;->d:Ljava/util/HashMap;

    .line 10
    .line 11
    return-void
.end method

.method private g()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/j04;->b:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/widget/FrameLayout;

    .line 6
    .line 7
    iget-object v1, p0, Ll/o510;->a:Ll/r510$a;

    .line 8
    .line 9
    iget-object v1, v1, Ll/r510$a;->a:Landroid/content/Context;

    .line 10
    .line 11
    invoke-direct {v0, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/j04;->b:Landroid/widget/FrameLayout;

    .line 15
    .line 16
    const/high16 v1, -0x1000000

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Ll/o510;->a:Ll/r510$a;

    .line 22
    .line 23
    iget-object v0, v0, Ll/r510$a;->c:Landroid/view/ViewGroup;

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    iget-object v0, p0, Ll/j04;->b:Landroid/widget/FrameLayout;

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    if-nez v0, :cond_1

    .line 34
    .line 35
    iget-object v0, p0, Ll/o510;->a:Ll/r510$a;

    .line 36
    .line 37
    iget-object v0, v0, Ll/r510$a;->c:Landroid/view/ViewGroup;

    .line 38
    .line 39
    iget-object v1, p0, Ll/j04;->b:Landroid/widget/FrameLayout;

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/o510;->a:Ll/r510$a;

    .line 45
    .line 46
    iget-object v0, v0, Ll/r510$a;->c:Landroid/view/ViewGroup;

    .line 47
    .line 48
    const/4 v1, 0x1

    .line 49
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 50
    .line 51
    .line 52
    :cond_1
    invoke-virtual {p0}, Ll/j04;->n()V

    .line 53
    .line 54
    .line 55
    return-void
.end method


# virtual methods
.method public b()V
    .locals 2

    .line 1
    const-string v0, "refreshLayout"

    .line 2
    .line 3
    invoke-static {v0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/j04;->e:Ljava/util/Map$Entry;

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/j04;->k()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ljava/lang/Long;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Ll/j04;->d:Ljava/util/HashMap;

    .line 24
    .line 25
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Landroid/view/SurfaceView;

    .line 30
    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    iput-object v0, p0, Ll/j04;->c:Landroid/view/SurfaceView;

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/j04;->l()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/j04;->h()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/j04;->e:Ljava/util/Map$Entry;

    .line 6
    .line 7
    return-void
.end method

.method public e(Ll/r510$a;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/o510;->e(Ll/r510$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f(Landroid/view/SurfaceView;J)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "addRemoteView uid:"

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/j04;->d:Ljava/util/HashMap;

    .line 22
    .line 23
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-virtual {p0, p2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public h()V
    .locals 1

    .line 1
    const-string v0, "cleanRemote"

    .line 2
    .line 3
    invoke-static {v0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/j04;->i()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/j04;->d:Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Ll/j04;->c:Landroid/view/SurfaceView;

    .line 16
    .line 17
    return-void
.end method

.method public i()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/j04;->b:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Ll/o510;->a:Ll/r510$a;

    .line 6
    .line 7
    iget-object v1, v1, Ll/r510$a;->c:Landroid/view/ViewGroup;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/o510;->a:Ll/r510$a;

    .line 15
    .line 16
    iget-object v0, v0, Ll/r510$a;->c:Landroid/view/ViewGroup;

    .line 17
    .line 18
    iget-object v1, p0, Ll/j04;->b:Landroid/widget/FrameLayout;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    iput-object v0, p0, Ll/j04;->b:Landroid/widget/FrameLayout;

    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public j(J)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j04;->d:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public k()V
    .locals 4

    .line 1
    const-string v0, "setLocalFull"

    .line 2
    .line 3
    invoke-static {v0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/j04;->i()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/o510;->a:Ll/r510$a;

    .line 10
    .line 11
    iget-object v1, v0, Ll/r510$a;->d:Landroid/view/SurfaceView;

    .line 12
    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    iget-object v0, v0, Ll/r510$a;->b:Landroid/view/ViewGroup;

    .line 16
    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iget-object v1, p0, Ll/o510;->a:Ll/r510$a;

    .line 25
    .line 26
    iget-object v1, v1, Ll/r510$a;->b:Landroid/view/ViewGroup;

    .line 27
    .line 28
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    iget-object v2, p0, Ll/o510;->a:Ll/r510$a;

    .line 33
    .line 34
    iget-object v2, v2, Ll/r510$a;->d:Landroid/view/SurfaceView;

    .line 35
    .line 36
    invoke-static {v2}, Ll/o510;->a(Landroid/view/SurfaceView;)Landroid/widget/FrameLayout$LayoutParams;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    const/4 v3, 0x0

    .line 41
    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 42
    .line 43
    iput v0, v2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 44
    .line 45
    iput v1, v2, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 46
    .line 47
    iget-object v0, p0, Ll/o510;->a:Ll/r510$a;

    .line 48
    .line 49
    iget-object v0, v0, Ll/r510$a;->d:Landroid/view/SurfaceView;

    .line 50
    .line 51
    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Ll/o510;->a:Ll/r510$a;

    .line 55
    .line 56
    iget-object p0, p0, Ll/r510$a;->d:Landroid/view/SurfaceView;

    .line 57
    .line 58
    const/4 v0, 0x1

    .line 59
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 60
    .line 61
    .line 62
    :cond_1
    :goto_0
    return-void
.end method

.method public final l()V
    .locals 6

    .line 1
    const-string v0, "refreshLayout"

    .line 2
    .line 3
    invoke-static {v0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/ynp0;->p()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    div-int/lit8 v0, v0, 0x2

    .line 11
    .line 12
    const v1, 0x3fbe76c9    # 1.488f

    .line 13
    .line 14
    .line 15
    int-to-float v2, v0

    .line 16
    mul-float/2addr v2, v1

    .line 17
    float-to-int v1, v2

    .line 18
    const/4 v2, 0x1

    .line 19
    invoke-static {v2}, Ll/fct;->a(Z)I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    invoke-direct {p0}, Ll/j04;->g()V

    .line 24
    .line 25
    .line 26
    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    .line 27
    .line 28
    invoke-direct {v4, v0, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 29
    .line 30
    .line 31
    iput v0, v4, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 32
    .line 33
    iput v3, v4, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 34
    .line 35
    iget-object v5, p0, Ll/j04;->b:Landroid/widget/FrameLayout;

    .line 36
    .line 37
    invoke-virtual {v5, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 38
    .line 39
    .line 40
    iget-object v4, p0, Ll/o510;->a:Ll/r510$a;

    .line 41
    .line 42
    iget-object v4, v4, Ll/r510$a;->d:Landroid/view/SurfaceView;

    .line 43
    .line 44
    if-eqz v4, :cond_0

    .line 45
    .line 46
    invoke-static {v4}, Ll/o510;->a(Landroid/view/SurfaceView;)Landroid/widget/FrameLayout$LayoutParams;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    iput v3, v4, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 51
    .line 52
    iput v0, v4, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 53
    .line 54
    iput v1, v4, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 55
    .line 56
    iget-object v0, p0, Ll/o510;->a:Ll/r510$a;

    .line 57
    .line 58
    iget-object v0, v0, Ll/r510$a;->d:Landroid/view/SurfaceView;

    .line 59
    .line 60
    invoke-virtual {v0, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 61
    .line 62
    .line 63
    iget-object p0, p0, Ll/o510;->a:Ll/r510$a;

    .line 64
    .line 65
    iget-object p0, p0, Ll/r510$a;->d:Landroid/view/SurfaceView;

    .line 66
    .line 67
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 68
    .line 69
    .line 70
    :cond_0
    return-void
.end method

.method public m(Ljava/util/Map$Entry;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/Long;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/j04;->e:Ljava/util/Map$Entry;

    .line 2
    .line 3
    return-void
.end method

.method public final n()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/j04;->b:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/j04;->c:Landroid/view/SurfaceView;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Ll/j04;->b:Landroid/widget/FrameLayout;

    .line 20
    .line 21
    iget-object p0, p0, Ll/j04;->c:Landroid/view/SurfaceView;

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method
