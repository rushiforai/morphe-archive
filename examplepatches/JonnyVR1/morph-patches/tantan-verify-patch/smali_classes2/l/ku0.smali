.class public Ll/ku0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/view/View;

.field public final b:Ll/ou0;

.field public c:I

.field public d:Ll/r0j0;

.field public e:Ll/r0j0;

.field public f:Ll/r0j0;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/ku0;->c:I

    .line 6
    .line 7
    iput-object p1, p0, Ll/ku0;->a:Landroid/view/View;

    .line 8
    .line 9
    invoke-static {}, Ll/ou0;->b()Ll/ou0;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Ll/ku0;->b:Ll/ou0;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/drawable/Drawable;)Z
    .locals 3
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/ku0;->f:Ll/r0j0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/r0j0;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/r0j0;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/ku0;->f:Ll/r0j0;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Ll/ku0;->f:Ll/r0j0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/r0j0;->a()V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Ll/ku0;->a:Landroid/view/View;

    .line 18
    .line 19
    invoke-static {v1}, Ll/kkl0;->p(Landroid/view/View;)Landroid/content/res/ColorStateList;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const/4 v2, 0x1

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    iput-boolean v2, v0, Ll/r0j0;->d:Z

    .line 27
    .line 28
    iput-object v1, v0, Ll/r0j0;->a:Landroid/content/res/ColorStateList;

    .line 29
    .line 30
    :cond_1
    iget-object v1, p0, Ll/ku0;->a:Landroid/view/View;

    .line 31
    .line 32
    invoke-static {v1}, Ll/kkl0;->q(Landroid/view/View;)Landroid/graphics/PorterDuff$Mode;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    iput-boolean v2, v0, Ll/r0j0;->c:Z

    .line 39
    .line 40
    iput-object v1, v0, Ll/r0j0;->b:Landroid/graphics/PorterDuff$Mode;

    .line 41
    .line 42
    :cond_2
    iget-boolean v1, v0, Ll/r0j0;->d:Z

    .line 43
    .line 44
    if-nez v1, :cond_4

    .line 45
    .line 46
    iget-boolean v1, v0, Ll/r0j0;->c:Z

    .line 47
    .line 48
    if-eqz v1, :cond_3

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_3
    const/4 p0, 0x0

    .line 52
    return p0

    .line 53
    :cond_4
    :goto_0
    iget-object p0, p0, Ll/ku0;->a:Landroid/view/View;

    .line 54
    .line 55
    invoke-virtual {p0}, Landroid/view/View;->getDrawableState()[I

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-static {p1, v0, p0}, Ll/ou0;->i(Landroid/graphics/drawable/Drawable;Ll/r0j0;[I)V

    .line 60
    .line 61
    .line 62
    return v2
.end method

.method public b()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ku0;->a:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ku0;->k()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/ku0;->a(Landroid/graphics/drawable/Drawable;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object v1, p0, Ll/ku0;->e:Ll/r0j0;

    .line 23
    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, Ll/ku0;->a:Landroid/view/View;

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/view/View;->getDrawableState()[I

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {v0, v1, p0}, Ll/ou0;->i(Landroid/graphics/drawable/Drawable;Ll/r0j0;[I)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    iget-object v1, p0, Ll/ku0;->d:Ll/r0j0;

    .line 37
    .line 38
    if-eqz v1, :cond_2

    .line 39
    .line 40
    iget-object p0, p0, Ll/ku0;->a:Landroid/view/View;

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/view/View;->getDrawableState()[I

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-static {v0, v1, p0}, Ll/ou0;->i(Landroid/graphics/drawable/Drawable;Ll/r0j0;[I)V

    .line 47
    .line 48
    .line 49
    :cond_2
    :goto_0
    return-void
.end method

.method public c()Landroid/content/res/ColorStateList;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ku0;->e:Ll/r0j0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/r0j0;->a:Landroid/content/res/ColorStateList;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return-object p0
.end method

.method public d()Landroid/graphics/PorterDuff$Mode;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ku0;->e:Ll/r0j0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/r0j0;->b:Landroid/graphics/PorterDuff$Mode;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return-object p0
.end method

.method public e(Landroid/util/AttributeSet;I)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ku0;->a:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Ll/gic0;->N3:[I

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {v0, p1, v1, p2, v2}, Ll/t0j0;->u(Landroid/content/Context;Landroid/util/AttributeSet;[III)Ll/t0j0;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    :try_start_0
    sget p2, Ll/gic0;->O3:I

    .line 15
    .line 16
    invoke-virtual {p1, p2}, Ll/t0j0;->r(I)Z

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    const/4 v0, -0x1

    .line 21
    if-eqz p2, :cond_0

    .line 22
    .line 23
    sget p2, Ll/gic0;->O3:I

    .line 24
    .line 25
    invoke-virtual {p1, p2, v0}, Ll/t0j0;->n(II)I

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    iput p2, p0, Ll/ku0;->c:I

    .line 30
    .line 31
    iget-object p2, p0, Ll/ku0;->b:Ll/ou0;

    .line 32
    .line 33
    iget-object v1, p0, Ll/ku0;->a:Landroid/view/View;

    .line 34
    .line 35
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iget v2, p0, Ll/ku0;->c:I

    .line 40
    .line 41
    invoke-virtual {p2, v1, v2}, Ll/ou0;->f(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    if-eqz p2, :cond_0

    .line 46
    .line 47
    invoke-virtual {p0, p2}, Ll/ku0;->h(Landroid/content/res/ColorStateList;)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :catchall_0
    move-exception p0

    .line 52
    goto :goto_1

    .line 53
    :cond_0
    :goto_0
    sget p2, Ll/gic0;->P3:I

    .line 54
    .line 55
    invoke-virtual {p1, p2}, Ll/t0j0;->r(I)Z

    .line 56
    .line 57
    .line 58
    move-result p2

    .line 59
    if-eqz p2, :cond_1

    .line 60
    .line 61
    iget-object p2, p0, Ll/ku0;->a:Landroid/view/View;

    .line 62
    .line 63
    sget v1, Ll/gic0;->P3:I

    .line 64
    .line 65
    invoke-virtual {p1, v1}, Ll/t0j0;->c(I)Landroid/content/res/ColorStateList;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-static {p2, v1}, Ll/kkl0;->n0(Landroid/view/View;Landroid/content/res/ColorStateList;)V

    .line 70
    .line 71
    .line 72
    :cond_1
    sget p2, Ll/gic0;->Q3:I

    .line 73
    .line 74
    invoke-virtual {p1, p2}, Ll/t0j0;->r(I)Z

    .line 75
    .line 76
    .line 77
    move-result p2

    .line 78
    if-eqz p2, :cond_2

    .line 79
    .line 80
    iget-object p0, p0, Ll/ku0;->a:Landroid/view/View;

    .line 81
    .line 82
    sget p2, Ll/gic0;->Q3:I

    .line 83
    .line 84
    invoke-virtual {p1, p2, v0}, Ll/t0j0;->k(II)I

    .line 85
    .line 86
    .line 87
    move-result p2

    .line 88
    const/4 v0, 0x0

    .line 89
    invoke-static {p2, v0}, Ll/gde;->d(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;

    .line 90
    .line 91
    .line 92
    move-result-object p2

    .line 93
    invoke-static {p0, p2}, Ll/kkl0;->o0(Landroid/view/View;Landroid/graphics/PorterDuff$Mode;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 94
    .line 95
    .line 96
    :cond_2
    invoke-virtual {p1}, Ll/t0j0;->v()V

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :goto_1
    invoke-virtual {p1}, Ll/t0j0;->v()V

    .line 101
    .line 102
    .line 103
    throw p0
.end method

.method public f(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    const/4 p1, -0x1

    .line 2
    iput p1, p0, Ll/ku0;->c:I

    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    invoke-virtual {p0, p1}, Ll/ku0;->h(Landroid/content/res/ColorStateList;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ku0;->b()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public g(I)V
    .locals 2

    .line 1
    iput p1, p0, Ll/ku0;->c:I

    .line 2
    .line 3
    iget-object v0, p0, Ll/ku0;->b:Ll/ou0;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Ll/ku0;->a:Landroid/view/View;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1, p1}, Ll/ou0;->f(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p1, 0x0

    .line 19
    :goto_0
    invoke-virtual {p0, p1}, Ll/ku0;->h(Landroid/content/res/ColorStateList;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/ku0;->b()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public h(Landroid/content/res/ColorStateList;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Ll/ku0;->d:Ll/r0j0;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/r0j0;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/r0j0;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/ku0;->d:Ll/r0j0;

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Ll/ku0;->d:Ll/r0j0;

    .line 15
    .line 16
    iput-object p1, v0, Ll/r0j0;->a:Landroid/content/res/ColorStateList;

    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    iput-boolean p1, v0, Ll/r0j0;->d:Z

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    const/4 p1, 0x0

    .line 23
    iput-object p1, p0, Ll/ku0;->d:Ll/r0j0;

    .line 24
    .line 25
    :goto_0
    invoke-virtual {p0}, Ll/ku0;->b()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public i(Landroid/content/res/ColorStateList;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ku0;->e:Ll/r0j0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/r0j0;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/r0j0;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/ku0;->e:Ll/r0j0;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Ll/ku0;->e:Ll/r0j0;

    .line 13
    .line 14
    iput-object p1, v0, Ll/r0j0;->a:Landroid/content/res/ColorStateList;

    .line 15
    .line 16
    const/4 p1, 0x1

    .line 17
    iput-boolean p1, v0, Ll/r0j0;->d:Z

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/ku0;->b()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public j(Landroid/graphics/PorterDuff$Mode;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ku0;->e:Ll/r0j0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/r0j0;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/r0j0;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/ku0;->e:Ll/r0j0;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Ll/ku0;->e:Ll/r0j0;

    .line 13
    .line 14
    iput-object p1, v0, Ll/r0j0;->b:Landroid/graphics/PorterDuff$Mode;

    .line 15
    .line 16
    const/4 p1, 0x1

    .line 17
    iput-boolean p1, v0, Ll/r0j0;->c:Z

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/ku0;->b()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final k()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ku0;->d:Ll/r0j0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method
