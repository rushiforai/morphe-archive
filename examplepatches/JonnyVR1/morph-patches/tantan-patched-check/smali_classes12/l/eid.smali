.class public final Ll/eid;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/fuc0;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/fuc0;

    .line 5
    .line 6
    sget-object v1, Ll/zlj;->o:Ll/zlj;

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/fuc0;-><init>(Ll/zlj;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/eid;->a:Ll/fuc0;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final a([BIIII)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/ChecksumException;
        }
    .end annotation

    .line 1
    add-int v0, p3, p4

    .line 2
    .line 3
    if-nez p5, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v1, 0x2

    .line 8
    :goto_0
    div-int v2, v0, v1

    .line 9
    .line 10
    new-array v2, v2, [I

    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    move v4, v3

    .line 14
    :goto_1
    if-ge v4, v0, :cond_3

    .line 15
    .line 16
    if-eqz p5, :cond_1

    .line 17
    .line 18
    rem-int/lit8 v5, v4, 0x2

    .line 19
    .line 20
    add-int/lit8 v6, p5, -0x1

    .line 21
    .line 22
    if-ne v5, v6, :cond_2

    .line 23
    .line 24
    :cond_1
    div-int v5, v4, v1

    .line 25
    .line 26
    add-int v6, v4, p2

    .line 27
    .line 28
    aget-byte v6, p1, v6

    .line 29
    .line 30
    and-int/lit16 v6, v6, 0xff

    .line 31
    .line 32
    aput v6, v2, v5

    .line 33
    .line 34
    :cond_2
    add-int/lit8 v4, v4, 0x1

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_3
    :try_start_0
    iget-object p0, p0, Ll/eid;->a:Ll/fuc0;

    .line 38
    .line 39
    div-int/2addr p4, v1

    .line 40
    invoke-virtual {p0, v2, p4}, Ll/fuc0;->a([II)V
    :try_end_0
    .catch Lcom/google/zxing/common/reedsolomon/ReedSolomonException; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    .line 42
    .line 43
    :goto_2
    if-ge v3, p3, :cond_6

    .line 44
    .line 45
    if-eqz p5, :cond_4

    .line 46
    .line 47
    rem-int/lit8 p0, v3, 0x2

    .line 48
    .line 49
    add-int/lit8 p4, p5, -0x1

    .line 50
    .line 51
    if-ne p0, p4, :cond_5

    .line 52
    .line 53
    :cond_4
    add-int p0, v3, p2

    .line 54
    .line 55
    div-int p4, v3, v1

    .line 56
    .line 57
    aget p4, v2, p4

    .line 58
    .line 59
    int-to-byte p4, p4

    .line 60
    aput-byte p4, p1, p0

    .line 61
    .line 62
    :cond_5
    add-int/lit8 v3, v3, 0x1

    .line 63
    .line 64
    goto :goto_2

    .line 65
    :cond_6
    return-void

    .line 66
    :catch_0
    invoke-static {}, Lcom/google/zxing/ChecksumException;->getChecksumInstance()Lcom/google/zxing/ChecksumException;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    throw p0
.end method

.method public b(Ll/d13;Ljava/util/Map;)Ll/mid;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/d13;",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Ll/mid;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;,
            Lcom/google/zxing/ChecksumException;
        }
    .end annotation

    .line 1
    new-instance p2, Ll/e13;

    .line 2
    .line 3
    invoke-direct {p2, p1}, Ll/e13;-><init>(Ll/d13;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p2}, Ll/e13;->a()[B

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    const/16 v4, 0xa

    .line 11
    .line 12
    const/4 v5, 0x0

    .line 13
    const/4 v2, 0x0

    .line 14
    const/16 v3, 0xa

    .line 15
    .line 16
    move-object v0, p0

    .line 17
    invoke-virtual/range {v0 .. v5}, Ll/eid;->a([BIIII)V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    aget-byte p1, v1, p0

    .line 22
    .line 23
    and-int/lit8 p1, p1, 0xf

    .line 24
    .line 25
    const/4 p2, 0x2

    .line 26
    if-eq p1, p2, :cond_1

    .line 27
    .line 28
    const/4 p2, 0x3

    .line 29
    if-eq p1, p2, :cond_1

    .line 30
    .line 31
    const/4 p2, 0x4

    .line 32
    if-eq p1, p2, :cond_1

    .line 33
    .line 34
    const/4 p2, 0x5

    .line 35
    if-ne p1, p2, :cond_0

    .line 36
    .line 37
    const/16 v4, 0x38

    .line 38
    .line 39
    const/4 v5, 0x1

    .line 40
    const/16 v2, 0x14

    .line 41
    .line 42
    const/16 v3, 0x44

    .line 43
    .line 44
    invoke-virtual/range {v0 .. v5}, Ll/eid;->a([BIIII)V

    .line 45
    .line 46
    .line 47
    const/4 v5, 0x2

    .line 48
    invoke-virtual/range {v0 .. v5}, Ll/eid;->a([BIIII)V

    .line 49
    .line 50
    .line 51
    const/16 p2, 0x4e

    .line 52
    .line 53
    new-array p2, p2, [B

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    throw p0

    .line 61
    :cond_1
    const/16 v4, 0x28

    .line 62
    .line 63
    const/4 v5, 0x1

    .line 64
    const/16 v2, 0x14

    .line 65
    .line 66
    const/16 v3, 0x54

    .line 67
    .line 68
    invoke-virtual/range {v0 .. v5}, Ll/eid;->a([BIIII)V

    .line 69
    .line 70
    .line 71
    const/4 v5, 0x2

    .line 72
    invoke-virtual/range {v0 .. v5}, Ll/eid;->a([BIIII)V

    .line 73
    .line 74
    .line 75
    const/16 p2, 0x5e

    .line 76
    .line 77
    new-array p2, p2, [B

    .line 78
    .line 79
    :goto_0
    const/16 v0, 0xa

    .line 80
    .line 81
    invoke-static {v1, p0, p2, p0, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 82
    .line 83
    .line 84
    array-length p0, p2

    .line 85
    sub-int/2addr p0, v0

    .line 86
    const/16 v2, 0x14

    .line 87
    .line 88
    invoke-static {v1, v2, p2, v0, p0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 89
    .line 90
    .line 91
    invoke-static {p2, p1}, Ll/whd;->a([BI)Ll/mid;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    return-object p0
.end method
