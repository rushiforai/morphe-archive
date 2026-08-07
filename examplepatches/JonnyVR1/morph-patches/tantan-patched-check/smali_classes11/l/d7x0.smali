.class public final Ll/d7x0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/l7x0;


# instance fields
.field public final a:Ll/wfx0;

.field public final b:Lcom/google/android/gms/internal/ads/u4;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/ads/u4;Ll/wfx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/d7x0;->b:Lcom/google/android/gms/internal/ads/u4;

    .line 5
    .line 6
    iput-object p2, p0, Ll/d7x0;->a:Ll/wfx0;

    .line 7
    .line 8
    return-void
.end method

.method public static a(Lcom/google/android/gms/internal/ads/u4;)Ll/d7x0;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    new-instance v0, Ll/d7x0;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/u4;->R()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    sget-object v2, Ll/u7x0;->a:Ljava/nio/charset/Charset;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    new-array v2, v2, [B

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    :goto_0
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 17
    .line 18
    .line 19
    move-result v4

    .line 20
    if-ge v3, v4, :cond_1

    .line 21
    .line 22
    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    const/16 v5, 0x21

    .line 27
    .line 28
    if-lt v4, v5, :cond_0

    .line 29
    .line 30
    const/16 v5, 0x7e

    .line 31
    .line 32
    if-gt v4, v5, :cond_0

    .line 33
    .line 34
    int-to-byte v4, v4

    .line 35
    aput-byte v4, v2, v3

    .line 36
    .line 37
    add-int/lit8 v3, v3, 0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    new-instance p0, Ljava/security/GeneralSecurityException;

    .line 41
    .line 42
    new-instance v0, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    const-string v1, "Not a printable ASCII character: "

    .line 45
    .line 46
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-direct {p0, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    throw p0

    .line 60
    :cond_1
    invoke-static {v2}, Ll/wfx0;->b([B)Ll/wfx0;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-direct {v0, p0, v1}, Ll/d7x0;-><init>(Lcom/google/android/gms/internal/ads/u4;Ll/wfx0;)V

    .line 65
    .line 66
    .line 67
    return-object v0
.end method

.method public static b(Lcom/google/android/gms/internal/ads/u4;)Ll/d7x0;
    .locals 2

    .line 1
    new-instance v0, Ll/d7x0;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/u4;->R()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v1}, Ll/u7x0;->a(Ljava/lang/String;)Ll/wfx0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, p0, v1}, Ll/d7x0;-><init>(Lcom/google/android/gms/internal/ads/u4;Ll/wfx0;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method


# virtual methods
.method public final c()Lcom/google/android/gms/internal/ads/u4;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d7x0;->b:Lcom/google/android/gms/internal/ads/u4;

    .line 2
    .line 3
    return-object p0
.end method

.method public final zzd()Ll/wfx0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d7x0;->a:Ll/wfx0;

    .line 2
    .line 3
    return-object p0
.end method
