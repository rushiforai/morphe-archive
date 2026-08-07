.class public Landroidx/constraintlayout/solver/widgets/d;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

.field public b:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

.field public c:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

.field public d:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

.field public e:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

.field public f:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

.field public g:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

.field public h:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/constraintlayout/solver/widgets/ConstraintWidget;",
            ">;"
        }
    .end annotation
.end field

.field public i:I

.field public j:I

.field public k:F

.field public l:I

.field public m:Z

.field public n:Z

.field public o:Z

.field public p:Z

.field public q:Z


# direct methods
.method public constructor <init>(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;IZ)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/d;->k:F

    .line 6
    .line 7
    iput-object p1, p0, Landroidx/constraintlayout/solver/widgets/d;->a:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 8
    .line 9
    iput p2, p0, Landroidx/constraintlayout/solver/widgets/d;->l:I

    .line 10
    .line 11
    iput-boolean p3, p0, Landroidx/constraintlayout/solver/widgets/d;->m:Z

    .line 12
    .line 13
    return-void
.end method

.method public static c(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;I)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0x8

    .line 6
    .line 7
    if-eq v0, v1, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 10
    .line 11
    aget-object v0, v0, p1

    .line 12
    .line 13
    sget-object v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 14
    .line 15
    if-ne v0, v1, :cond_1

    .line 16
    .line 17
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->g:[I

    .line 18
    .line 19
    aget p0, p0, p1

    .line 20
    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 p1, 0x3

    .line 24
    if-ne p0, p1, :cond_1

    .line 25
    .line 26
    :cond_0
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :cond_1
    const/4 p0, 0x0

    .line 29
    return p0
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Landroidx/constraintlayout/solver/widgets/d;->q:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/d;->b()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Landroidx/constraintlayout/solver/widgets/d;->q:Z

    .line 10
    .line 11
    return-void
.end method

.method public final b()V
    .locals 12

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/d;->l:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    mul-int/2addr v0, v1

    .line 5
    iget-object v2, p0, Landroidx/constraintlayout/solver/widgets/d;->a:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    move-object v4, v2

    .line 9
    move v5, v3

    .line 10
    :goto_0
    const/4 v6, 0x1

    .line 11
    if-nez v5, :cond_d

    .line 12
    .line 13
    iget v7, p0, Landroidx/constraintlayout/solver/widgets/d;->i:I

    .line 14
    .line 15
    add-int/2addr v7, v6

    .line 16
    iput v7, p0, Landroidx/constraintlayout/solver/widgets/d;->i:I

    .line 17
    .line 18
    iget-object v7, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r0:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 19
    .line 20
    iget v8, p0, Landroidx/constraintlayout/solver/widgets/d;->l:I

    .line 21
    .line 22
    const/4 v9, 0x0

    .line 23
    aput-object v9, v7, v8

    .line 24
    .line 25
    iget-object v7, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->q0:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 26
    .line 27
    aput-object v9, v7, v8

    .line 28
    .line 29
    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C()I

    .line 30
    .line 31
    .line 32
    move-result v7

    .line 33
    const/16 v8, 0x8

    .line 34
    .line 35
    if-eq v7, v8, :cond_8

    .line 36
    .line 37
    iget-object v7, p0, Landroidx/constraintlayout/solver/widgets/d;->b:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 38
    .line 39
    if-nez v7, :cond_0

    .line 40
    .line 41
    iput-object v2, p0, Landroidx/constraintlayout/solver/widgets/d;->b:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 42
    .line 43
    :cond_0
    iput-object v2, p0, Landroidx/constraintlayout/solver/widgets/d;->d:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 44
    .line 45
    iget-object v7, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 46
    .line 47
    iget v8, p0, Landroidx/constraintlayout/solver/widgets/d;->l:I

    .line 48
    .line 49
    aget-object v7, v7, v8

    .line 50
    .line 51
    sget-object v10, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 52
    .line 53
    if-ne v7, v10, :cond_8

    .line 54
    .line 55
    iget-object v7, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->g:[I

    .line 56
    .line 57
    aget v7, v7, v8

    .line 58
    .line 59
    if-eqz v7, :cond_1

    .line 60
    .line 61
    const/4 v10, 0x3

    .line 62
    if-eq v7, v10, :cond_1

    .line 63
    .line 64
    if-ne v7, v1, :cond_8

    .line 65
    .line 66
    :cond_1
    iget v7, p0, Landroidx/constraintlayout/solver/widgets/d;->j:I

    .line 67
    .line 68
    add-int/2addr v7, v6

    .line 69
    iput v7, p0, Landroidx/constraintlayout/solver/widgets/d;->j:I

    .line 70
    .line 71
    iget-object v7, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->p0:[F

    .line 72
    .line 73
    aget v7, v7, v8

    .line 74
    .line 75
    const/4 v10, 0x0

    .line 76
    cmpl-float v11, v7, v10

    .line 77
    .line 78
    if-lez v11, :cond_2

    .line 79
    .line 80
    iget v11, p0, Landroidx/constraintlayout/solver/widgets/d;->k:F

    .line 81
    .line 82
    add-float/2addr v11, v7

    .line 83
    iput v11, p0, Landroidx/constraintlayout/solver/widgets/d;->k:F

    .line 84
    .line 85
    :cond_2
    invoke-static {v2, v8}, Landroidx/constraintlayout/solver/widgets/d;->c(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;I)Z

    .line 86
    .line 87
    .line 88
    move-result v8

    .line 89
    if-eqz v8, :cond_5

    .line 90
    .line 91
    cmpg-float v7, v7, v10

    .line 92
    .line 93
    if-gez v7, :cond_3

    .line 94
    .line 95
    iput-boolean v6, p0, Landroidx/constraintlayout/solver/widgets/d;->n:Z

    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_3
    iput-boolean v6, p0, Landroidx/constraintlayout/solver/widgets/d;->o:Z

    .line 99
    .line 100
    :goto_1
    iget-object v7, p0, Landroidx/constraintlayout/solver/widgets/d;->h:Ljava/util/ArrayList;

    .line 101
    .line 102
    if-nez v7, :cond_4

    .line 103
    .line 104
    new-instance v7, Ljava/util/ArrayList;

    .line 105
    .line 106
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 107
    .line 108
    .line 109
    iput-object v7, p0, Landroidx/constraintlayout/solver/widgets/d;->h:Ljava/util/ArrayList;

    .line 110
    .line 111
    :cond_4
    iget-object v7, p0, Landroidx/constraintlayout/solver/widgets/d;->h:Ljava/util/ArrayList;

    .line 112
    .line 113
    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    :cond_5
    iget-object v7, p0, Landroidx/constraintlayout/solver/widgets/d;->f:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 117
    .line 118
    if-nez v7, :cond_6

    .line 119
    .line 120
    iput-object v2, p0, Landroidx/constraintlayout/solver/widgets/d;->f:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 121
    .line 122
    :cond_6
    iget-object v7, p0, Landroidx/constraintlayout/solver/widgets/d;->g:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 123
    .line 124
    if-eqz v7, :cond_7

    .line 125
    .line 126
    iget-object v7, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->q0:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 127
    .line 128
    iget v8, p0, Landroidx/constraintlayout/solver/widgets/d;->l:I

    .line 129
    .line 130
    aput-object v2, v7, v8

    .line 131
    .line 132
    :cond_7
    iput-object v2, p0, Landroidx/constraintlayout/solver/widgets/d;->g:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 133
    .line 134
    :cond_8
    if-eq v4, v2, :cond_9

    .line 135
    .line 136
    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r0:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 137
    .line 138
    iget v7, p0, Landroidx/constraintlayout/solver/widgets/d;->l:I

    .line 139
    .line 140
    aput-object v2, v4, v7

    .line 141
    .line 142
    :cond_9
    iget-object v4, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 143
    .line 144
    add-int/lit8 v7, v0, 0x1

    .line 145
    .line 146
    aget-object v4, v4, v7

    .line 147
    .line 148
    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 149
    .line 150
    if-eqz v4, :cond_b

    .line 151
    .line 152
    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->b:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 153
    .line 154
    iget-object v7, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 155
    .line 156
    aget-object v7, v7, v0

    .line 157
    .line 158
    iget-object v7, v7, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 159
    .line 160
    if-eqz v7, :cond_b

    .line 161
    .line 162
    iget-object v7, v7, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->b:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 163
    .line 164
    if-eq v7, v2, :cond_a

    .line 165
    .line 166
    goto :goto_2

    .line 167
    :cond_a
    move-object v9, v4

    .line 168
    :cond_b
    :goto_2
    if-eqz v9, :cond_c

    .line 169
    .line 170
    goto :goto_3

    .line 171
    :cond_c
    move-object v9, v2

    .line 172
    move v5, v6

    .line 173
    :goto_3
    move-object v4, v2

    .line 174
    move-object v2, v9

    .line 175
    goto/16 :goto_0

    .line 176
    .line 177
    :cond_d
    iput-object v2, p0, Landroidx/constraintlayout/solver/widgets/d;->c:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 178
    .line 179
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/d;->l:I

    .line 180
    .line 181
    if-nez v0, :cond_e

    .line 182
    .line 183
    iget-boolean v0, p0, Landroidx/constraintlayout/solver/widgets/d;->m:Z

    .line 184
    .line 185
    if-eqz v0, :cond_e

    .line 186
    .line 187
    iput-object v2, p0, Landroidx/constraintlayout/solver/widgets/d;->e:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 188
    .line 189
    goto :goto_4

    .line 190
    :cond_e
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/d;->a:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 191
    .line 192
    iput-object v0, p0, Landroidx/constraintlayout/solver/widgets/d;->e:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 193
    .line 194
    :goto_4
    iget-boolean v0, p0, Landroidx/constraintlayout/solver/widgets/d;->o:Z

    .line 195
    .line 196
    if-eqz v0, :cond_f

    .line 197
    .line 198
    iget-boolean v0, p0, Landroidx/constraintlayout/solver/widgets/d;->n:Z

    .line 199
    .line 200
    if-eqz v0, :cond_f

    .line 201
    .line 202
    move v3, v6

    .line 203
    :cond_f
    iput-boolean v3, p0, Landroidx/constraintlayout/solver/widgets/d;->p:Z

    .line 204
    .line 205
    return-void
.end method
