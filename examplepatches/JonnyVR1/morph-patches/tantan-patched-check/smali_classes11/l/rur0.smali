.class public final Ll/rur0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Ll/qer0;)Landroid/util/Pair;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-interface {p0}, Ll/qer0;->zzj()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/bgw0;

    .line 5
    .line 6
    const/16 v1, 0x8

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/bgw0;-><init>(I)V

    .line 9
    .line 10
    .line 11
    const v2, 0x64617461

    .line 12
    .line 13
    .line 14
    invoke-static {v2, p0, v0}, Ll/rur0;->d(ILl/qer0;Ll/bgw0;)Ll/qur0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    move-object v2, p0

    .line 19
    check-cast v2, Ll/fer0;

    .line 20
    .line 21
    const/4 v3, 0x0

    .line 22
    invoke-virtual {v2, v1, v3}, Ll/fer0;->k(IZ)Z

    .line 23
    .line 24
    .line 25
    invoke-interface {p0}, Ll/qer0;->zzf()J

    .line 26
    .line 27
    .line 28
    move-result-wide v1

    .line 29
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    iget-wide v0, v0, Ll/qur0;->b:J

    .line 34
    .line 35
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {p0, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method

.method public static b(Ll/qer0;)Ll/pur0;
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Ll/bgw0;

    .line 2
    .line 3
    const/16 v1, 0x10

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/bgw0;-><init>(I)V

    .line 6
    .line 7
    .line 8
    const v2, 0x666d7420

    .line 9
    .line 10
    .line 11
    invoke-static {v2, p0, v0}, Ll/rur0;->d(ILl/qer0;Ll/bgw0;)Ll/qur0;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    iget-wide v3, v2, Ll/qur0;->b:J

    .line 16
    .line 17
    const-wide/16 v5, 0x10

    .line 18
    .line 19
    cmp-long v3, v3, v5

    .line 20
    .line 21
    const/4 v4, 0x0

    .line 22
    if-ltz v3, :cond_0

    .line 23
    .line 24
    const/4 v3, 0x1

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move v3, v4

    .line 27
    :goto_0
    invoke-static {v3}, Ll/lev0;->f(Z)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ll/bgw0;->m()[B

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    move-object v5, p0

    .line 35
    check-cast v5, Ll/fer0;

    .line 36
    .line 37
    invoke-virtual {v5, v3, v4, v1, v4}, Ll/fer0;->c([BIIZ)Z

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v4}, Ll/bgw0;->k(I)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ll/bgw0;->z()I

    .line 44
    .line 45
    .line 46
    move-result v7

    .line 47
    invoke-virtual {v0}, Ll/bgw0;->z()I

    .line 48
    .line 49
    .line 50
    move-result v8

    .line 51
    invoke-virtual {v0}, Ll/bgw0;->y()I

    .line 52
    .line 53
    .line 54
    move-result v9

    .line 55
    invoke-virtual {v0}, Ll/bgw0;->y()I

    .line 56
    .line 57
    .line 58
    move-result v10

    .line 59
    invoke-virtual {v0}, Ll/bgw0;->z()I

    .line 60
    .line 61
    .line 62
    move-result v11

    .line 63
    invoke-virtual {v0}, Ll/bgw0;->z()I

    .line 64
    .line 65
    .line 66
    move-result v12

    .line 67
    iget-wide v0, v2, Ll/qur0;->b:J

    .line 68
    .line 69
    long-to-int v0, v0

    .line 70
    add-int/lit8 v0, v0, -0x10

    .line 71
    .line 72
    if-lez v0, :cond_1

    .line 73
    .line 74
    new-array v1, v0, [B

    .line 75
    .line 76
    invoke-virtual {v5, v1, v4, v0, v4}, Ll/fer0;->c([BIIZ)Z

    .line 77
    .line 78
    .line 79
    :goto_1
    move-object v13, v1

    .line 80
    goto :goto_2

    .line 81
    :cond_1
    sget-object v1, Ll/mpw0;->f:[B

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :goto_2
    invoke-interface {p0}, Ll/qer0;->zze()J

    .line 85
    .line 86
    .line 87
    move-result-wide v0

    .line 88
    invoke-interface {p0}, Ll/qer0;->zzf()J

    .line 89
    .line 90
    .line 91
    move-result-wide v2

    .line 92
    sub-long/2addr v0, v2

    .line 93
    check-cast p0, Ll/fer0;

    .line 94
    .line 95
    long-to-int v0, v0

    .line 96
    invoke-virtual {p0, v0, v4}, Ll/fer0;->k(IZ)Z

    .line 97
    .line 98
    .line 99
    new-instance v6, Ll/pur0;

    .line 100
    .line 101
    invoke-direct/range {v6 .. v13}, Ll/pur0;-><init>(IIIIII[B)V

    .line 102
    .line 103
    .line 104
    return-object v6
.end method

.method public static c(Ll/qer0;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Ll/bgw0;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/bgw0;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/qur0;->a(Ll/qer0;Ll/bgw0;)Ll/qur0;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iget v1, v1, Ll/qur0;->a:I

    .line 13
    .line 14
    const v2, 0x52494646

    .line 15
    .line 16
    .line 17
    const/4 v3, 0x0

    .line 18
    if-eq v1, v2, :cond_1

    .line 19
    .line 20
    const v2, 0x52463634

    .line 21
    .line 22
    .line 23
    if-ne v1, v2, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return v3

    .line 27
    :cond_1
    :goto_0
    invoke-virtual {v0}, Ll/bgw0;->m()[B

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast p0, Ll/fer0;

    .line 32
    .line 33
    const/4 v2, 0x4

    .line 34
    invoke-virtual {p0, v1, v3, v2, v3}, Ll/fer0;->c([BIIZ)Z

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v3}, Ll/bgw0;->k(I)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Ll/bgw0;->v()I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    const v0, 0x57415645

    .line 45
    .line 46
    .line 47
    if-eq p0, v0, :cond_2

    .line 48
    .line 49
    new-instance v0, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    const-string v1, "Unsupported form type: "

    .line 52
    .line 53
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    const-string v0, "WavHeaderReader"

    .line 64
    .line 65
    invoke-static {v0, p0}, Ll/y4w0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    return v3

    .line 69
    :cond_2
    const/4 p0, 0x1

    .line 70
    return p0
.end method

.method public static d(ILl/qer0;Ll/bgw0;)Ll/qur0;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {p1, p2}, Ll/qur0;->a(Ll/qer0;Ll/bgw0;)Ll/qur0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    :goto_0
    iget v1, v0, Ll/qur0;->a:I

    .line 6
    .line 7
    if-eq v1, p0, :cond_1

    .line 8
    .line 9
    new-instance v2, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v3, "Ignoring unknown WAV chunk: "

    .line 12
    .line 13
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const-string v2, "WavHeaderReader"

    .line 24
    .line 25
    invoke-static {v2, v1}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-wide v1, v0, Ll/qur0;->b:J

    .line 29
    .line 30
    const-wide/16 v3, 0x8

    .line 31
    .line 32
    add-long/2addr v1, v3

    .line 33
    const-wide/32 v3, 0x7fffffff

    .line 34
    .line 35
    .line 36
    cmp-long v3, v1, v3

    .line 37
    .line 38
    if-gtz v3, :cond_0

    .line 39
    .line 40
    long-to-int v0, v1

    .line 41
    move-object v1, p1

    .line 42
    check-cast v1, Ll/fer0;

    .line 43
    .line 44
    const/4 v2, 0x0

    .line 45
    invoke-virtual {v1, v0, v2}, Ll/fer0;->k(IZ)Z

    .line 46
    .line 47
    .line 48
    invoke-static {p1, p2}, Ll/qur0;->a(Ll/qer0;Ll/bgw0;)Ll/qur0;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    goto :goto_0

    .line 53
    :cond_0
    iget p0, v0, Ll/qur0;->a:I

    .line 54
    .line 55
    new-instance p1, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    const-string p2, "Chunk is too large (~2GB+) to skip; id: "

    .line 58
    .line 59
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-static {p0}, Lcom/google/android/gms/internal/ads/zzcc;->zzc(Ljava/lang/String;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    throw p0

    .line 74
    :cond_1
    return-object v0
.end method
