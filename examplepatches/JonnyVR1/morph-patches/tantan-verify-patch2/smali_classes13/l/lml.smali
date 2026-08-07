.class public Ll/lml;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0xa

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sput-object v0, Ll/lml;->a:Ljava/lang/String;

    .line 13
    .line 14
    return-void

    .line 15
    :array_0
    .array-data 1
        0x78t
        0x12t
        0x45t
        0x47t
        0x22t
        0xat
        0x59t
        0x3t
        0x5ft
        0x43t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-static {p0, p1, p2}, Ll/dol;->d(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)[B

    .line 2
    .line 3
    .line 4
    move-result-object p0
    :try_end_0
    .catch Ljava/io/InterruptedIOException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Lcom/momosec/mmuid/network/exception/NetworkBaseException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljavax/security/cert/CertificateException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljavax/net/ssl/SSLException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    new-instance p1, Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p1, p0}, Ljava/lang/String;-><init>([B)V

    .line 8
    .line 9
    .line 10
    return-object p1

    .line 11
    :catch_0
    move-exception p0

    .line 12
    new-instance p1, Lcom/momosec/mmuid/network/exception/NetworkBaseException;

    .line 13
    .line 14
    invoke-direct {p1, p0}, Lcom/momosec/mmuid/network/exception/NetworkBaseException;-><init>(Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    throw p1

    .line 18
    :catch_1
    move-exception p0

    .line 19
    new-instance p1, Lcom/momosec/mmuid/network/exception/HttpsCertificateException;

    .line 20
    .line 21
    invoke-direct {p1, p0}, Lcom/momosec/mmuid/network/exception/HttpsCertificateException;-><init>(Ljava/lang/Throwable;)V

    .line 22
    .line 23
    .line 24
    throw p1

    .line 25
    :catch_2
    move-exception p0

    .line 26
    new-instance p1, Lcom/momosec/mmuid/network/exception/HttpsCertificateException;

    .line 27
    .line 28
    invoke-direct {p1, p0}, Lcom/momosec/mmuid/network/exception/HttpsCertificateException;-><init>(Ljava/lang/Throwable;)V

    .line 29
    .line 30
    .line 31
    throw p1

    .line 32
    :catch_3
    move-exception p0

    .line 33
    new-instance p1, Lcom/momosec/mmuid/network/exception/HttpsCertificateException;

    .line 34
    .line 35
    invoke-direct {p1, p0}, Lcom/momosec/mmuid/network/exception/HttpsCertificateException;-><init>(Ljava/lang/Throwable;)V

    .line 36
    .line 37
    .line 38
    throw p1

    .line 39
    :catch_4
    move-exception p0

    .line 40
    throw p0

    .line 41
    :catch_5
    new-instance p0, Lcom/momosec/mmuid/network/exception/HttpTimeoutException;

    .line 42
    .line 43
    invoke-direct {p0}, Lcom/momosec/mmuid/network/exception/HttpTimeoutException;-><init>()V

    .line 44
    .line 45
    .line 46
    throw p0
.end method
