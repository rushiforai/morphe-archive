.class public Landroidx/constraintlayout/solver/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/constraintlayout/solver/c$a;


# instance fields
.field public a:Landroidx/constraintlayout/solver/SolverVariable;

.field public b:F

.field public c:Z

.field public final d:Landroidx/constraintlayout/solver/a;

.field public e:Z


# direct methods
.method public constructor <init>(Ll/wx3;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Landroidx/constraintlayout/solver/b;->a:Landroidx/constraintlayout/solver/SolverVariable;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Landroidx/constraintlayout/solver/b;->b:F

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Landroidx/constraintlayout/solver/b;->c:Z

    .line 12
    .line 13
    iput-boolean v0, p0, Landroidx/constraintlayout/solver/b;->e:Z

    .line 14
    .line 15
    new-instance v0, Landroidx/constraintlayout/solver/a;

    .line 16
    .line 17
    invoke-direct {v0, p0, p1}, Landroidx/constraintlayout/solver/a;-><init>(Landroidx/constraintlayout/solver/b;Ll/wx3;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public a(Landroidx/constraintlayout/solver/c$a;)V
    .locals 5

    .line 1
    instance-of v0, p1, Landroidx/constraintlayout/solver/b;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Landroidx/constraintlayout/solver/b;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Landroidx/constraintlayout/solver/b;->a:Landroidx/constraintlayout/solver/SolverVariable;

    .line 9
    .line 10
    iget-object v0, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/a;->c()V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    :goto_0
    iget-object v1, p1, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 17
    .line 18
    iget v2, v1, Landroidx/constraintlayout/solver/a;->a:I

    .line 19
    .line 20
    if-ge v0, v2, :cond_0

    .line 21
    .line 22
    invoke-virtual {v1, v0}, Landroidx/constraintlayout/solver/a;->h(I)Landroidx/constraintlayout/solver/SolverVariable;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iget-object v2, p1, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 27
    .line 28
    invoke-virtual {v2, v0}, Landroidx/constraintlayout/solver/a;->i(I)F

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    iget-object v3, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 33
    .line 34
    const/4 v4, 0x1

    .line 35
    invoke-virtual {v3, v1, v2, v4}, Landroidx/constraintlayout/solver/a;->a(Landroidx/constraintlayout/solver/SolverVariable;FZ)V

    .line 36
    .line 37
    .line 38
    add-int/lit8 v0, v0, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    return-void
.end method

.method public b(Landroidx/constraintlayout/solver/c;[Z)Landroidx/constraintlayout/solver/SolverVariable;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p2, p1}, Landroidx/constraintlayout/solver/a;->g([ZLandroidx/constraintlayout/solver/SolverVariable;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public c(Landroidx/constraintlayout/solver/SolverVariable;)V
    .locals 3

    .line 1
    iget v0, p1, Landroidx/constraintlayout/solver/SolverVariable;->d:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/high16 v2, 0x3f800000    # 1.0f

    .line 5
    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 v1, 0x2

    .line 10
    if-ne v0, v1, :cond_1

    .line 11
    .line 12
    const/high16 v2, 0x447a0000    # 1000.0f

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    const/4 v1, 0x3

    .line 16
    if-ne v0, v1, :cond_2

    .line 17
    .line 18
    const v2, 0x49742400    # 1000000.0f

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_2
    const/4 v1, 0x4

    .line 23
    if-ne v0, v1, :cond_3

    .line 24
    .line 25
    const v2, 0x4e6e6b28    # 1.0E9f

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_3
    const/4 v1, 0x5

    .line 30
    if-ne v0, v1, :cond_4

    .line 31
    .line 32
    const v2, 0x5368d4a5    # 1.0E12f

    .line 33
    .line 34
    .line 35
    :cond_4
    :goto_0
    iget-object p0, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 36
    .line 37
    invoke-virtual {p0, p1, v2}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public clear()V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/a;->c()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Landroidx/constraintlayout/solver/b;->a:Landroidx/constraintlayout/solver/SolverVariable;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput v0, p0, Landroidx/constraintlayout/solver/b;->b:F

    .line 11
    .line 12
    return-void
.end method

.method public d(Landroidx/constraintlayout/solver/c;I)Landroidx/constraintlayout/solver/b;
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 2
    .line 3
    const-string v1, "ep"

    .line 4
    .line 5
    invoke-virtual {p1, p2, v1}, Landroidx/constraintlayout/solver/c;->p(ILjava/lang/String;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/high16 v2, 0x3f800000    # 1.0f

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 15
    .line 16
    const-string v1, "em"

    .line 17
    .line 18
    invoke-virtual {p1, p2, v1}, Landroidx/constraintlayout/solver/c;->p(ILjava/lang/String;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const/high16 p2, -0x40800000    # -1.0f

    .line 23
    .line 24
    invoke-virtual {v0, p1, p2}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 25
    .line 26
    .line 27
    return-object p0
.end method

.method public e(Landroidx/constraintlayout/solver/SolverVariable;I)Landroidx/constraintlayout/solver/b;
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 2
    .line 3
    int-to-float p2, p2

    .line 4
    invoke-virtual {v0, p1, p2}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 5
    .line 6
    .line 7
    return-object p0
.end method

.method public f(Landroidx/constraintlayout/solver/c;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroidx/constraintlayout/solver/a;->b(Landroidx/constraintlayout/solver/c;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 v0, 0x1

    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    move p1, v0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/solver/b;->v(Landroidx/constraintlayout/solver/SolverVariable;)V

    .line 13
    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    :goto_0
    iget-object v1, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 17
    .line 18
    iget v1, v1, Landroidx/constraintlayout/solver/a;->a:I

    .line 19
    .line 20
    if-nez v1, :cond_1

    .line 21
    .line 22
    iput-boolean v0, p0, Landroidx/constraintlayout/solver/b;->e:Z

    .line 23
    .line 24
    :cond_1
    return p1
.end method

.method public g(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;IFLandroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;I)Landroidx/constraintlayout/solver/b;
    .locals 5

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    if-ne p2, p5, :cond_0

    .line 4
    .line 5
    iget-object p3, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 6
    .line 7
    invoke-virtual {p3, p1, v0}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 11
    .line 12
    invoke-virtual {p1, p6, v0}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 16
    .line 17
    const/high16 p3, -0x40000000    # -2.0f

    .line 18
    .line 19
    invoke-virtual {p1, p2, p3}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 20
    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_0
    const/high16 v1, 0x3f000000    # 0.5f

    .line 24
    .line 25
    cmpl-float v1, p4, v1

    .line 26
    .line 27
    const/high16 v2, -0x40800000    # -1.0f

    .line 28
    .line 29
    if-nez v1, :cond_2

    .line 30
    .line 31
    iget-object p4, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 32
    .line 33
    invoke-virtual {p4, p1, v0}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 37
    .line 38
    invoke-virtual {p1, p2, v2}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 42
    .line 43
    invoke-virtual {p1, p5, v2}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 47
    .line 48
    invoke-virtual {p1, p6, v0}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 49
    .line 50
    .line 51
    if-gtz p3, :cond_1

    .line 52
    .line 53
    if-lez p7, :cond_5

    .line 54
    .line 55
    :cond_1
    neg-int p1, p3

    .line 56
    add-int/2addr p1, p7

    .line 57
    int-to-float p1, p1

    .line 58
    iput p1, p0, Landroidx/constraintlayout/solver/b;->b:F

    .line 59
    .line 60
    return-object p0

    .line 61
    :cond_2
    const/4 v1, 0x0

    .line 62
    cmpg-float v1, p4, v1

    .line 63
    .line 64
    if-gtz v1, :cond_3

    .line 65
    .line 66
    iget-object p4, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 67
    .line 68
    invoke-virtual {p4, p1, v2}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 72
    .line 73
    invoke-virtual {p1, p2, v0}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 74
    .line 75
    .line 76
    int-to-float p1, p3

    .line 77
    iput p1, p0, Landroidx/constraintlayout/solver/b;->b:F

    .line 78
    .line 79
    return-object p0

    .line 80
    :cond_3
    cmpl-float v1, p4, v0

    .line 81
    .line 82
    iget-object v3, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 83
    .line 84
    if-ltz v1, :cond_4

    .line 85
    .line 86
    invoke-virtual {v3, p5, v2}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 87
    .line 88
    .line 89
    iget-object p1, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 90
    .line 91
    invoke-virtual {p1, p6, v0}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 92
    .line 93
    .line 94
    int-to-float p1, p7

    .line 95
    iput p1, p0, Landroidx/constraintlayout/solver/b;->b:F

    .line 96
    .line 97
    return-object p0

    .line 98
    :cond_4
    sub-float v1, v0, p4

    .line 99
    .line 100
    mul-float v4, v1, v0

    .line 101
    .line 102
    invoke-virtual {v3, p1, v4}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 103
    .line 104
    .line 105
    iget-object p1, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 106
    .line 107
    mul-float v3, v1, v2

    .line 108
    .line 109
    invoke-virtual {p1, p2, v3}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 110
    .line 111
    .line 112
    iget-object p1, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 113
    .line 114
    mul-float/2addr v2, p4

    .line 115
    invoke-virtual {p1, p5, v2}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 116
    .line 117
    .line 118
    iget-object p1, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 119
    .line 120
    mul-float/2addr v0, p4

    .line 121
    invoke-virtual {p1, p6, v0}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 122
    .line 123
    .line 124
    if-gtz p3, :cond_6

    .line 125
    .line 126
    if-lez p7, :cond_5

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_5
    return-object p0

    .line 130
    :cond_6
    :goto_0
    neg-int p1, p3

    .line 131
    int-to-float p1, p1

    .line 132
    mul-float/2addr p1, v1

    .line 133
    int-to-float p2, p7

    .line 134
    mul-float/2addr p2, p4

    .line 135
    add-float/2addr p1, p2

    .line 136
    iput p1, p0, Landroidx/constraintlayout/solver/b;->b:F

    .line 137
    .line 138
    return-object p0
.end method

.method public getKey()Landroidx/constraintlayout/solver/SolverVariable;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/solver/b;->a:Landroidx/constraintlayout/solver/SolverVariable;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(Landroidx/constraintlayout/solver/SolverVariable;I)Landroidx/constraintlayout/solver/b;
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/constraintlayout/solver/b;->a:Landroidx/constraintlayout/solver/SolverVariable;

    .line 2
    .line 3
    int-to-float p2, p2

    .line 4
    iput p2, p1, Landroidx/constraintlayout/solver/SolverVariable;->e:F

    .line 5
    .line 6
    iput p2, p0, Landroidx/constraintlayout/solver/b;->b:F

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    iput-boolean p1, p0, Landroidx/constraintlayout/solver/b;->e:Z

    .line 10
    .line 11
    return-object p0
.end method

.method public i(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;F)Landroidx/constraintlayout/solver/b;
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 2
    .line 3
    const/high16 v1, -0x40800000    # -1.0f

    .line 4
    .line 5
    invoke-virtual {v0, p1, v1}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 9
    .line 10
    const/high16 v0, 0x3f800000    # 1.0f

    .line 11
    .line 12
    sub-float/2addr v0, p4

    .line 13
    invoke-virtual {p1, p2, v0}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 17
    .line 18
    invoke-virtual {p1, p3, p4}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 19
    .line 20
    .line 21
    return-object p0
.end method

.method public j(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;F)Landroidx/constraintlayout/solver/b;
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 2
    .line 3
    const/high16 v1, -0x40800000    # -1.0f

    .line 4
    .line 5
    invoke-virtual {v0, p1, v1}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 9
    .line 10
    const/high16 v0, 0x3f800000    # 1.0f

    .line 11
    .line 12
    invoke-virtual {p1, p2, v0}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 16
    .line 17
    invoke-virtual {p1, p3, p5}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 21
    .line 22
    neg-float p2, p5

    .line 23
    invoke-virtual {p1, p4, p2}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 24
    .line 25
    .line 26
    return-object p0
.end method

.method public k(FFFLandroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;)Landroidx/constraintlayout/solver/b;
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Landroidx/constraintlayout/solver/b;->b:F

    .line 3
    .line 4
    cmpl-float v1, p2, v0

    .line 5
    .line 6
    const/high16 v2, -0x40800000    # -1.0f

    .line 7
    .line 8
    const/high16 v3, 0x3f800000    # 1.0f

    .line 9
    .line 10
    if-eqz v1, :cond_3

    .line 11
    .line 12
    cmpl-float v1, p1, p3

    .line 13
    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    cmpl-float v1, p1, v0

    .line 18
    .line 19
    if-nez v1, :cond_1

    .line 20
    .line 21
    iget-object p1, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 22
    .line 23
    invoke-virtual {p1, p4, v3}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 27
    .line 28
    invoke-virtual {p1, p5, v2}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 29
    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_1
    cmpl-float v0, p3, v0

    .line 33
    .line 34
    iget-object v1, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 35
    .line 36
    if-nez v0, :cond_2

    .line 37
    .line 38
    invoke-virtual {v1, p6, v3}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 42
    .line 43
    invoke-virtual {p1, p7, v2}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 44
    .line 45
    .line 46
    return-object p0

    .line 47
    :cond_2
    div-float/2addr p1, p2

    .line 48
    div-float/2addr p3, p2

    .line 49
    div-float/2addr p1, p3

    .line 50
    invoke-virtual {v1, p4, v3}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 51
    .line 52
    .line 53
    iget-object p2, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 54
    .line 55
    invoke-virtual {p2, p5, v2}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 56
    .line 57
    .line 58
    iget-object p2, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 59
    .line 60
    invoke-virtual {p2, p7, p1}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 61
    .line 62
    .line 63
    iget-object p2, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 64
    .line 65
    neg-float p1, p1

    .line 66
    invoke-virtual {p2, p6, p1}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 67
    .line 68
    .line 69
    return-object p0

    .line 70
    :cond_3
    :goto_0
    iget-object p1, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 71
    .line 72
    invoke-virtual {p1, p4, v3}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 76
    .line 77
    invoke-virtual {p1, p5, v2}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 81
    .line 82
    invoke-virtual {p1, p7, v3}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 86
    .line 87
    invoke-virtual {p1, p6, v2}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 88
    .line 89
    .line 90
    return-object p0
.end method

.method public l(Landroidx/constraintlayout/solver/SolverVariable;I)Landroidx/constraintlayout/solver/b;
    .locals 1

    .line 1
    if-gez p2, :cond_0

    .line 2
    .line 3
    mul-int/lit8 p2, p2, -0x1

    .line 4
    .line 5
    int-to-float p2, p2

    .line 6
    iput p2, p0, Landroidx/constraintlayout/solver/b;->b:F

    .line 7
    .line 8
    iget-object p2, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 9
    .line 10
    const/high16 v0, 0x3f800000    # 1.0f

    .line 11
    .line 12
    invoke-virtual {p2, p1, v0}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 13
    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    int-to-float p2, p2

    .line 17
    iput p2, p0, Landroidx/constraintlayout/solver/b;->b:F

    .line 18
    .line 19
    iget-object p2, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 20
    .line 21
    const/high16 v0, -0x40800000    # -1.0f

    .line 22
    .line 23
    invoke-virtual {p2, p1, v0}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 24
    .line 25
    .line 26
    return-object p0
.end method

.method public m(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;I)Landroidx/constraintlayout/solver/b;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p3, :cond_1

    .line 3
    .line 4
    if-gez p3, :cond_0

    .line 5
    .line 6
    mul-int/lit8 p3, p3, -0x1

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    :cond_0
    int-to-float p3, p3

    .line 10
    iput p3, p0, Landroidx/constraintlayout/solver/b;->b:F

    .line 11
    .line 12
    :cond_1
    iget-object p3, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 13
    .line 14
    const/high16 v1, 0x3f800000    # 1.0f

    .line 15
    .line 16
    const/high16 v2, -0x40800000    # -1.0f

    .line 17
    .line 18
    if-nez v0, :cond_2

    .line 19
    .line 20
    invoke-virtual {p3, p1, v2}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 24
    .line 25
    invoke-virtual {p1, p2, v1}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 26
    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_2
    invoke-virtual {p3, p1, v1}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 33
    .line 34
    invoke-virtual {p1, p2, v2}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 35
    .line 36
    .line 37
    return-object p0
.end method

.method public n(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;I)Landroidx/constraintlayout/solver/b;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p4, :cond_1

    .line 3
    .line 4
    if-gez p4, :cond_0

    .line 5
    .line 6
    mul-int/lit8 p4, p4, -0x1

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    :cond_0
    int-to-float p4, p4

    .line 10
    iput p4, p0, Landroidx/constraintlayout/solver/b;->b:F

    .line 11
    .line 12
    :cond_1
    iget-object p4, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 13
    .line 14
    const/high16 v1, 0x3f800000    # 1.0f

    .line 15
    .line 16
    const/high16 v2, -0x40800000    # -1.0f

    .line 17
    .line 18
    if-nez v0, :cond_2

    .line 19
    .line 20
    invoke-virtual {p4, p1, v2}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 24
    .line 25
    invoke-virtual {p1, p2, v1}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 29
    .line 30
    invoke-virtual {p1, p3, v1}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 31
    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_2
    invoke-virtual {p4, p1, v1}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 38
    .line 39
    invoke-virtual {p1, p2, v2}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 43
    .line 44
    invoke-virtual {p1, p3, v2}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 45
    .line 46
    .line 47
    return-object p0
.end method

.method public o(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;I)Landroidx/constraintlayout/solver/b;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p4, :cond_1

    .line 3
    .line 4
    if-gez p4, :cond_0

    .line 5
    .line 6
    mul-int/lit8 p4, p4, -0x1

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    :cond_0
    int-to-float p4, p4

    .line 10
    iput p4, p0, Landroidx/constraintlayout/solver/b;->b:F

    .line 11
    .line 12
    :cond_1
    iget-object p4, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 13
    .line 14
    const/high16 v1, 0x3f800000    # 1.0f

    .line 15
    .line 16
    const/high16 v2, -0x40800000    # -1.0f

    .line 17
    .line 18
    if-nez v0, :cond_2

    .line 19
    .line 20
    invoke-virtual {p4, p1, v2}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 24
    .line 25
    invoke-virtual {p1, p2, v1}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 29
    .line 30
    invoke-virtual {p1, p3, v2}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 31
    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_2
    invoke-virtual {p4, p1, v1}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 38
    .line 39
    invoke-virtual {p1, p2, v2}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 43
    .line 44
    invoke-virtual {p1, p3, v1}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 45
    .line 46
    .line 47
    return-object p0
.end method

.method public p(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;F)Landroidx/constraintlayout/solver/b;
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 2
    .line 3
    const/high16 v1, 0x3f000000    # 0.5f

    .line 4
    .line 5
    invoke-virtual {v0, p3, v1}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 6
    .line 7
    .line 8
    iget-object p3, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 9
    .line 10
    invoke-virtual {p3, p4, v1}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 11
    .line 12
    .line 13
    iget-object p3, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 14
    .line 15
    const/high16 p4, -0x41000000    # -0.5f

    .line 16
    .line 17
    invoke-virtual {p3, p1, p4}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 21
    .line 22
    invoke-virtual {p1, p2, p4}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 23
    .line 24
    .line 25
    neg-float p1, p5

    .line 26
    iput p1, p0, Landroidx/constraintlayout/solver/b;->b:F

    .line 27
    .line 28
    return-object p0
.end method

.method public q()V
    .locals 2

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/b;->b:F

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    cmpg-float v1, v0, v1

    .line 5
    .line 6
    if-gez v1, :cond_0

    .line 7
    .line 8
    const/high16 v1, -0x40800000    # -1.0f

    .line 9
    .line 10
    mul-float/2addr v0, v1

    .line 11
    iput v0, p0, Landroidx/constraintlayout/solver/b;->b:F

    .line 12
    .line 13
    iget-object p0, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/a;->j()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public r()Z
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/b;->a:Landroidx/constraintlayout/solver/SolverVariable;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, v0, Landroidx/constraintlayout/solver/SolverVariable;->g:Landroidx/constraintlayout/solver/SolverVariable$Type;

    .line 6
    .line 7
    sget-object v1, Landroidx/constraintlayout/solver/SolverVariable$Type;->UNRESTRICTED:Landroidx/constraintlayout/solver/SolverVariable$Type;

    .line 8
    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget p0, p0, Landroidx/constraintlayout/solver/b;->b:F

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    cmpg-float p0, p0, v0

    .line 15
    .line 16
    if-ltz p0, :cond_1

    .line 17
    .line 18
    :cond_0
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_1
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public s(Landroidx/constraintlayout/solver/SolverVariable;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/solver/a;->d(Landroidx/constraintlayout/solver/SolverVariable;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public t()Z
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/b;->a:Landroidx/constraintlayout/solver/SolverVariable;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Landroidx/constraintlayout/solver/b;->b:F

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    cmpl-float v0, v0, v1

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 13
    .line 14
    iget p0, p0, Landroidx/constraintlayout/solver/a;->a:I

    .line 15
    .line 16
    if-nez p0, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/b;->x()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public u(Landroidx/constraintlayout/solver/SolverVariable;)Landroidx/constraintlayout/solver/SolverVariable;
    .locals 1

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0, p1}, Landroidx/constraintlayout/solver/a;->g([ZLandroidx/constraintlayout/solver/SolverVariable;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public v(Landroidx/constraintlayout/solver/SolverVariable;)V
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/b;->a:Landroidx/constraintlayout/solver/SolverVariable;

    .line 2
    .line 3
    const/high16 v1, -0x40800000    # -1.0f

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v2, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 8
    .line 9
    invoke-virtual {v2, v0, v1}, Landroidx/constraintlayout/solver/a;->l(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-object v0, p0, Landroidx/constraintlayout/solver/b;->a:Landroidx/constraintlayout/solver/SolverVariable;

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 16
    .line 17
    const/4 v2, 0x1

    .line 18
    invoke-virtual {v0, p1, v2}, Landroidx/constraintlayout/solver/a;->m(Landroidx/constraintlayout/solver/SolverVariable;Z)F

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    mul-float/2addr v0, v1

    .line 23
    iput-object p1, p0, Landroidx/constraintlayout/solver/b;->a:Landroidx/constraintlayout/solver/SolverVariable;

    .line 24
    .line 25
    const/high16 p1, 0x3f800000    # 1.0f

    .line 26
    .line 27
    cmpl-float p1, v0, p1

    .line 28
    .line 29
    if-nez p1, :cond_1

    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    iget p1, p0, Landroidx/constraintlayout/solver/b;->b:F

    .line 33
    .line 34
    div-float/2addr p1, v0

    .line 35
    iput p1, p0, Landroidx/constraintlayout/solver/b;->b:F

    .line 36
    .line 37
    iget-object p0, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/solver/a;->e(F)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public w()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Landroidx/constraintlayout/solver/b;->a:Landroidx/constraintlayout/solver/SolverVariable;

    .line 3
    .line 4
    iget-object v0, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 5
    .line 6
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/a;->c()V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput v0, p0, Landroidx/constraintlayout/solver/b;->b:F

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Landroidx/constraintlayout/solver/b;->e:Z

    .line 14
    .line 15
    return-void
.end method

.method public x()Ljava/lang/String;
    .locals 10

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/b;->a:Landroidx/constraintlayout/solver/SolverVariable;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, "0"

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v1, ""

    .line 11
    .line 12
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Landroidx/constraintlayout/solver/b;->a:Landroidx/constraintlayout/solver/SolverVariable;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    :goto_0
    const-string v1, " = "

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget v1, p0, Landroidx/constraintlayout/solver/b;->b:F

    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    cmpl-float v1, v1, v2

    .line 34
    .line 35
    const/4 v3, 0x0

    .line 36
    const/4 v4, 0x1

    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    new-instance v1, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    iget v0, p0, Landroidx/constraintlayout/solver/b;->b:F

    .line 48
    .line 49
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    move v1, v4

    .line 57
    goto :goto_1

    .line 58
    :cond_1
    move v1, v3

    .line 59
    :goto_1
    iget-object v5, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 60
    .line 61
    iget v5, v5, Landroidx/constraintlayout/solver/a;->a:I

    .line 62
    .line 63
    :goto_2
    if-ge v3, v5, :cond_8

    .line 64
    .line 65
    iget-object v6, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 66
    .line 67
    invoke-virtual {v6, v3}, Landroidx/constraintlayout/solver/a;->h(I)Landroidx/constraintlayout/solver/SolverVariable;

    .line 68
    .line 69
    .line 70
    move-result-object v6

    .line 71
    if-nez v6, :cond_2

    .line 72
    .line 73
    goto/16 :goto_6

    .line 74
    .line 75
    :cond_2
    iget-object v7, p0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 76
    .line 77
    invoke-virtual {v7, v3}, Landroidx/constraintlayout/solver/a;->i(I)F

    .line 78
    .line 79
    .line 80
    move-result v7

    .line 81
    cmpl-float v8, v7, v2

    .line 82
    .line 83
    if-nez v8, :cond_3

    .line 84
    .line 85
    goto/16 :goto_6

    .line 86
    .line 87
    :cond_3
    invoke-virtual {v6}, Landroidx/constraintlayout/solver/SolverVariable;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v6

    .line 91
    const/high16 v9, -0x40800000    # -1.0f

    .line 92
    .line 93
    if-nez v1, :cond_4

    .line 94
    .line 95
    cmpg-float v1, v7, v2

    .line 96
    .line 97
    if-gez v1, :cond_6

    .line 98
    .line 99
    new-instance v1, Ljava/lang/StringBuilder;

    .line 100
    .line 101
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    const-string v0, "- "

    .line 108
    .line 109
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    :goto_3
    mul-float/2addr v7, v9

    .line 117
    goto :goto_4

    .line 118
    :cond_4
    if-lez v8, :cond_5

    .line 119
    .line 120
    new-instance v1, Ljava/lang/StringBuilder;

    .line 121
    .line 122
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    const-string v0, " + "

    .line 129
    .line 130
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    goto :goto_4

    .line 138
    :cond_5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 139
    .line 140
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 141
    .line 142
    .line 143
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    const-string v0, " - "

    .line 147
    .line 148
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    goto :goto_3

    .line 156
    :cond_6
    :goto_4
    const/high16 v1, 0x3f800000    # 1.0f

    .line 157
    .line 158
    cmpl-float v1, v7, v1

    .line 159
    .line 160
    if-nez v1, :cond_7

    .line 161
    .line 162
    new-instance v1, Ljava/lang/StringBuilder;

    .line 163
    .line 164
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 165
    .line 166
    .line 167
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    goto :goto_5

    .line 178
    :cond_7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 179
    .line 180
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 181
    .line 182
    .line 183
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    const-string v0, " "

    .line 190
    .line 191
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    :goto_5
    move v1, v4

    .line 202
    :goto_6
    add-int/lit8 v3, v3, 0x1

    .line 203
    .line 204
    goto/16 :goto_2

    .line 205
    .line 206
    :cond_8
    if-nez v1, :cond_9

    .line 207
    .line 208
    new-instance p0, Ljava/lang/StringBuilder;

    .line 209
    .line 210
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 211
    .line 212
    .line 213
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    .line 215
    .line 216
    const-string v0, "0.0"

    .line 217
    .line 218
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object p0

    .line 225
    return-object p0

    .line 226
    :cond_9
    return-object v0
.end method
