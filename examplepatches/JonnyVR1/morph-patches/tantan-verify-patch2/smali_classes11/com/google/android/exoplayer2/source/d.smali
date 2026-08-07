.class public final Lcom/google/android/exoplayer2/source/d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/exoplayer2/source/k;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer2/source/d$a;,
        Lcom/google/android/exoplayer2/source/d$b;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final c:Lcom/google/android/exoplayer2/source/d$a;

.field public d:Ll/g6c$a;

.field public e:Lcom/google/android/exoplayer2/source/i$a;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public f:Lcom/google/android/exoplayer2/upstream/c;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public g:J

.field public h:J

.field public i:J

.field public j:F

.field public k:F

.field public l:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/esf;)V
    .locals 1

    .line 36
    new-instance v0, Ll/vnd$a;

    invoke-direct {v0, p1}, Ll/vnd$a;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, v0, p2}, Lcom/google/android/exoplayer2/source/d;-><init>(Ll/g6c$a;Ll/esf;)V

    return-void
.end method

.method public constructor <init>(Ll/g6c$a;)V
    .locals 1

    .line 35
    new-instance v0, Ll/tod;

    invoke-direct {v0}, Ll/tod;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/google/android/exoplayer2/source/d;-><init>(Ll/g6c$a;Ll/esf;)V

    return-void
.end method

