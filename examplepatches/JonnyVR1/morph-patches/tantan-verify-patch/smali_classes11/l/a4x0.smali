.class public final Ll/a4x0;
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
    const-string v0, "type.googleapis.com/google.crypto.tink.AesGcmKey"

    .line 2
    .line 3
    invoke-static {v0}, Ll/u7x0;->a(Ljava/lang/String;)Ll/wfx0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Ll/a4x0;->a:Ll/wfx0;

    .line 8
    .line 9
    sget-object v1, Ll/p3x0;->a:Ll/p3x0;

    .line 10
    .line 11
    const-class v2, Ll/o0x0;

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
    sput-object v1, Ll/a4x0;->b:Ll/r6x0;

    .line 20
    .line 21
    sget-object v1, Ll/x3x0;->a:Ll/x3x0;

    .line 22
    .line 23
    invoke-static {v1, v0, v3}, Ll/n6x0;->b(Ll/l6x0;Ll/wfx0;Ljava/lang/Class;)Ll/n6x0;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    sput-object v1, Ll/a4x0;->c:Ll/n6x0;

    .line 28
    .line 29
    sget-object v1, Ll/y3x0;->a:Ll/y3x0;

    .line 30
    .line 31
    const-class v2, Ll/a0x0;

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
    sput-object v1, Ll/a4x0;->d:Ll/n5x0;

    .line 40
    .line 41
    sget-object v1, Ll/z3x0;->a:Ll/z3x0;

    .line 42
    .line 43
    invoke-static {v1, v0, v3}, Ll/j5x0;->b(Ll/h5x0;Ll/wfx0;Ljava/lang/Class;)Ll/j5x0;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    sput-object v0, Ll/a4x0;->e:Ll/j5x0;

    .line 48
    .line 49
    return-void
.end method

