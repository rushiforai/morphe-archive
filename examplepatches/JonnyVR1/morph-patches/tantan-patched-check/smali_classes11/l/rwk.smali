.class public final Ll/rwk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/hte;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/rwk$a;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Ll/vke0;

.field public b:Ljava/lang/String;

.field public c:Ll/qfj0;

.field public d:Ll/rwk$a;

.field public e:Z

.field public final f:[Z

.field public final g:Ll/ib20;

.field public final h:Ll/ib20;

.field public final i:Ll/ib20;

.field public final j:Ll/ib20;

.field public final k:Ll/ib20;

.field public l:J

.field public m:J

.field public final n:Ll/ig60;


# direct methods
.method public constructor <init>(Ll/vke0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/rwk;->a:Ll/vke0;

    .line 5
    .line 6
    const/4 p1, 0x3

    .line 7
    new-array p1, p1, [Z

    .line 8
    .line 9
    iput-object p1, p0, Ll/rwk;->f:[Z

    .line 10
    .line 11
    new-instance p1, Ll/ib20;

    .line 12
    .line 13
    const/16 v0, 0x20

    .line 14
    .line 15
    const/16 v1, 0x80

    .line 16
    .line 17
    invoke-direct {p1, v0, v1}, Ll/ib20;-><init>(II)V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Ll/rwk;->g:Ll/ib20;

    .line 21
    .line 22
    new-instance p1, Ll/ib20;

    .line 23
    .line 24
    const/16 v0, 0x21

    .line 25
    .line 26
    invoke-direct {p1, v0, v1}, Ll/ib20;-><init>(II)V

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, Ll/rwk;->h:Ll/ib20;

    .line 30
    .line 31
    new-instance p1, Ll/ib20;

    .line 32
    .line 33
    const/16 v0, 0x22

    .line 34
    .line 35
    invoke-direct {p1, v0, v1}, Ll/ib20;-><init>(II)V

    .line 36
    .line 37
    .line 38
    iput-object p1, p0, Ll/rwk;->i:Ll/ib20;

    .line 39
    .line 40
    new-instance p1, Ll/ib20;

    .line 41
    .line 42
    const/16 v0, 0x27

    .line 43
    .line 44
    invoke-direct {p1, v0, v1}, Ll/ib20;-><init>(II)V

    .line 45
    .line 46
    .line 47
    iput-object p1, p0, Ll/rwk;->j:Ll/ib20;

    .line 48
    .line 49
    new-instance p1, Ll/ib20;

    .line 50
    .line 51
    const/16 v0, 0x28

    .line 52
    .line 53
    invoke-direct {p1, v0, v1}, Ll/ib20;-><init>(II)V

    .line 54
    .line 55
    .line 56
    iput-object p1, p0, Ll/rwk;->k:Ll/ib20;

    .line 57
    .line 58
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 59
    .line 60
    .line 61
    .line 62
    .line 63
    iput-wide v0, p0, Ll/rwk;->m:J

    .line 64
    .line 65
    new-instance p1, Ll/ig60;

    .line 66
    .line 67
    invoke-direct {p1}, Ll/ig60;-><init>()V

    .line 68
    .line 69
    .line 70
    iput-object p1, p0, Ll/rwk;->n:Ll/ig60;

    .line 71
    .line 72
    return-void
.end method

.method private f()V
    .locals 1
    .annotation runtime Lorg/checkerframework/checker/nullness/qual/EnsuresNonNull;
        value = {
            "output",
            "sampleReader"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/rwk;->c:Ll/qfj0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w11;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/rwk;->d:Ll/rwk$a;

    .line 7
    .line 8
    invoke-static {p0}, Ll/bmk0;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private g(JIIJ)V
    .locals 2
    .annotation runtime Lorg/checkerframework/checker/nullness/qual/RequiresNonNull;
        value = {
            "output",
            "sampleReader"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/rwk;->d:Ll/rwk$a;

    .line 2
    .line 3
    iget-boolean v1, p0, Ll/rwk;->e:Z

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2, p3, v1}, Ll/rwk$a;->a(JIZ)V

    .line 6
    .line 7
    .line 8
    iget-boolean p1, p0, Ll/rwk;->e:Z

    .line 9
    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Ll/rwk;->g:Ll/ib20;

    .line 13
    .line 14
    invoke-virtual {p1, p4}, Ll/ib20;->b(I)Z

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Ll/rwk;->h:Ll/ib20;

    .line 18
    .line 19
    invoke-virtual {p1, p4}, Ll/ib20;->b(I)Z

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Ll/rwk;->i:Ll/ib20;

    .line 23
    .line 24
    invoke-virtual {p1, p4}, Ll/ib20;->b(I)Z

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/rwk;->g:Ll/ib20;

    .line 28
    .line 29
    invoke-virtual {p1}, Ll/ib20;->c()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_0

    .line 34
    .line 35
    iget-object p1, p0, Ll/rwk;->h:Ll/ib20;

    .line 36
    .line 37
    invoke-virtual {p1}, Ll/ib20;->c()Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-eqz p1, :cond_0

    .line 42
    .line 43
    iget-object p1, p0, Ll/rwk;->i:Ll/ib20;

    .line 44
    .line 45
    invoke-virtual {p1}, Ll/ib20;->c()Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_0

    .line 50
    .line 51
    iget-object p1, p0, Ll/rwk;->c:Ll/qfj0;

    .line 52
    .line 53
    iget-object p2, p0, Ll/rwk;->b:Ljava/lang/String;

    .line 54
    .line 55
    iget-object p3, p0, Ll/rwk;->g:Ll/ib20;

    .line 56
    .line 57
    iget-object v0, p0, Ll/rwk;->h:Ll/ib20;

    .line 58
    .line 59
    iget-object v1, p0, Ll/rwk;->i:Ll/ib20;

    .line 60
    .line 61
    invoke-static {p2, p3, v0, v1}, Ll/rwk;->i(Ljava/lang/String;Ll/ib20;Ll/ib20;Ll/ib20;)Lcom/google/android/exoplayer2/k;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    invoke-interface {p1, p2}, Ll/qfj0;->b(Lcom/google/android/exoplayer2/k;)V

    .line 66
    .line 67
    .line 68
    const/4 p1, 0x1

    .line 69
    iput-boolean p1, p0, Ll/rwk;->e:Z

    .line 70
    .line 71
    :cond_0
    iget-object p1, p0, Ll/rwk;->j:Ll/ib20;

    .line 72
    .line 73
    invoke-virtual {p1, p4}, Ll/ib20;->b(I)Z

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    const/4 p2, 0x5

    .line 78
    if-eqz p1, :cond_1

    .line 79
    .line 80
    iget-object p1, p0, Ll/rwk;->j:Ll/ib20;

    .line 81
    .line 82
    iget-object p3, p1, Ll/ib20;->d:[B

    .line 83
    .line 84
    iget p1, p1, Ll/ib20;->e:I

    .line 85
    .line 86
    invoke-static {p3, p1}, Ll/jb20;->q([BI)I

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    iget-object p3, p0, Ll/rwk;->n:Ll/ig60;

    .line 91
    .line 92
    iget-object v0, p0, Ll/rwk;->j:Ll/ib20;

    .line 93
    .line 94
    iget-object v0, v0, Ll/ib20;->d:[B

    .line 95
    .line 96
    invoke-virtual {p3, v0, p1}, Ll/ig60;->S([BI)V

    .line 97
    .line 98
    .line 99
    iget-object p1, p0, Ll/rwk;->n:Ll/ig60;

    .line 100
    .line 101
    invoke-virtual {p1, p2}, Ll/ig60;->V(I)V

    .line 102
    .line 103
    .line 104
    iget-object p1, p0, Ll/rwk;->a:Ll/vke0;

    .line 105
    .line 106
    iget-object p3, p0, Ll/rwk;->n:Ll/ig60;

    .line 107
    .line 108
    invoke-virtual {p1, p5, p6, p3}, Ll/vke0;->a(JLl/ig60;)V

    .line 109
    .line 110
    .line 111
    :cond_1
    iget-object p1, p0, Ll/rwk;->k:Ll/ib20;

    .line 112
    .line 113
    invoke-virtual {p1, p4}, Ll/ib20;->b(I)Z

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    if-eqz p1, :cond_2

    .line 118
    .line 119
    iget-object p1, p0, Ll/rwk;->k:Ll/ib20;

    .line 120
    .line 121
    iget-object p3, p1, Ll/ib20;->d:[B

    .line 122
    .line 123
    iget p1, p1, Ll/ib20;->e:I

    .line 124
    .line 125
    invoke-static {p3, p1}, Ll/jb20;->q([BI)I

    .line 126
    .line 127
    .line 128
    move-result p1

    .line 129
    iget-object p3, p0, Ll/rwk;->n:Ll/ig60;

    .line 130
    .line 131
    iget-object p4, p0, Ll/rwk;->k:Ll/ib20;

    .line 132
    .line 133
    iget-object p4, p4, Ll/ib20;->d:[B

    .line 134
    .line 135
    invoke-virtual {p3, p4, p1}, Ll/ig60;->S([BI)V

    .line 136
    .line 137
    .line 138
    iget-object p1, p0, Ll/rwk;->n:Ll/ig60;

    .line 139
    .line 140
    invoke-virtual {p1, p2}, Ll/ig60;->V(I)V

    .line 141
    .line 142
    .line 143
    iget-object p1, p0, Ll/rwk;->a:Ll/vke0;

    .line 144
    .line 145
    iget-object p0, p0, Ll/rwk;->n:Ll/ig60;

    .line 146
    .line 147
    invoke-virtual {p1, p5, p6, p0}, Ll/vke0;->a(JLl/ig60;)V

    .line 148
    .line 149
    .line 150
    :cond_2
    return-void
.end method

.method private h([BII)V
    .locals 1
    .annotation runtime Lorg/checkerframework/checker/nullness/qual/RequiresNonNull;
        value = {
            "sampleReader"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/rwk;->d:Ll/rwk$a;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2, p3}, Ll/rwk$a;->e([BII)V

    .line 4
    .line 5
    .line 6
    iget-boolean v0, p0, Ll/rwk;->e:Z

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/rwk;->g:Ll/ib20;

    .line 11
    .line 12
    invoke-virtual {v0, p1, p2, p3}, Ll/ib20;->a([BII)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/rwk;->h:Ll/ib20;

    .line 16
    .line 17
    invoke-virtual {v0, p1, p2, p3}, Ll/ib20;->a([BII)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/rwk;->i:Ll/ib20;

    .line 21
    .line 22
    invoke-virtual {v0, p1, p2, p3}, Ll/ib20;->a([BII)V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Ll/rwk;->j:Ll/ib20;

    .line 26
    .line 27
    invoke-virtual {v0, p1, p2, p3}, Ll/ib20;->a([BII)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/rwk;->k:Ll/ib20;

    .line 31
    .line 32
    invoke-virtual {p0, p1, p2, p3}, Ll/ib20;->a([BII)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public static i(Ljava/lang/String;Ll/ib20;Ll/ib20;Ll/ib20;)Lcom/google/android/exoplayer2/k;
    .locals 8
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget v0, p1, Ll/ib20;->e:I

    .line 2
    .line 3
    iget v1, p2, Ll/ib20;->e:I

    .line 4
    .line 5
    add-int/2addr v1, v0

    .line 6
    iget v2, p3, Ll/ib20;->e:I

    .line 7
    .line 8
    add-int/2addr v1, v2

    .line 9
    new-array v1, v1, [B

    .line 10
    .line 11
    iget-object v2, p1, Ll/ib20;->d:[B

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    invoke-static {v2, v3, v1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p2, Ll/ib20;->d:[B

    .line 18
    .line 19
    iget v2, p1, Ll/ib20;->e:I

    .line 20
    .line 21
    iget v4, p2, Ll/ib20;->e:I

    .line 22
    .line 23
    invoke-static {v0, v3, v1, v2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p3, Ll/ib20;->d:[B

    .line 27
    .line 28
    iget p1, p1, Ll/ib20;->e:I

    .line 29
    .line 30
    iget v2, p2, Ll/ib20;->e:I

    .line 31
    .line 32
    add-int/2addr p1, v2

    .line 33
    iget p3, p3, Ll/ib20;->e:I

    .line 34
    .line 35
    invoke-static {v0, v3, v1, p1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p2, Ll/ib20;->d:[B

    .line 39
    .line 40
    const/4 p3, 0x3

    .line 41
    iget p2, p2, Ll/ib20;->e:I

    .line 42
    .line 43
    invoke-static {p1, p3, p2}, Ll/jb20;->h([BII)Ll/jb20$a;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iget v2, p1, Ll/jb20$a;->a:I

    .line 48
    .line 49
    iget-boolean v3, p1, Ll/jb20$a;->b:Z

    .line 50
    .line 51
    iget v4, p1, Ll/jb20$a;->c:I

    .line 52
    .line 53
    iget v5, p1, Ll/jb20$a;->d:I

    .line 54
    .line 55
    iget-object v6, p1, Ll/jb20$a;->h:[I

    .line 56
    .line 57
    iget v7, p1, Ll/jb20$a;->i:I

    .line 58
    .line 59
    invoke-static/range {v2 .. v7}, Ll/lc5;->c(IZII[II)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    new-instance p3, Lcom/google/android/exoplayer2/k$b;

    .line 64
    .line 65
    invoke-direct {p3}, Lcom/google/android/exoplayer2/k$b;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p3, p0}, Lcom/google/android/exoplayer2/k$b;->U(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    const-string p3, "video/hevc"

    .line 73
    .line 74
    invoke-virtual {p0, p3}, Lcom/google/android/exoplayer2/k$b;->g0(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p0, p2}, Lcom/google/android/exoplayer2/k$b;->K(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    iget p2, p1, Ll/jb20$a;->k:I

    .line 83
    .line 84
    invoke-virtual {p0, p2}, Lcom/google/android/exoplayer2/k$b;->n0(I)Lcom/google/android/exoplayer2/k$b;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    iget p2, p1, Ll/jb20$a;->l:I

    .line 89
    .line 90
    invoke-virtual {p0, p2}, Lcom/google/android/exoplayer2/k$b;->S(I)Lcom/google/android/exoplayer2/k$b;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    iget p1, p1, Ll/jb20$a;->m:F

    .line 95
    .line 96
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/k$b;->c0(F)Lcom/google/android/exoplayer2/k$b;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/k$b;->V(Ljava/util/List;)Lcom/google/android/exoplayer2/k$b;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/k$b;->G()Lcom/google/android/exoplayer2/k;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    return-object p0
.end method


# virtual methods
.method public a(Ll/ig60;)V
    .locals 13

    .line 1
    invoke-direct {p0}, Ll/rwk;->f()V

    .line 2
    .line 3
    .line 4
    :cond_0
    invoke-virtual {p1}, Ll/ig60;->a()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-lez v1, :cond_4

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/ig60;->f()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-virtual {p1}, Ll/ig60;->g()I

    .line 15
    .line 16
    .line 17
    move-result v7

    .line 18
    invoke-virtual {p1}, Ll/ig60;->e()[B

    .line 19
    .line 20
    .line 21
    move-result-object v8

    .line 22
    iget-wide v2, p0, Ll/rwk;->l:J

    .line 23
    .line 24
    invoke-virtual {p1}, Ll/ig60;->a()I

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    int-to-long v4, v4

    .line 29
    add-long/2addr v2, v4

    .line 30
    iput-wide v2, p0, Ll/rwk;->l:J

    .line 31
    .line 32
    iget-object v2, p0, Ll/rwk;->c:Ll/qfj0;

    .line 33
    .line 34
    invoke-virtual {p1}, Ll/ig60;->a()I

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    invoke-interface {v2, p1, v3}, Ll/qfj0;->d(Ll/ig60;I)V

    .line 39
    .line 40
    .line 41
    :goto_0
    if-ge v1, v7, :cond_0

    .line 42
    .line 43
    iget-object v2, p0, Ll/rwk;->f:[Z

    .line 44
    .line 45
    invoke-static {v8, v1, v7, v2}, Ll/jb20;->c([BII[Z)I

    .line 46
    .line 47
    .line 48
    move-result v9

    .line 49
    if-ne v9, v7, :cond_1

    .line 50
    .line 51
    invoke-direct {p0, v8, v1, v7}, Ll/rwk;->h([BII)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_1
    invoke-static {v8, v9}, Ll/jb20;->e([BI)I

    .line 56
    .line 57
    .line 58
    move-result v10

    .line 59
    sub-int v2, v9, v1

    .line 60
    .line 61
    if-lez v2, :cond_2

    .line 62
    .line 63
    invoke-direct {p0, v8, v1, v9}, Ll/rwk;->h([BII)V

    .line 64
    .line 65
    .line 66
    :cond_2
    sub-int v3, v7, v9

    .line 67
    .line 68
    iget-wide v4, p0, Ll/rwk;->l:J

    .line 69
    .line 70
    int-to-long v11, v3

    .line 71
    sub-long/2addr v4, v11

    .line 72
    if-gez v2, :cond_3

    .line 73
    .line 74
    neg-int v1, v2

    .line 75
    :goto_1
    move-wide v11, v4

    .line 76
    goto :goto_2

    .line 77
    :cond_3
    const/4 v1, 0x0

    .line 78
    goto :goto_1

    .line 79
    :goto_2
    iget-wide v5, p0, Ll/rwk;->m:J

    .line 80
    .line 81
    move-object v0, p0

    .line 82
    move v4, v1

    .line 83
    move-wide v1, v11

    .line 84
    invoke-direct/range {v0 .. v6}, Ll/rwk;->g(JIIJ)V

    .line 85
    .line 86
    .line 87
    iget-wide v5, p0, Ll/rwk;->m:J

    .line 88
    .line 89
    move v4, v10

    .line 90
    invoke-virtual/range {v0 .. v6}, Ll/rwk;->j(JIIJ)V

    .line 91
    .line 92
    .line 93
    add-int/lit8 v1, v9, 0x3

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_4
    return-void
.end method

.method public b()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Ll/rwk;->l:J

    .line 4
    .line 5
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    iput-wide v0, p0, Ll/rwk;->m:J

    .line 11
    .line 12
    iget-object v0, p0, Ll/rwk;->f:[Z

    .line 13
    .line 14
    invoke-static {v0}, Ll/jb20;->a([Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/rwk;->g:Ll/ib20;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/ib20;->d()V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/rwk;->h:Ll/ib20;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/ib20;->d()V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/rwk;->i:Ll/ib20;

    .line 28
    .line 29
    invoke-virtual {v0}, Ll/ib20;->d()V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/rwk;->j:Ll/ib20;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/ib20;->d()V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/rwk;->k:Ll/ib20;

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/ib20;->d()V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Ll/rwk;->d:Ll/rwk$a;

    .line 43
    .line 44
    if-eqz p0, :cond_0

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/rwk$a;->f()V

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    return-void
.end method

.method public d(JI)V
    .locals 2

    .line 1
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    cmp-long p3, p1, v0

    .line 7
    .line 8
    if-eqz p3, :cond_0

    .line 9
    .line 10
    iput-wide p1, p0, Ll/rwk;->m:J

    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public e(Ll/bsf;Ll/jkj0$d;)V
    .locals 2

    .line 1
    invoke-virtual {p2}, Ll/jkj0$d;->a()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ll/jkj0$d;->b()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/rwk;->b:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p2}, Ll/jkj0$d;->c()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x2

    .line 15
    invoke-interface {p1, v0, v1}, Ll/bsf;->b(II)Ll/qfj0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Ll/rwk;->c:Ll/qfj0;

    .line 20
    .line 21
    new-instance v1, Ll/rwk$a;

    .line 22
    .line 23
    invoke-direct {v1, v0}, Ll/rwk$a;-><init>(Ll/qfj0;)V

    .line 24
    .line 25
    .line 26
    iput-object v1, p0, Ll/rwk;->d:Ll/rwk$a;

    .line 27
    .line 28
    iget-object p0, p0, Ll/rwk;->a:Ll/vke0;

    .line 29
    .line 30
    invoke-virtual {p0, p1, p2}, Ll/vke0;->b(Ll/bsf;Ll/jkj0$d;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final j(JIIJ)V
    .locals 8
    .annotation runtime Lorg/checkerframework/checker/nullness/qual/RequiresNonNull;
        value = {
            "sampleReader"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/rwk;->d:Ll/rwk$a;

    .line 2
    .line 3
    iget-boolean v7, p0, Ll/rwk;->e:Z

    .line 4
    .line 5
    move-wide v1, p1

    .line 6
    move v3, p3

    .line 7
    move v4, p4

    .line 8
    move-wide v5, p5

    .line 9
    invoke-virtual/range {v0 .. v7}, Ll/rwk$a;->g(JIIJZ)V

    .line 10
    .line 11
    .line 12
    iget-boolean p1, p0, Ll/rwk;->e:Z

    .line 13
    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    iget-object p1, p0, Ll/rwk;->g:Ll/ib20;

    .line 17
    .line 18
    invoke-virtual {p1, v4}, Ll/ib20;->e(I)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Ll/rwk;->h:Ll/ib20;

    .line 22
    .line 23
    invoke-virtual {p1, v4}, Ll/ib20;->e(I)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Ll/rwk;->i:Ll/ib20;

    .line 27
    .line 28
    invoke-virtual {p1, v4}, Ll/ib20;->e(I)V

    .line 29
    .line 30
    .line 31
    :cond_0
    iget-object p1, p0, Ll/rwk;->j:Ll/ib20;

    .line 32
    .line 33
    invoke-virtual {p1, v4}, Ll/ib20;->e(I)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/rwk;->k:Ll/ib20;

    .line 37
    .line 38
    invoke-virtual {p0, v4}, Ll/ib20;->e(I)V

    .line 39
    .line 40
    .line 41
    return-void
.end method
