.class public final synthetic Ll/i2x0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/l5x0;


# static fields
.field public static final synthetic a:Ll/i2x0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/i2x0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/i2x0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/i2x0;->a:Ll/i2x0;

    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Ll/xww0;Ll/ayw0;)Ll/l7x0;
    .locals 2

    .line 1
    check-cast p1, Ll/e2x0;

    .line 2
    .line 3
    sget-object p0, Ll/k2x0;->a:Ll/wfx0;

    .line 4
    .line 5
    invoke-static {}, Lcom/google/android/gms/internal/ads/a5;->M()Ll/tdx0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {}, Lcom/google/android/gms/internal/ads/b5;->L()Ll/vdx0;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-virtual {p1}, Ll/e2x0;->b()Ll/f2x0;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Ll/f2x0;->c()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p2, p1}, Ll/vdx0;->q(Ljava/lang/String;)Ll/vdx0;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p2}, Ll/shx0;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Lcom/google/android/gms/internal/ads/b5;

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Ll/tdx0;->q(Lcom/google/android/gms/internal/ads/b5;)Ll/tdx0;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ll/shx0;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    check-cast p0, Lcom/google/android/gms/internal/ads/a5;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/h5;->c()Lcom/google/android/gms/internal/ads/zzgyl;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    sget-object p1, Lcom/google/android/gms/internal/ads/zzgus;->zze:Lcom/google/android/gms/internal/ads/zzgus;

    .line 44
    .line 45
    sget-object p2, Lcom/google/android/gms/internal/ads/zzgvz;->zzd:Lcom/google/android/gms/internal/ads/zzgvz;

    .line 46
    .line 47
    const-string v0, "type.googleapis.com/google.crypto.tink.KmsAeadKey"

    .line 48
    .line 49
    const/4 v1, 0x0

    .line 50
    invoke-static {v0, p0, p1, p2, v1}, Ll/c7x0;->a(Ljava/lang/String;Lcom/google/android/gms/internal/ads/zzgyl;Lcom/google/android/gms/internal/ads/zzgus;Lcom/google/android/gms/internal/ads/zzgvz;Ljava/lang/Integer;)Ll/c7x0;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0
.end method
