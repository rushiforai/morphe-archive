.class public final Ll/a3x0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/wfx0;

.field public static final b:Ll/r6x0;

.field public static final c:Ll/n6x0;

.field public static final d:Ll/n5x0;

.field public static final e:Ll/j5x0;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    const-string v0, "type.googleapis.com/google.crypto.tink.KmsEnvelopeAeadKey"

    .line 2
    .line 3
    invoke-static {v0}, Ll/u7x0;->a(Ljava/lang/String;)Ll/wfx0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Ll/a3x0;->a:Ll/wfx0;

    .line 8
    .line 9
    sget-object v1, Ll/w2x0;->a:Ll/w2x0;

    .line 10
    .line 11
    const-class v2, Ll/v2x0;

    .line 12
    .line 13
    const-class v3, Ll/d7x0;

    .line 14
    .line 15
    invoke-static {v1, v2, v3}, Ll/r6x0;->b(Ll/p6x0;Ljava/lang/Class;Ljava/lang/Class;)Ll/r6x0;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    sput-object v1, Ll/a3x0;->b:Ll/r6x0;

    .line 20
    .line 21
    sget-object v1, Ll/x2x0;->a:Ll/x2x0;

    .line 22
    .line 23
    invoke-static {v1, v0, v3}, Ll/n6x0;->b(Ll/l6x0;Ll/wfx0;Ljava/lang/Class;)Ll/n6x0;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    sput-object v1, Ll/a3x0;->c:Ll/n6x0;

    .line 28
    .line 29
    sget-object v1, Ll/y2x0;->a:Ll/y2x0;

    .line 30
    .line 31
    const-class v2, Ll/q2x0;

    .line 32
    .line 33
    const-class v3, Ll/c7x0;

    .line 34
    .line 35
    invoke-static {v1, v2, v3}, Ll/n5x0;->b(Ll/l5x0;Ljava/lang/Class;Ljava/lang/Class;)Ll/n5x0;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    sput-object v1, Ll/a3x0;->d:Ll/n5x0;

    .line 40
    .line 41
    sget-object v1, Ll/z2x0;->a:Ll/z2x0;

    .line 42
    .line 43
    invoke-static {v1, v0, v3}, Ll/j5x0;->b(Ll/h5x0;Ll/wfx0;Ljava/lang/Class;)Ll/j5x0;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    sput-object v0, Ll/a3x0;->e:Ll/j5x0;

    .line 48
    .line 49
    return-void
.end method

