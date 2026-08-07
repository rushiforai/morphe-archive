.class public Ll/q23$a;
.super Ll/pud;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/q23;->g(Ll/z06;Ll/by3;Z)Ll/z06;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/pud<",
        "Ll/fb5<",
        "Ll/db5;",
        ">;",
        "Ll/fb5<",
        "Ll/db5;",
        ">;>;"
    }
.end annotation


# instance fields
.field public final synthetic c:Ll/by3;

.field public final synthetic d:Z

.field public final synthetic e:Ll/q23;


# direct methods
.method public constructor <init>(Ll/q23;Ll/z06;Ll/by3;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/q23$a;->e:Ll/q23;

    .line 2
    .line 3
    iput-object p3, p0, Ll/q23$a;->c:Ll/by3;

    .line 4
    .line 5
    iput-boolean p4, p0, Ll/q23$a;->d:Z

    .line 6
    .line 7
    invoke-direct {p0, p2}, Ll/pud;-><init>(Ll/z06;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public bridge synthetic h(Ljava/lang/Object;I)V
    .locals 0

    .line 1
    check-cast p1, Ll/fb5;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/q23$a;->p(Ll/fb5;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p(Ll/fb5;I)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/fb5<",
            "Ll/db5;",
            ">;I)V"
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-static {}, Ll/i9j;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "BitmapMemoryCacheProducer#onNewResultImpl"

    .line 8
    .line 9
    invoke-static {v0}, Ll/i9j;->a(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-static {p2}, Ll/ji2;->d(I)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v1, 0x0

    .line 17
    if-nez p1, :cond_2

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/pud;->o()Ll/z06;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-interface {p0, v1, p2}, Ll/z06;->b(Ljava/lang/Object;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 26
    .line 27
    .line 28
    :cond_1
    invoke-static {}, Ll/i9j;->d()Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-eqz p0, :cond_b

    .line 33
    .line 34
    invoke-static {}, Ll/i9j;->b()V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_2
    :try_start_1
    invoke-virtual {p1}, Ll/fb5;->B()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    check-cast v2, Ll/db5;

    .line 43
    .line 44
    invoke-interface {v2}, Ll/db5;->g0()Z

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-nez v2, :cond_a

    .line 49
    .line 50
    const/16 v2, 0x8

    .line 51
    .line 52
    invoke-static {p2, v2}, Ll/ji2;->m(II)Z

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    if-eqz v2, :cond_3

    .line 57
    .line 58
    goto/16 :goto_5

    .line 59
    .line 60
    :cond_3
    if-nez v0, :cond_6

    .line 61
    .line 62
    iget-object v2, p0, Ll/q23$a;->e:Ll/q23;

    .line 63
    .line 64
    invoke-static {v2}, Ll/q23;->c(Ll/q23;)Ll/mpy;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    iget-object v3, p0, Ll/q23$a;->c:Ll/by3;

    .line 69
    .line 70
    invoke-interface {v2, v3}, Ll/mpy;->get(Ljava/lang/Object;)Ll/fb5;

    .line 71
    .line 72
    .line 73
    move-result-object v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 74
    if-eqz v2, :cond_6

    .line 75
    .line 76
    :try_start_2
    invoke-virtual {p1}, Ll/fb5;->B()Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    check-cast v3, Ll/db5;

    .line 81
    .line 82
    invoke-interface {v3}, Ll/db5;->Y()Ll/qvb0;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    invoke-virtual {v2}, Ll/fb5;->B()Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v4

    .line 90
    check-cast v4, Ll/db5;

    .line 91
    .line 92
    invoke-interface {v4}, Ll/db5;->Y()Ll/qvb0;

    .line 93
    .line 94
    .line 95
    move-result-object v4

    .line 96
    invoke-interface {v4}, Ll/qvb0;->a()Z

    .line 97
    .line 98
    .line 99
    move-result v5

    .line 100
    if-nez v5, :cond_5

    .line 101
    .line 102
    invoke-interface {v4}, Ll/qvb0;->c()I

    .line 103
    .line 104
    .line 105
    move-result v4

    .line 106
    invoke-interface {v3}, Ll/qvb0;->c()I

    .line 107
    .line 108
    .line 109
    move-result v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 110
    if-lt v4, v3, :cond_4

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_4
    :try_start_3
    invoke-static {v2}, Ll/fb5;->v(Ll/fb5;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 114
    .line 115
    .line 116
    goto :goto_2

    .line 117
    :catchall_0
    move-exception p0

    .line 118
    goto :goto_1

    .line 119
    :cond_5
    :goto_0
    :try_start_4
    invoke-virtual {p0}, Ll/pud;->o()Ll/z06;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-interface {p0, v2, p2}, Ll/z06;->b(Ljava/lang/Object;I)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 124
    .line 125
    .line 126
    :try_start_5
    invoke-static {v2}, Ll/fb5;->v(Ll/fb5;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 127
    .line 128
    .line 129
    invoke-static {}, Ll/i9j;->d()Z

    .line 130
    .line 131
    .line 132
    move-result p0

    .line 133
    if-eqz p0, :cond_b

    .line 134
    .line 135
    invoke-static {}, Ll/i9j;->b()V

    .line 136
    .line 137
    .line 138
    return-void

    .line 139
    :goto_1
    :try_start_6
    invoke-static {v2}, Ll/fb5;->v(Ll/fb5;)V

    .line 140
    .line 141
    .line 142
    throw p0

    .line 143
    :cond_6
    :goto_2
    iget-boolean v2, p0, Ll/q23$a;->d:Z

    .line 144
    .line 145
    if-eqz v2, :cond_7

    .line 146
    .line 147
    iget-object v1, p0, Ll/q23$a;->e:Ll/q23;

    .line 148
    .line 149
    invoke-static {v1}, Ll/q23;->c(Ll/q23;)Ll/mpy;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    iget-object v2, p0, Ll/q23$a;->c:Ll/by3;

    .line 154
    .line 155
    invoke-interface {v1, v2, p1}, Ll/mpy;->b(Ljava/lang/Object;Ll/fb5;)Ll/fb5;

    .line 156
    .line 157
    .line 158
    move-result-object v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 159
    :cond_7
    if-eqz v0, :cond_8

    .line 160
    .line 161
    :try_start_7
    invoke-virtual {p0}, Ll/pud;->o()Ll/z06;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    const/high16 v2, 0x3f800000    # 1.0f

    .line 166
    .line 167
    invoke-interface {v0, v2}, Ll/z06;->c(F)V

    .line 168
    .line 169
    .line 170
    goto :goto_3

    .line 171
    :catchall_1
    move-exception p0

    .line 172
    goto :goto_4

    .line 173
    :cond_8
    :goto_3
    invoke-virtual {p0}, Ll/pud;->o()Ll/z06;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    if-eqz v1, :cond_9

    .line 178
    .line 179
    move-object p1, v1

    .line 180
    :cond_9
    invoke-interface {p0, p1, p2}, Ll/z06;->b(Ljava/lang/Object;I)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 181
    .line 182
    .line 183
    :try_start_8
    invoke-static {v1}, Ll/fb5;->v(Ll/fb5;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 184
    .line 185
    .line 186
    invoke-static {}, Ll/i9j;->d()Z

    .line 187
    .line 188
    .line 189
    move-result p0

    .line 190
    if-eqz p0, :cond_b

    .line 191
    .line 192
    invoke-static {}, Ll/i9j;->b()V

    .line 193
    .line 194
    .line 195
    return-void

    .line 196
    :goto_4
    :try_start_9
    invoke-static {v1}, Ll/fb5;->v(Ll/fb5;)V

    .line 197
    .line 198
    .line 199
    throw p0

    .line 200
    :cond_a
    :goto_5
    invoke-virtual {p0}, Ll/pud;->o()Ll/z06;

    .line 201
    .line 202
    .line 203
    move-result-object p0

    .line 204
    invoke-interface {p0, p1, p2}, Ll/z06;->b(Ljava/lang/Object;I)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 205
    .line 206
    .line 207
    invoke-static {}, Ll/i9j;->d()Z

    .line 208
    .line 209
    .line 210
    move-result p0

    .line 211
    if-eqz p0, :cond_b

    .line 212
    .line 213
    invoke-static {}, Ll/i9j;->b()V

    .line 214
    .line 215
    .line 216
    :cond_b
    return-void

    .line 217
    :catchall_2
    move-exception p0

    .line 218
    invoke-static {}, Ll/i9j;->d()Z

    .line 219
    .line 220
    .line 221
    move-result p1

    .line 222
    if-eqz p1, :cond_c

    .line 223
    .line 224
    invoke-static {}, Ll/i9j;->b()V

    .line 225
    .line 226
    .line 227
    :cond_c
    throw p0
.end method
