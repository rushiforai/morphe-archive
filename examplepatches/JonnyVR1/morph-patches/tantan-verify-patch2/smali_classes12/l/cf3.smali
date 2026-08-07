.class public final Ll/cf3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/d13;

.field public final b:Ll/s5d0;

.field public final c:Ll/s5d0;

.field public final d:Ll/s5d0;

.field public final e:Ll/s5d0;

.field public final f:I

.field public final g:I

.field public final h:I

.field public final i:I


# direct methods
.method public constructor <init>(Ll/cf3;)V
    .locals 1

    .line 154
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 155
    iget-object v0, p1, Ll/cf3;->a:Ll/d13;

    iput-object v0, p0, Ll/cf3;->a:Ll/d13;

    .line 156
    invoke-virtual {p1}, Ll/cf3;->h()Ll/s5d0;

    move-result-object v0

    iput-object v0, p0, Ll/cf3;->b:Ll/s5d0;

    .line 157
    invoke-virtual {p1}, Ll/cf3;->b()Ll/s5d0;

    move-result-object v0

    iput-object v0, p0, Ll/cf3;->c:Ll/s5d0;

    .line 158
    invoke-virtual {p1}, Ll/cf3;->i()Ll/s5d0;

    move-result-object v0

    iput-object v0, p0, Ll/cf3;->d:Ll/s5d0;

    .line 159
    invoke-virtual {p1}, Ll/cf3;->c()Ll/s5d0;

    move-result-object v0

    iput-object v0, p0, Ll/cf3;->e:Ll/s5d0;

    .line 160
    invoke-virtual {p1}, Ll/cf3;->f()I

    move-result v0

    iput v0, p0, Ll/cf3;->f:I

    .line 161
    invoke-virtual {p1}, Ll/cf3;->d()I

    move-result v0

    iput v0, p0, Ll/cf3;->g:I

    .line 162
    invoke-virtual {p1}, Ll/cf3;->g()I

    move-result v0

    iput v0, p0, Ll/cf3;->h:I

    .line 163
    invoke-virtual {p1}, Ll/cf3;->e()I

    move-result p1

    iput p1, p0, Ll/cf3;->i:I

    return-void
.end method

