.class public Ll/bi20;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Landroid/view/ViewParent;

.field public b:Landroid/view/ViewParent;

.field public final c:Landroid/view/View;

.field public d:Z

.field public e:[I


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/bi20;->c:Landroid/view/View;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(FFZ)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/bi20;->m()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Ll/bi20;->i(I)Landroid/view/ViewParent;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Ll/bi20;->c:Landroid/view/View;

    .line 15
    .line 16
    invoke-static {v0, p0, p1, p2, p3}, Ll/fml0;->a(Landroid/view/ViewParent;Landroid/view/View;FFZ)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0

    .line 21
    :cond_0
    return v1
.end method

.method public b(FF)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/bi20;->m()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Ll/bi20;->i(I)Landroid/view/ViewParent;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Ll/bi20;->c:Landroid/view/View;

    .line 15
    .line 16
    invoke-static {v0, p0, p1, p2}, Ll/fml0;->b(Landroid/view/ViewParent;Landroid/view/View;FF)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0

    .line 21
    :cond_0
    return v1
.end method

.method public c(II[I[I)Z
    .locals 6
    .param p3    # [I
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # [I
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v5, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move v1, p1

    .line 4
    move v2, p2

    .line 5
    move-object v3, p3

    .line 6
    move-object v4, p4

    .line 7
    invoke-virtual/range {v0 .. v5}, Ll/bi20;->d(II[I[II)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public d(II[I[II)Z
    .locals 10
    .param p3    # [I
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # [I
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Ll/bi20;->m()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_8

    .line 7
    .line 8
    invoke-virtual {p0, p5}, Ll/bi20;->i(I)Landroid/view/ViewParent;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    if-nez v2, :cond_0

    .line 13
    .line 14
    return v1

    .line 15
    :cond_0
    const/4 v0, 0x1

    .line 16
    if-nez p1, :cond_2

    .line 17
    .line 18
    if-eqz p2, :cond_1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    if-eqz p4, :cond_8

    .line 22
    .line 23
    aput v1, p4, v1

    .line 24
    .line 25
    aput v1, p4, v0

    .line 26
    .line 27
    goto :goto_3

    .line 28
    :cond_2
    :goto_0
    if-eqz p4, :cond_3

    .line 29
    .line 30
    iget-object v3, p0, Ll/bi20;->c:Landroid/view/View;

    .line 31
    .line 32
    invoke-virtual {v3, p4}, Landroid/view/View;->getLocationInWindow([I)V

    .line 33
    .line 34
    .line 35
    aget v3, p4, v1

    .line 36
    .line 37
    aget v4, p4, v0

    .line 38
    .line 39
    move v8, v3

    .line 40
    move v9, v4

    .line 41
    goto :goto_1

    .line 42
    :cond_3
    move v8, v1

    .line 43
    move v9, v8

    .line 44
    :goto_1
    if-nez p3, :cond_4

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/bi20;->j()[I

    .line 47
    .line 48
    .line 49
    move-result-object p3

    .line 50
    :cond_4
    move-object v6, p3

    .line 51
    aput v1, v6, v1

    .line 52
    .line 53
    aput v1, v6, v0

    .line 54
    .line 55
    iget-object v3, p0, Ll/bi20;->c:Landroid/view/View;

    .line 56
    .line 57
    move v4, p1

    .line 58
    move v5, p2

    .line 59
    move v7, p5

    .line 60
    invoke-static/range {v2 .. v7}, Ll/fml0;->c(Landroid/view/ViewParent;Landroid/view/View;II[II)V

    .line 61
    .line 62
    .line 63
    if-eqz p4, :cond_5

    .line 64
    .line 65
    iget-object p0, p0, Ll/bi20;->c:Landroid/view/View;

    .line 66
    .line 67
    invoke-virtual {p0, p4}, Landroid/view/View;->getLocationInWindow([I)V

    .line 68
    .line 69
    .line 70
    aget p0, p4, v1

    .line 71
    .line 72
    sub-int/2addr p0, v8

    .line 73
    aput p0, p4, v1

    .line 74
    .line 75
    aget p0, p4, v0

    .line 76
    .line 77
    sub-int/2addr p0, v9

    .line 78
    aput p0, p4, v0

    .line 79
    .line 80
    :cond_5
    aget p0, v6, v1

    .line 81
    .line 82
    if-nez p0, :cond_7

    .line 83
    .line 84
    aget p0, v6, v0

    .line 85
    .line 86
    if-eqz p0, :cond_6

    .line 87
    .line 88
    goto :goto_2

    .line 89
    :cond_6
    return v1

    .line 90
    :cond_7
    :goto_2
    return v0

    .line 91
    :cond_8
    :goto_3
    return v1
.end method

.method public e(IIII[II[I)V
    .locals 0
    .param p5    # [I
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p7    # [I
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual/range {p0 .. p7}, Ll/bi20;->h(IIII[II[I)Z

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f(IIII[I)Z
    .locals 8
    .param p5    # [I
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v6, 0x0

    .line 2
    const/4 v7, 0x0

    .line 3
    move-object v0, p0

    .line 4
    move v1, p1

    .line 5
    move v2, p2

    .line 6
    move v3, p3

    .line 7
    move v4, p4

    .line 8
    move-object v5, p5

    .line 9
    invoke-virtual/range {v0 .. v7}, Ll/bi20;->h(IIII[II[I)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public g(IIII[II)Z
    .locals 8
    .param p5    # [I
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v7, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move v1, p1

    .line 4
    move v2, p2

    .line 5
    move v3, p3

    .line 6
    move v4, p4

    .line 7
    move-object v5, p5

    .line 8
    move v6, p6

    .line 9
    invoke-virtual/range {v0 .. v7}, Ll/bi20;->h(IIII[II[I)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public final h(IIII[II[I)Z
    .locals 13
    .param p5    # [I
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p7    # [I
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    move-object/from16 v0, p5

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/bi20;->m()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v1, :cond_6

    .line 9
    .line 10
    move/from16 v9, p6

    .line 11
    .line 12
    invoke-virtual {p0, v9}, Ll/bi20;->i(I)Landroid/view/ViewParent;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    if-nez v3, :cond_0

    .line 17
    .line 18
    return v2

    .line 19
    :cond_0
    const/4 v1, 0x1

    .line 20
    if-nez p1, :cond_2

    .line 21
    .line 22
    if-nez p2, :cond_2

    .line 23
    .line 24
    if-nez p3, :cond_2

    .line 25
    .line 26
    if-eqz p4, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    if-eqz v0, :cond_6

    .line 30
    .line 31
    aput v2, v0, v2

    .line 32
    .line 33
    aput v2, v0, v1

    .line 34
    .line 35
    goto :goto_3

    .line 36
    :cond_2
    :goto_0
    if-eqz v0, :cond_3

    .line 37
    .line 38
    iget-object v4, p0, Ll/bi20;->c:Landroid/view/View;

    .line 39
    .line 40
    invoke-virtual {v4, v0}, Landroid/view/View;->getLocationInWindow([I)V

    .line 41
    .line 42
    .line 43
    aget v4, v0, v2

    .line 44
    .line 45
    aget v5, v0, v1

    .line 46
    .line 47
    move v11, v4

    .line 48
    move v12, v5

    .line 49
    goto :goto_1

    .line 50
    :cond_3
    move v11, v2

    .line 51
    move v12, v11

    .line 52
    :goto_1
    if-nez p7, :cond_4

    .line 53
    .line 54
    invoke-virtual {p0}, Ll/bi20;->j()[I

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    aput v2, v4, v2

    .line 59
    .line 60
    aput v2, v4, v1

    .line 61
    .line 62
    move-object v10, v4

    .line 63
    goto :goto_2

    .line 64
    :cond_4
    move-object/from16 v10, p7

    .line 65
    .line 66
    :goto_2
    iget-object v4, p0, Ll/bi20;->c:Landroid/view/View;

    .line 67
    .line 68
    move v5, p1

    .line 69
    move v6, p2

    .line 70
    move/from16 v7, p3

    .line 71
    .line 72
    move/from16 v8, p4

    .line 73
    .line 74
    invoke-static/range {v3 .. v10}, Ll/fml0;->d(Landroid/view/ViewParent;Landroid/view/View;IIIII[I)V

    .line 75
    .line 76
    .line 77
    if-eqz v0, :cond_5

    .line 78
    .line 79
    iget-object p0, p0, Ll/bi20;->c:Landroid/view/View;

    .line 80
    .line 81
    invoke-virtual {p0, v0}, Landroid/view/View;->getLocationInWindow([I)V

    .line 82
    .line 83
    .line 84
    aget p0, v0, v2

    .line 85
    .line 86
    sub-int/2addr p0, v11

    .line 87
    aput p0, v0, v2

    .line 88
    .line 89
    aget p0, v0, v1

    .line 90
    .line 91
    sub-int/2addr p0, v12

    .line 92
    aput p0, v0, v1

    .line 93
    .line 94
    :cond_5
    return v1

    .line 95
    :cond_6
    :goto_3
    return v2
.end method

.method public final i(I)Landroid/view/ViewParent;
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p1, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-object p0, p0, Ll/bi20;->b:Landroid/view/ViewParent;

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_1
    iget-object p0, p0, Ll/bi20;->a:Landroid/view/ViewParent;

    .line 12
    .line 13
    return-object p0
.end method

.method public final j()[I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bi20;->e:[I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x2

    .line 6
    new-array v0, v0, [I

    .line 7
    .line 8
    iput-object v0, p0, Ll/bi20;->e:[I

    .line 9
    .line 10
    :cond_0
    iget-object p0, p0, Ll/bi20;->e:[I

    .line 11
    .line 12
    return-object p0
.end method

.method public k()Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/bi20;->l(I)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method public l(I)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bi20;->i(I)Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public m()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/bi20;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method public n(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/bi20;->d:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/bi20;->c:Landroid/view/View;

    .line 6
    .line 7
    invoke-static {v0}, Ll/kkl0;->H0(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iput-boolean p1, p0, Ll/bi20;->d:Z

    .line 11
    .line 12
    return-void
.end method

.method public final o(ILandroid/view/ViewParent;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p1, v0, :cond_0

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    iput-object p2, p0, Ll/bi20;->b:Landroid/view/ViewParent;

    .line 8
    .line 9
    return-void

    .line 10
    :cond_1
    iput-object p2, p0, Ll/bi20;->a:Landroid/view/ViewParent;

    .line 11
    .line 12
    return-void
.end method

.method public p(I)Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/bi20;->q(II)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method public q(II)Z
    .locals 4

    .line 1
    invoke-virtual {p0, p2}, Ll/bi20;->l(I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-virtual {p0}, Ll/bi20;->m()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_3

    .line 14
    .line 15
    iget-object v0, p0, Ll/bi20;->c:Landroid/view/View;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v2, p0, Ll/bi20;->c:Landroid/view/View;

    .line 22
    .line 23
    :goto_0
    if-eqz v0, :cond_3

    .line 24
    .line 25
    iget-object v3, p0, Ll/bi20;->c:Landroid/view/View;

    .line 26
    .line 27
    invoke-static {v0, v2, v3, p1, p2}, Ll/fml0;->f(Landroid/view/ViewParent;Landroid/view/View;Landroid/view/View;II)Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-eqz v3, :cond_1

    .line 32
    .line 33
    invoke-virtual {p0, p2, v0}, Ll/bi20;->o(ILandroid/view/ViewParent;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/bi20;->c:Landroid/view/View;

    .line 37
    .line 38
    invoke-static {v0, v2, p0, p1, p2}, Ll/fml0;->e(Landroid/view/ViewParent;Landroid/view/View;Landroid/view/View;II)V

    .line 39
    .line 40
    .line 41
    return v1

    .line 42
    :cond_1
    instance-of v3, v0, Landroid/view/View;

    .line 43
    .line 44
    if-eqz v3, :cond_2

    .line 45
    .line 46
    move-object v2, v0

    .line 47
    check-cast v2, Landroid/view/View;

    .line 48
    .line 49
    :cond_2
    invoke-interface {v0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    goto :goto_0

    .line 54
    :cond_3
    const/4 p0, 0x0

    .line 55
    return p0
.end method

.method public r()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/bi20;->s(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public s(I)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Ll/bi20;->i(I)Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Ll/bi20;->c:Landroid/view/View;

    .line 8
    .line 9
    invoke-static {v0, v1, p1}, Ll/fml0;->g(Landroid/view/ViewParent;Landroid/view/View;I)V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p0, p1, v0}, Ll/bi20;->o(ILandroid/view/ViewParent;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method
