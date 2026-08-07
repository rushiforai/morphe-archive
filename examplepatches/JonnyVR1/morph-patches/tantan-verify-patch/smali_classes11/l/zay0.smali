.class public final Ll/zay0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/e9y0;


# instance fields
.field public final a:Ll/ctx0;

.field public b:Ll/j4y0;

.field public final c:I


# direct methods
.method public constructor <init>(Ll/ctx0;I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/j4y0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/j4y0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/zay0;->b:Ll/j4y0;

    .line 10
    .line 11
    iput-object p1, p0, Ll/zay0;->a:Ll/ctx0;

    .line 12
    .line 13
    invoke-static {}, Ll/pcy0;->a()Ll/pcy0;

    .line 14
    .line 15
    .line 16
    iput p2, p0, Ll/zay0;->c:I

    .line 17
    .line 18
    return-void
.end method

.method public static d(Ll/ctx0;)Ll/e9y0;
    .locals 2

    .line 1
    new-instance v0, Ll/zay0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Ll/zay0;-><init>(Ll/ctx0;I)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public static e(Ll/ctx0;I)Ll/e9y0;
    .locals 1

    .line 1
    new-instance p1, Ll/zay0;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-direct {p1, p0, v0}, Ll/zay0;-><init>(Ll/ctx0;I)V

    .line 5
    .line 6
    .line 7
    return-object p1
.end method


# virtual methods
.method public final a(Lcom/google/android/gms/internal/mlkit_language_id_common/zzhy;)Ll/e9y0;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zay0;->a:Ll/ctx0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/ctx0;->d(Lcom/google/android/gms/internal/mlkit_language_id_common/zzhy;)Ll/ctx0;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public final b(IZ)[B
    .locals 2

    .line 1
    iget-object p2, p0, Ll/zay0;->b:Ll/j4y0;

    .line 2
    .line 3
    xor-int/lit8 v0, p1, 0x1

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-eq v1, v0, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move v0, v1

    .line 11
    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p2, v0}, Ll/j4y0;->f(Ljava/lang/Boolean;)Ll/j4y0;

    .line 16
    .line 17
    .line 18
    iget-object p2, p0, Ll/zay0;->b:Ll/j4y0;

    .line 19
    .line 20
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 21
    .line 22
    invoke-virtual {p2, v0}, Ll/j4y0;->e(Ljava/lang/Boolean;)Ll/j4y0;

    .line 23
    .line 24
    .line 25
    iget-object p2, p0, Ll/zay0;->a:Ll/ctx0;

    .line 26
    .line 27
    iget-object v0, p0, Ll/zay0;->b:Ll/j4y0;

    .line 28
    .line 29
    invoke-virtual {v0}, Ll/j4y0;->m()Ll/q4y0;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p2, v0}, Ll/ctx0;->f(Ll/q4y0;)Ll/ctx0;

    .line 34
    .line 35
    .line 36
    :try_start_0
    invoke-static {}, Ll/pcy0;->a()Ll/pcy0;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Ll/zay0;->a:Ll/ctx0;

    .line 40
    .line 41
    if-nez p1, :cond_1

    .line 42
    .line 43
    :try_start_1
    invoke-virtual {p0}, Ll/ctx0;->g()Ll/cux0;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    new-instance p1, Lcom/google/firebase/encoders/json/JsonDataEncoderBuilder;

    .line 48
    .line 49
    invoke-direct {p1}, Lcom/google/firebase/encoders/json/JsonDataEncoderBuilder;-><init>()V

    .line 50
    .line 51
    .line 52
    sget-object p2, Ll/m2x0;->a:Lcom/google/firebase/encoders/config/Configurator;

    .line 53
    .line 54
    invoke-virtual {p1, p2}, Lcom/google/firebase/encoders/json/JsonDataEncoderBuilder;->configureWith(Lcom/google/firebase/encoders/config/Configurator;)Lcom/google/firebase/encoders/json/JsonDataEncoderBuilder;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p1, v1}, Lcom/google/firebase/encoders/json/JsonDataEncoderBuilder;->ignoreNullValues(Z)Lcom/google/firebase/encoders/json/JsonDataEncoderBuilder;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p1}, Lcom/google/firebase/encoders/json/JsonDataEncoderBuilder;->build()Lcom/google/firebase/encoders/DataEncoder;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-interface {p1, p0}, Lcom/google/firebase/encoders/DataEncoder;->encode(Ljava/lang/Object;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    const-string p1, "utf-8"

    .line 71
    .line 72
    invoke-virtual {p0, p1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    return-object p0

    .line 77
    :cond_1
    invoke-virtual {p0}, Ll/ctx0;->g()Ll/cux0;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    new-instance p1, Ll/fwr0;

    .line 82
    .line 83
    invoke-direct {p1}, Ll/fwr0;-><init>()V

    .line 84
    .line 85
    .line 86
    sget-object p2, Ll/m2x0;->a:Lcom/google/firebase/encoders/config/Configurator;

    .line 87
    .line 88
    invoke-interface {p2, p1}, Lcom/google/firebase/encoders/config/Configurator;->configure(Lcom/google/firebase/encoders/config/EncoderConfig;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p1}, Ll/fwr0;->a()Ll/rxr0;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-virtual {p1, p0}, Ll/rxr0;->a(Ljava/lang/Object;)[B

    .line 96
    .line 97
    .line 98
    move-result-object p0
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_0

    .line 99
    return-object p0

    .line 100
    :catch_0
    move-exception p0

    .line 101
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    .line 102
    .line 103
    const-string p2, "Failed to covert logging to UTF-8 byte array"

    .line 104
    .line 105
    invoke-direct {p1, p2, p0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 106
    .line 107
    .line 108
    throw p1
.end method

.method public final c(Ll/j4y0;)Ll/e9y0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zay0;->b:Ll/j4y0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final zza()I
    .locals 0

    .line 1
    iget p0, p0, Ll/zay0;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public final zzd()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/zay0;->a:Ll/ctx0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ctx0;->g()Ll/cux0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/cux0;->d()Ll/q4y0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/q4y0;->k()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Ll/p8y0;->b(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/q4y0;->k()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Ljava/lang/String;

    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_0
    const-string p0, "NA"

    .line 35
    .line 36
    return-object p0
.end method
