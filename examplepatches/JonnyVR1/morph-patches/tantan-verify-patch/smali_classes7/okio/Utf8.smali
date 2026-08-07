.class public final Lokio/Utf8;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x2
    }
    d1 = {
        "\u0000D\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0010\u0005\n\u0000\n\u0002\u0010\u000c\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0010\u0012\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0002\u0008\u0002\u001a\u0011\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\u0001H\u0080\u0008\u001a\u0011\u0010\u000e\u001a\u00020\u000c2\u0006\u0010\u000f\u001a\u00020\u0007H\u0080\u0008\u001a1\u0010\u0010\u001a\u00020\u0001*\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u00012\u0006\u0010\u0013\u001a\u00020\u00012\u0012\u0010\u0014\u001a\u000e\u0012\u0004\u0012\u00020\u0001\u0012\u0004\u0012\u00020\u00160\u0015H\u0080\u0008\u001a1\u0010\u0017\u001a\u00020\u0001*\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u00012\u0006\u0010\u0013\u001a\u00020\u00012\u0012\u0010\u0014\u001a\u000e\u0012\u0004\u0012\u00020\u0001\u0012\u0004\u0012\u00020\u00160\u0015H\u0080\u0008\u001a1\u0010\u0018\u001a\u00020\u0001*\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u00012\u0006\u0010\u0013\u001a\u00020\u00012\u0012\u0010\u0014\u001a\u000e\u0012\u0004\u0012\u00020\u0001\u0012\u0004\u0012\u00020\u00160\u0015H\u0080\u0008\u001a1\u0010\u0019\u001a\u00020\u0016*\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u00012\u0006\u0010\u0013\u001a\u00020\u00012\u0012\u0010\u0014\u001a\u000e\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\u00160\u0015H\u0080\u0008\u001a1\u0010\u001a\u001a\u00020\u0016*\u00020\u001b2\u0006\u0010\u0012\u001a\u00020\u00012\u0006\u0010\u0013\u001a\u00020\u00012\u0012\u0010\u0014\u001a\u000e\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\u00160\u0015H\u0080\u0008\u001a1\u0010\u001c\u001a\u00020\u0016*\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u00012\u0006\u0010\u0013\u001a\u00020\u00012\u0012\u0010\u0014\u001a\u000e\u0012\u0004\u0012\u00020\u0001\u0012\u0004\u0012\u00020\u00160\u0015H\u0080\u0008\u001a%\u0010\u001d\u001a\u00020\u001e*\u00020\u001b2\u0008\u0008\u0002\u0010\u0012\u001a\u00020\u00012\u0008\u0008\u0002\u0010\u0013\u001a\u00020\u0001H\u0007\u00a2\u0006\u0002\u0008\u001f\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0080T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u0002\u001a\u00020\u0001X\u0080T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u0003\u001a\u00020\u0001X\u0080T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u0004\u001a\u00020\u0001X\u0080T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u0005\u001a\u00020\u0001X\u0080T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u0006\u001a\u00020\u0007X\u0080T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u0008\u001a\u00020\tX\u0080T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\n\u001a\u00020\u0001X\u0080T\u00a2\u0006\u0002\n\u0000\u00a8\u0006 "
    }
    d2 = {
        "HIGH_SURROGATE_HEADER",
        "",
        "LOG_SURROGATE_HEADER",
        "MASK_2BYTES",
        "MASK_3BYTES",
        "MASK_4BYTES",
        "REPLACEMENT_BYTE",
        "",
        "REPLACEMENT_CHARACTER",
        "",
        "REPLACEMENT_CODE_POINT",
        "isIsoControl",
        "",
        "codePoint",
        "isUtf8Continuation",
        "byte",
        "process2Utf8Bytes",
        "",
        "beginIndex",
        "endIndex",
        "yield",
        "Lkotlin/Function1;",
        "",
        "process3Utf8Bytes",
        "process4Utf8Bytes",
        "processUtf16Chars",
        "processUtf8Bytes",
        "",
        "processUtf8CodePoints",
        "utf8Size",
        "",
        "size",
        "jvm"
    }
    k = 0x2
    mv = {
        0x1,
        0x1,
        0xb
    }
.end annotation

.annotation build Lkotlin/jvm/JvmName;
.end annotation


# static fields
.field public static final HIGH_SURROGATE_HEADER:I = 0xd7c0

.field public static final LOG_SURROGATE_HEADER:I = 0xdc00

.field public static final MASK_2BYTES:I = 0xf80

.field public static final MASK_3BYTES:I = -0x1e080

.field public static final MASK_4BYTES:I = 0x381f80

.field public static final REPLACEMENT_BYTE:B = 0x3ft

.field public static final REPLACEMENT_CHARACTER:C = '\ufffd'

.field public static final REPLACEMENT_CODE_POINT:I = 0xfffd


# direct methods
.method public static final isIsoControl(I)Z
    .locals 1

    if-ltz p0, :cond_0

    const/16 v0, 0x1f

    if-ge v0, p0, :cond_2

    :cond_0
    const/16 v0, 0x7f

    if-le v0, p0, :cond_1

    goto :goto_0

    :cond_1
    const/16 v0, 0x9f

    if-lt v0, p0, :cond_3

    :cond_2
    const/4 p0, 0x1

    return p0

    :cond_3
    :goto_0
    const/4 p0, 0x0

    return p0
.end method

