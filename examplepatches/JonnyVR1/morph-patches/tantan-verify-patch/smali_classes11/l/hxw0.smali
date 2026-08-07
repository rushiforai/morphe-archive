.class public final Ll/hxw0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/google/android/gms/internal/ads/x4;

.field public final b:Ljava/util/List;

.field public final c:Ll/nax0;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/ads/x4;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/hxw0;->a:Lcom/google/android/gms/internal/ads/x4;

    .line 5
    .line 6
    iput-object p2, p0, Ll/hxw0;->b:Ljava/util/List;

    .line 7
    .line 8
    sget-object p1, Ll/nax0;->b:Ll/nax0;

    .line 9
    .line 10
    iput-object p1, p0, Ll/hxw0;->c:Ll/nax0;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/internal/ads/x4;Ljava/util/List;Ll/nax0;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hxw0;->a:Lcom/google/android/gms/internal/ads/x4;

    iput-object p2, p0, Ll/hxw0;->b:Ljava/util/List;

    iput-object p3, p0, Ll/hxw0;->c:Ll/nax0;

    return-void
.end method

.method public static final a(Lcom/google/android/gms/internal/ads/x4;)Ll/hxw0;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    invoke-static {p0}, Ll/hxw0;->i(Lcom/google/android/gms/internal/ads/x4;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Ll/hxw0;->h(Lcom/google/android/gms/internal/ads/x4;)Ljava/util/List;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Ll/hxw0;

    .line 9
    .line 10
    invoke-direct {v1, p0, v0}, Ll/hxw0;-><init>(Lcom/google/android/gms/internal/ads/x4;Ljava/util/List;)V

    .line 11
    .line 12
    .line 13
    return-object v1
.end method

.method public static final b(Lcom/google/android/gms/internal/ads/x4;Ll/nax0;)Ll/hxw0;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    invoke-static {p0}, Ll/hxw0;->i(Lcom/google/android/gms/internal/ads/x4;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Ll/hxw0;->h(Lcom/google/android/gms/internal/ads/x4;)Ljava/util/List;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Ll/hxw0;

    .line 9
    .line 10
    invoke-direct {v1, p0, v0, p1}, Ll/hxw0;-><init>(Lcom/google/android/gms/internal/ads/x4;Ljava/util/List;Ll/nax0;)V

    .line 11
    .line 12
    .line 13
    return-object v1
.end method

.method public static final c(Ll/lxw0;)Ll/hxw0;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    new-instance v0, Ll/exw0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/exw0;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/cxw0;

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-direct {v1, p0, v2}, Ll/cxw0;-><init>(Ll/lxw0;Ll/bxw0;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1}, Ll/cxw0;->e()Ll/cxw0;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1}, Ll/cxw0;->d()Ll/cxw0;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/exw0;->a(Ll/cxw0;)Ll/exw0;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ll/exw0;->b()Ll/hxw0;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public static f(Lcom/google/android/gms/internal/ads/w4;)Ll/c7x0;
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/w4;->L()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/w4;->P()Lcom/google/android/gms/internal/ads/zzgvz;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget-object v2, Lcom/google/android/gms/internal/ads/zzgvz;->zzd:Lcom/google/android/gms/internal/ads/zzgvz;

    .line 10
    .line 11
    if-ne v1, v2, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    :goto_0
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/w4;->M()Lcom/google/android/gms/internal/ads/t4;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Lcom/google/android/gms/internal/ads/t4;->Q()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/w4;->M()Lcom/google/android/gms/internal/ads/t4;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v2}, Lcom/google/android/gms/internal/ads/t4;->P()Lcom/google/android/gms/internal/ads/zzgyl;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/w4;->M()Lcom/google/android/gms/internal/ads/t4;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-virtual {v3}, Lcom/google/android/gms/internal/ads/t4;->M()Lcom/google/android/gms/internal/ads/zzgus;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/w4;->P()Lcom/google/android/gms/internal/ads/zzgvz;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-static {v1, v2, v3, p0, v0}, Ll/c7x0;->a(Ljava/lang/String;Lcom/google/android/gms/internal/ads/zzgyl;Lcom/google/android/gms/internal/ads/zzgus;Lcom/google/android/gms/internal/ads/zzgvz;Ljava/lang/Integer;)Ll/c7x0;

    .line 48
    .line 49
    .line 50
    move-result-object p0
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    return-object p0

    .line 52
    :catch_0
    move-exception p0

    .line 53
    new-instance v0, Lcom/google/android/gms/internal/ads/zzgpl;

    .line 54
    .line 55
    const-string v1, "Creating a protokey serialization failed"

    .line 56
    .line 57
    invoke-direct {v0, v1, p0}, Lcom/google/android/gms/internal/ads/zzgpl;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 58
    .line 59
    .line 60
    throw v0
