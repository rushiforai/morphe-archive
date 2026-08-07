.class public final Ll/eys0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/te20;


# instance fields
.field public final a:Ljava/util/Date;

.field public final b:I

.field public final c:Ljava/util/Set;

.field public final d:Z

.field public final e:Landroid/location/Location;

.field public final f:I

.field public final g:Lcom/google/android/gms/internal/ads/zzbjb;

.field public final h:Ljava/util/List;

.field public final i:Z

.field public final j:Ljava/util/Map;

.field public final k:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/util/Date;ILjava/util/Set;Landroid/location/Location;ZILcom/google/android/gms/internal/ads/zzbjb;Ljava/util/List;ZILjava/lang/String;)V
    .locals 0
    .param p1    # Ljava/util/Date;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/util/Set;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Landroid/location/Location;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/eys0;->a:Ljava/util/Date;

    .line 5
    .line 6
    iput p2, p0, Ll/eys0;->b:I

    .line 7
    .line 8
    iput-object p3, p0, Ll/eys0;->c:Ljava/util/Set;

    .line 9
    .line 10
    iput-object p4, p0, Ll/eys0;->e:Landroid/location/Location;

    .line 11
    .line 12
    iput-boolean p5, p0, Ll/eys0;->d:Z

    .line 13
    .line 14
    iput p6, p0, Ll/eys0;->f:I

    .line 15
    .line 16
    iput-object p7, p0, Ll/eys0;->g:Lcom/google/android/gms/internal/ads/zzbjb;

    .line 17
    .line 18
    iput-boolean p9, p0, Ll/eys0;->i:Z

    .line 19
    .line 20
    iput-object p11, p0, Ll/eys0;->k:Ljava/lang/String;

    .line 21
    .line 22
    new-instance p1, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object p1, p0, Ll/eys0;->h:Ljava/util/List;

    .line 28
    .line 29
    new-instance p1, Ljava/util/HashMap;

    .line 30
    .line 31
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object p1, p0, Ll/eys0;->j:Ljava/util/Map;

    .line 35
    .line 36
    if-eqz p8, :cond_3

    .line 37
    .line 38
    invoke-interface {p8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    if-eqz p2, :cond_3

    .line 47
    .line 48
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    check-cast p2, Ljava/lang/String;

    .line 53
    .line 54
    const-string p3, "custom:"

    .line 55
    .line 56
    invoke-virtual {p2, p3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 57
    .line 58
    .line 59
    move-result p3

    .line 60
    if-eqz p3, :cond_2

    .line 61
    .line 62
    const-string p3, ":"

    .line 63
    .line 64
    const/4 p4, 0x3

    .line 65
    invoke-virtual {p2, p3, p4}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    array-length p3, p2

    .line 70
    if-ne p3, p4, :cond_0

    .line 71
    .line 72
    const/4 p3, 0x2

    .line 73
    aget-object p4, p2, p3

    .line 74
    .line 75
    const-string p5, "true"

    .line 76
    .line 77
    invoke-virtual {p5, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result p4

    .line 81
    const/4 p5, 0x1

    .line 82
    if-eqz p4, :cond_1

    .line 83
    .line 84
    iget-object p3, p0, Ll/eys0;->j:Ljava/util/Map;

    .line 85
    .line 86
    aget-object p2, p2, p5

    .line 87
    .line 88
    sget-object p4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 89
    .line 90
    invoke-interface {p3, p2, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_1
    aget-object p3, p2, p3

    .line 95
    .line 96
    const-string p4, "false"

    .line 97
    .line 98
    invoke-virtual {p4, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result p3

    .line 102
    if-eqz p3, :cond_0

    .line 103
    .line 104
    iget-object p3, p0, Ll/eys0;->j:Ljava/util/Map;

    .line 105
    .line 106
    aget-object p2, p2, p5

    .line 107
    .line 108
    sget-object p4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 109
    .line 110
    invoke-interface {p3, p2, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_2
    iget-object p3, p0, Ll/eys0;->h:Ljava/util/List;

    .line 115
    .line 116
    invoke-interface {p3, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_3
    return-void
.end method


# virtual methods
.method public final a()I
    .locals 0

    .line 1
    iget p0, p0, Ll/eys0;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public final b()Z
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-boolean p0, p0, Ll/eys0;->i:Z

    .line 2
    .line 3
    return p0
.end method

.method public final c()Ljava/util/Set;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/eys0;->c:Ljava/util/Set;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d()Ll/qd20;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/eys0;->g:Lcom/google/android/gms/internal/ads/zzbjb;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/android/gms/internal/ads/zzbjb;->g(Lcom/google/android/gms/internal/ads/zzbjb;)Ll/qd20;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final e()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/eys0;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method public final f()Ll/pd20;
    .locals 3

    .line 1
    new-instance v0, Ll/pd20$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/pd20$a;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/eys0;->g:Lcom/google/android/gms/internal/ads/zzbjb;

    .line 7
    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/pd20$a;->a()Ll/pd20;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_0
    iget v1, p0, Lcom/google/android/gms/internal/ads/zzbjb;->zza:I

    .line 16
    .line 17
    const/4 v2, 0x2

    .line 18
    if-eq v1, v2, :cond_3

    .line 19
    .line 20
    const/4 v2, 0x3

    .line 21
    if-eq v1, v2, :cond_2

    .line 22
    .line 23
    const/4 v2, 0x4

    .line 24
    if-eq v1, v2, :cond_1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    iget-boolean v1, p0, Lcom/google/android/gms/internal/ads/zzbjb;->zzg:Z

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ll/pd20$a;->e(Z)Ll/pd20$a;

    .line 30
    .line 31
    .line 32
    iget v1, p0, Lcom/google/android/gms/internal/ads/zzbjb;->zzh:I

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ll/pd20$a;->d(I)Ll/pd20$a;

    .line 35
    .line 36
    .line 37
    :cond_2
    iget-object v1, p0, Lcom/google/android/gms/internal/ads/zzbjb;->zzf:Lcom/google/android/gms/ads/internal/client/zzfk;

    .line 38
    .line 39
    if-eqz v1, :cond_3

    .line 40
    .line 41
    new-instance v2, Ll/kfl0;

    .line 42
    .line 43
    invoke-direct {v2, v1}, Ll/kfl0;-><init>(Lcom/google/android/gms/ads/internal/client/zzfk;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v2}, Ll/pd20$a;->h(Ll/kfl0;)Ll/pd20$a;

    .line 47
    .line 48
    .line 49
    :cond_3
    iget v1, p0, Lcom/google/android/gms/internal/ads/zzbjb;->zze:I

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Ll/pd20$a;->b(I)Ll/pd20$a;

    .line 52
    .line 53
    .line 54
    :goto_0
    iget-boolean v1, p0, Lcom/google/android/gms/internal/ads/zzbjb;->zzb:Z

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ll/pd20$a;->g(Z)Ll/pd20$a;

    .line 57
    .line 58
    .line 59
    iget v1, p0, Lcom/google/android/gms/internal/ads/zzbjb;->zzc:I

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Ll/pd20$a;->c(I)Ll/pd20$a;

    .line 62
    .line 63
    .line 64
    iget-boolean p0, p0, Lcom/google/android/gms/internal/ads/zzbjb;->zzd:Z

    .line 65
    .line 66
    invoke-virtual {v0, p0}, Ll/pd20$a;->f(Z)Ll/pd20$a;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0}, Ll/pd20$a;->a()Ll/pd20;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    return-object p0
.end method

.method public final g()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/eys0;->h:Ljava/util/List;

    .line 2
    .line 3
    const-string v0, "6"

    .line 4
    .line 5
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public final zza()Ljava/util/Map;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eys0;->j:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public final zzb()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/eys0;->h:Ljava/util/List;

    .line 2
    .line 3
    const-string v0, "3"

    .line 4
    .line 5
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method
