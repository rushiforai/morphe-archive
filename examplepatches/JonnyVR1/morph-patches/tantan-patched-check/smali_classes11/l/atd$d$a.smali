.class public final Ll/atd$d$a;
.super Ll/agj0$a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/atd$d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public A:Z

.field public B:Z

.field public C:Z

.field public D:Z

.field public E:Z

.field public F:Z

.field public G:Z

.field public H:Z

.field public I:Z

.field public J:Z

.field public K:Z

.field public L:Z

.field public M:Z

.field public N:Z

.field public final O:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ljava/util/Map<",
            "Ll/ffj0;",
            "Ll/atd$e;",
            ">;>;"
        }
    .end annotation
.end field

.field public final P:Landroid/util/SparseBooleanArray;


# direct methods
.method public constructor <init>()V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 217
    invoke-direct {p0}, Ll/agj0$a;-><init>()V

    .line 218
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Ll/atd$d$a;->O:Landroid/util/SparseArray;

    .line 219
    new-instance v0, Landroid/util/SparseBooleanArray;

    invoke-direct {v0}, Landroid/util/SparseBooleanArray;-><init>()V

    iput-object v0, p0, Ll/atd$d$a;->P:Landroid/util/SparseBooleanArray;

    .line 220
    invoke-virtual {p0}, Ll/atd$d$a;->f0()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 221
    invoke-direct {p0, p1}, Ll/agj0$a;-><init>(Landroid/content/Context;)V

    .line 222
    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Ll/atd$d$a;->O:Landroid/util/SparseArray;

    .line 223
    new-instance p1, Landroid/util/SparseBooleanArray;

    invoke-direct {p1}, Landroid/util/SparseBooleanArray;-><init>()V

    iput-object p1, p0, Ll/atd$d$a;->P:Landroid/util/SparseBooleanArray;

    .line 224
    invoke-virtual {p0}, Ll/atd$d$a;->f0()V

    return-void
.end method

