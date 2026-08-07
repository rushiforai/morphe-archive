.class public final Ll/xgx0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qkx0;


# instance fields
.field public final a:Ll/wgx0;

.field public b:I

.field public c:I

.field public d:I


# direct methods
.method public constructor <init>(Ll/wgx0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/xgx0;->d:I

    .line 6
    .line 7
    sget-object v0, Ll/gjx0;->a:Ljava/nio/charset/Charset;

    .line 8
    .line 9
    iput-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 10
    .line 11
    iput-object p0, p1, Ll/wgx0;->c:Ll/xgx0;

    .line 12
    .line 13
    return-void
.end method

.method public static final j(I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    and-int/lit8 p0, p0, 0x3

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zzg()Lcom/google/android/gms/internal/ads/zzhag;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    throw p0
.end method

.method public static final k(I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    and-int/lit8 p0, p0, 0x7

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zzg()Lcom/google/android/gms/internal/ads/zzhag;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    throw p0
.end method

.method public static l(Ll/wgx0;)Ll/xgx0;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wgx0;->c:Ll/xgx0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    new-instance v0, Ll/xgx0;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Ll/xgx0;-><init>(Ll/wgx0;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ll/ukx0;Ll/jhx0;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, v0}, Ll/xgx0;->i(I)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Ll/xgx0;->g(Ljava/lang/Object;Ll/ukx0;Ll/jhx0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final b(Ljava/lang/Object;Ll/ukx0;Ll/jhx0;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-virtual {p0, v0}, Ll/xgx0;->i(I)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Ll/xgx0;->f(Ljava/lang/Object;Ll/ukx0;Ll/jhx0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final c(Ljava/util/List;Ll/ukx0;Ll/jhx0;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget v0, p0, Ll/xgx0;->b:I

    .line 2
    .line 3
    and-int/lit8 v1, v0, 0x7

    .line 4
    .line 5
    const/4 v2, 0x3

    .line 6
    if-ne v1, v2, :cond_3

    .line 7
    .line 8
    :cond_0
    invoke-interface {p2}, Ll/ukx0;->zze()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {p0, v1, p2, p3}, Ll/xgx0;->f(Ljava/lang/Object;Ll/ukx0;Ll/jhx0;)V

    .line 13
    .line 14
    .line 15
    invoke-interface {p2, v1}, Ll/ukx0;->a(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 22
    .line 23
    invoke-virtual {v1}, Ll/wgx0;->b()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_2

    .line 28
    .line 29
    iget v1, p0, Ll/xgx0;->d:I

    .line 30
    .line 31
    if-eqz v1, :cond_1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 35
    .line 36
    invoke-virtual {v1}, Ll/wgx0;->r()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eq v1, v0, :cond_0

    .line 41
    .line 42
    iput v1, p0, Ll/xgx0;->d:I

    .line 43
    .line 44
    :cond_2
    :goto_0
    return-void

    .line 45
    :cond_3
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zza()Lcom/google/android/gms/internal/ads/zzhaf;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    throw p0
.end method

.method public final d(Ljava/util/List;Ll/ukx0;Ll/jhx0;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/xgx0;->b:I

    .line 2
    .line 3
    and-int/lit8 v1, v0, 0x7

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    if-ne v1, v2, :cond_3

    .line 7
    .line 8
    :cond_0
    invoke-interface {p2}, Ll/ukx0;->zze()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {p0, v1, p2, p3}, Ll/xgx0;->g(Ljava/lang/Object;Ll/ukx0;Ll/jhx0;)V

    .line 13
    .line 14
    .line 15
    invoke-interface {p2, v1}, Ll/ukx0;->a(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 22
    .line 23
    invoke-virtual {v1}, Ll/wgx0;->b()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_2

    .line 28
    .line 29
    iget v1, p0, Ll/xgx0;->d:I

    .line 30
    .line 31
    if-eqz v1, :cond_1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 35
    .line 36
    invoke-virtual {v1}, Ll/wgx0;->r()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eq v1, v0, :cond_0

    .line 41
    .line 42
    iput v1, p0, Ll/xgx0;->d:I

    .line 43
    .line 44
    :cond_2
    :goto_0
    return-void

    .line 45
    :cond_3
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zza()Lcom/google/android/gms/internal/ads/zzhaf;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    throw p0
.end method

.method public final e(Ljava/util/List;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/xgx0;->b:I

    .line 2
    .line 3
    and-int/lit8 v0, v0, 0x7

    .line 4
    .line 5
    const/4 v1, 0x2

    .line 6
    if-ne v0, v1, :cond_6

    .line 7
    .line 8
    instance-of v0, p1, Ll/jjx0;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    if-nez p2, :cond_2

    .line 14
    .line 15
    check-cast p1, Ll/jjx0;

    .line 16
    .line 17
    :cond_1
    invoke-virtual {p0}, Ll/xgx0;->zzp()Lcom/google/android/gms/internal/ads/zzgyl;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-interface {p1, p2}, Ll/jjx0;->Z(Lcom/google/android/gms/internal/ads/zzgyl;)V

    .line 22
    .line 23
    .line 24
    iget-object p2, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 25
    .line 26
    invoke-virtual {p2}, Ll/wgx0;->b()Z

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    if-nez p2, :cond_4

    .line 31
    .line 32
    iget-object p2, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 33
    .line 34
    invoke-virtual {p2}, Ll/wgx0;->r()I

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    iget v0, p0, Ll/xgx0;->b:I

    .line 39
    .line 40
    if-eq p2, v0, :cond_1

    .line 41
    .line 42
    goto :goto_2

    .line 43
    :cond_2
    :goto_0
    if-eqz p2, :cond_3

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/xgx0;->zzs()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    goto :goto_1

    .line 50
    :cond_3
    invoke-virtual {p0}, Ll/xgx0;->zzr()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    :goto_1
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 58
    .line 59
    invoke-virtual {v0}, Ll/wgx0;->b()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_5

    .line 64
    .line 65
    :cond_4
    return-void

    .line 66
    :cond_5
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 67
    .line 68
    invoke-virtual {v0}, Ll/wgx0;->r()I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    iget v1, p0, Ll/xgx0;->b:I

    .line 73
    .line 74
    if-eq v0, v1, :cond_2

    .line 75
    .line 76
    move p2, v0

    .line 77
    :goto_2
    iput p2, p0, Ll/xgx0;->d:I

    .line 78
    .line 79
    return-void

    .line 80
    :cond_6
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zza()Lcom/google/android/gms/internal/ads/zzhaf;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    throw p0
.end method

.method public final f(Ljava/lang/Object;Ll/ukx0;Ll/jhx0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/xgx0;->c:I

    .line 2
    .line 3
    iget v1, p0, Ll/xgx0;->b:I

    .line 4
    .line 5
    ushr-int/lit8 v1, v1, 0x3

    .line 6
    .line 7
    shl-int/lit8 v1, v1, 0x3

    .line 8
    .line 9
    or-int/lit8 v1, v1, 0x4

    .line 10
    .line 11
    iput v1, p0, Ll/xgx0;->c:I

    .line 12
    .line 13
    :try_start_0
    invoke-interface {p2, p1, p0, p3}, Ll/ukx0;->f(Ljava/lang/Object;Ll/qkx0;Ll/jhx0;)V

    .line 14
    .line 15
    .line 16
    iget p1, p0, Ll/xgx0;->b:I

    .line 17
    .line 18
    iget p2, p0, Ll/xgx0;->c:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    if-ne p1, p2, :cond_0

    .line 21
    .line 22
    iput v0, p0, Ll/xgx0;->c:I

    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    :try_start_1
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zzg()Lcom/google/android/gms/internal/ads/zzhag;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 30
    :catchall_0
    move-exception p1

    .line 31
    iput v0, p0, Ll/xgx0;->c:I

    .line 32
    .line 33
    throw p1
.end method

.method public final g(Ljava/lang/Object;Ll/ukx0;Ll/jhx0;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wgx0;->s()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    iget v2, v0, Ll/wgx0;->a:I

    .line 8
    .line 9
    iget v0, v0, Ll/wgx0;->b:I

    .line 10
    .line 11
    if-ge v2, v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/wgx0;->l(I)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 20
    .line 21
    iget v2, v1, Ll/wgx0;->a:I

    .line 22
    .line 23
    add-int/lit8 v2, v2, 0x1

    .line 24
    .line 25
    iput v2, v1, Ll/wgx0;->a:I

    .line 26
    .line 27
    invoke-interface {p2, p1, p0, p3}, Ll/ukx0;->f(Ljava/lang/Object;Ll/qkx0;Ll/jhx0;)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 31
    .line 32
    const/4 p2, 0x0

    .line 33
    invoke-virtual {p1, p2}, Ll/wgx0;->B(I)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 37
    .line 38
    iget p1, p0, Ll/wgx0;->a:I

    .line 39
    .line 40
    add-int/lit8 p1, p1, -0x1

    .line 41
    .line 42
    iput p1, p0, Ll/wgx0;->a:I

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Ll/wgx0;->a(I)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_0
    new-instance p0, Lcom/google/android/gms/internal/ads/zzhag;

    .line 49
    .line 50
    const-string p1, "Protocol message had too many levels of nesting.  May be malicious.  Use CodedInputStream.setRecursionLimit() to increase the depth limit."

    .line 51
    .line 52
    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/ads/zzhag;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    throw p0
.end method

.method public final h(I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/wgx0;->k()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-ne p0, p1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zzj()Lcom/google/android/gms/internal/ads/zzhag;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    throw p0
.end method

.method public final i(I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget p0, p0, Ll/xgx0;->b:I

    .line 2
    .line 3
    and-int/lit8 p0, p0, 0x7

    .line 4
    .line 5
    if-ne p0, p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zza()Lcom/google/android/gms/internal/ads/zzhaf;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    throw p0
.end method

.method public final zzA(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Ll/qjx0;

    .line 2
    .line 3
    iget v1, p0, Ll/xgx0;->b:I

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    const/4 v3, 0x1

    .line 7
    if-eqz v0, :cond_4

    .line 8
    .line 9
    move-object v0, p1

    .line 10
    check-cast v0, Ll/qjx0;

    .line 11
    .line 12
    and-int/lit8 p1, v1, 0x7

    .line 13
    .line 14
    if-eq p1, v3, :cond_2

    .line 15
    .line 16
    if-ne p1, v2, :cond_1

    .line 17
    .line 18
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 19
    .line 20
    invoke-virtual {p1}, Ll/wgx0;->s()I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    invoke-static {p1}, Ll/xgx0;->k(I)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 28
    .line 29
    invoke-virtual {v1}, Ll/wgx0;->k()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    add-int/2addr v1, p1

    .line 34
    :cond_0
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 35
    .line 36
    invoke-virtual {p1}, Ll/wgx0;->t()J

    .line 37
    .line 38
    .line 39
    move-result-wide v2

    .line 40
    invoke-virtual {v0, v2, v3}, Ll/qjx0;->g(J)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 44
    .line 45
    invoke-virtual {p1}, Ll/wgx0;->k()I

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-lt p1, v1, :cond_0

    .line 50
    .line 51
    goto/16 :goto_1

    .line 52
    .line 53
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zza()Lcom/google/android/gms/internal/ads/zzhaf;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    throw p0

    .line 58
    :cond_2
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 59
    .line 60
    invoke-virtual {p1}, Ll/wgx0;->t()J

    .line 61
    .line 62
    .line 63
    move-result-wide v1

    .line 64
    invoke-virtual {v0, v1, v2}, Ll/qjx0;->g(J)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 68
    .line 69
    invoke-virtual {p1}, Ll/wgx0;->b()Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_3

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_3
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 77
    .line 78
    invoke-virtual {p1}, Ll/wgx0;->r()I

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    iget v1, p0, Ll/xgx0;->b:I

    .line 83
    .line 84
    if-eq p1, v1, :cond_2

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_4
    and-int/lit8 v0, v1, 0x7

    .line 88
    .line 89
    if-eq v0, v3, :cond_7

    .line 90
    .line 91
    if-ne v0, v2, :cond_6

    .line 92
    .line 93
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 94
    .line 95
    invoke-virtual {v0}, Ll/wgx0;->s()I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    invoke-static {v0}, Ll/xgx0;->k(I)V

    .line 100
    .line 101
    .line 102
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 103
    .line 104
    invoke-virtual {v1}, Ll/wgx0;->k()I

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    add-int/2addr v1, v0

    .line 109
    :cond_5
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 110
    .line 111
    invoke-virtual {v0}, Ll/wgx0;->t()J

    .line 112
    .line 113
    .line 114
    move-result-wide v2

    .line 115
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 123
    .line 124
    invoke-virtual {v0}, Ll/wgx0;->k()I

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    if-lt v0, v1, :cond_5

    .line 129
    .line 130
    goto :goto_1

    .line 131
    :cond_6
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zza()Lcom/google/android/gms/internal/ads/zzhaf;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    throw p0

    .line 136
    :cond_7
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 137
    .line 138
    invoke-virtual {v0}, Ll/wgx0;->t()J

    .line 139
    .line 140
    .line 141
    move-result-wide v0

    .line 142
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 150
    .line 151
    invoke-virtual {v0}, Ll/wgx0;->b()Z

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    if-nez v0, :cond_8

    .line 156
    .line 157
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 158
    .line 159
    invoke-virtual {v0}, Ll/wgx0;->r()I

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    iget v1, p0, Ll/xgx0;->b:I

    .line 164
    .line 165
    if-eq v0, v1, :cond_7

    .line 166
    .line 167
    move p1, v0

    .line 168
    :goto_0
    iput p1, p0, Ll/xgx0;->d:I

    .line 169
    .line 170
    :cond_8
    :goto_1
    return-void
.end method

.method public final zzB(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Ll/phx0;

    .line 2
    .line 3
    iget v1, p0, Ll/xgx0;->b:I

    .line 4
    .line 5
    const/4 v2, 0x5

    .line 6
    const/4 v3, 0x2

    .line 7
    if-eqz v0, :cond_5

    .line 8
    .line 9
    move-object v0, p1

    .line 10
    check-cast v0, Ll/phx0;

    .line 11
    .line 12
    and-int/lit8 p1, v1, 0x7

    .line 13
    .line 14
    if-eq p1, v3, :cond_3

    .line 15
    .line 16
    if-ne p1, v2, :cond_2

    .line 17
    .line 18
    :cond_0
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 19
    .line 20
    invoke-virtual {p1}, Ll/wgx0;->j()F

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    invoke-virtual {v0, p1}, Ll/phx0;->c(F)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 28
    .line 29
    invoke-virtual {p1}, Ll/wgx0;->b()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    goto/16 :goto_1

    .line 36
    .line 37
    :cond_1
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 38
    .line 39
    invoke-virtual {p1}, Ll/wgx0;->r()I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    iget v1, p0, Ll/xgx0;->b:I

    .line 44
    .line 45
    if-eq p1, v1, :cond_0

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zza()Lcom/google/android/gms/internal/ads/zzhaf;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    throw p0

    .line 53
    :cond_3
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 54
    .line 55
    invoke-virtual {p1}, Ll/wgx0;->s()I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    invoke-static {p1}, Ll/xgx0;->j(I)V

    .line 60
    .line 61
    .line 62
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 63
    .line 64
    invoke-virtual {v1}, Ll/wgx0;->k()I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    add-int v4, v1, p1

    .line 69
    .line 70
    :cond_4
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 71
    .line 72
    invoke-virtual {p1}, Ll/wgx0;->j()F

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    invoke-virtual {v0, p1}, Ll/phx0;->c(F)V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 80
    .line 81
    invoke-virtual {p1}, Ll/wgx0;->k()I

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    if-lt p1, v4, :cond_4

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_5
    and-int/lit8 v0, v1, 0x7

    .line 89
    .line 90
    if-eq v0, v3, :cond_8

    .line 91
    .line 92
    if-ne v0, v2, :cond_7

    .line 93
    .line 94
    :cond_6
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 95
    .line 96
    invoke-virtual {v0}, Ll/wgx0;->j()F

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 108
    .line 109
    invoke-virtual {v0}, Ll/wgx0;->b()Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-nez v0, :cond_a

    .line 114
    .line 115
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 116
    .line 117
    invoke-virtual {v0}, Ll/wgx0;->r()I

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    iget v1, p0, Ll/xgx0;->b:I

    .line 122
    .line 123
    if-eq v0, v1, :cond_6

    .line 124
    .line 125
    move p1, v0

    .line 126
    :goto_0
    iput p1, p0, Ll/xgx0;->d:I

    .line 127
    .line 128
    return-void

    .line 129
    :cond_7
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zza()Lcom/google/android/gms/internal/ads/zzhaf;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    throw p0

    .line 134
    :cond_8
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 135
    .line 136
    invoke-virtual {v0}, Ll/wgx0;->s()I

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    invoke-static {v0}, Ll/xgx0;->j(I)V

    .line 141
    .line 142
    .line 143
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 144
    .line 145
    invoke-virtual {v1}, Ll/wgx0;->k()I

    .line 146
    .line 147
    .line 148
    move-result v1

    .line 149
    add-int/2addr v1, v0

    .line 150
    :cond_9
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 151
    .line 152
    invoke-virtual {v0}, Ll/wgx0;->j()F

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 164
    .line 165
    invoke-virtual {v0}, Ll/wgx0;->k()I

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    if-lt v0, v1, :cond_9

    .line 170
    .line 171
    :cond_a
    :goto_1
    return-void
.end method

.method public final zzD(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Ll/whx0;

    .line 2
    .line 3
    iget v1, p0, Ll/xgx0;->b:I

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    if-eqz v0, :cond_4

    .line 7
    .line 8
    move-object v0, p1

    .line 9
    check-cast v0, Ll/whx0;

    .line 10
    .line 11
    and-int/lit8 p1, v1, 0x7

    .line 12
    .line 13
    if-eqz p1, :cond_2

    .line 14
    .line 15
    if-ne p1, v2, :cond_1

    .line 16
    .line 17
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/wgx0;->s()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-virtual {p1}, Ll/wgx0;->k()I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    add-int/2addr p1, v1

    .line 28
    :cond_0
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 29
    .line 30
    invoke-virtual {v1}, Ll/wgx0;->o()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-virtual {v0, v1}, Ll/whx0;->zzh(I)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 38
    .line 39
    invoke-virtual {v1}, Ll/wgx0;->k()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-lt v1, p1, :cond_0

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Ll/xgx0;->h(I)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zza()Lcom/google/android/gms/internal/ads/zzhaf;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    throw p0

    .line 54
    :cond_2
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 55
    .line 56
    invoke-virtual {p1}, Ll/wgx0;->o()I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    invoke-virtual {v0, p1}, Ll/whx0;->zzh(I)V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 64
    .line 65
    invoke-virtual {p1}, Ll/wgx0;->b()Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_3

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_3
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 73
    .line 74
    invoke-virtual {p1}, Ll/wgx0;->r()I

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    iget v1, p0, Ll/xgx0;->b:I

    .line 79
    .line 80
    if-eq p1, v1, :cond_2

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_4
    and-int/lit8 v0, v1, 0x7

    .line 84
    .line 85
    if-eqz v0, :cond_7

    .line 86
    .line 87
    if-ne v0, v2, :cond_6

    .line 88
    .line 89
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 90
    .line 91
    invoke-virtual {v0}, Ll/wgx0;->s()I

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    invoke-virtual {v0}, Ll/wgx0;->k()I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    add-int/2addr v0, v1

    .line 100
    :cond_5
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 101
    .line 102
    invoke-virtual {v1}, Ll/wgx0;->o()I

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 114
    .line 115
    invoke-virtual {v1}, Ll/wgx0;->k()I

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    if-lt v1, v0, :cond_5

    .line 120
    .line 121
    invoke-virtual {p0, v0}, Ll/xgx0;->h(I)V

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :cond_6
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zza()Lcom/google/android/gms/internal/ads/zzhaf;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    throw p0

    .line 130
    :cond_7
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 131
    .line 132
    invoke-virtual {v0}, Ll/wgx0;->o()I

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 144
    .line 145
    invoke-virtual {v0}, Ll/wgx0;->b()Z

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    if-nez v0, :cond_8

    .line 150
    .line 151
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 152
    .line 153
    invoke-virtual {v0}, Ll/wgx0;->r()I

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    iget v1, p0, Ll/xgx0;->b:I

    .line 158
    .line 159
    if-eq v0, v1, :cond_7

    .line 160
    .line 161
    move p1, v0

    .line 162
    :goto_0
    iput p1, p0, Ll/xgx0;->d:I

    .line 163
    .line 164
    :cond_8
    :goto_1
    return-void
.end method

.method public final zzE(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Ll/qjx0;

    .line 2
    .line 3
    iget v1, p0, Ll/xgx0;->b:I

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    if-eqz v0, :cond_4

    .line 7
    .line 8
    move-object v0, p1

    .line 9
    check-cast v0, Ll/qjx0;

    .line 10
    .line 11
    and-int/lit8 p1, v1, 0x7

    .line 12
    .line 13
    if-eqz p1, :cond_2

    .line 14
    .line 15
    if-ne p1, v2, :cond_1

    .line 16
    .line 17
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/wgx0;->s()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-virtual {p1}, Ll/wgx0;->k()I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    add-int/2addr p1, v1

    .line 28
    :cond_0
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 29
    .line 30
    invoke-virtual {v1}, Ll/wgx0;->u()J

    .line 31
    .line 32
    .line 33
    move-result-wide v1

    .line 34
    invoke-virtual {v0, v1, v2}, Ll/qjx0;->g(J)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 38
    .line 39
    invoke-virtual {v1}, Ll/wgx0;->k()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-lt v1, p1, :cond_0

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Ll/xgx0;->h(I)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zza()Lcom/google/android/gms/internal/ads/zzhaf;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    throw p0

    .line 54
    :cond_2
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 55
    .line 56
    invoke-virtual {p1}, Ll/wgx0;->u()J

    .line 57
    .line 58
    .line 59
    move-result-wide v1

    .line 60
    invoke-virtual {v0, v1, v2}, Ll/qjx0;->g(J)V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 64
    .line 65
    invoke-virtual {p1}, Ll/wgx0;->b()Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_3

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_3
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 73
    .line 74
    invoke-virtual {p1}, Ll/wgx0;->r()I

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    iget v1, p0, Ll/xgx0;->b:I

    .line 79
    .line 80
    if-eq p1, v1, :cond_2

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_4
    and-int/lit8 v0, v1, 0x7

    .line 84
    .line 85
    if-eqz v0, :cond_7

    .line 86
    .line 87
    if-ne v0, v2, :cond_6

    .line 88
    .line 89
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 90
    .line 91
    invoke-virtual {v0}, Ll/wgx0;->s()I

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    invoke-virtual {v0}, Ll/wgx0;->k()I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    add-int/2addr v0, v1

    .line 100
    :cond_5
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 101
    .line 102
    invoke-virtual {v1}, Ll/wgx0;->u()J

    .line 103
    .line 104
    .line 105
    move-result-wide v1

    .line 106
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 114
    .line 115
    invoke-virtual {v1}, Ll/wgx0;->k()I

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    if-lt v1, v0, :cond_5

    .line 120
    .line 121
    invoke-virtual {p0, v0}, Ll/xgx0;->h(I)V

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :cond_6
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zza()Lcom/google/android/gms/internal/ads/zzhaf;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    throw p0

    .line 130
    :cond_7
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 131
    .line 132
    invoke-virtual {v0}, Ll/wgx0;->u()J

    .line 133
    .line 134
    .line 135
    move-result-wide v0

    .line 136
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 144
    .line 145
    invoke-virtual {v0}, Ll/wgx0;->b()Z

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    if-nez v0, :cond_8

    .line 150
    .line 151
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 152
    .line 153
    invoke-virtual {v0}, Ll/wgx0;->r()I

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    iget v1, p0, Ll/xgx0;->b:I

    .line 158
    .line 159
    if-eq v0, v1, :cond_7

    .line 160
    .line 161
    move p1, v0

    .line 162
    :goto_0
    iput p1, p0, Ll/xgx0;->d:I

    .line 163
    .line 164
    :cond_8
    :goto_1
    return-void
.end method

.method public final zzG(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Ll/whx0;

    .line 2
    .line 3
    iget v1, p0, Ll/xgx0;->b:I

    .line 4
    .line 5
    const/4 v2, 0x5

    .line 6
    const/4 v3, 0x2

    .line 7
    if-eqz v0, :cond_5

    .line 8
    .line 9
    move-object v0, p1

    .line 10
    check-cast v0, Ll/whx0;

    .line 11
    .line 12
    and-int/lit8 p1, v1, 0x7

    .line 13
    .line 14
    if-eq p1, v3, :cond_3

    .line 15
    .line 16
    if-ne p1, v2, :cond_2

    .line 17
    .line 18
    :cond_0
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 19
    .line 20
    invoke-virtual {p1}, Ll/wgx0;->p()I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    invoke-virtual {v0, p1}, Ll/whx0;->zzh(I)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 28
    .line 29
    invoke-virtual {p1}, Ll/wgx0;->b()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    goto/16 :goto_1

    .line 36
    .line 37
    :cond_1
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 38
    .line 39
    invoke-virtual {p1}, Ll/wgx0;->r()I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    iget v1, p0, Ll/xgx0;->b:I

    .line 44
    .line 45
    if-eq p1, v1, :cond_0

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zza()Lcom/google/android/gms/internal/ads/zzhaf;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    throw p0

    .line 53
    :cond_3
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 54
    .line 55
    invoke-virtual {p1}, Ll/wgx0;->s()I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    invoke-static {p1}, Ll/xgx0;->j(I)V

    .line 60
    .line 61
    .line 62
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 63
    .line 64
    invoke-virtual {v1}, Ll/wgx0;->k()I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    add-int v4, v1, p1

    .line 69
    .line 70
    :cond_4
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 71
    .line 72
    invoke-virtual {p1}, Ll/wgx0;->p()I

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    invoke-virtual {v0, p1}, Ll/whx0;->zzh(I)V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 80
    .line 81
    invoke-virtual {p1}, Ll/wgx0;->k()I

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    if-lt p1, v4, :cond_4

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_5
    and-int/lit8 v0, v1, 0x7

    .line 89
    .line 90
    if-eq v0, v3, :cond_8

    .line 91
    .line 92
    if-ne v0, v2, :cond_7

    .line 93
    .line 94
    :cond_6
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 95
    .line 96
    invoke-virtual {v0}, Ll/wgx0;->p()I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 108
    .line 109
    invoke-virtual {v0}, Ll/wgx0;->b()Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-nez v0, :cond_a

    .line 114
    .line 115
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 116
    .line 117
    invoke-virtual {v0}, Ll/wgx0;->r()I

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    iget v1, p0, Ll/xgx0;->b:I

    .line 122
    .line 123
    if-eq v0, v1, :cond_6

    .line 124
    .line 125
    move p1, v0

    .line 126
    :goto_0
    iput p1, p0, Ll/xgx0;->d:I

    .line 127
    .line 128
    return-void

    .line 129
    :cond_7
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zza()Lcom/google/android/gms/internal/ads/zzhaf;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    throw p0

    .line 134
    :cond_8
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 135
    .line 136
    invoke-virtual {v0}, Ll/wgx0;->s()I

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    invoke-static {v0}, Ll/xgx0;->j(I)V

    .line 141
    .line 142
    .line 143
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 144
    .line 145
    invoke-virtual {v1}, Ll/wgx0;->k()I

    .line 146
    .line 147
    .line 148
    move-result v1

    .line 149
    add-int/2addr v1, v0

    .line 150
    :cond_9
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 151
    .line 152
    invoke-virtual {v0}, Ll/wgx0;->p()I

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 164
    .line 165
    invoke-virtual {v0}, Ll/wgx0;->k()I

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    if-lt v0, v1, :cond_9

    .line 170
    .line 171
    :cond_a
    :goto_1
    return-void
.end method

.method public final zzH(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Ll/qjx0;

    .line 2
    .line 3
    iget v1, p0, Ll/xgx0;->b:I

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    const/4 v3, 0x1

    .line 7
    if-eqz v0, :cond_4

    .line 8
    .line 9
    move-object v0, p1

    .line 10
    check-cast v0, Ll/qjx0;

    .line 11
    .line 12
    and-int/lit8 p1, v1, 0x7

    .line 13
    .line 14
    if-eq p1, v3, :cond_2

    .line 15
    .line 16
    if-ne p1, v2, :cond_1

    .line 17
    .line 18
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 19
    .line 20
    invoke-virtual {p1}, Ll/wgx0;->s()I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    invoke-static {p1}, Ll/xgx0;->k(I)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 28
    .line 29
    invoke-virtual {v1}, Ll/wgx0;->k()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    add-int/2addr v1, p1

    .line 34
    :cond_0
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 35
    .line 36
    invoke-virtual {p1}, Ll/wgx0;->v()J

    .line 37
    .line 38
    .line 39
    move-result-wide v2

    .line 40
    invoke-virtual {v0, v2, v3}, Ll/qjx0;->g(J)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 44
    .line 45
    invoke-virtual {p1}, Ll/wgx0;->k()I

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-lt p1, v1, :cond_0

    .line 50
    .line 51
    goto/16 :goto_1

    .line 52
    .line 53
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zza()Lcom/google/android/gms/internal/ads/zzhaf;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    throw p0

    .line 58
    :cond_2
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 59
    .line 60
    invoke-virtual {p1}, Ll/wgx0;->v()J

    .line 61
    .line 62
    .line 63
    move-result-wide v1

    .line 64
    invoke-virtual {v0, v1, v2}, Ll/qjx0;->g(J)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 68
    .line 69
    invoke-virtual {p1}, Ll/wgx0;->b()Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_3

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_3
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 77
    .line 78
    invoke-virtual {p1}, Ll/wgx0;->r()I

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    iget v1, p0, Ll/xgx0;->b:I

    .line 83
    .line 84
    if-eq p1, v1, :cond_2

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_4
    and-int/lit8 v0, v1, 0x7

    .line 88
    .line 89
    if-eq v0, v3, :cond_7

    .line 90
    .line 91
    if-ne v0, v2, :cond_6

    .line 92
    .line 93
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 94
    .line 95
    invoke-virtual {v0}, Ll/wgx0;->s()I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    invoke-static {v0}, Ll/xgx0;->k(I)V

    .line 100
    .line 101
    .line 102
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 103
    .line 104
    invoke-virtual {v1}, Ll/wgx0;->k()I

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    add-int/2addr v1, v0

    .line 109
    :cond_5
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 110
    .line 111
    invoke-virtual {v0}, Ll/wgx0;->v()J

    .line 112
    .line 113
    .line 114
    move-result-wide v2

    .line 115
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 123
    .line 124
    invoke-virtual {v0}, Ll/wgx0;->k()I

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    if-lt v0, v1, :cond_5

    .line 129
    .line 130
    goto :goto_1

    .line 131
    :cond_6
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zza()Lcom/google/android/gms/internal/ads/zzhaf;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    throw p0

    .line 136
    :cond_7
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 137
    .line 138
    invoke-virtual {v0}, Ll/wgx0;->v()J

    .line 139
    .line 140
    .line 141
    move-result-wide v0

    .line 142
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 150
    .line 151
    invoke-virtual {v0}, Ll/wgx0;->b()Z

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    if-nez v0, :cond_8

    .line 156
    .line 157
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 158
    .line 159
    invoke-virtual {v0}, Ll/wgx0;->r()I

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    iget v1, p0, Ll/xgx0;->b:I

    .line 164
    .line 165
    if-eq v0, v1, :cond_7

    .line 166
    .line 167
    move p1, v0

    .line 168
    :goto_0
    iput p1, p0, Ll/xgx0;->d:I

    .line 169
    .line 170
    :cond_8
    :goto_1
    return-void
.end method

.method public final zzI(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Ll/whx0;

    .line 2
    .line 3
    iget v1, p0, Ll/xgx0;->b:I

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    if-eqz v0, :cond_4

    .line 7
    .line 8
    move-object v0, p1

    .line 9
    check-cast v0, Ll/whx0;

    .line 10
    .line 11
    and-int/lit8 p1, v1, 0x7

    .line 12
    .line 13
    if-eqz p1, :cond_2

    .line 14
    .line 15
    if-ne p1, v2, :cond_1

    .line 16
    .line 17
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/wgx0;->s()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-virtual {p1}, Ll/wgx0;->k()I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    add-int/2addr p1, v1

    .line 28
    :cond_0
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 29
    .line 30
    invoke-virtual {v1}, Ll/wgx0;->q()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-virtual {v0, v1}, Ll/whx0;->zzh(I)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 38
    .line 39
    invoke-virtual {v1}, Ll/wgx0;->k()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-lt v1, p1, :cond_0

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Ll/xgx0;->h(I)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zza()Lcom/google/android/gms/internal/ads/zzhaf;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    throw p0

    .line 54
    :cond_2
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 55
    .line 56
    invoke-virtual {p1}, Ll/wgx0;->q()I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    invoke-virtual {v0, p1}, Ll/whx0;->zzh(I)V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 64
    .line 65
    invoke-virtual {p1}, Ll/wgx0;->b()Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_3

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_3
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 73
    .line 74
    invoke-virtual {p1}, Ll/wgx0;->r()I

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    iget v1, p0, Ll/xgx0;->b:I

    .line 79
    .line 80
    if-eq p1, v1, :cond_2

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_4
    and-int/lit8 v0, v1, 0x7

    .line 84
    .line 85
    if-eqz v0, :cond_7

    .line 86
    .line 87
    if-ne v0, v2, :cond_6

    .line 88
    .line 89
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 90
    .line 91
    invoke-virtual {v0}, Ll/wgx0;->s()I

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    invoke-virtual {v0}, Ll/wgx0;->k()I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    add-int/2addr v0, v1

    .line 100
    :cond_5
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 101
    .line 102
    invoke-virtual {v1}, Ll/wgx0;->q()I

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 114
    .line 115
    invoke-virtual {v1}, Ll/wgx0;->k()I

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    if-lt v1, v0, :cond_5

    .line 120
    .line 121
    invoke-virtual {p0, v0}, Ll/xgx0;->h(I)V

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :cond_6
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zza()Lcom/google/android/gms/internal/ads/zzhaf;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    throw p0

    .line 130
    :cond_7
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 131
    .line 132
    invoke-virtual {v0}, Ll/wgx0;->q()I

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 144
    .line 145
    invoke-virtual {v0}, Ll/wgx0;->b()Z

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    if-nez v0, :cond_8

    .line 150
    .line 151
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 152
    .line 153
    invoke-virtual {v0}, Ll/wgx0;->r()I

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    iget v1, p0, Ll/xgx0;->b:I

    .line 158
    .line 159
    if-eq v0, v1, :cond_7

    .line 160
    .line 161
    move p1, v0

    .line 162
    :goto_0
    iput p1, p0, Ll/xgx0;->d:I

    .line 163
    .line 164
    :cond_8
    :goto_1
    return-void
.end method

.method public final zzJ(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Ll/qjx0;

    .line 2
    .line 3
    iget v1, p0, Ll/xgx0;->b:I

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    if-eqz v0, :cond_4

    .line 7
    .line 8
    move-object v0, p1

    .line 9
    check-cast v0, Ll/qjx0;

    .line 10
    .line 11
    and-int/lit8 p1, v1, 0x7

    .line 12
    .line 13
    if-eqz p1, :cond_2

    .line 14
    .line 15
    if-ne p1, v2, :cond_1

    .line 16
    .line 17
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/wgx0;->s()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-virtual {p1}, Ll/wgx0;->k()I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    add-int/2addr p1, v1

    .line 28
    :cond_0
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 29
    .line 30
    invoke-virtual {v1}, Ll/wgx0;->w()J

    .line 31
    .line 32
    .line 33
    move-result-wide v1

    .line 34
    invoke-virtual {v0, v1, v2}, Ll/qjx0;->g(J)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 38
    .line 39
    invoke-virtual {v1}, Ll/wgx0;->k()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-lt v1, p1, :cond_0

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Ll/xgx0;->h(I)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zza()Lcom/google/android/gms/internal/ads/zzhaf;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    throw p0

    .line 54
    :cond_2
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 55
    .line 56
    invoke-virtual {p1}, Ll/wgx0;->w()J

    .line 57
    .line 58
    .line 59
    move-result-wide v1

    .line 60
    invoke-virtual {v0, v1, v2}, Ll/qjx0;->g(J)V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 64
    .line 65
    invoke-virtual {p1}, Ll/wgx0;->b()Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_3

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_3
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 73
    .line 74
    invoke-virtual {p1}, Ll/wgx0;->r()I

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    iget v1, p0, Ll/xgx0;->b:I

    .line 79
    .line 80
    if-eq p1, v1, :cond_2

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_4
    and-int/lit8 v0, v1, 0x7

    .line 84
    .line 85
    if-eqz v0, :cond_7

    .line 86
    .line 87
    if-ne v0, v2, :cond_6

    .line 88
    .line 89
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 90
    .line 91
    invoke-virtual {v0}, Ll/wgx0;->s()I

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    invoke-virtual {v0}, Ll/wgx0;->k()I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    add-int/2addr v0, v1

    .line 100
    :cond_5
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 101
    .line 102
    invoke-virtual {v1}, Ll/wgx0;->w()J

    .line 103
    .line 104
    .line 105
    move-result-wide v1

    .line 106
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 114
    .line 115
    invoke-virtual {v1}, Ll/wgx0;->k()I

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    if-lt v1, v0, :cond_5

    .line 120
    .line 121
    invoke-virtual {p0, v0}, Ll/xgx0;->h(I)V

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :cond_6
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zza()Lcom/google/android/gms/internal/ads/zzhaf;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    throw p0

    .line 130
    :cond_7
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 131
    .line 132
    invoke-virtual {v0}, Ll/wgx0;->w()J

    .line 133
    .line 134
    .line 135
    move-result-wide v0

    .line 136
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 144
    .line 145
    invoke-virtual {v0}, Ll/wgx0;->b()Z

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    if-nez v0, :cond_8

    .line 150
    .line 151
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 152
    .line 153
    invoke-virtual {v0}, Ll/wgx0;->r()I

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    iget v1, p0, Ll/xgx0;->b:I

    .line 158
    .line 159
    if-eq v0, v1, :cond_7

    .line 160
    .line 161
    move p1, v0

    .line 162
    :goto_0
    iput p1, p0, Ll/xgx0;->d:I

    .line 163
    .line 164
    :cond_8
    :goto_1
    return-void
.end method

.method public final zzL(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Ll/whx0;

    .line 2
    .line 3
    iget v1, p0, Ll/xgx0;->b:I

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    if-eqz v0, :cond_4

    .line 7
    .line 8
    move-object v0, p1

    .line 9
    check-cast v0, Ll/whx0;

    .line 10
    .line 11
    and-int/lit8 p1, v1, 0x7

    .line 12
    .line 13
    if-eqz p1, :cond_2

    .line 14
    .line 15
    if-ne p1, v2, :cond_1

    .line 16
    .line 17
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/wgx0;->s()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-virtual {p1}, Ll/wgx0;->k()I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    add-int/2addr p1, v1

    .line 28
    :cond_0
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 29
    .line 30
    invoke-virtual {v1}, Ll/wgx0;->s()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-virtual {v0, v1}, Ll/whx0;->zzh(I)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 38
    .line 39
    invoke-virtual {v1}, Ll/wgx0;->k()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-lt v1, p1, :cond_0

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Ll/xgx0;->h(I)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zza()Lcom/google/android/gms/internal/ads/zzhaf;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    throw p0

    .line 54
    :cond_2
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 55
    .line 56
    invoke-virtual {p1}, Ll/wgx0;->s()I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    invoke-virtual {v0, p1}, Ll/whx0;->zzh(I)V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 64
    .line 65
    invoke-virtual {p1}, Ll/wgx0;->b()Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_3

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_3
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 73
    .line 74
    invoke-virtual {p1}, Ll/wgx0;->r()I

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    iget v1, p0, Ll/xgx0;->b:I

    .line 79
    .line 80
    if-eq p1, v1, :cond_2

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_4
    and-int/lit8 v0, v1, 0x7

    .line 84
    .line 85
    if-eqz v0, :cond_7

    .line 86
    .line 87
    if-ne v0, v2, :cond_6

    .line 88
    .line 89
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 90
    .line 91
    invoke-virtual {v0}, Ll/wgx0;->s()I

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    invoke-virtual {v0}, Ll/wgx0;->k()I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    add-int/2addr v0, v1

    .line 100
    :cond_5
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 101
    .line 102
    invoke-virtual {v1}, Ll/wgx0;->s()I

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 114
    .line 115
    invoke-virtual {v1}, Ll/wgx0;->k()I

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    if-lt v1, v0, :cond_5

    .line 120
    .line 121
    invoke-virtual {p0, v0}, Ll/xgx0;->h(I)V

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :cond_6
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zza()Lcom/google/android/gms/internal/ads/zzhaf;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    throw p0

    .line 130
    :cond_7
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 131
    .line 132
    invoke-virtual {v0}, Ll/wgx0;->s()I

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 144
    .line 145
    invoke-virtual {v0}, Ll/wgx0;->b()Z

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    if-nez v0, :cond_8

    .line 150
    .line 151
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 152
    .line 153
    invoke-virtual {v0}, Ll/wgx0;->r()I

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    iget v1, p0, Ll/xgx0;->b:I

    .line 158
    .line 159
    if-eq v0, v1, :cond_7

    .line 160
    .line 161
    move p1, v0

    .line 162
    :goto_0
    iput p1, p0, Ll/xgx0;->d:I

    .line 163
    .line 164
    :cond_8
    :goto_1
    return-void
.end method

.method public final zzM(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Ll/qjx0;

    .line 2
    .line 3
    iget v1, p0, Ll/xgx0;->b:I

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    if-eqz v0, :cond_4

    .line 7
    .line 8
    move-object v0, p1

    .line 9
    check-cast v0, Ll/qjx0;

    .line 10
    .line 11
    and-int/lit8 p1, v1, 0x7

    .line 12
    .line 13
    if-eqz p1, :cond_2

    .line 14
    .line 15
    if-ne p1, v2, :cond_1

    .line 16
    .line 17
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/wgx0;->s()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-virtual {p1}, Ll/wgx0;->k()I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    add-int/2addr p1, v1

    .line 28
    :cond_0
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 29
    .line 30
    invoke-virtual {v1}, Ll/wgx0;->x()J

    .line 31
    .line 32
    .line 33
    move-result-wide v1

    .line 34
    invoke-virtual {v0, v1, v2}, Ll/qjx0;->g(J)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 38
    .line 39
    invoke-virtual {v1}, Ll/wgx0;->k()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-lt v1, p1, :cond_0

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Ll/xgx0;->h(I)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zza()Lcom/google/android/gms/internal/ads/zzhaf;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    throw p0

    .line 54
    :cond_2
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 55
    .line 56
    invoke-virtual {p1}, Ll/wgx0;->x()J

    .line 57
    .line 58
    .line 59
    move-result-wide v1

    .line 60
    invoke-virtual {v0, v1, v2}, Ll/qjx0;->g(J)V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 64
    .line 65
    invoke-virtual {p1}, Ll/wgx0;->b()Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_3

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_3
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 73
    .line 74
    invoke-virtual {p1}, Ll/wgx0;->r()I

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    iget v1, p0, Ll/xgx0;->b:I

    .line 79
    .line 80
    if-eq p1, v1, :cond_2

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_4
    and-int/lit8 v0, v1, 0x7

    .line 84
    .line 85
    if-eqz v0, :cond_7

    .line 86
    .line 87
    if-ne v0, v2, :cond_6

    .line 88
    .line 89
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 90
    .line 91
    invoke-virtual {v0}, Ll/wgx0;->s()I

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    invoke-virtual {v0}, Ll/wgx0;->k()I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    add-int/2addr v0, v1

    .line 100
    :cond_5
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 101
    .line 102
    invoke-virtual {v1}, Ll/wgx0;->x()J

    .line 103
    .line 104
    .line 105
    move-result-wide v1

    .line 106
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 114
    .line 115
    invoke-virtual {v1}, Ll/wgx0;->k()I

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    if-lt v1, v0, :cond_5

    .line 120
    .line 121
    invoke-virtual {p0, v0}, Ll/xgx0;->h(I)V

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :cond_6
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zza()Lcom/google/android/gms/internal/ads/zzhaf;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    throw p0

    .line 130
    :cond_7
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 131
    .line 132
    invoke-virtual {v0}, Ll/wgx0;->x()J

    .line 133
    .line 134
    .line 135
    move-result-wide v0

    .line 136
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 144
    .line 145
    invoke-virtual {v0}, Ll/wgx0;->b()Z

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    if-nez v0, :cond_8

    .line 150
    .line 151
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 152
    .line 153
    invoke-virtual {v0}, Ll/wgx0;->r()I

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    iget v1, p0, Ll/xgx0;->b:I

    .line 158
    .line 159
    if-eq v0, v1, :cond_7

    .line 160
    .line 161
    move p1, v0

    .line 162
    :goto_0
    iput p1, p0, Ll/xgx0;->d:I

    .line 163
    .line 164
    :cond_8
    :goto_1
    return-void
.end method

.method public final zzN()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/xgx0;->i(I)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/wgx0;->c()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final zzO()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wgx0;->b()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget v0, p0, Ll/xgx0;->b:I

    .line 10
    .line 11
    iget v1, p0, Ll/xgx0;->c:I

    .line 12
    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object p0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/wgx0;->d(I)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public final zza()D
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/xgx0;->i(I)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/wgx0;->i()D

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public final zzb()F
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x5

    .line 2
    invoke-virtual {p0, v0}, Ll/xgx0;->i(I)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/wgx0;->j()F

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final zzc()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/xgx0;->d:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iput v0, p0, Ll/xgx0;->b:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput v1, p0, Ll/xgx0;->d:I

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/wgx0;->r()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iput v0, p0, Ll/xgx0;->b:I

    .line 18
    .line 19
    :goto_0
    if-eqz v0, :cond_2

    .line 20
    .line 21
    iget p0, p0, Ll/xgx0;->c:I

    .line 22
    .line 23
    if-ne v0, p0, :cond_1

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_1
    ushr-int/lit8 p0, v0, 0x3

    .line 27
    .line 28
    return p0

    .line 29
    :cond_2
    :goto_1
    const p0, 0x7fffffff

    .line 30
    .line 31
    .line 32
    return p0
.end method

.method public final zzd()I
    .locals 0

    .line 1
    iget p0, p0, Ll/xgx0;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public final zze()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/xgx0;->i(I)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/wgx0;->m()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final zzf()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x5

    .line 2
    invoke-virtual {p0, v0}, Ll/xgx0;->i(I)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/wgx0;->n()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final zzg()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/xgx0;->i(I)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/wgx0;->o()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final zzh()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x5

    .line 2
    invoke-virtual {p0, v0}, Ll/xgx0;->i(I)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/wgx0;->p()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final zzi()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/xgx0;->i(I)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/wgx0;->q()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final zzj()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/xgx0;->i(I)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/wgx0;->s()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final zzk()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/xgx0;->i(I)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/wgx0;->t()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public final zzl()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/xgx0;->i(I)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/wgx0;->u()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public final zzm()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/xgx0;->i(I)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/wgx0;->v()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public final zzn()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/xgx0;->i(I)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/wgx0;->w()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public final zzo()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/xgx0;->i(I)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/wgx0;->x()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public final zzp()Lcom/google/android/gms/internal/ads/zzgyl;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, v0}, Ll/xgx0;->i(I)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/wgx0;->y()Lcom/google/android/gms/internal/ads/zzgyl;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final zzr()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, v0}, Ll/xgx0;->i(I)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/wgx0;->z()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final zzs()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, v0}, Ll/xgx0;->i(I)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/wgx0;->A()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final zzv(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Ll/fgx0;

    .line 2
    .line 3
    iget v1, p0, Ll/xgx0;->b:I

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    if-eqz v0, :cond_4

    .line 7
    .line 8
    move-object v0, p1

    .line 9
    check-cast v0, Ll/fgx0;

    .line 10
    .line 11
    and-int/lit8 p1, v1, 0x7

    .line 12
    .line 13
    if-eqz p1, :cond_2

    .line 14
    .line 15
    if-ne p1, v2, :cond_1

    .line 16
    .line 17
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/wgx0;->s()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-virtual {p1}, Ll/wgx0;->k()I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    add-int/2addr p1, v1

    .line 28
    :cond_0
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 29
    .line 30
    invoke-virtual {v1}, Ll/wgx0;->c()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-virtual {v0, v1}, Ll/fgx0;->c(Z)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 38
    .line 39
    invoke-virtual {v1}, Ll/wgx0;->k()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-lt v1, p1, :cond_0

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Ll/xgx0;->h(I)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zza()Lcom/google/android/gms/internal/ads/zzhaf;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    throw p0

    .line 54
    :cond_2
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 55
    .line 56
    invoke-virtual {p1}, Ll/wgx0;->c()Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    invoke-virtual {v0, p1}, Ll/fgx0;->c(Z)V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 64
    .line 65
    invoke-virtual {p1}, Ll/wgx0;->b()Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_3

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_3
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 73
    .line 74
    invoke-virtual {p1}, Ll/wgx0;->r()I

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    iget v1, p0, Ll/xgx0;->b:I

    .line 79
    .line 80
    if-eq p1, v1, :cond_2

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_4
    and-int/lit8 v0, v1, 0x7

    .line 84
    .line 85
    if-eqz v0, :cond_7

    .line 86
    .line 87
    if-ne v0, v2, :cond_6

    .line 88
    .line 89
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 90
    .line 91
    invoke-virtual {v0}, Ll/wgx0;->s()I

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    invoke-virtual {v0}, Ll/wgx0;->k()I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    add-int/2addr v0, v1

    .line 100
    :cond_5
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 101
    .line 102
    invoke-virtual {v1}, Ll/wgx0;->c()Z

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 114
    .line 115
    invoke-virtual {v1}, Ll/wgx0;->k()I

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    if-lt v1, v0, :cond_5

    .line 120
    .line 121
    invoke-virtual {p0, v0}, Ll/xgx0;->h(I)V

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :cond_6
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zza()Lcom/google/android/gms/internal/ads/zzhaf;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    throw p0

    .line 130
    :cond_7
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 131
    .line 132
    invoke-virtual {v0}, Ll/wgx0;->c()Z

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 144
    .line 145
    invoke-virtual {v0}, Ll/wgx0;->b()Z

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    if-nez v0, :cond_8

    .line 150
    .line 151
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 152
    .line 153
    invoke-virtual {v0}, Ll/wgx0;->r()I

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    iget v1, p0, Ll/xgx0;->b:I

    .line 158
    .line 159
    if-eq v0, v1, :cond_7

    .line 160
    .line 161
    move p1, v0

    .line 162
    :goto_0
    iput p1, p0, Ll/xgx0;->d:I

    .line 163
    .line 164
    :cond_8
    :goto_1
    return-void
.end method

.method public final zzw(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/xgx0;->b:I

    .line 2
    .line 3
    and-int/lit8 v0, v0, 0x7

    .line 4
    .line 5
    const/4 v1, 0x2

    .line 6
    if-ne v0, v1, :cond_2

    .line 7
    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/xgx0;->zzp()Lcom/google/android/gms/internal/ads/zzgyl;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/wgx0;->b()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/wgx0;->r()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    iget v1, p0, Ll/xgx0;->b:I

    .line 31
    .line 32
    if-eq v0, v1, :cond_0

    .line 33
    .line 34
    iput v0, p0, Ll/xgx0;->d:I

    .line 35
    .line 36
    return-void

    .line 37
    :cond_2
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zza()Lcom/google/android/gms/internal/ads/zzhaf;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    throw p0
.end method

.method public final zzx(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Ll/ghx0;

    .line 2
    .line 3
    iget v1, p0, Ll/xgx0;->b:I

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    const/4 v3, 0x1

    .line 7
    if-eqz v0, :cond_4

    .line 8
    .line 9
    move-object v0, p1

    .line 10
    check-cast v0, Ll/ghx0;

    .line 11
    .line 12
    and-int/lit8 p1, v1, 0x7

    .line 13
    .line 14
    if-eq p1, v3, :cond_2

    .line 15
    .line 16
    if-ne p1, v2, :cond_1

    .line 17
    .line 18
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 19
    .line 20
    invoke-virtual {p1}, Ll/wgx0;->s()I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    invoke-static {p1}, Ll/xgx0;->k(I)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 28
    .line 29
    invoke-virtual {v1}, Ll/wgx0;->k()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    add-int/2addr v1, p1

    .line 34
    :cond_0
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 35
    .line 36
    invoke-virtual {p1}, Ll/wgx0;->i()D

    .line 37
    .line 38
    .line 39
    move-result-wide v2

    .line 40
    invoke-virtual {v0, v2, v3}, Ll/ghx0;->c(D)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 44
    .line 45
    invoke-virtual {p1}, Ll/wgx0;->k()I

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-lt p1, v1, :cond_0

    .line 50
    .line 51
    goto/16 :goto_1

    .line 52
    .line 53
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zza()Lcom/google/android/gms/internal/ads/zzhaf;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    throw p0

    .line 58
    :cond_2
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 59
    .line 60
    invoke-virtual {p1}, Ll/wgx0;->i()D

    .line 61
    .line 62
    .line 63
    move-result-wide v1

    .line 64
    invoke-virtual {v0, v1, v2}, Ll/ghx0;->c(D)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 68
    .line 69
    invoke-virtual {p1}, Ll/wgx0;->b()Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_3

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_3
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 77
    .line 78
    invoke-virtual {p1}, Ll/wgx0;->r()I

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    iget v1, p0, Ll/xgx0;->b:I

    .line 83
    .line 84
    if-eq p1, v1, :cond_2

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_4
    and-int/lit8 v0, v1, 0x7

    .line 88
    .line 89
    if-eq v0, v3, :cond_7

    .line 90
    .line 91
    if-ne v0, v2, :cond_6

    .line 92
    .line 93
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 94
    .line 95
    invoke-virtual {v0}, Ll/wgx0;->s()I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    invoke-static {v0}, Ll/xgx0;->k(I)V

    .line 100
    .line 101
    .line 102
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 103
    .line 104
    invoke-virtual {v1}, Ll/wgx0;->k()I

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    add-int/2addr v1, v0

    .line 109
    :cond_5
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 110
    .line 111
    invoke-virtual {v0}, Ll/wgx0;->i()D

    .line 112
    .line 113
    .line 114
    move-result-wide v2

    .line 115
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 123
    .line 124
    invoke-virtual {v0}, Ll/wgx0;->k()I

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    if-lt v0, v1, :cond_5

    .line 129
    .line 130
    goto :goto_1

    .line 131
    :cond_6
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zza()Lcom/google/android/gms/internal/ads/zzhaf;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    throw p0

    .line 136
    :cond_7
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 137
    .line 138
    invoke-virtual {v0}, Ll/wgx0;->i()D

    .line 139
    .line 140
    .line 141
    move-result-wide v0

    .line 142
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 150
    .line 151
    invoke-virtual {v0}, Ll/wgx0;->b()Z

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    if-nez v0, :cond_8

    .line 156
    .line 157
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 158
    .line 159
    invoke-virtual {v0}, Ll/wgx0;->r()I

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    iget v1, p0, Ll/xgx0;->b:I

    .line 164
    .line 165
    if-eq v0, v1, :cond_7

    .line 166
    .line 167
    move p1, v0

    .line 168
    :goto_0
    iput p1, p0, Ll/xgx0;->d:I

    .line 169
    .line 170
    :cond_8
    :goto_1
    return-void
.end method

.method public final zzy(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Ll/whx0;

    .line 2
    .line 3
    iget v1, p0, Ll/xgx0;->b:I

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    if-eqz v0, :cond_4

    .line 7
    .line 8
    move-object v0, p1

    .line 9
    check-cast v0, Ll/whx0;

    .line 10
    .line 11
    and-int/lit8 p1, v1, 0x7

    .line 12
    .line 13
    if-eqz p1, :cond_2

    .line 14
    .line 15
    if-ne p1, v2, :cond_1

    .line 16
    .line 17
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/wgx0;->s()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-virtual {p1}, Ll/wgx0;->k()I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    add-int/2addr p1, v1

    .line 28
    :cond_0
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 29
    .line 30
    invoke-virtual {v1}, Ll/wgx0;->m()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-virtual {v0, v1}, Ll/whx0;->zzh(I)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 38
    .line 39
    invoke-virtual {v1}, Ll/wgx0;->k()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-lt v1, p1, :cond_0

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Ll/xgx0;->h(I)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zza()Lcom/google/android/gms/internal/ads/zzhaf;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    throw p0

    .line 54
    :cond_2
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 55
    .line 56
    invoke-virtual {p1}, Ll/wgx0;->m()I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    invoke-virtual {v0, p1}, Ll/whx0;->zzh(I)V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 64
    .line 65
    invoke-virtual {p1}, Ll/wgx0;->b()Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_3

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_3
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 73
    .line 74
    invoke-virtual {p1}, Ll/wgx0;->r()I

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    iget v1, p0, Ll/xgx0;->b:I

    .line 79
    .line 80
    if-eq p1, v1, :cond_2

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_4
    and-int/lit8 v0, v1, 0x7

    .line 84
    .line 85
    if-eqz v0, :cond_7

    .line 86
    .line 87
    if-ne v0, v2, :cond_6

    .line 88
    .line 89
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 90
    .line 91
    invoke-virtual {v0}, Ll/wgx0;->s()I

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    invoke-virtual {v0}, Ll/wgx0;->k()I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    add-int/2addr v0, v1

    .line 100
    :cond_5
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 101
    .line 102
    invoke-virtual {v1}, Ll/wgx0;->m()I

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 114
    .line 115
    invoke-virtual {v1}, Ll/wgx0;->k()I

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    if-lt v1, v0, :cond_5

    .line 120
    .line 121
    invoke-virtual {p0, v0}, Ll/xgx0;->h(I)V

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :cond_6
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zza()Lcom/google/android/gms/internal/ads/zzhaf;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    throw p0

    .line 130
    :cond_7
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 131
    .line 132
    invoke-virtual {v0}, Ll/wgx0;->m()I

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 144
    .line 145
    invoke-virtual {v0}, Ll/wgx0;->b()Z

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    if-nez v0, :cond_8

    .line 150
    .line 151
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 152
    .line 153
    invoke-virtual {v0}, Ll/wgx0;->r()I

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    iget v1, p0, Ll/xgx0;->b:I

    .line 158
    .line 159
    if-eq v0, v1, :cond_7

    .line 160
    .line 161
    move p1, v0

    .line 162
    :goto_0
    iput p1, p0, Ll/xgx0;->d:I

    .line 163
    .line 164
    :cond_8
    :goto_1
    return-void
.end method

.method public final zzz(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Ll/whx0;

    .line 2
    .line 3
    iget v1, p0, Ll/xgx0;->b:I

    .line 4
    .line 5
    const/4 v2, 0x5

    .line 6
    const/4 v3, 0x2

    .line 7
    if-eqz v0, :cond_5

    .line 8
    .line 9
    move-object v0, p1

    .line 10
    check-cast v0, Ll/whx0;

    .line 11
    .line 12
    and-int/lit8 p1, v1, 0x7

    .line 13
    .line 14
    if-eq p1, v3, :cond_3

    .line 15
    .line 16
    if-ne p1, v2, :cond_2

    .line 17
    .line 18
    :cond_0
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 19
    .line 20
    invoke-virtual {p1}, Ll/wgx0;->n()I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    invoke-virtual {v0, p1}, Ll/whx0;->zzh(I)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 28
    .line 29
    invoke-virtual {p1}, Ll/wgx0;->b()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    goto/16 :goto_1

    .line 36
    .line 37
    :cond_1
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 38
    .line 39
    invoke-virtual {p1}, Ll/wgx0;->r()I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    iget v1, p0, Ll/xgx0;->b:I

    .line 44
    .line 45
    if-eq p1, v1, :cond_0

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zza()Lcom/google/android/gms/internal/ads/zzhaf;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    throw p0

    .line 53
    :cond_3
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 54
    .line 55
    invoke-virtual {p1}, Ll/wgx0;->s()I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    invoke-static {p1}, Ll/xgx0;->j(I)V

    .line 60
    .line 61
    .line 62
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 63
    .line 64
    invoke-virtual {v1}, Ll/wgx0;->k()I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    add-int v4, v1, p1

    .line 69
    .line 70
    :cond_4
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 71
    .line 72
    invoke-virtual {p1}, Ll/wgx0;->n()I

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    invoke-virtual {v0, p1}, Ll/whx0;->zzh(I)V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 80
    .line 81
    invoke-virtual {p1}, Ll/wgx0;->k()I

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    if-lt p1, v4, :cond_4

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_5
    and-int/lit8 v0, v1, 0x7

    .line 89
    .line 90
    if-eq v0, v3, :cond_8

    .line 91
    .line 92
    if-ne v0, v2, :cond_7

    .line 93
    .line 94
    :cond_6
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 95
    .line 96
    invoke-virtual {v0}, Ll/wgx0;->n()I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 108
    .line 109
    invoke-virtual {v0}, Ll/wgx0;->b()Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-nez v0, :cond_a

    .line 114
    .line 115
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 116
    .line 117
    invoke-virtual {v0}, Ll/wgx0;->r()I

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    iget v1, p0, Ll/xgx0;->b:I

    .line 122
    .line 123
    if-eq v0, v1, :cond_6

    .line 124
    .line 125
    move p1, v0

    .line 126
    :goto_0
    iput p1, p0, Ll/xgx0;->d:I

    .line 127
    .line 128
    return-void

    .line 129
    :cond_7
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zza()Lcom/google/android/gms/internal/ads/zzhaf;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    throw p0

    .line 134
    :cond_8
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 135
    .line 136
    invoke-virtual {v0}, Ll/wgx0;->s()I

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    invoke-static {v0}, Ll/xgx0;->j(I)V

    .line 141
    .line 142
    .line 143
    iget-object v1, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 144
    .line 145
    invoke-virtual {v1}, Ll/wgx0;->k()I

    .line 146
    .line 147
    .line 148
    move-result v1

    .line 149
    add-int/2addr v1, v0

    .line 150
    :cond_9
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 151
    .line 152
    invoke-virtual {v0}, Ll/wgx0;->n()I

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    iget-object v0, p0, Ll/xgx0;->a:Ll/wgx0;

    .line 164
    .line 165
    invoke-virtual {v0}, Ll/wgx0;->k()I

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    if-lt v0, v1, :cond_9

    .line 170
    .line 171
    :cond_a
    :goto_1
    return-void
.end method
