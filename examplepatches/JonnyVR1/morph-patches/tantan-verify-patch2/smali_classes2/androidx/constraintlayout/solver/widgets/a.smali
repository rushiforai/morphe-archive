.class public Landroidx/constraintlayout/solver/widgets/a;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Landroidx/constraintlayout/solver/widgets/e;)V
    .locals 10

    .line 1
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/e;->S0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0x20

    .line 6
    .line 7
    and-int/2addr v0, v1

    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    invoke-static {p0}, Landroidx/constraintlayout/solver/widgets/a;->j(Landroidx/constraintlayout/solver/widgets/e;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/4 v0, 0x1

    .line 15
    iput-boolean v0, p0, Landroidx/constraintlayout/solver/widgets/e;->O0:Z

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    iput-boolean v1, p0, Landroidx/constraintlayout/solver/widgets/e;->I0:Z

    .line 19
    .line 20
    iput-boolean v1, p0, Landroidx/constraintlayout/solver/widgets/e;->J0:Z

    .line 21
    .line 22
    iput-boolean v1, p0, Landroidx/constraintlayout/solver/widgets/e;->K0:Z

    .line 23
    .line 24
    iget-object v2, p0, Ll/jfq0;->v0:Ljava/util/ArrayList;

    .line 25
    .line 26
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/e;->H0:Ljava/util/List;

    .line 27
    .line 28
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->s()Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    sget-object v5, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->WRAP_CONTENT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 33
    .line 34
    if-ne v4, v5, :cond_1

    .line 35
    .line 36
    move v4, v0

    .line 37
    goto :goto_0

    .line 38
    :cond_1
    move v4, v1

    .line 39
    :goto_0
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->B()Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 40
    .line 41
    .line 42
    move-result-object v6

    .line 43
    if-ne v6, v5, :cond_2

    .line 44
    .line 45
    move v5, v0

    .line 46
    goto :goto_1

    .line 47
    :cond_2
    move v5, v1

    .line 48
    :goto_1
    if-nez v4, :cond_4

    .line 49
    .line 50
    if-eqz v5, :cond_3

    .line 51
    .line 52
    goto :goto_2

    .line 53
    :cond_3
    move v6, v1

    .line 54
    goto :goto_3

    .line 55
    :cond_4
    :goto_2
    move v6, v0

    .line 56
    :goto_3
    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 57
    .line 58
    .line 59
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 60
    .line 61
    .line 62
    move-result-object v7

    .line 63
    :goto_4
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    .line 64
    .line 65
    .line 66
    move-result v8

    .line 67
    if-eqz v8, :cond_5

    .line 68
    .line 69
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v8

    .line 73
    check-cast v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 74
    .line 75
    const/4 v9, 0x0

    .line 76
    iput-object v9, v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r:Landroidx/constraintlayout/solver/widgets/f;

    .line 77
    .line 78
    iput-boolean v1, v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->k0:Z

    .line 79
    .line 80
    invoke-virtual {v8}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->S()V

    .line 81
    .line 82
    .line 83
    goto :goto_4

    .line 84
    :cond_5
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    :cond_6
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 89
    .line 90
    .line 91
    move-result v7

    .line 92
    if-eqz v7, :cond_7

    .line 93
    .line 94
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v7

    .line 98
    check-cast v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 99
    .line 100
    iget-object v8, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r:Landroidx/constraintlayout/solver/widgets/f;

    .line 101
    .line 102
    if-nez v8, :cond_6

    .line 103
    .line 104
    invoke-static {v7, v3, v6}, Landroidx/constraintlayout/solver/widgets/a;->b(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Ljava/util/List;Z)Z

    .line 105
    .line 106
    .line 107
    move-result v7

    .line 108
    if-nez v7, :cond_6

    .line 109
    .line 110
    invoke-static {p0}, Landroidx/constraintlayout/solver/widgets/a;->j(Landroidx/constraintlayout/solver/widgets/e;)V

    .line 111
    .line 112
    .line 113
    iput-boolean v1, p0, Landroidx/constraintlayout/solver/widgets/e;->O0:Z

    .line 114
    .line 115
    return-void

    .line 116
    :cond_7
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    move v6, v1

    .line 121
    move v7, v6

    .line 122
    :goto_5
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 123
    .line 124
    .line 125
    move-result v8

    .line 126
    if-eqz v8, :cond_8

    .line 127
    .line 128
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object v8

    .line 132
    check-cast v8, Landroidx/constraintlayout/solver/widgets/f;

    .line 133
    .line 134
    invoke-static {v8, v1}, Landroidx/constraintlayout/solver/widgets/a;->c(Landroidx/constraintlayout/solver/widgets/f;I)I

    .line 135
    .line 136
    .line 137
    move-result v9

    .line 138
    invoke-static {v6, v9}, Ljava/lang/Math;->max(II)I

    .line 139
    .line 140
    .line 141
    move-result v6

    .line 142
    invoke-static {v8, v0}, Landroidx/constraintlayout/solver/widgets/a;->c(Landroidx/constraintlayout/solver/widgets/f;I)I

    .line 143
    .line 144
    .line 145
    move-result v8

    .line 146
    invoke-static {v7, v8}, Ljava/lang/Math;->max(II)I

    .line 147
    .line 148
    .line 149
    move-result v7

    .line 150
    goto :goto_5

    .line 151
    :cond_8
    if-eqz v4, :cond_9

    .line 152
    .line 153
    sget-object v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->FIXED:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 154
    .line 155
    invoke-virtual {p0, v2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->g0(Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {p0, v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y0(I)V

    .line 159
    .line 160
    .line 161
    iput-boolean v0, p0, Landroidx/constraintlayout/solver/widgets/e;->I0:Z

    .line 162
    .line 163
    iput-boolean v0, p0, Landroidx/constraintlayout/solver/widgets/e;->J0:Z

    .line 164
    .line 165
    iput v6, p0, Landroidx/constraintlayout/solver/widgets/e;->L0:I

    .line 166
    .line 167
    :cond_9
    if-eqz v5, :cond_a

    .line 168
    .line 169
    sget-object v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->FIXED:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 170
    .line 171
    invoke-virtual {p0, v2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u0(Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {p0, v7}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->b0(I)V

    .line 175
    .line 176
    .line 177
    iput-boolean v0, p0, Landroidx/constraintlayout/solver/widgets/e;->I0:Z

    .line 178
    .line 179
    iput-boolean v0, p0, Landroidx/constraintlayout/solver/widgets/e;->K0:Z

    .line 180
    .line 181
    iput v7, p0, Landroidx/constraintlayout/solver/widgets/e;->M0:I

    .line 182
    .line 183
    :cond_a
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D()I

    .line 184
    .line 185
    .line 186
    move-result v2

    .line 187
    invoke-static {v3, v1, v2}, Landroidx/constraintlayout/solver/widgets/a;->i(Ljava/util/List;II)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r()I

    .line 191
    .line 192
    .line 193
    move-result p0

    .line 194
    invoke-static {v3, v0, p0}, Landroidx/constraintlayout/solver/widgets/a;->i(Ljava/util/List;II)V

    .line 195
    .line 196
    .line 197
    return-void
.end method

.method public static b(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Ljava/util/List;Z)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/constraintlayout/solver/widgets/ConstraintWidget;",
            "Ljava/util/List<",
            "Landroidx/constraintlayout/solver/widgets/f;",
            ">;Z)Z"
        }
    .end annotation

    .line 1
    new-instance v0, Landroidx/constraintlayout/solver/widgets/f;

    .line 2
    .line 3
    new-instance v1, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    invoke-direct {v0, v1, v2}, Landroidx/constraintlayout/solver/widgets/f;-><init>(Ljava/util/List;Z)V

    .line 10
    .line 11
    .line 12
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    invoke-static {p0, v0, p1, p2}, Landroidx/constraintlayout/solver/widgets/a;->k(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/f;Ljava/util/List;Z)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method public static c(Landroidx/constraintlayout/solver/widgets/f;I)I
    .locals 9

    .line 1
    mul-int/lit8 v0, p1, 0x2

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/solver/widgets/f;->b(I)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    const/4 v3, 0x0

    .line 12
    move v4, v3

    .line 13
    move v5, v4

    .line 14
    :goto_0
    if-ge v4, v2, :cond_2

    .line 15
    .line 16
    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v6

    .line 20
    check-cast v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 21
    .line 22
    iget-object v7, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 23
    .line 24
    add-int/lit8 v8, v0, 0x1

    .line 25
    .line 26
    aget-object v8, v7, v8

    .line 27
    .line 28
    iget-object v8, v8, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 29
    .line 30
    if-eqz v8, :cond_1

    .line 31
    .line 32
    aget-object v7, v7, v0

    .line 33
    .line 34
    iget-object v7, v7, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 35
    .line 36
    if-eqz v7, :cond_0

    .line 37
    .line 38
    if-eqz v8, :cond_0

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_0
    move v7, v3

    .line 42
    goto :goto_2

    .line 43
    :cond_1
    :goto_1
    const/4 v7, 0x1

    .line 44
    :goto_2
    invoke-static {v6, p1, v7, v3}, Landroidx/constraintlayout/solver/widgets/a;->d(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;IZI)I

    .line 45
    .line 46
    .line 47
    move-result v6

    .line 48
    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    .line 49
    .line 50
    .line 51
    move-result v5

    .line 52
    add-int/lit8 v4, v4, 0x1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/f;->e:[I

    .line 56
    .line 57
    aput v5, p0, p1

    .line 58
    .line 59
    return v5
.end method

.method public static d(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;IZI)I
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    iget-boolean v3, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->i0:Z

    .line 8
    .line 9
    const/4 v4, 0x0

    .line 10
    if-nez v3, :cond_0

    .line 11
    .line 12
    return v4

    .line 13
    :cond_0
    iget-object v3, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 14
    .line 15
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 16
    .line 17
    const/4 v5, 0x1

    .line 18
    if-eqz v3, :cond_1

    .line 19
    .line 20
    if-ne v1, v5, :cond_1

    .line 21
    .line 22
    move v3, v5

    .line 23
    goto :goto_0

    .line 24
    :cond_1
    move v3, v4

    .line 25
    :goto_0
    if-eqz v2, :cond_2

    .line 26
    .line 27
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->j()I

    .line 28
    .line 29
    .line 30
    move-result v6

    .line 31
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r()I

    .line 32
    .line 33
    .line 34
    move-result v7

    .line 35
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->j()I

    .line 36
    .line 37
    .line 38
    move-result v8

    .line 39
    sub-int/2addr v7, v8

    .line 40
    mul-int/lit8 v8, v1, 0x2

    .line 41
    .line 42
    add-int/lit8 v9, v8, 0x1

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_2
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r()I

    .line 46
    .line 47
    .line 48
    move-result v6

    .line 49
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->j()I

    .line 50
    .line 51
    .line 52
    move-result v7

    .line 53
    sub-int/2addr v6, v7

    .line 54
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->j()I

    .line 55
    .line 56
    .line 57
    move-result v7

    .line 58
    mul-int/lit8 v9, v1, 0x2

    .line 59
    .line 60
    add-int/lit8 v8, v9, 0x1

    .line 61
    .line 62
    :goto_1
    iget-object v10, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 63
    .line 64
    aget-object v11, v10, v9

    .line 65
    .line 66
    iget-object v11, v11, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 67
    .line 68
    if-eqz v11, :cond_3

    .line 69
    .line 70
    aget-object v11, v10, v8

    .line 71
    .line 72
    iget-object v11, v11, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 73
    .line 74
    if-nez v11, :cond_3

    .line 75
    .line 76
    move v11, v9

    .line 77
    move v9, v8

    .line 78
    move v8, v11

    .line 79
    const/4 v11, -0x1

    .line 80
    goto :goto_2

    .line 81
    :cond_3
    move v11, v5

    .line 82
    :goto_2
    if-eqz v3, :cond_4

    .line 83
    .line 84
    sub-int v13, p3, v6

    .line 85
    .line 86
    goto :goto_3

    .line 87
    :cond_4
    move/from16 v13, p3

    .line 88
    .line 89
    :goto_3
    aget-object v10, v10, v8

    .line 90
    .line 91
    invoke-virtual {v10}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    .line 92
    .line 93
    .line 94
    move-result v10

    .line 95
    mul-int/2addr v10, v11

    .line 96
    invoke-static/range {p0 .. p1}, Landroidx/constraintlayout/solver/widgets/a;->e(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;I)I

    .line 97
    .line 98
    .line 99
    move-result v14

    .line 100
    add-int/2addr v10, v14

    .line 101
    add-int/2addr v13, v10

    .line 102
    if-nez v1, :cond_5

    .line 103
    .line 104
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D()I

    .line 105
    .line 106
    .line 107
    move-result v14

    .line 108
    goto :goto_4

    .line 109
    :cond_5
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r()I

    .line 110
    .line 111
    .line 112
    move-result v14

    .line 113
    :goto_4
    mul-int/2addr v14, v11

    .line 114
    iget-object v15, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 115
    .line 116
    aget-object v15, v15, v8

    .line 117
    .line 118
    invoke-virtual {v15}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 119
    .line 120
    .line 121
    move-result-object v15

    .line 122
    iget-object v15, v15, Ll/s3d0;->a:Ljava/util/HashSet;

    .line 123
    .line 124
    invoke-virtual {v15}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 125
    .line 126
    .line 127
    move-result-object v15

    .line 128
    :goto_5
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    .line 129
    .line 130
    .line 131
    move-result v17

    .line 132
    if-eqz v17, :cond_6

    .line 133
    .line 134
    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object v17

    .line 138
    check-cast v17, Ll/s3d0;

    .line 139
    .line 140
    move-object/from16 v12, v17

    .line 141
    .line 142
    check-cast v12, Landroidx/constraintlayout/solver/widgets/i;

    .line 143
    .line 144
    iget-object v12, v12, Landroidx/constraintlayout/solver/widgets/i;->c:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 145
    .line 146
    iget-object v12, v12, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->b:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 147
    .line 148
    invoke-static {v12, v1, v2, v13}, Landroidx/constraintlayout/solver/widgets/a;->d(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;IZI)I

    .line 149
    .line 150
    .line 151
    move-result v12

    .line 152
    invoke-static {v4, v12}, Ljava/lang/Math;->max(II)I

    .line 153
    .line 154
    .line 155
    move-result v4

    .line 156
    goto :goto_5

    .line 157
    :cond_6
    iget-object v12, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 158
    .line 159
    aget-object v12, v12, v9

    .line 160
    .line 161
    invoke-virtual {v12}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 162
    .line 163
    .line 164
    move-result-object v12

    .line 165
    iget-object v12, v12, Ll/s3d0;->a:Ljava/util/HashSet;

    .line 166
    .line 167
    invoke-virtual {v12}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 168
    .line 169
    .line 170
    move-result-object v12

    .line 171
    const/4 v15, 0x0

    .line 172
    :goto_6
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    .line 173
    .line 174
    .line 175
    move-result v17

    .line 176
    if-eqz v17, :cond_7

    .line 177
    .line 178
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    move-result-object v17

    .line 182
    check-cast v17, Ll/s3d0;

    .line 183
    .line 184
    move-object/from16 v5, v17

    .line 185
    .line 186
    check-cast v5, Landroidx/constraintlayout/solver/widgets/i;

    .line 187
    .line 188
    iget-object v5, v5, Landroidx/constraintlayout/solver/widgets/i;->c:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 189
    .line 190
    iget-object v5, v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->b:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 191
    .line 192
    move/from16 v17, v3

    .line 193
    .line 194
    add-int v3, v14, v13

    .line 195
    .line 196
    invoke-static {v5, v1, v2, v3}, Landroidx/constraintlayout/solver/widgets/a;->d(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;IZI)I

    .line 197
    .line 198
    .line 199
    move-result v3

    .line 200
    invoke-static {v15, v3}, Ljava/lang/Math;->max(II)I

    .line 201
    .line 202
    .line 203
    move-result v15

    .line 204
    move/from16 v3, v17

    .line 205
    .line 206
    const/4 v5, 0x1

    .line 207
    goto :goto_6

    .line 208
    :cond_7
    move/from16 v17, v3

    .line 209
    .line 210
    if-eqz v17, :cond_8

    .line 211
    .line 212
    sub-int/2addr v4, v6

    .line 213
    add-int/2addr v15, v7

    .line 214
    :goto_7
    const/4 v3, 0x1

    .line 215
    goto :goto_9

    .line 216
    :cond_8
    if-nez v1, :cond_9

    .line 217
    .line 218
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D()I

    .line 219
    .line 220
    .line 221
    move-result v3

    .line 222
    goto :goto_8

    .line 223
    :cond_9
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r()I

    .line 224
    .line 225
    .line 226
    move-result v3

    .line 227
    :goto_8
    mul-int/2addr v3, v11

    .line 228
    add-int/2addr v15, v3

    .line 229
    goto :goto_7

    .line 230
    :goto_9
    if-ne v1, v3, :cond_e

    .line 231
    .line 232
    iget-object v5, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 233
    .line 234
    invoke-virtual {v5}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 235
    .line 236
    .line 237
    move-result-object v5

    .line 238
    iget-object v5, v5, Ll/s3d0;->a:Ljava/util/HashSet;

    .line 239
    .line 240
    invoke-virtual {v5}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 241
    .line 242
    .line 243
    move-result-object v5

    .line 244
    const/4 v12, 0x0

    .line 245
    :goto_a
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 246
    .line 247
    .line 248
    move-result v16

    .line 249
    if-eqz v16, :cond_b

    .line 250
    .line 251
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 252
    .line 253
    .line 254
    move-result-object v16

    .line 255
    check-cast v16, Ll/s3d0;

    .line 256
    .line 257
    move-object/from16 p3, v5

    .line 258
    .line 259
    move-object/from16 v5, v16

    .line 260
    .line 261
    check-cast v5, Landroidx/constraintlayout/solver/widgets/i;

    .line 262
    .line 263
    if-ne v11, v3, :cond_a

    .line 264
    .line 265
    iget-object v3, v5, Landroidx/constraintlayout/solver/widgets/i;->c:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 266
    .line 267
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->b:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 268
    .line 269
    add-int v5, v6, v13

    .line 270
    .line 271
    invoke-static {v3, v1, v2, v5}, Landroidx/constraintlayout/solver/widgets/a;->d(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;IZI)I

    .line 272
    .line 273
    .line 274
    move-result v3

    .line 275
    invoke-static {v12, v3}, Ljava/lang/Math;->max(II)I

    .line 276
    .line 277
    .line 278
    move-result v3

    .line 279
    :goto_b
    move v12, v3

    .line 280
    goto :goto_c

    .line 281
    :cond_a
    iget-object v3, v5, Landroidx/constraintlayout/solver/widgets/i;->c:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 282
    .line 283
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->b:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 284
    .line 285
    mul-int v5, v7, v11

    .line 286
    .line 287
    add-int/2addr v5, v13

    .line 288
    invoke-static {v3, v1, v2, v5}, Landroidx/constraintlayout/solver/widgets/a;->d(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;IZI)I

    .line 289
    .line 290
    .line 291
    move-result v3

    .line 292
    invoke-static {v12, v3}, Ljava/lang/Math;->max(II)I

    .line 293
    .line 294
    .line 295
    move-result v3

    .line 296
    goto :goto_b

    .line 297
    :goto_c
    move-object/from16 v5, p3

    .line 298
    .line 299
    const/4 v3, 0x1

    .line 300
    goto :goto_a

    .line 301
    :cond_b
    iget-object v3, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 302
    .line 303
    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 304
    .line 305
    .line 306
    move-result-object v3

    .line 307
    iget-object v3, v3, Ll/s3d0;->a:Ljava/util/HashSet;

    .line 308
    .line 309
    invoke-virtual {v3}, Ljava/util/HashSet;->size()I

    .line 310
    .line 311
    .line 312
    move-result v3

    .line 313
    if-lez v3, :cond_d

    .line 314
    .line 315
    if-nez v17, :cond_d

    .line 316
    .line 317
    const/4 v3, 0x1

    .line 318
    if-ne v11, v3, :cond_c

    .line 319
    .line 320
    add-int v3, v12, v6

    .line 321
    .line 322
    goto :goto_d

    .line 323
    :cond_c
    sub-int v3, v12, v7

    .line 324
    .line 325
    goto :goto_d

    .line 326
    :cond_d
    move v3, v12

    .line 327
    goto :goto_d

    .line 328
    :cond_e
    const/4 v3, 0x0

    .line 329
    :goto_d
    invoke-static {v15, v3}, Ljava/lang/Math;->max(II)I

    .line 330
    .line 331
    .line 332
    move-result v3

    .line 333
    invoke-static {v4, v3}, Ljava/lang/Math;->max(II)I

    .line 334
    .line 335
    .line 336
    move-result v3

    .line 337
    add-int/2addr v10, v3

    .line 338
    add-int/2addr v14, v13

    .line 339
    const/4 v3, -0x1

    .line 340
    if-ne v11, v3, :cond_f

    .line 341
    .line 342
    move/from16 v18, v14

    .line 343
    .line 344
    move v14, v13

    .line 345
    move/from16 v13, v18

    .line 346
    .line 347
    :cond_f
    if-eqz v2, :cond_10

    .line 348
    .line 349
    invoke-static {v0, v1, v13}, Landroidx/constraintlayout/solver/widgets/h;->e(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;II)V

    .line 350
    .line 351
    .line 352
    invoke-virtual {v0, v13, v14, v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->Z(III)V

    .line 353
    .line 354
    .line 355
    goto :goto_e

    .line 356
    :cond_10
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r:Landroidx/constraintlayout/solver/widgets/f;

    .line 357
    .line 358
    invoke-virtual {v2, v0, v1}, Landroidx/constraintlayout/solver/widgets/f;->a(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;I)V

    .line 359
    .line 360
    .line 361
    invoke-virtual {v0, v13, v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->q0(II)V

    .line 362
    .line 363
    .line 364
    :goto_e
    invoke-virtual/range {p0 .. p1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->o(I)Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 365
    .line 366
    .line 367
    move-result-object v2

    .line 368
    sget-object v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 369
    .line 370
    if-ne v2, v3, :cond_11

    .line 371
    .line 372
    iget v2, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->I:F

    .line 373
    .line 374
    const/4 v3, 0x0

    .line 375
    cmpl-float v2, v2, v3

    .line 376
    .line 377
    if-eqz v2, :cond_11

    .line 378
    .line 379
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r:Landroidx/constraintlayout/solver/widgets/f;

    .line 380
    .line 381
    invoke-virtual {v2, v0, v1}, Landroidx/constraintlayout/solver/widgets/f;->a(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;I)V

    .line 382
    .line 383
    .line 384
    :cond_11
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 385
    .line 386
    aget-object v3, v2, v8

    .line 387
    .line 388
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 389
    .line 390
    if-eqz v3, :cond_12

    .line 391
    .line 392
    aget-object v2, v2, v9

    .line 393
    .line 394
    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 395
    .line 396
    if-eqz v2, :cond_12

    .line 397
    .line 398
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u()Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 399
    .line 400
    .line 401
    move-result-object v2

    .line 402
    iget-object v3, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 403
    .line 404
    aget-object v4, v3, v8

    .line 405
    .line 406
    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 407
    .line 408
    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->b:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 409
    .line 410
    if-ne v4, v2, :cond_12

    .line 411
    .line 412
    aget-object v3, v3, v9

    .line 413
    .line 414
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 415
    .line 416
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->b:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 417
    .line 418
    if-ne v3, v2, :cond_12

    .line 419
    .line 420
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r:Landroidx/constraintlayout/solver/widgets/f;

    .line 421
    .line 422
    invoke-virtual {v2, v0, v1}, Landroidx/constraintlayout/solver/widgets/f;->a(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;I)V

    .line 423
    .line 424
    .line 425
    :cond_12
    return v10
.end method

.method public static e(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;I)I
    .locals 4

    .line 1
    mul-int/lit8 v0, p1, 0x2

    .line 2
    .line 3
    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 4
    .line 5
    aget-object v2, v1, v0

    .line 6
    .line 7
    add-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    aget-object v0, v1, v0

    .line 10
    .line 11
    iget-object v1, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 12
    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    iget-object v1, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->b:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 16
    .line 17
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->F:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 18
    .line 19
    if-ne v1, v3, :cond_1

    .line 20
    .line 21
    iget-object v1, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    iget-object v1, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->b:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 26
    .line 27
    if-ne v1, v3, :cond_1

    .line 28
    .line 29
    invoke-virtual {v3, p1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->t(I)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-nez p1, :cond_0

    .line 34
    .line 35
    iget v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->Z:F

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    iget v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->a0:F

    .line 39
    .line 40
    :goto_0
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->t(I)I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    sub-int/2addr v1, p1

    .line 49
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    sub-int/2addr v1, p1

    .line 54
    sub-int/2addr v1, p0

    .line 55
    int-to-float p0, v1

    .line 56
    mul-float/2addr p0, v3

    .line 57
    float-to-int p0, p0

    .line 58
    return p0

    .line 59
    :cond_1
    const/4 p0, 0x0

    .line 60
    return p0
.end method

.method public static f(Landroidx/constraintlayout/solver/widgets/e;Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/f;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p2, Landroidx/constraintlayout/solver/widgets/f;->d:Z

    .line 3
    .line 4
    iput-boolean v0, p0, Landroidx/constraintlayout/solver/widgets/e;->O0:Z

    .line 5
    .line 6
    iput-boolean v0, p1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->i0:Z

    .line 7
    .line 8
    return-void
.end method

.method public static g(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->s()Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 6
    .line 7
    if-ne v0, v1, :cond_1

    .line 8
    .line 9
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->J:I

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    int-to-float v0, v0

    .line 18
    iget v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->I:F

    .line 19
    .line 20
    mul-float/2addr v0, v1

    .line 21
    :goto_0
    float-to-int v0, v0

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    int-to-float v0, v0

    .line 28
    iget v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->I:F

    .line 29
    .line 30
    div-float/2addr v0, v1

    .line 31
    goto :goto_0

    .line 32
    :goto_1
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y0(I)V

    .line 33
    .line 34
    .line 35
    return v0

    .line 36
    :cond_1
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->B()Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    if-ne v0, v1, :cond_3

    .line 41
    .line 42
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->J:I

    .line 43
    .line 44
    const/4 v1, 0x1

    .line 45
    if-ne v0, v1, :cond_2

    .line 46
    .line 47
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D()I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    int-to-float v0, v0

    .line 52
    iget v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->I:F

    .line 53
    .line 54
    mul-float/2addr v0, v1

    .line 55
    :goto_2
    float-to-int v0, v0

    .line 56
    goto :goto_3

    .line 57
    :cond_2
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    int-to-float v0, v0

    .line 62
    iget v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->I:F

    .line 63
    .line 64
    div-float/2addr v0, v1

    .line 65
    goto :goto_2

    .line 66
    :goto_3
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->b0(I)V

    .line 67
    .line 68
    .line 69
    return v0

    .line 70
    :cond_3
    const/4 p0, -0x1

    .line 71
    return p0
.end method

.method public static h(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object v2, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 10
    .line 11
    if-eq v2, p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0, v0}, Ll/s3d0;->a(Ll/s3d0;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public static i(Ljava/util/List;II)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/constraintlayout/solver/widgets/f;",
            ">;II)V"
        }
    .end annotation

    .line 1
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    :goto_0
    if-ge v1, v0, :cond_2

    .line 7
    .line 8
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    check-cast v2, Landroidx/constraintlayout/solver/widgets/f;

    .line 13
    .line 14
    invoke-virtual {v2, p1}, Landroidx/constraintlayout/solver/widgets/f;->c(I)Ljava/util/Set;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    :cond_0
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    if-eqz v3, :cond_1

    .line 27
    .line 28
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    check-cast v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 33
    .line 34
    iget-boolean v4, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->i0:Z

    .line 35
    .line 36
    if-eqz v4, :cond_0

    .line 37
    .line 38
    invoke-static {v3, p1, p2}, Landroidx/constraintlayout/solver/widgets/a;->l(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;II)V

    .line 39
    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    return-void
.end method

.method public static j(Landroidx/constraintlayout/solver/widgets/e;)V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/e;->H0:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/e;->H0:Ljava/util/List;

    .line 7
    .line 8
    new-instance v1, Landroidx/constraintlayout/solver/widgets/f;

    .line 9
    .line 10
    iget-object p0, p0, Ll/jfq0;->v0:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Landroidx/constraintlayout/solver/widgets/f;-><init>(Ljava/util/List;)V

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    invoke-interface {v0, p0, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static k(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/f;Ljava/util/List;Z)Z
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/constraintlayout/solver/widgets/ConstraintWidget;",
            "Landroidx/constraintlayout/solver/widgets/f;",
            "Ljava/util/List<",
            "Landroidx/constraintlayout/solver/widgets/f;",
            ">;Z)Z"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    iput-boolean v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->j0:Z

    .line 7
    .line 8
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u()Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    check-cast v2, Landroidx/constraintlayout/solver/widgets/e;

    .line 13
    .line 14
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r:Landroidx/constraintlayout/solver/widgets/f;

    .line 15
    .line 16
    if-nez v3, :cond_1e

    .line 17
    .line 18
    iput-boolean v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->i0:Z

    .line 19
    .line 20
    iget-object v3, p1, Landroidx/constraintlayout/solver/widgets/f;->a:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    iput-object p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r:Landroidx/constraintlayout/solver/widgets/f;

    .line 26
    .line 27
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 28
    .line 29
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 30
    .line 31
    if-nez v3, :cond_1

    .line 32
    .line 33
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 34
    .line 35
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 36
    .line 37
    if-nez v3, :cond_1

    .line 38
    .line 39
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->v:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 40
    .line 41
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 42
    .line 43
    if-nez v3, :cond_1

    .line 44
    .line 45
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 46
    .line 47
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 48
    .line 49
    if-nez v3, :cond_1

    .line 50
    .line 51
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 52
    .line 53
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 54
    .line 55
    if-nez v3, :cond_1

    .line 56
    .line 57
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->B:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 58
    .line 59
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 60
    .line 61
    if-nez v3, :cond_1

    .line 62
    .line 63
    invoke-static {v2, p0, p1}, Landroidx/constraintlayout/solver/widgets/a;->f(Landroidx/constraintlayout/solver/widgets/e;Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/f;)V

    .line 64
    .line 65
    .line 66
    if-eqz p3, :cond_1

    .line 67
    .line 68
    return v1

    .line 69
    :cond_1
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->v:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 70
    .line 71
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 72
    .line 73
    if-eqz v3, :cond_4

    .line 74
    .line 75
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 76
    .line 77
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 78
    .line 79
    if-eqz v3, :cond_4

    .line 80
    .line 81
    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->B()Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 82
    .line 83
    .line 84
    sget-object v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->FIXED:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 85
    .line 86
    if-eqz p3, :cond_2

    .line 87
    .line 88
    invoke-static {v2, p0, p1}, Landroidx/constraintlayout/solver/widgets/a;->f(Landroidx/constraintlayout/solver/widgets/e;Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/f;)V

    .line 89
    .line 90
    .line 91
    return v1

    .line 92
    :cond_2
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->v:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 93
    .line 94
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 95
    .line 96
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->b:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 97
    .line 98
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u()Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 99
    .line 100
    .line 101
    move-result-object v4

    .line 102
    if-ne v3, v4, :cond_3

    .line 103
    .line 104
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 105
    .line 106
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 107
    .line 108
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->b:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 109
    .line 110
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u()Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 111
    .line 112
    .line 113
    move-result-object v4

    .line 114
    if-eq v3, v4, :cond_4

    .line 115
    .line 116
    :cond_3
    invoke-static {v2, p0, p1}, Landroidx/constraintlayout/solver/widgets/a;->f(Landroidx/constraintlayout/solver/widgets/e;Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/f;)V

    .line 117
    .line 118
    .line 119
    :cond_4
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 120
    .line 121
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 122
    .line 123
    if-eqz v3, :cond_7

    .line 124
    .line 125
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 126
    .line 127
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 128
    .line 129
    if-eqz v3, :cond_7

    .line 130
    .line 131
    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->s()Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 132
    .line 133
    .line 134
    sget-object v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->FIXED:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 135
    .line 136
    if-eqz p3, :cond_5

    .line 137
    .line 138
    invoke-static {v2, p0, p1}, Landroidx/constraintlayout/solver/widgets/a;->f(Landroidx/constraintlayout/solver/widgets/e;Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/f;)V

    .line 139
    .line 140
    .line 141
    return v1

    .line 142
    :cond_5
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 143
    .line 144
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 145
    .line 146
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->b:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 147
    .line 148
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u()Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 149
    .line 150
    .line 151
    move-result-object v4

    .line 152
    if-ne v3, v4, :cond_6

    .line 153
    .line 154
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 155
    .line 156
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 157
    .line 158
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->b:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 159
    .line 160
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u()Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 161
    .line 162
    .line 163
    move-result-object v4

    .line 164
    if-eq v3, v4, :cond_7

    .line 165
    .line 166
    :cond_6
    invoke-static {v2, p0, p1}, Landroidx/constraintlayout/solver/widgets/a;->f(Landroidx/constraintlayout/solver/widgets/e;Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/f;)V

    .line 167
    .line 168
    .line 169
    :cond_7
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->s()Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 170
    .line 171
    .line 172
    move-result-object v3

    .line 173
    sget-object v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 174
    .line 175
    if-ne v3, v4, :cond_8

    .line 176
    .line 177
    move v3, v0

    .line 178
    goto :goto_0

    .line 179
    :cond_8
    move v3, v1

    .line 180
    :goto_0
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->B()Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 181
    .line 182
    .line 183
    move-result-object v5

    .line 184
    if-ne v5, v4, :cond_9

    .line 185
    .line 186
    move v5, v0

    .line 187
    goto :goto_1

    .line 188
    :cond_9
    move v5, v1

    .line 189
    :goto_1
    xor-int/2addr v3, v5

    .line 190
    if-eqz v3, :cond_a

    .line 191
    .line 192
    iget v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->I:F

    .line 193
    .line 194
    const/4 v5, 0x0

    .line 195
    cmpl-float v3, v3, v5

    .line 196
    .line 197
    if-eqz v3, :cond_a

    .line 198
    .line 199
    invoke-static {p0}, Landroidx/constraintlayout/solver/widgets/a;->g(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;)I

    .line 200
    .line 201
    .line 202
    goto :goto_2

    .line 203
    :cond_a
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->s()Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 204
    .line 205
    .line 206
    move-result-object v3

    .line 207
    if-eq v3, v4, :cond_b

    .line 208
    .line 209
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->B()Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 210
    .line 211
    .line 212
    move-result-object v3

    .line 213
    if-ne v3, v4, :cond_c

    .line 214
    .line 215
    :cond_b
    invoke-static {v2, p0, p1}, Landroidx/constraintlayout/solver/widgets/a;->f(Landroidx/constraintlayout/solver/widgets/e;Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/f;)V

    .line 216
    .line 217
    .line 218
    if-eqz p3, :cond_c

    .line 219
    .line 220
    return v1

    .line 221
    :cond_c
    :goto_2
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 222
    .line 223
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 224
    .line 225
    if-nez v3, :cond_d

    .line 226
    .line 227
    iget-object v4, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 228
    .line 229
    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 230
    .line 231
    if-eqz v4, :cond_10

    .line 232
    .line 233
    :cond_d
    if-eqz v3, :cond_e

    .line 234
    .line 235
    iget-object v4, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->b:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 236
    .line 237
    iget-object v5, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->F:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 238
    .line 239
    if-ne v4, v5, :cond_e

    .line 240
    .line 241
    iget-object v4, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 242
    .line 243
    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 244
    .line 245
    if-eqz v4, :cond_10

    .line 246
    .line 247
    :cond_e
    iget-object v4, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 248
    .line 249
    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 250
    .line 251
    if-eqz v4, :cond_f

    .line 252
    .line 253
    iget-object v5, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->b:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 254
    .line 255
    iget-object v6, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->F:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 256
    .line 257
    if-ne v5, v6, :cond_f

    .line 258
    .line 259
    if-eqz v3, :cond_10

    .line 260
    .line 261
    :cond_f
    if-eqz v3, :cond_11

    .line 262
    .line 263
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->b:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 264
    .line 265
    iget-object v5, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->F:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 266
    .line 267
    if-ne v3, v5, :cond_11

    .line 268
    .line 269
    if-eqz v4, :cond_11

    .line 270
    .line 271
    iget-object v3, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->b:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 272
    .line 273
    if-ne v3, v5, :cond_11

    .line 274
    .line 275
    :cond_10
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->B:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 276
    .line 277
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 278
    .line 279
    if-nez v3, :cond_11

    .line 280
    .line 281
    instance-of v3, p0, Landroidx/constraintlayout/solver/widgets/g;

    .line 282
    .line 283
    if-nez v3, :cond_11

    .line 284
    .line 285
    instance-of v3, p0, Ll/t1l;

    .line 286
    .line 287
    if-nez v3, :cond_11

    .line 288
    .line 289
    iget-object v3, p1, Landroidx/constraintlayout/solver/widgets/f;->f:Ljava/util/List;

    .line 290
    .line 291
    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 292
    .line 293
    .line 294
    :cond_11
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->v:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 295
    .line 296
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 297
    .line 298
    if-nez v3, :cond_12

    .line 299
    .line 300
    iget-object v4, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 301
    .line 302
    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 303
    .line 304
    if-eqz v4, :cond_15

    .line 305
    .line 306
    :cond_12
    if-eqz v3, :cond_13

    .line 307
    .line 308
    iget-object v4, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->b:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 309
    .line 310
    iget-object v5, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->F:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 311
    .line 312
    if-ne v4, v5, :cond_13

    .line 313
    .line 314
    iget-object v4, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 315
    .line 316
    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 317
    .line 318
    if-eqz v4, :cond_15

    .line 319
    .line 320
    :cond_13
    iget-object v4, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 321
    .line 322
    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 323
    .line 324
    if-eqz v4, :cond_14

    .line 325
    .line 326
    iget-object v5, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->b:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 327
    .line 328
    iget-object v6, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->F:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 329
    .line 330
    if-ne v5, v6, :cond_14

    .line 331
    .line 332
    if-eqz v3, :cond_15

    .line 333
    .line 334
    :cond_14
    if-eqz v3, :cond_16

    .line 335
    .line 336
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->b:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 337
    .line 338
    iget-object v5, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->F:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 339
    .line 340
    if-ne v3, v5, :cond_16

    .line 341
    .line 342
    if-eqz v4, :cond_16

    .line 343
    .line 344
    iget-object v3, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->b:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 345
    .line 346
    if-ne v3, v5, :cond_16

    .line 347
    .line 348
    :cond_15
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->B:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 349
    .line 350
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 351
    .line 352
    if-nez v3, :cond_16

    .line 353
    .line 354
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 355
    .line 356
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 357
    .line 358
    if-nez v3, :cond_16

    .line 359
    .line 360
    instance-of v3, p0, Landroidx/constraintlayout/solver/widgets/g;

    .line 361
    .line 362
    if-nez v3, :cond_16

    .line 363
    .line 364
    instance-of v3, p0, Ll/t1l;

    .line 365
    .line 366
    if-nez v3, :cond_16

    .line 367
    .line 368
    iget-object v3, p1, Landroidx/constraintlayout/solver/widgets/f;->g:Ljava/util/List;

    .line 369
    .line 370
    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 371
    .line 372
    .line 373
    :cond_16
    instance-of v3, p0, Ll/t1l;

    .line 374
    .line 375
    if-eqz v3, :cond_19

    .line 376
    .line 377
    invoke-static {v2, p0, p1}, Landroidx/constraintlayout/solver/widgets/a;->f(Landroidx/constraintlayout/solver/widgets/e;Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/f;)V

    .line 378
    .line 379
    .line 380
    if-eqz p3, :cond_17

    .line 381
    .line 382
    return v1

    .line 383
    :cond_17
    move-object v3, p0

    .line 384
    check-cast v3, Ll/t1l;

    .line 385
    .line 386
    move v4, v1

    .line 387
    :goto_3
    iget v5, v3, Ll/t1l;->w0:I

    .line 388
    .line 389
    if-ge v4, v5, :cond_19

    .line 390
    .line 391
    iget-object v5, v3, Ll/t1l;->v0:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 392
    .line 393
    aget-object v5, v5, v4

    .line 394
    .line 395
    invoke-static {v5, p1, p2, p3}, Landroidx/constraintlayout/solver/widgets/a;->k(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/f;Ljava/util/List;Z)Z

    .line 396
    .line 397
    .line 398
    move-result v5

    .line 399
    if-nez v5, :cond_18

    .line 400
    .line 401
    return v1

    .line 402
    :cond_18
    add-int/lit8 v4, v4, 0x1

    .line 403
    .line 404
    goto :goto_3

    .line 405
    :cond_19
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 406
    .line 407
    array-length v3, v3

    .line 408
    move v4, v1

    .line 409
    :goto_4
    if-ge v4, v3, :cond_1d

    .line 410
    .line 411
    iget-object v5, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 412
    .line 413
    aget-object v5, v5, v4

    .line 414
    .line 415
    iget-object v6, v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 416
    .line 417
    if-eqz v6, :cond_1c

    .line 418
    .line 419
    iget-object v6, v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->b:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 420
    .line 421
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u()Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 422
    .line 423
    .line 424
    move-result-object v7

    .line 425
    if-eq v6, v7, :cond_1c

    .line 426
    .line 427
    iget-object v6, v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->c:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 428
    .line 429
    sget-object v7, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->CENTER:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 430
    .line 431
    if-ne v6, v7, :cond_1a

    .line 432
    .line 433
    invoke-static {v2, p0, p1}, Landroidx/constraintlayout/solver/widgets/a;->f(Landroidx/constraintlayout/solver/widgets/e;Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/f;)V

    .line 434
    .line 435
    .line 436
    if-eqz p3, :cond_1b

    .line 437
    .line 438
    return v1

    .line 439
    :cond_1a
    invoke-static {v5}, Landroidx/constraintlayout/solver/widgets/a;->h(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;)V

    .line 440
    .line 441
    .line 442
    :cond_1b
    iget-object v5, v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 443
    .line 444
    iget-object v5, v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->b:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 445
    .line 446
    invoke-static {v5, p1, p2, p3}, Landroidx/constraintlayout/solver/widgets/a;->k(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/f;Ljava/util/List;Z)Z

    .line 447
    .line 448
    .line 449
    move-result v5

    .line 450
    if-nez v5, :cond_1c

    .line 451
    .line 452
    return v1

    .line 453
    :cond_1c
    add-int/lit8 v4, v4, 0x1

    .line 454
    .line 455
    goto :goto_4

    .line 456
    :cond_1d
    return v0

    .line 457
    :cond_1e
    if-eq v3, p1, :cond_20

    .line 458
    .line 459
    iget-object p3, p1, Landroidx/constraintlayout/solver/widgets/f;->a:Ljava/util/List;

    .line 460
    .line 461
    iget-object v2, v3, Landroidx/constraintlayout/solver/widgets/f;->a:Ljava/util/List;

    .line 462
    .line 463
    invoke-interface {p3, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 464
    .line 465
    .line 466
    iget-object p3, p1, Landroidx/constraintlayout/solver/widgets/f;->f:Ljava/util/List;

    .line 467
    .line 468
    iget-object v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r:Landroidx/constraintlayout/solver/widgets/f;

    .line 469
    .line 470
    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/f;->f:Ljava/util/List;

    .line 471
    .line 472
    invoke-interface {p3, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 473
    .line 474
    .line 475
    iget-object p3, p1, Landroidx/constraintlayout/solver/widgets/f;->g:Ljava/util/List;

    .line 476
    .line 477
    iget-object v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r:Landroidx/constraintlayout/solver/widgets/f;

    .line 478
    .line 479
    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/f;->g:Ljava/util/List;

    .line 480
    .line 481
    invoke-interface {p3, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 482
    .line 483
    .line 484
    iget-object p3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r:Landroidx/constraintlayout/solver/widgets/f;

    .line 485
    .line 486
    iget-boolean v2, p3, Landroidx/constraintlayout/solver/widgets/f;->d:Z

    .line 487
    .line 488
    if-nez v2, :cond_1f

    .line 489
    .line 490
    iput-boolean v1, p1, Landroidx/constraintlayout/solver/widgets/f;->d:Z

    .line 491
    .line 492
    :cond_1f
    invoke-interface {p2, p3}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 493
    .line 494
    .line 495
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r:Landroidx/constraintlayout/solver/widgets/f;

    .line 496
    .line 497
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/f;->a:Ljava/util/List;

    .line 498
    .line 499
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 500
    .line 501
    .line 502
    move-result-object p0

    .line 503
    :goto_5
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 504
    .line 505
    .line 506
    move-result p2

    .line 507
    if-eqz p2, :cond_20

    .line 508
    .line 509
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 510
    .line 511
    .line 512
    move-result-object p2

    .line 513
    check-cast p2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 514
    .line 515
    iput-object p1, p2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r:Landroidx/constraintlayout/solver/widgets/f;

    .line 516
    .line 517
    goto :goto_5

    .line 518
    :cond_20
    return v0
.end method

.method public static l(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;II)V
    .locals 5

    .line 1
    mul-int/lit8 v0, p1, 0x2

    .line 2
    .line 3
    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 4
    .line 5
    aget-object v2, v1, v0

    .line 6
    .line 7
    add-int/lit8 v3, v0, 0x1

    .line 8
    .line 9
    aget-object v1, v1, v3

    .line 10
    .line 11
    iget-object v3, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 12
    .line 13
    if-eqz v3, :cond_0

    .line 14
    .line 15
    iget-object v3, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 16
    .line 17
    if-eqz v3, :cond_0

    .line 18
    .line 19
    invoke-static {p0, p1}, Landroidx/constraintlayout/solver/widgets/a;->e(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;I)I

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    add-int/2addr p2, v0

    .line 28
    invoke-static {p0, p1, p2}, Landroidx/constraintlayout/solver/widgets/h;->e(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;II)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iget v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->I:F

    .line 33
    .line 34
    const/4 v4, 0x0

    .line 35
    cmpl-float v3, v3, v4

    .line 36
    .line 37
    if-eqz v3, :cond_1

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->o(I)Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    sget-object v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 44
    .line 45
    if-ne v3, v4, :cond_1

    .line 46
    .line 47
    invoke-static {p0}, Landroidx/constraintlayout/solver/widgets/a;->g(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;)I

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 52
    .line 53
    aget-object v0, v3, v0

    .line 54
    .line 55
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iget v0, v0, Landroidx/constraintlayout/solver/widgets/i;->h:F

    .line 60
    .line 61
    float-to-int v0, v0

    .line 62
    add-int v3, v0, p2

    .line 63
    .line 64
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    iput-object v2, v4, Landroidx/constraintlayout/solver/widgets/i;->g:Landroidx/constraintlayout/solver/widgets/i;

    .line 73
    .line 74
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    int-to-float p2, p2

    .line 79
    iput p2, v2, Landroidx/constraintlayout/solver/widgets/i;->h:F

    .line 80
    .line 81
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    const/4 v1, 0x1

    .line 86
    iput v1, p2, Ll/s3d0;->b:I

    .line 87
    .line 88
    invoke-virtual {p0, v0, v3, p1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->Z(III)V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_1
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->v(I)I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    sub-int/2addr p2, v0

    .line 97
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->t(I)I

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    sub-int v0, p2, v0

    .line 102
    .line 103
    invoke-virtual {p0, v0, p2, p1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->Z(III)V

    .line 104
    .line 105
    .line 106
    invoke-static {p0, p1, v0}, Landroidx/constraintlayout/solver/widgets/h;->e(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;II)V

    .line 107
    .line 108
    .line 109
    return-void
.end method
