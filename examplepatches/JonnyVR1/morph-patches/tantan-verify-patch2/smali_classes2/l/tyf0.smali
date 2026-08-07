.class public final Ll/tyf0;
.super Ll/bge;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/bge<",
        "Ll/tyf0;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Ll/ezf0;

.field public B:F

.field public C:Z


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ll/ysi;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            ">(TK;",
            "Ll/ysi<",
            "TK;>;)V"
        }
    .end annotation

    .line 16
    invoke-direct {p0, p1, p2}, Ll/bge;-><init>(Ljava/lang/Object;Ll/ysi;)V

    const/4 p1, 0x0

    .line 17
    iput-object p1, p0, Ll/tyf0;->A:Ll/ezf0;

    const p1, 0x7f7fffff    # Float.MAX_VALUE

    .line 18
    iput p1, p0, Ll/tyf0;->B:F

    const/4 p1, 0x0

    .line 19
    iput-boolean p1, p0, Ll/tyf0;->C:Z

    return-void
.end method

.method public constructor <init>(Ll/zsi;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bge;-><init>(Ll/zsi;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Ll/tyf0;->A:Ll/ezf0;

    .line 6
    .line 7
    const p1, 0x7f7fffff    # Float.MAX_VALUE

    .line 8
    .line 9
    .line 10
    iput p1, p0, Ll/tyf0;->B:F

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    iput-boolean p1, p0, Ll/tyf0;->C:Z

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public l()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/tyf0;->q()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/tyf0;->A:Ll/ezf0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/bge;->f()F

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    float-to-double v1, v1

    .line 11
    invoke-virtual {v0, v1, v2}, Ll/ezf0;->g(D)V

    .line 12
    .line 13
    .line 14
    invoke-super {p0}, Ll/bge;->l()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public n(J)Z
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-boolean v1, v0, Ll/tyf0;->C:Z

    .line 4
    .line 5
    iget v2, v0, Ll/tyf0;->B:F

    .line 6
    .line 7
    const/4 v3, 0x1

    .line 8
    const/4 v4, 0x0

    .line 9
    const/4 v5, 0x0

    .line 10
    const v6, 0x7f7fffff    # Float.MAX_VALUE

    .line 11
    .line 12
    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    cmpl-float v1, v2, v6

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget-object v1, v0, Ll/tyf0;->A:Ll/ezf0;

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Ll/ezf0;->e(F)Ll/ezf0;

    .line 22
    .line 23
    .line 24
    iput v6, v0, Ll/tyf0;->B:F

    .line 25
    .line 26
    :cond_0
    iget-object v1, v0, Ll/tyf0;->A:Ll/ezf0;

    .line 27
    .line 28
    invoke-virtual {v1}, Ll/ezf0;->a()F

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    iput v1, v0, Ll/bge;->b:F

    .line 33
    .line 34
    iput v5, v0, Ll/bge;->a:F

    .line 35
    .line 36
    iput-boolean v4, v0, Ll/tyf0;->C:Z

    .line 37
    .line 38
    return v3

    .line 39
    :cond_1
    cmpl-float v1, v2, v6

    .line 40
    .line 41
    iget-object v7, v0, Ll/tyf0;->A:Ll/ezf0;

    .line 42
    .line 43
    if-eqz v1, :cond_2

    .line 44
    .line 45
    invoke-virtual {v7}, Ll/ezf0;->a()F

    .line 46
    .line 47
    .line 48
    iget-object v8, v0, Ll/tyf0;->A:Ll/ezf0;

    .line 49
    .line 50
    iget v1, v0, Ll/bge;->b:F

    .line 51
    .line 52
    float-to-double v9, v1

    .line 53
    iget v1, v0, Ll/bge;->a:F

    .line 54
    .line 55
    float-to-double v11, v1

    .line 56
    const-wide/16 v1, 0x2

    .line 57
    .line 58
    div-long v13, p1, v1

    .line 59
    .line 60
    invoke-virtual/range {v8 .. v14}, Ll/ezf0;->h(DDJ)Ll/bge$p;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    iget-object v2, v0, Ll/tyf0;->A:Ll/ezf0;

    .line 65
    .line 66
    iget v7, v0, Ll/tyf0;->B:F

    .line 67
    .line 68
    invoke-virtual {v2, v7}, Ll/ezf0;->e(F)Ll/ezf0;

    .line 69
    .line 70
    .line 71
    iput v6, v0, Ll/tyf0;->B:F

    .line 72
    .line 73
    move-wide/from16 v18, v13

    .line 74
    .line 75
    iget-object v13, v0, Ll/tyf0;->A:Ll/ezf0;

    .line 76
    .line 77
    iget v2, v1, Ll/bge$p;->a:F

    .line 78
    .line 79
    float-to-double v14, v2

    .line 80
    iget v1, v1, Ll/bge$p;->b:F

    .line 81
    .line 82
    float-to-double v1, v1

    .line 83
    move-wide/from16 v16, v1

    .line 84
    .line 85
    invoke-virtual/range {v13 .. v19}, Ll/ezf0;->h(DDJ)Ll/bge$p;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    iget v2, v1, Ll/bge$p;->a:F

    .line 90
    .line 91
    iput v2, v0, Ll/bge;->b:F

    .line 92
    .line 93
    iget v1, v1, Ll/bge$p;->b:F

    .line 94
    .line 95
    iput v1, v0, Ll/bge;->a:F

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_2
    iget v1, v0, Ll/bge;->b:F

    .line 99
    .line 100
    float-to-double v8, v1

    .line 101
    iget v1, v0, Ll/bge;->a:F

    .line 102
    .line 103
    float-to-double v10, v1

    .line 104
    move-wide/from16 v12, p1

    .line 105
    .line 106
    invoke-virtual/range {v7 .. v13}, Ll/ezf0;->h(DDJ)Ll/bge$p;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    iget v2, v1, Ll/bge$p;->a:F

    .line 111
    .line 112
    iput v2, v0, Ll/bge;->b:F

    .line 113
    .line 114
    iget v1, v1, Ll/bge$p;->b:F

    .line 115
    .line 116
    iput v1, v0, Ll/bge;->a:F

    .line 117
    .line 118
    :goto_0
    iget v1, v0, Ll/bge;->b:F

    .line 119
    .line 120
    iget v2, v0, Ll/bge;->h:F

    .line 121
    .line 122
    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    iput v1, v0, Ll/bge;->b:F

    .line 127
    .line 128
    iget v2, v0, Ll/bge;->g:F

    .line 129
    .line 130
    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    iput v1, v0, Ll/bge;->b:F

    .line 135
    .line 136
    iget v2, v0, Ll/bge;->a:F

    .line 137
    .line 138
    invoke-virtual {v0, v1, v2}, Ll/tyf0;->p(FF)Z

    .line 139
    .line 140
    .line 141
    move-result v1

    .line 142
    if-eqz v1, :cond_3

    .line 143
    .line 144
    iget-object v1, v0, Ll/tyf0;->A:Ll/ezf0;

    .line 145
    .line 146
    invoke-virtual {v1}, Ll/ezf0;->a()F

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    iput v1, v0, Ll/bge;->b:F

    .line 151
    .line 152
    iput v5, v0, Ll/bge;->a:F

    .line 153
    .line 154
    return v3

    .line 155
    :cond_3
    return v4
.end method

.method public o(F)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/bge;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput p1, p0, Ll/tyf0;->B:F

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Ll/tyf0;->A:Ll/ezf0;

    .line 11
    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    new-instance v0, Ll/ezf0;

    .line 15
    .line 16
    invoke-direct {v0, p1}, Ll/ezf0;-><init>(F)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/tyf0;->A:Ll/ezf0;

    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Ll/tyf0;->A:Ll/ezf0;

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Ll/ezf0;->e(F)Ll/ezf0;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/tyf0;->l()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public p(FF)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tyf0;->A:Ll/ezf0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/ezf0;->c(FF)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final q()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/tyf0;->A:Ll/ezf0;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/ezf0;->a()F

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    float-to-double v0, v0

    .line 10
    iget v2, p0, Ll/bge;->g:F

    .line 11
    .line 12
    float-to-double v2, v2

    .line 13
    cmpl-double v2, v0, v2

    .line 14
    .line 15
    if-gtz v2, :cond_1

    .line 16
    .line 17
    iget p0, p0, Ll/bge;->h:F

    .line 18
    .line 19
    float-to-double v2, p0

    .line 20
    cmpg-double p0, v0, v2

    .line 21
    .line 22
    if-ltz p0, :cond_0

    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    const-string p0, "Final position of the spring cannot be less than the min value."

    .line 26
    .line 27
    invoke-static {p0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    const-string p0, "Final position of the spring cannot be greater than the max value."

    .line 32
    .line 33
    invoke-static {p0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_2
    const-string p0, "Incomplete SpringAnimation: Either final position or a spring force needs to be set."

    .line 38
    .line 39
    invoke-static {p0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public r(Ll/ezf0;)Ll/tyf0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tyf0;->A:Ll/ezf0;

    .line 2
    .line 3
    return-object p0
.end method
