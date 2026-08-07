.class public Ll/yi80;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/yi80$a;
    }
.end annotation


# instance fields
.field public final a:Ll/bj80;

.field public final b:Ll/cj80;

.field public final c:Ll/bj80;

.field public final d:Ll/gqy;

.field public final e:Ll/bj80;

.field public final f:Ll/cj80;

.field public final g:Ll/bj80;

.field public final h:Ll/cj80;

.field public final i:Ljava/lang/String;

.field public final j:I

.field public final k:I

.field public final l:Z

.field public final m:Z


# direct methods
.method public constructor <init>(Ll/yi80$a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/i9j;->d()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const-string v0, "PoolConfig()"

    .line 11
    .line 12
    invoke-static {v0}, Ll/i9j;->a(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    invoke-static {p1}, Ll/yi80$a;->c(Ll/yi80$a;)Ll/bj80;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    invoke-static {}, Ll/tmd;->a()Ll/bj80;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    goto :goto_0

    .line 26
    :cond_1
    invoke-static {p1}, Ll/yi80$a;->c(Ll/yi80$a;)Ll/bj80;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    :goto_0
    iput-object v0, p0, Ll/yi80;->a:Ll/bj80;

    .line 31
    .line 32
    invoke-static {p1}, Ll/yi80$a;->d(Ll/yi80$a;)Ll/cj80;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    if-nez v0, :cond_2

    .line 37
    .line 38
    invoke-static {}, Ll/ht40;->h()Ll/ht40;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    goto :goto_1

    .line 43
    :cond_2
    invoke-static {p1}, Ll/yi80$a;->d(Ll/yi80$a;)Ll/cj80;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    :goto_1
    iput-object v0, p0, Ll/yi80;->b:Ll/cj80;

    .line 48
    .line 49
    invoke-static {p1}, Ll/yi80$a;->f(Ll/yi80$a;)Ll/bj80;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    if-nez v0, :cond_3

    .line 54
    .line 55
    invoke-static {}, Ll/wod;->b()Ll/bj80;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    goto :goto_2

    .line 60
    :cond_3
    invoke-static {p1}, Ll/yi80$a;->f(Ll/yi80$a;)Ll/bj80;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    :goto_2
    iput-object v0, p0, Ll/yi80;->c:Ll/bj80;

    .line 65
    .line 66
    invoke-static {p1}, Ll/yi80$a;->i(Ll/yi80$a;)Ll/gqy;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    if-nez v0, :cond_4

    .line 71
    .line 72
    invoke-static {}, Ll/gt40;->b()Ll/gt40;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    goto :goto_3

    .line 77
    :cond_4
    invoke-static {p1}, Ll/yi80$a;->i(Ll/yi80$a;)Ll/gqy;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    :goto_3
    iput-object v0, p0, Ll/yi80;->d:Ll/gqy;

    .line 82
    .line 83
    invoke-static {p1}, Ll/yi80$a;->g(Ll/yi80$a;)Ll/bj80;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    if-nez v0, :cond_5

    .line 88
    .line 89
    invoke-static {}, Ll/oqd;->a()Ll/bj80;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    goto :goto_4

    .line 94
    :cond_5
    invoke-static {p1}, Ll/yi80$a;->g(Ll/yi80$a;)Ll/bj80;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    :goto_4
    iput-object v0, p0, Ll/yi80;->e:Ll/bj80;

    .line 99
    .line 100
    invoke-static {p1}, Ll/yi80$a;->h(Ll/yi80$a;)Ll/cj80;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    if-nez v0, :cond_6

    .line 105
    .line 106
    invoke-static {}, Ll/ht40;->h()Ll/ht40;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    goto :goto_5

    .line 111
    :cond_6
    invoke-static {p1}, Ll/yi80$a;->h(Ll/yi80$a;)Ll/cj80;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    :goto_5
    iput-object v0, p0, Ll/yi80;->f:Ll/cj80;

    .line 116
    .line 117
    invoke-static {p1}, Ll/yi80$a;->k(Ll/yi80$a;)Ll/bj80;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    if-nez v0, :cond_7

    .line 122
    .line 123
    invoke-static {}, Ll/wmd;->a()Ll/bj80;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    goto :goto_6

    .line 128
    :cond_7
    invoke-static {p1}, Ll/yi80$a;->k(Ll/yi80$a;)Ll/bj80;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    :goto_6
    iput-object v0, p0, Ll/yi80;->g:Ll/bj80;

    .line 133
    .line 134
    invoke-static {p1}, Ll/yi80$a;->l(Ll/yi80$a;)Ll/cj80;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    if-nez v0, :cond_8

    .line 139
    .line 140
    invoke-static {}, Ll/ht40;->h()Ll/ht40;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    goto :goto_7

    .line 145
    :cond_8
    invoke-static {p1}, Ll/yi80$a;->l(Ll/yi80$a;)Ll/cj80;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    :goto_7
    iput-object v0, p0, Ll/yi80;->h:Ll/cj80;

    .line 150
    .line 151
    invoke-static {p1}, Ll/yi80$a;->e(Ll/yi80$a;)Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    if-nez v0, :cond_9

    .line 156
    .line 157
    const-string v0, "legacy"

    .line 158
    .line 159
    goto :goto_8

    .line 160
    :cond_9
    invoke-static {p1}, Ll/yi80$a;->e(Ll/yi80$a;)Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    :goto_8
    iput-object v0, p0, Ll/yi80;->i:Ljava/lang/String;

    .line 165
    .line 166
    invoke-static {p1}, Ll/yi80$a;->b(Ll/yi80$a;)I

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    iput v0, p0, Ll/yi80;->j:I

    .line 171
    .line 172
    invoke-static {p1}, Ll/yi80$a;->a(Ll/yi80$a;)I

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    if-lez v0, :cond_a

    .line 177
    .line 178
    invoke-static {p1}, Ll/yi80$a;->a(Ll/yi80$a;)I

    .line 179
    .line 180
    .line 181
    move-result v0

    .line 182
    goto :goto_9

    .line 183
    :cond_a
    const/high16 v0, 0x400000

    .line 184
    .line 185
    :goto_9
    iput v0, p0, Ll/yi80;->k:I

    .line 186
    .line 187
    invoke-static {p1}, Ll/yi80$a;->j(Ll/yi80$a;)Z

    .line 188
    .line 189
    .line 190
    move-result v0

    .line 191
    iput-boolean v0, p0, Ll/yi80;->l:Z

    .line 192
    .line 193
    invoke-static {}, Ll/i9j;->d()Z

    .line 194
    .line 195
    .line 196
    move-result v0

    .line 197
    if-eqz v0, :cond_b

    .line 198
    .line 199
    invoke-static {}, Ll/i9j;->b()V

    .line 200
    .line 201
    .line 202
    :cond_b
    iget-boolean p1, p1, Ll/yi80$a;->m:Z

    .line 203
    .line 204
    iput-boolean p1, p0, Ll/yi80;->m:Z

    .line 205
    .line 206
    return-void
.end method

.method public synthetic constructor <init>(Ll/yi80$a;Ll/zi80;)V
    .locals 0

    .line 207
    invoke-direct {p0, p1}, Ll/yi80;-><init>(Ll/yi80$a;)V

    return-void
.end method

.method public static n()Ll/yi80$a;
    .locals 2

    .line 1
    new-instance v0, Ll/yi80$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/yi80$a;-><init>(Ll/zi80;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    iget p0, p0, Ll/yi80;->k:I

    .line 2
    .line 3
    return p0
.end method

.method public b()I
    .locals 0

    .line 1
    iget p0, p0, Ll/yi80;->j:I

    .line 2
    .line 3
    return p0
.end method

.method public c()Ll/bj80;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yi80;->a:Ll/bj80;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Ll/cj80;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yi80;->b:Ll/cj80;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yi80;->i:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Ll/bj80;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yi80;->c:Ll/bj80;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()Ll/bj80;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yi80;->e:Ll/bj80;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()Ll/cj80;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yi80;->f:Ll/cj80;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()Ll/gqy;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yi80;->d:Ll/gqy;

    .line 2
    .line 3
    return-object p0
.end method

.method public j()Ll/bj80;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yi80;->g:Ll/bj80;

    .line 2
    .line 3
    return-object p0
.end method

.method public k()Ll/cj80;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yi80;->h:Ll/cj80;

    .line 2
    .line 3
    return-object p0
.end method

.method public l()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/yi80;->m:Z

    .line 2
    .line 3
    return p0
.end method

.method public m()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/yi80;->l:Z

    .line 2
    .line 3
    return p0
.end method
