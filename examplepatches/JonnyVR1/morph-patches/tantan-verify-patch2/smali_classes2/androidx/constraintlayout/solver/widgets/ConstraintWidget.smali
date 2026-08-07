.class public Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;,
        Landroidx/constraintlayout/solver/widgets/ConstraintWidget$ContentAlignment;
    }
.end annotation


# static fields
.field public static u0:F = 0.5f


# instance fields
.field public A:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

.field public B:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

.field public C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

.field public D:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;",
            ">;"
        }
    .end annotation
.end field

.field public E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

.field public F:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

.field public G:I

.field public H:I

.field public I:F

.field public J:I

.field public K:I

.field public L:I

.field public M:I

.field public N:I

.field public O:I

.field public P:I

.field public Q:I

.field public R:I

.field public S:I

.field public T:I

.field public U:I

.field public V:I

.field public W:I

.field public X:I

.field public Y:I

.field public Z:F

.field public a:I

.field public a0:F

.field public b:I

.field public b0:Ljava/lang/Object;

.field public c:Ll/r3d0;

.field public c0:I

.field public d:Ll/r3d0;

.field public d0:I

.field public e:I

.field public e0:Ljava/lang/String;

.field public f:I

.field public f0:Ljava/lang/String;

.field public g:[I

.field public g0:Z

.field public h:I

.field public h0:Z

.field public i:I

.field public i0:Z

.field public j:F

.field public j0:Z

.field public k:I

.field public k0:Z

.field public l:I

.field public l0:I

.field public m:F

.field public m0:I

.field public n:Z

.field public n0:Z

.field public o:Z

.field public o0:Z

.field public p:I

.field public p0:[F

.field public q:F

.field public q0:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

.field public r:Landroidx/constraintlayout/solver/widgets/f;

.field public r0:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

.field public s:[I

.field public s0:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

.field public t:F

.field public t0:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

.field public u:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

.field public v:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

.field public w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

.field public x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

.field public y:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

.field public z:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 13

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->a:I

    .line 6
    .line 7
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->b:I

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->e:I

    .line 11
    .line 12
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->f:I

    .line 13
    .line 14
    const/4 v2, 0x2

    .line 15
    new-array v3, v2, [I

    .line 16
    .line 17
    iput-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->g:[I

    .line 18
    .line 19
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h:I

    .line 20
    .line 21
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->i:I

    .line 22
    .line 23
    const/high16 v3, 0x3f800000    # 1.0f

    .line 24
    .line 25
    iput v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->j:F

    .line 26
    .line 27
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->k:I

    .line 28
    .line 29
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->l:I

    .line 30
    .line 31
    iput v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->m:F

    .line 32
    .line 33
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->p:I

    .line 34
    .line 35
    iput v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->q:F

    .line 36
    .line 37
    const/4 v3, 0x0

    .line 38
    iput-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r:Landroidx/constraintlayout/solver/widgets/f;

    .line 39
    .line 40
    const v4, 0x7fffffff

    .line 41
    .line 42
    .line 43
    filled-new-array {v4, v4}, [I

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    iput-object v4, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->s:[I

    .line 48
    .line 49
    const/4 v4, 0x0

    .line 50
    iput v4, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->t:F

    .line 51
    .line 52
    new-instance v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 53
    .line 54
    sget-object v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->LEFT:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 55
    .line 56
    invoke-direct {v5, p0, v6}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;-><init>(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)V

    .line 57
    .line 58
    .line 59
    iput-object v5, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 60
    .line 61
    new-instance v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 62
    .line 63
    sget-object v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->TOP:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 64
    .line 65
    invoke-direct {v5, p0, v6}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;-><init>(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)V

    .line 66
    .line 67
    .line 68
    iput-object v5, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->v:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 69
    .line 70
    new-instance v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 71
    .line 72
    sget-object v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->RIGHT:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 73
    .line 74
    invoke-direct {v5, p0, v6}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;-><init>(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)V

    .line 75
    .line 76
    .line 77
    iput-object v5, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 78
    .line 79
    new-instance v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 80
    .line 81
    sget-object v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->BOTTOM:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 82
    .line 83
    invoke-direct {v5, p0, v6}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;-><init>(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)V

    .line 84
    .line 85
    .line 86
    iput-object v5, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 87
    .line 88
    new-instance v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 89
    .line 90
    sget-object v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->BASELINE:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 91
    .line 92
    invoke-direct {v5, p0, v6}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;-><init>(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)V

    .line 93
    .line 94
    .line 95
    iput-object v5, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 96
    .line 97
    new-instance v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 98
    .line 99
    sget-object v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->CENTER_X:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 100
    .line 101
    invoke-direct {v5, p0, v6}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;-><init>(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)V

    .line 102
    .line 103
    .line 104
    iput-object v5, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->z:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 105
    .line 106
    new-instance v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 107
    .line 108
    sget-object v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->CENTER_Y:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 109
    .line 110
    invoke-direct {v5, p0, v6}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;-><init>(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)V

    .line 111
    .line 112
    .line 113
    iput-object v5, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->A:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 114
    .line 115
    new-instance v12, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 116
    .line 117
    sget-object v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->CENTER:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 118
    .line 119
    invoke-direct {v12, p0, v5}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;-><init>(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)V

    .line 120
    .line 121
    .line 122
    iput-object v12, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->B:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 123
    .line 124
    iget-object v7, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 125
    .line 126
    iget-object v8, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 127
    .line 128
    iget-object v9, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->v:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 129
    .line 130
    iget-object v10, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 131
    .line 132
    iget-object v11, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 133
    .line 134
    filled-new-array/range {v7 .. v12}, [Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 135
    .line 136
    .line 137
    move-result-object v5

    .line 138
    iput-object v5, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 139
    .line 140
    new-instance v5, Ljava/util/ArrayList;

    .line 141
    .line 142
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 143
    .line 144
    .line 145
    iput-object v5, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D:Ljava/util/ArrayList;

    .line 146
    .line 147
    sget-object v5, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->FIXED:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 148
    .line 149
    filled-new-array {v5, v5}, [Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 150
    .line 151
    .line 152
    move-result-object v5

    .line 153
    iput-object v5, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 154
    .line 155
    iput-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->F:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 156
    .line 157
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->G:I

    .line 158
    .line 159
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->H:I

    .line 160
    .line 161
    iput v4, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->I:F

    .line 162
    .line 163
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->J:I

    .line 164
    .line 165
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->K:I

    .line 166
    .line 167
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->L:I

    .line 168
    .line 169
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->M:I

    .line 170
    .line 171
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->N:I

    .line 172
    .line 173
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->O:I

    .line 174
    .line 175
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->P:I

    .line 176
    .line 177
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->Q:I

    .line 178
    .line 179
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->R:I

    .line 180
    .line 181
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->S:I

    .line 182
    .line 183
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->T:I

    .line 184
    .line 185
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->U:I

    .line 186
    .line 187
    sget v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u0:F

    .line 188
    .line 189
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->Z:F

    .line 190
    .line 191
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->a0:F

    .line 192
    .line 193
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->c0:I

    .line 194
    .line 195
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->d0:I

    .line 196
    .line 197
    iput-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->e0:Ljava/lang/String;

    .line 198
    .line 199
    iput-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->f0:Ljava/lang/String;

    .line 200
    .line 201
    iput-boolean v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->i0:Z

    .line 202
    .line 203
    iput-boolean v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->j0:Z

    .line 204
    .line 205
    iput-boolean v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->k0:Z

    .line 206
    .line 207
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->l0:I

    .line 208
    .line 209
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->m0:I

    .line 210
    .line 211
    new-array v0, v2, [F

    .line 212
    .line 213
    fill-array-data v0, :array_0

    .line 214
    .line 215
    .line 216
    iput-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->p0:[F

    .line 217
    .line 218
    filled-new-array {v3, v3}, [Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    iput-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->q0:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 223
    .line 224
    filled-new-array {v3, v3}, [Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    iput-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r0:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 229
    .line 230
    iput-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->s0:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 231
    .line 232
    iput-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->t0:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 233
    .line 234
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->a()V

    .line 235
    .line 236
    .line 237
    return-void

    .line 238
    nop

    .line 239
    :array_0
    .array-data 4
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
    .end array-data
.end method


# virtual methods
.method public A()I
    .locals 1

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->L:I

    .line 2
    .line 3
    iget p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->T:I

    .line 4
    .line 5
    add-int/2addr v0, p0

    .line 6
    return v0
.end method

.method public A0(I)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->Y:I

    .line 2
    .line 3
    return-void
.end method

.method public B()Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;
    .locals 1

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    aget-object p0, p0, v0

    .line 5
    .line 6
    return-object p0
.end method

.method public B0(I)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->X:I

    .line 2
    .line 3
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->d0:I

    .line 2
    .line 3
    return p0
.end method

.method public C0(I)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->K:I

    .line 2
    .line 3
    return-void
.end method

.method public D()I
    .locals 2

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->d0:I

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    iget p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->G:I

    .line 10
    .line 11
    return p0
.end method

.method public D0(I)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->L:I

    .line 2
    .line 3
    return-void
.end method

.method public E()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->Y:I

    .line 2
    .line 3
    return p0
.end method

.method public E0(ZZZZ)V
    .locals 5

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->p:I

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    const/4 v4, -0x1

    .line 8
    if-ne v0, v4, :cond_1

    .line 9
    .line 10
    if-eqz p3, :cond_0

    .line 11
    .line 12
    if-nez p4, :cond_0

    .line 13
    .line 14
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->p:I

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    if-nez p3, :cond_1

    .line 18
    .line 19
    if-eqz p4, :cond_1

    .line 20
    .line 21
    iput v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->p:I

    .line 22
    .line 23
    iget p3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->J:I

    .line 24
    .line 25
    if-ne p3, v4, :cond_1

    .line 26
    .line 27
    iget p3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->q:F

    .line 28
    .line 29
    div-float p3, v1, p3

    .line 30
    .line 31
    iput p3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->q:F

    .line 32
    .line 33
    :cond_1
    :goto_0
    iget p3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->p:I

    .line 34
    .line 35
    if-nez p3, :cond_3

    .line 36
    .line 37
    iget-object p3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->v:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 38
    .line 39
    invoke-virtual {p3}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->k()Z

    .line 40
    .line 41
    .line 42
    move-result p3

    .line 43
    if-eqz p3, :cond_2

    .line 44
    .line 45
    iget-object p3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 46
    .line 47
    invoke-virtual {p3}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->k()Z

    .line 48
    .line 49
    .line 50
    move-result p3

    .line 51
    if-nez p3, :cond_3

    .line 52
    .line 53
    :cond_2
    iput v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->p:I

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_3
    iget p3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->p:I

    .line 57
    .line 58
    if-ne p3, v3, :cond_5

    .line 59
    .line 60
    iget-object p3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 61
    .line 62
    invoke-virtual {p3}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->k()Z

    .line 63
    .line 64
    .line 65
    move-result p3

    .line 66
    if-eqz p3, :cond_4

    .line 67
    .line 68
    iget-object p3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 69
    .line 70
    invoke-virtual {p3}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->k()Z

    .line 71
    .line 72
    .line 73
    move-result p3

    .line 74
    if-nez p3, :cond_5

    .line 75
    .line 76
    :cond_4
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->p:I

    .line 77
    .line 78
    :cond_5
    :goto_1
    iget p3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->p:I

    .line 79
    .line 80
    if-ne p3, v4, :cond_8

    .line 81
    .line 82
    iget-object p3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->v:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 83
    .line 84
    invoke-virtual {p3}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->k()Z

    .line 85
    .line 86
    .line 87
    move-result p3

    .line 88
    if-eqz p3, :cond_6

    .line 89
    .line 90
    iget-object p3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 91
    .line 92
    invoke-virtual {p3}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->k()Z

    .line 93
    .line 94
    .line 95
    move-result p3

    .line 96
    if-eqz p3, :cond_6

    .line 97
    .line 98
    iget-object p3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 99
    .line 100
    invoke-virtual {p3}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->k()Z

    .line 101
    .line 102
    .line 103
    move-result p3

    .line 104
    if-eqz p3, :cond_6

    .line 105
    .line 106
    iget-object p3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 107
    .line 108
    invoke-virtual {p3}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->k()Z

    .line 109
    .line 110
    .line 111
    move-result p3

    .line 112
    if-nez p3, :cond_8

    .line 113
    .line 114
    :cond_6
    iget-object p3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->v:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 115
    .line 116
    invoke-virtual {p3}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->k()Z

    .line 117
    .line 118
    .line 119
    move-result p3

    .line 120
    if-eqz p3, :cond_7

    .line 121
    .line 122
    iget-object p3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 123
    .line 124
    invoke-virtual {p3}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->k()Z

    .line 125
    .line 126
    .line 127
    move-result p3

    .line 128
    if-eqz p3, :cond_7

    .line 129
    .line 130
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->p:I

    .line 131
    .line 132
    goto :goto_2

    .line 133
    :cond_7
    iget-object p3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 134
    .line 135
    invoke-virtual {p3}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->k()Z

    .line 136
    .line 137
    .line 138
    move-result p3

    .line 139
    if-eqz p3, :cond_8

    .line 140
    .line 141
    iget-object p3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 142
    .line 143
    invoke-virtual {p3}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->k()Z

    .line 144
    .line 145
    .line 146
    move-result p3

    .line 147
    if-eqz p3, :cond_8

    .line 148
    .line 149
    iget p3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->q:F

    .line 150
    .line 151
    div-float p3, v1, p3

    .line 152
    .line 153
    iput p3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->q:F

    .line 154
    .line 155
    iput v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->p:I

    .line 156
    .line 157
    :cond_8
    :goto_2
    iget p3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->p:I

    .line 158
    .line 159
    if-ne p3, v4, :cond_a

    .line 160
    .line 161
    if-eqz p1, :cond_9

    .line 162
    .line 163
    if-nez p2, :cond_9

    .line 164
    .line 165
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->p:I

    .line 166
    .line 167
    goto :goto_3

    .line 168
    :cond_9
    if-nez p1, :cond_a

    .line 169
    .line 170
    if-eqz p2, :cond_a

    .line 171
    .line 172
    iget p3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->q:F

    .line 173
    .line 174
    div-float p3, v1, p3

    .line 175
    .line 176
    iput p3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->q:F

    .line 177
    .line 178
    iput v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->p:I

    .line 179
    .line 180
    :cond_a
    :goto_3
    iget p3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->p:I

    .line 181
    .line 182
    if-ne p3, v4, :cond_c

    .line 183
    .line 184
    iget p3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h:I

    .line 185
    .line 186
    if-lez p3, :cond_b

    .line 187
    .line 188
    iget p4, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->k:I

    .line 189
    .line 190
    if-nez p4, :cond_b

    .line 191
    .line 192
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->p:I

    .line 193
    .line 194
    goto :goto_4

    .line 195
    :cond_b
    if-nez p3, :cond_c

    .line 196
    .line 197
    iget p3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->k:I

    .line 198
    .line 199
    if-lez p3, :cond_c

    .line 200
    .line 201
    iget p3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->q:F

    .line 202
    .line 203
    div-float p3, v1, p3

    .line 204
    .line 205
    iput p3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->q:F

    .line 206
    .line 207
    iput v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->p:I

    .line 208
    .line 209
    :cond_c
    :goto_4
    iget p3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->p:I

    .line 210
    .line 211
    if-ne p3, v4, :cond_d

    .line 212
    .line 213
    if-eqz p1, :cond_d

    .line 214
    .line 215
    if-eqz p2, :cond_d

    .line 216
    .line 217
    iget p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->q:F

    .line 218
    .line 219
    div-float/2addr v1, p1

    .line 220
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->q:F

    .line 221
    .line 222
    iput v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->p:I

    .line 223
    .line 224
    :cond_d
    return-void
.end method

.method public F()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->X:I

    .line 2
    .line 3
    return p0
.end method

.method public F0()V
    .locals 4

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->K:I

    .line 2
    .line 3
    iget v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->L:I

    .line 4
    .line 5
    iget v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->G:I

    .line 6
    .line 7
    add-int/2addr v2, v0

    .line 8
    iget v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->H:I

    .line 9
    .line 10
    add-int/2addr v3, v1

    .line 11
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->O:I

    .line 12
    .line 13
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->P:I

    .line 14
    .line 15
    sub-int/2addr v2, v0

    .line 16
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->Q:I

    .line 17
    .line 18
    sub-int/2addr v3, v1

    .line 19
    iput v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->R:I

    .line 20
    .line 21
    return-void
.end method

.method public G()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->K:I

    .line 2
    .line 3
    return p0
.end method

.method public G0(Landroidx/constraintlayout/solver/c;)V
    .locals 5

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroidx/constraintlayout/solver/c;->z(Ljava/lang/Object;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->v:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 8
    .line 9
    invoke-virtual {p1, v1}, Landroidx/constraintlayout/solver/c;->z(Ljava/lang/Object;)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-object v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 14
    .line 15
    invoke-virtual {p1, v2}, Landroidx/constraintlayout/solver/c;->z(Ljava/lang/Object;)I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 20
    .line 21
    invoke-virtual {p1, v3}, Landroidx/constraintlayout/solver/c;->z(Ljava/lang/Object;)I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    sub-int v3, v2, v0

    .line 26
    .line 27
    sub-int v4, p1, v1

    .line 28
    .line 29
    if-ltz v3, :cond_0

    .line 30
    .line 31
    if-ltz v4, :cond_0

    .line 32
    .line 33
    const/high16 v3, -0x80000000

    .line 34
    .line 35
    if-eq v0, v3, :cond_0

    .line 36
    .line 37
    const v4, 0x7fffffff

    .line 38
    .line 39
    .line 40
    if-eq v0, v4, :cond_0

    .line 41
    .line 42
    if-eq v1, v3, :cond_0

    .line 43
    .line 44
    if-eq v1, v4, :cond_0

    .line 45
    .line 46
    if-eq v2, v3, :cond_0

    .line 47
    .line 48
    if-eq v2, v4, :cond_0

    .line 49
    .line 50
    if-eq p1, v3, :cond_0

    .line 51
    .line 52
    if-ne p1, v4, :cond_1

    .line 53
    .line 54
    :cond_0
    const/4 v0, 0x0

    .line 55
    move p1, v0

    .line 56
    move v1, p1

    .line 57
    move v2, v1

    .line 58
    :cond_1
    invoke-virtual {p0, v0, v1, v2, p1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->a0(IIII)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public H()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->L:I

    .line 2
    .line 3
    return p0
.end method

.method public H0()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    const/4 v1, 0x6

    .line 3
    if-ge v0, v1, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 6
    .line 7
    aget-object v1, v1, v0

    .line 8
    .line 9
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/i;->q()V

    .line 14
    .line 15
    .line 16
    add-int/lit8 v0, v0, 0x1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    return-void
.end method

.method public I()Z
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->U:I

    .line 2
    .line 3
    if-lez p0, :cond_0

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

.method public J(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;II)V
    .locals 7

    .line 1
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p2, p3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget-object v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Strength;->STRONG:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Strength;

    .line 10
    .line 11
    const/4 v5, 0x0

    .line 12
    const/4 v6, 0x1

    .line 13
    move v2, p4

    .line 14
    move v3, p5

    .line 15
    invoke-virtual/range {v0 .. v6}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->a(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;IILandroidx/constraintlayout/solver/widgets/ConstraintAnchor$Strength;IZ)Z

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final K(I)Z
    .locals 2

    .line 1
    mul-int/lit8 p1, p1, 0x2

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 4
    .line 5
    aget-object v0, p0, p1

    .line 6
    .line 7
    iget-object v1, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-object v1, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 12
    .line 13
    if-eq v1, v0, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    add-int/2addr p1, v0

    .line 17
    aget-object p0, p0, p1

    .line 18
    .line 19
    iget-object p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 20
    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    iget-object p1, p1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 24
    .line 25
    if-ne p1, p0, :cond_0

    .line 26
    .line 27
    return v0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return p0
.end method

.method public L()Z
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v0, v0, Ll/s3d0;->b:I

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    if-ne v0, v1, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget v0, v0, Ll/s3d0;->b:I

    .line 19
    .line 20
    if-ne v0, v1, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->v:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 23
    .line 24
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget v0, v0, Ll/s3d0;->b:I

    .line 29
    .line 30
    if-ne v0, v1, :cond_0

    .line 31
    .line 32
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 33
    .line 34
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    iget p0, p0, Ll/s3d0;->b:I

    .line 39
    .line 40
    if-ne p0, v1, :cond_0

    .line 41
    .line 42
    return v1

    .line 43
    :cond_0
    const/4 p0, 0x0

    .line 44
    return p0
.end method

.method public M()Z
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 2
    .line 3
    iget-object v1, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    iget-object v1, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 8
    .line 9
    if-eq v1, v0, :cond_1

    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 12
    .line 13
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 14
    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 18
    .line 19
    if-ne v0, p0, :cond_2

    .line 20
    .line 21
    :cond_1
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_2
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public N()Z
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->v:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 2
    .line 3
    iget-object v1, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    iget-object v1, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 8
    .line 9
    if-eq v1, v0, :cond_1

    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 12
    .line 13
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 14
    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 18
    .line 19
    if-ne v0, p0, :cond_2

    .line 20
    .line 21
    :cond_1
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_2
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public O()Z
    .locals 2

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->f:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->I:F

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
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->k:I

    .line 13
    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->l:I

    .line 17
    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 21
    .line 22
    const/4 v0, 0x1

    .line 23
    aget-object p0, p0, v0

    .line 24
    .line 25
    sget-object v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 26
    .line 27
    if-ne p0, v1, :cond_0

    .line 28
    .line 29
    return v0

    .line 30
    :cond_0
    const/4 p0, 0x0

    .line 31
    return p0
.end method

.method public P()Z
    .locals 3

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->e:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->I:F

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    cmpl-float v0, v0, v2

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h:I

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->i:I

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 22
    .line 23
    aget-object p0, p0, v1

    .line 24
    .line 25
    sget-object v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 26
    .line 27
    if-ne p0, v0, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_0
    return v1
.end method

.method public Q()V
    .locals 6

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->m()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->v:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->m()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->m()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->m()V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 22
    .line 23
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->m()V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->z:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 27
    .line 28
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->m()V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->A:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 32
    .line 33
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->m()V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->B:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 37
    .line 38
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->m()V

    .line 39
    .line 40
    .line 41
    const/4 v0, 0x0

    .line 42
    iput-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->F:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 43
    .line 44
    const/4 v1, 0x0

    .line 45
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->t:F

    .line 46
    .line 47
    const/4 v2, 0x0

    .line 48
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->G:I

    .line 49
    .line 50
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->H:I

    .line 51
    .line 52
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->I:F

    .line 53
    .line 54
    const/4 v1, -0x1

    .line 55
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->J:I

    .line 56
    .line 57
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->K:I

    .line 58
    .line 59
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->L:I

    .line 60
    .line 61
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->O:I

    .line 62
    .line 63
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->P:I

    .line 64
    .line 65
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->Q:I

    .line 66
    .line 67
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->R:I

    .line 68
    .line 69
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->S:I

    .line 70
    .line 71
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->T:I

    .line 72
    .line 73
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->U:I

    .line 74
    .line 75
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->V:I

    .line 76
    .line 77
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->W:I

    .line 78
    .line 79
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->X:I

    .line 80
    .line 81
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->Y:I

    .line 82
    .line 83
    sget v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u0:F

    .line 84
    .line 85
    iput v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->Z:F

    .line 86
    .line 87
    iput v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->a0:F

    .line 88
    .line 89
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 90
    .line 91
    sget-object v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->FIXED:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 92
    .line 93
    aput-object v4, v3, v2

    .line 94
    .line 95
    const/4 v5, 0x1

    .line 96
    aput-object v4, v3, v5

    .line 97
    .line 98
    iput-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->b0:Ljava/lang/Object;

    .line 99
    .line 100
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->c0:I

    .line 101
    .line 102
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->d0:I

    .line 103
    .line 104
    iput-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->f0:Ljava/lang/String;

    .line 105
    .line 106
    iput-boolean v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->g0:Z

    .line 107
    .line 108
    iput-boolean v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h0:Z

    .line 109
    .line 110
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->l0:I

    .line 111
    .line 112
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->m0:I

    .line 113
    .line 114
    iput-boolean v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->n0:Z

    .line 115
    .line 116
    iput-boolean v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->o0:Z

    .line 117
    .line 118
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->p0:[F

    .line 119
    .line 120
    const/high16 v4, -0x40800000    # -1.0f

    .line 121
    .line 122
    aput v4, v3, v2

    .line 123
    .line 124
    aput v4, v3, v5

    .line 125
    .line 126
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->a:I

    .line 127
    .line 128
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->b:I

    .line 129
    .line 130
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->s:[I

    .line 131
    .line 132
    const v4, 0x7fffffff

    .line 133
    .line 134
    .line 135
    aput v4, v3, v2

    .line 136
    .line 137
    aput v4, v3, v5

    .line 138
    .line 139
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->e:I

    .line 140
    .line 141
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->f:I

    .line 142
    .line 143
    const/high16 v3, 0x3f800000    # 1.0f

    .line 144
    .line 145
    iput v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->j:F

    .line 146
    .line 147
    iput v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->m:F

    .line 148
    .line 149
    iput v4, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->i:I

    .line 150
    .line 151
    iput v4, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->l:I

    .line 152
    .line 153
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h:I

    .line 154
    .line 155
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->k:I

    .line 156
    .line 157
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->p:I

    .line 158
    .line 159
    iput v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->q:F

    .line 160
    .line 161
    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->c:Ll/r3d0;

    .line 162
    .line 163
    if-eqz v1, :cond_0

    .line 164
    .line 165
    invoke-virtual {v1}, Ll/r3d0;->e()V

    .line 166
    .line 167
    .line 168
    :cond_0
    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->d:Ll/r3d0;

    .line 169
    .line 170
    if-eqz v1, :cond_1

    .line 171
    .line 172
    invoke-virtual {v1}, Ll/r3d0;->e()V

    .line 173
    .line 174
    .line 175
    :cond_1
    iput-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r:Landroidx/constraintlayout/solver/widgets/f;

    .line 176
    .line 177
    iput-boolean v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->i0:Z

    .line 178
    .line 179
    iput-boolean v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->j0:Z

    .line 180
    .line 181
    iput-boolean v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->k0:Z

    .line 182
    .line 183
    return-void
.end method

.method public R()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u()Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    instance-of v0, v0, Landroidx/constraintlayout/solver/widgets/e;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u()Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Landroidx/constraintlayout/solver/widgets/e;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/e;->T0()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_0
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D:Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    const/4 v1, 0x0

    .line 31
    :goto_0
    if-ge v1, v0, :cond_1

    .line 32
    .line 33
    iget-object v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D:Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    check-cast v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 40
    .line 41
    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->m()V

    .line 42
    .line 43
    .line 44
    add-int/lit8 v1, v1, 0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    :goto_1
    return-void
.end method

.method public S()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    const/4 v1, 0x6

    .line 3
    if-ge v0, v1, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 6
    .line 7
    aget-object v1, v1, v0

    .line 8
    .line 9
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/i;->e()V

    .line 14
    .line 15
    .line 16
    add-int/lit8 v0, v0, 0x1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    return-void
.end method

.method public T(Ll/wx3;)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->n(Ll/wx3;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->v:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->n(Ll/wx3;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->n(Ll/wx3;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->n(Ll/wx3;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->n(Ll/wx3;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->B:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 27
    .line 28
    invoke-virtual {v0, p1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->n(Ll/wx3;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->z:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->n(Ll/wx3;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->A:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->n(Ll/wx3;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public U()V
    .locals 0

    .line 1
    return-void
.end method

.method public V(I)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->U:I

    .line 2
    .line 3
    return-void
.end method

.method public W(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->b0:Ljava/lang/Object;

    .line 2
    .line 3
    return-void
.end method

.method public X(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->e0:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public Y(Ljava/lang/String;)V
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_8

    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    goto/16 :goto_2

    .line 11
    .line 12
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/16 v2, 0x2c

    .line 17
    .line 18
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    const/4 v3, 0x0

    .line 23
    const/4 v4, 0x1

    .line 24
    const/4 v5, -0x1

    .line 25
    if-lez v2, :cond_3

    .line 26
    .line 27
    add-int/lit8 v6, v1, -0x1

    .line 28
    .line 29
    if-ge v2, v6, :cond_3

    .line 30
    .line 31
    invoke-virtual {p1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v6

    .line 35
    const-string v7, "W"

    .line 36
    .line 37
    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result v7

    .line 41
    if-eqz v7, :cond_1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    const-string v3, "H"

    .line 45
    .line 46
    invoke-virtual {v6, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    if-eqz v3, :cond_2

    .line 51
    .line 52
    move v3, v4

    .line 53
    goto :goto_0

    .line 54
    :cond_2
    move v3, v5

    .line 55
    :goto_0
    add-int/2addr v2, v4

    .line 56
    move v5, v3

    .line 57
    move v3, v2

    .line 58
    :cond_3
    const/16 v2, 0x3a

    .line 59
    .line 60
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    if-ltz v2, :cond_5

    .line 65
    .line 66
    sub-int/2addr v1, v4

    .line 67
    if-ge v2, v1, :cond_5

    .line 68
    .line 69
    invoke-virtual {p1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    add-int/2addr v2, v4

    .line 74
    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    if-lez v2, :cond_6

    .line 83
    .line 84
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    if-lez v2, :cond_6

    .line 89
    .line 90
    :try_start_0
    invoke-static {v1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    cmpl-float v2, v1, v0

    .line 99
    .line 100
    if-lez v2, :cond_6

    .line 101
    .line 102
    cmpl-float v2, p1, v0

    .line 103
    .line 104
    if-lez v2, :cond_6

    .line 105
    .line 106
    if-ne v5, v4, :cond_4

    .line 107
    .line 108
    div-float/2addr p1, v1

    .line 109
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    goto :goto_1

    .line 114
    :cond_4
    div-float/2addr v1, p1

    .line 115
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 116
    .line 117
    .line 118
    move-result p1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 119
    goto :goto_1

    .line 120
    :cond_5
    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    if-lez v1, :cond_6

    .line 129
    .line 130
    :try_start_1
    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 131
    .line 132
    .line 133
    move-result p1
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    .line 134
    goto :goto_1

    .line 135
    :catch_0
    :cond_6
    move p1, v0

    .line 136
    :goto_1
    cmpl-float v0, p1, v0

    .line 137
    .line 138
    if-lez v0, :cond_7

    .line 139
    .line 140
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->I:F

    .line 141
    .line 142
    iput v5, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->J:I

    .line 143
    .line 144
    :cond_7
    return-void

    .line 145
    :cond_8
    :goto_2
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->I:F

    .line 146
    .line 147
    return-void
.end method

.method public Z(III)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-nez p3, :cond_0

    .line 3
    .line 4
    invoke-virtual {p0, p1, p2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->f0(II)V

    .line 5
    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    if-ne p3, v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0, p1, p2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->t0(II)V

    .line 11
    .line 12
    .line 13
    :cond_1
    :goto_0
    iput-boolean v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->j0:Z

    .line 14
    .line 15
    return-void
.end method

.method public final a()V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D:Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D:Ljava/util/ArrayList;

    .line 9
    .line 10
    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->v:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D:Ljava/util/ArrayList;

    .line 16
    .line 17
    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D:Ljava/util/ArrayList;

    .line 23
    .line 24
    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D:Ljava/util/ArrayList;

    .line 30
    .line 31
    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->z:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D:Ljava/util/ArrayList;

    .line 37
    .line 38
    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->A:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D:Ljava/util/ArrayList;

    .line 44
    .line 45
    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->B:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D:Ljava/util/ArrayList;

    .line 51
    .line 52
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 53
    .line 54
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public a0(IIII)V
    .locals 1

    .line 1
    sub-int/2addr p3, p1

    .line 2
    sub-int/2addr p4, p2

    .line 3
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->K:I

    .line 4
    .line 5
    iput p2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->L:I

    .line 6
    .line 7
    iget p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->d0:I

    .line 8
    .line 9
    const/16 p2, 0x8

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    if-ne p1, p2, :cond_0

    .line 13
    .line 14
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->G:I

    .line 15
    .line 16
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->H:I

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 20
    .line 21
    aget-object p2, p1, v0

    .line 22
    .line 23
    sget-object v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->FIXED:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 24
    .line 25
    if-ne p2, v0, :cond_1

    .line 26
    .line 27
    iget p2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->G:I

    .line 28
    .line 29
    if-ge p3, p2, :cond_1

    .line 30
    .line 31
    move p3, p2

    .line 32
    :cond_1
    const/4 p2, 0x1

    .line 33
    aget-object p1, p1, p2

    .line 34
    .line 35
    if-ne p1, v0, :cond_2

    .line 36
    .line 37
    iget p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->H:I

    .line 38
    .line 39
    if-ge p4, p1, :cond_2

    .line 40
    .line 41
    move p4, p1

    .line 42
    :cond_2
    iput p3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->G:I

    .line 43
    .line 44
    iput p4, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->H:I

    .line 45
    .line 46
    iget p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->W:I

    .line 47
    .line 48
    if-ge p4, p1, :cond_3

    .line 49
    .line 50
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->H:I

    .line 51
    .line 52
    :cond_3
    iget p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->V:I

    .line 53
    .line 54
    if-ge p3, p1, :cond_4

    .line 55
    .line 56
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->G:I

    .line 57
    .line 58
    :cond_4
    iput-boolean p2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->j0:Z

    .line 59
    .line 60
    return-void
.end method

.method public b(Landroidx/constraintlayout/solver/c;)V
    .locals 39

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 6
    .line 7
    invoke-virtual {v1, v2}, Landroidx/constraintlayout/solver/c;->r(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 8
    .line 9
    .line 10
    move-result-object v21

    .line 11
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Landroidx/constraintlayout/solver/c;->r(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    iget-object v3, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->v:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 18
    .line 19
    invoke-virtual {v1, v3}, Landroidx/constraintlayout/solver/c;->r(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    iget-object v3, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 24
    .line 25
    invoke-virtual {v1, v3}, Landroidx/constraintlayout/solver/c;->r(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    iget-object v5, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 30
    .line 31
    invoke-virtual {v1, v5}, Landroidx/constraintlayout/solver/c;->r(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    iget-object v6, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->F:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 36
    .line 37
    const/16 v7, 0x8

    .line 38
    .line 39
    const/4 v8, 0x1

    .line 40
    const/4 v9, 0x0

    .line 41
    if-eqz v6, :cond_6

    .line 42
    .line 43
    if-eqz v6, :cond_0

    .line 44
    .line 45
    iget-object v10, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 46
    .line 47
    aget-object v10, v10, v9

    .line 48
    .line 49
    sget-object v11, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->WRAP_CONTENT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 50
    .line 51
    if-ne v10, v11, :cond_0

    .line 52
    .line 53
    move v10, v8

    .line 54
    goto :goto_0

    .line 55
    :cond_0
    move v10, v9

    .line 56
    :goto_0
    if-eqz v6, :cond_1

    .line 57
    .line 58
    iget-object v6, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 59
    .line 60
    aget-object v6, v6, v8

    .line 61
    .line 62
    sget-object v11, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->WRAP_CONTENT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 63
    .line 64
    if-ne v6, v11, :cond_1

    .line 65
    .line 66
    move v6, v8

    .line 67
    goto :goto_1

    .line 68
    :cond_1
    move v6, v9

    .line 69
    :goto_1
    invoke-virtual {v0, v9}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->K(I)Z

    .line 70
    .line 71
    .line 72
    move-result v11

    .line 73
    if-eqz v11, :cond_2

    .line 74
    .line 75
    iget-object v11, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->F:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 76
    .line 77
    check-cast v11, Landroidx/constraintlayout/solver/widgets/e;

    .line 78
    .line 79
    invoke-virtual {v11, v0, v9}, Landroidx/constraintlayout/solver/widgets/e;->N0(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;I)V

    .line 80
    .line 81
    .line 82
    move v11, v8

    .line 83
    goto :goto_2

    .line 84
    :cond_2
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->M()Z

    .line 85
    .line 86
    .line 87
    move-result v11

    .line 88
    :goto_2
    invoke-virtual {v0, v8}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->K(I)Z

    .line 89
    .line 90
    .line 91
    move-result v12

    .line 92
    if-eqz v12, :cond_3

    .line 93
    .line 94
    iget-object v12, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->F:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 95
    .line 96
    check-cast v12, Landroidx/constraintlayout/solver/widgets/e;

    .line 97
    .line 98
    invoke-virtual {v12, v0, v8}, Landroidx/constraintlayout/solver/widgets/e;->N0(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;I)V

    .line 99
    .line 100
    .line 101
    move v12, v8

    .line 102
    goto :goto_3

    .line 103
    :cond_3
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->N()Z

    .line 104
    .line 105
    .line 106
    move-result v12

    .line 107
    :goto_3
    if-eqz v10, :cond_4

    .line 108
    .line 109
    iget v13, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->d0:I

    .line 110
    .line 111
    if-eq v13, v7, :cond_4

    .line 112
    .line 113
    iget-object v13, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 114
    .line 115
    iget-object v13, v13, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 116
    .line 117
    if-nez v13, :cond_4

    .line 118
    .line 119
    iget-object v13, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 120
    .line 121
    iget-object v13, v13, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 122
    .line 123
    if-nez v13, :cond_4

    .line 124
    .line 125
    iget-object v13, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->F:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 126
    .line 127
    iget-object v13, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 128
    .line 129
    invoke-virtual {v1, v13}, Landroidx/constraintlayout/solver/c;->r(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 130
    .line 131
    .line 132
    move-result-object v13

    .line 133
    invoke-virtual {v1, v13, v2, v9, v8}, Landroidx/constraintlayout/solver/c;->i(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    .line 134
    .line 135
    .line 136
    :cond_4
    if-eqz v6, :cond_5

    .line 137
    .line 138
    iget v13, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->d0:I

    .line 139
    .line 140
    if-eq v13, v7, :cond_5

    .line 141
    .line 142
    iget-object v13, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->v:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 143
    .line 144
    iget-object v13, v13, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 145
    .line 146
    if-nez v13, :cond_5

    .line 147
    .line 148
    iget-object v13, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 149
    .line 150
    iget-object v13, v13, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 151
    .line 152
    if-nez v13, :cond_5

    .line 153
    .line 154
    iget-object v13, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 155
    .line 156
    if-nez v13, :cond_5

    .line 157
    .line 158
    iget-object v13, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->F:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 159
    .line 160
    iget-object v13, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 161
    .line 162
    invoke-virtual {v1, v13}, Landroidx/constraintlayout/solver/c;->r(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 163
    .line 164
    .line 165
    move-result-object v13

    .line 166
    invoke-virtual {v1, v13, v3, v9, v8}, Landroidx/constraintlayout/solver/c;->i(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    .line 167
    .line 168
    .line 169
    :cond_5
    move v15, v11

    .line 170
    move/from16 v22, v12

    .line 171
    .line 172
    goto :goto_4

    .line 173
    :cond_6
    move v6, v9

    .line 174
    move v10, v6

    .line 175
    move v15, v10

    .line 176
    move/from16 v22, v15

    .line 177
    .line 178
    :goto_4
    iget v11, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->G:I

    .line 179
    .line 180
    iget v12, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->V:I

    .line 181
    .line 182
    if-ge v11, v12, :cond_7

    .line 183
    .line 184
    goto :goto_5

    .line 185
    :cond_7
    move v12, v11

    .line 186
    :goto_5
    iget v13, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->H:I

    .line 187
    .line 188
    iget v14, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->W:I

    .line 189
    .line 190
    if-ge v13, v14, :cond_8

    .line 191
    .line 192
    :goto_6
    move/from16 v16, v8

    .line 193
    .line 194
    goto :goto_7

    .line 195
    :cond_8
    move v14, v13

    .line 196
    goto :goto_6

    .line 197
    :goto_7
    iget-object v8, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 198
    .line 199
    move/from16 v17, v9

    .line 200
    .line 201
    aget-object v9, v8, v17

    .line 202
    .line 203
    sget-object v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 204
    .line 205
    move-object/from16 v19, v2

    .line 206
    .line 207
    if-eq v9, v7, :cond_9

    .line 208
    .line 209
    move/from16 v2, v16

    .line 210
    .line 211
    goto :goto_8

    .line 212
    :cond_9
    move/from16 v2, v17

    .line 213
    .line 214
    :goto_8
    aget-object v8, v8, v16

    .line 215
    .line 216
    move-object/from16 v20, v3

    .line 217
    .line 218
    if-eq v8, v7, :cond_a

    .line 219
    .line 220
    move/from16 v3, v16

    .line 221
    .line 222
    :goto_9
    move-object/from16 v23, v4

    .line 223
    .line 224
    goto :goto_a

    .line 225
    :cond_a
    move/from16 v3, v17

    .line 226
    .line 227
    goto :goto_9

    .line 228
    :goto_a
    iget v4, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->J:I

    .line 229
    .line 230
    iput v4, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->p:I

    .line 231
    .line 232
    move-object/from16 v24, v5

    .line 233
    .line 234
    iget v5, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->I:F

    .line 235
    .line 236
    iput v5, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->q:F

    .line 237
    .line 238
    move/from16 v25, v5

    .line 239
    .line 240
    iget v5, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->e:I

    .line 241
    .line 242
    move/from16 v26, v5

    .line 243
    .line 244
    iget v5, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->f:I

    .line 245
    .line 246
    const/16 v27, 0x0

    .line 247
    .line 248
    cmpl-float v27, v25, v27

    .line 249
    .line 250
    move/from16 v28, v5

    .line 251
    .line 252
    if-lez v27, :cond_15

    .line 253
    .line 254
    iget v5, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->d0:I

    .line 255
    .line 256
    move/from16 v29, v12

    .line 257
    .line 258
    const/16 v12, 0x8

    .line 259
    .line 260
    if-eq v5, v12, :cond_14

    .line 261
    .line 262
    const/4 v5, 0x3

    .line 263
    if-ne v9, v7, :cond_b

    .line 264
    .line 265
    if-nez v26, :cond_b

    .line 266
    .line 267
    move v12, v5

    .line 268
    goto :goto_b

    .line 269
    :cond_b
    move/from16 v12, v26

    .line 270
    .line 271
    :goto_b
    if-ne v8, v7, :cond_c

    .line 272
    .line 273
    if-nez v28, :cond_c

    .line 274
    .line 275
    move/from16 v30, v5

    .line 276
    .line 277
    goto :goto_c

    .line 278
    :cond_c
    move/from16 v30, v28

    .line 279
    .line 280
    :goto_c
    if-ne v9, v7, :cond_d

    .line 281
    .line 282
    if-ne v8, v7, :cond_d

    .line 283
    .line 284
    if-ne v12, v5, :cond_d

    .line 285
    .line 286
    move/from16 v18, v14

    .line 287
    .line 288
    move/from16 v14, v30

    .line 289
    .line 290
    if-ne v14, v5, :cond_e

    .line 291
    .line 292
    invoke-virtual {v0, v10, v6, v2, v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E0(ZZZZ)V

    .line 293
    .line 294
    .line 295
    goto :goto_f

    .line 296
    :cond_d
    move/from16 v18, v14

    .line 297
    .line 298
    move/from16 v14, v30

    .line 299
    .line 300
    :cond_e
    const/4 v2, 0x4

    .line 301
    if-ne v9, v7, :cond_10

    .line 302
    .line 303
    if-ne v12, v5, :cond_10

    .line 304
    .line 305
    move/from16 v3, v17

    .line 306
    .line 307
    iput v3, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->p:I

    .line 308
    .line 309
    int-to-float v3, v13

    .line 310
    mul-float v5, v25, v3

    .line 311
    .line 312
    float-to-int v3, v5

    .line 313
    if-eq v8, v7, :cond_f

    .line 314
    .line 315
    move v5, v2

    .line 316
    move v12, v3

    .line 317
    move/from16 v28, v14

    .line 318
    .line 319
    move/from16 v26, v18

    .line 320
    .line 321
    :goto_d
    const/16 v25, 0x0

    .line 322
    .line 323
    goto :goto_12

    .line 324
    :cond_f
    move v5, v12

    .line 325
    move/from16 v28, v14

    .line 326
    .line 327
    move/from16 v25, v16

    .line 328
    .line 329
    move/from16 v26, v18

    .line 330
    .line 331
    move v12, v3

    .line 332
    goto :goto_12

    .line 333
    :cond_10
    if-ne v8, v7, :cond_13

    .line 334
    .line 335
    if-ne v14, v5, :cond_13

    .line 336
    .line 337
    move/from16 v3, v16

    .line 338
    .line 339
    iput v3, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->p:I

    .line 340
    .line 341
    const/4 v3, -0x1

    .line 342
    if-ne v4, v3, :cond_11

    .line 343
    .line 344
    const/high16 v3, 0x3f800000    # 1.0f

    .line 345
    .line 346
    div-float v3, v3, v25

    .line 347
    .line 348
    iput v3, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->q:F

    .line 349
    .line 350
    :cond_11
    iget v3, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->q:F

    .line 351
    .line 352
    int-to-float v4, v11

    .line 353
    mul-float/2addr v3, v4

    .line 354
    float-to-int v3, v3

    .line 355
    if-eq v9, v7, :cond_12

    .line 356
    .line 357
    move/from16 v28, v2

    .line 358
    .line 359
    move/from16 v26, v3

    .line 360
    .line 361
    move v5, v12

    .line 362
    move/from16 v12, v29

    .line 363
    .line 364
    goto :goto_d

    .line 365
    :cond_12
    move/from16 v26, v3

    .line 366
    .line 367
    move v5, v12

    .line 368
    move/from16 v28, v14

    .line 369
    .line 370
    :goto_e
    move/from16 v12, v29

    .line 371
    .line 372
    const/16 v25, 0x1

    .line 373
    .line 374
    goto :goto_12

    .line 375
    :cond_13
    :goto_f
    move v5, v12

    .line 376
    move/from16 v28, v14

    .line 377
    .line 378
    move/from16 v26, v18

    .line 379
    .line 380
    goto :goto_e

    .line 381
    :cond_14
    :goto_10
    move/from16 v18, v14

    .line 382
    .line 383
    goto :goto_11

    .line 384
    :cond_15
    move/from16 v29, v12

    .line 385
    .line 386
    goto :goto_10

    .line 387
    :goto_11
    move/from16 v5, v26

    .line 388
    .line 389
    move/from16 v12, v29

    .line 390
    .line 391
    const/16 v25, 0x0

    .line 392
    .line 393
    move/from16 v26, v18

    .line 394
    .line 395
    :goto_12
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->g:[I

    .line 396
    .line 397
    const/16 v17, 0x0

    .line 398
    .line 399
    aput v5, v2, v17

    .line 400
    .line 401
    const/16 v16, 0x1

    .line 402
    .line 403
    aput v28, v2, v16

    .line 404
    .line 405
    if-eqz v25, :cond_17

    .line 406
    .line 407
    iget v2, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->p:I

    .line 408
    .line 409
    const/4 v3, -0x1

    .line 410
    if-eqz v2, :cond_16

    .line 411
    .line 412
    if-ne v2, v3, :cond_18

    .line 413
    .line 414
    :cond_16
    const/4 v14, 0x1

    .line 415
    goto :goto_13

    .line 416
    :cond_17
    const/4 v3, -0x1

    .line 417
    :cond_18
    const/4 v14, 0x0

    .line 418
    :goto_13
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 419
    .line 420
    const/16 v17, 0x0

    .line 421
    .line 422
    aget-object v2, v2, v17

    .line 423
    .line 424
    sget-object v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->WRAP_CONTENT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 425
    .line 426
    if-ne v2, v4, :cond_19

    .line 427
    .line 428
    instance-of v2, v0, Landroidx/constraintlayout/solver/widgets/e;

    .line 429
    .line 430
    if-eqz v2, :cond_19

    .line 431
    .line 432
    move v2, v6

    .line 433
    const/4 v6, 0x1

    .line 434
    goto :goto_14

    .line 435
    :cond_19
    move v2, v6

    .line 436
    const/4 v6, 0x0

    .line 437
    :goto_14
    iget-object v7, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->B:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 438
    .line 439
    invoke-virtual {v7}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->k()Z

    .line 440
    .line 441
    .line 442
    move-result v7

    .line 443
    const/16 v16, 0x1

    .line 444
    .line 445
    xor-int/lit8 v7, v7, 0x1

    .line 446
    .line 447
    iget v8, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->a:I

    .line 448
    .line 449
    const/4 v9, 0x2

    .line 450
    const/16 v27, 0x0

    .line 451
    .line 452
    if-eq v8, v9, :cond_1c

    .line 453
    .line 454
    iget-object v8, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->F:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 455
    .line 456
    if-eqz v8, :cond_1a

    .line 457
    .line 458
    iget-object v8, v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 459
    .line 460
    invoke-virtual {v1, v8}, Landroidx/constraintlayout/solver/c;->r(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 461
    .line 462
    .line 463
    move-result-object v8

    .line 464
    goto :goto_15

    .line 465
    :cond_1a
    move-object/from16 v8, v27

    .line 466
    .line 467
    :goto_15
    iget-object v11, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->F:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 468
    .line 469
    if-eqz v11, :cond_1b

    .line 470
    .line 471
    iget-object v11, v11, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 472
    .line 473
    invoke-virtual {v1, v11}, Landroidx/constraintlayout/solver/c;->r(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 474
    .line 475
    .line 476
    move-result-object v11

    .line 477
    goto :goto_16

    .line 478
    :cond_1b
    move-object/from16 v11, v27

    .line 479
    .line 480
    :goto_16
    iget-object v13, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 481
    .line 482
    const/16 v17, 0x0

    .line 483
    .line 484
    aget-object v13, v13, v17

    .line 485
    .line 486
    move-object/from16 v18, v20

    .line 487
    .line 488
    move/from16 v20, v7

    .line 489
    .line 490
    iget-object v7, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 491
    .line 492
    move-object/from16 v29, v4

    .line 493
    .line 494
    move-object v4, v8

    .line 495
    iget-object v8, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 496
    .line 497
    move/from16 v30, v9

    .line 498
    .line 499
    iget v9, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->K:I

    .line 500
    .line 501
    move/from16 v31, v3

    .line 502
    .line 503
    move-object v3, v11

    .line 504
    iget v11, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->V:I

    .line 505
    .line 506
    iget-object v1, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->s:[I

    .line 507
    .line 508
    aget v1, v1, v17

    .line 509
    .line 510
    move/from16 v32, v16

    .line 511
    .line 512
    move/from16 v16, v5

    .line 513
    .line 514
    move-object v5, v13

    .line 515
    iget v13, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->Z:F

    .line 516
    .line 517
    move/from16 v33, v1

    .line 518
    .line 519
    iget v1, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h:I

    .line 520
    .line 521
    move/from16 v34, v1

    .line 522
    .line 523
    iget v1, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->i:I

    .line 524
    .line 525
    move/from16 v35, v1

    .line 526
    .line 527
    iget v1, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->j:F

    .line 528
    .line 529
    move-object/from16 v36, v23

    .line 530
    .line 531
    move-object/from16 v37, v24

    .line 532
    .line 533
    move-object/from16 v38, v29

    .line 534
    .line 535
    move/from16 v17, v34

    .line 536
    .line 537
    move/from16 v29, v2

    .line 538
    .line 539
    move v2, v10

    .line 540
    move v10, v12

    .line 541
    move-object/from16 v24, v18

    .line 542
    .line 543
    move-object/from16 v23, v19

    .line 544
    .line 545
    move/from16 v12, v33

    .line 546
    .line 547
    move/from16 v18, v35

    .line 548
    .line 549
    move/from16 v19, v1

    .line 550
    .line 551
    move-object/from16 v1, p1

    .line 552
    .line 553
    invoke-virtual/range {v0 .. v20}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->e(Landroidx/constraintlayout/solver/c;ZLandroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;ZLandroidx/constraintlayout/solver/widgets/ConstraintAnchor;Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;IIIIFZZIIIFZ)V

    .line 554
    .line 555
    .line 556
    goto :goto_17

    .line 557
    :cond_1c
    move/from16 v29, v2

    .line 558
    .line 559
    move-object/from16 v38, v4

    .line 560
    .line 561
    move-object/from16 v36, v23

    .line 562
    .line 563
    move-object/from16 v37, v24

    .line 564
    .line 565
    move-object/from16 v23, v19

    .line 566
    .line 567
    move-object/from16 v24, v20

    .line 568
    .line 569
    move/from16 v20, v7

    .line 570
    .line 571
    :goto_17
    iget v2, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->b:I

    .line 572
    .line 573
    const/4 v3, 0x2

    .line 574
    if-ne v2, v3, :cond_1d

    .line 575
    .line 576
    goto/16 :goto_1d

    .line 577
    .line 578
    :cond_1d
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 579
    .line 580
    const/4 v3, 0x1

    .line 581
    aget-object v2, v2, v3

    .line 582
    .line 583
    move-object/from16 v4, v38

    .line 584
    .line 585
    if-ne v2, v4, :cond_1e

    .line 586
    .line 587
    instance-of v2, v0, Landroidx/constraintlayout/solver/widgets/e;

    .line 588
    .line 589
    if-eqz v2, :cond_1e

    .line 590
    .line 591
    move v6, v3

    .line 592
    goto :goto_18

    .line 593
    :cond_1e
    const/4 v6, 0x0

    .line 594
    :goto_18
    if-eqz v25, :cond_20

    .line 595
    .line 596
    iget v2, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->p:I

    .line 597
    .line 598
    if-eq v2, v3, :cond_1f

    .line 599
    .line 600
    const/4 v4, -0x1

    .line 601
    if-ne v2, v4, :cond_20

    .line 602
    .line 603
    :cond_1f
    move v14, v3

    .line 604
    goto :goto_19

    .line 605
    :cond_20
    const/4 v14, 0x0

    .line 606
    :goto_19
    iget v2, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->U:I

    .line 607
    .line 608
    if-lez v2, :cond_21

    .line 609
    .line 610
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 611
    .line 612
    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 613
    .line 614
    .line 615
    move-result-object v2

    .line 616
    iget v2, v2, Ll/s3d0;->b:I

    .line 617
    .line 618
    if-ne v2, v3, :cond_22

    .line 619
    .line 620
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 621
    .line 622
    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 623
    .line 624
    .line 625
    move-result-object v2

    .line 626
    invoke-virtual {v2, v1}, Landroidx/constraintlayout/solver/widgets/i;->g(Landroidx/constraintlayout/solver/c;)V

    .line 627
    .line 628
    .line 629
    :cond_21
    move-object/from16 v5, v36

    .line 630
    .line 631
    goto :goto_1a

    .line 632
    :cond_22
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->j()I

    .line 633
    .line 634
    .line 635
    move-result v2

    .line 636
    const/4 v4, 0x6

    .line 637
    move-object/from16 v5, v36

    .line 638
    .line 639
    move-object/from16 v7, v37

    .line 640
    .line 641
    invoke-virtual {v1, v7, v5, v2, v4}, Landroidx/constraintlayout/solver/c;->e(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/b;

    .line 642
    .line 643
    .line 644
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 645
    .line 646
    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 647
    .line 648
    if-eqz v2, :cond_23

    .line 649
    .line 650
    invoke-virtual {v1, v2}, Landroidx/constraintlayout/solver/c;->r(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 651
    .line 652
    .line 653
    move-result-object v2

    .line 654
    const/4 v8, 0x0

    .line 655
    invoke-virtual {v1, v7, v2, v8, v4}, Landroidx/constraintlayout/solver/c;->e(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/b;

    .line 656
    .line 657
    .line 658
    move/from16 v20, v8

    .line 659
    .line 660
    :cond_23
    :goto_1a
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->F:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 661
    .line 662
    if-eqz v2, :cond_24

    .line 663
    .line 664
    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 665
    .line 666
    invoke-virtual {v1, v2}, Landroidx/constraintlayout/solver/c;->r(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 667
    .line 668
    .line 669
    move-result-object v2

    .line 670
    move-object v4, v2

    .line 671
    goto :goto_1b

    .line 672
    :cond_24
    move-object/from16 v4, v27

    .line 673
    .line 674
    :goto_1b
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->F:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 675
    .line 676
    if-eqz v2, :cond_25

    .line 677
    .line 678
    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->v:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 679
    .line 680
    invoke-virtual {v1, v2}, Landroidx/constraintlayout/solver/c;->r(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 681
    .line 682
    .line 683
    move-result-object v27

    .line 684
    :cond_25
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 685
    .line 686
    aget-object v2, v2, v3

    .line 687
    .line 688
    iget-object v7, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->v:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 689
    .line 690
    iget-object v8, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 691
    .line 692
    iget v9, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->L:I

    .line 693
    .line 694
    iget v11, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->W:I

    .line 695
    .line 696
    iget-object v10, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->s:[I

    .line 697
    .line 698
    aget v12, v10, v3

    .line 699
    .line 700
    iget v13, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->a0:F

    .line 701
    .line 702
    iget v10, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->k:I

    .line 703
    .line 704
    iget v15, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->l:I

    .line 705
    .line 706
    iget v3, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->m:F

    .line 707
    .line 708
    move/from16 v19, v3

    .line 709
    .line 710
    move-object/from16 v36, v5

    .line 711
    .line 712
    move/from16 v17, v10

    .line 713
    .line 714
    move/from16 v18, v15

    .line 715
    .line 716
    move/from16 v15, v22

    .line 717
    .line 718
    move/from16 v10, v26

    .line 719
    .line 720
    move-object/from16 v3, v27

    .line 721
    .line 722
    move/from16 v16, v28

    .line 723
    .line 724
    move-object v5, v2

    .line 725
    move/from16 v2, v29

    .line 726
    .line 727
    invoke-virtual/range {v0 .. v20}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->e(Landroidx/constraintlayout/solver/c;ZLandroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;ZLandroidx/constraintlayout/solver/widgets/ConstraintAnchor;Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;IIIIFZZIIIFZ)V

    .line 728
    .line 729
    .line 730
    move-object v7, v0

    .line 731
    if-eqz v25, :cond_26

    .line 732
    .line 733
    iget v0, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->p:I

    .line 734
    .line 735
    iget v5, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->q:F

    .line 736
    .line 737
    const/4 v6, 0x6

    .line 738
    const/4 v3, 0x1

    .line 739
    if-ne v0, v3, :cond_27

    .line 740
    .line 741
    move-object/from16 v0, p1

    .line 742
    .line 743
    move-object/from16 v4, v21

    .line 744
    .line 745
    move-object/from16 v3, v23

    .line 746
    .line 747
    move-object/from16 v1, v24

    .line 748
    .line 749
    move-object/from16 v2, v36

    .line 750
    .line 751
    invoke-virtual/range {v0 .. v6}, Landroidx/constraintlayout/solver/c;->l(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;FI)V

    .line 752
    .line 753
    .line 754
    :cond_26
    move-object/from16 v1, p1

    .line 755
    .line 756
    goto :goto_1c

    .line 757
    :cond_27
    move-object/from16 v0, p1

    .line 758
    .line 759
    move-object/from16 v2, v21

    .line 760
    .line 761
    move-object/from16 v1, v23

    .line 762
    .line 763
    move-object/from16 v3, v24

    .line 764
    .line 765
    move-object/from16 v4, v36

    .line 766
    .line 767
    invoke-virtual/range {v0 .. v6}, Landroidx/constraintlayout/solver/c;->l(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;FI)V

    .line 768
    .line 769
    .line 770
    move-object v1, v0

    .line 771
    :goto_1c
    iget-object v0, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->B:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 772
    .line 773
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->k()Z

    .line 774
    .line 775
    .line 776
    move-result v0

    .line 777
    if-eqz v0, :cond_28

    .line 778
    .line 779
    iget-object v0, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->B:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 780
    .line 781
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->i()Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 782
    .line 783
    .line 784
    move-result-object v0

    .line 785
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->e()Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 786
    .line 787
    .line 788
    move-result-object v0

    .line 789
    iget v2, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->t:F

    .line 790
    .line 791
    const/high16 v3, 0x42b40000    # 90.0f

    .line 792
    .line 793
    add-float/2addr v2, v3

    .line 794
    float-to-double v2, v2

    .line 795
    invoke-static {v2, v3}, Ljava/lang/Math;->toRadians(D)D

    .line 796
    .line 797
    .line 798
    move-result-wide v2

    .line 799
    double-to-float v2, v2

    .line 800
    iget-object v3, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->B:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 801
    .line 802
    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    .line 803
    .line 804
    .line 805
    move-result v3

    .line 806
    invoke-virtual {v1, v7, v0, v2, v3}, Landroidx/constraintlayout/solver/c;->b(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/ConstraintWidget;FI)V

    .line 807
    .line 808
    .line 809
    :cond_28
    :goto_1d
    return-void
.end method

.method public b0(I)V
    .locals 1

    .line 1
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->H:I

    .line 2
    .line 3
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->W:I

    .line 4
    .line 5
    if-ge p1, v0, :cond_0

    .line 6
    .line 7
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->H:I

    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public c()Z
    .locals 1

    .line 1
    iget p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->d0:I

    .line 2
    .line 3
    const/16 v0, 0x8

    .line 4
    .line 5
    if-eq p0, v0, :cond_0

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

.method public c0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->o:Z

    .line 2
    .line 3
    return-void
.end method

.method public d(I)V
    .locals 0

    .line 1
    invoke-static {p1, p0}, Landroidx/constraintlayout/solver/widgets/h;->a(ILandroidx/constraintlayout/solver/widgets/ConstraintWidget;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d0(F)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->Z:F

    .line 2
    .line 3
    return-void
.end method

.method public final e(Landroidx/constraintlayout/solver/c;ZLandroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;ZLandroidx/constraintlayout/solver/widgets/ConstraintAnchor;Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;IIIIFZZIIIFZ)V
    .locals 21

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v9, p3

    move-object/from16 v10, p4

    move-object/from16 v11, p7

    move-object/from16 v12, p8

    move/from16 v2, p11

    move/from16 v3, p12

    .line 1
    invoke-virtual {v1, v11}, Landroidx/constraintlayout/solver/c;->r(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v5

    .line 2
    invoke-virtual {v1, v12}, Landroidx/constraintlayout/solver/c;->r(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v4

    .line 3
    invoke-virtual {v11}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->i()Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v6

    invoke-virtual {v1, v6}, Landroidx/constraintlayout/solver/c;->r(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v13

    .line 4
    invoke-virtual {v12}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->i()Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v6

    invoke-virtual {v1, v6}, Landroidx/constraintlayout/solver/c;->r(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v14

    .line 5
    iget-boolean v6, v1, Landroidx/constraintlayout/solver/c;->g:Z

    const/4 v15, 0x6

    if-eqz v6, :cond_1

    .line 6
    invoke-virtual {v11}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    move-result-object v6

    iget v6, v6, Ll/s3d0;->b:I

    const/4 v7, 0x1

    const-wide/16 v16, 0x1

    if-ne v6, v7, :cond_2

    .line 7
    invoke-virtual {v12}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    move-result-object v6

    iget v6, v6, Ll/s3d0;->b:I

    if-ne v6, v7, :cond_2

    .line 8
    invoke-static {}, Landroidx/constraintlayout/solver/c;->y()Ll/pa00;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 9
    invoke-static {}, Landroidx/constraintlayout/solver/c;->y()Ll/pa00;

    move-result-object v0

    iget-wide v2, v0, Ll/pa00;->s:J

    add-long v2, v2, v16

    iput-wide v2, v0, Ll/pa00;->s:J

    .line 10
    :cond_0
    invoke-virtual {v11}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroidx/constraintlayout/solver/widgets/i;->g(Landroidx/constraintlayout/solver/c;)V

    .line 11
    invoke-virtual {v12}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroidx/constraintlayout/solver/widgets/i;->g(Landroidx/constraintlayout/solver/c;)V

    if-nez p15, :cond_38

    if-eqz p2, :cond_38

    const/4 v0, 0x0

    .line 12
    invoke-virtual {v1, v10, v4, v0, v15}, Landroidx/constraintlayout/solver/c;->i(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    return-void

    :cond_1
    const-wide/16 v16, 0x1

    .line 13
    :cond_2
    invoke-static {}, Landroidx/constraintlayout/solver/c;->y()Ll/pa00;

    move-result-object v6

    if-eqz v6, :cond_3

    .line 14
    invoke-static {}, Landroidx/constraintlayout/solver/c;->y()Ll/pa00;

    move-result-object v6

    iget-wide v7, v6, Ll/pa00;->B:J

    add-long v7, v7, v16

    iput-wide v7, v6, Ll/pa00;->B:J

    .line 15
    :cond_3
    invoke-virtual {v11}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->k()Z

    move-result v16

    .line 16
    invoke-virtual {v12}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->k()Z

    move-result v17

    .line 17
    iget-object v6, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->B:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v6}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->k()Z

    move-result v18

    if-eqz v17, :cond_4

    add-int/lit8 v6, v16, 0x1

    goto :goto_0

    :cond_4
    move/from16 v6, v16

    :goto_0
    if-eqz v18, :cond_5

    add-int/lit8 v6, v6, 0x1

    :cond_5
    if-eqz p14, :cond_6

    const/4 v8, 0x3

    goto :goto_1

    :cond_6
    move/from16 v8, p16

    .line 18
    :goto_1
    sget-object v19, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$a;->b:[I

    invoke-virtual/range {p5 .. p5}, Ljava/lang/Enum;->ordinal()I

    move-result v20

    aget v15, v19, v20

    const/4 v7, 0x2

    const/4 v12, 0x1

    if-eq v15, v12, :cond_7

    if-eq v15, v7, :cond_7

    const/4 v12, 0x3

    if-eq v15, v12, :cond_7

    const/4 v12, 0x4

    if-eq v15, v12, :cond_8

    :cond_7
    :goto_2
    const/4 v12, 0x0

    goto :goto_3

    :cond_8
    if-ne v8, v12, :cond_9

    goto :goto_2

    :cond_9
    const/4 v12, 0x1

    .line 19
    :goto_3
    iget v15, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->d0:I

    const/16 v7, 0x8

    if-ne v15, v7, :cond_a

    const/4 v7, 0x0

    const/4 v12, 0x0

    goto :goto_4

    :cond_a
    move/from16 v7, p10

    :goto_4
    if-eqz p20, :cond_b

    if-nez v16, :cond_c

    if-nez v17, :cond_c

    if-nez v18, :cond_c

    move/from16 v15, p9

    .line 20
    invoke-virtual {v1, v5, v15}, Landroidx/constraintlayout/solver/c;->f(Landroidx/constraintlayout/solver/SolverVariable;I)V

    :cond_b
    move/from16 v20, v6

    const/4 v6, 0x6

    goto :goto_5

    :cond_c
    if-eqz v16, :cond_b

    if-nez v17, :cond_b

    .line 21
    invoke-virtual {v11}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    move-result v15

    move/from16 v20, v6

    const/4 v6, 0x6

    invoke-virtual {v1, v5, v13, v15, v6}, Landroidx/constraintlayout/solver/c;->e(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/b;

    :goto_5
    if-nez v12, :cond_10

    if-eqz p6, :cond_e

    const/4 v6, 0x0

    const/4 v15, 0x3

    .line 22
    invoke-virtual {v1, v4, v5, v6, v15}, Landroidx/constraintlayout/solver/c;->e(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/b;

    const/4 v6, 0x6

    if-lez v2, :cond_d

    .line 23
    invoke-virtual {v1, v4, v5, v2, v6}, Landroidx/constraintlayout/solver/c;->i(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    :cond_d
    const v7, 0x7fffffff

    if-ge v3, v7, :cond_f

    .line 24
    invoke-virtual {v1, v4, v5, v3, v6}, Landroidx/constraintlayout/solver/c;->k(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    goto :goto_6

    :cond_e
    const/4 v15, 0x3

    .line 25
    invoke-virtual {v1, v4, v5, v7, v6}, Landroidx/constraintlayout/solver/c;->e(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/b;

    :cond_f
    :goto_6
    move/from16 v15, p17

    move v7, v8

    move v11, v12

    move/from16 v2, v20

    const/4 v0, 0x2

    const/16 v19, 0x4

    move/from16 v12, p18

    goto/16 :goto_e

    :cond_10
    const/4 v15, 0x3

    const/4 v3, -0x2

    move/from16 v15, p17

    if-ne v15, v3, :cond_11

    move v15, v7

    :cond_11
    move/from16 v6, p18

    if-ne v6, v3, :cond_12

    move v3, v7

    goto :goto_7

    :cond_12
    move v3, v6

    :goto_7
    const/4 v6, 0x6

    if-lez v15, :cond_13

    .line 26
    invoke-virtual {v1, v4, v5, v15, v6}, Landroidx/constraintlayout/solver/c;->i(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    .line 27
    invoke-static {v7, v15}, Ljava/lang/Math;->max(II)I

    move-result v7

    :cond_13
    if-lez v3, :cond_14

    .line 28
    invoke-virtual {v1, v4, v5, v3, v6}, Landroidx/constraintlayout/solver/c;->k(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    .line 29
    invoke-static {v7, v3}, Ljava/lang/Math;->min(II)I

    move-result v7

    :cond_14
    const/4 v6, 0x1

    if-ne v8, v6, :cond_17

    if-eqz p2, :cond_15

    const/4 v6, 0x6

    .line 30
    invoke-virtual {v1, v4, v5, v7, v6}, Landroidx/constraintlayout/solver/c;->e(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/b;

    :goto_8
    move v0, v12

    move v12, v3

    move v3, v0

    move v11, v7

    move v7, v8

    move/from16 v2, v20

    const/4 v0, 0x2

    :goto_9
    const/16 v19, 0x4

    goto/16 :goto_d

    :cond_15
    if-eqz p15, :cond_16

    const/4 v6, 0x4

    .line 31
    invoke-virtual {v1, v4, v5, v7, v6}, Landroidx/constraintlayout/solver/c;->e(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/b;

    move v0, v12

    move v12, v3

    move v3, v0

    move/from16 v19, v6

    move v11, v7

    move v7, v8

    move/from16 v2, v20

    const/4 v0, 0x2

    goto/16 :goto_d

    :cond_16
    const/4 v6, 0x1

    .line 32
    invoke-virtual {v1, v4, v5, v7, v6}, Landroidx/constraintlayout/solver/c;->e(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/b;

    goto :goto_8

    :cond_17
    const/4 v6, 0x2

    if-ne v8, v6, :cond_1a

    .line 33
    invoke-virtual {v11}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j()Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    move-result-object v12

    sget-object v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->TOP:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    if-eq v12, v6, :cond_19

    invoke-virtual {v11}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j()Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    move-result-object v12

    sget-object v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->BOTTOM:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    if-ne v12, v2, :cond_18

    goto :goto_b

    .line 34
    :cond_18
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->F:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    sget-object v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->LEFT:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    invoke-virtual {v2, v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroidx/constraintlayout/solver/c;->r(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v2

    .line 35
    iget-object v6, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->F:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    sget-object v12, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->RIGHT:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    invoke-virtual {v6, v12}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v6

    invoke-virtual {v1, v6}, Landroidx/constraintlayout/solver/c;->r(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v6

    :goto_a
    move v12, v3

    goto :goto_c

    .line 36
    :cond_19
    :goto_b
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->F:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    invoke-virtual {v2, v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroidx/constraintlayout/solver/c;->r(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v2

    .line 37
    iget-object v6, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->F:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    sget-object v12, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->BOTTOM:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    invoke-virtual {v6, v12}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v6

    invoke-virtual {v1, v6}, Landroidx/constraintlayout/solver/c;->r(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v6

    goto :goto_a

    .line 38
    :goto_c
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/c;->s()Landroidx/constraintlayout/solver/b;

    move-result-object v3

    move v11, v7

    move/from16 p5, v8

    const/4 v0, 0x2

    const/16 v19, 0x4

    move/from16 v8, p19

    move-object v7, v2

    move/from16 v2, v20

    invoke-virtual/range {v3 .. v8}, Landroidx/constraintlayout/solver/b;->j(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;F)Landroidx/constraintlayout/solver/b;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroidx/constraintlayout/solver/c;->d(Landroidx/constraintlayout/solver/b;)V

    move/from16 v7, p5

    const/4 v3, 0x0

    goto :goto_d

    :cond_1a
    move v0, v12

    move v12, v3

    move v3, v0

    move v0, v6

    move v11, v7

    move v7, v8

    move/from16 v2, v20

    goto/16 :goto_9

    :goto_d
    if-eqz v3, :cond_1c

    if-eq v2, v0, :cond_1c

    if-nez p14, :cond_1c

    .line 39
    invoke-static {v15, v11}, Ljava/lang/Math;->max(II)I

    move-result v3

    if-lez v12, :cond_1b

    .line 40
    invoke-static {v12, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    :cond_1b
    const/4 v6, 0x6

    .line 41
    invoke-virtual {v1, v4, v5, v3, v6}, Landroidx/constraintlayout/solver/c;->e(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/b;

    const/4 v11, 0x0

    goto :goto_e

    :cond_1c
    move v11, v3

    :goto_e
    if-eqz p20, :cond_1d

    if-eqz p15, :cond_1e

    :cond_1d
    const/4 v3, 0x6

    const/4 v6, 0x0

    goto/16 :goto_19

    :cond_1e
    const/4 v0, 0x5

    if-nez v16, :cond_21

    if-nez v17, :cond_21

    if-nez v18, :cond_21

    if-eqz p2, :cond_20

    const/4 v6, 0x0

    .line 42
    invoke-virtual {v1, v10, v4, v6, v0}, Landroidx/constraintlayout/solver/c;->i(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    :cond_1f
    :goto_f
    const/4 v3, 0x6

    goto/16 :goto_18

    :cond_20
    const/4 v3, 0x6

    const/4 v6, 0x0

    goto/16 :goto_18

    :cond_21
    const/4 v6, 0x0

    if-eqz v16, :cond_22

    if-nez v17, :cond_22

    if-eqz p2, :cond_1f

    .line 43
    invoke-virtual {v1, v10, v4, v6, v0}, Landroidx/constraintlayout/solver/c;->i(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    goto :goto_f

    :cond_22
    if-nez v16, :cond_23

    if-eqz v17, :cond_23

    .line 44
    invoke-virtual/range {p8 .. p8}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    move-result v2

    neg-int v2, v2

    const/4 v3, 0x6

    invoke-virtual {v1, v4, v14, v2, v3}, Landroidx/constraintlayout/solver/c;->e(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/b;

    if-eqz p2, :cond_1f

    .line 45
    invoke-virtual {v1, v5, v9, v6, v0}, Landroidx/constraintlayout/solver/c;->i(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    goto :goto_f

    :cond_23
    if-eqz v16, :cond_1f

    if-eqz v17, :cond_1f

    if-eqz v11, :cond_2d

    if-eqz p2, :cond_24

    if-nez p11, :cond_24

    const/4 v3, 0x6

    .line 46
    invoke-virtual {v1, v4, v5, v6, v3}, Landroidx/constraintlayout/solver/c;->i(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    :cond_24
    if-nez v7, :cond_29

    if-gtz v12, :cond_26

    if-lez v15, :cond_25

    goto :goto_10

    :cond_25
    const/4 v2, 0x6

    const/4 v7, 0x0

    goto :goto_11

    :cond_26
    :goto_10
    move/from16 v2, v19

    const/4 v7, 0x1

    .line 47
    :goto_11
    invoke-virtual/range {p7 .. p7}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    move-result v3

    invoke-virtual {v1, v5, v13, v3, v2}, Landroidx/constraintlayout/solver/c;->e(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/b;

    .line 48
    invoke-virtual/range {p8 .. p8}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    move-result v3

    neg-int v3, v3

    invoke-virtual {v1, v4, v14, v3, v2}, Landroidx/constraintlayout/solver/c;->e(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/b;

    if-gtz v12, :cond_28

    if-lez v15, :cond_27

    goto :goto_12

    :cond_27
    const/4 v2, 0x0

    goto :goto_13

    :cond_28
    :goto_12
    const/4 v2, 0x1

    :goto_13
    move v8, v0

    move v12, v7

    const/4 v15, 0x1

    move v7, v2

    goto :goto_16

    :cond_29
    const/4 v15, 0x1

    if-ne v7, v15, :cond_2a

    move v7, v15

    move v12, v7

    const/4 v8, 0x6

    goto :goto_16

    :cond_2a
    const/4 v2, 0x3

    if-ne v7, v2, :cond_2c

    if-nez p14, :cond_2b

    move-object/from16 v2, p0

    .line 49
    iget v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->p:I

    const/4 v3, -0x1

    if-eq v2, v3, :cond_2b

    if-gtz v12, :cond_2b

    const/4 v12, 0x6

    goto :goto_14

    :cond_2b
    move/from16 v12, v19

    .line 50
    :goto_14
    invoke-virtual/range {p7 .. p7}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    move-result v2

    invoke-virtual {v1, v5, v13, v2, v12}, Landroidx/constraintlayout/solver/c;->e(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/b;

    .line 51
    invoke-virtual/range {p8 .. p8}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    move-result v2

    neg-int v2, v2

    invoke-virtual {v1, v4, v14, v2, v12}, Landroidx/constraintlayout/solver/c;->e(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/b;

    move v8, v0

    move v7, v15

    move v12, v7

    goto :goto_16

    :cond_2c
    move v8, v0

    const/4 v7, 0x0

    :goto_15
    const/4 v12, 0x0

    goto :goto_16

    :cond_2d
    const/4 v15, 0x1

    move v8, v0

    move v7, v15

    goto :goto_15

    :goto_16
    if-eqz v7, :cond_2f

    .line 52
    invoke-virtual/range {p7 .. p7}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    move-result v3

    .line 53
    invoke-virtual/range {p8 .. p8}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    move-result v7

    move-object v6, v4

    move-object v2, v13

    move/from16 v4, p13

    move v13, v0

    move-object v0, v1

    move-object v1, v5

    move-object v5, v14

    .line 54
    invoke-virtual/range {v0 .. v8}, Landroidx/constraintlayout/solver/c;->c(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;IFLandroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    move-object v3, v5

    move-object v4, v6

    move-object v5, v1

    move-object v1, v0

    move-object/from16 v0, p7

    .line 55
    iget-object v6, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v6, v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->b:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    instance-of v6, v6, Landroidx/constraintlayout/solver/widgets/b;

    move-object/from16 v7, p8

    .line 56
    iget-object v8, v7, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v8, v8, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->b:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    instance-of v8, v8, Landroidx/constraintlayout/solver/widgets/b;

    if-eqz v6, :cond_2e

    if-nez v8, :cond_2e

    move v6, v13

    move v8, v15

    const/4 v13, 0x6

    move/from16 v15, p2

    goto :goto_17

    :cond_2e
    if-nez v6, :cond_30

    if-eqz v8, :cond_30

    move/from16 v8, p2

    const/4 v6, 0x6

    goto :goto_17

    :cond_2f
    move-object/from16 v7, p8

    move-object v2, v13

    move-object v3, v14

    move v13, v0

    move-object/from16 v0, p7

    :cond_30
    move/from16 v8, p2

    move v15, v8

    move v6, v13

    :goto_17
    if-eqz v12, :cond_31

    const/4 v6, 0x6

    const/4 v13, 0x6

    :cond_31
    if-nez v11, :cond_32

    if-nez v15, :cond_33

    :cond_32
    if-eqz v12, :cond_34

    .line 57
    :cond_33
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    move-result v0

    invoke-virtual {v1, v5, v2, v0, v6}, Landroidx/constraintlayout/solver/c;->i(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    :cond_34
    if-nez v11, :cond_35

    if-nez v8, :cond_36

    :cond_35
    if-eqz v12, :cond_37

    .line 58
    :cond_36
    invoke-virtual {v7}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    move-result v0

    neg-int v0, v0

    invoke-virtual {v1, v4, v3, v0, v13}, Landroidx/constraintlayout/solver/c;->k(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    :cond_37
    if-eqz p2, :cond_20

    const/4 v3, 0x6

    const/4 v6, 0x0

    .line 59
    invoke-virtual {v1, v5, v9, v6, v3}, Landroidx/constraintlayout/solver/c;->i(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    :goto_18
    if-eqz p2, :cond_38

    .line 60
    invoke-virtual {v1, v10, v4, v6, v3}, Landroidx/constraintlayout/solver/c;->i(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    return-void

    :goto_19
    if-ge v2, v0, :cond_38

    if-eqz p2, :cond_38

    .line 61
    invoke-virtual {v1, v5, v9, v6, v3}, Landroidx/constraintlayout/solver/c;->i(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    .line 62
    invoke-virtual {v1, v10, v4, v6, v3}, Landroidx/constraintlayout/solver/c;->i(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    :cond_38
    return-void
.end method

.method public e0(I)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->l0:I

    .line 2
    .line 3
    return-void
.end method

.method public f(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;FI)V
    .locals 6

    .line 1
    sget-object v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->CENTER:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 2
    .line 3
    const/4 v5, 0x0

    .line 4
    move-object v3, v1

    .line 5
    move-object v0, p0

    .line 6
    move-object v2, p1

    .line 7
    move v4, p3

    .line 8
    invoke-virtual/range {v0 .. v5}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->J(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;II)V

    .line 9
    .line 10
    .line 11
    iput p2, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->t:F

    .line 12
    .line 13
    return-void
.end method

.method public f0(II)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->K:I

    .line 2
    .line 3
    sub-int/2addr p2, p1

    .line 4
    iput p2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->G:I

    .line 5
    .line 6
    iget p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->V:I

    .line 7
    .line 8
    if-ge p2, p1, :cond_0

    .line 9
    .line 10
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->G:I

    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public g(Landroidx/constraintlayout/solver/c;)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroidx/constraintlayout/solver/c;->r(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->v:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroidx/constraintlayout/solver/c;->r(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroidx/constraintlayout/solver/c;->r(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroidx/constraintlayout/solver/c;->r(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 19
    .line 20
    .line 21
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->U:I

    .line 22
    .line 23
    if-lez v0, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 26
    .line 27
    invoke-virtual {p1, p0}, Landroidx/constraintlayout/solver/c;->r(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public g0(Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;)V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aput-object p1, v0, v1

    .line 5
    .line 6
    sget-object v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->WRAP_CONTENT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 7
    .line 8
    if-ne p1, v0, :cond_0

    .line 9
    .line 10
    iget p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->X:I

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y0(I)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public h(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .locals 2

    .line 1
    sget-object v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    aget v0, v0, v1

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    packed-switch v0, :pswitch_data_0

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, Ll/gig0;->a(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    :pswitch_0
    return-object v1

    .line 21
    :pswitch_1
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->A:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 22
    .line 23
    return-object p0

    .line 24
    :pswitch_2
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->z:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 25
    .line 26
    return-object p0

    .line 27
    :pswitch_3
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->B:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 28
    .line 29
    return-object p0

    .line 30
    :pswitch_4
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 31
    .line 32
    return-object p0

    .line 33
    :pswitch_5
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 34
    .line 35
    return-object p0

    .line 36
    :pswitch_6
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 37
    .line 38
    return-object p0

    .line 39
    :pswitch_7
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->v:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 40
    .line 41
    return-object p0

    .line 42
    :pswitch_8
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 43
    .line 44
    return-object p0

    .line 45
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public h0(IIIF)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->e:I

    .line 2
    .line 3
    iput p2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h:I

    .line 4
    .line 5
    iput p3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->i:I

    .line 6
    .line 7
    iput p4, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->j:F

    .line 8
    .line 9
    const/high16 p2, 0x3f800000    # 1.0f

    .line 10
    .line 11
    cmpg-float p2, p4, p2

    .line 12
    .line 13
    if-gez p2, :cond_0

    .line 14
    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    const/4 p1, 0x2

    .line 18
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->e:I

    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public i()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public i0(F)V
    .locals 1

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->p0:[F

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aput p1, p0, v0

    .line 5
    .line 6
    return-void
.end method

.method public j()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->U:I

    .line 2
    .line 3
    return p0
.end method

.method public j0(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->s:[I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    aput p1, p0, v0

    .line 5
    .line 6
    return-void
.end method

.method public k(I)F
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->Z:F

    .line 4
    .line 5
    return p0

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    if-ne p1, v0, :cond_1

    .line 8
    .line 9
    iget p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->a0:F

    .line 10
    .line 11
    return p0

    .line 12
    :cond_1
    const/high16 p0, -0x40800000    # -1.0f

    .line 13
    .line 14
    return p0
.end method

.method public k0(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->s:[I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aput p1, p0, v0

    .line 5
    .line 6
    return-void
.end method

.method public l()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->H()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->H:I

    .line 6
    .line 7
    add-int/2addr v0, p0

    .line 8
    return v0
.end method

.method public l0(I)V
    .locals 0

    .line 1
    if-gez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->W:I

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->W:I

    .line 8
    .line 9
    return-void
.end method

.method public m()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->b0:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public m0(I)V
    .locals 0

    .line 1
    if-gez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->V:I

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->V:I

    .line 8
    .line 9
    return-void
.end method

.method public n()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->e0:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public n0(II)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->S:I

    .line 2
    .line 3
    iput p2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->T:I

    .line 4
    .line 5
    return-void
.end method

.method public o(I)Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->s()Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0

    .line 8
    :cond_0
    const/4 v0, 0x1

    .line 9
    if-ne p1, v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->B()Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_1
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public o0(II)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->K:I

    .line 2
    .line 3
    iput p2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->L:I

    .line 4
    .line 5
    return-void
.end method

.method public p()I
    .locals 1

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->O:I

    .line 2
    .line 3
    iget p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->S:I

    .line 4
    .line 5
    add-int/2addr v0, p0

    .line 6
    return v0
.end method

.method public p0(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->F:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 2
    .line 3
    return-void
.end method

.method public q()I
    .locals 1

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->P:I

    .line 2
    .line 3
    iget p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->T:I

    .line 4
    .line 5
    add-int/2addr v0, p0

    .line 6
    return v0
.end method

.method public q0(II)V
    .locals 1

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->M:I

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    if-ne p2, v0, :cond_1

    .line 8
    .line 9
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->N:I

    .line 10
    .line 11
    :cond_1
    return-void
.end method

.method public r()I
    .locals 2

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->d0:I

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    iget p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->H:I

    .line 10
    .line 11
    return p0
.end method

.method public r0(F)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->a0:F

    .line 2
    .line 3
    return-void
.end method

.method public s()Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;
    .locals 1

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aget-object p0, p0, v0

    .line 5
    .line 6
    return-object p0
.end method

.method public s0(I)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->m0:I

    .line 2
    .line 3
    return-void
.end method

.method public t(I)I
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 v0, 0x1

    .line 9
    if-ne p1, v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_1
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public t0(II)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->L:I

    .line 2
    .line 3
    sub-int/2addr p2, p1

    .line 4
    iput p2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->H:I

    .line 5
    .line 6
    iget p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->W:I

    .line 7
    .line 8
    if-ge p2, p1, :cond_0

    .line 9
    .line 10
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->H:I

    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->f0:Ljava/lang/String;

    .line 7
    .line 8
    const-string v2, ""

    .line 9
    .line 10
    const-string v3, " "

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    new-instance v1, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v4, "type: "

    .line 17
    .line 18
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v4, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->f0:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    move-object v1, v2

    .line 35
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->e0:Ljava/lang/String;

    .line 39
    .line 40
    if-eqz v1, :cond_1

    .line 41
    .line 42
    new-instance v1, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    const-string v2, "id: "

    .line 45
    .line 46
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    iget-object v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->e0:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    :cond_1
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    const-string v1, "("

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    iget v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->K:I

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    const-string v1, ", "

    .line 75
    .line 76
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    iget v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->L:I

    .line 80
    .line 81
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    const-string v1, ") - ("

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    iget v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->G:I

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    const-string v1, " x "

    .line 95
    .line 96
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    iget v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->H:I

    .line 100
    .line 101
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    const-string v2, ") wrap: ("

    .line 105
    .line 106
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    iget v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->X:I

    .line 110
    .line 111
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    iget p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->Y:I

    .line 118
    .line 119
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    const-string p0, ")"

    .line 123
    .line 124
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    return-object p0
.end method

.method public u()Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->F:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 2
    .line 3
    return-object p0
.end method

.method public u0(Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;)V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    aput-object p1, v0, v1

    .line 5
    .line 6
    sget-object v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->WRAP_CONTENT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 7
    .line 8
    if-ne p1, v0, :cond_0

    .line 9
    .line 10
    iget p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->Y:I

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->b0(I)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public v(I)I
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->M:I

    .line 4
    .line 5
    return p0

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    if-ne p1, v0, :cond_1

    .line 8
    .line 9
    iget p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->N:I

    .line 10
    .line 11
    return p0

    .line 12
    :cond_1
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public v0(IIIF)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->f:I

    .line 2
    .line 3
    iput p2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->k:I

    .line 4
    .line 5
    iput p3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->l:I

    .line 6
    .line 7
    iput p4, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->m:F

    .line 8
    .line 9
    const/high16 p2, 0x3f800000    # 1.0f

    .line 10
    .line 11
    cmpg-float p2, p4, p2

    .line 12
    .line 13
    if-gez p2, :cond_0

    .line 14
    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    const/4 p1, 0x2

    .line 18
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->f:I

    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public w()Ll/r3d0;
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->d:Ll/r3d0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/r3d0;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/r3d0;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->d:Ll/r3d0;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->d:Ll/r3d0;

    .line 13
    .line 14
    return-object p0
.end method

.method public w0(F)V
    .locals 1

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->p0:[F

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    aput p1, p0, v0

    .line 5
    .line 6
    return-void
.end method

.method public x()Ll/r3d0;
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->c:Ll/r3d0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/r3d0;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/r3d0;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->c:Ll/r3d0;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->c:Ll/r3d0;

    .line 13
    .line 14
    return-object p0
.end method

.method public x0(I)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->d0:I

    .line 2
    .line 3
    return-void
.end method

.method public y()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->G()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->G:I

    .line 6
    .line 7
    add-int/2addr v0, p0

    .line 8
    return v0
.end method

.method public y0(I)V
    .locals 1

    .line 1
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->G:I

    .line 2
    .line 3
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->V:I

    .line 4
    .line 5
    if-ge p1, v0, :cond_0

    .line 6
    .line 7
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->G:I

    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public z()I
    .locals 1

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->K:I

    .line 2
    .line 3
    iget p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->S:I

    .line 4
    .line 5
    add-int/2addr v0, p0

    .line 6
    return v0
.end method

.method public z0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->n:Z

    .line 2
    .line 3
    return-void
.end method
