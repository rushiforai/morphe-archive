.class public final Lcom/google/android/exoplayer2/source/rtsp/f$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bsf;
.implements Lcom/google/android/exoplayer2/upstream/Loader$b;
.implements Lcom/google/android/exoplayer2/source/q$d;
.implements Lcom/google/android/exoplayer2/source/rtsp/d$f;
.implements Lcom/google/android/exoplayer2/source/rtsp/d$e;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/source/rtsp/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/bsf;",
        "Lcom/google/android/exoplayer2/upstream/Loader$b<",
        "Lcom/google/android/exoplayer2/source/rtsp/b;",
        ">;",
        "Lcom/google/android/exoplayer2/source/q$d;",
        "Lcom/google/android/exoplayer2/source/rtsp/d$f;",
        "Lcom/google/android/exoplayer2/source/rtsp/d$e;"
    }
.end annotation


# instance fields
.field public final synthetic a:Lcom/google/android/exoplayer2/source/rtsp/f;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer2/source/rtsp/f;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/source/rtsp/f;Lcom/google/android/exoplayer2/source/rtsp/f$a;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer2/source/rtsp/f$b;-><init>(Lcom/google/android/exoplayer2/source/rtsp/f;)V

    return-void
.end method

.method public static synthetic h(Lcom/google/android/exoplayer2/source/rtsp/f;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/google/android/exoplayer2/source/rtsp/f;->C(Lcom/google/android/exoplayer2/source/rtsp/f;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Lcom/google/android/exoplayer2/source/rtsp/f;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/google/android/exoplayer2/source/rtsp/f;->C(Lcom/google/android/exoplayer2/source/rtsp/f;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Lcom/google/android/exoplayer2/k;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/google/android/exoplayer2/source/rtsp/f;->I(Lcom/google/android/exoplayer2/source/rtsp/f;)Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 8
    .line 9
    new-instance v0, Ll/jqd0;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/jqd0;-><init>(Lcom/google/android/exoplayer2/source/rtsp/f;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public b(II)Ll/qfj0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/android/exoplayer2/source/rtsp/f;->H(Lcom/google/android/exoplayer2/source/rtsp/f;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/google/android/exoplayer2/source/rtsp/f$e;

    .line 12
    .line 13
    invoke-static {p0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/google/android/exoplayer2/source/rtsp/f$e;

    .line 18
    .line 19
    invoke-static {p0}, Lcom/google/android/exoplayer2/source/rtsp/f$e;->b(Lcom/google/android/exoplayer2/source/rtsp/f$e;)Lcom/google/android/exoplayer2/source/q;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public c(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1
    .param p2    # Ljava/lang/Throwable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    new-instance p2, Ljava/io/IOException;

    .line 6
    .line 7
    invoke-direct {p2, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    new-instance v0, Ljava/io/IOException;

    .line 12
    .line 13
    invoke-direct {v0, p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 14
    .line 15
    .line 16
    move-object p2, v0

    .line 17
    :goto_0
    invoke-static {p0, p2}, Lcom/google/android/exoplayer2/source/rtsp/f;->a(Lcom/google/android/exoplayer2/source/rtsp/f;Ljava/io/IOException;)Ljava/io/IOException;

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public d()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/exoplayer2/source/rtsp/f;->l(Lcom/google/android/exoplayer2/source/rtsp/f;)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 8
    .line 9
    .line 10
    .line 11
    .line 12
    cmp-long v0, v0, v2

    .line 13
    .line 14
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-static {v1}, Lcom/google/android/exoplayer2/source/rtsp/f;->l(Lcom/google/android/exoplayer2/source/rtsp/f;)J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    invoke-static {v0, v1}, Ll/bmk0;->l1(J)J

    .line 23
    .line 24
    .line 25
    move-result-wide v0

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    invoke-static {v1}, Lcom/google/android/exoplayer2/source/rtsp/f;->o(Lcom/google/android/exoplayer2/source/rtsp/f;)J

    .line 28
    .line 29
    .line 30
    move-result-wide v0

    .line 31
    cmp-long v0, v0, v2

    .line 32
    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 36
    .line 37
    invoke-static {v0}, Lcom/google/android/exoplayer2/source/rtsp/f;->o(Lcom/google/android/exoplayer2/source/rtsp/f;)J

    .line 38
    .line 39
    .line 40
    move-result-wide v0

    .line 41
    invoke-static {v0, v1}, Ll/bmk0;->l1(J)J

    .line 42
    .line 43
    .line 44
    move-result-wide v0

    .line 45
    goto :goto_0

    .line 46
    :cond_1
    const-wide/16 v0, 0x0

    .line 47
    .line 48
    :goto_0
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 49
    .line 50
    invoke-static {p0}, Lcom/google/android/exoplayer2/source/rtsp/f;->M(Lcom/google/android/exoplayer2/source/rtsp/f;)Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0, v0, v1}, Lcom/google/android/exoplayer2/source/rtsp/d;->v0(J)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public e(JLcom/google/common/collect/ImmutableList;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Lcom/google/common/collect/ImmutableList<",
            "Ll/tqd0;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p3}, Ljava/util/AbstractCollection;->size()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 8
    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    move v2, v1

    .line 12
    :goto_0
    invoke-virtual {p3}, Ljava/util/AbstractCollection;->size()I

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    if-ge v2, v3, :cond_0

    .line 17
    .line 18
    invoke-interface {p3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    check-cast v3, Ll/tqd0;

    .line 23
    .line 24
    iget-object v3, v3, Ll/tqd0;->c:Landroid/net/Uri;

    .line 25
    .line 26
    invoke-virtual {v3}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-static {v3}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    check-cast v3, Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    add-int/lit8 v2, v2, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    move v2, v1

    .line 43
    :goto_1
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 44
    .line 45
    invoke-static {v3}, Lcom/google/android/exoplayer2/source/rtsp/f;->u(Lcom/google/android/exoplayer2/source/rtsp/f;)Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    if-ge v2, v3, :cond_2

    .line 59
    .line 60
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 61
    .line 62
    invoke-static {v3}, Lcom/google/android/exoplayer2/source/rtsp/f;->u(Lcom/google/android/exoplayer2/source/rtsp/f;)Ljava/util/List;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    check-cast v3, Lcom/google/android/exoplayer2/source/rtsp/f$d;

    .line 71
    .line 72
    invoke-virtual {v3}, Lcom/google/android/exoplayer2/source/rtsp/f$d;->c()Landroid/net/Uri;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    invoke-virtual {v3}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v3

    .line 84
    if-nez v3, :cond_1

    .line 85
    .line 86
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 87
    .line 88
    invoke-static {v3}, Lcom/google/android/exoplayer2/source/rtsp/f;->v(Lcom/google/android/exoplayer2/source/rtsp/f;)Lcom/google/android/exoplayer2/source/rtsp/f$c;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    invoke-interface {v3}, Lcom/google/android/exoplayer2/source/rtsp/f$c;->a()V

    .line 93
    .line 94
    .line 95
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 96
    .line 97
    invoke-static {v3}, Lcom/google/android/exoplayer2/source/rtsp/f;->w(Lcom/google/android/exoplayer2/source/rtsp/f;)Z

    .line 98
    .line 99
    .line 100
    move-result v3

    .line 101
    if-eqz v3, :cond_1

    .line 102
    .line 103
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 104
    .line 105
    const/4 v6, 0x1

    .line 106
    invoke-static {v3, v6}, Lcom/google/android/exoplayer2/source/rtsp/f;->x(Lcom/google/android/exoplayer2/source/rtsp/f;Z)Z

    .line 107
    .line 108
    .line 109
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 110
    .line 111
    invoke-static {v3, v4, v5}, Lcom/google/android/exoplayer2/source/rtsp/f;->n(Lcom/google/android/exoplayer2/source/rtsp/f;J)J

    .line 112
    .line 113
    .line 114
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 115
    .line 116
    invoke-static {v3, v4, v5}, Lcom/google/android/exoplayer2/source/rtsp/f;->z(Lcom/google/android/exoplayer2/source/rtsp/f;J)J

    .line 117
    .line 118
    .line 119
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 120
    .line 121
    invoke-static {v3, v4, v5}, Lcom/google/android/exoplayer2/source/rtsp/f;->q(Lcom/google/android/exoplayer2/source/rtsp/f;J)J

    .line 122
    .line 123
    .line 124
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 125
    .line 126
    goto :goto_1

    .line 127
    :cond_2
    :goto_2
    invoke-virtual {p3}, Ljava/util/AbstractCollection;->size()I

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    if-ge v1, v0, :cond_5

    .line 132
    .line 133
    invoke-interface {p3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    check-cast v0, Ll/tqd0;

    .line 138
    .line 139
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 140
    .line 141
    iget-object v3, v0, Ll/tqd0;->c:Landroid/net/Uri;

    .line 142
    .line 143
    invoke-static {v2, v3}, Lcom/google/android/exoplayer2/source/rtsp/f;->A(Lcom/google/android/exoplayer2/source/rtsp/f;Landroid/net/Uri;)Lcom/google/android/exoplayer2/source/rtsp/b;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    if-nez v2, :cond_3

    .line 148
    .line 149
    goto :goto_3

    .line 150
    :cond_3
    iget-wide v6, v0, Ll/tqd0;->a:J

    .line 151
    .line 152
    invoke-virtual {v2, v6, v7}, Lcom/google/android/exoplayer2/source/rtsp/b;->g(J)V

    .line 153
    .line 154
    .line 155
    iget v3, v0, Ll/tqd0;->b:I

    .line 156
    .line 157
    invoke-virtual {v2, v3}, Lcom/google/android/exoplayer2/source/rtsp/b;->f(I)V

    .line 158
    .line 159
    .line 160
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 161
    .line 162
    invoke-static {v3}, Lcom/google/android/exoplayer2/source/rtsp/f;->w(Lcom/google/android/exoplayer2/source/rtsp/f;)Z

    .line 163
    .line 164
    .line 165
    move-result v3

    .line 166
    if-eqz v3, :cond_4

    .line 167
    .line 168
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 169
    .line 170
    invoke-static {v3}, Lcom/google/android/exoplayer2/source/rtsp/f;->l(Lcom/google/android/exoplayer2/source/rtsp/f;)J

    .line 171
    .line 172
    .line 173
    move-result-wide v6

    .line 174
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 175
    .line 176
    invoke-static {v3}, Lcom/google/android/exoplayer2/source/rtsp/f;->y(Lcom/google/android/exoplayer2/source/rtsp/f;)J

    .line 177
    .line 178
    .line 179
    move-result-wide v8

    .line 180
    cmp-long v3, v6, v8

    .line 181
    .line 182
    if-nez v3, :cond_4

    .line 183
    .line 184
    iget-wide v6, v0, Ll/tqd0;->a:J

    .line 185
    .line 186
    invoke-virtual {v2, p1, p2, v6, v7}, Lcom/google/android/exoplayer2/source/rtsp/b;->e(JJ)V

    .line 187
    .line 188
    .line 189
    :cond_4
    :goto_3
    add-int/lit8 v1, v1, 0x1

    .line 190
    .line 191
    goto :goto_2

    .line 192
    :cond_5
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 193
    .line 194
    invoke-static {p1}, Lcom/google/android/exoplayer2/source/rtsp/f;->w(Lcom/google/android/exoplayer2/source/rtsp/f;)Z

    .line 195
    .line 196
    .line 197
    move-result p1

    .line 198
    iget-object p2, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 199
    .line 200
    if-eqz p1, :cond_7

    .line 201
    .line 202
    invoke-static {p2}, Lcom/google/android/exoplayer2/source/rtsp/f;->l(Lcom/google/android/exoplayer2/source/rtsp/f;)J

    .line 203
    .line 204
    .line 205
    move-result-wide p1

    .line 206
    iget-object p3, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 207
    .line 208
    invoke-static {p3}, Lcom/google/android/exoplayer2/source/rtsp/f;->y(Lcom/google/android/exoplayer2/source/rtsp/f;)J

    .line 209
    .line 210
    .line 211
    move-result-wide v0

    .line 212
    cmp-long p1, p1, v0

    .line 213
    .line 214
    iget-object p2, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 215
    .line 216
    if-nez p1, :cond_6

    .line 217
    .line 218
    invoke-static {p2, v4, v5}, Lcom/google/android/exoplayer2/source/rtsp/f;->n(Lcom/google/android/exoplayer2/source/rtsp/f;J)J

    .line 219
    .line 220
    .line 221
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 222
    .line 223
    invoke-static {p0, v4, v5}, Lcom/google/android/exoplayer2/source/rtsp/f;->z(Lcom/google/android/exoplayer2/source/rtsp/f;J)J

    .line 224
    .line 225
    .line 226
    return-void

    .line 227
    :cond_6
    invoke-static {p2, v4, v5}, Lcom/google/android/exoplayer2/source/rtsp/f;->n(Lcom/google/android/exoplayer2/source/rtsp/f;J)J

    .line 228
    .line 229
    .line 230
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 231
    .line 232
    invoke-static {p0}, Lcom/google/android/exoplayer2/source/rtsp/f;->y(Lcom/google/android/exoplayer2/source/rtsp/f;)J

    .line 233
    .line 234
    .line 235
    move-result-wide p1

    .line 236
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer2/source/rtsp/f;->h(J)J

    .line 237
    .line 238
    .line 239
    return-void

    .line 240
    :cond_7
    invoke-static {p2}, Lcom/google/android/exoplayer2/source/rtsp/f;->o(Lcom/google/android/exoplayer2/source/rtsp/f;)J

    .line 241
    .line 242
    .line 243
    move-result-wide p1

    .line 244
    cmp-long p1, p1, v4

    .line 245
    .line 246
    if-eqz p1, :cond_8

    .line 247
    .line 248
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 249
    .line 250
    invoke-static {p1}, Lcom/google/android/exoplayer2/source/rtsp/f;->J(Lcom/google/android/exoplayer2/source/rtsp/f;)Z

    .line 251
    .line 252
    .line 253
    move-result p1

    .line 254
    if-eqz p1, :cond_8

    .line 255
    .line 256
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 257
    .line 258
    invoke-static {p1}, Lcom/google/android/exoplayer2/source/rtsp/f;->o(Lcom/google/android/exoplayer2/source/rtsp/f;)J

    .line 259
    .line 260
    .line 261
    move-result-wide p2

    .line 262
    invoke-virtual {p1, p2, p3}, Lcom/google/android/exoplayer2/source/rtsp/f;->h(J)J

    .line 263
    .line 264
    .line 265
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 266
    .line 267
    invoke-static {p0, v4, v5}, Lcom/google/android/exoplayer2/source/rtsp/f;->q(Lcom/google/android/exoplayer2/source/rtsp/f;J)J

    .line 268
    .line 269
    .line 270
    :cond_8
    return-void
.end method

.method public f(Ll/sqd0;Lcom/google/common/collect/ImmutableList;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/sqd0;",
            "Lcom/google/common/collect/ImmutableList<",
            "Ll/lqd0;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    invoke-virtual {p2}, Ljava/util/AbstractCollection;->size()I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    if-ge v0, v1, :cond_0

    .line 7
    .line 8
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Ll/lqd0;

    .line 13
    .line 14
    new-instance v2, Lcom/google/android/exoplayer2/source/rtsp/f$e;

    .line 15
    .line 16
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 17
    .line 18
    invoke-static {v3}, Lcom/google/android/exoplayer2/source/rtsp/f;->B(Lcom/google/android/exoplayer2/source/rtsp/f;)Lcom/google/android/exoplayer2/source/rtsp/a$a;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    invoke-direct {v2, v3, v1, v0, v4}, Lcom/google/android/exoplayer2/source/rtsp/f$e;-><init>(Lcom/google/android/exoplayer2/source/rtsp/f;Ll/lqd0;ILcom/google/android/exoplayer2/source/rtsp/a$a;)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 26
    .line 27
    invoke-static {v1}, Lcom/google/android/exoplayer2/source/rtsp/f;->H(Lcom/google/android/exoplayer2/source/rtsp/f;)Ljava/util/List;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/source/rtsp/f$e;->k()V

    .line 35
    .line 36
    .line 37
    add-int/lit8 v0, v0, 0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 41
    .line 42
    invoke-static {p0}, Lcom/google/android/exoplayer2/source/rtsp/f;->v(Lcom/google/android/exoplayer2/source/rtsp/f;)Lcom/google/android/exoplayer2/source/rtsp/f$c;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-interface {p0, p1}, Lcom/google/android/exoplayer2/source/rtsp/f$c;->b(Ll/sqd0;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public g(Lcom/google/android/exoplayer2/source/rtsp/RtspMediaSource$RtspPlaybackException;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/google/android/exoplayer2/source/rtsp/RtspMediaSource$RtspUdpUnsupportedTransportException;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/google/android/exoplayer2/source/rtsp/f;->J(Lcom/google/android/exoplayer2/source/rtsp/f;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/google/android/exoplayer2/source/rtsp/f;->L(Lcom/google/android/exoplayer2/source/rtsp/f;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 20
    .line 21
    invoke-static {p0, p1}, Lcom/google/android/exoplayer2/source/rtsp/f;->k(Lcom/google/android/exoplayer2/source/rtsp/f;Lcom/google/android/exoplayer2/source/rtsp/RtspMediaSource$RtspPlaybackException;)Lcom/google/android/exoplayer2/source/rtsp/RtspMediaSource$RtspPlaybackException;

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public j(Lcom/google/android/exoplayer2/source/rtsp/b;JJZ)V
    .locals 0

    .line 1
    return-void
.end method

.method public k(Ll/mke0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public l()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/exoplayer2/source/rtsp/f;->I(Lcom/google/android/exoplayer2/source/rtsp/f;)Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 8
    .line 9
    new-instance v1, Ll/iqd0;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/iqd0;-><init>(Lcom/google/android/exoplayer2/source/rtsp/f;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public m(Lcom/google/android/exoplayer2/source/rtsp/b;JJ)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/google/android/exoplayer2/source/rtsp/f;->d()J

    .line 4
    .line 5
    .line 6
    move-result-wide p2

    .line 7
    const-wide/16 p4, 0x0

    .line 8
    .line 9
    cmp-long p2, p2, p4

    .line 10
    .line 11
    if-nez p2, :cond_1

    .line 12
    .line 13
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 14
    .line 15
    invoke-static {p1}, Lcom/google/android/exoplayer2/source/rtsp/f;->J(Lcom/google/android/exoplayer2/source/rtsp/f;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 22
    .line 23
    invoke-static {p0}, Lcom/google/android/exoplayer2/source/rtsp/f;->L(Lcom/google/android/exoplayer2/source/rtsp/f;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void

    .line 27
    :cond_1
    const/4 p2, 0x0

    .line 28
    :goto_0
    iget-object p3, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 29
    .line 30
    invoke-static {p3}, Lcom/google/android/exoplayer2/source/rtsp/f;->H(Lcom/google/android/exoplayer2/source/rtsp/f;)Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object p3

    .line 34
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 35
    .line 36
    .line 37
    move-result p3

    .line 38
    if-ge p2, p3, :cond_3

    .line 39
    .line 40
    iget-object p3, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 41
    .line 42
    invoke-static {p3}, Lcom/google/android/exoplayer2/source/rtsp/f;->H(Lcom/google/android/exoplayer2/source/rtsp/f;)Ljava/util/List;

    .line 43
    .line 44
    .line 45
    move-result-object p3

    .line 46
    invoke-interface {p3, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p3

    .line 50
    check-cast p3, Lcom/google/android/exoplayer2/source/rtsp/f$e;

    .line 51
    .line 52
    iget-object p4, p3, Lcom/google/android/exoplayer2/source/rtsp/f$e;->a:Lcom/google/android/exoplayer2/source/rtsp/f$d;

    .line 53
    .line 54
    invoke-static {p4}, Lcom/google/android/exoplayer2/source/rtsp/f$d;->b(Lcom/google/android/exoplayer2/source/rtsp/f$d;)Lcom/google/android/exoplayer2/source/rtsp/b;

    .line 55
    .line 56
    .line 57
    move-result-object p4

    .line 58
    if-ne p4, p1, :cond_2

    .line 59
    .line 60
    invoke-virtual {p3}, Lcom/google/android/exoplayer2/source/rtsp/f$e;->c()V

    .line 61
    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_2
    add-int/lit8 p2, p2, 0x1

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_3
    :goto_1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 68
    .line 69
    invoke-static {p0}, Lcom/google/android/exoplayer2/source/rtsp/f;->M(Lcom/google/android/exoplayer2/source/rtsp/f;)Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/rtsp/d;->t0()V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public bridge synthetic n(Lcom/google/android/exoplayer2/upstream/Loader$e;JJZ)V
    .locals 0

    .line 1
    check-cast p1, Lcom/google/android/exoplayer2/source/rtsp/b;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p6}, Lcom/google/android/exoplayer2/source/rtsp/f$b;->j(Lcom/google/android/exoplayer2/source/rtsp/b;JJZ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic o(Lcom/google/android/exoplayer2/upstream/Loader$e;JJ)V
    .locals 0

    .line 1
    check-cast p1, Lcom/google/android/exoplayer2/source/rtsp/b;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p5}, Lcom/google/android/exoplayer2/source/rtsp/f$b;->m(Lcom/google/android/exoplayer2/source/rtsp/b;JJ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p(Lcom/google/android/exoplayer2/source/rtsp/b;JJLjava/io/IOException;I)Lcom/google/android/exoplayer2/upstream/Loader$c;
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/google/android/exoplayer2/source/rtsp/f;->N(Lcom/google/android/exoplayer2/source/rtsp/f;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 10
    .line 11
    invoke-static {p0, p6}, Lcom/google/android/exoplayer2/source/rtsp/f;->a(Lcom/google/android/exoplayer2/source/rtsp/f;Ljava/io/IOException;)Ljava/io/IOException;

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-virtual {p6}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    instance-of p2, p2, Ljava/net/BindException;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/rtsp/f$b;->a:Lcom/google/android/exoplayer2/source/rtsp/f;

    .line 22
    .line 23
    if-eqz p2, :cond_1

    .line 24
    .line 25
    invoke-static {p0}, Lcom/google/android/exoplayer2/source/rtsp/f;->b(Lcom/google/android/exoplayer2/source/rtsp/f;)I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    const/4 p1, 0x3

    .line 30
    if-ge p0, p1, :cond_2

    .line 31
    .line 32
    sget-object p0, Lcom/google/android/exoplayer2/upstream/Loader;->d:Lcom/google/android/exoplayer2/upstream/Loader$c;

    .line 33
    .line 34
    return-object p0

    .line 35
    :cond_1
    new-instance p2, Lcom/google/android/exoplayer2/source/rtsp/RtspMediaSource$RtspPlaybackException;

    .line 36
    .line 37
    iget-object p1, p1, Lcom/google/android/exoplayer2/source/rtsp/b;->b:Ll/lqd0;

    .line 38
    .line 39
    iget-object p1, p1, Ll/lqd0;->b:Landroid/net/Uri;

    .line 40
    .line 41
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-direct {p2, p1, p6}, Lcom/google/android/exoplayer2/source/rtsp/RtspMediaSource$RtspPlaybackException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 46
    .line 47
    .line 48
    invoke-static {p0, p2}, Lcom/google/android/exoplayer2/source/rtsp/f;->k(Lcom/google/android/exoplayer2/source/rtsp/f;Lcom/google/android/exoplayer2/source/rtsp/RtspMediaSource$RtspPlaybackException;)Lcom/google/android/exoplayer2/source/rtsp/RtspMediaSource$RtspPlaybackException;

    .line 49
    .line 50
    .line 51
    :cond_2
    :goto_0
    sget-object p0, Lcom/google/android/exoplayer2/upstream/Loader;->f:Lcom/google/android/exoplayer2/upstream/Loader$c;

    .line 52
    .line 53
    return-object p0
.end method

.method public bridge synthetic q(Lcom/google/android/exoplayer2/upstream/Loader$e;JJLjava/io/IOException;I)Lcom/google/android/exoplayer2/upstream/Loader$c;
    .locals 0

    .line 1
    check-cast p1, Lcom/google/android/exoplayer2/source/rtsp/b;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p7}, Lcom/google/android/exoplayer2/source/rtsp/f$b;->p(Lcom/google/android/exoplayer2/source/rtsp/b;JJLjava/io/IOException;I)Lcom/google/android/exoplayer2/upstream/Loader$c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
