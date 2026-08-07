.class public final Ll/o5x0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/yww0;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/Class;

.field public final c:Lcom/google/android/gms/internal/ads/zzgus;

.field public final d:Ll/lkx0;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Class;Lcom/google/android/gms/internal/ads/zzgus;Ll/lkx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p4, p0, Ll/o5x0;->d:Ll/lkx0;

    .line 5
    .line 6
    iput-object p1, p0, Ll/o5x0;->a:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p2, p0, Ll/o5x0;->b:Ljava/lang/Class;

    .line 9
    .line 10
    iput-object p3, p0, Ll/o5x0;->c:Lcom/google/android/gms/internal/ads/zzgus;

    .line 11
    .line 12
    return-void
.end method

.method public static c(Ljava/lang/String;Ljava/lang/Class;Lcom/google/android/gms/internal/ads/zzgus;Ll/lkx0;)Ll/yww0;
    .locals 1

    .line 1
    new-instance v0, Ll/o5x0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Ll/o5x0;-><init>(Ljava/lang/String;Ljava/lang/Class;Lcom/google/android/gms/internal/ads/zzgus;Ll/lkx0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public final a(Lcom/google/android/gms/internal/ads/zzgyl;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/o5x0;->c:Lcom/google/android/gms/internal/ads/zzgus;

    .line 2
    .line 3
    sget-object v1, Lcom/google/android/gms/internal/ads/zzgvz;->zzd:Lcom/google/android/gms/internal/ads/zzgvz;

    .line 4
    .line 5
    iget-object v2, p0, Ll/o5x0;->a:Ljava/lang/String;

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    invoke-static {v2, p1, v0, v1, v3}, Ll/c7x0;->a(Ljava/lang/String;Lcom/google/android/gms/internal/ads/zzgyl;Lcom/google/android/gms/internal/ads/zzgus;Lcom/google/android/gms/internal/ads/zzgvz;Ljava/lang/Integer;)Ll/c7x0;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-static {}, Ll/j6x0;->d()Ll/j6x0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {}, Ll/www0;->a()Ll/ayw0;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, p1, v1}, Ll/j6x0;->a(Ll/l7x0;Ll/ayw0;)Ll/xww0;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iget-object p0, p0, Ll/o5x0;->b:Ljava/lang/Class;

    .line 25
    .line 26
    invoke-static {}, Ll/g6x0;->a()Ll/g6x0;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0, p1, p0}, Ll/g6x0;->c(Ll/xww0;Ljava/lang/Class;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method

.method public final b(Lcom/google/android/gms/internal/ads/zzgyl;)Lcom/google/android/gms/internal/ads/t4;
    .locals 2
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
    iget-object p0, p0, Ll/o5x0;->a:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Ll/edx0;->r(Ljava/lang/String;)Ll/edx0;

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ll/edx0;->s(Lcom/google/android/gms/internal/ads/zzgyl;)Ll/edx0;

    .line 11
    .line 12
    .line 13
    sget-object p0, Lcom/google/android/gms/internal/ads/zzgvz;->zzd:Lcom/google/android/gms/internal/ads/zzgvz;

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ll/edx0;->q(Lcom/google/android/gms/internal/ads/zzgvz;)Ll/edx0;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ll/shx0;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Lcom/google/android/gms/internal/ads/u4;

    .line 23
    .line 24
    invoke-static {p0}, Ll/d7x0;->a(Lcom/google/android/gms/internal/ads/u4;)Ll/d7x0;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {}, Ll/j6x0;->d()Ll/j6x0;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p1, p0}, Ll/j6x0;->c(Ll/l7x0;)Ll/lxw0;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {}, Ll/w5x0;->b()Ll/w5x0;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    const/4 v0, 0x0

    .line 41
    invoke-virtual {p1, p0, v0}, Ll/w5x0;->a(Ll/lxw0;Ljava/lang/Integer;)Ll/xww0;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-static {}, Ll/j6x0;->d()Ll/j6x0;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    const-class v0, Ll/c7x0;

    .line 50
    .line 51
    invoke-static {}, Ll/www0;->a()Ll/ayw0;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {p1, p0, v0, v1}, Ll/j6x0;->e(Ll/xww0;Ljava/lang/Class;Ll/ayw0;)Ll/l7x0;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-static {}, Lcom/google/android/gms/internal/ads/t4;->L()Ll/zcx0;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    check-cast p0, Ll/c7x0;

    .line 64
    .line 65
    invoke-virtual {p0}, Ll/c7x0;->f()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {p1, v0}, Ll/zcx0;->r(Ljava/lang/String;)Ll/zcx0;

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Ll/c7x0;->d()Lcom/google/android/gms/internal/ads/zzgyl;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {p1, v0}, Ll/zcx0;->s(Lcom/google/android/gms/internal/ads/zzgyl;)Ll/zcx0;

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0}, Ll/c7x0;->b()Lcom/google/android/gms/internal/ads/zzgus;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {p1, p0}, Ll/zcx0;->q(Lcom/google/android/gms/internal/ads/zzgus;)Ll/zcx0;

    .line 84
    .line 85
    .line 86
    invoke-virtual {p1}, Ll/shx0;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    check-cast p0, Lcom/google/android/gms/internal/ads/t4;

    .line 91
    .line 92
    return-object p0
.end method

.method public final zzb()Ljava/lang/Class;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o5x0;->b:Ljava/lang/Class;

    .line 2
    .line 3
    return-object p0
.end method
