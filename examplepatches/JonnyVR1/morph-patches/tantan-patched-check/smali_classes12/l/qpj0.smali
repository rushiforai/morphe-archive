.class public final Ll/qpj0;
.super Ll/vpj0;
.source "SourceFile"


# instance fields
.field public final i:Ll/vpj0;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/vpj0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/pje;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/pje;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/qpj0;->i:Ll/vpj0;

    .line 10
    .line 11
    return-void
.end method

.method public static r(Ll/r5d0;)Ll/r5d0;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/r5d0;->f()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/16 v2, 0x30

    .line 11
    .line 12
    if-ne v1, v2, :cond_1

    .line 13
    .line 14
    new-instance v1, Ll/r5d0;

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0}, Ll/r5d0;->e()[Ll/s5d0;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    sget-object v3, Lcom/google/zxing/BarcodeFormat;->UPC_A:Lcom/google/zxing/BarcodeFormat;

    .line 26
    .line 27
    const/4 v4, 0x0

    .line 28
    invoke-direct {v1, v0, v4, v2, v3}, Ll/r5d0;-><init>(Ljava/lang/String;[B[Ll/s5d0;Lcom/google/zxing/BarcodeFormat;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Ll/r5d0;->d()Ljava/util/Map;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/r5d0;->d()Ljava/util/Map;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {v1, p0}, Ll/r5d0;->g(Ljava/util/Map;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-object v1

    .line 45
    :cond_1
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    throw p0
.end method


# virtual methods
.method public a(Ll/cy2;Ljava/util/Map;)Ll/r5d0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/cy2;",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Ll/r5d0;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/qpj0;->i:Ll/vpj0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/sp50;->a(Ll/cy2;Ljava/util/Map;)Ll/r5d0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/qpj0;->r(Ll/r5d0;)Ll/r5d0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public b(ILl/b13;Ljava/util/Map;)Ll/r5d0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ll/b13;",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Ll/r5d0;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/FormatException;,
            Lcom/google/zxing/ChecksumException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/qpj0;->i:Ll/vpj0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/vpj0;->b(ILl/b13;Ljava/util/Map;)Ll/r5d0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/qpj0;->r(Ll/r5d0;)Ll/r5d0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public k(Ll/b13;[ILjava/lang/StringBuilder;)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/qpj0;->i:Ll/vpj0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/vpj0;->k(Ll/b13;[ILjava/lang/StringBuilder;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public l(ILl/b13;[ILjava/util/Map;)Ll/r5d0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ll/b13;",
            "[I",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Ll/r5d0;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/FormatException;,
            Lcom/google/zxing/ChecksumException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/qpj0;->i:Ll/vpj0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/vpj0;->l(ILl/b13;[ILjava/util/Map;)Ll/r5d0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/qpj0;->r(Ll/r5d0;)Ll/r5d0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public p()Lcom/google/zxing/BarcodeFormat;
    .locals 0

    .line 1
    sget-object p0, Lcom/google/zxing/BarcodeFormat;->UPC_A:Lcom/google/zxing/BarcodeFormat;

    .line 2
    .line 3
    return-object p0
.end method
