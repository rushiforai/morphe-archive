.class public Landroidx/constraintlayout/solver/widgets/b;
.super Ll/t1l;
.source "SourceFile"


# instance fields
.field public x0:I

.field public y0:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/constraintlayout/solver/widgets/i;",
            ">;"
        }
    .end annotation
.end field

.field public z0:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/t1l;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/b;->x0:I

    .line 6
    .line 7
    new-instance v0, Ljava/util/ArrayList;

    .line 8
    .line 9
    const/4 v1, 0x4

    .line 10
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Landroidx/constraintlayout/solver/widgets/b;->y0:Ljava/util/ArrayList;

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    iput-boolean v0, p0, Landroidx/constraintlayout/solver/widgets/b;->z0:Z

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public K0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Landroidx/constraintlayout/solver/widgets/b;->z0:Z

    .line 2
    .line 3
    return p0
.end method

.method public L0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Landroidx/constraintlayout/solver/widgets/b;->z0:Z

    .line 2
    .line 3
    return-void
.end method

.method public M0(I)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/b;->x0:I

    .line 2
    .line 3
    return-void
.end method

.method public S()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->S()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/b;->y0:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public U()V
    .locals 11

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/b;->x0:I

    .line 2
    .line 3
    const v1, 0x7f7fffff    # Float.MAX_VALUE

    .line 4
    .line 5
    .line 6
    const/4 v2, 0x3

    .line 7
    const/4 v3, 0x2

    .line 8
    const/4 v4, 0x1

    .line 9
    if-eqz v0, :cond_3

    .line 10
    .line 11
    const/4 v5, 0x0

    .line 12
    if-eq v0, v4, :cond_2

    .line 13
    .line 14
    if-eq v0, v3, :cond_1

    .line 15
    .line 16
    if-eq v0, v2, :cond_0

    .line 17
    .line 18
    goto/16 :goto_6

    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 21
    .line 22
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    :goto_0
    move v1, v5

    .line 27
    goto :goto_1

    .line 28
    :cond_1
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->v:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 29
    .line 30
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    goto :goto_1

    .line 35
    :cond_2
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 36
    .line 37
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    goto :goto_0

    .line 42
    :cond_3
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 43
    .line 44
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    :goto_1
    iget-object v5, p0, Landroidx/constraintlayout/solver/widgets/b;->y0:Ljava/util/ArrayList;

    .line 49
    .line 50
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 51
    .line 52
    .line 53
    move-result v5

    .line 54
    const/4 v6, 0x0

    .line 55
    const/4 v7, 0x0

    .line 56
    :goto_2
    if-ge v7, v5, :cond_8

    .line 57
    .line 58
    iget-object v8, p0, Landroidx/constraintlayout/solver/widgets/b;->y0:Ljava/util/ArrayList;

    .line 59
    .line 60
    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v8

    .line 64
    check-cast v8, Landroidx/constraintlayout/solver/widgets/i;

    .line 65
    .line 66
    iget v9, v8, Ll/s3d0;->b:I

    .line 67
    .line 68
    if-eq v9, v4, :cond_4

    .line 69
    .line 70
    goto :goto_6

    .line 71
    :cond_4
    iget v9, p0, Landroidx/constraintlayout/solver/widgets/b;->x0:I

    .line 72
    .line 73
    if-eqz v9, :cond_6

    .line 74
    .line 75
    if-ne v9, v3, :cond_5

    .line 76
    .line 77
    goto :goto_4

    .line 78
    :cond_5
    iget v9, v8, Landroidx/constraintlayout/solver/widgets/i;->h:F

    .line 79
    .line 80
    cmpl-float v10, v9, v1

    .line 81
    .line 82
    if-lez v10, :cond_7

    .line 83
    .line 84
    iget-object v1, v8, Landroidx/constraintlayout/solver/widgets/i;->g:Landroidx/constraintlayout/solver/widgets/i;

    .line 85
    .line 86
    :goto_3
    move-object v6, v1

    .line 87
    move v1, v9

    .line 88
    goto :goto_5

    .line 89
    :cond_6
    :goto_4
    iget v9, v8, Landroidx/constraintlayout/solver/widgets/i;->h:F

    .line 90
    .line 91
    cmpg-float v10, v9, v1

    .line 92
    .line 93
    if-gez v10, :cond_7

    .line 94
    .line 95
    iget-object v1, v8, Landroidx/constraintlayout/solver/widgets/i;->g:Landroidx/constraintlayout/solver/widgets/i;

    .line 96
    .line 97
    goto :goto_3

    .line 98
    :cond_7
    :goto_5
    add-int/lit8 v7, v7, 0x1

    .line 99
    .line 100
    goto :goto_2

    .line 101
    :cond_8
    invoke-static {}, Landroidx/constraintlayout/solver/c;->y()Ll/pa00;

    .line 102
    .line 103
    .line 104
    move-result-object v5

    .line 105
    if-eqz v5, :cond_9

    .line 106
    .line 107
    invoke-static {}, Landroidx/constraintlayout/solver/c;->y()Ll/pa00;

    .line 108
    .line 109
    .line 110
    move-result-object v5

    .line 111
    iget-wide v7, v5, Ll/pa00;->z:J

    .line 112
    .line 113
    const-wide/16 v9, 0x1

    .line 114
    .line 115
    add-long/2addr v7, v9

    .line 116
    iput-wide v7, v5, Ll/pa00;->z:J

    .line 117
    .line 118
    :cond_9
    iput-object v6, v0, Landroidx/constraintlayout/solver/widgets/i;->g:Landroidx/constraintlayout/solver/widgets/i;

    .line 119
    .line 120
    iput v1, v0, Landroidx/constraintlayout/solver/widgets/i;->h:F

    .line 121
    .line 122
    invoke-virtual {v0}, Ll/s3d0;->b()V

    .line 123
    .line 124
    .line 125
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/b;->x0:I

    .line 126
    .line 127
    if-eqz v0, :cond_d

    .line 128
    .line 129
    if-eq v0, v4, :cond_c

    .line 130
    .line 131
    if-eq v0, v3, :cond_b

    .line 132
    .line 133
    if-eq v0, v2, :cond_a

    .line 134
    .line 135
    :goto_6
    return-void

    .line 136
    :cond_a
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->v:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 137
    .line 138
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    invoke-virtual {p0, v6, v1}, Landroidx/constraintlayout/solver/widgets/i;->l(Landroidx/constraintlayout/solver/widgets/i;F)V

    .line 143
    .line 144
    .line 145
    return-void

    .line 146
    :cond_b
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 147
    .line 148
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    invoke-virtual {p0, v6, v1}, Landroidx/constraintlayout/solver/widgets/i;->l(Landroidx/constraintlayout/solver/widgets/i;F)V

    .line 153
    .line 154
    .line 155
    return-void

    .line 156
    :cond_c
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 157
    .line 158
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    invoke-virtual {p0, v6, v1}, Landroidx/constraintlayout/solver/widgets/i;->l(Landroidx/constraintlayout/solver/widgets/i;F)V

    .line 163
    .line 164
    .line 165
    return-void

    .line 166
    :cond_d
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 167
    .line 168
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    invoke-virtual {p0, v6, v1}, Landroidx/constraintlayout/solver/widgets/i;->l(Landroidx/constraintlayout/solver/widgets/i;F)V

    .line 173
    .line 174
    .line 175
    return-void
