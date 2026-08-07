.class public final Ll/c7x0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/l7x0;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ll/wfx0;

.field public final c:Lcom/google/android/gms/internal/ads/zzgyl;

.field public final d:Lcom/google/android/gms/internal/ads/zzgus;

.field public final e:Lcom/google/android/gms/internal/ads/zzgvz;

.field public final f:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/google/android/gms/internal/ads/zzgyl;Lcom/google/android/gms/internal/ads/zzgus;Lcom/google/android/gms/internal/ads/zzgvz;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/c7x0;->a:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {p1}, Ll/u7x0;->a(Ljava/lang/String;)Ll/wfx0;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Ll/c7x0;->b:Ll/wfx0;

    .line 11
    .line 12
    iput-object p2, p0, Ll/c7x0;->c:Lcom/google/android/gms/internal/ads/zzgyl;

    .line 13
    .line 14
    iput-object p3, p0, Ll/c7x0;->d:Lcom/google/android/gms/internal/ads/zzgus;

    .line 15
    .line 16
    iput-object p4, p0, Ll/c7x0;->e:Lcom/google/android/gms/internal/ads/zzgvz;

    .line 17
    .line 18
    iput-object p5, p0, Ll/c7x0;->f:Ljava/lang/Integer;

    .line 19
    .line 20
    return-void
.end method

.method public static a(Ljava/lang/String;Lcom/google/android/gms/internal/ads/zzgyl;Lcom/google/android/gms/internal/ads/zzgus;Lcom/google/android/gms/internal/ads/zzgvz;Ljava/lang/Integer;)Ll/c7x0;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/ads/zzgvz;->zzd:Lcom/google/android/gms/internal/ads/zzgvz;

    .line 2
    .line 3
    if-ne p3, v0, :cond_1

    .line 4
    .line 5
    if-nez p4, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    const-string p0, "Keys with output prefix type raw should not have an id requirement."

    .line 9
    .line 10
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    :goto_0
    const/4 p0, 0x0

    .line 14
    return-object p0

    .line 15
    :cond_1
    if-eqz p4, :cond_2

    .line 16
    .line 17
    :goto_1
    new-instance v0, Ll/c7x0;

    .line 18
    .line 19
    move-object v1, p0

    .line 20
    move-object v2, p1

    .line 21
    move-object v3, p2

    .line 22
    move-object v4, p3

    .line 23
    move-object v5, p4

    .line 24
    invoke-direct/range {v0 .. v5}, Ll/c7x0;-><init>(Ljava/lang/String;Lcom/google/android/gms/internal/ads/zzgyl;Lcom/google/android/gms/internal/ads/zzgus;Lcom/google/android/gms/internal/ads/zzgvz;Ljava/lang/Integer;)V

    .line 25
    .line 26
    .line 27
    return-object v0

    .line 28
    :cond_2
    const-string p0, "Keys with output prefix type different from raw should have an id requirement."

    .line 29
    .line 30
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    goto :goto_0
.end method


# virtual methods
.method public final b()Lcom/google/android/gms/internal/ads/zzgus;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c7x0;->d:Lcom/google/android/gms/internal/ads/zzgus;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c()Lcom/google/android/gms/internal/ads/zzgvz;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c7x0;->e:Lcom/google/android/gms/internal/ads/zzgvz;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d()Lcom/google/android/gms/internal/ads/zzgyl;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c7x0;->c:Lcom/google/android/gms/internal/ads/zzgyl;

    .line 2
    .line 3
    return-object p0
.end method

.method public final e()Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c7x0;->f:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public final f()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c7x0;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final zzd()Ll/wfx0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c7x0;->b:Ll/wfx0;

    .line 2
    .line 3
    return-object p0
.end method
