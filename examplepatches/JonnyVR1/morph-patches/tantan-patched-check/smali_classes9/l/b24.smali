.class public Ll/b24;
.super Ll/o510;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/b24$a;
    }
.end annotation


# instance fields
.field public b:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Long;",
            "Ll/b24$a;",
            ">;"
        }
    .end annotation
.end field

.field public c:I

.field public d:J

.field public e:Landroid/widget/FrameLayout;


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
    iput-object v0, p0, Ll/b24;->b:Ljava/util/HashMap;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic f(Ll/b24$a;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/b24$a;->b:Z

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic g(Ll/b24$a;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/b24$a;->d:Z

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic h(Ll/b24;ILl/b24$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/b24;->k(ILl/b24$a;)V

    return-void
.end method

.method private j()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/b24;->e:Landroid/widget/FrameLayout;

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
    iput-object v0, p0, Ll/b24;->e:Landroid/widget/FrameLayout;

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
    iget-object v0, p0, Ll/b24;->e:Landroid/widget/FrameLayout;

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
    iget-object v1, p0, Ll/b24;->e:Landroid/widget/FrameLayout;

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Ll/o510;->a:Ll/r510$a;

    .line 45
    .line 46
    iget-object p0, p0, Ll/r510$a;->c:Landroid/view/ViewGroup;

    .line 47
    .line 48
    const/4 v0, 0x1

    .line 49
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 50
    .line 51
    .line 52
    :cond_1
    return-void
.end method


# virtual methods
.method public b()V
    .locals 1

    .line 1
    iget v0, p0, Ll/b24;->c:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/b24;->u(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o510;->a:Ll/r510$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/r510$a;->c:Landroid/view/ViewGroup;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object v0, p0, Ll/o510;->a:Ll/r510$a;

    .line 11
    .line 12
    iget-object v0, v0, Ll/r510$a;->b:Landroid/view/ViewGroup;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object v0, p0, Ll/b24;->e:Landroid/widget/FrameLayout;

    .line 20
    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 24
    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    iput-object v0, p0, Ll/b24;->e:Landroid/widget/FrameLayout;

    .line 28
    .line 29
    :cond_2
    iget-object p0, p0, Ll/b24;->b:Ljava/util/HashMap;

    .line 30
    .line 31
    invoke-virtual {p0}, Ljava/util/HashMap;->clear()V

    .line 32
    .line 33
    .line 34
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

.method public i(JLandroid/view/SurfaceView;ZZ)V
    .locals 4

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    if-eqz p4, :cond_1

    .line 5
    .line 6
    iget-wide v0, p0, Ll/b24;->d:J

    .line 7
    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long v0, v0, v2

    .line 11
    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    iput-wide p1, p0, Ll/b24;->d:J

    .line 15
    .line 16
    :cond_1
    new-instance v0, Ll/b24$a;

    .line 17
    .line 18
    invoke-direct {v0, p1, p2, p4, p3}, Ll/b24$a;-><init>(JZLandroid/view/SurfaceView;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p5}, Ll/b24$a;->a(Z)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/b24;->b:Ljava/util/HashMap;

    .line 25
    .line 26
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic k(ILl/b24$a;)V
    .locals 1

    .line 1
    iget-object v0, p2, Ll/b24$a;->c:Landroid/view/SurfaceView;

    .line 2
    .line 3
    iget-object p0, p0, Ll/b24;->e:Landroid/widget/FrameLayout;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    iget-boolean p0, p2, Ll/b24$a;->b:Z

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    new-instance p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 13
    .line 14
    invoke-static {}, Ll/ynp0;->p()I

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    div-int/lit8 p2, p2, 0x2

    .line 19
    .line 20
    invoke-direct {p0, p2, p1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 21
    .line 22
    .line 23
    const/4 p1, 0x0

    .line 24
    iput p1, p0, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 25
    .line 26
    invoke-virtual {v0, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    new-instance p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 31
    .line 32
    invoke-static {}, Ll/ynp0;->p()I

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    div-int/lit8 p2, p2, 0x2

    .line 37
    .line 38
    invoke-direct {p0, p2, p1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 39
    .line 40
    .line 41
    invoke-static {}, Ll/ynp0;->p()I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    div-int/lit8 p1, p1, 0x2

    .line 46
    .line 47
    iput p1, p0, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 48
    .line 49
    invoke-virtual {v0, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public l(J)V
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/b24;->d:J

    .line 2
    .line 3
    cmp-long v0, v0, p1

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-wide/16 v0, 0x0

    .line 8
    .line 9
    iput-wide v0, p0, Ll/b24;->d:J

    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Ll/b24;->b:Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final m()V
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setAudioModeLayout userSurfaceInfoMap:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/b24;->b:Ljava/util/HashMap;

    .line 9
    .line 10
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-direct {p0}, Ll/b24;->j()V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/b24;->b:Ljava/util/HashMap;

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/z14;

    .line 34
    .line 35
    invoke-direct {v1}, Ll/z14;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-static {v0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    const/4 v2, 0x2

    .line 47
    const-wide/16 v3, 0x0

    .line 48
    .line 49
    if-lt v1, v2, :cond_0

    .line 50
    .line 51
    iget-wide v1, p0, Ll/b24;->d:J

    .line 52
    .line 53
    cmp-long v1, v1, v3

    .line 54
    .line 55
    if-eqz v1, :cond_0

    .line 56
    .line 57
    invoke-virtual {p0, v0}, Ll/b24;->n(Ljava/util/List;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    const/4 v1, 0x1

    .line 66
    if-ne v0, v1, :cond_1

    .line 67
    .line 68
    iget-wide v0, p0, Ll/b24;->d:J

    .line 69
    .line 70
    cmp-long v0, v0, v3

    .line 71
    .line 72
    if-eqz v0, :cond_1

    .line 73
    .line 74
    invoke-virtual {p0}, Ll/b24;->r()V

    .line 75
    .line 76
    .line 77
    :cond_1
    return-void
.end method

.method public final n(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/b24$a;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/o510;->a:Ll/r510$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/r510$a;->c:Landroid/view/ViewGroup;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Ll/ynp0;->p()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    div-int/lit8 v0, v0, 0x2

    .line 13
    .line 14
    const v1, 0x3fbe76c9    # 1.488f

    .line 15
    .line 16
    .line 17
    int-to-float v0, v0

    .line 18
    mul-float/2addr v0, v1

    .line 19
    float-to-int v0, v0

    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-static {v1}, Ll/fct;->a(Z)I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 26
    .line 27
    invoke-static {}, Ll/ynp0;->p()I

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    invoke-direct {v3, v4, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 32
    .line 33
    .line 34
    iput v1, v3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 35
    .line 36
    iput v2, v3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 37
    .line 38
    iget-object v1, p0, Ll/b24;->e:Landroid/widget/FrameLayout;

    .line 39
    .line 40
    invoke-virtual {v1, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Ll/b24;->e:Landroid/widget/FrameLayout;

    .line 44
    .line 45
    invoke-virtual {v1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 46
    .line 47
    .line 48
    new-instance v1, Ll/a24;

    .line 49
    .line 50
    invoke-direct {v1, p0, v0}, Ll/a24;-><init>(Ll/b24;I)V

    .line 51
    .line 52
    .line 53
    invoke-static {p1, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final o(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setLocalVisible:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/o510;->a:Ll/r510$a;

    .line 19
    .line 20
    iget-object v0, v0, Ll/r510$a;->b:Landroid/view/ViewGroup;

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object p0, p0, Ll/o510;->a:Ll/r510$a;

    .line 28
    .line 29
    iget-object p0, p0, Ll/r510$a;->d:Landroid/view/SurfaceView;

    .line 30
    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public p(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/b24;->c:I

    .line 2
    .line 3
    iget-object p1, p0, Ll/o510;->a:Ll/r510$a;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/b24;->b()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final q()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/b24;->m()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final r()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/b24;->b:Ljava/util/HashMap;

    .line 2
    .line 3
    iget-wide v1, p0, Ll/b24;->d:J

    .line 4
    .line 5
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ll/b24$a;

    .line 14
    .line 15
    iget-wide v1, p0, Ll/b24;->d:J

    .line 16
    .line 17
    const-wide/16 v3, 0x0

    .line 18
    .line 19
    cmp-long v1, v1, v3

    .line 20
    .line 21
    if-eqz v1, :cond_3

    .line 22
    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-object v1, p0, Ll/o510;->a:Ll/r510$a;

    .line 27
    .line 28
    iget-object v1, v1, Ll/r510$a;->c:Landroid/view/ViewGroup;

    .line 29
    .line 30
    if-nez v1, :cond_1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    iget-object v0, v0, Ll/b24$a;->c:Landroid/view/SurfaceView;

    .line 34
    .line 35
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 36
    .line 37
    sget v2, Ll/bnl0;->e:I

    .line 38
    .line 39
    invoke-direct {v1, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Ll/b24;->e:Landroid/widget/FrameLayout;

    .line 46
    .line 47
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 48
    .line 49
    sget v3, Ll/bnl0;->e:I

    .line 50
    .line 51
    invoke-direct {v2, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 55
    .line 56
    .line 57
    iget-object v1, p0, Ll/b24;->e:Landroid/widget/FrameLayout;

    .line 58
    .line 59
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    const/4 v2, 0x1

    .line 64
    if-ne v1, v2, :cond_2

    .line 65
    .line 66
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    iget-object v2, p0, Ll/b24;->e:Landroid/widget/FrameLayout;

    .line 71
    .line 72
    if-ne v1, v2, :cond_2

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_2
    iget-object v1, p0, Ll/b24;->e:Landroid/widget/FrameLayout;

    .line 76
    .line 77
    invoke-virtual {v1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 78
    .line 79
    .line 80
    iget-object p0, p0, Ll/b24;->e:Landroid/widget/FrameLayout;

    .line 81
    .line 82
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 83
    .line 84
    .line 85
    :cond_3
    :goto_0
    return-void
.end method

.method public s(JZ)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b24;->b:Ljava/util/HashMap;

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
    check-cast p0, Ll/b24$a;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    iget-boolean p1, p0, Ll/b24$a;->d:Z

    .line 16
    .line 17
    if-ne p1, p3, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p0, p3}, Ll/b24$a;->a(Z)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public final t()V
    .locals 7

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setVideoModeLayout userSurfaceInfoMap:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/b24;->b:Ljava/util/HashMap;

    .line 9
    .line 10
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/b24;->b:Ljava/util/HashMap;

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/y14;

    .line 31
    .line 32
    invoke-direct {v1}, Ll/y14;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Ll/b24$a;

    .line 40
    .line 41
    iget-object v1, p0, Ll/o510;->a:Ll/r510$a;

    .line 42
    .line 43
    iget-object v1, v1, Ll/r510$a;->d:Landroid/view/SurfaceView;

    .line 44
    .line 45
    if-eqz v1, :cond_1

    .line 46
    .line 47
    if-nez v0, :cond_0

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    invoke-direct {p0}, Ll/b24;->j()V

    .line 51
    .line 52
    .line 53
    iget-object v1, p0, Ll/b24;->e:Landroid/widget/FrameLayout;

    .line 54
    .line 55
    invoke-virtual {v1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 56
    .line 57
    .line 58
    invoke-static {}, Ll/ynp0;->p()I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    div-int/lit8 v1, v1, 0x2

    .line 63
    .line 64
    const v2, 0x3fbe76c9    # 1.488f

    .line 65
    .line 66
    .line 67
    int-to-float v3, v1

    .line 68
    mul-float/2addr v3, v2

    .line 69
    float-to-int v2, v3

    .line 70
    const/4 v3, 0x0

    .line 71
    invoke-static {v3}, Ll/fct;->a(Z)I

    .line 72
    .line 73
    .line 74
    move-result v4

    .line 75
    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    .line 76
    .line 77
    invoke-direct {v5, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 78
    .line 79
    .line 80
    iput v3, v5, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 81
    .line 82
    iput v4, v5, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 83
    .line 84
    iget-object v3, p0, Ll/b24;->e:Landroid/widget/FrameLayout;

    .line 85
    .line 86
    invoke-virtual {v3, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 87
    .line 88
    .line 89
    iget-object v3, v0, Ll/b24$a;->c:Landroid/view/SurfaceView;

    .line 90
    .line 91
    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    .line 92
    .line 93
    sget v6, Ll/bnl0;->e:I

    .line 94
    .line 95
    invoke-direct {v5, v6, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v3, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 99
    .line 100
    .line 101
    iget-object v3, p0, Ll/b24;->e:Landroid/widget/FrameLayout;

    .line 102
    .line 103
    iget-object v0, v0, Ll/b24$a;->c:Landroid/view/SurfaceView;

    .line 104
    .line 105
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 106
    .line 107
    .line 108
    iget-object v0, p0, Ll/o510;->a:Ll/r510$a;

    .line 109
    .line 110
    iget-object v0, v0, Ll/r510$a;->d:Landroid/view/SurfaceView;

    .line 111
    .line 112
    invoke-static {v0}, Ll/o510;->a(Landroid/view/SurfaceView;)Landroid/widget/FrameLayout$LayoutParams;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 117
    .line 118
    iput v4, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 119
    .line 120
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 121
    .line 122
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 123
    .line 124
    iget-object p0, p0, Ll/o510;->a:Ll/r510$a;

    .line 125
    .line 126
    iget-object p0, p0, Ll/r510$a;->d:Landroid/view/SurfaceView;

    .line 127
    .line 128
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 129
    .line 130
    .line 131
    :cond_1
    :goto_0
    return-void
.end method

.method public final u(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "updateLayout mode:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    if-eq p1, v0, :cond_2

    .line 20
    .line 21
    const/4 v1, 0x2

    .line 22
    if-eq p1, v1, :cond_1

    .line 23
    .line 24
    const/4 v1, 0x3

    .line 25
    if-eq p1, v1, :cond_0

    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    invoke-virtual {p0, v0}, Ll/b24;->o(Z)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Ll/b24;->t()V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    const/4 p1, 0x0

    .line 36
    invoke-virtual {p0, p1}, Ll/b24;->o(Z)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/b24;->m()V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_2
    invoke-virtual {p0, v0}, Ll/b24;->o(Z)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Ll/b24;->q()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public v(Ljava/lang/Long;Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/b24;->b:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ll/b24$a;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-boolean v0, p1, Ll/b24$a;->d:Z

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Ll/b24$a;->a(Z)V

    .line 14
    .line 15
    .line 16
    if-eq v0, p2, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/b24;->b()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method
