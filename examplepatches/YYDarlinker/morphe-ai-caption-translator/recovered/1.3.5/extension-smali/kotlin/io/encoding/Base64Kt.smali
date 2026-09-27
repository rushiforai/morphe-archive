.class public final Lkotlin/io/encoding/Base64Kt;
.super Ljava/lang/Object;
.source "Base64.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nBase64.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Base64.kt\nkotlin/io/encoding/Base64Kt\n+ 2 _Arrays.kt\nkotlin/collections/ArraysKt___ArraysKt\n*L\n1#1,844:1\n15176#2,3:845\n15176#2,3:848\n*S KotlinDebug\n*F\n+ 1 Base64.kt\nkotlin/io/encoding/Base64Kt\n*L\n786#1:845,3\n802#1:848,3\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0000\n\u0002\u0010\u0012\n\u0000\n\u0002\u0010\u0015\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u001a \u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\tH\u0081\u0080\u0004b\u000c\u0008\n\u0012\u0008\u0008\u000b\u0012\u0004\u0008\u0008(\u000c\"\u000f\u0010\u0000\u001a\u00020\u0001X\u0082\u0084\u0008\u00a2\u0006\u0002\n\u0000\"\u000f\u0010\u0002\u001a\u00020\u0003X\u0082\u0084\u0008\u00a2\u0006\u0002\n\u0000\"\u000f\u0010\u0004\u001a\u00020\u0001X\u0082\u0084\u0008\u00a2\u0006\u0002\n\u0000\"\u000f\u0010\u0005\u001a\u00020\u0003X\u0082\u0084\u0008\u00a2\u0006\u0002\n\u0000\u00a8\u0006\r"
    }
    d2 = {
        "base64EncodeMap",
        "",
        "base64DecodeMap",
        "",
        "base64UrlEncodeMap",
        "base64UrlDecodeMap",
        "isInMimeAlphabet",
        "",
        "symbol",
        "",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.8",
        "kotlin-stdlib"
    }
    k = 0x2
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final base64DecodeMap:[I

.field private static final base64EncodeMap:[B

.field private static final base64UrlDecodeMap:[I

.field private static final base64UrlEncodeMap:[B


# direct methods
.method static constructor <clinit>()V
    .registers 10

    const/16 v0, 0x40

    .line 780
    new-array v0, v0, [B

    fill-array-data v0, :array_58

    .line 776
    sput-object v0, Lkotlin/io/encoding/Base64Kt;->base64EncodeMap:[B

    const/16 v1, 0x100

    .line 783
    new-array v2, v1, [I

    const/4 v6, 0x6

    const/4 v7, 0x0

    const/4 v3, -0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 784
    invoke-static/range {v2 .. v7}, Lkotlin/collections/ArraysKt;->fill$default([IIIIILjava/lang/Object;)V

    const/16 v1, 0x3d

    const/4 v3, -0x2

    .line 785
    aput v3, v2, v1

    .line 846
    array-length v1, v0

    const/4 v3, 0x0

    move v4, v3

    move v5, v4

    :goto_1e
    if-ge v4, v1, :cond_2a

    aget-byte v6, v0, v4

    add-int/lit8 v7, v5, 0x1

    .line 787
    aput v5, v2, v6

    add-int/lit8 v4, v4, 0x1

    move v5, v7

    goto :goto_1e

    .line 783
    :cond_2a
    sput-object v2, Lkotlin/io/encoding/Base64Kt;->base64DecodeMap:[I

    const/16 v0, 0x40

    .line 796
    new-array v0, v0, [B

    fill-array-data v0, :array_7c

    .line 792
    sput-object v0, Lkotlin/io/encoding/Base64Kt;->base64UrlEncodeMap:[B

    const/16 v1, 0x100

    .line 799
    new-array v4, v1, [I

    const/4 v8, 0x6

    const/4 v9, 0x0

    const/4 v5, -0x1

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 800
    invoke-static/range {v4 .. v9}, Lkotlin/collections/ArraysKt;->fill$default([IIIIILjava/lang/Object;)V

    const/16 v1, 0x3d

    const/4 v2, -0x2

    .line 801
    aput v2, v4, v1

    .line 849
    array-length v1, v0

    move v2, v3

    :goto_48
    if-ge v3, v1, :cond_54

    aget-byte v5, v0, v3

    add-int/lit8 v6, v2, 0x1

    .line 803
    aput v2, v4, v5

    add-int/lit8 v3, v3, 0x1

    move v2, v6

    goto :goto_48

    .line 799
    :cond_54
    sput-object v4, Lkotlin/io/encoding/Base64Kt;->base64UrlDecodeMap:[I

    return-void

    nop

    :array_58
    .array-data 1
        0x41t
        0x42t
        0x43t
        0x44t
        0x45t
        0x46t
        0x47t
        0x48t
        0x49t
        0x4at
        0x4bt
        0x4ct
        0x4dt
        0x4et
        0x4ft
        0x50t
        0x51t
        0x52t
        0x53t
        0x54t
        0x55t
        0x56t
        0x57t
        0x58t
        0x59t
        0x5at
        0x61t
        0x62t
        0x63t
        0x64t
        0x65t
        0x66t
        0x67t
        0x68t
        0x69t
        0x6at
        0x6bt
        0x6ct
        0x6dt
        0x6et
        0x6ft
        0x70t
        0x71t
        0x72t
        0x73t
        0x74t
        0x75t
        0x76t
        0x77t
        0x78t
        0x79t
        0x7at
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x2bt
        0x2ft
    .end array-data

    :array_7c
    .array-data 1
        0x41t
        0x42t
        0x43t
        0x44t
        0x45t
        0x46t
        0x47t
        0x48t
        0x49t
        0x4at
        0x4bt
        0x4ct
        0x4dt
        0x4et
        0x4ft
        0x50t
        0x51t
        0x52t
        0x53t
        0x54t
        0x55t
        0x56t
        0x57t
        0x58t
        0x59t
        0x5at
        0x61t
        0x62t
        0x63t
        0x64t
        0x65t
        0x66t
        0x67t
        0x68t
        0x69t
        0x6at
        0x6bt
        0x6ct
        0x6dt
        0x6et
        0x6ft
        0x70t
        0x71t
        0x72t
        0x73t
        0x74t
        0x75t
        0x76t
        0x77t
        0x78t
        0x79t
        0x7at
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x2dt
        0x5ft
    .end array-data
.end method

.method public static final synthetic access$getBase64DecodeMap$p()[I
    .registers 1

    .line 1
    sget-object v0, Lkotlin/io/encoding/Base64Kt;->base64DecodeMap:[I

    return-object v0
.end method

.method public static final synthetic access$getBase64EncodeMap$p()[B
    .registers 1

    .line 1
    sget-object v0, Lkotlin/io/encoding/Base64Kt;->base64EncodeMap:[B

    return-object v0
.end method

.method public static final synthetic access$getBase64UrlDecodeMap$p()[I
    .registers 1

    .line 1
    sget-object v0, Lkotlin/io/encoding/Base64Kt;->base64UrlDecodeMap:[I

    return-object v0
.end method

.method public static final synthetic access$getBase64UrlEncodeMap$p()[B
    .registers 1

    .line 1
    sget-object v0, Lkotlin/io/encoding/Base64Kt;->base64UrlEncodeMap:[B

    return-object v0
.end method

.method public static final isInMimeAlphabet(I)Z
    .registers 3

    if-ltz p0, :cond_e

    .line 810
    sget-object v0, Lkotlin/io/encoding/Base64Kt;->base64DecodeMap:[I

    array-length v1, v0

    if-ge p0, v1, :cond_e

    aget p0, v0, p0

    const/4 v0, -0x1

    if-eq p0, v0, :cond_e

    const/4 p0, 0x1

    return p0

    :cond_e
    const/4 p0, 0x0

    return p0
.end method
