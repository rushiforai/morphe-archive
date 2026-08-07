.class final Lcom/google/android/libraries/places/internal/zzbdn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/internal/zzbce;


# static fields
.field private static final zza:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x10

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lcom/google/android/libraries/places/internal/zzbdn;->zza:[B

    return-void

    :array_0
    .array-data 1
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
        0x41t
        0x42t
        0x43t
        0x44t
        0x45t
        0x46t
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    .line 2
    const/4 p0, 0x0

    throw p0
.end method

.method public synthetic constructor <init>(Lcom/google/android/libraries/places/internal/zzbdm;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static zzc(B)Z
    .locals 1

    const/16 v0, 0x20

    if-lt p0, v0, :cond_1

    const/16 v0, 0x7e

    if-ge p0, v0, :cond_1

    const/16 v0, 0x25

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method


# virtual methods
.method public final bridge synthetic zza([B)Ljava/lang/Object;
    .locals 7

    .line 1
    const/4 p0, 0x0

    .line 2
    move v0, p0

    .line 3
    :goto_0
    array-length v1, p1

    .line 4
    if-ge v0, v1, :cond_4

    .line 5
    .line 6
    aget-byte v2, p1, v0

    .line 7
    .line 8
    const/16 v3, 0x20

    .line 9
    .line 10
    const/16 v4, 0x25

    .line 11
    .line 12
    if-lt v2, v3, :cond_1

    .line 13
    .line 14
    const/16 v3, 0x7e

    .line 15
    .line 16
    if-ge v2, v3, :cond_1

    .line 17
    .line 18
    if-ne v2, v4, :cond_0

    .line 19
    .line 20
    add-int/lit8 v2, v0, 0x2

    .line 21
    .line 22
    if-ge v2, v1, :cond_0

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    :goto_1
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    move v1, p0

    .line 33
    :goto_2
    array-length v2, p1

    .line 34
    if-ge v1, v2, :cond_3

    .line 35
    .line 36
    add-int/lit8 v3, v1, 0x1

    .line 37
    .line 38
    aget-byte v5, p1, v1

    .line 39
    .line 40
    if-ne v5, v4, :cond_2

    .line 41
    .line 42
    add-int/lit8 v5, v1, 0x2

    .line 43
    .line 44
    if-ge v5, v2, :cond_2

    .line 45
    .line 46
    :try_start_0
    new-instance v2, Ljava/lang/String;

    .line 47
    .line 48
    sget-object v5, Lcom/google/android/libraries/places/internal/zzmb;->zza:Ljava/nio/charset/Charset;

    .line 49
    .line 50
    const/4 v6, 0x2

    .line 51
    invoke-direct {v2, p1, v3, v6, v5}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 52
    .line 53
    .line 54
    const/16 v5, 0x10

    .line 55
    .line 56
    invoke-static {v2, v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    int-to-byte v2, v2

    .line 61
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    .line 63
    .line 64
    add-int/lit8 v1, v1, 0x3

    .line 65
    .line 66
    goto :goto_2

    .line 67
    :catch_0
    :cond_2
    aget-byte v1, p1, v1

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 70
    .line 71
    .line 72
    move v1, v3

    .line 73
    goto :goto_2

    .line 74
    :cond_3
    new-instance p1, Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {v0}, Ljava/nio/Buffer;->position()I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    sget-object v2, Lcom/google/android/libraries/places/internal/zzmb;->zzc:Ljava/nio/charset/Charset;

    .line 85
    .line 86
    invoke-direct {p1, v1, p0, v0, v2}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 87
    .line 88
    .line 89
    return-object p1

    .line 90
    :cond_4
    new-instance v0, Ljava/lang/String;

    .line 91
    .line 92
    invoke-direct {v0, p1, p0}, Ljava/lang/String;-><init>([BI)V

    .line 93
    .line 94
    .line 95
    return-object v0
.end method

.method public final bridge synthetic zzb(Ljava/lang/Object;)[B
    .locals 6

    .line 1
    check-cast p1, Ljava/lang/String;

    .line 2
    .line 3
    sget-object p0, Lcom/google/android/libraries/places/internal/zzmb;->zzc:Ljava/nio/charset/Charset;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 p1, 0x0

    .line 10
    move v0, p1

    .line 11
    :goto_0
    array-length v1, p0

    .line 12
    if-ge v0, v1, :cond_4

    .line 13
    .line 14
    aget-byte v2, p0, v0

    .line 15
    .line 16
    invoke-static {v2}, Lcom/google/android/libraries/places/internal/zzbdn;->zzc(B)Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-eqz v2, :cond_3

    .line 21
    .line 22
    sub-int/2addr v1, v0

    .line 23
    mul-int/lit8 v1, v1, 0x3

    .line 24
    .line 25
    add-int/2addr v1, v0

    .line 26
    new-array v1, v1, [B

    .line 27
    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    invoke-static {p0, p1, v1, p1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 31
    .line 32
    .line 33
    :cond_0
    move p1, v0

    .line 34
    :goto_1
    array-length v2, p0

    .line 35
    if-ge v0, v2, :cond_2

    .line 36
    .line 37
    add-int/lit8 v2, p1, 0x1

    .line 38
    .line 39
    aget-byte v3, p0, v0

    .line 40
    .line 41
    invoke-static {v3}, Lcom/google/android/libraries/places/internal/zzbdn;->zzc(B)Z

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    if-eqz v4, :cond_1

    .line 46
    .line 47
    const/16 v4, 0x25

    .line 48
    .line 49
    aput-byte v4, v1, p1

    .line 50
    .line 51
    shr-int/lit8 v4, v3, 0x4

    .line 52
    .line 53
    sget-object v5, Lcom/google/android/libraries/places/internal/zzbdn;->zza:[B

    .line 54
    .line 55
    and-int/lit8 v4, v4, 0xf

    .line 56
    .line 57
    aget-byte v4, v5, v4

    .line 58
    .line 59
    aput-byte v4, v1, v2

    .line 60
    .line 61
    add-int/lit8 v2, p1, 0x2

    .line 62
    .line 63
    and-int/lit8 v3, v3, 0xf

    .line 64
    .line 65
    aget-byte v3, v5, v3

    .line 66
    .line 67
    aput-byte v3, v1, v2

    .line 68
    .line 69
    add-int/lit8 p1, p1, 0x3

    .line 70
    .line 71
    goto :goto_2

    .line 72
    :cond_1
    aput-byte v3, v1, p1

    .line 73
    .line 74
    move p1, v2

    .line 75
    :goto_2
    add-int/lit8 v0, v0, 0x1

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_2
    invoke-static {v1, p1}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    return-object p0

    .line 83
    :cond_3
    add-int/lit8 v0, v0, 0x1

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_4
    return-object p0
.end method
