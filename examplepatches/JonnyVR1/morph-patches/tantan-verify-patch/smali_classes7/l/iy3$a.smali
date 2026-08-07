.class public Ll/iy3$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/iy3;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public final a:J

.field public final b:Ll/x1d0;

.field public final c:Ll/i5d0;

.field public d:Ljava/util/Date;

.field public e:Ljava/lang/String;

.field public f:Ljava/util/Date;

.field public g:Ljava/lang/String;

.field public h:Ljava/util/Date;

.field public i:J

.field public j:J

.field public k:Ljava/lang/String;

.field public l:I


# direct methods
.method public constructor <init>(JLl/x1d0;Ll/i5d0;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/iy3$a;->l:I

    .line 6
    .line 7
    iput-wide p1, p0, Ll/iy3$a;->a:J

    .line 8
    .line 9
    iput-object p3, p0, Ll/iy3$a;->b:Ll/x1d0;

    .line 10
    .line 11
    iput-object p4, p0, Ll/iy3$a;->c:Ll/i5d0;

    .line 12
    .line 13
    if-eqz p4, :cond_5

    .line 14
    .line 15
    invoke-virtual {p4}, Ll/i5d0;->a0()J

    .line 16
    .line 17
    .line 18
    move-result-wide p1

    .line 19
    iput-wide p1, p0, Ll/iy3$a;->i:J

    .line 20
    .line 21
    invoke-virtual {p4}, Ll/i5d0;->U()J

    .line 22
    .line 23
    .line 24
    move-result-wide p1

    .line 25
    iput-wide p1, p0, Ll/iy3$a;->j:J

    .line 26
    .line 27
    invoke-virtual {p4}, Ll/i5d0;->F()Ll/e0l;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1}, Ll/e0l;->k()I

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    const/4 p3, 0x0

    .line 36
    :goto_0
    if-ge p3, p2, :cond_5

    .line 37
    .line 38
    invoke-virtual {p1, p3}, Ll/e0l;->f(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p4

    .line 42
    invoke-virtual {p1, p3}, Ll/e0l;->m(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    const-string v2, "Date"

    .line 47
    .line 48
    invoke-virtual {v2, p4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    if-eqz v2, :cond_0

    .line 53
    .line 54
    invoke-static {v1}, Ll/pml;->b(Ljava/lang/String;)Ljava/util/Date;

    .line 55
    .line 56
    .line 57
    move-result-object p4

    .line 58
    iput-object p4, p0, Ll/iy3$a;->d:Ljava/util/Date;

    .line 59
    .line 60
    iput-object v1, p0, Ll/iy3$a;->e:Ljava/lang/String;

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_0
    const-string v2, "Expires"

    .line 64
    .line 65
    invoke-virtual {v2, p4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    if-eqz v2, :cond_1

    .line 70
    .line 71
    invoke-static {v1}, Ll/pml;->b(Ljava/lang/String;)Ljava/util/Date;

    .line 72
    .line 73
    .line 74
    move-result-object p4

    .line 75
    iput-object p4, p0, Ll/iy3$a;->h:Ljava/util/Date;

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_1
    const-string v2, "Last-Modified"

    .line 79
    .line 80
    invoke-virtual {v2, p4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    if-eqz v2, :cond_2

    .line 85
    .line 86
    invoke-static {v1}, Ll/pml;->b(Ljava/lang/String;)Ljava/util/Date;

    .line 87
    .line 88
    .line 89
    move-result-object p4

    .line 90
    iput-object p4, p0, Ll/iy3$a;->f:Ljava/util/Date;

    .line 91
    .line 92
    iput-object v1, p0, Ll/iy3$a;->g:Ljava/lang/String;

    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_2
    const-string v2, "ETag"

    .line 96
    .line 97
    invoke-virtual {v2, p4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    if-eqz v2, :cond_3

    .line 102
    .line 103
    iput-object v1, p0, Ll/iy3$a;->k:Ljava/lang/String;

    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_3
    const-string v2, "Age"

    .line 107
    .line 108
    invoke-virtual {v2, p4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 109
    .line 110
    .line 111
    move-result p4

    .line 112
    if-eqz p4, :cond_4

    .line 113
    .line 114
    invoke-static {v1, v0}, Ll/yml;->f(Ljava/lang/String;I)I

    .line 115
    .line 116
    .line 117
    move-result p4

    .line 118
    iput p4, p0, Ll/iy3$a;->l:I

    .line 119
    .line 120
    :cond_4
    :goto_1
    add-int/lit8 p3, p3, 0x1

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_5
    return-void
.end method

.method public static e(Ll/x1d0;)Z
    .locals 1

    .line 1
    const-string v0, "If-Modified-Since"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/x1d0;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    const-string v0, "If-None-Match"

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/x1d0;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method


# virtual methods
.method public final a()J
    .locals 9

    .line 1
    iget-object v0, p0, Ll/iy3$a;->d:Ljava/util/Date;

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-wide v3, p0, Ll/iy3$a;->j:J

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    .line 10
    .line 11
    .line 12
    move-result-wide v5

    .line 13
    sub-long/2addr v3, v5

    .line 14
    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->max(JJ)J

    .line 15
    .line 16
    .line 17
    move-result-wide v1

    .line 18
    :cond_0
    iget v0, p0, Ll/iy3$a;->l:I

    .line 19
    .line 20
    const/4 v3, -0x1

    .line 21
    if-eq v0, v3, :cond_1

    .line 22
    .line 23
    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 24
    .line 25
    int-to-long v4, v0

    .line 26
    invoke-virtual {v3, v4, v5}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    .line 27
    .line 28
    .line 29
    move-result-wide v3

    .line 30
    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->max(JJ)J

    .line 31
    .line 32
    .line 33
    move-result-wide v1

    .line 34
    :cond_1
    iget-wide v3, p0, Ll/iy3$a;->j:J

    .line 35
    .line 36
    iget-wide v5, p0, Ll/iy3$a;->i:J

    .line 37
    .line 38
    sub-long v5, v3, v5

    .line 39
    .line 40
    iget-wide v7, p0, Ll/iy3$a;->a:J

    .line 41
    .line 42
    sub-long/2addr v7, v3

    .line 43
    add-long/2addr v1, v5

    .line 44
    add-long/2addr v1, v7

    .line 45
    return-wide v1
.end method

.method public final b()J
    .locals 7

    .line 1
    iget-object v0, p0, Ll/iy3$a;->c:Ll/i5d0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/i5d0;->m()Ll/yx3;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/yx3;->d()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, -0x1

    .line 12
    if-eq v1, v2, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/yx3;->d()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    int-to-long v0, p0

    .line 19
    sget-object p0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 20
    .line 21
    invoke-virtual {p0, v0, v1}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    .line 22
    .line 23
    .line 24
    move-result-wide v0

    .line 25
    return-wide v0

    .line 26
    :cond_0
    iget-object v0, p0, Ll/iy3$a;->h:Ljava/util/Date;

    .line 27
    .line 28
    const-wide/16 v1, 0x0

    .line 29
    .line 30
    if-eqz v0, :cond_3

    .line 31
    .line 32
    iget-object v0, p0, Ll/iy3$a;->d:Ljava/util/Date;

    .line 33
    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    .line 37
    .line 38
    .line 39
    move-result-wide v3

    .line 40
    goto :goto_0

    .line 41
    :cond_1
    iget-wide v3, p0, Ll/iy3$a;->j:J

    .line 42
    .line 43
    :goto_0
    iget-object p0, p0, Ll/iy3$a;->h:Ljava/util/Date;

    .line 44
    .line 45
    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    .line 46
    .line 47
    .line 48
    move-result-wide v5

    .line 49
    sub-long/2addr v5, v3

    .line 50
    cmp-long p0, v5, v1

    .line 51
    .line 52
    if-lez p0, :cond_2

    .line 53
    .line 54
    return-wide v5

    .line 55
    :cond_2
    return-wide v1

    .line 56
    :cond_3
    iget-object v0, p0, Ll/iy3$a;->f:Ljava/util/Date;

    .line 57
    .line 58
    if-eqz v0, :cond_5

    .line 59
    .line 60
    iget-object v0, p0, Ll/iy3$a;->c:Ll/i5d0;

    .line 61
    .line 62
    invoke-virtual {v0}, Ll/i5d0;->Z()Ll/x1d0;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0}, Ll/x1d0;->k()Ll/rnl;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {v0}, Ll/rnl;->z()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    if-nez v0, :cond_5

    .line 75
    .line 76
    iget-object v0, p0, Ll/iy3$a;->d:Ljava/util/Date;

    .line 77
    .line 78
    if-eqz v0, :cond_4

    .line 79
    .line 80
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    .line 81
    .line 82
    .line 83
    move-result-wide v3

    .line 84
    goto :goto_1

    .line 85
    :cond_4
    iget-wide v3, p0, Ll/iy3$a;->i:J

    .line 86
    .line 87
    :goto_1
    iget-object p0, p0, Ll/iy3$a;->f:Ljava/util/Date;

    .line 88
    .line 89
    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    .line 90
    .line 91
    .line 92
    move-result-wide v5

    .line 93
    sub-long/2addr v3, v5

    .line 94
    cmp-long p0, v3, v1

    .line 95
    .line 96
    if-lez p0, :cond_5

    .line 97
    .line 98
    const-wide/16 v0, 0xa

    .line 99
    .line 100
    div-long/2addr v3, v0

    .line 101
    return-wide v3

    .line 102
    :cond_5
    return-wide v1
.end method

.method public c()Ll/iy3;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/iy3$a;->d()Ll/iy3;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, v0, Ll/iy3;->a:Ll/x1d0;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/iy3$a;->b:Ll/x1d0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/x1d0;->b()Ll/yx3;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/yx3;->j()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    new-instance p0, Ll/iy3;

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    invoke-direct {p0, v0, v0}, Ll/iy3;-><init>(Ll/x1d0;Ll/i5d0;)V

    .line 25
    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_0
    return-object v0
.end method

.method public final d()Ll/iy3;
    .locals 14

    .line 1
    iget-object v0, p0, Ll/iy3$a;->c:Ll/i5d0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/iy3$a;->b:Ll/x1d0;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    new-instance p0, Ll/iy3;

    .line 9
    .line 10
    invoke-direct {p0, v1, v2}, Ll/iy3;-><init>(Ll/x1d0;Ll/i5d0;)V

    .line 11
    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    invoke-virtual {v1}, Ll/x1d0;->f()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-object v0, p0, Ll/iy3$a;->c:Ll/i5d0;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/i5d0;->t()Ll/txk;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    new-instance v0, Ll/iy3;

    .line 29
    .line 30
    iget-object p0, p0, Ll/iy3$a;->b:Ll/x1d0;

    .line 31
    .line 32
    invoke-direct {v0, p0, v2}, Ll/iy3;-><init>(Ll/x1d0;Ll/i5d0;)V

    .line 33
    .line 34
    .line 35
    return-object v0

    .line 36
    :cond_1
    iget-object v0, p0, Ll/iy3$a;->c:Ll/i5d0;

    .line 37
    .line 38
    iget-object v1, p0, Ll/iy3$a;->b:Ll/x1d0;

    .line 39
    .line 40
    invoke-static {v0, v1}, Ll/iy3;->a(Ll/i5d0;Ll/x1d0;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    iget-object v1, p0, Ll/iy3$a;->b:Ll/x1d0;

    .line 45
    .line 46
    if-nez v0, :cond_2

    .line 47
    .line 48
    new-instance p0, Ll/iy3;

    .line 49
    .line 50
    invoke-direct {p0, v1, v2}, Ll/iy3;-><init>(Ll/x1d0;Ll/i5d0;)V

    .line 51
    .line 52
    .line 53
    return-object p0

    .line 54
    :cond_2
    invoke-virtual {v1}, Ll/x1d0;->b()Ll/yx3;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v0}, Ll/yx3;->h()Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    if-nez v1, :cond_d

    .line 63
    .line 64
    iget-object v1, p0, Ll/iy3$a;->b:Ll/x1d0;

    .line 65
    .line 66
    invoke-static {v1}, Ll/iy3$a;->e(Ll/x1d0;)Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_3

    .line 71
    .line 72
    goto/16 :goto_2

    .line 73
    .line 74
    :cond_3
    iget-object v1, p0, Ll/iy3$a;->c:Ll/i5d0;

    .line 75
    .line 76
    invoke-virtual {v1}, Ll/i5d0;->m()Ll/yx3;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {p0}, Ll/iy3$a;->a()J

    .line 81
    .line 82
    .line 83
    move-result-wide v3

    .line 84
    invoke-virtual {p0}, Ll/iy3$a;->b()J

    .line 85
    .line 86
    .line 87
    move-result-wide v5

    .line 88
    invoke-virtual {v0}, Ll/yx3;->d()I

    .line 89
    .line 90
    .line 91
    move-result v7

    .line 92
    sget-object v8, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 93
    .line 94
    const/4 v9, -0x1

    .line 95
    if-eq v7, v9, :cond_4

    .line 96
    .line 97
    invoke-virtual {v0}, Ll/yx3;->d()I

    .line 98
    .line 99
    .line 100
    move-result v7

    .line 101
    int-to-long v10, v7

    .line 102
    invoke-virtual {v8, v10, v11}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    .line 103
    .line 104
    .line 105
    move-result-wide v10

    .line 106
    invoke-static {v5, v6, v10, v11}, Ljava/lang/Math;->min(JJ)J

    .line 107
    .line 108
    .line 109
    move-result-wide v5

    .line 110
    :cond_4
    invoke-virtual {v0}, Ll/yx3;->f()I

    .line 111
    .line 112
    .line 113
    move-result v7

    .line 114
    const-wide/16 v10, 0x0

    .line 115
    .line 116
    if-eq v7, v9, :cond_5

    .line 117
    .line 118
    invoke-virtual {v0}, Ll/yx3;->f()I

    .line 119
    .line 120
    .line 121
    move-result v7

    .line 122
    int-to-long v12, v7

    .line 123
    invoke-virtual {v8, v12, v13}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    .line 124
    .line 125
    .line 126
    move-result-wide v12

    .line 127
    goto :goto_0

    .line 128
    :cond_5
    move-wide v12, v10

    .line 129
    :goto_0
    invoke-virtual {v1}, Ll/yx3;->g()Z

    .line 130
    .line 131
    .line 132
    move-result v7

    .line 133
    if-nez v7, :cond_6

    .line 134
    .line 135
    invoke-virtual {v0}, Ll/yx3;->e()I

    .line 136
    .line 137
    .line 138
    move-result v7

    .line 139
    if-eq v7, v9, :cond_6

    .line 140
    .line 141
    invoke-virtual {v0}, Ll/yx3;->e()I

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    int-to-long v9, v0

    .line 146
    invoke-virtual {v8, v9, v10}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    .line 147
    .line 148
    .line 149
    move-result-wide v10

    .line 150
    :cond_6
    invoke-virtual {v1}, Ll/yx3;->h()Z

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    if-nez v0, :cond_9

    .line 155
    .line 156
    add-long/2addr v12, v3

    .line 157
    add-long/2addr v10, v5

    .line 158
    cmp-long v0, v12, v10

    .line 159
    .line 160
    if-gez v0, :cond_9

    .line 161
    .line 162
    iget-object v0, p0, Ll/iy3$a;->c:Ll/i5d0;

    .line 163
    .line 164
    invoke-virtual {v0}, Ll/i5d0;->N()Ll/i5d0$a;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    cmp-long v1, v12, v5

    .line 169
    .line 170
    const-string v5, "Warning"

    .line 171
    .line 172
    if-ltz v1, :cond_7

    .line 173
    .line 174
    const-string v1, "110 HttpURLConnection \"Response is stale\""

    .line 175
    .line 176
    invoke-virtual {v0, v5, v1}, Ll/i5d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/i5d0$a;

    .line 177
    .line 178
    .line 179
    :cond_7
    const-wide/32 v6, 0x5265c00

    .line 180
    .line 181
    .line 182
    cmp-long v1, v3, v6

    .line 183
    .line 184
    if-lez v1, :cond_8

    .line 185
    .line 186
    invoke-virtual {p0}, Ll/iy3$a;->f()Z

    .line 187
    .line 188
    .line 189
    move-result p0

    .line 190
    if-eqz p0, :cond_8

    .line 191
    .line 192
    const-string p0, "113 HttpURLConnection \"Heuristic expiration\""

    .line 193
    .line 194
    invoke-virtual {v0, v5, p0}, Ll/i5d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/i5d0$a;

    .line 195
    .line 196
    .line 197
    :cond_8
    new-instance p0, Ll/iy3;

    .line 198
    .line 199
    invoke-virtual {v0}, Ll/i5d0$a;->c()Ll/i5d0;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    invoke-direct {p0, v2, v0}, Ll/iy3;-><init>(Ll/x1d0;Ll/i5d0;)V

    .line 204
    .line 205
    .line 206
    return-object p0

    .line 207
    :cond_9
    iget-object v0, p0, Ll/iy3$a;->k:Ljava/lang/String;

    .line 208
    .line 209
    if-eqz v0, :cond_a

    .line 210
    .line 211
    const-string v1, "If-None-Match"

    .line 212
    .line 213
    goto :goto_1

    .line 214
    :cond_a
    iget-object v0, p0, Ll/iy3$a;->f:Ljava/util/Date;

    .line 215
    .line 216
    const-string v1, "If-Modified-Since"

    .line 217
    .line 218
    if-eqz v0, :cond_b

    .line 219
    .line 220
    iget-object v0, p0, Ll/iy3$a;->g:Ljava/lang/String;

    .line 221
    .line 222
    goto :goto_1

    .line 223
    :cond_b
    iget-object v0, p0, Ll/iy3$a;->d:Ljava/util/Date;

    .line 224
    .line 225
    if-eqz v0, :cond_c

    .line 226
    .line 227
    iget-object v0, p0, Ll/iy3$a;->e:Ljava/lang/String;

    .line 228
    .line 229
    :goto_1
    iget-object v2, p0, Ll/iy3$a;->b:Ll/x1d0;

    .line 230
    .line 231
    invoke-virtual {v2}, Ll/x1d0;->e()Ll/e0l;

    .line 232
    .line 233
    .line 234
    move-result-object v2

    .line 235
    invoke-virtual {v2}, Ll/e0l;->h()Ll/e0l$a;

    .line 236
    .line 237
    .line 238
    move-result-object v2

    .line 239
    sget-object v3, Ll/kzm;->a:Ll/kzm;

    .line 240
    .line 241
    invoke-virtual {v3, v2, v1, v0}, Ll/kzm;->b(Ll/e0l$a;Ljava/lang/String;Ljava/lang/String;)V

    .line 242
    .line 243
    .line 244
    iget-object v0, p0, Ll/iy3$a;->b:Ll/x1d0;

    .line 245
    .line 246
    invoke-virtual {v0}, Ll/x1d0;->h()Ll/x1d0$a;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    invoke-virtual {v2}, Ll/e0l$a;->e()Ll/e0l;

    .line 251
    .line 252
    .line 253
    move-result-object v1

    .line 254
    invoke-virtual {v0, v1}, Ll/x1d0$a;->i(Ll/e0l;)Ll/x1d0$a;

    .line 255
    .line 256
    .line 257
    move-result-object v0

    .line 258
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 259
    .line 260
    .line 261
    move-result-object v0

    .line 262
    new-instance v1, Ll/iy3;

    .line 263
    .line 264
    iget-object p0, p0, Ll/iy3$a;->c:Ll/i5d0;

    .line 265
    .line 266
    invoke-direct {v1, v0, p0}, Ll/iy3;-><init>(Ll/x1d0;Ll/i5d0;)V

    .line 267
    .line 268
    .line 269
    return-object v1

    .line 270
    :cond_c
    new-instance v0, Ll/iy3;

    .line 271
    .line 272
    iget-object p0, p0, Ll/iy3$a;->b:Ll/x1d0;

    .line 273
    .line 274
    invoke-direct {v0, p0, v2}, Ll/iy3;-><init>(Ll/x1d0;Ll/i5d0;)V

    .line 275
    .line 276
    .line 277
    return-object v0

    .line 278
    :cond_d
    :goto_2
    new-instance v0, Ll/iy3;

    .line 279
    .line 280
    iget-object p0, p0, Ll/iy3$a;->b:Ll/x1d0;

    .line 281
    .line 282
    invoke-direct {v0, p0, v2}, Ll/iy3;-><init>(Ll/x1d0;Ll/i5d0;)V

    .line 283
    .line 284
    .line 285
    return-object v0
.end method

.method public final f()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/iy3$a;->c:Ll/i5d0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/i5d0;->m()Ll/yx3;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/yx3;->d()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, -0x1

    .line 12
    if-ne v0, v1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Ll/iy3$a;->h:Ljava/util/Date;

    .line 15
    .line 16
    if-nez p0, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method
