.class public Lcom/tencent/youtu/sdkkitframework/common/Base64;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;,
        Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;,
        Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;,
        Lcom/tencent/youtu/sdkkitframework/common/Base64$Encoder;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getDecoder()Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;->e:Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;

    .line 2
    .line 3
    return-object v0
.end method

.method public static getEncoder()Lcom/tencent/youtu/sdkkitframework/common/Base64$Encoder;
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/common/Base64$Encoder;->h:Lcom/tencent/youtu/sdkkitframework/common/Base64$Encoder;

    .line 2
    .line 3
    return-object v0
.end method

.method public static getMimeDecoder()Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;->g:Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;

    .line 2
    .line 3
    return-object v0
.end method

.method public static getMimeEncoder()Lcom/tencent/youtu/sdkkitframework/common/Base64$Encoder;
    .locals 1

    .line 52
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/common/Base64$Encoder;->j:Lcom/tencent/youtu/sdkkitframework/common/Base64$Encoder;

    return-object v0
.end method

.method public static getMimeEncoder(I[B)Lcom/tencent/youtu/sdkkitframework/common/Base64$Encoder;
    .locals 7

    .line 1
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;->c:[I

    .line 5
    .line 6
    array-length v1, p1

    .line 7
    const/4 v2, 0x0

    .line 8
    move v3, v2

    .line 9
    :goto_0
    if-ge v3, v1, :cond_1

    .line 10
    .line 11
    aget-byte v4, p1, v3

    .line 12
    .line 13
    and-int/lit16 v5, v4, 0xff

    .line 14
    .line 15
    aget v5, v0, v5

    .line 16
    .line 17
    const/4 v6, -0x1

    .line 18
    if-ne v5, v6, :cond_0

    .line 19
    .line 20
    add-int/lit8 v3, v3, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/16 p0, 0x10

    .line 24
    .line 25
    invoke-static {v4, p0}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string p1, "Illegal base64 line separator character 0x"

    .line 30
    .line 31
    invoke-static {p1, p0}, Ll/yg3;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    const/4 p0, 0x0

    .line 35
    return-object p0

    .line 36
    :cond_1
    if-gtz p0, :cond_2

    .line 37
    .line 38
    sget-object p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$Encoder;->h:Lcom/tencent/youtu/sdkkitframework/common/Base64$Encoder;

    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_2
    new-instance v0, Lcom/tencent/youtu/sdkkitframework/common/Base64$Encoder;

    .line 42
    .line 43
    shr-int/lit8 p0, p0, 0x2

    .line 44
    .line 45
    shl-int/lit8 p0, p0, 0x2

    .line 46
    .line 47
    const/4 v1, 0x1

    .line 48
    invoke-direct {v0, v2, p1, p0, v1}, Lcom/tencent/youtu/sdkkitframework/common/Base64$Encoder;-><init>(Z[BIZ)V

    .line 49
    .line 50
    .line 51
    return-object v0
.end method

.method public static getUrlDecoder()Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;->f:Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;

    .line 2
    .line 3
    return-object v0
.end method

.method public static getUrlEncoder()Lcom/tencent/youtu/sdkkitframework/common/Base64$Encoder;
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/common/Base64$Encoder;->i:Lcom/tencent/youtu/sdkkitframework/common/Base64$Encoder;

    .line 2
    .line 3
    return-object v0
.end method