.method public static final isUtf8Continuation(B)Z
    .locals 1

    and-int/lit16 p0, p0, 0xc0

    const/16 v0, 0x80

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static final process2Utf8Bytes([BIILkotlin/jvm/functions/Function1;)I
    .locals 3
    .param p0    # [B
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lkotlin/jvm/functions/Function1;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([BII",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Integer;",
            "Lkotlin/Unit;",
            ">;)I"
        }
    .end annotation

    .line 1
    const v0, 0xfffd

    .line 2
    .line 3
    .line 4
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    add-int/lit8 v1, p1, 0x1

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    if-gt p2, v1, :cond_0

    .line 18
    .line 19
    invoke-interface {p3, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    return v2

    .line 23
    :cond_0
    aget-byte p1, p0, p1

    .line 24
    .line 25
    aget-byte p0, p0, v1

    .line 26
    .line 27
    and-int/lit16 p2, p0, 0xc0

    .line 28
    .line 29
    const/16 v1, 0x80

    .line 30
    .line 31
    if-ne p2, v1, :cond_2

    .line 32
    .line 33
    xor-int/lit16 p0, p0, 0xf80

    .line 34
    .line 35
    shl-int/lit8 p1, p1, 0x6

    .line 36
    .line 37
    xor-int/2addr p0, p1

    .line 38
    if-ge p0, v1, :cond_1

    .line 39
    .line 40
    invoke-interface {p3, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-interface {p3, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    :goto_0
    const/4 p0, 0x2

    .line 52
    return p0

    .line 53
    :cond_2
    invoke-interface {p3, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    return v2
.end method

.method public static final process3Utf8Bytes([BIILkotlin/jvm/functions/Function1;)I
    .locals 6
    .param p0    # [B
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lkotlin/jvm/functions/Function1;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([BII",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Integer;",
            "Lkotlin/Unit;",
            ">;)I"
        }
    .end annotation

    .line 1
    const v0, 0xfffd

    .line 2
    .line 3
    .line 4
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    add-int/lit8 v1, p1, 0x2

    .line 15
    .line 16
    const/16 v2, 0x80

    .line 17
    .line 18
    const/4 v3, 0x1

    .line 19
    const/4 v4, 0x2

    .line 20
    if-gt p2, v1, :cond_1

    .line 21
    .line 22
    invoke-interface {p3, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    add-int/2addr p1, v3

    .line 26
    if-le p2, p1, :cond_0

    .line 27
    .line 28
    aget-byte p0, p0, p1

    .line 29
    .line 30
    and-int/lit16 p0, p0, 0xc0

    .line 31
    .line 32
    if-ne p0, v2, :cond_0

    .line 33
    .line 34
    return v4

    .line 35
    :cond_0
    return v3

    .line 36
    :cond_1
    aget-byte p2, p0, p1

    .line 37
    .line 38
    add-int/2addr p1, v3

    .line 39
    aget-byte p1, p0, p1

    .line 40
    .line 41
    and-int/lit16 v5, p1, 0xc0

    .line 42
    .line 43
    if-ne v5, v2, :cond_6

    .line 44
    .line 45
    aget-byte p0, p0, v1

    .line 46
    .line 47
    and-int/lit16 v1, p0, 0xc0

    .line 48
    .line 49
    if-ne v1, v2, :cond_5

    .line 50
    .line 51
    const v1, -0x1e080

    .line 52
    .line 53
    .line 54
    xor-int/2addr p0, v1

    .line 55
    shl-int/lit8 p1, p1, 0x6

    .line 56
    .line 57
    xor-int/2addr p0, p1

    .line 58
    shl-int/lit8 p1, p2, 0xc

    .line 59
    .line 60
    xor-int/2addr p0, p1

    .line 61
    const/16 p1, 0x800

    .line 62
    .line 63
    if-ge p0, p1, :cond_2

    .line 64
    .line 65
    invoke-interface {p3, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_2
    const p1, 0xd800

    .line 70
    .line 71
    .line 72
    if-le p1, p0, :cond_3

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_3
    const p1, 0xdfff

    .line 76
    .line 77
    .line 78
    if-lt p1, p0, :cond_4

    .line 79
    .line 80
    invoke-interface {p3, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_4
    :goto_0
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-interface {p3, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    :goto_1
    const/4 p0, 0x3

    .line 92
    return p0

    .line 93
    :cond_5
    invoke-interface {p3, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    return v4

    .line 97
    :cond_6
    invoke-interface {p3, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    return v3
.end method

.method public static final process4Utf8Bytes([BIILkotlin/jvm/functions/Function1;)I
    .locals 8
    .param p0    # [B
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lkotlin/jvm/functions/Function1;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([BII",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Integer;",
            "Lkotlin/Unit;",
            ">;)I"
        }
    .end annotation

    .line 1
    const v0, 0xfffd

    .line 2
    .line 3
    .line 4
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    add-int/lit8 v1, p1, 0x3

    .line 15
    .line 16
    const/4 v2, 0x2

    .line 17
    const/4 v3, 0x1

    .line 18
    const/16 v4, 0x80

    .line 19
    .line 20
    const/4 v5, 0x3

    .line 21
    if-gt p2, v1, :cond_2

    .line 22
    .line 23
    invoke-interface {p3, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    add-int/lit8 p3, p1, 0x1

    .line 27
    .line 28
    if-le p2, p3, :cond_1

    .line 29
    .line 30
    aget-byte p3, p0, p3

    .line 31
    .line 32
    and-int/lit16 p3, p3, 0xc0

    .line 33
    .line 34
    if-ne p3, v4, :cond_1

    .line 35
    .line 36
    add-int/2addr p1, v2

    .line 37
    if-le p2, p1, :cond_0

    .line 38
    .line 39
    aget-byte p0, p0, p1

    .line 40
    .line 41
    and-int/lit16 p0, p0, 0xc0

    .line 42
    .line 43
    if-ne p0, v4, :cond_0

    .line 44
    .line 45
    return v5

    .line 46
    :cond_0
    return v2

    .line 47
    :cond_1
    return v3

    .line 48
    :cond_2
    aget-byte p2, p0, p1

    .line 49
    .line 50
    add-int/lit8 v6, p1, 0x1

    .line 51
    .line 52
    aget-byte v6, p0, v6

    .line 53
    .line 54
    and-int/lit16 v7, v6, 0xc0

    .line 55
    .line 56
    if-ne v7, v4, :cond_9

    .line 57
    .line 58
    add-int/2addr p1, v2

    .line 59
    aget-byte p1, p0, p1

    .line 60
    .line 61
    and-int/lit16 v3, p1, 0xc0

    .line 62
    .line 63
    if-ne v3, v4, :cond_8

    .line 64
    .line 65
    aget-byte p0, p0, v1

    .line 66
    .line 67
    and-int/lit16 v1, p0, 0xc0

    .line 68
    .line 69
    if-ne v1, v4, :cond_7

    .line 70
    .line 71
    const v1, 0x381f80

    .line 72
    .line 73
    .line 74
    xor-int/2addr p0, v1

    .line 75
    shl-int/lit8 p1, p1, 0x6

    .line 76
    .line 77
    xor-int/2addr p0, p1

    .line 78
    shl-int/lit8 p1, v6, 0xc

    .line 79
    .line 80
    xor-int/2addr p0, p1

    .line 81
    shl-int/lit8 p1, p2, 0x12

    .line 82
    .line 83
    xor-int/2addr p0, p1

    .line 84
    const p1, 0x10ffff

    .line 85
    .line 86
    .line 87
    if-le p0, p1, :cond_3

    .line 88
    .line 89
    invoke-interface {p3, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_3
    const p1, 0xd800

    .line 94
    .line 95
    .line 96
    if-le p1, p0, :cond_4

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_4
    const p1, 0xdfff

    .line 100
    .line 101
    .line 102
    if-lt p1, p0, :cond_5

    .line 103
    .line 104
    invoke-interface {p3, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    goto :goto_1

    .line 108
    :cond_5
    :goto_0
    const/high16 p1, 0x10000

    .line 109
    .line 110
    if-ge p0, p1, :cond_6

    .line 111
    .line 112
    invoke-interface {p3, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    goto :goto_1

    .line 116
    :cond_6
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-interface {p3, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    :goto_1
    const/4 p0, 0x4

    .line 124
    return p0

    .line 125
    :cond_7
    invoke-interface {p3, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    return v5

    .line 129
    :cond_8
    invoke-interface {p3, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    return v2

    .line 133
    :cond_9
    invoke-interface {p3, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    return v3
.end method

.method public static final processUtf16Chars([BIILkotlin/jvm/functions/Function1;)V
    .locals 12
    .param p0    # [B
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lkotlin/jvm/functions/Function1;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([BII",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Character;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 1
    const v0, 0xfffd

    .line 2
    .line 3
    .line 4
    invoke-static {v0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    :cond_0
    :goto_0
    if-ge p1, p2, :cond_19

    .line 15
    .line 16
    aget-byte v2, p0, p1

    .line 17
    .line 18
    if-ltz v2, :cond_1

    .line 19
    .line 20
    int-to-char v2, v2

    .line 21
    invoke-static {v2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-interface {p3, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    add-int/lit8 p1, p1, 0x1

    .line 29
    .line 30
    :goto_1
    if-ge p1, p2, :cond_0

    .line 31
    .line 32
    aget-byte v2, p0, p1

    .line 33
    .line 34
    if-ltz v2, :cond_0

    .line 35
    .line 36
    add-int/lit8 p1, p1, 0x1

    .line 37
    .line 38
    int-to-char v2, v2

    .line 39
    invoke-static {v2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-interface {p3, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_1
    shr-int/lit8 v3, v2, 0x5

    .line 48
    .line 49
    const/4 v4, -0x2

    .line 50
    const/4 v5, 0x2

    .line 51
    const/16 v6, 0x80

    .line 52
    .line 53
    const/4 v7, 0x1

    .line 54
    if-ne v3, v4, :cond_7

    .line 55
    .line 56
    add-int/lit8 v3, p1, 0x1

    .line 57
    .line 58
    if-gt p2, v3, :cond_4

    .line 59
    .line 60
    :cond_2
    invoke-interface {p3, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    :cond_3
    :goto_2
    move v5, v7

    .line 64
    goto :goto_3

    .line 65
    :cond_4
    aget-byte v3, p0, v3

    .line 66
    .line 67
    and-int/lit16 v4, v3, 0xc0

    .line 68
    .line 69
    if-ne v4, v6, :cond_2

    .line 70
    .line 71
    xor-int/lit16 v3, v3, 0xf80

    .line 72
    .line 73
    shl-int/lit8 v2, v2, 0x6

    .line 74
    .line 75
    xor-int/2addr v2, v3

    .line 76
    if-ge v2, v6, :cond_5

    .line 77
    .line 78
    invoke-interface {p3, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    goto :goto_3

    .line 82
    :cond_5
    int-to-char v2, v2

    .line 83
    invoke-static {v2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    invoke-interface {p3, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    :cond_6
    :goto_3
    add-int/2addr p1, v5

    .line 91
    goto :goto_0

    .line 92
    :cond_7
    shr-int/lit8 v3, v2, 0x4

    .line 93
    .line 94
    const v8, 0xd800

    .line 95
    .line 96
    .line 97
    const v9, 0xdfff

    .line 98
    .line 99
    .line 100
    const/4 v10, 0x3

    .line 101
    if-ne v3, v4, :cond_e

    .line 102
    .line 103
    add-int/lit8 v3, p1, 0x2

    .line 104
    .line 105
    if-gt p2, v3, :cond_8

    .line 106
    .line 107
    invoke-interface {p3, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    add-int/lit8 v2, p1, 0x1

    .line 111
    .line 112
    if-le p2, v2, :cond_3

    .line 113
    .line 114
    aget-byte v2, p0, v2

    .line 115
    .line 116
    and-int/lit16 v2, v2, 0xc0

    .line 117
    .line 118
    if-ne v2, v6, :cond_3

    .line 119
    .line 120
    goto :goto_3

    .line 121
    :cond_8
    add-int/lit8 v4, p1, 0x1

    .line 122
    .line 123
    aget-byte v4, p0, v4

    .line 124
    .line 125
    and-int/lit16 v11, v4, 0xc0

    .line 126
    .line 127
    if-ne v11, v6, :cond_d

    .line 128
    .line 129
    aget-byte v3, p0, v3

    .line 130
    .line 131
    and-int/lit16 v7, v3, 0xc0

    .line 132
    .line 133
    if-ne v7, v6, :cond_c

    .line 134
    .line 135
    const v5, -0x1e080

    .line 136
    .line 137
    .line 138
    xor-int/2addr v3, v5

    .line 139
    shl-int/lit8 v4, v4, 0x6

    .line 140
    .line 141
    xor-int/2addr v3, v4

    .line 142
    shl-int/lit8 v2, v2, 0xc

    .line 143
    .line 144
    xor-int/2addr v2, v3

    .line 145
    const/16 v3, 0x800

    .line 146
    .line 147
    if-ge v2, v3, :cond_9

    .line 148
    .line 149
    :goto_4
    invoke-interface {p3, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    goto :goto_6

    .line 153
    :cond_9
    if-le v8, v2, :cond_a

    .line 154
    .line 155
    goto :goto_5

    .line 156
    :cond_a
    if-lt v9, v2, :cond_b

    .line 157
    .line 158
    goto :goto_4

    .line 159
    :cond_b
    :goto_5
    int-to-char v2, v2

    .line 160
    invoke-static {v2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    .line 161
    .line 162
    .line 163
    move-result-object v2

    .line 164
    invoke-interface {p3, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    :goto_6
    move v5, v10

    .line 168
    goto :goto_3

    .line 169
    :cond_c
    invoke-interface {p3, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 170
    .line 171
    .line 172
    goto :goto_3

    .line 173
    :cond_d
    invoke-interface {p3, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    goto :goto_2

    .line 177
    :cond_e
    shr-int/lit8 v3, v2, 0x3

    .line 178
    .line 179
    if-ne v3, v4, :cond_18

    .line 180
    .line 181
    add-int/lit8 v3, p1, 0x3

    .line 182
    .line 183
    if-gt p2, v3, :cond_f

    .line 184
    .line 185
    invoke-interface {p3, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    .line 187
    .line 188
    add-int/lit8 v2, p1, 0x1

    .line 189
    .line 190
    if-le p2, v2, :cond_3

    .line 191
    .line 192
    aget-byte v2, p0, v2

    .line 193
    .line 194
    and-int/lit16 v2, v2, 0xc0

    .line 195
    .line 196
    if-ne v2, v6, :cond_3

    .line 197
    .line 198
    add-int/lit8 v2, p1, 0x2

    .line 199
    .line 200
    if-le p2, v2, :cond_6

    .line 201
    .line 202
    aget-byte v2, p0, v2

    .line 203
    .line 204
    and-int/lit16 v2, v2, 0xc0

    .line 205
    .line 206
    if-ne v2, v6, :cond_6

    .line 207
    .line 208
    :goto_7
    goto :goto_6

    .line 209
    :cond_f
    add-int/lit8 v4, p1, 0x1

    .line 210
    .line 211
    aget-byte v4, p0, v4

    .line 212
    .line 213
    and-int/lit16 v11, v4, 0xc0

    .line 214
    .line 215
    if-ne v11, v6, :cond_17

    .line 216
    .line 217
    add-int/lit8 v7, p1, 0x2

    .line 218
    .line 219
    aget-byte v7, p0, v7

    .line 220
    .line 221
    and-int/lit16 v11, v7, 0xc0

    .line 222
    .line 223
    if-ne v11, v6, :cond_16

    .line 224
    .line 225
    aget-byte v3, p0, v3

    .line 226
    .line 227
    and-int/lit16 v5, v3, 0xc0

    .line 228
    .line 229
    if-ne v5, v6, :cond_15

    .line 230
    .line 231
    const v5, 0x381f80

    .line 232
    .line 233
    .line 234
    xor-int/2addr v3, v5

    .line 235
    shl-int/lit8 v5, v7, 0x6

    .line 236
    .line 237
    xor-int/2addr v3, v5

    .line 238
    shl-int/lit8 v4, v4, 0xc

    .line 239
    .line 240
    xor-int/2addr v3, v4

    .line 241
    shl-int/lit8 v2, v2, 0x12

    .line 242
    .line 243
    xor-int/2addr v2, v3

    .line 244
    const v3, 0x10ffff

    .line 245
    .line 246
    .line 247
    if-le v2, v3, :cond_11

    .line 248
    .line 249
    :cond_10
    :goto_8
    invoke-interface {p3, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 250
    .line 251
    .line 252
    goto :goto_a

    .line 253
    :cond_11
    if-le v8, v2, :cond_12

    .line 254
    .line 255
    goto :goto_9

    .line 256
    :cond_12
    if-lt v9, v2, :cond_13

    .line 257
    .line 258
    goto :goto_8

    .line 259
    :cond_13
    :goto_9
    const/high16 v3, 0x10000

    .line 260
    .line 261
    if-ge v2, v3, :cond_14

    .line 262
    .line 263
    goto :goto_8

    .line 264
    :cond_14
    if-eq v2, v0, :cond_10

    .line 265
    .line 266
    ushr-int/lit8 v3, v2, 0xa

    .line 267
    .line 268
    const v4, 0xd7c0

    .line 269
    .line 270
    .line 271
    add-int/2addr v3, v4

    .line 272
    int-to-char v3, v3

    .line 273
    invoke-static {v3}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    .line 274
    .line 275
    .line 276
    move-result-object v3

    .line 277
    invoke-interface {p3, v3}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 278
    .line 279
    .line 280
    and-int/lit16 v2, v2, 0x3ff

    .line 281
    .line 282
    const v3, 0xdc00

    .line 283
    .line 284
    .line 285
    add-int/2addr v2, v3

    .line 286
    int-to-char v2, v2

    .line 287
    invoke-static {v2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    .line 288
    .line 289
    .line 290
    move-result-object v2

    .line 291
    invoke-interface {p3, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 292
    .line 293
    .line 294
    :goto_a
    const/4 v5, 0x4

    .line 295
    goto/16 :goto_3

    .line 296
    .line 297
    :cond_15
    invoke-interface {p3, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 298
    .line 299
    .line 300
    goto :goto_7

    .line 301
    :cond_16
    invoke-interface {p3, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 302
    .line 303
    .line 304
    goto/16 :goto_3

    .line 305
    .line 306
    :cond_17
    invoke-interface {p3, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 307
    .line 308
    .line 309
    goto/16 :goto_2

    .line 310
    .line 311
    :cond_18
    invoke-interface {p3, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 312
    .line 313
    .line 314
    add-int/lit8 p1, p1, 0x1

    .line 315
    .line 316
    goto/16 :goto_0

    .line 317
    .line 318
    :cond_19
    return-void
.end method

.method public static final processUtf8Bytes(Ljava/lang/String;IILkotlin/jvm/functions/Function1;)V
    .locals 7
    .param p0    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lkotlin/jvm/functions/Function1;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "II",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Byte;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    :cond_0
    :goto_0
    if-ge p1, p2, :cond_7

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/16 v1, 0x80

    .line 14
    .line 15
    if-ge v0, v1, :cond_1

    .line 16
    .line 17
    int-to-byte v0, v0

    .line 18
    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-interface {p3, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    add-int/lit8 p1, p1, 0x1

    .line 26
    .line 27
    :goto_1
    if-ge p1, p2, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-ge v0, v1, :cond_0

    .line 34
    .line 35
    add-int/lit8 v0, p1, 0x1

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    int-to-byte p1, p1

    .line 42
    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-interface {p3, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move p1, v0

    .line 50
    goto :goto_1

    .line 51
    :cond_1
    const/16 v2, 0x800

    .line 52
    .line 53
    if-ge v0, v2, :cond_2

    .line 54
    .line 55
    shr-int/lit8 v2, v0, 0x6

    .line 56
    .line 57
    or-int/lit16 v2, v2, 0xc0

    .line 58
    .line 59
    int-to-byte v2, v2

    .line 60
    invoke-static {v2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-interface {p3, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    and-int/lit8 v0, v0, 0x3f

    .line 68
    .line 69
    or-int/2addr v0, v1

    .line 70
    int-to-byte v0, v0

    .line 71
    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-interface {p3, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    :goto_2
    add-int/lit8 p1, p1, 0x1

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_2
    const v2, 0xd800

    .line 82
    .line 83
    .line 84
    const/16 v3, 0x3f

    .line 85
    .line 86
    if-gt v2, v0, :cond_6

    .line 87
    .line 88
    const v2, 0xdfff

    .line 89
    .line 90
    .line 91
    if-ge v2, v0, :cond_3

    .line 92
    .line 93
    goto :goto_4

    .line 94
    :cond_3
    const v4, 0xdbff

    .line 95
    .line 96
    .line 97
    if-gt v0, v4, :cond_5

    .line 98
    .line 99
    add-int/lit8 v4, p1, 0x1

    .line 100
    .line 101
    if-le p2, v4, :cond_5

    .line 102
    .line 103
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    .line 104
    .line 105
    .line 106
    move-result v5

    .line 107
    const v6, 0xdc00

    .line 108
    .line 109
    .line 110
    if-gt v6, v5, :cond_5

    .line 111
    .line 112
    if-ge v2, v5, :cond_4

    .line 113
    .line 114
    goto :goto_3

    .line 115
    :cond_4
    shl-int/lit8 v0, v0, 0xa

    .line 116
    .line 117
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    .line 118
    .line 119
    .line 120
    move-result v2

    .line 121
    add-int/2addr v0, v2

    .line 122
    const v2, -0x35fdc00

    .line 123
    .line 124
    .line 125
    add-int/2addr v0, v2

    .line 126
    shr-int/lit8 v2, v0, 0x12

    .line 127
    .line 128
    or-int/lit16 v2, v2, 0xf0

    .line 129
    .line 130
    int-to-byte v2, v2

    .line 131
    invoke-static {v2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    invoke-interface {p3, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    shr-int/lit8 v2, v0, 0xc

    .line 139
    .line 140
    and-int/2addr v2, v3

    .line 141
    or-int/2addr v2, v1

    .line 142
    int-to-byte v2, v2

    .line 143
    invoke-static {v2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    invoke-interface {p3, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    shr-int/lit8 v2, v0, 0x6

    .line 151
    .line 152
    and-int/2addr v2, v3

    .line 153
    or-int/2addr v2, v1

    .line 154
    int-to-byte v2, v2

    .line 155
    invoke-static {v2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 156
    .line 157
    .line 158
    move-result-object v2

    .line 159
    invoke-interface {p3, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    and-int/2addr v0, v3

    .line 163
    or-int/2addr v0, v1

    .line 164
    int-to-byte v0, v0

    .line 165
    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    invoke-interface {p3, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 170
    .line 171
    .line 172
    add-int/lit8 p1, p1, 0x2

    .line 173
    .line 174
    goto/16 :goto_0

    .line 175
    .line 176
    :cond_5
    :goto_3
    invoke-static {v3}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    invoke-interface {p3, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    goto :goto_2

    .line 184
    :cond_6
    :goto_4
    shr-int/lit8 v2, v0, 0xc

    .line 185
    .line 186
    or-int/lit16 v2, v2, 0xe0

    .line 187
    .line 188
    int-to-byte v2, v2

    .line 189
    invoke-static {v2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 190
    .line 191
    .line 192
    move-result-object v2

    .line 193
    invoke-interface {p3, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    .line 195
    .line 196
    shr-int/lit8 v2, v0, 0x6

    .line 197
    .line 198
    and-int/2addr v2, v3

    .line 199
    or-int/2addr v2, v1

    .line 200
    int-to-byte v2, v2

    .line 201
    invoke-static {v2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 202
    .line 203
    .line 204
    move-result-object v2

    .line 205
    invoke-interface {p3, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 206
    .line 207
    .line 208
    and-int/lit8 v0, v0, 0x3f

    .line 209
    .line 210
    or-int/2addr v0, v1

    .line 211
    int-to-byte v0, v0

    .line 212
    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    invoke-interface {p3, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 217
    .line 218
    .line 219
    goto/16 :goto_2

    .line 220
    .line 221
    :cond_7
    return-void
.end method

.method public static final processUtf8CodePoints([BIILkotlin/jvm/functions/Function1;)V
    .locals 11
    .param p0    # [B
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lkotlin/jvm/functions/Function1;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([BII",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Integer;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 1
    const v0, 0xfffd

    .line 2
    .line 3
    .line 4
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    :cond_0
    :goto_0
    if-ge p1, p2, :cond_18

    .line 15
    .line 16
    aget-byte v1, p0, p1

    .line 17
    .line 18
    if-ltz v1, :cond_1

    .line 19
    .line 20
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-interface {p3, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    add-int/lit8 p1, p1, 0x1

    .line 28
    .line 29
    :goto_1
    if-ge p1, p2, :cond_0

    .line 30
    .line 31
    aget-byte v1, p0, p1

    .line 32
    .line 33
    if-ltz v1, :cond_0

    .line 34
    .line 35
    add-int/lit8 p1, p1, 0x1

    .line 36
    .line 37
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-interface {p3, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_1
    shr-int/lit8 v2, v1, 0x5

    .line 46
    .line 47
    const/4 v3, -0x2

    .line 48
    const/4 v4, 0x2

    .line 49
    const/16 v5, 0x80

    .line 50
    .line 51
    const/4 v6, 0x1

    .line 52
    if-ne v2, v3, :cond_7

    .line 53
    .line 54
    add-int/lit8 v2, p1, 0x1

    .line 55
    .line 56
    if-gt p2, v2, :cond_4

    .line 57
    .line 58
    :cond_2
    invoke-interface {p3, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    :cond_3
    :goto_2
    move v4, v6

    .line 62
    goto :goto_3

    .line 63
    :cond_4
    aget-byte v2, p0, v2

    .line 64
    .line 65
    and-int/lit16 v3, v2, 0xc0

    .line 66
    .line 67
    if-ne v3, v5, :cond_2

    .line 68
    .line 69
    xor-int/lit16 v2, v2, 0xf80

    .line 70
    .line 71
    shl-int/lit8 v1, v1, 0x6

    .line 72
    .line 73
    xor-int/2addr v1, v2

    .line 74
    if-ge v1, v5, :cond_5

    .line 75
    .line 76
    invoke-interface {p3, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    goto :goto_3

    .line 80
    :cond_5
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-interface {p3, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    :cond_6
    :goto_3
    add-int/2addr p1, v4

    .line 88
    goto :goto_0

    .line 89
    :cond_7
    shr-int/lit8 v2, v1, 0x4

    .line 90
    .line 91
    const v7, 0xd800

    .line 92
    .line 93
    .line 94
    const v8, 0xdfff

    .line 95
    .line 96
    .line 97
    const/4 v9, 0x3

    .line 98
    if-ne v2, v3, :cond_e

    .line 99
    .line 100
    add-int/lit8 v2, p1, 0x2

    .line 101
    .line 102
    if-gt p2, v2, :cond_8

    .line 103
    .line 104
    invoke-interface {p3, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    add-int/lit8 v1, p1, 0x1

    .line 108
    .line 109
    if-le p2, v1, :cond_3

    .line 110
    .line 111
    aget-byte v1, p0, v1

    .line 112
    .line 113
    and-int/lit16 v1, v1, 0xc0

    .line 114
    .line 115
    if-ne v1, v5, :cond_3

    .line 116
    .line 117
    goto :goto_3

    .line 118
    :cond_8
    add-int/lit8 v3, p1, 0x1

    .line 119
    .line 120
    aget-byte v3, p0, v3

    .line 121
    .line 122
    and-int/lit16 v10, v3, 0xc0

    .line 123
    .line 124
    if-ne v10, v5, :cond_d

    .line 125
    .line 126
    aget-byte v2, p0, v2

    .line 127
    .line 128
    and-int/lit16 v6, v2, 0xc0

    .line 129
    .line 130
    if-ne v6, v5, :cond_c

    .line 131
    .line 132
    const v4, -0x1e080

    .line 133
    .line 134
    .line 135
    xor-int/2addr v2, v4

    .line 136
    shl-int/lit8 v3, v3, 0x6

    .line 137
    .line 138
    xor-int/2addr v2, v3

    .line 139
    shl-int/lit8 v1, v1, 0xc

    .line 140
    .line 141
    xor-int/2addr v1, v2

    .line 142
    const/16 v2, 0x800

    .line 143
    .line 144
    if-ge v1, v2, :cond_9

    .line 145
    .line 146
    :goto_4
    invoke-interface {p3, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    goto :goto_6

    .line 150
    :cond_9
    if-le v7, v1, :cond_a

    .line 151
    .line 152
    goto :goto_5

    .line 153
    :cond_a
    if-lt v8, v1, :cond_b

    .line 154
    .line 155
    goto :goto_4

    .line 156
    :cond_b
    :goto_5
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    invoke-interface {p3, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    :goto_6
    move v4, v9

    .line 164
    goto :goto_3

    .line 165
    :cond_c
    invoke-interface {p3, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    goto :goto_3

    .line 169
    :cond_d
    invoke-interface {p3, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 170
    .line 171
    .line 172
    goto :goto_2

    .line 173
    :cond_e
    shr-int/lit8 v2, v1, 0x3

    .line 174
    .line 175
    if-ne v2, v3, :cond_17

    .line 176
    .line 177
    add-int/lit8 v2, p1, 0x3

    .line 178
    .line 179
    if-gt p2, v2, :cond_f

    .line 180
    .line 181
    invoke-interface {p3, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    .line 183
    .line 184
    add-int/lit8 v1, p1, 0x1

    .line 185
    .line 186
    if-le p2, v1, :cond_3

    .line 187
    .line 188
    aget-byte v1, p0, v1

    .line 189
    .line 190
    and-int/lit16 v1, v1, 0xc0

    .line 191
    .line 192
    if-ne v1, v5, :cond_3

    .line 193
    .line 194
    add-int/lit8 v1, p1, 0x2

    .line 195
    .line 196
    if-le p2, v1, :cond_6

    .line 197
    .line 198
    aget-byte v1, p0, v1

    .line 199
    .line 200
    and-int/lit16 v1, v1, 0xc0

    .line 201
    .line 202
    if-ne v1, v5, :cond_6

    .line 203
    .line 204
    :goto_7
    goto :goto_6

    .line 205
    :cond_f
    add-int/lit8 v3, p1, 0x1

    .line 206
    .line 207
    aget-byte v3, p0, v3

    .line 208
    .line 209
    and-int/lit16 v10, v3, 0xc0

    .line 210
    .line 211
    if-ne v10, v5, :cond_16

    .line 212
    .line 213
    add-int/lit8 v6, p1, 0x2

    .line 214
    .line 215
    aget-byte v6, p0, v6

    .line 216
    .line 217
    and-int/lit16 v10, v6, 0xc0

    .line 218
    .line 219
    if-ne v10, v5, :cond_15

    .line 220
    .line 221
    aget-byte v2, p0, v2

    .line 222
    .line 223
    and-int/lit16 v4, v2, 0xc0

    .line 224
    .line 225
    if-ne v4, v5, :cond_14

    .line 226
    .line 227
    const v4, 0x381f80

    .line 228
    .line 229
    .line 230
    xor-int/2addr v2, v4

    .line 231
    shl-int/lit8 v4, v6, 0x6

    .line 232
    .line 233
    xor-int/2addr v2, v4

    .line 234
    shl-int/lit8 v3, v3, 0xc

    .line 235
    .line 236
    xor-int/2addr v2, v3

    .line 237
    shl-int/lit8 v1, v1, 0x12

    .line 238
    .line 239
    xor-int/2addr v1, v2

    .line 240
    const v2, 0x10ffff

    .line 241
    .line 242
    .line 243
    if-le v1, v2, :cond_10

    .line 244
    .line 245
    :goto_8
    invoke-interface {p3, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 246
    .line 247
    .line 248
    goto :goto_a

    .line 249
    :cond_10
    if-le v7, v1, :cond_11

    .line 250
    .line 251
    goto :goto_9

    .line 252
    :cond_11
    if-lt v8, v1, :cond_12

    .line 253
    .line 254
    goto :goto_8

    .line 255
    :cond_12
    :goto_9
    const/high16 v2, 0x10000

    .line 256
    .line 257
    if-ge v1, v2, :cond_13

    .line 258
    .line 259
    goto :goto_8

    .line 260
    :cond_13
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 261
    .line 262
    .line 263
    move-result-object v1

    .line 264
    invoke-interface {p3, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 265
    .line 266
    .line 267
    :goto_a
    const/4 v4, 0x4

    .line 268
    goto/16 :goto_3

    .line 269
    .line 270
    :cond_14
    invoke-interface {p3, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 271
    .line 272
    .line 273
    goto :goto_7

    .line 274
    :cond_15
    invoke-interface {p3, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 275
    .line 276
    .line 277
    goto/16 :goto_3

    .line 278
    .line 279
    :cond_16
    invoke-interface {p3, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 280
    .line 281
    .line 282
    goto/16 :goto_2

    .line 283
    .line 284
    :cond_17
    invoke-interface {p3, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 285
    .line 286
    .line 287
    add-int/lit8 p1, p1, 0x1

    .line 288
    .line 289
    goto/16 :goto_0

    .line 290
    .line 291
    :cond_18
    return-void
.end method

.method public static final size(Ljava/lang/String;)J
    .locals 3
    .param p0    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmName;
    .end annotation

    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 114
    const/4 v0, 0x3

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {p0, v2, v2, v0, v1}, Lokio/Utf8;->size$default(Ljava/lang/String;IIILjava/lang/Object;)J

    move-result-wide v0

    return-wide v0
.end method

.method public static final size(Ljava/lang/String;I)J
    .locals 3
    .param p0    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmName;
    .end annotation

    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 113
    const/4 v0, 0x2

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {p0, p1, v2, v0, v1}, Lokio/Utf8;->size$default(Ljava/lang/String;IIILjava/lang/Object;)J

    move-result-wide p0

    return-wide p0
.end method

.method public static final size(Ljava/lang/String;II)J
    .locals 9
    .param p0    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmName;
    .end annotation

    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    if-ltz p1, :cond_a

    .line 7
    .line 8
    if-lt p2, p1, :cond_9

    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-gt p2, v2, :cond_8

    .line 15
    .line 16
    :goto_0
    if-ge p1, p2, :cond_7

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    const/16 v3, 0x80

    .line 23
    .line 24
    const-wide/16 v4, 0x1

    .line 25
    .line 26
    if-ge v2, v3, :cond_0

    .line 27
    .line 28
    add-long/2addr v0, v4

    .line 29
    :goto_1
    add-int/lit8 p1, p1, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const/16 v3, 0x800

    .line 33
    .line 34
    if-ge v2, v3, :cond_1

    .line 35
    .line 36
    const-wide/16 v2, 0x2

    .line 37
    .line 38
    :goto_2
    add-long/2addr v0, v2

    .line 39
    goto :goto_1

    .line 40
    :cond_1
    const v3, 0xd800

    .line 41
    .line 42
    .line 43
    if-lt v2, v3, :cond_6

    .line 44
    .line 45
    const v3, 0xdfff

    .line 46
    .line 47
    .line 48
    if-le v2, v3, :cond_2

    .line 49
    .line 50
    goto :goto_5

    .line 51
    :cond_2
    add-int/lit8 v6, p1, 0x1

    .line 52
    .line 53
    if-ge v6, p2, :cond_3

    .line 54
    .line 55
    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    .line 56
    .line 57
    .line 58
    move-result v7

    .line 59
    goto :goto_3

    .line 60
    :cond_3
    const/4 v7, 0x0

    .line 61
    :goto_3
    const v8, 0xdbff

    .line 62
    .line 63
    .line 64
    if-gt v2, v8, :cond_5

    .line 65
    .line 66
    const v2, 0xdc00

    .line 67
    .line 68
    .line 69
    if-lt v7, v2, :cond_5

    .line 70
    .line 71
    if-le v7, v3, :cond_4

    .line 72
    .line 73
    goto :goto_4

    .line 74
    :cond_4
    const-wide/16 v2, 0x4

    .line 75
    .line 76
    add-long/2addr v0, v2

    .line 77
    add-int/lit8 p1, p1, 0x2

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_5
    :goto_4
    add-long/2addr v0, v4

    .line 81
    move p1, v6

    .line 82
    goto :goto_0

    .line 83
    :cond_6
    :goto_5
    const-wide/16 v2, 0x3

    .line 84
    .line 85
    goto :goto_2

    .line 86
    :cond_7
    return-wide v0

    .line 87
    :cond_8
    const-string p1, " > "

    .line 88
    .line 89
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    const-string v2, "endIndex > string.length: "

    .line 94
    .line 95
    invoke-static {v2, p2, p1, p0}, Ll/nlk0;->a(Ljava/lang/String;ILjava/lang/Object;I)V

    .line 96
    .line 97
    .line 98
    return-wide v0

    .line 99
    :cond_9
    const-string p0, "endIndex < beginIndex: "

    .line 100
    .line 101
    const-string v2, " < "

    .line 102
    .line 103
    invoke-static {p0, p2, v2, p1}, Ll/nlk0;->a(Ljava/lang/String;ILjava/lang/Object;I)V

    .line 104
    .line 105
    .line 106
    return-wide v0

    .line 107
    :cond_a
    const-string p0, "beginIndex < 0: "

    .line 108
    .line 109
    invoke-static {p0, p1}, Ll/plk0;->a(Ljava/lang/String;I)V

    .line 110
    .line 111
    .line 112
    return-wide v0
.end method

.method public static bridge synthetic size$default(Ljava/lang/String;IIILjava/lang/Object;)J
    .locals 0
    .annotation build Lkotlin/jvm/JvmName;
    .end annotation

    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 1
    and-int/lit8 p4, p3, 0x1

    .line 2
    .line 3
    if-eqz p4, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    :cond_0
    and-int/lit8 p3, p3, 0x2

    .line 7
    .line 8
    if-eqz p3, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    :cond_1
    invoke-static {p0, p1, p2}, Lokio/Utf8;->size(Ljava/lang/String;II)J

    .line 15
    .line 16
    .line 17
    move-result-wide p0

    .line 18
    return-wide p0
.end method