.method public static synthetic a(Ll/c7x0;Ll/ayw0;)Ll/a0x0;
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/c7x0;->f()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "type.googleapis.com/google.crypto.tink.AesGcmKey"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    :try_start_0
    invoke-virtual {p0}, Ll/c7x0;->d()Lcom/google/android/gms/internal/ads/zzgyl;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {}, Ll/jhx0;->a()Ll/jhx0;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-static {v0, v2}, Lcom/google/android/gms/internal/ads/k4;->O(Lcom/google/android/gms/internal/ads/zzgyl;Ll/jhx0;)Lcom/google/android/gms/internal/ads/k4;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/k4;->L()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-nez v2, :cond_0

    .line 31
    .line 32
    invoke-static {}, Ll/o0x0;->c()Ll/l0x0;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/k4;->P()Lcom/google/android/gms/internal/ads/zzgyl;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-virtual {v3}, Lcom/google/android/gms/internal/ads/zzgyl;->zzd()I

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    invoke-virtual {v2, v3}, Ll/l0x0;->b(I)Ll/l0x0;

    .line 45
    .line 46
    .line 47
    const/16 v3, 0xc

    .line 48
    .line 49
    invoke-virtual {v2, v3}, Ll/l0x0;->a(I)Ll/l0x0;

    .line 50
    .line 51
    .line 52
    const/16 v3, 0x10

    .line 53
    .line 54
    invoke-virtual {v2, v3}, Ll/l0x0;->c(I)Ll/l0x0;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Ll/c7x0;->c()Lcom/google/android/gms/internal/ads/zzgvz;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    invoke-static {v3}, Ll/a4x0;->f(Lcom/google/android/gms/internal/ads/zzgvz;)Ll/m0x0;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    invoke-virtual {v2, v3}, Ll/l0x0;->d(Ll/m0x0;)Ll/l0x0;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v2}, Ll/l0x0;->e()Ll/o0x0;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-static {}, Ll/a0x0;->a()Ll/yzw0;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    invoke-virtual {v3, v2}, Ll/yzw0;->c(Ll/o0x0;)Ll/yzw0;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/k4;->P()Lcom/google/android/gms/internal/ads/zzgyl;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/zzgyl;->zzA()[B

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-static {v0, p1}, Ll/xfx0;->b([BLl/ayw0;)Ll/xfx0;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-virtual {v3, p1}, Ll/yzw0;->b(Ll/xfx0;)Ll/yzw0;

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0}, Ll/c7x0;->e()Ljava/lang/Integer;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-virtual {v3, p0}, Ll/yzw0;->a(Ljava/lang/Integer;)Ll/yzw0;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v3}, Ll/yzw0;->d()Ll/a0x0;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    return-object p0

    .line 106
    :cond_0
    new-instance p0, Ljava/security/GeneralSecurityException;

    .line 107
    .line 108
    const-string p1, "Only version 0 keys are accepted"

    .line 109
    .line 110
    invoke-direct {p0, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    throw p0
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzhag; {:try_start_0 .. :try_end_0} :catch_0

    .line 114
    :catch_0
    const-string p0, "Parsing AesGcmKey failed"

    .line 115
    .line 116
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    return-object v1

    .line 120
    :cond_1
    const-string p0, "Wrong type URL in call to AesGcmProtoSerialization.parseKey"

    .line 121
    .line 122
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    return-object v1
.end method

.method public static synthetic b(Ll/d7x0;)Ll/o0x0;
    .locals 3

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
    const-string v1, "type.googleapis.com/google.crypto.tink.AesGcmKey"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    :try_start_0
    invoke-virtual {p0}, Ll/d7x0;->c()Lcom/google/android/gms/internal/ads/u4;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/u4;->Q()Lcom/google/android/gms/internal/ads/zzgyl;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {}, Ll/jhx0;->a()Ll/jhx0;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-static {v0, v2}, Lcom/google/android/gms/internal/ads/l4;->P(Lcom/google/android/gms/internal/ads/zzgyl;Ll/jhx0;)Lcom/google/android/gms/internal/ads/l4;

    .line 31
    .line 32
    .line 33
    move-result-object v0
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzhag; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/l4;->M()I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    if-nez v2, :cond_0

    .line 39
    .line 40
    invoke-static {}, Ll/o0x0;->c()Ll/l0x0;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/l4;->L()I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    invoke-virtual {v1, v0}, Ll/l0x0;->b(I)Ll/l0x0;

    .line 49
    .line 50
    .line 51
    const/16 v0, 0xc

    .line 52
    .line 53
    invoke-virtual {v1, v0}, Ll/l0x0;->a(I)Ll/l0x0;

    .line 54
    .line 55
    .line 56
    const/16 v0, 0x10

    .line 57
    .line 58
    invoke-virtual {v1, v0}, Ll/l0x0;->c(I)Ll/l0x0;

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Ll/d7x0;->c()Lcom/google/android/gms/internal/ads/u4;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/u4;->P()Lcom/google/android/gms/internal/ads/zzgvz;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-static {p0}, Ll/a4x0;->f(Lcom/google/android/gms/internal/ads/zzgvz;)Ll/m0x0;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {v1, p0}, Ll/l0x0;->d(Ll/m0x0;)Ll/l0x0;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v1}, Ll/l0x0;->e()Ll/o0x0;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    return-object p0

    .line 81
    :cond_0
    const-string p0, "Only version 0 parameters are accepted"

    .line 82
    .line 83
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    return-object v1

    .line 87
    :catch_0
    move-exception p0

    .line 88
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 89
    .line 90
    const-string v1, "Parsing AesGcmParameters failed: "

    .line 91
    .line 92
    invoke-direct {v0, v1, p0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 93
    .line 94
    .line 95
    throw v0

    .line 96
    :cond_1
    invoke-virtual {p0}, Ll/d7x0;->c()Lcom/google/android/gms/internal/ads/u4;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/u4;->R()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    const-string v0, "Wrong type URL in call to AesGcmProtoSerialization.parseParameters: "

    .line 109
    .line 110
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    return-object v1
.end method

.method public static synthetic c(Ll/a0x0;Ll/ayw0;)Ll/c7x0;
    .locals 3

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/ads/k4;->M()Ll/bcx0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/a0x0;->d()Ll/xfx0;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1, p1}, Ll/xfx0;->d(Ll/ayw0;)[B

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    array-length v1, p1

    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-static {p1, v2, v1}, Lcom/google/android/gms/internal/ads/zzgyl;->zzv([BII)Lcom/google/android/gms/internal/ads/zzgyl;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {v0, p1}, Ll/bcx0;->q(Lcom/google/android/gms/internal/ads/zzgyl;)Ll/bcx0;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ll/shx0;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Lcom/google/android/gms/internal/ads/k4;

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/google/android/gms/internal/ads/h5;->c()Lcom/google/android/gms/internal/ads/zzgyl;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    sget-object v0, Lcom/google/android/gms/internal/ads/zzgus;->zzb:Lcom/google/android/gms/internal/ads/zzgus;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/a0x0;->b()Ll/o0x0;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v1}, Ll/o0x0;->d()Ll/m0x0;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-static {v1}, Ll/a4x0;->g(Ll/m0x0;)Lcom/google/android/gms/internal/ads/zzgvz;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {p0}, Ll/a0x0;->e()Ljava/lang/Integer;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    const-string v2, "type.googleapis.com/google.crypto.tink.AesGcmKey"

    .line 51
    .line 52
    invoke-static {v2, p1, v0, v1, p0}, Ll/c7x0;->a(Ljava/lang/String;Lcom/google/android/gms/internal/ads/zzgyl;Lcom/google/android/gms/internal/ads/zzgus;Lcom/google/android/gms/internal/ads/zzgvz;Ljava/lang/Integer;)Ll/c7x0;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0
.end method

.method public static synthetic d(Ll/o0x0;)Ll/d7x0;
    .locals 3

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/ads/u4;->L()Ll/edx0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "type.googleapis.com/google.crypto.tink.AesGcmKey"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/edx0;->r(Ljava/lang/String;)Ll/edx0;

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lcom/google/android/gms/internal/ads/l4;->N()Ll/dcx0;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {p0}, Ll/o0x0;->b()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    invoke-virtual {v1, v2}, Ll/dcx0;->q(I)Ll/dcx0;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ll/shx0;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Lcom/google/android/gms/internal/ads/l4;

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/google/android/gms/internal/ads/h5;->c()Lcom/google/android/gms/internal/ads/zzgyl;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Ll/edx0;->s(Lcom/google/android/gms/internal/ads/zzgyl;)Ll/edx0;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ll/o0x0;->d()Ll/m0x0;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {p0}, Ll/a4x0;->g(Ll/m0x0;)Lcom/google/android/gms/internal/ads/zzgvz;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {v0, p0}, Ll/edx0;->q(Lcom/google/android/gms/internal/ads/zzgvz;)Ll/edx0;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ll/shx0;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    check-cast p0, Lcom/google/android/gms/internal/ads/u4;

    .line 50
    .line 51
    invoke-static {p0}, Ll/d7x0;->b(Lcom/google/android/gms/internal/ads/u4;)Ll/d7x0;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
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
    sget-object v0, Ll/a4x0;->b:Ll/r6x0;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/j6x0;->j(Ll/r6x0;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Ll/a4x0;->c:Ll/n6x0;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/j6x0;->i(Ll/n6x0;)V

    .line 9
    .line 10
    .line 11
    sget-object v0, Ll/a4x0;->d:Ll/n5x0;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/j6x0;->h(Ll/n5x0;)V

    .line 14
    .line 15
    .line 16
    sget-object v0, Ll/a4x0;->e:Ll/j5x0;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/j6x0;->g(Ll/j5x0;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static f(Lcom/google/android/gms/internal/ads/zzgvz;)Ll/m0x0;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/ads/zzgvz;->zza:Lcom/google/android/gms/internal/ads/zzgvz;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-eq v0, v1, :cond_3

    .line 9
    .line 10
    const/4 v1, 0x2

    .line 11
    if-eq v0, v1, :cond_2

    .line 12
    .line 13
    const/4 v1, 0x3

    .line 14
    if-eq v0, v1, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x4

    .line 17
    if-ne v0, v1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/zzgvz;->zza()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    new-instance v1, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    const-string v2, "Unable to parse OutputPrefixType: "

    .line 29
    .line 30
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-direct {v0, p0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    throw v0

    .line 44
    :cond_1
    sget-object p0, Ll/m0x0;->d:Ll/m0x0;

    .line 45
    .line 46
    return-object p0

    .line 47
    :cond_2
    :goto_0
    sget-object p0, Ll/m0x0;->c:Ll/m0x0;

    .line 48
    .line 49
    return-object p0

    .line 50
    :cond_3
    sget-object p0, Ll/m0x0;->b:Ll/m0x0;

    .line 51
    .line 52
    return-object p0
.end method

.method public static g(Ll/m0x0;)Lcom/google/android/gms/internal/ads/zzgvz;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    sget-object v0, Ll/m0x0;->b:Ll/m0x0;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/google/android/gms/internal/ads/zzgvz;->zzb:Lcom/google/android/gms/internal/ads/zzgvz;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    sget-object v0, Ll/m0x0;->c:Ll/m0x0;

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    sget-object p0, Lcom/google/android/gms/internal/ads/zzgvz;->zze:Lcom/google/android/gms/internal/ads/zzgvz;

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    sget-object v0, Ll/m0x0;->d:Ll/m0x0;

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    sget-object p0, Lcom/google/android/gms/internal/ads/zzgvz;->zzd:Lcom/google/android/gms/internal/ads/zzgvz;

    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_2
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 35
    .line 36
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const-string v1, "Unable to serialize variant: "

    .line 41
    .line 42
    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-direct {v0, p0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    throw v0
.end method