.end method

.method public b(Landroidx/constraintlayout/solver/c;)V
    .locals 10

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 2
    .line 3
    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    aput-object v1, v0, v2

    .line 7
    .line 8
    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->v:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 9
    .line 10
    const/4 v3, 0x2

    .line 11
    aput-object v1, v0, v3

    .line 12
    .line 13
    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 14
    .line 15
    const/4 v4, 0x1

    .line 16
    aput-object v1, v0, v4

    .line 17
    .line 18
    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 19
    .line 20
    const/4 v5, 0x3

    .line 21
    aput-object v1, v0, v5

    .line 22
    .line 23
    move v0, v2

    .line 24
    :goto_0
    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 25
    .line 26
    array-length v6, v1

    .line 27
    if-ge v0, v6, :cond_0

    .line 28
    .line 29
    aget-object v1, v1, v0

    .line 30
    .line 31
    invoke-virtual {p1, v1}, Landroidx/constraintlayout/solver/c;->r(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 32
    .line 33
    .line 34
    move-result-object v6

    .line 35
    iput-object v6, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    .line 36
    .line 37
    add-int/lit8 v0, v0, 0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/b;->x0:I

    .line 41
    .line 42
    if-ltz v0, :cond_11

    .line 43
    .line 44
    const/4 v6, 0x4

    .line 45
    if-ge v0, v6, :cond_11

    .line 46
    .line 47
    aget-object v0, v1, v0

    .line 48
    .line 49
    move v1, v2

    .line 50
    :goto_1
    iget v6, p0, Ll/t1l;->w0:I

    .line 51
    .line 52
    if-ge v1, v6, :cond_6

    .line 53
    .line 54
    iget-object v6, p0, Ll/t1l;->v0:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 55
    .line 56
    aget-object v6, v6, v1

    .line 57
    .line 58
    iget-boolean v7, p0, Landroidx/constraintlayout/solver/widgets/b;->z0:Z

    .line 59
    .line 60
    if-nez v7, :cond_1

    .line 61
    .line 62
    invoke-virtual {v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->c()Z

    .line 63
    .line 64
    .line 65
    move-result v7

    .line 66
    if-nez v7, :cond_1

    .line 67
    .line 68
    goto :goto_3

    .line 69
    :cond_1
    iget v7, p0, Landroidx/constraintlayout/solver/widgets/b;->x0:I

    .line 70
    .line 71
    if-eqz v7, :cond_2

    .line 72
    .line 73
    if-ne v7, v4, :cond_3

    .line 74
    .line 75
    :cond_2
    invoke-virtual {v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->s()Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 76
    .line 77
    .line 78
    move-result-object v7

    .line 79
    sget-object v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 80
    .line 81
    if-ne v7, v8, :cond_3

    .line 82
    .line 83
    :goto_2
    move v1, v4

    .line 84
    goto :goto_4

    .line 85
    :cond_3
    iget v7, p0, Landroidx/constraintlayout/solver/widgets/b;->x0:I

    .line 86
    .line 87
    if-eq v7, v3, :cond_4

    .line 88
    .line 89
    if-ne v7, v5, :cond_5

    .line 90
    .line 91
    :cond_4
    invoke-virtual {v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->B()Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 92
    .line 93
    .line 94
    move-result-object v6

    .line 95
    sget-object v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 96
    .line 97
    if-ne v6, v7, :cond_5

    .line 98
    .line 99
    goto :goto_2

    .line 100
    :cond_5
    :goto_3
    add-int/lit8 v1, v1, 0x1

    .line 101
    .line 102
    goto :goto_1

    .line 103
    :cond_6
    move v1, v2

    .line 104
    :goto_4
    iget v6, p0, Landroidx/constraintlayout/solver/widgets/b;->x0:I

    .line 105
    .line 106
    if-eqz v6, :cond_8

    .line 107
    .line 108
    if-ne v6, v4, :cond_7

    .line 109
    .line 110
    goto :goto_6

    .line 111
    :cond_7
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u()Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 112
    .line 113
    .line 114
    move-result-object v6

    .line 115
    invoke-virtual {v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->B()Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 116
    .line 117
    .line 118
    move-result-object v6

    .line 119
    sget-object v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->WRAP_CONTENT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 120
    .line 121
    if-ne v6, v7, :cond_9

    .line 122
    .line 123
    :goto_5
    move v1, v2

    .line 124
    goto :goto_7

    .line 125
    :cond_8
    :goto_6
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u()Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 126
    .line 127
    .line 128
    move-result-object v6

    .line 129
    invoke-virtual {v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->s()Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 130
    .line 131
    .line 132
    move-result-object v6

    .line 133
    sget-object v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->WRAP_CONTENT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 134
    .line 135
    if-ne v6, v7, :cond_9

    .line 136
    .line 137
    goto :goto_5

    .line 138
    :cond_9
    :goto_7
    move v6, v2

    .line 139
    :goto_8
    iget v7, p0, Ll/t1l;->w0:I

    .line 140
    .line 141
    if-ge v6, v7, :cond_d

    .line 142
    .line 143
    iget-object v7, p0, Ll/t1l;->v0:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 144
    .line 145
    aget-object v7, v7, v6

    .line 146
    .line 147
    iget-boolean v8, p0, Landroidx/constraintlayout/solver/widgets/b;->z0:Z

    .line 148
    .line 149
    if-nez v8, :cond_a

    .line 150
    .line 151
    invoke-virtual {v7}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->c()Z

    .line 152
    .line 153
    .line 154
    move-result v8

    .line 155
    if-nez v8, :cond_a

    .line 156
    .line 157
    goto :goto_a

    .line 158
    :cond_a
    iget-object v8, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 159
    .line 160
    iget v9, p0, Landroidx/constraintlayout/solver/widgets/b;->x0:I

    .line 161
    .line 162
    aget-object v8, v8, v9

    .line 163
    .line 164
    invoke-virtual {p1, v8}, Landroidx/constraintlayout/solver/c;->r(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 165
    .line 166
    .line 167
    move-result-object v8

    .line 168
    iget-object v7, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 169
    .line 170
    iget v9, p0, Landroidx/constraintlayout/solver/widgets/b;->x0:I

    .line 171
    .line 172
    aget-object v7, v7, v9

    .line 173
    .line 174
    iput-object v8, v7, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    .line 175
    .line 176
    if-eqz v9, :cond_c

    .line 177
    .line 178
    if-ne v9, v3, :cond_b

    .line 179
    .line 180
    goto :goto_9

    .line 181
    :cond_b
    iget-object v7, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    .line 182
    .line 183
    invoke-virtual {p1, v7, v8, v1}, Landroidx/constraintlayout/solver/c;->h(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Z)V

    .line 184
    .line 185
    .line 186
    goto :goto_a

    .line 187
    :cond_c
    :goto_9
    iget-object v7, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    .line 188
    .line 189
    invoke-virtual {p1, v7, v8, v1}, Landroidx/constraintlayout/solver/c;->j(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Z)V

    .line 190
    .line 191
    .line 192
    :goto_a
    add-int/lit8 v6, v6, 0x1

    .line 193
    .line 194
    goto :goto_8

    .line 195
    :cond_d
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/b;->x0:I

    .line 196
    .line 197
    const/4 v6, 0x5

    .line 198
    const/4 v7, 0x6

    .line 199
    if-nez v0, :cond_e

    .line 200
    .line 201
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 202
    .line 203
    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    .line 204
    .line 205
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 206
    .line 207
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    .line 208
    .line 209
    invoke-virtual {p1, v0, v3, v2, v7}, Landroidx/constraintlayout/solver/c;->e(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/b;

    .line 210
    .line 211
    .line 212
    if-nez v1, :cond_11

    .line 213
    .line 214
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 215
    .line 216
    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    .line 217
    .line 218
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->F:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 219
    .line 220
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 221
    .line 222
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    .line 223
    .line 224
    invoke-virtual {p1, v0, p0, v2, v6}, Landroidx/constraintlayout/solver/c;->e(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/b;

    .line 225
    .line 226
    .line 227
    return-void

    .line 228
    :cond_e
    if-ne v0, v4, :cond_f

    .line 229
    .line 230
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 231
    .line 232
    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    .line 233
    .line 234
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 235
    .line 236
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    .line 237
    .line 238
    invoke-virtual {p1, v0, v3, v2, v7}, Landroidx/constraintlayout/solver/c;->e(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/b;

    .line 239
    .line 240
    .line 241
    if-nez v1, :cond_11

    .line 242
    .line 243
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 244
    .line 245
    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    .line 246
    .line 247
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->F:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 248
    .line 249
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 250
    .line 251
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    .line 252
    .line 253
    invoke-virtual {p1, v0, p0, v2, v6}, Landroidx/constraintlayout/solver/c;->e(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/b;

    .line 254
    .line 255
    .line 256
    return-void

    .line 257
    :cond_f
    if-ne v0, v3, :cond_10

    .line 258
    .line 259
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 260
    .line 261
    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    .line 262
    .line 263
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->v:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 264
    .line 265
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    .line 266
    .line 267
    invoke-virtual {p1, v0, v3, v2, v7}, Landroidx/constraintlayout/solver/c;->e(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/b;

    .line 268
    .line 269
    .line 270
    if-nez v1, :cond_11

    .line 271
    .line 272
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->v:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 273
    .line 274
    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    .line 275
    .line 276
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->F:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 277
    .line 278
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 279
    .line 280
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    .line 281
    .line 282
    invoke-virtual {p1, v0, p0, v2, v6}, Landroidx/constraintlayout/solver/c;->e(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/b;

    .line 283
    .line 284
    .line 285
    return-void

    .line 286
    :cond_10
    if-ne v0, v5, :cond_11

    .line 287
    .line 288
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->v:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 289
    .line 290
    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    .line 291
    .line 292
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 293
    .line 294
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    .line 295
    .line 296
    invoke-virtual {p1, v0, v3, v2, v7}, Landroidx/constraintlayout/solver/c;->e(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/b;

    .line 297
    .line 298
    .line 299
    if-nez v1, :cond_11

    .line 300
    .line 301
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->v:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 302
    .line 303
    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    .line 304
    .line 305
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->F:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 306
    .line 307
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->v:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 308
    .line 309
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    .line 310
    .line 311
    invoke-virtual {p1, v0, p0, v2, v6}, Landroidx/constraintlayout/solver/c;->e(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/b;

    .line 312
    .line 313
    .line 314
    :cond_11
    return-void
.end method

.method public c()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public d(I)V
    .locals 7

    .line 1
    iget-object p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->F:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    goto/16 :goto_6

    .line 6
    .line 7
    :cond_0
    check-cast p1, Landroidx/constraintlayout/solver/widgets/e;

    .line 8
    .line 9
    const/4 v0, 0x2

    .line 10
    invoke-virtual {p1, v0}, Landroidx/constraintlayout/solver/widgets/e;->Y0(I)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-nez p1, :cond_1

    .line 15
    .line 16
    goto/16 :goto_6

    .line 17
    .line 18
    :cond_1
    iget p1, p0, Landroidx/constraintlayout/solver/widgets/b;->x0:I

    .line 19
    .line 20
    const/4 v1, 0x3

    .line 21
    const/4 v2, 0x1

    .line 22
    if-eqz p1, :cond_5

    .line 23
    .line 24
    if-eq p1, v2, :cond_4

    .line 25
    .line 26
    if-eq p1, v0, :cond_3

    .line 27
    .line 28
    if-eq p1, v1, :cond_2

    .line 29
    .line 30
    goto/16 :goto_6

    .line 31
    .line 32
    :cond_2
    iget-object p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 33
    .line 34
    invoke-virtual {p1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    goto :goto_0

    .line 39
    :cond_3
    iget-object p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->v:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 40
    .line 41
    invoke-virtual {p1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    goto :goto_0

    .line 46
    :cond_4
    iget-object p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 47
    .line 48
    invoke-virtual {p1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    goto :goto_0

    .line 53
    :cond_5
    iget-object p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 54
    .line 55
    invoke-virtual {p1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    :goto_0
    const/4 v3, 0x5

    .line 60
    invoke-virtual {p1, v3}, Landroidx/constraintlayout/solver/widgets/i;->p(I)V

    .line 61
    .line 62
    .line 63
    iget v3, p0, Landroidx/constraintlayout/solver/widgets/b;->x0:I

    .line 64
    .line 65
    const/4 v4, 0x0

    .line 66
    const/4 v5, 0x0

    .line 67
    if-eqz v3, :cond_7

    .line 68
    .line 69
    if-ne v3, v2, :cond_6

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_6
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 73
    .line 74
    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    invoke-virtual {v3, v5, v4}, Landroidx/constraintlayout/solver/widgets/i;->l(Landroidx/constraintlayout/solver/widgets/i;F)V

    .line 79
    .line 80
    .line 81
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 82
    .line 83
    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    invoke-virtual {v3, v5, v4}, Landroidx/constraintlayout/solver/widgets/i;->l(Landroidx/constraintlayout/solver/widgets/i;F)V

    .line 88
    .line 89
    .line 90
    goto :goto_2

    .line 91
    :cond_7
    :goto_1
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->v:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 92
    .line 93
    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    invoke-virtual {v3, v5, v4}, Landroidx/constraintlayout/solver/widgets/i;->l(Landroidx/constraintlayout/solver/widgets/i;F)V

    .line 98
    .line 99
    .line 100
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 101
    .line 102
    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    invoke-virtual {v3, v5, v4}, Landroidx/constraintlayout/solver/widgets/i;->l(Landroidx/constraintlayout/solver/widgets/i;F)V

    .line 107
    .line 108
    .line 109
    :goto_2
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/b;->y0:Ljava/util/ArrayList;

    .line 110
    .line 111
    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 112
    .line 113
    .line 114
    const/4 v3, 0x0

    .line 115
    :goto_3
    iget v4, p0, Ll/t1l;->w0:I

    .line 116
    .line 117
    if-ge v3, v4, :cond_e

    .line 118
    .line 119
    iget-object v4, p0, Ll/t1l;->v0:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 120
    .line 121
    aget-object v4, v4, v3

    .line 122
    .line 123
    iget-boolean v6, p0, Landroidx/constraintlayout/solver/widgets/b;->z0:Z

    .line 124
    .line 125
    if-nez v6, :cond_8

    .line 126
    .line 127
    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->c()Z

    .line 128
    .line 129
    .line 130
    move-result v6

    .line 131
    if-nez v6, :cond_8

    .line 132
    .line 133
    goto :goto_5

    .line 134
    :cond_8
    iget v6, p0, Landroidx/constraintlayout/solver/widgets/b;->x0:I

    .line 135
    .line 136
    if-eqz v6, :cond_c

    .line 137
    .line 138
    if-eq v6, v2, :cond_b

    .line 139
    .line 140
    if-eq v6, v0, :cond_a

    .line 141
    .line 142
    if-eq v6, v1, :cond_9

    .line 143
    .line 144
    move-object v4, v5

    .line 145
    goto :goto_4

    .line 146
    :cond_9
    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 147
    .line 148
    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 149
    .line 150
    .line 151
    move-result-object v4

    .line 152
    goto :goto_4

    .line 153
    :cond_a
    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->v:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 154
    .line 155
    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 156
    .line 157
    .line 158
    move-result-object v4

    .line 159
    goto :goto_4

    .line 160
    :cond_b
    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 161
    .line 162
    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 163
    .line 164
    .line 165
    move-result-object v4

    .line 166
    goto :goto_4

    .line 167
    :cond_c
    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 168
    .line 169
    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 170
    .line 171
    .line 172
    move-result-object v4

    .line 173
    :goto_4
    if-eqz v4, :cond_d

    .line 174
    .line 175
    iget-object v6, p0, Landroidx/constraintlayout/solver/widgets/b;->y0:Ljava/util/ArrayList;

    .line 176
    .line 177
    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 178
    .line 179
    .line 180
    invoke-virtual {v4, p1}, Ll/s3d0;->a(Ll/s3d0;)V

    .line 181
    .line 182
    .line 183
    :cond_d
    :goto_5
    add-int/lit8 v3, v3, 0x1

    .line 184
    .line 185
    goto :goto_3

    .line 186
    :cond_e
    :goto_6
    return-void
.end method
