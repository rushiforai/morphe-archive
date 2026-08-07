.class public Ll/svv;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static a([B)Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    array-length v1, p0

    .line 4
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 5
    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    array-length v2, p0

    .line 9
    if-ge v1, v2, :cond_0

    .line 10
    .line 11
    aget-byte v2, p0, v1

    .line 12
    .line 13
    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    add-int/lit8 v1, v1, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public static b()Ljava/lang/String;
    .locals 7

    .line 1
    new-instance v0, Ljava/security/SecureRandom;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/security/SecureRandom;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v1, 0x32

    .line 7
    .line 8
    new-array v1, v1, [B

    .line 9
    .line 10
    const/16 v2, 0x18

    .line 11
    .line 12
    new-array v3, v2, [B

    .line 13
    .line 14
    new-array v4, v2, [B

    .line 15
    .line 16
    invoke-virtual {v0, v3}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v4}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    move v5, v0

    .line 24
    :goto_0
    if-ge v5, v2, :cond_0

    .line 25
    .line 26
    aget-byte v6, v3, v5

    .line 27
    .line 28
    and-int/lit8 v6, v6, 0xf

    .line 29
    .line 30
    int-to-byte v6, v6

    .line 31
    aput-byte v6, v3, v5

    .line 32
    .line 33
    aget-byte v6, v4, v5

    .line 34
    .line 35
    and-int/lit8 v6, v6, 0xf

    .line 36
    .line 37
    int-to-byte v6, v6

    .line 38
    aput-byte v6, v4, v5

    .line 39
    .line 40
    add-int/lit8 v5, v5, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    invoke-static {v3, v0, v1, v0, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 44
    .line 45
    .line 46
    const/16 v5, 0x1a

    .line 47
    .line 48
    invoke-static {v4, v0, v1, v5, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 49
    .line 50
    .line 51
    invoke-static {v3}, Ll/svv;->d([B)V

    .line 52
    .line 53
    .line 54
    invoke-static {v4}, Ll/svv;->d([B)V

    .line 55
    .line 56
    .line 57
    invoke-static {v3}, Ll/svv;->c([B)B

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    invoke-static {v4}, Ll/svv;->c([B)B

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    aput-byte v0, v1, v2

    .line 66
    .line 67
    const/16 v0, 0x19

    .line 68
    .line 69
    aput-byte v3, v1, v0

    .line 70
    .line 71
    invoke-static {v1}, Ll/svv;->a([B)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    return-object v0
.end method

.method public static c([B)B
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    move v2, v1

    .line 4
    :goto_0
    array-length v3, p0

    .line 5
    if-ge v1, v3, :cond_0

    .line 6
    .line 7
    aget-byte v3, p0, v1

    .line 8
    .line 9
    add-int/2addr v2, v3

    .line 10
    add-int/lit8 v1, v1, 0x1

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/16 p0, 0xa

    .line 14
    .line 15
    rem-int/2addr v2, p0

    .line 16
    int-to-byte v1, v2

    .line 17
    rsub-int/lit8 v1, v1, 0xa

    .line 18
    .line 19
    int-to-byte v1, v1

    .line 20
    if-ne v1, p0, :cond_1

    .line 21
    .line 22
    return v0

    .line 23
    :cond_1
    return v1
.end method

.method public static d([B)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    array-length v1, p0

    .line 3
    if-ge v0, v1, :cond_1

    .line 4
    .line 5
    aget-byte v1, p0, v0

    .line 6
    .line 7
    mul-int/lit8 v1, v1, 0x2

    .line 8
    .line 9
    int-to-byte v1, v1

    .line 10
    aput-byte v1, p0, v0

    .line 11
    .line 12
    :goto_1
    aget-byte v1, p0, v0

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    if-lt v1, v2, :cond_0

    .line 17
    .line 18
    rem-int/lit8 v3, v1, 0xa

    .line 19
    .line 20
    div-int/lit8 v1, v1, 0xa

    .line 21
    .line 22
    rem-int/2addr v1, v2

    .line 23
    add-int/2addr v3, v1

    .line 24
    int-to-byte v1, v3

    .line 25
    aput-byte v1, p0, v0

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_0
    add-int/lit8 v0, v0, 0x2

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    return-void
.end method
