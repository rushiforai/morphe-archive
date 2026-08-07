.class public final Lcom/bumptech/glide/b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/b$d;,
        Lcom/bumptech/glide/b$b;,
        Lcom/bumptech/glide/b$c;,
        Lcom/bumptech/glide/b$e;
    }
.end annotation


# instance fields
.field private final a:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Ll/aij0<",
            "**>;>;"
        }
    .end annotation
.end field

.field private final b:Lcom/bumptech/glide/d$a;

.field private c:Lcom/bumptech/glide/load/engine/h;

.field private d:Ll/w23;

.field private e:Ll/o01;

.field private f:Ll/lpy;

.field private g:Ll/a4k;

.field private h:Ll/a4k;

.field private i:Ll/z3e$a;

.field private j:Ll/cqy;

.field private k:Lcom/bumptech/glide/manager/d;

.field private l:I

.field private m:Lcom/bumptech/glide/a$a;

.field private n:Lcom/bumptech/glide/manager/m$b;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private o:Ll/a4k;

.field private p:Z

.field private q:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/l2d0<",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/l01;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/l01;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/bumptech/glide/b;->a:Ljava/util/Map;

    .line 10
    .line 11
    new-instance v0, Lcom/bumptech/glide/d$a;

    .line 12
    .line 13
    invoke-direct {v0}, Lcom/bumptech/glide/d$a;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/bumptech/glide/b;->b:Lcom/bumptech/glide/d$a;

    .line 17
    .line 18
    const/4 v0, 0x4

    .line 19
    iput v0, p0, Lcom/bumptech/glide/b;->l:I

    .line 20
    .line 21
    new-instance v0, Lcom/bumptech/glide/b$a;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Lcom/bumptech/glide/b$a;-><init>(Lcom/bumptech/glide/b;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/bumptech/glide/b;->m:Lcom/bumptech/glide/a$a;

    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public a(Landroid/content/Context;)Lcom/bumptech/glide/a;
    .locals 14
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/bumptech/glide/b;->g:Ll/a4k;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/a4k;->v()Ll/a4k;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/bumptech/glide/b;->g:Ll/a4k;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/b;->h:Ll/a4k;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Ll/a4k;->t()Ll/a4k;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/bumptech/glide/b;->h:Ll/a4k;

    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Lcom/bumptech/glide/b;->o:Ll/a4k;

    .line 22
    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    invoke-static {}, Ll/a4k;->n()Ll/a4k;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/bumptech/glide/b;->o:Ll/a4k;

    .line 30
    .line 31
    :cond_2
    iget-object v0, p0, Lcom/bumptech/glide/b;->j:Ll/cqy;

    .line 32
    .line 33
    if-nez v0, :cond_3

    .line 34
    .line 35
    new-instance v0, Ll/cqy$a;

    .line 36
    .line 37
    invoke-direct {v0, p1}, Ll/cqy$a;-><init>(Landroid/content/Context;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Ll/cqy$a;->a()Ll/cqy;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iput-object v0, p0, Lcom/bumptech/glide/b;->j:Ll/cqy;

    .line 45
    .line 46
    :cond_3
    iget-object v0, p0, Lcom/bumptech/glide/b;->k:Lcom/bumptech/glide/manager/d;

    .line 47
    .line 48
    if-nez v0, :cond_4

    .line 49
    .line 50
    new-instance v0, Lcom/bumptech/glide/manager/f;

    .line 51
    .line 52
    invoke-direct {v0}, Lcom/bumptech/glide/manager/f;-><init>()V

    .line 53
    .line 54
    .line 55
    iput-object v0, p0, Lcom/bumptech/glide/b;->k:Lcom/bumptech/glide/manager/d;

    .line 56
    .line 57
    :cond_4
    iget-object v0, p0, Lcom/bumptech/glide/b;->d:Ll/w23;

    .line 58
    .line 59
    if-nez v0, :cond_6

    .line 60
    .line 61
    iget-object v0, p0, Lcom/bumptech/glide/b;->j:Ll/cqy;

    .line 62
    .line 63
    invoke-virtual {v0}, Ll/cqy;->b()I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-lez v0, :cond_5

    .line 68
    .line 69
    new-instance v1, Ll/tgw;

    .line 70
    .line 71
    int-to-long v2, v0

    .line 72
    invoke-direct {v1, v2, v3}, Ll/tgw;-><init>(J)V

    .line 73
    .line 74
    .line 75
    iput-object v1, p0, Lcom/bumptech/glide/b;->d:Ll/w23;

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_5
    new-instance v0, Ll/x23;

    .line 79
    .line 80
    invoke-direct {v0}, Ll/x23;-><init>()V

    .line 81
    .line 82
    .line 83
    iput-object v0, p0, Lcom/bumptech/glide/b;->d:Ll/w23;

    .line 84
    .line 85
    :cond_6
    :goto_0
    iget-object v0, p0, Lcom/bumptech/glide/b;->e:Ll/o01;

    .line 86
    .line 87
    if-nez v0, :cond_7

    .line 88
    .line 89
    new-instance v0, Ll/rgw;

    .line 90
    .line 91
    iget-object v1, p0, Lcom/bumptech/glide/b;->j:Ll/cqy;

    .line 92
    .line 93
    invoke-virtual {v1}, Ll/cqy;->a()I

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    invoke-direct {v0, v1}, Ll/rgw;-><init>(I)V

    .line 98
    .line 99
    .line 100
    iput-object v0, p0, Lcom/bumptech/glide/b;->e:Ll/o01;

    .line 101
    .line 102
    :cond_7
    iget-object v0, p0, Lcom/bumptech/glide/b;->f:Ll/lpy;

    .line 103
    .line 104
    if-nez v0, :cond_8

    .line 105
    .line 106
    new-instance v0, Ll/bhw;

    .line 107
    .line 108
    iget-object v1, p0, Lcom/bumptech/glide/b;->j:Ll/cqy;

    .line 109
    .line 110
    invoke-virtual {v1}, Ll/cqy;->d()I

    .line 111
    .line 112
    .line 113
    move-result v1

    .line 114
    int-to-long v1, v1

    .line 115
    invoke-direct {v0, v1, v2}, Ll/bhw;-><init>(J)V

    .line 116
    .line 117
    .line 118
    iput-object v0, p0, Lcom/bumptech/glide/b;->f:Ll/lpy;

    .line 119
    .line 120
    :cond_8
    iget-object v0, p0, Lcom/bumptech/glide/b;->i:Ll/z3e$a;

    .line 121
    .line 122
    if-nez v0, :cond_9

    .line 123
    .line 124
    new-instance v0, Ll/mzm;

    .line 125
    .line 126
    invoke-direct {v0, p1}, Ll/mzm;-><init>(Landroid/content/Context;)V

    .line 127
    .line 128
    .line 129
    iput-object v0, p0, Lcom/bumptech/glide/b;->i:Ll/z3e$a;

    .line 130
    .line 131
    :cond_9
    iget-object v0, p0, Lcom/bumptech/glide/b;->c:Lcom/bumptech/glide/load/engine/h;

    .line 132
    .line 133
    if-nez v0, :cond_a

    .line 134
    .line 135
    new-instance v1, Lcom/bumptech/glide/load/engine/h;

    .line 136
    .line 137
    iget-object v2, p0, Lcom/bumptech/glide/b;->f:Ll/lpy;

    .line 138
    .line 139
    iget-object v3, p0, Lcom/bumptech/glide/b;->i:Ll/z3e$a;

    .line 140
    .line 141
    iget-object v4, p0, Lcom/bumptech/glide/b;->h:Ll/a4k;

    .line 142
    .line 143
    iget-object v5, p0, Lcom/bumptech/glide/b;->g:Ll/a4k;

    .line 144
    .line 145
    invoke-static {}, Ll/a4k;->F()Ll/a4k;

    .line 146
    .line 147
    .line 148
    move-result-object v6

    .line 149
    iget-object v7, p0, Lcom/bumptech/glide/b;->o:Ll/a4k;

    .line 150
    .line 151
    iget-boolean v8, p0, Lcom/bumptech/glide/b;->p:Z

    .line 152
    .line 153
    invoke-direct/range {v1 .. v8}, Lcom/bumptech/glide/load/engine/h;-><init>(Ll/lpy;Ll/z3e$a;Ll/a4k;Ll/a4k;Ll/a4k;Ll/a4k;Z)V

    .line 154
    .line 155
    .line 156
    iput-object v1, p0, Lcom/bumptech/glide/b;->c:Lcom/bumptech/glide/load/engine/h;

    .line 157
    .line 158
    :cond_a
    iget-object v0, p0, Lcom/bumptech/glide/b;->q:Ljava/util/List;

    .line 159
    .line 160
    if-nez v0, :cond_b

    .line 161
    .line 162
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 163
    .line 164
    iput-object v0, p0, Lcom/bumptech/glide/b;->q:Ljava/util/List;

    .line 165
    .line 166
    goto :goto_1

    .line 167
    :cond_b
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    iput-object v0, p0, Lcom/bumptech/glide/b;->q:Ljava/util/List;

    .line 172
    .line 173
    :goto_1
    iget-object v0, p0, Lcom/bumptech/glide/b;->b:Lcom/bumptech/glide/d$a;

    .line 174
    .line 175
    invoke-virtual {v0}, Lcom/bumptech/glide/d$a;->b()Lcom/bumptech/glide/d;

    .line 176
    .line 177
    .line 178
    move-result-object v13

    .line 179
    new-instance v7, Lcom/bumptech/glide/manager/m;

    .line 180
    .line 181
    iget-object v0, p0, Lcom/bumptech/glide/b;->n:Lcom/bumptech/glide/manager/m$b;

    .line 182
    .line 183
    invoke-direct {v7, v0, v13}, Lcom/bumptech/glide/manager/m;-><init>(Lcom/bumptech/glide/manager/m$b;Lcom/bumptech/glide/d;)V

    .line 184
    .line 185
    .line 186
    new-instance v1, Lcom/bumptech/glide/a;

    .line 187
    .line 188
    iget-object v3, p0, Lcom/bumptech/glide/b;->c:Lcom/bumptech/glide/load/engine/h;

    .line 189
    .line 190
    iget-object v4, p0, Lcom/bumptech/glide/b;->f:Ll/lpy;

    .line 191
    .line 192
    iget-object v5, p0, Lcom/bumptech/glide/b;->d:Ll/w23;

    .line 193
    .line 194
    iget-object v6, p0, Lcom/bumptech/glide/b;->e:Ll/o01;

    .line 195
    .line 196
    iget-object v8, p0, Lcom/bumptech/glide/b;->k:Lcom/bumptech/glide/manager/d;

    .line 197
    .line 198
    iget v9, p0, Lcom/bumptech/glide/b;->l:I

    .line 199
    .line 200
    iget-object v10, p0, Lcom/bumptech/glide/b;->m:Lcom/bumptech/glide/a$a;

    .line 201
    .line 202
    iget-object v11, p0, Lcom/bumptech/glide/b;->a:Ljava/util/Map;

    .line 203
    .line 204
    iget-object v12, p0, Lcom/bumptech/glide/b;->q:Ljava/util/List;

    .line 205
    .line 206
    move-object v2, p1

    .line 207
    invoke-direct/range {v1 .. v13}, Lcom/bumptech/glide/a;-><init>(Landroid/content/Context;Lcom/bumptech/glide/load/engine/h;Ll/lpy;Ll/w23;Ll/o01;Lcom/bumptech/glide/manager/m;Lcom/bumptech/glide/manager/d;ILcom/bumptech/glide/a$a;Ljava/util/Map;Ljava/util/List;Lcom/bumptech/glide/d;)V

    .line 208
    .line 209
    .line 210
    return-object v1
.end method

.method public b(Lcom/bumptech/glide/manager/m$b;)V
    .locals 0
    .param p1    # Lcom/bumptech/glide/manager/m$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/bumptech/glide/b;->n:Lcom/bumptech/glide/manager/m$b;

    .line 2
    .line 3
    return-void
.end method