.method public static synthetic a(Ll/c7x0;Ll/ayw0;)Ll/q2x0;
    .locals 3

    .line 1
    const-string p1, "KmsEnvelopeAeadKeys are only accepted with version 0, got "

    .line 2
    .line 3
    const-string v0, "KmsEnvelopeAeadKeys are only accepted with OutputPrefixType RAW, got "

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/c7x0;->f()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "type.googleapis.com/google.crypto.tink.KmsEnvelopeAeadKey"

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_2

    .line 16
    .line 17
    :try_start_0
    invoke-virtual {p0}, Ll/c7x0;->d()Lcom/google/android/gms/internal/ads/zzgyl;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {}, Ll/jhx0;->a()Ll/jhx0;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-static {v1, v2}, Lcom/google/android/gms/internal/ads/c5;->O(Lcom/google/android/gms/internal/ads/zzgyl;Ll/jhx0;)Lcom/google/android/gms/internal/ads/c5;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {p0}, Ll/c7x0;->c()Lcom/google/android/gms/internal/ads/zzgvz;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    sget-object v2, Lcom/google/android/gms/internal/ads/zzgvz;->zzd:Lcom/google/android/gms/internal/ads/zzgvz;

    .line 34
    .line 35
    if-ne p0, v2, :cond_1

    .line 36
    .line 37
    invoke-virtual {v1}, Lcom/google/android/gms/internal/ads/c5;->L()I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-nez p0, :cond_0

    .line 42
    .line 43
    invoke-virtual {v1}, Lcom/google/android/gms/internal/ads/c5;->P()Lcom/google/android/gms/internal/ads/d5;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-static {p0}, Ll/a3x0;->f(Lcom/google/android/gms/internal/ads/d5;)Ll/v2x0;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-static {p0}, Ll/q2x0;->a(Ll/v2x0;)Ll/q2x0;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0

    .line 56
    :cond_0
    new-instance p0, Ljava/security/GeneralSecurityException;

    .line 57
    .line 58
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {p1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-direct {p0, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    throw p0

    .line 70
    :cond_1
    new-instance p0, Ljava/security/GeneralSecurityException;

    .line 71
    .line 72
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-direct {p0, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    throw p0
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzhag; {:try_start_0 .. :try_end_0} :catch_0

    .line 84
    :catch_0
    move-exception p0

    .line 85
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 86
    .line 87
    const-string v0, "Parsing KmsEnvelopeAeadKey failed: "

    .line 88
    .line 89
    invoke-direct {p1, v0, p0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 90
    .line 91
    .line 92
    throw p1

    .line 93
    :cond_2
    const-string p0, "Wrong type URL in call to LegacyKmsEnvelopeAeadProtoSerialization.parseKey"

    .line 94
    .line 95
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    const/4 p0, 0x0

    .line 99
    return-object p0
.end method

.method public static synthetic b(Ll/d7x0;)Ll/v2x0;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/d7x0;->c()Lcom/google/android/gms/internal/ads/u4;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/u4;->R()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "type.googleapis.com/google.crypto.tink.KmsEnvelopeAeadKey"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    :try_start_0
    invoke-virtual {p0}, Ll/d7x0;->c()Lcom/google/android/gms/internal/ads/u4;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/u4;->Q()Lcom/google/android/gms/internal/ads/zzgyl;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {}, Ll/jhx0;->a()Ll/jhx0;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {p0, v0}, Lcom/google/android/gms/internal/ads/d5;->P(Lcom/google/android/gms/internal/ads/zzgyl;Ll/jhx0;)Lcom/google/android/gms/internal/ads/d5;

    .line 30
    .line 31
    .line 32
    move-result-object p0
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzhag; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    invoke-static {p0}, Ll/a3x0;->f(Lcom/google/android/gms/internal/ads/d5;)Ll/v2x0;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0

    .line 38
    :catch_0
    move-exception p0

    .line 39
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 40
    .line 41
    const-string v1, "Parsing KmsEnvelopeAeadKeyFormat failed: "

    .line 42
    .line 43
    invoke-direct {v0, v1, p0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 44
    .line 45
    .line 46
    throw v0

    .line 47
    :cond_0
    invoke-virtual {p0}, Ll/d7x0;->c()Lcom/google/android/gms/internal/ads/u4;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/u4;->R()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    const-string v0, "Wrong type URL in call to LegacyKmsEnvelopeAeadProtoSerialization.parseParameters: "

    .line 60
    .line 61
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    const/4 p0, 0x0

    .line 69
    return-object p0
.end method

.method public static synthetic c(Ll/q2x0;Ll/ayw0;)Ll/c7x0;
    .locals 3

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/ads/c5;->M()Ll/xdx0;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Ll/q2x0;->b()Ll/v2x0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ll/a3x0;->g(Ll/v2x0;)Lcom/google/android/gms/internal/ads/d5;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p1, p0}, Ll/xdx0;->q(Lcom/google/android/gms/internal/ads/d5;)Ll/xdx0;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Ll/shx0;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/google/android/gms/internal/ads/c5;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/h5;->c()Lcom/google/android/gms/internal/ads/zzgyl;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    sget-object p1, Lcom/google/android/gms/internal/ads/zzgus;->zze:Lcom/google/android/gms/internal/ads/zzgus;

    .line 27
    .line 28
    sget-object v0, Lcom/google/android/gms/internal/ads/zzgvz;->zzd:Lcom/google/android/gms/internal/ads/zzgvz;

    .line 29
    .line 30
    const-string v1, "type.googleapis.com/google.crypto.tink.KmsEnvelopeAeadKey"

    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    invoke-static {v1, p0, p1, v0, v2}, Ll/c7x0;->a(Ljava/lang/String;Lcom/google/android/gms/internal/ads/zzgyl;Lcom/google/android/gms/internal/ads/zzgus;Lcom/google/android/gms/internal/ads/zzgvz;Ljava/lang/Integer;)Ll/c7x0;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public static synthetic d(Ll/v2x0;)Ll/d7x0;
    .locals 2

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/ads/u4;->L()Ll/edx0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "type.googleapis.com/google.crypto.tink.KmsEnvelopeAeadKey"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/edx0;->r(Ljava/lang/String;)Ll/edx0;

    .line 8
    .line 9
    .line 10
    invoke-static {p0}, Ll/a3x0;->g(Ll/v2x0;)Lcom/google/android/gms/internal/ads/d5;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/h5;->c()Lcom/google/android/gms/internal/ads/zzgyl;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {v0, p0}, Ll/edx0;->s(Lcom/google/android/gms/internal/ads/zzgyl;)Ll/edx0;

    .line 19
    .line 20
    .line 21
    sget-object p0, Lcom/google/android/gms/internal/ads/zzgvz;->zzd:Lcom/google/android/gms/internal/ads/zzgvz;

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Ll/edx0;->q(Lcom/google/android/gms/internal/ads/zzgvz;)Ll/edx0;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ll/shx0;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Lcom/google/android/gms/internal/ads/u4;

    .line 31
    .line 32
    invoke-static {p0}, Ll/d7x0;->b(Lcom/google/android/gms/internal/ads/u4;)Ll/d7x0;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public static e(Ll/j6x0;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    sget-object v0, Ll/a3x0;->b:Ll/r6x0;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/j6x0;->j(Ll/r6x0;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Ll/a3x0;->c:Ll/n6x0;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/j6x0;->i(Ll/n6x0;)V

    .line 9
    .line 10
    .line 11
    sget-object v0, Ll/a3x0;->d:Ll/n5x0;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/j6x0;->h(Ll/n5x0;)V

    .line 14
    .line 15
    .line 16
    sget-object v0, Ll/a3x0;->e:Ll/j5x0;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/j6x0;->g(Ll/j5x0;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static f(Lcom/google/android/gms/internal/ads/d5;)Ll/v2x0;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/ads/u4;->L()Ll/edx0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/d5;->L()Lcom/google/android/gms/internal/ads/u4;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Lcom/google/android/gms/internal/ads/u4;->R()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/edx0;->r(Ljava/lang/String;)Ll/edx0;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/d5;->L()Lcom/google/android/gms/internal/ads/u4;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Lcom/google/android/gms/internal/ads/u4;->Q()Lcom/google/android/gms/internal/ads/zzgyl;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Ll/edx0;->s(Lcom/google/android/gms/internal/ads/zzgyl;)Ll/edx0;

    .line 25
    .line 26
    .line 27
    sget-object v1, Lcom/google/android/gms/internal/ads/zzgvz;->zzd:Lcom/google/android/gms/internal/ads/zzgvz;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ll/edx0;->q(Lcom/google/android/gms/internal/ads/zzgvz;)Ll/edx0;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ll/shx0;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Lcom/google/android/gms/internal/ads/u4;

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/h5;->h()[B

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-static {v0}, Ll/cyw0;->a([B)Ll/lxw0;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    instance-of v1, v0, Ll/o0x0;

    .line 47
    .line 48
    if-eqz v1, :cond_0

    .line 49
    .line 50
    sget-object v1, Ll/t2x0;->b:Ll/t2x0;

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    instance-of v1, v0, Ll/r1x0;

    .line 54
    .line 55
    if-eqz v1, :cond_1

    .line 56
    .line 57
    sget-object v1, Ll/t2x0;->d:Ll/t2x0;

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    instance-of v1, v0, Ll/o3x0;

    .line 61
    .line 62
    if-eqz v1, :cond_2

    .line 63
    .line 64
    sget-object v1, Ll/t2x0;->c:Ll/t2x0;

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_2
    instance-of v1, v0, Ll/xyw0;

    .line 68
    .line 69
    if-eqz v1, :cond_3

    .line 70
    .line 71
    sget-object v1, Ll/t2x0;->e:Ll/t2x0;

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_3
    instance-of v1, v0, Ll/rzw0;

    .line 75
    .line 76
    if-eqz v1, :cond_4

    .line 77
    .line 78
    sget-object v1, Ll/t2x0;->f:Ll/t2x0;

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_4
    instance-of v1, v0, Ll/b1x0;

    .line 82
    .line 83
    if-eqz v1, :cond_5

    .line 84
    .line 85
    sget-object v1, Ll/t2x0;->g:Ll/t2x0;

    .line 86
    .line 87
    :goto_0
    new-instance v2, Ll/s2x0;

    .line 88
    .line 89
    const/4 v3, 0x0

    .line 90
    invoke-direct {v2, v3}, Ll/s2x0;-><init>(Ll/r2x0;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/d5;->Q()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-virtual {v2, p0}, Ll/s2x0;->c(Ljava/lang/String;)Ll/s2x0;

    .line 98
    .line 99
    .line 100
    check-cast v0, Ll/gyw0;

    .line 101
    .line 102
    invoke-virtual {v2, v0}, Ll/s2x0;->a(Ll/gyw0;)Ll/s2x0;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v2, v1}, Ll/s2x0;->b(Ll/t2x0;)Ll/s2x0;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v2}, Ll/s2x0;->d()Ll/v2x0;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    return-object p0

    .line 113
    :cond_5
    new-instance p0, Ljava/security/GeneralSecurityException;

    .line 114
    .line 115
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    const-string v1, "Unsupported DEK parameters when parsing "

    .line 120
    .line 121
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-direct {p0, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    throw p0
.end method

.method public static g(Ll/v2x0;)Lcom/google/android/gms/internal/ads/d5;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/v2x0;->b()Ll/gyw0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/cyw0;->b(Ll/lxw0;)[B

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    :try_start_0
    invoke-static {}, Ll/jhx0;->a()Ll/jhx0;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v0, v1}, Lcom/google/android/gms/internal/ads/u4;->O([BLl/jhx0;)Lcom/google/android/gms/internal/ads/u4;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {}, Lcom/google/android/gms/internal/ads/d5;->M()Ll/zdx0;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {p0}, Ll/v2x0;->c()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v1, p0}, Ll/zdx0;->r(Ljava/lang/String;)Ll/zdx0;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1, v0}, Ll/zdx0;->q(Lcom/google/android/gms/internal/ads/u4;)Ll/zdx0;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1}, Ll/shx0;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, Lcom/google/android/gms/internal/ads/d5;
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzhag; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    .line 37
    return-object p0

    .line 38
    :catch_0
    move-exception p0

    .line 39
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 40
    .line 41
    const-string v1, "Parsing KmsEnvelopeAeadKeyFormat failed: "

    .line 42
    .line 43
    invoke-direct {v0, v1, p0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 44
    .line 45
    .line 46
    throw v0
.end method