.end method

.method public static g(Ll/d5x0;Lcom/google/android/gms/internal/ads/w4;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    :try_start_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/ads/w4;->M()Lcom/google/android/gms/internal/ads/t4;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    invoke-static {p1, p2}, Ll/zxw0;->c(Lcom/google/android/gms/internal/ads/t4;Ljava/lang/Class;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_0} :catch_1

    .line 10
    return-object p0

    .line 11
    :catch_0
    move-exception p1

    .line 12
    goto :goto_0

    .line 13
    :catch_1
    return-object p0

    .line 14
    :goto_0
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    const-string v0, "No key manager found for key type "

    .line 19
    .line 20
    invoke-virtual {p2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    if-nez p2, :cond_1

    .line 25
    .line 26
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    const-string v0, " not supported by key manager of type "

    .line 31
    .line 32
    invoke-virtual {p2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    if-eqz p2, :cond_0

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_0
    throw p1

    .line 40
    :cond_1
    :goto_1
    return-object p0
.end method

.method public static h(Lcom/google/android/gms/internal/ads/x4;)Ljava/util/List;
    .locals 9

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/x4;->L()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/x4;->R()Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_4

    .line 23
    .line 24
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Lcom/google/android/gms/internal/ads/w4;

    .line 29
    .line 30
    invoke-virtual {v2}, Lcom/google/android/gms/internal/ads/w4;->L()I

    .line 31
    .line 32
    .line 33
    move-result v6

    .line 34
    invoke-static {v2}, Ll/hxw0;->f(Lcom/google/android/gms/internal/ads/w4;)Ll/c7x0;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    :try_start_0
    invoke-static {}, Ll/j6x0;->d()Ll/j6x0;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    invoke-static {}, Ll/ayw0;->a()Ll/ayw0;

    .line 43
    .line 44
    .line 45
    move-result-object v5

    .line 46
    invoke-virtual {v4, v3, v5}, Ll/j6x0;->b(Ll/c7x0;Ll/ayw0;)Ll/xww0;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    new-instance v3, Ll/gxw0;

    .line 51
    .line 52
    invoke-virtual {v2}, Lcom/google/android/gms/internal/ads/w4;->U()I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    add-int/lit8 v2, v2, -0x2

    .line 57
    .line 58
    const/4 v5, 0x1

    .line 59
    if-eq v2, v5, :cond_2

    .line 60
    .line 61
    const/4 v7, 0x2

    .line 62
    if-eq v2, v7, :cond_1

    .line 63
    .line 64
    const/4 v7, 0x3

    .line 65
    if-ne v2, v7, :cond_0

    .line 66
    .line 67
    sget-object v2, Ll/zww0;->d:Ll/zww0;

    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_0
    new-instance v2, Ljava/security/GeneralSecurityException;

    .line 71
    .line 72
    const-string v3, "Unknown key status"

    .line 73
    .line 74
    invoke-direct {v2, v3}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    throw v2

    .line 78
    :cond_1
    sget-object v2, Ll/zww0;->c:Ll/zww0;

    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_2
    sget-object v2, Ll/zww0;->b:Ll/zww0;

    .line 82
    .line 83
    :goto_1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/x4;->M()I

    .line 84
    .line 85
    .line 86
    move-result v7

    .line 87
    if-ne v6, v7, :cond_3

    .line 88
    .line 89
    :goto_2
    move v7, v5

    .line 90
    goto :goto_3

    .line 91
    :cond_3
    const/4 v5, 0x0

    .line 92
    goto :goto_2

    .line 93
    :goto_3
    const/4 v8, 0x0

    .line 94
    move-object v5, v2

    .line 95
    invoke-direct/range {v3 .. v8}, Ll/gxw0;-><init>(Ll/xww0;Ll/zww0;IZLl/fxw0;)V

    .line 96
    .line 97
    .line 98
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 99
    .line 100
    .line 101
    goto :goto_0

    .line 102
    :catch_0
    const/4 v2, 0x0

    .line 103
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_4
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    return-object p0
.end method

.method public static i(Lcom/google/android/gms/internal/ads/x4;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/x4;->L()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-lez p0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const-string p0, "empty keyset"

    .line 11
    .line 12
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static final j(Ll/d5x0;Ll/xww0;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-static {}, Ll/g6x0;->a()Ll/g6x0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Ll/g6x0;->c(Ll/xww0;Ljava/lang/Class;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    return-object p0

    .line 10
    :catch_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method


# virtual methods
.method public final d()Lcom/google/android/gms/internal/ads/x4;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hxw0;->a:Lcom/google/android/gms/internal/ads/x4;

    .line 2
    .line 3
    return-object p0
.end method

.method public final e(Ll/nww0;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    invoke-static {p2}, Ll/zxw0;->b(Ljava/lang/Class;)Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_11

    .line 6
    .line 7
    iget-object v1, p0, Ll/hxw0;->a:Lcom/google/android/gms/internal/ads/x4;

    .line 8
    .line 9
    sget-object v2, Ll/dyw0;->a:Ljava/nio/charset/Charset;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/google/android/gms/internal/ads/x4;->M()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    invoke-virtual {v1}, Lcom/google/android/gms/internal/ads/x4;->R()Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const/4 v3, 0x0

    .line 24
    const/4 v4, 0x1

    .line 25
    move v5, v3

    .line 26
    move v6, v5

    .line 27
    move v7, v4

    .line 28
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 29
    .line 30
    .line 31
    move-result v8

    .line 32
    const/4 v9, 0x0

    .line 33
    const/4 v10, 0x3

    .line 34
    if-eqz v8, :cond_7

    .line 35
    .line 36
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v8

    .line 40
    check-cast v8, Lcom/google/android/gms/internal/ads/w4;

    .line 41
    .line 42
    invoke-virtual {v8}, Lcom/google/android/gms/internal/ads/w4;->U()I

    .line 43
    .line 44
    .line 45
    move-result v11

    .line 46
    if-ne v11, v10, :cond_0

    .line 47
    .line 48
    invoke-virtual {v8}, Lcom/google/android/gms/internal/ads/w4;->T()Z

    .line 49
    .line 50
    .line 51
    move-result v10

    .line 52
    if-eqz v10, :cond_6

    .line 53
    .line 54
    invoke-virtual {v8}, Lcom/google/android/gms/internal/ads/w4;->P()Lcom/google/android/gms/internal/ads/zzgvz;

    .line 55
    .line 56
    .line 57
    move-result-object v10

    .line 58
    sget-object v11, Lcom/google/android/gms/internal/ads/zzgvz;->zza:Lcom/google/android/gms/internal/ads/zzgvz;

    .line 59
    .line 60
    if-eq v10, v11, :cond_5

    .line 61
    .line 62
    invoke-virtual {v8}, Lcom/google/android/gms/internal/ads/w4;->U()I

    .line 63
    .line 64
    .line 65
    move-result v10

    .line 66
    const/4 v11, 0x2

    .line 67
    if-eq v10, v11, :cond_4

    .line 68
    .line 69
    invoke-virtual {v8}, Lcom/google/android/gms/internal/ads/w4;->L()I

    .line 70
    .line 71
    .line 72
    move-result v10

    .line 73
    if-ne v10, v2, :cond_2

    .line 74
    .line 75
    if-nez v6, :cond_1

    .line 76
    .line 77
    move v6, v4

    .line 78
    goto :goto_1

    .line 79
    :cond_1
    const-string p0, "keyset contains multiple primary keys"

    .line 80
    .line 81
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    return-object v9

    .line 85
    :cond_2
    :goto_1
    invoke-virtual {v8}, Lcom/google/android/gms/internal/ads/w4;->M()Lcom/google/android/gms/internal/ads/t4;

    .line 86
    .line 87
    .line 88
    move-result-object v8

    .line 89
    invoke-virtual {v8}, Lcom/google/android/gms/internal/ads/t4;->M()Lcom/google/android/gms/internal/ads/zzgus;

    .line 90
    .line 91
    .line 92
    move-result-object v8

    .line 93
    sget-object v9, Lcom/google/android/gms/internal/ads/zzgus;->zzd:Lcom/google/android/gms/internal/ads/zzgus;

    .line 94
    .line 95
    if-eq v8, v9, :cond_3

    .line 96
    .line 97
    move v8, v3

    .line 98
    goto :goto_2

    .line 99
    :cond_3
    move v8, v4

    .line 100
    :goto_2
    and-int/2addr v7, v8

    .line 101
    add-int/lit8 v5, v5, 0x1

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_4
    new-instance p0, Ljava/security/GeneralSecurityException;

    .line 105
    .line 106
    invoke-virtual {v8}, Lcom/google/android/gms/internal/ads/w4;->L()I

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    const-string p2, "key %d has unknown status"

    .line 119
    .line 120
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    invoke-direct {p0, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    throw p0

    .line 128
    :cond_5
    new-instance p0, Ljava/security/GeneralSecurityException;

    .line 129
    .line 130
    invoke-virtual {v8}, Lcom/google/android/gms/internal/ads/w4;->L()I

    .line 131
    .line 132
    .line 133
    move-result p1

    .line 134
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    const-string p2, "key %d has unknown prefix"

    .line 143
    .line 144
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    invoke-direct {p0, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    throw p0

    .line 152
    :cond_6
    new-instance p0, Ljava/security/GeneralSecurityException;

    .line 153
    .line 154
    invoke-virtual {v8}, Lcom/google/android/gms/internal/ads/w4;->L()I

    .line 155
    .line 156
    .line 157
    move-result p1

    .line 158
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    const-string p2, "key %d has no key data"

    .line 167
    .line 168
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    invoke-direct {p0, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    throw p0

    .line 176
    :cond_7
    if-eqz v5, :cond_10

    .line 177
    .line 178
    if-nez v6, :cond_9

    .line 179
    .line 180
    if-eqz v7, :cond_8

    .line 181
    .line 182
    goto :goto_3

    .line 183
    :cond_8
    const-string p0, "keyset doesn\'t contain a valid primary key"

    .line 184
    .line 185
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 186
    .line 187
    .line 188
    return-object v9

    .line 189
    :cond_9
    :goto_3
    new-instance v1, Ll/nxw0;

    .line 190
    .line 191
    invoke-direct {v1, v0, v9}, Ll/nxw0;-><init>(Ljava/lang/Class;Ll/mxw0;)V

    .line 192
    .line 193
    .line 194
    iget-object v2, p0, Ll/hxw0;->c:Ll/nax0;

    .line 195
    .line 196
    invoke-virtual {v1, v2}, Ll/nxw0;->c(Ll/nax0;)Ll/nxw0;

    .line 197
    .line 198
    .line 199
    :goto_4
    iget-object v2, p0, Ll/hxw0;->a:Lcom/google/android/gms/internal/ads/x4;

    .line 200
    .line 201
    invoke-virtual {v2}, Lcom/google/android/gms/internal/ads/x4;->L()I

    .line 202
    .line 203
    .line 204
    move-result v2

    .line 205
    if-ge v3, v2, :cond_f

    .line 206
    .line 207
    iget-object v2, p0, Ll/hxw0;->a:Lcom/google/android/gms/internal/ads/x4;

    .line 208
    .line 209
    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/ads/x4;->O(I)Lcom/google/android/gms/internal/ads/w4;

    .line 210
    .line 211
    .line 212
    move-result-object v2

    .line 213
    invoke-virtual {v2}, Lcom/google/android/gms/internal/ads/w4;->U()I

    .line 214
    .line 215
    .line 216
    move-result v4

    .line 217
    if-ne v4, v10, :cond_e

    .line 218
    .line 219
    move-object v4, p1

    .line 220
    check-cast v4, Ll/d5x0;

    .line 221
    .line 222
    invoke-static {v4, v2, v0}, Ll/hxw0;->g(Ll/d5x0;Lcom/google/android/gms/internal/ads/w4;Ljava/lang/Class;)Ljava/lang/Object;

    .line 223
    .line 224
    .line 225
    move-result-object v5

    .line 226
    iget-object v6, p0, Ll/hxw0;->b:Ljava/util/List;

    .line 227
    .line 228
    invoke-interface {v6, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 229
    .line 230
    .line 231
    move-result-object v6

    .line 232
    if-eqz v6, :cond_a

    .line 233
    .line 234
    iget-object v6, p0, Ll/hxw0;->b:Ljava/util/List;

    .line 235
    .line 236
    invoke-interface {v6, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 237
    .line 238
    .line 239
    move-result-object v6

    .line 240
    check-cast v6, Ll/gxw0;

    .line 241
    .line 242
    invoke-virtual {v6}, Ll/gxw0;->a()Ll/xww0;

    .line 243
    .line 244
    .line 245
    move-result-object v6

    .line 246
    invoke-static {v4, v6, v0}, Ll/hxw0;->j(Ll/d5x0;Ll/xww0;Ljava/lang/Class;)Ljava/lang/Object;

    .line 247
    .line 248
    .line 249
    move-result-object v4

    .line 250
    goto :goto_5

    .line 251
    :cond_a
    move-object v4, v9

    .line 252
    :goto_5
    if-nez v4, :cond_c

    .line 253
    .line 254
    if-eqz v5, :cond_b

    .line 255
    .line 256
    goto :goto_6

    .line 257
    :cond_b
    new-instance p0, Ljava/security/GeneralSecurityException;

    .line 258
    .line 259
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 260
    .line 261
    .line 262
    move-result-object p1

    .line 263
    invoke-virtual {v2}, Lcom/google/android/gms/internal/ads/w4;->M()Lcom/google/android/gms/internal/ads/t4;

    .line 264
    .line 265
    .line 266
    move-result-object p2

    .line 267
    invoke-virtual {p2}, Lcom/google/android/gms/internal/ads/t4;->Q()Ljava/lang/String;

    .line 268
    .line 269
    .line 270
    move-result-object p2

    .line 271
    new-instance v0, Ljava/lang/StringBuilder;

    .line 272
    .line 273
    const-string v1, "Unable to get primitive "

    .line 274
    .line 275
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 276
    .line 277
    .line 278
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 279
    .line 280
    .line 281
    const-string p1, " for key of type "

    .line 282
    .line 283
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 284
    .line 285
    .line 286
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 287
    .line 288
    .line 289
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 290
    .line 291
    .line 292
    move-result-object p1

    .line 293
    invoke-direct {p0, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 294
    .line 295
    .line 296
    throw p0

    .line 297
    :cond_c
    :goto_6
    invoke-virtual {v2}, Lcom/google/android/gms/internal/ads/w4;->L()I

    .line 298
    .line 299
    .line 300
    move-result v6

    .line 301
    iget-object v7, p0, Ll/hxw0;->a:Lcom/google/android/gms/internal/ads/x4;

    .line 302
    .line 303
    invoke-virtual {v7}, Lcom/google/android/gms/internal/ads/x4;->M()I

    .line 304
    .line 305
    .line 306
    move-result v7

    .line 307
    if-ne v6, v7, :cond_d

    .line 308
    .line 309
    invoke-virtual {v1, v4, v5, v2}, Ll/nxw0;->b(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/ads/w4;)Ll/nxw0;

    .line 310
    .line 311
    .line 312
    goto :goto_7

    .line 313
    :cond_d
    invoke-virtual {v1, v4, v5, v2}, Ll/nxw0;->a(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/ads/w4;)Ll/nxw0;

    .line 314
    .line 315
    .line 316
    :cond_e
    :goto_7
    add-int/lit8 v3, v3, 0x1

    .line 317
    .line 318
    goto :goto_4

    .line 319
    :cond_f
    invoke-virtual {v1}, Ll/nxw0;->d()Ll/sxw0;

    .line 320
    .line 321
    .line 322
    move-result-object p0

    .line 323
    invoke-static {}, Ll/g6x0;->a()Ll/g6x0;

    .line 324
    .line 325
    .line 326
    move-result-object p1

    .line 327
    invoke-virtual {p1, p0, p2}, Ll/g6x0;->d(Ll/sxw0;Ljava/lang/Class;)Ljava/lang/Object;

    .line 328
    .line 329
    .line 330
    move-result-object p0

    .line 331
    return-object p0

    .line 332
    :cond_10
    const-string p0, "keyset must contain at least one ENABLED key"

    .line 333
    .line 334
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 335
    .line 336
    .line 337
    return-object v9

    .line 338
    :cond_11
    new-instance p0, Ljava/security/GeneralSecurityException;

    .line 339
    .line 340
    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 341
    .line 342
    .line 343
    move-result-object p1

    .line 344
    const-string p2, "No wrapper found for "

    .line 345
    .line 346
    invoke-virtual {p2, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 347
    .line 348
    .line 349
    move-result-object p1

    .line 350
    invoke-direct {p0, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 351
    .line 352
    .line 353
    throw p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 4

    .line 1
    sget-object v0, Ll/dyw0;->a:Ljava/nio/charset/Charset;

    .line 2
    .line 3
    iget-object p0, p0, Ll/hxw0;->a:Lcom/google/android/gms/internal/ads/x4;

    .line 4
    .line 5
    invoke-static {}, Lcom/google/android/gms/internal/ads/z4;->L()Ll/qdx0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/x4;->M()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-virtual {v0, v1}, Ll/qdx0;->r(I)Ll/qdx0;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/x4;->R()Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Lcom/google/android/gms/internal/ads/w4;

    .line 35
    .line 36
    invoke-static {}, Lcom/google/android/gms/internal/ads/y4;->L()Ll/rdx0;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v1}, Lcom/google/android/gms/internal/ads/w4;->M()Lcom/google/android/gms/internal/ads/t4;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-virtual {v3}, Lcom/google/android/gms/internal/ads/t4;->Q()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-virtual {v2, v3}, Ll/rdx0;->s(Ljava/lang/String;)Ll/rdx0;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1}, Lcom/google/android/gms/internal/ads/w4;->U()I

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    invoke-virtual {v2, v3}, Ll/rdx0;->t(I)Ll/rdx0;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1}, Lcom/google/android/gms/internal/ads/w4;->P()Lcom/google/android/gms/internal/ads/zzgvz;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    invoke-virtual {v2, v3}, Ll/rdx0;->r(Lcom/google/android/gms/internal/ads/zzgvz;)Ll/rdx0;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1}, Lcom/google/android/gms/internal/ads/w4;->L()I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    invoke-virtual {v2, v1}, Ll/rdx0;->q(I)Ll/rdx0;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v2}, Ll/shx0;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    check-cast v1, Lcom/google/android/gms/internal/ads/y4;

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Ll/qdx0;->q(Lcom/google/android/gms/internal/ads/y4;)Ll/qdx0;

    .line 79
    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_0
    invoke-virtual {v0}, Ll/shx0;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    check-cast p0, Lcom/google/android/gms/internal/ads/z4;

    .line 87
    .line 88
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/p5;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    return-object p0
.end method
