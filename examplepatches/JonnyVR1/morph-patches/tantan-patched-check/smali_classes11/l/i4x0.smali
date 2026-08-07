.class public final Ll/i4x0;
.super Ll/f4x0;
.source "SourceFile"


# direct methods
.method public constructor <init>([BI)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ll/f4x0;-><init>([BI)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a()I
    .locals 0

    .line 1
    const/16 p0, 0x18

    .line 2
    .line 3
    return p0
.end method

.method public final b([II)[I
    .locals 10

    .line 1
    array-length v0, p1

    .line 2
    const/4 v1, 0x6

    .line 3
    if-ne v0, v1, :cond_0

    .line 4
    .line 5
    const/16 v0, 0x10

    .line 6
    .line 7
    new-array v2, v0, [I

    .line 8
    .line 9
    iget-object p0, p0, Ll/f4x0;->a:[I

    .line 10
    .line 11
    new-array v0, v0, [I

    .line 12
    .line 13
    invoke-static {v0, p0}, Ll/b4x0;->b([I[I)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    aget v3, p1, p0

    .line 18
    .line 19
    const/16 v4, 0xc

    .line 20
    .line 21
    aput v3, v0, v4

    .line 22
    .line 23
    const/4 v3, 0x1

    .line 24
    aget v3, p1, v3

    .line 25
    .line 26
    const/16 v5, 0xd

    .line 27
    .line 28
    aput v3, v0, v5

    .line 29
    .line 30
    const/4 v3, 0x2

    .line 31
    aget v3, p1, v3

    .line 32
    .line 33
    const/16 v6, 0xe

    .line 34
    .line 35
    aput v3, v0, v6

    .line 36
    .line 37
    const/4 v3, 0x3

    .line 38
    aget v3, p1, v3

    .line 39
    .line 40
    const/16 v7, 0xf

    .line 41
    .line 42
    aput v3, v0, v7

    .line 43
    .line 44
    invoke-static {v0}, Ll/b4x0;->c([I)V

    .line 45
    .line 46
    .line 47
    aget v3, v0, v4

    .line 48
    .line 49
    const/4 v8, 0x4

    .line 50
    aput v3, v0, v8

    .line 51
    .line 52
    aget v3, v0, v5

    .line 53
    .line 54
    const/4 v9, 0x5

    .line 55
    aput v3, v0, v9

    .line 56
    .line 57
    aget v3, v0, v6

    .line 58
    .line 59
    aput v3, v0, v1

    .line 60
    .line 61
    aget v1, v0, v7

    .line 62
    .line 63
    const/4 v3, 0x7

    .line 64
    aput v1, v0, v3

    .line 65
    .line 66
    const/16 v1, 0x8

    .line 67
    .line 68
    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([II)[I

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-static {v2, v0}, Ll/b4x0;->b([I[I)V

    .line 73
    .line 74
    .line 75
    aput p2, v2, v4

    .line 76
    .line 77
    aput p0, v2, v5

    .line 78
    .line 79
    aget p0, p1, v8

    .line 80
    .line 81
    aput p0, v2, v6

    .line 82
    .line 83
    aget p0, p1, v9

    .line 84
    .line 85
    aput p0, v2, v7

    .line 86
    .line 87
    return-object v2

    .line 88
    :cond_0
    mul-int/lit8 v0, v0, 0x20

    .line 89
    .line 90
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    const-string p1, "XChaCha20 uses 192-bit nonces, but got a %d-bit nonce"

    .line 99
    .line 100
    invoke-static {p1, p0}, Ll/gzi0;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    const/4 p0, 0x0

    .line 104
    return-object p0
.end method