.method public constructor <init>(Ll/d13;Ll/s5d0;Ll/s5d0;Ll/s5d0;Ll/s5d0;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz p2, :cond_1

    .line 7
    .line 8
    if-nez p3, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move v2, v0

    .line 12
    goto :goto_1

    .line 13
    :cond_1
    :goto_0
    move v2, v1

    .line 14
    :goto_1
    if-eqz p4, :cond_2

    .line 15
    .line 16
    if-nez p5, :cond_3

    .line 17
    .line 18
    :cond_2
    move v0, v1

    .line 19
    :cond_3
    if-eqz v2, :cond_5

    .line 20
    .line 21
    if-nez v0, :cond_4

    .line 22
    .line 23
    goto :goto_2

    .line 24
    :cond_4
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    throw p0

    .line 29
    :cond_5
    :goto_2
    if-eqz v2, :cond_6

    .line 30
    .line 31
    new-instance p2, Ll/s5d0;

    .line 32
    .line 33
    invoke-virtual {p4}, Ll/s5d0;->d()F

    .line 34
    .line 35
    .line 36
    move-result p3

    .line 37
    const/4 v0, 0x0

    .line 38
    invoke-direct {p2, v0, p3}, Ll/s5d0;-><init>(FF)V

    .line 39
    .line 40
    .line 41
    new-instance p3, Ll/s5d0;

    .line 42
    .line 43
    invoke-virtual {p5}, Ll/s5d0;->d()F

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    invoke-direct {p3, v0, v1}, Ll/s5d0;-><init>(FF)V

    .line 48
    .line 49
    .line 50
    goto :goto_3

    .line 51
    :cond_6
    if-eqz v0, :cond_7

    .line 52
    .line 53
    new-instance p4, Ll/s5d0;

    .line 54
    .line 55
    invoke-virtual {p1}, Ll/d13;->m()I

    .line 56
    .line 57
    .line 58
    move-result p5

    .line 59
    sub-int/2addr p5, v1

    .line 60
    int-to-float p5, p5

    .line 61
    invoke-virtual {p2}, Ll/s5d0;->d()F

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    invoke-direct {p4, p5, v0}, Ll/s5d0;-><init>(FF)V

    .line 66
    .line 67
    .line 68
    new-instance p5, Ll/s5d0;

    .line 69
    .line 70
    invoke-virtual {p1}, Ll/d13;->m()I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    sub-int/2addr v0, v1

    .line 75
    int-to-float v0, v0

    .line 76
    invoke-virtual {p3}, Ll/s5d0;->d()F

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    invoke-direct {p5, v0, v1}, Ll/s5d0;-><init>(FF)V

    .line 81
    .line 82
    .line 83
    :cond_7
    :goto_3
    iput-object p1, p0, Ll/cf3;->a:Ll/d13;

    .line 84
    .line 85
    iput-object p2, p0, Ll/cf3;->b:Ll/s5d0;

    .line 86
    .line 87
    iput-object p3, p0, Ll/cf3;->c:Ll/s5d0;

    .line 88
    .line 89
    iput-object p4, p0, Ll/cf3;->d:Ll/s5d0;

    .line 90
    .line 91
    iput-object p5, p0, Ll/cf3;->e:Ll/s5d0;

    .line 92
    .line 93
    invoke-virtual {p2}, Ll/s5d0;->c()F

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    invoke-virtual {p3}, Ll/s5d0;->c()F

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    invoke-static {p1, v0}, Ljava/lang/Math;->min(FF)F

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    float-to-int p1, p1

    .line 106
    iput p1, p0, Ll/cf3;->f:I

    .line 107
    .line 108
    invoke-virtual {p4}, Ll/s5d0;->c()F

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    invoke-virtual {p5}, Ll/s5d0;->c()F

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    invoke-static {p1, v0}, Ljava/lang/Math;->max(FF)F

    .line 117
    .line 118
    .line 119
    move-result p1

    .line 120
    float-to-int p1, p1

    .line 121
    iput p1, p0, Ll/cf3;->g:I

    .line 122
    .line 123
    invoke-virtual {p2}, Ll/s5d0;->d()F

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    invoke-virtual {p4}, Ll/s5d0;->d()F

    .line 128
    .line 129
    .line 130
    move-result p2

    .line 131
    invoke-static {p1, p2}, Ljava/lang/Math;->min(FF)F

    .line 132
    .line 133
    .line 134
    move-result p1

    .line 135
    float-to-int p1, p1

    .line 136
    iput p1, p0, Ll/cf3;->h:I

    .line 137
    .line 138
    invoke-virtual {p3}, Ll/s5d0;->d()F

    .line 139
    .line 140
    .line 141
    move-result p1

    .line 142
    invoke-virtual {p5}, Ll/s5d0;->d()F

    .line 143
    .line 144
    .line 145
    move-result p2

    .line 146
    invoke-static {p1, p2}, Ljava/lang/Math;->max(FF)F

    .line 147
    .line 148
    .line 149
    move-result p1

    .line 150
    float-to-int p1, p1

    .line 151
    iput p1, p0, Ll/cf3;->i:I

    .line 152
    .line 153
    return-void
.end method

.method public static j(Ll/cf3;Ll/cf3;)Ll/cf3;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    return-object p1

    .line 4
    :cond_0
    if-nez p1, :cond_1

    .line 5
    .line 6
    return-object p0

    .line 7
    :cond_1
    new-instance v0, Ll/cf3;

    .line 8
    .line 9
    iget-object v1, p0, Ll/cf3;->a:Ll/d13;

    .line 10
    .line 11
    iget-object v2, p0, Ll/cf3;->b:Ll/s5d0;

    .line 12
    .line 13
    iget-object v3, p0, Ll/cf3;->c:Ll/s5d0;

    .line 14
    .line 15
    iget-object v4, p1, Ll/cf3;->d:Ll/s5d0;

    .line 16
    .line 17
    iget-object v5, p1, Ll/cf3;->e:Ll/s5d0;

    .line 18
    .line 19
    invoke-direct/range {v0 .. v5}, Ll/cf3;-><init>(Ll/d13;Ll/s5d0;Ll/s5d0;Ll/s5d0;Ll/s5d0;)V

    .line 20
    .line 21
    .line 22
    return-object v0
.end method


# virtual methods
.method public a(IIZ)Ll/cf3;
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/cf3;->b:Ll/s5d0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/cf3;->c:Ll/s5d0;

    .line 4
    .line 5
    iget-object v2, p0, Ll/cf3;->d:Ll/s5d0;

    .line 6
    .line 7
    iget-object v3, p0, Ll/cf3;->e:Ll/s5d0;

    .line 8
    .line 9
    if-lez p1, :cond_3

    .line 10
    .line 11
    if-eqz p3, :cond_0

    .line 12
    .line 13
    move-object v4, v0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move-object v4, v2

    .line 16
    :goto_0
    invoke-virtual {v4}, Ll/s5d0;->d()F

    .line 17
    .line 18
    .line 19
    move-result v5

    .line 20
    float-to-int v5, v5

    .line 21
    sub-int/2addr v5, p1

    .line 22
    if-gez v5, :cond_1

    .line 23
    .line 24
    const/4 v5, 0x0

    .line 25
    :cond_1
    new-instance p1, Ll/s5d0;

    .line 26
    .line 27
    invoke-virtual {v4}, Ll/s5d0;->c()F

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    int-to-float v5, v5

    .line 32
    invoke-direct {p1, v4, v5}, Ll/s5d0;-><init>(FF)V

    .line 33
    .line 34
    .line 35
    if-eqz p3, :cond_2

    .line 36
    .line 37
    move-object v8, p1

    .line 38
    :goto_1
    move-object v10, v2

    .line 39
    goto :goto_2

    .line 40
    :cond_2
    move-object v10, p1

    .line 41
    move-object v8, v0

    .line 42
    goto :goto_2

    .line 43
    :cond_3
    move-object v8, v0

    .line 44
    goto :goto_1

    .line 45
    :goto_2
    if-lez p2, :cond_7

    .line 46
    .line 47
    if-eqz p3, :cond_4

    .line 48
    .line 49
    iget-object p1, p0, Ll/cf3;->c:Ll/s5d0;

    .line 50
    .line 51
    goto :goto_3

    .line 52
    :cond_4
    iget-object p1, p0, Ll/cf3;->e:Ll/s5d0;

    .line 53
    .line 54
    :goto_3
    invoke-virtual {p1}, Ll/s5d0;->d()F

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    float-to-int v0, v0

    .line 59
    add-int/2addr v0, p2

    .line 60
    iget-object p2, p0, Ll/cf3;->a:Ll/d13;

    .line 61
    .line 62
    invoke-virtual {p2}, Ll/d13;->j()I

    .line 63
    .line 64
    .line 65
    move-result p2

    .line 66
    if-lt v0, p2, :cond_5

    .line 67
    .line 68
    iget-object p2, p0, Ll/cf3;->a:Ll/d13;

    .line 69
    .line 70
    invoke-virtual {p2}, Ll/d13;->j()I

    .line 71
    .line 72
    .line 73
    move-result p2

    .line 74
    add-int/lit8 v0, p2, -0x1

    .line 75
    .line 76
    :cond_5
    new-instance p2, Ll/s5d0;

    .line 77
    .line 78
    invoke-virtual {p1}, Ll/s5d0;->c()F

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    int-to-float v0, v0

    .line 83
    invoke-direct {p2, p1, v0}, Ll/s5d0;-><init>(FF)V

    .line 84
    .line 85
    .line 86
    if-eqz p3, :cond_6

    .line 87
    .line 88
    move-object v9, p2

    .line 89
    :goto_4
    move-object v11, v3

    .line 90
    goto :goto_5

    .line 91
    :cond_6
    move-object v11, p2

    .line 92
    move-object v9, v1

    .line 93
    goto :goto_5

    .line 94
    :cond_7
    move-object v9, v1

    .line 95
    goto :goto_4

    .line 96
    :goto_5
    new-instance v6, Ll/cf3;

    .line 97
    .line 98
    iget-object v7, p0, Ll/cf3;->a:Ll/d13;

    .line 99
    .line 100
    invoke-direct/range {v6 .. v11}, Ll/cf3;-><init>(Ll/d13;Ll/s5d0;Ll/s5d0;Ll/s5d0;Ll/s5d0;)V

    .line 101
    .line 102
    .line 103
    return-object v6
.end method

.method public b()Ll/s5d0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cf3;->c:Ll/s5d0;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ll/s5d0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cf3;->e:Ll/s5d0;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget p0, p0, Ll/cf3;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public e()I
    .locals 0

    .line 1
    iget p0, p0, Ll/cf3;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public f()I
    .locals 0

    .line 1
    iget p0, p0, Ll/cf3;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public g()I
    .locals 0

    .line 1
    iget p0, p0, Ll/cf3;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public h()Ll/s5d0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cf3;->b:Ll/s5d0;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()Ll/s5d0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cf3;->d:Ll/s5d0;

    .line 2
    .line 3
    return-object p0
.end method
