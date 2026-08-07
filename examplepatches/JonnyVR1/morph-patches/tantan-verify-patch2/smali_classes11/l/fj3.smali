.class public final Ll/fj3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/exoplayer2/source/m;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Ll/esf;

.field public b:Ll/zrf;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public c:Ll/asf;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/esf;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/fj3;->a:Ll/esf;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(JJ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fj3;->b:Ll/zrf;

    .line 2
    .line 3
    invoke-static {p0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/zrf;

    .line 8
    .line 9
    invoke-interface {p0, p1, p2, p3, p4}, Ll/zrf;->a(JJ)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public b()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/fj3;->c:Ll/asf;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/asf;->getPosition()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, -0x1

    .line 11
    .line 12
    return-wide v0
.end method

.method public c(Ll/ll80;)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/fj3;->b:Ll/zrf;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/zrf;

    .line 8
    .line 9
    iget-object p0, p0, Ll/fj3;->c:Ll/asf;

    .line 10
    .line 11
    invoke-static {p0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ll/asf;

    .line 16
    .line 17
    invoke-interface {v0, p0, p1}, Ll/zrf;->h(Ll/asf;Ll/ll80;)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public d()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/fj3;->b:Ll/zrf;

    .line 2
    .line 3
    instance-of v0, p0, Ll/z610;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Ll/z610;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/z610;->j()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public e(Ll/e6c;Landroid/net/Uri;Ljava/util/Map;JJLl/bsf;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/e6c;",
            "Landroid/net/Uri;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;JJ",
            "Ll/bsf;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v1, Ll/qod;

    .line 2
    .line 3
    move-object v2, p1

    .line 4
    move-wide v3, p4

    .line 5
    move-wide v5, p6

    .line 6
    invoke-direct/range {v1 .. v6}, Ll/qod;-><init>(Ll/e6c;JJ)V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Ll/fj3;->c:Ll/asf;

    .line 10
    .line 11
    iget-object p1, p0, Ll/fj3;->b:Ll/zrf;

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object p1, p0, Ll/fj3;->a:Ll/esf;

    .line 17
    .line 18
    invoke-interface {p1, p2, p3}, Ll/esf;->a(Landroid/net/Uri;Ljava/util/Map;)[Ll/zrf;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    array-length p3, p1

    .line 23
    const/4 p4, 0x0

    .line 24
    const/4 p5, 0x1

    .line 25
    if-ne p3, p5, :cond_1

    .line 26
    .line 27
    aget-object p1, p1, p4

    .line 28
    .line 29
    iput-object p1, p0, Ll/fj3;->b:Ll/zrf;

    .line 30
    .line 31
    goto :goto_6

    .line 32
    :cond_1
    array-length p3, p1

    .line 33
    move p6, p4

    .line 34
    :goto_0
    if-ge p6, p3, :cond_7

    .line 35
    .line 36
    aget-object p7, p1, p6

    .line 37
    .line 38
    :try_start_0
    invoke-interface {p7, v1}, Ll/zrf;->f(Ll/asf;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    iput-object p7, p0, Ll/fj3;->b:Ll/zrf;
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    .line 46
    invoke-static {p5}, Ll/w11;->g(Z)V

    .line 47
    .line 48
    .line 49
    invoke-interface {v1}, Ll/asf;->h()V

    .line 50
    .line 51
    .line 52
    goto :goto_5

    .line 53
    :catchall_0
    move-exception v0

    .line 54
    move-object p1, v0

    .line 55
    goto :goto_3

    .line 56
    :cond_2
    iget-object p7, p0, Ll/fj3;->b:Ll/zrf;

    .line 57
    .line 58
    if-nez p7, :cond_4

    .line 59
    .line 60
    invoke-interface {v1}, Ll/asf;->getPosition()J

    .line 61
    .line 62
    .line 63
    move-result-wide v5

    .line 64
    cmp-long p7, v5, v3

    .line 65
    .line 66
    if-nez p7, :cond_3

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_3
    move p7, p4

    .line 70
    goto :goto_2

    .line 71
    :cond_4
    :goto_1
    move p7, p5

    .line 72
    :goto_2
    invoke-static {p7}, Ll/w11;->g(Z)V

    .line 73
    .line 74
    .line 75
    invoke-interface {v1}, Ll/asf;->h()V

    .line 76
    .line 77
    .line 78
    goto :goto_4

    .line 79
    :goto_3
    iget-object p0, p0, Ll/fj3;->b:Ll/zrf;

    .line 80
    .line 81
    if-nez p0, :cond_5

    .line 82
    .line 83
    invoke-interface {v1}, Ll/asf;->getPosition()J

    .line 84
    .line 85
    .line 86
    move-result-wide p2

    .line 87
    cmp-long p0, p2, v3

    .line 88
    .line 89
    if-nez p0, :cond_6

    .line 90
    .line 91
    :cond_5
    move p4, p5

    .line 92
    :cond_6
    invoke-static {p4}, Ll/w11;->g(Z)V

    .line 93
    .line 94
    .line 95
    invoke-interface {v1}, Ll/asf;->h()V

    .line 96
    .line 97
    .line 98
    throw p1

    .line 99
    :catch_0
    iget-object p7, p0, Ll/fj3;->b:Ll/zrf;

    .line 100
    .line 101
    if-nez p7, :cond_4

    .line 102
    .line 103
    invoke-interface {v1}, Ll/asf;->getPosition()J

    .line 104
    .line 105
    .line 106
    move-result-wide v5

    .line 107
    cmp-long p7, v5, v3

    .line 108
    .line 109
    if-nez p7, :cond_3

    .line 110
    .line 111
    goto :goto_1

    .line 112
    :goto_4
    add-int/lit8 p6, p6, 0x1

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_7
    :goto_5
    iget-object p3, p0, Ll/fj3;->b:Ll/zrf;

    .line 116
    .line 117
    if-eqz p3, :cond_8

    .line 118
    .line 119
    :goto_6
    iget-object p0, p0, Ll/fj3;->b:Ll/zrf;

    .line 120
    .line 121
    invoke-interface {p0, p8}, Ll/zrf;->b(Ll/bsf;)V

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :cond_8
    new-instance p0, Lcom/google/android/exoplayer2/source/UnrecognizedInputFormatException;

    .line 126
    .line 127
    new-instance p3, Ljava/lang/StringBuilder;

    .line 128
    .line 129
    const-string p4, "None of the available extractors ("

    .line 130
    .line 131
    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    invoke-static {p1}, Ll/bmk0;->N([Ljava/lang/Object;)Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    const-string p1, ") could read the stream."

    .line 142
    .line 143
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    invoke-static {p2}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object p2

    .line 154
    check-cast p2, Landroid/net/Uri;

    .line 155
    .line 156
    invoke-direct {p0, p1, p2}, Lcom/google/android/exoplayer2/source/UnrecognizedInputFormatException;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 157
    .line 158
    .line 159
    throw p0
.end method

.method public release()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fj3;->b:Ll/zrf;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-interface {v0}, Ll/zrf;->release()V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Ll/fj3;->b:Ll/zrf;

    .line 10
    .line 11
    :cond_0
    iput-object v1, p0, Ll/fj3;->c:Ll/asf;

    .line 12
    .line 13
    return-void
.end method
