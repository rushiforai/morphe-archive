.class public final Ll/krd$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/krd;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "a"
.end annotation


# instance fields
.field public final a:Ljava/lang/String;

.field public b:I

.field public c:J

.field public d:Lcom/google/android/exoplayer2/source/i$b;

.field public e:Z

.field public f:Z

.field public final synthetic g:Ll/krd;


# direct methods
.method public constructor <init>(Ll/krd;Ljava/lang/String;ILcom/google/android/exoplayer2/source/i$b;)V
    .locals 0
    .param p3    # I
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/krd$a;->g:Ll/krd;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/krd$a;->a:Ljava/lang/String;

    .line 7
    .line 8
    iput p3, p0, Ll/krd$a;->b:I

    .line 9
    .line 10
    if-nez p4, :cond_0

    .line 11
    .line 12
    const-wide/16 p1, -0x1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-wide p1, p4, Ll/fyx;->d:J

    .line 16
    .line 17
    :goto_0
    iput-wide p1, p0, Ll/krd$a;->c:J

    .line 18
    .line 19
    if-eqz p4, :cond_1

    .line 20
    .line 21
    invoke-virtual {p4}, Ll/fyx;->b()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    iput-object p4, p0, Ll/krd$a;->d:Lcom/google/android/exoplayer2/source/i$b;

    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public static synthetic a(Ll/krd$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/krd$a;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Ll/krd$a;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/krd$a;->c:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic c(Ll/krd$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/krd$a;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic d(Ll/krd$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/krd$a;->e:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic e(Ll/krd$a;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/krd$a;->e:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic f(Ll/krd$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/krd$a;->f:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic g(Ll/krd$a;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/krd$a;->f:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic h(Ll/krd$a;)Lcom/google/android/exoplayer2/source/i$b;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/krd$a;->d:Lcom/google/android/exoplayer2/source/i$b;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public i(ILcom/google/android/exoplayer2/source/i$b;)Z
    .locals 6
    .param p2    # Lcom/google/android/exoplayer2/source/i$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    if-nez p2, :cond_1

    .line 4
    .line 5
    iget p0, p0, Ll/krd$a;->b:I

    .line 6
    .line 7
    if-ne p1, p0, :cond_0

    .line 8
    .line 9
    return v1

    .line 10
    :cond_0
    return v0

    .line 11
    :cond_1
    iget-object p1, p0, Ll/krd$a;->d:Lcom/google/android/exoplayer2/source/i$b;

    .line 12
    .line 13
    if-nez p1, :cond_3

    .line 14
    .line 15
    invoke-virtual {p2}, Ll/fyx;->b()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-nez p1, :cond_2

    .line 20
    .line 21
    iget-wide p1, p2, Ll/fyx;->d:J

    .line 22
    .line 23
    iget-wide v2, p0, Ll/krd$a;->c:J

    .line 24
    .line 25
    cmp-long p0, p1, v2

    .line 26
    .line 27
    if-nez p0, :cond_2

    .line 28
    .line 29
    return v1

    .line 30
    :cond_2
    return v0

    .line 31
    :cond_3
    iget-wide v2, p2, Ll/fyx;->d:J

    .line 32
    .line 33
    iget-wide v4, p1, Ll/fyx;->d:J

    .line 34
    .line 35
    cmp-long p0, v2, v4

    .line 36
    .line 37
    if-nez p0, :cond_4

    .line 38
    .line 39
    iget p0, p2, Ll/fyx;->b:I

    .line 40
    .line 41
    iget v2, p1, Ll/fyx;->b:I

    .line 42
    .line 43
    if-ne p0, v2, :cond_4

    .line 44
    .line 45
    iget p0, p2, Ll/fyx;->c:I

    .line 46
    .line 47
    iget p1, p1, Ll/fyx;->c:I

    .line 48
    .line 49
    if-ne p0, p1, :cond_4

    .line 50
    .line 51
    return v1

    .line 52
    :cond_4
    return v0
.end method

.method public j(Ll/hk0$a;)Z
    .locals 9

    .line 1
    iget-object v0, p1, Ll/hk0$a;->d:Lcom/google/android/exoplayer2/source/i$b;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget p0, p0, Ll/krd$a;->b:I

    .line 8
    .line 9
    iget p1, p1, Ll/hk0$a;->c:I

    .line 10
    .line 11
    if-eq p0, p1, :cond_0

    .line 12
    .line 13
    return v1

    .line 14
    :cond_0
    return v2

    .line 15
    :cond_1
    iget-wide v3, p0, Ll/krd$a;->c:J

    .line 16
    .line 17
    const-wide/16 v5, -0x1

    .line 18
    .line 19
    cmp-long v5, v3, v5

    .line 20
    .line 21
    if-nez v5, :cond_2

    .line 22
    .line 23
    return v2

    .line 24
    :cond_2
    iget-wide v5, v0, Ll/fyx;->d:J

    .line 25
    .line 26
    cmp-long v3, v5, v3

    .line 27
    .line 28
    if-lez v3, :cond_3

    .line 29
    .line 30
    return v1

    .line 31
    :cond_3
    iget-object v3, p0, Ll/krd$a;->d:Lcom/google/android/exoplayer2/source/i$b;

    .line 32
    .line 33
    if-nez v3, :cond_4

    .line 34
    .line 35
    return v2

    .line 36
    :cond_4
    iget-object v3, p1, Ll/hk0$a;->b:Lcom/google/android/exoplayer2/c0;

    .line 37
    .line 38
    iget-object v0, v0, Ll/fyx;->a:Ljava/lang/Object;

    .line 39
    .line 40
    invoke-virtual {v3, v0}, Lcom/google/android/exoplayer2/c0;->f(Ljava/lang/Object;)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    iget-object v3, p1, Ll/hk0$a;->b:Lcom/google/android/exoplayer2/c0;

    .line 45
    .line 46
    iget-object v4, p0, Ll/krd$a;->d:Lcom/google/android/exoplayer2/source/i$b;

    .line 47
    .line 48
    iget-object v4, v4, Ll/fyx;->a:Ljava/lang/Object;

    .line 49
    .line 50
    invoke-virtual {v3, v4}, Lcom/google/android/exoplayer2/c0;->f(Ljava/lang/Object;)I

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    iget-object v4, p1, Ll/hk0$a;->d:Lcom/google/android/exoplayer2/source/i$b;

    .line 55
    .line 56
    iget-wide v5, v4, Ll/fyx;->d:J

    .line 57
    .line 58
    iget-object v7, p0, Ll/krd$a;->d:Lcom/google/android/exoplayer2/source/i$b;

    .line 59
    .line 60
    iget-wide v7, v7, Ll/fyx;->d:J

    .line 61
    .line 62
    cmp-long v5, v5, v7

    .line 63
    .line 64
    if-ltz v5, :cond_c

    .line 65
    .line 66
    if-ge v0, v3, :cond_5

    .line 67
    .line 68
    goto :goto_2

    .line 69
    :cond_5
    if-le v0, v3, :cond_6

    .line 70
    .line 71
    return v1

    .line 72
    :cond_6
    invoke-virtual {v4}, Ll/fyx;->b()Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    iget-object p1, p1, Ll/hk0$a;->d:Lcom/google/android/exoplayer2/source/i$b;

    .line 77
    .line 78
    if-eqz v0, :cond_9

    .line 79
    .line 80
    iget v0, p1, Ll/fyx;->b:I

    .line 81
    .line 82
    iget p1, p1, Ll/fyx;->c:I

    .line 83
    .line 84
    iget-object p0, p0, Ll/krd$a;->d:Lcom/google/android/exoplayer2/source/i$b;

    .line 85
    .line 86
    iget v3, p0, Ll/fyx;->b:I

    .line 87
    .line 88
    if-gt v0, v3, :cond_8

    .line 89
    .line 90
    if-ne v0, v3, :cond_7

    .line 91
    .line 92
    iget p0, p0, Ll/fyx;->c:I

    .line 93
    .line 94
    if-le p1, p0, :cond_7

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_7
    return v2

    .line 98
    :cond_8
    :goto_0
    return v1

    .line 99
    :cond_9
    iget p1, p1, Ll/fyx;->e:I

    .line 100
    .line 101
    const/4 v0, -0x1

    .line 102
    if-eq p1, v0, :cond_b

    .line 103
    .line 104
    iget-object p0, p0, Ll/krd$a;->d:Lcom/google/android/exoplayer2/source/i$b;

    .line 105
    .line 106
    iget p0, p0, Ll/fyx;->b:I

    .line 107
    .line 108
    if-le p1, p0, :cond_a

    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_a
    return v2

    .line 112
    :cond_b
    :goto_1
    return v1

    .line 113
    :cond_c
    :goto_2
    return v2
.end method

.method public k(ILcom/google/android/exoplayer2/source/i$b;)V
    .locals 4
    .param p2    # Lcom/google/android/exoplayer2/source/i$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-wide v0, p0, Ll/krd$a;->c:J

    .line 2
    .line 3
    const-wide/16 v2, -0x1

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget v0, p0, Ll/krd$a;->b:I

    .line 10
    .line 11
    if-ne p1, v0, :cond_0

    .line 12
    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    iget-wide v0, p2, Ll/fyx;->d:J

    .line 16
    .line 17
    iget-object p1, p0, Ll/krd$a;->g:Ll/krd;

    .line 18
    .line 19
    invoke-static {p1}, Ll/krd;->i(Ll/krd;)J

    .line 20
    .line 21
    .line 22
    move-result-wide v2

    .line 23
    cmp-long p1, v0, v2

    .line 24
    .line 25
    if-ltz p1, :cond_0

    .line 26
    .line 27
    iget-wide p1, p2, Ll/fyx;->d:J

    .line 28
    .line 29
    iput-wide p1, p0, Ll/krd$a;->c:J

    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public final l(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/c0;I)I
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/c0;->t()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, -0x1

    .line 6
    if-lt p3, v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {p2}, Lcom/google/android/exoplayer2/c0;->t()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-ge p3, p0, :cond_0

    .line 13
    .line 14
    return p3

    .line 15
    :cond_0
    return v1

    .line 16
    :cond_1
    iget-object v0, p0, Ll/krd$a;->g:Ll/krd;

    .line 17
    .line 18
    invoke-static {v0}, Ll/krd;->j(Ll/krd;)Lcom/google/android/exoplayer2/c0$d;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p1, p3, v0}, Lcom/google/android/exoplayer2/c0;->r(ILcom/google/android/exoplayer2/c0$d;)Lcom/google/android/exoplayer2/c0$d;

    .line 23
    .line 24
    .line 25
    iget-object p3, p0, Ll/krd$a;->g:Ll/krd;

    .line 26
    .line 27
    invoke-static {p3}, Ll/krd;->j(Ll/krd;)Lcom/google/android/exoplayer2/c0$d;

    .line 28
    .line 29
    .line 30
    move-result-object p3

    .line 31
    iget p3, p3, Lcom/google/android/exoplayer2/c0$d;->o:I

    .line 32
    .line 33
    :goto_0
    iget-object v0, p0, Ll/krd$a;->g:Ll/krd;

    .line 34
    .line 35
    invoke-static {v0}, Ll/krd;->j(Ll/krd;)Lcom/google/android/exoplayer2/c0$d;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget v0, v0, Lcom/google/android/exoplayer2/c0$d;->p:I

    .line 40
    .line 41
    if-gt p3, v0, :cond_3

    .line 42
    .line 43
    invoke-virtual {p1, p3}, Lcom/google/android/exoplayer2/c0;->q(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {p2, v0}, Lcom/google/android/exoplayer2/c0;->f(Ljava/lang/Object;)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eq v0, v1, :cond_2

    .line 52
    .line 53
    iget-object p0, p0, Ll/krd$a;->g:Ll/krd;

    .line 54
    .line 55
    invoke-static {p0}, Ll/krd;->k(Ll/krd;)Lcom/google/android/exoplayer2/c0$b;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p2, v0, p0}, Lcom/google/android/exoplayer2/c0;->j(ILcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    iget p0, p0, Lcom/google/android/exoplayer2/c0$b;->c:I

    .line 64
    .line 65
    return p0

    .line 66
    :cond_2
    add-int/lit8 p3, p3, 0x1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_3
    return v1
.end method

.method public m(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/c0;)Z
    .locals 2

    .line 1
    iget v0, p0, Ll/krd$a;->b:I

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, v0}, Ll/krd$a;->l(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/c0;I)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iput p1, p0, Ll/krd$a;->b:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    const/4 v1, -0x1

    .line 11
    if-ne p1, v1, :cond_0

    .line 12
    .line 13
    return v0

    .line 14
    :cond_0
    iget-object p0, p0, Ll/krd$a;->d:Lcom/google/android/exoplayer2/source/i$b;

    .line 15
    .line 16
    const/4 p1, 0x1

    .line 17
    if-nez p0, :cond_1

    .line 18
    .line 19
    return p1

    .line 20
    :cond_1
    iget-object p0, p0, Ll/fyx;->a:Ljava/lang/Object;

    .line 21
    .line 22
    invoke-virtual {p2, p0}, Lcom/google/android/exoplayer2/c0;->f(Ljava/lang/Object;)I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eq p0, v1, :cond_2

    .line 27
    .line 28
    return p1

    .line 29
    :cond_2
    return v0
.end method