.method public constructor <init>(Ll/g6c$a;Ll/esf;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/d;->d:Ll/g6c$a;

    .line 5
    .line 6
    new-instance v0, Lcom/google/android/exoplayer2/source/d$a;

    .line 7
    .line 8
    invoke-direct {v0, p2}, Lcom/google/android/exoplayer2/source/d$a;-><init>(Ll/esf;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/google/android/exoplayer2/source/d;->c:Lcom/google/android/exoplayer2/source/d$a;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer2/source/d$a;->i(Ll/g6c$a;)V

    .line 14
    .line 15
    .line 16
    const-wide p1, -0x7fffffffffffffffL    # -4.9E-324

    .line 17
    .line 18
    .line 19
    .line 20
    .line 21
    iput-wide p1, p0, Lcom/google/android/exoplayer2/source/d;->g:J

    .line 22
    .line 23
    iput-wide p1, p0, Lcom/google/android/exoplayer2/source/d;->h:J

    .line 24
    .line 25
    iput-wide p1, p0, Lcom/google/android/exoplayer2/source/d;->i:J

    .line 26
    .line 27
    const p1, -0x800001

    .line 28
    .line 29
    .line 30
    iput p1, p0, Lcom/google/android/exoplayer2/source/d;->j:F

    .line 31
    .line 32
    iput p1, p0, Lcom/google/android/exoplayer2/source/d;->k:F

    .line 33
    .line 34
    return-void
.end method

.method public static synthetic e(Lcom/google/android/exoplayer2/k;)[Ll/zrf;
    .locals 2

    .line 1
    sget-object v0, Ll/pdg0;->a:Ll/pdg0;

    .line 2
    .line 3
    invoke-interface {v0, p0}, Ll/pdg0;->a(Lcom/google/android/exoplayer2/k;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    new-instance v1, Ll/qdg0;

    .line 10
    .line 11
    invoke-interface {v0, p0}, Ll/pdg0;->b(Lcom/google/android/exoplayer2/k;)Ll/odg0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-direct {v1, v0, p0}, Ll/qdg0;-><init>(Ll/odg0;Lcom/google/android/exoplayer2/k;)V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    new-instance v1, Lcom/google/android/exoplayer2/source/d$b;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Lcom/google/android/exoplayer2/source/d$b;-><init>(Lcom/google/android/exoplayer2/k;)V

    .line 22
    .line 23
    .line 24
    :goto_0
    const/4 p0, 0x1

    .line 25
    new-array p0, p0, [Ll/zrf;

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    aput-object v1, p0, v0

    .line 29
    .line 30
    return-object p0
.end method

.method public static synthetic f(Ljava/lang/Class;)Lcom/google/android/exoplayer2/source/i$a;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/google/android/exoplayer2/source/d;->j(Ljava/lang/Class;)Lcom/google/android/exoplayer2/source/i$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic g(Ljava/lang/Class;Ll/g6c$a;)Lcom/google/android/exoplayer2/source/i$a;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/google/android/exoplayer2/source/d;->k(Ljava/lang/Class;Ll/g6c$a;)Lcom/google/android/exoplayer2/source/i$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static h(Lcom/google/android/exoplayer2/n;Lcom/google/android/exoplayer2/source/i;)Lcom/google/android/exoplayer2/source/i;
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/n;->f:Lcom/google/android/exoplayer2/n$d;

    .line 2
    .line 3
    iget-wide v1, v0, Lcom/google/android/exoplayer2/n$d;->a:J

    .line 4
    .line 5
    const-wide/16 v3, 0x0

    .line 6
    .line 7
    cmp-long v1, v1, v3

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    iget-wide v1, v0, Lcom/google/android/exoplayer2/n$d;->b:J

    .line 12
    .line 13
    const-wide/high16 v3, -0x8000000000000000L

    .line 14
    .line 15
    cmp-long v1, v1, v3

    .line 16
    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    iget-boolean v0, v0, Lcom/google/android/exoplayer2/n$d;->d:Z

    .line 20
    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    return-object p1

    .line 24
    :cond_0
    new-instance v1, Lcom/google/android/exoplayer2/source/ClippingMediaSource;

    .line 25
    .line 26
    iget-object v0, p0, Lcom/google/android/exoplayer2/n;->f:Lcom/google/android/exoplayer2/n$d;

    .line 27
    .line 28
    iget-wide v2, v0, Lcom/google/android/exoplayer2/n$d;->a:J

    .line 29
    .line 30
    invoke-static {v2, v3}, Ll/bmk0;->J0(J)J

    .line 31
    .line 32
    .line 33
    move-result-wide v3

    .line 34
    iget-object v0, p0, Lcom/google/android/exoplayer2/n;->f:Lcom/google/android/exoplayer2/n$d;

    .line 35
    .line 36
    iget-wide v5, v0, Lcom/google/android/exoplayer2/n$d;->b:J

    .line 37
    .line 38
    invoke-static {v5, v6}, Ll/bmk0;->J0(J)J

    .line 39
    .line 40
    .line 41
    move-result-wide v5

    .line 42
    iget-object p0, p0, Lcom/google/android/exoplayer2/n;->f:Lcom/google/android/exoplayer2/n$d;

    .line 43
    .line 44
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/n$d;->e:Z

    .line 45
    .line 46
    xor-int/lit8 v7, v0, 0x1

    .line 47
    .line 48
    iget-boolean v8, p0, Lcom/google/android/exoplayer2/n$d;->c:Z

    .line 49
    .line 50
    iget-boolean v9, p0, Lcom/google/android/exoplayer2/n$d;->d:Z

    .line 51
    .line 52
    move-object v2, p1

    .line 53
    invoke-direct/range {v1 .. v9}, Lcom/google/android/exoplayer2/source/ClippingMediaSource;-><init>(Lcom/google/android/exoplayer2/source/i;JJZZZ)V

    .line 54
    .line 55
    .line 56
    return-object v1
.end method

.method public static j(Ljava/lang/Class;)Lcom/google/android/exoplayer2/source/i$a;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Lcom/google/android/exoplayer2/source/i$a;",
            ">;)",
            "Lcom/google/android/exoplayer2/source/i$a;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-virtual {p0, v0}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    invoke-virtual {p0, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/google/android/exoplayer2/source/i$a;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    return-object p0

    .line 13
    :catch_0
    move-exception p0

    .line 14
    invoke-static {p0}, Ll/xpg0;->a(Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return-object p0
.end method

.method public static k(Ljava/lang/Class;Ll/g6c$a;)Lcom/google/android/exoplayer2/source/i$a;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Lcom/google/android/exoplayer2/source/i$a;",
            ">;",
            "Ll/g6c$a;",
            ")",
            "Lcom/google/android/exoplayer2/source/i$a;"
        }
    .end annotation

    .line 1
    :try_start_0
    const-class v0, Ll/g6c$a;

    .line 2
    .line 3
    filled-new-array {v0}, [Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Lcom/google/android/exoplayer2/source/i$a;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    .line 21
    return-object p0

    .line 22
    :catch_0
    move-exception p0

    .line 23
    invoke-static {p0}, Ll/xpg0;->a(Ljava/lang/Throwable;)V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    return-object p0
.end method


# virtual methods
.method public bridge synthetic a(Ll/zde;)Lcom/google/android/exoplayer2/source/i$a;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/d;->m(Ll/zde;)Lcom/google/android/exoplayer2/source/d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic b(Lcom/google/android/exoplayer2/upstream/c;)Lcom/google/android/exoplayer2/source/i$a;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/d;->n(Lcom/google/android/exoplayer2/upstream/c;)Lcom/google/android/exoplayer2/source/d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c(Lcom/google/android/exoplayer2/n;)Lcom/google/android/exoplayer2/source/i;
    .locals 8

    .line 1
    iget-object v0, p1, Lcom/google/android/exoplayer2/n;->b:Lcom/google/android/exoplayer2/n$h;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lcom/google/android/exoplayer2/n;->b:Lcom/google/android/exoplayer2/n$h;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/google/android/exoplayer2/n$h;->a:Landroid/net/Uri;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    const-string v1, "ssai"

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/d;->e:Lcom/google/android/exoplayer2/source/i$a;

    .line 25
    .line 26
    invoke-static {p0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Lcom/google/android/exoplayer2/source/i$a;

    .line 31
    .line 32
    invoke-interface {p0, p1}, Lcom/google/android/exoplayer2/source/i$a;->c(Lcom/google/android/exoplayer2/n;)Lcom/google/android/exoplayer2/source/i;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0

    .line 37
    :cond_0
    iget-object v0, p1, Lcom/google/android/exoplayer2/n;->b:Lcom/google/android/exoplayer2/n$h;

    .line 38
    .line 39
    iget-object v1, v0, Lcom/google/android/exoplayer2/n$h;->a:Landroid/net/Uri;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/google/android/exoplayer2/n$h;->b:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v1, v0}, Ll/bmk0;->x0(Landroid/net/Uri;Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/d;->c:Lcom/google/android/exoplayer2/source/d$a;

    .line 48
    .line 49
    invoke-virtual {v1, v0}, Lcom/google/android/exoplayer2/source/d$a;->f(I)Lcom/google/android/exoplayer2/source/i$a;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    new-instance v2, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    const-string v3, "No suitable media source factory found for content type: "

    .line 56
    .line 57
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-static {v1, v0}, Ll/w11;->j(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    iget-object v0, p1, Lcom/google/android/exoplayer2/n;->d:Lcom/google/android/exoplayer2/n$g;

    .line 71
    .line 72
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/n$g;->b()Lcom/google/android/exoplayer2/n$g$a;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    iget-object v2, p1, Lcom/google/android/exoplayer2/n;->d:Lcom/google/android/exoplayer2/n$g;

    .line 77
    .line 78
    iget-wide v2, v2, Lcom/google/android/exoplayer2/n$g;->a:J

    .line 79
    .line 80
    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    .line 81
    .line 82
    .line 83
    .line 84
    .line 85
    cmp-long v2, v2, v4

    .line 86
    .line 87
    if-nez v2, :cond_1

    .line 88
    .line 89
    iget-wide v2, p0, Lcom/google/android/exoplayer2/source/d;->g:J

    .line 90
    .line 91
    invoke-virtual {v0, v2, v3}, Lcom/google/android/exoplayer2/n$g$a;->k(J)Lcom/google/android/exoplayer2/n$g$a;

    .line 92
    .line 93
    .line 94
    :cond_1
    iget-object v2, p1, Lcom/google/android/exoplayer2/n;->d:Lcom/google/android/exoplayer2/n$g;

    .line 95
    .line 96
    iget v2, v2, Lcom/google/android/exoplayer2/n$g;->d:F

    .line 97
    .line 98
    const v3, -0x800001

    .line 99
    .line 100
    .line 101
    cmpl-float v2, v2, v3

    .line 102
    .line 103
    if-nez v2, :cond_2

    .line 104
    .line 105
    iget v2, p0, Lcom/google/android/exoplayer2/source/d;->j:F

    .line 106
    .line 107
    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer2/n$g$a;->j(F)Lcom/google/android/exoplayer2/n$g$a;

    .line 108
    .line 109
    .line 110
    :cond_2
    iget-object v2, p1, Lcom/google/android/exoplayer2/n;->d:Lcom/google/android/exoplayer2/n$g;

    .line 111
    .line 112
    iget v2, v2, Lcom/google/android/exoplayer2/n$g;->e:F

    .line 113
    .line 114
    cmpl-float v2, v2, v3

    .line 115
    .line 116
    if-nez v2, :cond_3

    .line 117
    .line 118
    iget v2, p0, Lcom/google/android/exoplayer2/source/d;->k:F

    .line 119
    .line 120
    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer2/n$g$a;->h(F)Lcom/google/android/exoplayer2/n$g$a;

    .line 121
    .line 122
    .line 123
    :cond_3
    iget-object v2, p1, Lcom/google/android/exoplayer2/n;->d:Lcom/google/android/exoplayer2/n$g;

    .line 124
    .line 125
    iget-wide v2, v2, Lcom/google/android/exoplayer2/n$g;->b:J

    .line 126
    .line 127
    cmp-long v2, v2, v4

    .line 128
    .line 129
    if-nez v2, :cond_4

    .line 130
    .line 131
    iget-wide v2, p0, Lcom/google/android/exoplayer2/source/d;->h:J

    .line 132
    .line 133
    invoke-virtual {v0, v2, v3}, Lcom/google/android/exoplayer2/n$g$a;->i(J)Lcom/google/android/exoplayer2/n$g$a;

    .line 134
    .line 135
    .line 136
    :cond_4
    iget-object v2, p1, Lcom/google/android/exoplayer2/n;->d:Lcom/google/android/exoplayer2/n$g;

    .line 137
    .line 138
    iget-wide v2, v2, Lcom/google/android/exoplayer2/n$g;->c:J

    .line 139
    .line 140
    cmp-long v2, v2, v4

    .line 141
    .line 142
    if-nez v2, :cond_5

    .line 143
    .line 144
    iget-wide v2, p0, Lcom/google/android/exoplayer2/source/d;->i:J

    .line 145
    .line 146
    invoke-virtual {v0, v2, v3}, Lcom/google/android/exoplayer2/n$g$a;->g(J)Lcom/google/android/exoplayer2/n$g$a;

    .line 147
    .line 148
    .line 149
    :cond_5
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/n$g$a;->f()Lcom/google/android/exoplayer2/n$g;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    iget-object v2, p1, Lcom/google/android/exoplayer2/n;->d:Lcom/google/android/exoplayer2/n$g;

    .line 154
    .line 155
    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer2/n$g;->equals(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result v2

    .line 159
    if-nez v2, :cond_6

    .line 160
    .line 161
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/n;->b()Lcom/google/android/exoplayer2/n$c;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    invoke-virtual {p1, v0}, Lcom/google/android/exoplayer2/n$c;->b(Lcom/google/android/exoplayer2/n$g;)Lcom/google/android/exoplayer2/n$c;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/n$c;->a()Lcom/google/android/exoplayer2/n;

    .line 170
    .line 171
    .line 172
    move-result-object p1

    .line 173
    :cond_6
    invoke-interface {v1, p1}, Lcom/google/android/exoplayer2/source/i$a;->c(Lcom/google/android/exoplayer2/n;)Lcom/google/android/exoplayer2/source/i;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    iget-object v1, p1, Lcom/google/android/exoplayer2/n;->b:Lcom/google/android/exoplayer2/n$h;

    .line 178
    .line 179
    invoke-static {v1}, Ll/bmk0;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    .line 181
    .line 182
    move-result-object v1

    .line 183
    check-cast v1, Lcom/google/android/exoplayer2/n$h;

    .line 184
    .line 185
    iget-object v1, v1, Lcom/google/android/exoplayer2/n$h;->g:Lcom/google/common/collect/ImmutableList;

    .line 186
    .line 187
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 188
    .line 189
    .line 190
    move-result v2

    .line 191
    if-nez v2, :cond_b

    .line 192
    .line 193
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 194
    .line 195
    .line 196
    move-result v2

    .line 197
    add-int/lit8 v2, v2, 0x1

    .line 198
    .line 199
    new-array v2, v2, [Lcom/google/android/exoplayer2/source/i;

    .line 200
    .line 201
    const/4 v3, 0x0

    .line 202
    aput-object v0, v2, v3

    .line 203
    .line 204
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 205
    .line 206
    .line 207
    move-result v0

    .line 208
    if-ge v3, v0, :cond_a

    .line 209
    .line 210
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/source/d;->l:Z

    .line 211
    .line 212
    if-eqz v0, :cond_8

    .line 213
    .line 214
    new-instance v0, Lcom/google/android/exoplayer2/k$b;

    .line 215
    .line 216
    invoke-direct {v0}, Lcom/google/android/exoplayer2/k$b;-><init>()V

    .line 217
    .line 218
    .line 219
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 220
    .line 221
    .line 222
    move-result-object v6

    .line 223
    check-cast v6, Lcom/google/android/exoplayer2/n$k;

    .line 224
    .line 225
    iget-object v6, v6, Lcom/google/android/exoplayer2/n$k;->b:Ljava/lang/String;

    .line 226
    .line 227
    invoke-virtual {v0, v6}, Lcom/google/android/exoplayer2/k$b;->g0(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 232
    .line 233
    .line 234
    move-result-object v6

    .line 235
    check-cast v6, Lcom/google/android/exoplayer2/n$k;

    .line 236
    .line 237
    iget-object v6, v6, Lcom/google/android/exoplayer2/n$k;->c:Ljava/lang/String;

    .line 238
    .line 239
    invoke-virtual {v0, v6}, Lcom/google/android/exoplayer2/k$b;->X(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 240
    .line 241
    .line 242
    move-result-object v0

    .line 243
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 244
    .line 245
    .line 246
    move-result-object v6

    .line 247
    check-cast v6, Lcom/google/android/exoplayer2/n$k;

    .line 248
    .line 249
    iget v6, v6, Lcom/google/android/exoplayer2/n$k;->d:I

    .line 250
    .line 251
    invoke-virtual {v0, v6}, Lcom/google/android/exoplayer2/k$b;->i0(I)Lcom/google/android/exoplayer2/k$b;

    .line 252
    .line 253
    .line 254
    move-result-object v0

    .line 255
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 256
    .line 257
    .line 258
    move-result-object v6

    .line 259
    check-cast v6, Lcom/google/android/exoplayer2/n$k;

    .line 260
    .line 261
    iget v6, v6, Lcom/google/android/exoplayer2/n$k;->e:I

    .line 262
    .line 263
    invoke-virtual {v0, v6}, Lcom/google/android/exoplayer2/k$b;->e0(I)Lcom/google/android/exoplayer2/k$b;

    .line 264
    .line 265
    .line 266
    move-result-object v0

    .line 267
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 268
    .line 269
    .line 270
    move-result-object v6

    .line 271
    check-cast v6, Lcom/google/android/exoplayer2/n$k;

    .line 272
    .line 273
    iget-object v6, v6, Lcom/google/android/exoplayer2/n$k;->f:Ljava/lang/String;

    .line 274
    .line 275
    invoke-virtual {v0, v6}, Lcom/google/android/exoplayer2/k$b;->W(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 276
    .line 277
    .line 278
    move-result-object v0

    .line 279
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 280
    .line 281
    .line 282
    move-result-object v6

    .line 283
    check-cast v6, Lcom/google/android/exoplayer2/n$k;

    .line 284
    .line 285
    iget-object v6, v6, Lcom/google/android/exoplayer2/n$k;->g:Ljava/lang/String;

    .line 286
    .line 287
    invoke-virtual {v0, v6}, Lcom/google/android/exoplayer2/k$b;->U(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 288
    .line 289
    .line 290
    move-result-object v0

    .line 291
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/k$b;->G()Lcom/google/android/exoplayer2/k;

    .line 292
    .line 293
    .line 294
    move-result-object v0

    .line 295
    new-instance v6, Ll/hqd;

    .line 296
    .line 297
    invoke-direct {v6, v0}, Ll/hqd;-><init>(Lcom/google/android/exoplayer2/k;)V

    .line 298
    .line 299
    .line 300
    new-instance v0, Lcom/google/android/exoplayer2/source/o$b;

    .line 301
    .line 302
    iget-object v7, p0, Lcom/google/android/exoplayer2/source/d;->d:Ll/g6c$a;

    .line 303
    .line 304
    invoke-direct {v0, v7, v6}, Lcom/google/android/exoplayer2/source/o$b;-><init>(Ll/g6c$a;Ll/esf;)V

    .line 305
    .line 306
    .line 307
    iget-object v6, p0, Lcom/google/android/exoplayer2/source/d;->f:Lcom/google/android/exoplayer2/upstream/c;

    .line 308
    .line 309
    if-eqz v6, :cond_7

    .line 310
    .line 311
    invoke-virtual {v0, v6}, Lcom/google/android/exoplayer2/source/o$b;->h(Lcom/google/android/exoplayer2/upstream/c;)Lcom/google/android/exoplayer2/source/o$b;

    .line 312
    .line 313
    .line 314
    :cond_7
    add-int/lit8 v6, v3, 0x1

    .line 315
    .line 316
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 317
    .line 318
    .line 319
    move-result-object v7

    .line 320
    check-cast v7, Lcom/google/android/exoplayer2/n$k;

    .line 321
    .line 322
    iget-object v7, v7, Lcom/google/android/exoplayer2/n$k;->a:Landroid/net/Uri;

    .line 323
    .line 324
    invoke-virtual {v7}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 325
    .line 326
    .line 327
    move-result-object v7

    .line 328
    invoke-static {v7}, Lcom/google/android/exoplayer2/n;->d(Ljava/lang/String;)Lcom/google/android/exoplayer2/n;

    .line 329
    .line 330
    .line 331
    move-result-object v7

    .line 332
    invoke-virtual {v0, v7}, Lcom/google/android/exoplayer2/source/o$b;->f(Lcom/google/android/exoplayer2/n;)Lcom/google/android/exoplayer2/source/o;

    .line 333
    .line 334
    .line 335
    move-result-object v0

    .line 336
    aput-object v0, v2, v6

    .line 337
    .line 338
    goto :goto_1

    .line 339
    :cond_8
    new-instance v0, Lcom/google/android/exoplayer2/source/t$b;

    .line 340
    .line 341
    iget-object v6, p0, Lcom/google/android/exoplayer2/source/d;->d:Ll/g6c$a;

    .line 342
    .line 343
    invoke-direct {v0, v6}, Lcom/google/android/exoplayer2/source/t$b;-><init>(Ll/g6c$a;)V

    .line 344
    .line 345
    .line 346
    iget-object v6, p0, Lcom/google/android/exoplayer2/source/d;->f:Lcom/google/android/exoplayer2/upstream/c;

    .line 347
    .line 348
    if-eqz v6, :cond_9

    .line 349
    .line 350
    invoke-virtual {v0, v6}, Lcom/google/android/exoplayer2/source/t$b;->b(Lcom/google/android/exoplayer2/upstream/c;)Lcom/google/android/exoplayer2/source/t$b;

    .line 351
    .line 352
    .line 353
    :cond_9
    add-int/lit8 v6, v3, 0x1

    .line 354
    .line 355
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 356
    .line 357
    .line 358
    move-result-object v7

    .line 359
    check-cast v7, Lcom/google/android/exoplayer2/n$k;

    .line 360
    .line 361
    invoke-virtual {v0, v7, v4, v5}, Lcom/google/android/exoplayer2/source/t$b;->a(Lcom/google/android/exoplayer2/n$k;J)Lcom/google/android/exoplayer2/source/t;

    .line 362
    .line 363
    .line 364
    move-result-object v0

    .line 365
    aput-object v0, v2, v6

    .line 366
    .line 367
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 368
    .line 369
    goto/16 :goto_0

    .line 370
    .line 371
    :cond_a
    new-instance v0, Lcom/google/android/exoplayer2/source/MergingMediaSource;

    .line 372
    .line 373
    invoke-direct {v0, v2}, Lcom/google/android/exoplayer2/source/MergingMediaSource;-><init>([Lcom/google/android/exoplayer2/source/i;)V

    .line 374
    .line 375
    .line 376
    :cond_b
    invoke-static {p1, v0}, Lcom/google/android/exoplayer2/source/d;->h(Lcom/google/android/exoplayer2/n;Lcom/google/android/exoplayer2/source/i;)Lcom/google/android/exoplayer2/source/i;

    .line 377
    .line 378
    .line 379
    move-result-object v0

    .line 380
    invoke-virtual {p0, p1, v0}, Lcom/google/android/exoplayer2/source/d;->i(Lcom/google/android/exoplayer2/n;Lcom/google/android/exoplayer2/source/i;)Lcom/google/android/exoplayer2/source/i;

    .line 381
    .line 382
    .line 383
    move-result-object p0

    .line 384
    return-object p0
.end method

.method public bridge synthetic d(Ll/zb5$a;)Lcom/google/android/exoplayer2/source/i$a;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/d;->l(Ll/zb5$a;)Lcom/google/android/exoplayer2/source/d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final i(Lcom/google/android/exoplayer2/n;Lcom/google/android/exoplayer2/source/i;)Lcom/google/android/exoplayer2/source/i;
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/google/android/exoplayer2/n;->b:Lcom/google/android/exoplayer2/n$h;

    .line 2
    .line 3
    invoke-static {p0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iget-object p0, p1, Lcom/google/android/exoplayer2/n;->b:Lcom/google/android/exoplayer2/n$h;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/google/android/exoplayer2/n$h;->d:Lcom/google/android/exoplayer2/n$b;

    .line 9
    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    return-object p2

    .line 13
    :cond_0
    const-string p0, "DMediaSourceFactory"

    .line 14
    .line 15
    const-string p1, "Playing media without ads. Configure ad support by calling setAdsLoaderProvider and setAdViewProvider."

    .line 16
    .line 17
    invoke-static {p0, p1}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-object p2
.end method

.method public l(Ll/zb5$a;)Lcom/google/android/exoplayer2/source/d;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/d;->c:Lcom/google/android/exoplayer2/source/d$a;

    .line 2
    .line 3
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ll/zb5$a;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer2/source/d$a;->h(Ll/zb5$a;)V

    .line 10
    .line 11
    .line 12
    return-object p0
.end method

.method public m(Ll/zde;)Lcom/google/android/exoplayer2/source/d;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/d;->c:Lcom/google/android/exoplayer2/source/d$a;

    .line 2
    .line 3
    const-string v1, "MediaSource.Factory#setDrmSessionManagerProvider no longer handles null by instantiating a new DefaultDrmSessionManagerProvider. Explicitly construct and pass an instance in order to retain the old behavior."

    .line 4
    .line 5
    invoke-static {p1, v1}, Ll/w11;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Ll/zde;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer2/source/d$a;->j(Ll/zde;)V

    .line 12
    .line 13
    .line 14
    return-object p0
.end method

.method public n(Lcom/google/android/exoplayer2/upstream/c;)Lcom/google/android/exoplayer2/source/d;
    .locals 1

    .line 1
    const-string v0, "MediaSource.Factory#setLoadErrorHandlingPolicy no longer handles null by instantiating a new DefaultLoadErrorHandlingPolicy. Explicitly construct and pass an instance in order to retain the old behavior."

    .line 2
    .line 3
    invoke-static {p1, v0}, Ll/w11;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/google/android/exoplayer2/upstream/c;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/google/android/exoplayer2/source/d;->f:Lcom/google/android/exoplayer2/upstream/c;

    .line 10
    .line 11
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/d;->c:Lcom/google/android/exoplayer2/source/d$a;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer2/source/d$a;->k(Lcom/google/android/exoplayer2/upstream/c;)V

    .line 14
    .line 15
    .line 16
    return-object p0
.end method
