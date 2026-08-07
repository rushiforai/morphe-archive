.class public final synthetic Ll/g2x0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/p6x0;


# static fields
.field public static final synthetic a:Ll/g2x0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/g2x0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/g2x0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/g2x0;->a:Ll/g2x0;

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
.method public final a(Ll/lxw0;)Ll/l7x0;
    .locals 1

    .line 1
    check-cast p1, Ll/f2x0;

    .line 2
    .line 3
    sget-object p0, Ll/k2x0;->a:Ll/wfx0;

    .line 4
    .line 5
    invoke-static {}, Lcom/google/android/gms/internal/ads/u4;->L()Ll/edx0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "type.googleapis.com/google.crypto.tink.KmsAeadKey"

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/edx0;->r(Ljava/lang/String;)Ll/edx0;

    .line 12
    .line 13
    .line 14
    invoke-static {}, Lcom/google/android/gms/internal/ads/b5;->L()Ll/vdx0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p1}, Ll/f2x0;->c()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {v0, p1}, Ll/vdx0;->q(Ljava/lang/String;)Ll/vdx0;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ll/shx0;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    check-cast p1, Lcom/google/android/gms/internal/ads/b5;

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/google/android/gms/internal/ads/h5;->c()Lcom/google/android/gms/internal/ads/zzgyl;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p0, p1}, Ll/edx0;->s(Lcom/google/android/gms/internal/ads/zzgyl;)Ll/edx0;

    .line 36
    .line 37
    .line 38
    sget-object p1, Lcom/google/android/gms/internal/ads/zzgvz;->zzd:Lcom/google/android/gms/internal/ads/zzgvz;

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Ll/edx0;->q(Lcom/google/android/gms/internal/ads/zzgvz;)Ll/edx0;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Ll/shx0;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    check-cast p0, Lcom/google/android/gms/internal/ads/u4;

    .line 48
    .line 49
    invoke-static {p0}, Ll/d7x0;->b(Lcom/google/android/gms/internal/ads/u4;)Ll/d7x0;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    return-object p0
.end method