.method public constructor <init>(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Ll/agj0$a;-><init>(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/atd$d$a;->f0()V

    .line 5
    .line 6
    .line 7
    sget-object v0, Ll/atd$d;->V0:Ll/atd$d;

    .line 8
    .line 9
    invoke-static {}, Ll/atd$d;->m()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-boolean v2, v0, Ll/atd$d;->F0:Z

    .line 14
    .line 15
    invoke-virtual {p1, v1, v2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-virtual {p0, v1}, Ll/atd$d$a;->u0(Z)Ll/atd$d$a;

    .line 20
    .line 21
    .line 22
    invoke-static {}, Ll/atd$d;->t()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iget-boolean v2, v0, Ll/atd$d;->G0:Z

    .line 27
    .line 28
    invoke-virtual {p1, v1, v2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-virtual {p0, v1}, Ll/atd$d$a;->p0(Z)Ll/atd$d$a;

    .line 33
    .line 34
    .line 35
    invoke-static {}, Ll/atd$d;->u()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iget-boolean v2, v0, Ll/atd$d;->H0:Z

    .line 40
    .line 41
    invoke-virtual {p1, v1, v2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    invoke-virtual {p0, v1}, Ll/atd$d$a;->q0(Z)Ll/atd$d$a;

    .line 46
    .line 47
    .line 48
    invoke-static {}, Ll/atd$d;->v()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    iget-boolean v2, v0, Ll/atd$d;->I0:Z

    .line 53
    .line 54
    invoke-virtual {p1, v1, v2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    invoke-virtual {p0, v1}, Ll/atd$d$a;->o0(Z)Ll/atd$d$a;

    .line 59
    .line 60
    .line 61
    invoke-static {}, Ll/atd$d;->w()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    iget-boolean v2, v0, Ll/atd$d;->J0:Z

    .line 66
    .line 67
    invoke-virtual {p1, v1, v2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    invoke-virtual {p0, v1}, Ll/atd$d$a;->s0(Z)Ll/atd$d$a;

    .line 72
    .line 73
    .line 74
    invoke-static {}, Ll/atd$d;->x()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    iget-boolean v2, v0, Ll/atd$d;->K0:Z

    .line 79
    .line 80
    invoke-virtual {p1, v1, v2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    invoke-virtual {p0, v1}, Ll/atd$d$a;->k0(Z)Ll/atd$d$a;

    .line 85
    .line 86
    .line 87
    invoke-static {}, Ll/atd$d;->y()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    iget-boolean v2, v0, Ll/atd$d;->L0:Z

    .line 92
    .line 93
    invoke-virtual {p1, v1, v2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    invoke-virtual {p0, v1}, Ll/atd$d$a;->l0(Z)Ll/atd$d$a;

    .line 98
    .line 99
    .line 100
    invoke-static {}, Ll/atd$d;->z()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    iget-boolean v2, v0, Ll/atd$d;->M0:Z

    .line 105
    .line 106
    invoke-virtual {p1, v1, v2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    invoke-virtual {p0, v1}, Ll/atd$d$a;->i0(Z)Ll/atd$d$a;

    .line 111
    .line 112
    .line 113
    invoke-static {}, Ll/atd$d;->c()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    iget-boolean v2, v0, Ll/atd$d;->N0:Z

    .line 118
    .line 119
    invoke-virtual {p1, v1, v2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 120
    .line 121
    .line 122
    move-result v1

    .line 123
    invoke-virtual {p0, v1}, Ll/atd$d$a;->j0(Z)Ll/atd$d$a;

    .line 124
    .line 125
    .line 126
    invoke-static {}, Ll/atd$d;->d()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    iget-boolean v2, v0, Ll/atd$d;->O0:Z

    .line 131
    .line 132
    invoke-virtual {p1, v1, v2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    invoke-virtual {p0, v1}, Ll/atd$d$a;->r0(Z)Ll/atd$d$a;

    .line 137
    .line 138
    .line 139
    invoke-static {}, Ll/atd$d;->e()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    iget-boolean v2, v0, Ll/atd$d;->P0:Z

    .line 144
    .line 145
    invoke-virtual {p1, v1, v2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 146
    .line 147
    .line 148
    move-result v1

    .line 149
    invoke-virtual {p0, v1}, Ll/atd$d$a;->t0(Z)Ll/atd$d$a;

    .line 150
    .line 151
    .line 152
    invoke-static {}, Ll/atd$d;->f()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    iget-boolean v2, v0, Ll/atd$d;->Q0:Z

    .line 157
    .line 158
    invoke-virtual {p1, v1, v2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 159
    .line 160
    .line 161
    move-result v1

    .line 162
    invoke-virtual {p0, v1}, Ll/atd$d$a;->B0(Z)Ll/atd$d$a;

    .line 163
    .line 164
    .line 165
    invoke-static {}, Ll/atd$d;->g()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v1

    .line 169
    iget-boolean v2, v0, Ll/atd$d;->R0:Z

    .line 170
    .line 171
    invoke-virtual {p1, v1, v2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 172
    .line 173
    .line 174
    move-result v1

    .line 175
    invoke-virtual {p0, v1}, Ll/atd$d$a;->n0(Z)Ll/atd$d$a;

    .line 176
    .line 177
    .line 178
    invoke-static {}, Ll/atd$d;->h()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    iget-boolean v0, v0, Ll/atd$d;->S0:Z

    .line 183
    .line 184
    invoke-virtual {p1, v1, v0}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 185
    .line 186
    .line 187
    move-result v0

    .line 188
    invoke-virtual {p0, v0}, Ll/atd$d$a;->m0(Z)Ll/atd$d$a;

    .line 189
    .line 190
    .line 191
    new-instance v0, Landroid/util/SparseArray;

    .line 192
    .line 193
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 194
    .line 195
    .line 196
    iput-object v0, p0, Ll/atd$d$a;->O:Landroid/util/SparseArray;

    .line 197
    .line 198
    invoke-virtual {p0, p1}, Ll/atd$d$a;->z0(Landroid/os/Bundle;)V

    .line 199
    .line 200
    .line 201
    invoke-static {}, Ll/atd$d;->i()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getIntArray(Ljava/lang/String;)[I

    .line 206
    .line 207
    .line 208
    move-result-object p1

    .line 209
    invoke-virtual {p0, p1}, Ll/atd$d$a;->g0([I)Landroid/util/SparseBooleanArray;

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    iput-object p1, p0, Ll/atd$d$a;->P:Landroid/util/SparseBooleanArray;

    .line 214
    .line 215
    return-void
.end method

.method public synthetic constructor <init>(Landroid/os/Bundle;Ll/atd$a;)V
    .locals 0

    .line 242
    invoke-direct {p0, p1}, Ll/atd$d$a;-><init>(Landroid/os/Bundle;)V

    return-void
.end method

.method public constructor <init>(Ll/atd$d;)V
    .locals 1

    .line 225
    invoke-direct {p0, p1}, Ll/agj0$a;-><init>(Ll/agj0;)V

    .line 226
    iget-boolean v0, p1, Ll/atd$d;->F0:Z

    iput-boolean v0, p0, Ll/atd$d$a;->A:Z

    .line 227
    iget-boolean v0, p1, Ll/atd$d;->G0:Z

    iput-boolean v0, p0, Ll/atd$d$a;->B:Z

    .line 228
    iget-boolean v0, p1, Ll/atd$d;->H0:Z

    iput-boolean v0, p0, Ll/atd$d$a;->C:Z

    .line 229
    iget-boolean v0, p1, Ll/atd$d;->I0:Z

    iput-boolean v0, p0, Ll/atd$d$a;->D:Z

    .line 230
    iget-boolean v0, p1, Ll/atd$d;->J0:Z

    iput-boolean v0, p0, Ll/atd$d$a;->E:Z

    .line 231
    iget-boolean v0, p1, Ll/atd$d;->K0:Z

    iput-boolean v0, p0, Ll/atd$d$a;->F:Z

    .line 232
    iget-boolean v0, p1, Ll/atd$d;->L0:Z

    iput-boolean v0, p0, Ll/atd$d$a;->G:Z

    .line 233
    iget-boolean v0, p1, Ll/atd$d;->M0:Z

    iput-boolean v0, p0, Ll/atd$d$a;->H:Z

    .line 234
    iget-boolean v0, p1, Ll/atd$d;->N0:Z

    iput-boolean v0, p0, Ll/atd$d$a;->I:Z

    .line 235
    iget-boolean v0, p1, Ll/atd$d;->O0:Z

    iput-boolean v0, p0, Ll/atd$d$a;->J:Z

    .line 236
    iget-boolean v0, p1, Ll/atd$d;->P0:Z

    iput-boolean v0, p0, Ll/atd$d$a;->K:Z

    .line 237
    iget-boolean v0, p1, Ll/atd$d;->Q0:Z

    iput-boolean v0, p0, Ll/atd$d$a;->L:Z

    .line 238
    iget-boolean v0, p1, Ll/atd$d;->R0:Z

    iput-boolean v0, p0, Ll/atd$d$a;->M:Z

    .line 239
    iget-boolean v0, p1, Ll/atd$d;->S0:Z

    iput-boolean v0, p0, Ll/atd$d$a;->N:Z

    .line 240
    invoke-static {p1}, Ll/atd$d;->D(Ll/atd$d;)Landroid/util/SparseArray;

    move-result-object v0

    invoke-static {v0}, Ll/atd$d$a;->e0(Landroid/util/SparseArray;)Landroid/util/SparseArray;

    move-result-object v0

    iput-object v0, p0, Ll/atd$d$a;->O:Landroid/util/SparseArray;

    .line 241
    invoke-static {p1}, Ll/atd$d;->E(Ll/atd$d;)Landroid/util/SparseBooleanArray;

    move-result-object p1

    invoke-virtual {p1}, Landroid/util/SparseBooleanArray;->clone()Landroid/util/SparseBooleanArray;

    move-result-object p1

    iput-object p1, p0, Ll/atd$d$a;->P:Landroid/util/SparseBooleanArray;

    return-void
.end method

.method public synthetic constructor <init>(Ll/atd$d;Ll/atd$a;)V
    .locals 0

    .line 216
    invoke-direct {p0, p1}, Ll/atd$d$a;-><init>(Ll/atd$d;)V

    return-void
.end method

.method public static synthetic M(Ll/atd$d$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/atd$d$a;->A:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic N(Ll/atd$d$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/atd$d$a;->B:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic O(Ll/atd$d$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/atd$d$a;->C:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic P(Ll/atd$d$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/atd$d$a;->D:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic Q(Ll/atd$d$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/atd$d$a;->E:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic R(Ll/atd$d$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/atd$d$a;->F:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic S(Ll/atd$d$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/atd$d$a;->G:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic T(Ll/atd$d$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/atd$d$a;->H:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic U(Ll/atd$d$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/atd$d$a;->I:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic V(Ll/atd$d$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/atd$d$a;->J:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic W(Ll/atd$d$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/atd$d$a;->K:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic X(Ll/atd$d$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/atd$d$a;->L:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic Y(Ll/atd$d$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/atd$d$a;->M:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic Z(Ll/atd$d$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/atd$d$a;->N:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic a0(Ll/atd$d$a;)Landroid/util/SparseArray;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/atd$d$a;->O:Landroid/util/SparseArray;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b0(Ll/atd$d$a;)Landroid/util/SparseBooleanArray;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/atd$d$a;->P:Landroid/util/SparseBooleanArray;

    .line 2
    .line 3
    return-object p0
.end method

.method public static e0(Landroid/util/SparseArray;)Landroid/util/SparseArray;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray<",
            "Ljava/util/Map<",
            "Ll/ffj0;",
            "Ll/atd$e;",
            ">;>;)",
            "Landroid/util/SparseArray<",
            "Ljava/util/Map<",
            "Ll/ffj0;",
            "Ll/atd$e;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    invoke-virtual {p0}, Landroid/util/SparseArray;->size()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-ge v1, v2, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Landroid/util/SparseArray;->keyAt(I)I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    new-instance v3, Ljava/util/HashMap;

    .line 18
    .line 19
    invoke-virtual {p0, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    check-cast v4, Ljava/util/Map;

    .line 24
    .line 25
    invoke-direct {v3, v4}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v2, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    add-int/lit8 v1, v1, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    return-object v0
.end method


# virtual methods
.method public bridge synthetic A()Ll/agj0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/atd$d$a;->c0()Ll/atd$d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public A0(IZ)Ll/atd$d$a;
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/agj0$a;->J(IZ)Ll/agj0$a;

    .line 2
    .line 3
    .line 4
    return-object p0
.end method

.method public bridge synthetic B(I)Ll/agj0$a;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/atd$d$a;->d0(I)Ll/atd$d$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public B0(Z)Ll/atd$d$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/atd$d$a;->L:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public C0(IIZ)Ll/atd$d$a;
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/agj0$a;->K(IIZ)Ll/agj0$a;

    .line 2
    .line 3
    .line 4
    return-object p0
.end method

.method public D0(Landroid/content/Context;Z)Ll/atd$d$a;
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/agj0$a;->L(Landroid/content/Context;Z)Ll/agj0$a;

    .line 2
    .line 3
    .line 4
    return-object p0
.end method

.method public bridge synthetic F(I)Ll/agj0$a;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/atd$d$a;->v0(I)Ll/atd$d$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic G(Ll/yfj0;)Ll/agj0$a;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/atd$d$a;->w0(Ll/yfj0;)Ll/atd$d$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic H(Landroid/content/Context;)Ll/agj0$a;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/atd$d$a;->x0(Landroid/content/Context;)Ll/atd$d$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic J(IZ)Ll/agj0$a;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/atd$d$a;->A0(IZ)Ll/atd$d$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic K(IIZ)Ll/agj0$a;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/atd$d$a;->C0(IIZ)Ll/atd$d$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic L(Landroid/content/Context;Z)Ll/agj0$a;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/atd$d$a;->D0(Landroid/content/Context;Z)Ll/atd$d$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c0()Ll/atd$d;
    .locals 2

    .line 1
    new-instance v0, Ll/atd$d;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Ll/atd$d;-><init>(Ll/atd$d$a;Ll/atd$a;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public d0(I)Ll/atd$d$a;
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/agj0$a;->B(I)Ll/agj0$a;

    .line 2
    .line 3
    .line 4
    return-object p0
.end method

.method public final f0()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/atd$d$a;->A:Z

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    iput-boolean v1, p0, Ll/atd$d$a;->B:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/atd$d$a;->C:Z

    .line 8
    .line 9
    iput-boolean v1, p0, Ll/atd$d$a;->D:Z

    .line 10
    .line 11
    iput-boolean v0, p0, Ll/atd$d$a;->E:Z

    .line 12
    .line 13
    iput-boolean v1, p0, Ll/atd$d$a;->F:Z

    .line 14
    .line 15
    iput-boolean v1, p0, Ll/atd$d$a;->G:Z

    .line 16
    .line 17
    iput-boolean v1, p0, Ll/atd$d$a;->H:Z

    .line 18
    .line 19
    iput-boolean v1, p0, Ll/atd$d$a;->I:Z

    .line 20
    .line 21
    iput-boolean v0, p0, Ll/atd$d$a;->J:Z

    .line 22
    .line 23
    iput-boolean v0, p0, Ll/atd$d$a;->K:Z

    .line 24
    .line 25
    iput-boolean v1, p0, Ll/atd$d$a;->L:Z

    .line 26
    .line 27
    iput-boolean v0, p0, Ll/atd$d$a;->M:Z

    .line 28
    .line 29
    iput-boolean v1, p0, Ll/atd$d$a;->N:Z

    .line 30
    .line 31
    return-void
.end method

.method public final g0([I)Landroid/util/SparseBooleanArray;
    .locals 4
    .param p1    # [I
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    new-instance p0, Landroid/util/SparseBooleanArray;

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/util/SparseBooleanArray;-><init>()V

    .line 6
    .line 7
    .line 8
    return-object p0

    .line 9
    :cond_0
    new-instance p0, Landroid/util/SparseBooleanArray;

    .line 10
    .line 11
    array-length v0, p1

    .line 12
    invoke-direct {p0, v0}, Landroid/util/SparseBooleanArray;-><init>(I)V

    .line 13
    .line 14
    .line 15
    array-length v0, p1

    .line 16
    const/4 v1, 0x0

    .line 17
    :goto_0
    if-ge v1, v0, :cond_1

    .line 18
    .line 19
    aget v2, p1, v1

    .line 20
    .line 21
    const/4 v3, 0x1

    .line 22
    invoke-virtual {p0, v2, v3}, Landroid/util/SparseBooleanArray;->append(IZ)V

    .line 23
    .line 24
    .line 25
    add-int/lit8 v1, v1, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    return-object p0
.end method

.method public h0(Ll/agj0;)Ll/atd$d$a;
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/agj0$a;->E(Ll/agj0;)Ll/agj0$a;

    .line 2
    .line 3
    .line 4
    return-object p0
.end method

.method public i0(Z)Ll/atd$d$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/atd$d$a;->H:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public j0(Z)Ll/atd$d$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/atd$d$a;->I:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public k0(Z)Ll/atd$d$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/atd$d$a;->F:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public l0(Z)Ll/atd$d$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/atd$d$a;->G:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public m0(Z)Ll/atd$d$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/atd$d$a;->N:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public n0(Z)Ll/atd$d$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/atd$d$a;->M:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public o0(Z)Ll/atd$d$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/atd$d$a;->D:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public p0(Z)Ll/atd$d$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/atd$d$a;->B:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public q0(Z)Ll/atd$d$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/atd$d$a;->C:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public r0(Z)Ll/atd$d$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/atd$d$a;->J:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public s0(Z)Ll/atd$d$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/atd$d$a;->E:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public t0(Z)Ll/atd$d$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/atd$d$a;->K:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public u0(Z)Ll/atd$d$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/atd$d$a;->A:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public v0(I)Ll/atd$d$a;
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/agj0$a;->F(I)Ll/agj0$a;

    .line 2
    .line 3
    .line 4
    return-object p0
.end method

.method public w0(Ll/yfj0;)Ll/atd$d$a;
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/agj0$a;->G(Ll/yfj0;)Ll/agj0$a;

    .line 2
    .line 3
    .line 4
    return-object p0
.end method

.method public x0(Landroid/content/Context;)Ll/atd$d$a;
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/agj0$a;->H(Landroid/content/Context;)Ll/agj0$a;

    .line 2
    .line 3
    .line 4
    return-object p0
.end method

.method public y0(ILl/ffj0;Ll/atd$e;)Ll/atd$d$a;
    .locals 2
    .param p3    # Ll/atd$e;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/atd$d$a;->O:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/util/Map;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Ll/atd$d$a;->O:Landroid/util/SparseArray;

    .line 17
    .line 18
    invoke-virtual {v1, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-interface {v0, p2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-static {p1, p3}, Ll/bmk0;->c(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_1
    invoke-interface {v0, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    return-object p0
.end method

.method public final z0(Landroid/os/Bundle;)V
    .locals 6

    .line 1
    invoke-static {}, Ll/atd$d;->k()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getIntArray(Ljava/lang/String;)[I

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, Ll/atd$d;->l()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    sget-object v2, Ll/ffj0;->f:Lcom/google/android/exoplayer2/e$a;

    .line 25
    .line 26
    invoke-static {v2, v1}, Ll/cj3;->d(Lcom/google/android/exoplayer2/e$a;Ljava/util/List;)Lcom/google/common/collect/ImmutableList;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    :goto_0
    invoke-static {}, Ll/atd$d;->n()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getSparseParcelableArray(Ljava/lang/String;)Landroid/util/SparseArray;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    if-nez p1, :cond_1

    .line 39
    .line 40
    new-instance p1, Landroid/util/SparseArray;

    .line 41
    .line 42
    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    .line 43
    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_1
    sget-object v2, Ll/atd$e;->h:Lcom/google/android/exoplayer2/e$a;

    .line 47
    .line 48
    invoke-static {v2, p1}, Ll/cj3;->e(Lcom/google/android/exoplayer2/e$a;Landroid/util/SparseArray;)Landroid/util/SparseArray;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    :goto_1
    if-eqz v0, :cond_3

    .line 53
    .line 54
    array-length v2, v0

    .line 55
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    if-eq v2, v3, :cond_2

    .line 60
    .line 61
    goto :goto_3

    .line 62
    :cond_2
    const/4 v2, 0x0

    .line 63
    :goto_2
    array-length v3, v0

    .line 64
    if-ge v2, v3, :cond_3

    .line 65
    .line 66
    aget v3, v0, v2

    .line 67
    .line 68
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v4

    .line 72
    check-cast v4, Ll/ffj0;

    .line 73
    .line 74
    invoke-virtual {p1, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v5

    .line 78
    check-cast v5, Ll/atd$e;

    .line 79
    .line 80
    invoke-virtual {p0, v3, v4, v5}, Ll/atd$d$a;->y0(ILl/ffj0;Ll/atd$e;)Ll/atd$d$a;

    .line 81
    .line 82
    .line 83
    add-int/lit8 v2, v2, 0x1

    .line 84
    .line 85
    goto :goto_2

    .line 86
    :cond_3
    :goto_3
    return-void
.end method
