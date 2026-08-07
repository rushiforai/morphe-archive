.class public final synthetic Ll/j2x0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/h5x0;


# static fields
.field public static final synthetic a:Ll/j2x0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/j2x0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/j2x0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/j2x0;->a:Ll/j2x0;

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
.method public final a(Ll/l7x0;Ll/ayw0;)Ll/xww0;
    .locals 2

    .line 1
    const-string p0, "KmsAeadKey are only accepted with version 0, got "

    .line 2
    .line 3
    sget-object p2, Ll/k2x0;->a:Ll/wfx0;

    .line 4
    .line 5
    move-object p2, p1

    .line 6
    check-cast p2, Ll/c7x0;

    .line 7
    .line 8
    invoke-virtual {p2}, Ll/c7x0;->f()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "type.googleapis.com/google.crypto.tink.KmsAeadKey"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    invoke-virtual {p2}, Ll/c7x0;->c()Lcom/google/android/gms/internal/ads/zzgvz;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sget-object v1, Lcom/google/android/gms/internal/ads/zzgvz;->zzd:Lcom/google/android/gms/internal/ads/zzgvz;

    .line 25
    .line 26
    if-ne v0, v1, :cond_1

    .line 27
    .line 28
    :try_start_0
    check-cast p1, Ll/c7x0;

    .line 29
    .line 30
    invoke-virtual {p1}, Ll/c7x0;->d()Lcom/google/android/gms/internal/ads/zzgyl;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-static {}, Ll/jhx0;->a()Ll/jhx0;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    invoke-static {p1, p2}, Lcom/google/android/gms/internal/ads/a5;->O(Lcom/google/android/gms/internal/ads/zzgyl;Ll/jhx0;)Lcom/google/android/gms/internal/ads/a5;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p1}, Lcom/google/android/gms/internal/ads/a5;->L()I

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    if-nez p2, :cond_0

    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/google/android/gms/internal/ads/a5;->P()Lcom/google/android/gms/internal/ads/b5;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/b5;->P()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-static {p0}, Ll/f2x0;->b(Ljava/lang/String;)Ll/f2x0;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-static {p0}, Ll/e2x0;->a(Ll/f2x0;)Ll/e2x0;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    return-object p0

    .line 65
    :cond_0
    new-instance p2, Ljava/security/GeneralSecurityException;

    .line 66
    .line 67
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-direct {p2, p0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    throw p2
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzhag; {:try_start_0 .. :try_end_0} :catch_0

    .line 79
    :catch_0
    move-exception p0

    .line 80
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 81
    .line 82
    const-string p2, "Parsing KmsAeadKey failed: "

    .line 83
    .line 84
    invoke-direct {p1, p2, p0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 85
    .line 86
    .line 87
    throw p1

    .line 88
    :cond_1
    new-instance p0, Ljava/security/GeneralSecurityException;

    .line 89
    .line 90
    invoke-virtual {p2}, Ll/c7x0;->c()Lcom/google/android/gms/internal/ads/zzgvz;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    const-string p2, "KmsAeadKey are only accepted with RAW, got "

    .line 99
    .line 100
    invoke-virtual {p2, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    invoke-direct {p0, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    throw p0

    .line 108
    :cond_2
    const-string p0, "Wrong type URL in call to LegacyKmsAeadProtoSerialization.parseKey"

    .line 109
    .line 110
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    const/4 p0, 0x0

    .line 114
    return-object p0
.end method
