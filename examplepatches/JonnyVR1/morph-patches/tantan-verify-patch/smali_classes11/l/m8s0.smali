.class public final Ll/m8s0;
.super Ll/h8s0;
.source "SourceFile"


# instance fields
.field public c:Ljava/security/MessageDigest;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/h8s0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/String;)[B
    .locals 8

    .line 1
    const-string v0, " "

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    array-length v0, p1

    .line 8
    const/4 v1, 0x4

    .line 9
    const/4 v2, 0x0

    .line 10
    const/4 v3, 0x1

    .line 11
    if-ne v0, v3, :cond_0

    .line 12
    .line 13
    aget-object p1, p1, v2

    .line 14
    .line 15
    invoke-static {p1}, Ll/l8s0;->a(Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sget-object v3, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 24
    .line 25
    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    goto :goto_2

    .line 36
    :cond_0
    const/4 v4, 0x5

    .line 37
    if-ge v0, v4, :cond_2

    .line 38
    .line 39
    add-int/2addr v0, v0

    .line 40
    new-array v0, v0, [B

    .line 41
    .line 42
    move v4, v2

    .line 43
    :goto_0
    array-length v5, p1

    .line 44
    if-ge v4, v5, :cond_1

    .line 45
    .line 46
    aget-object v5, p1, v4

    .line 47
    .line 48
    invoke-static {v5}, Ll/l8s0;->a(Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    move-result v5

    .line 52
    int-to-char v6, v5

    .line 53
    shr-int/lit8 v5, v5, 0x10

    .line 54
    .line 55
    xor-int/2addr v5, v6

    .line 56
    int-to-byte v6, v5

    .line 57
    shr-int/lit8 v5, v5, 0x8

    .line 58
    .line 59
    int-to-byte v5, v5

    .line 60
    const/4 v7, 0x2

    .line 61
    new-array v7, v7, [B

    .line 62
    .line 63
    aput-byte v6, v7, v2

    .line 64
    .line 65
    aput-byte v5, v7, v3

    .line 66
    .line 67
    aget-byte v6, v7, v2

    .line 68
    .line 69
    add-int v7, v4, v4

    .line 70
    .line 71
    aput-byte v6, v0, v7

    .line 72
    .line 73
    add-int/2addr v7, v3

    .line 74
    aput-byte v5, v0, v7

    .line 75
    .line 76
    add-int/lit8 v4, v4, 0x1

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_1
    move-object p1, v0

    .line 80
    goto :goto_2

    .line 81
    :cond_2
    new-array v0, v0, [B

    .line 82
    .line 83
    move v3, v2

    .line 84
    :goto_1
    array-length v4, p1

    .line 85
    if-ge v3, v4, :cond_1

    .line 86
    .line 87
    aget-object v4, p1, v3

    .line 88
    .line 89
    invoke-static {v4}, Ll/l8s0;->a(Ljava/lang/String;)I

    .line 90
    .line 91
    .line 92
    move-result v4

    .line 93
    and-int/lit16 v5, v4, 0xff

    .line 94
    .line 95
    shr-int/lit8 v6, v4, 0x8

    .line 96
    .line 97
    shr-int/lit8 v7, v4, 0x10

    .line 98
    .line 99
    shr-int/lit8 v4, v4, 0x18

    .line 100
    .line 101
    and-int/lit16 v6, v6, 0xff

    .line 102
    .line 103
    xor-int/2addr v5, v6

    .line 104
    and-int/lit16 v6, v7, 0xff

    .line 105
    .line 106
    xor-int/2addr v5, v6

    .line 107
    xor-int/2addr v4, v5

    .line 108
    int-to-byte v4, v4

    .line 109
    aput-byte v4, v0, v3

    .line 110
    .line 111
    add-int/lit8 v3, v3, 0x1

    .line 112
    .line 113
    goto :goto_1

    .line 114
    :goto_2
    invoke-virtual {p0}, Ll/h8s0;->a()Ljava/security/MessageDigest;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    iput-object v0, p0, Ll/m8s0;->c:Ljava/security/MessageDigest;

    .line 119
    .line 120
    iget-object v0, p0, Ll/h8s0;->a:Ljava/lang/Object;

    .line 121
    .line 122
    monitor-enter v0

    .line 123
    :try_start_0
    iget-object v3, p0, Ll/m8s0;->c:Ljava/security/MessageDigest;

    .line 124
    .line 125
    if-nez v3, :cond_3

    .line 126
    .line 127
    new-array p0, v2, [B

    .line 128
    .line 129
    monitor-exit v0

    .line 130
    return-object p0

    .line 131
    :catchall_0
    move-exception p0

    .line 132
    goto :goto_4

    .line 133
    :cond_3
    invoke-virtual {v3}, Ljava/security/MessageDigest;->reset()V

    .line 134
    .line 135
    .line 136
    iget-object v3, p0, Ll/m8s0;->c:Ljava/security/MessageDigest;

    .line 137
    .line 138
    invoke-virtual {v3, p1}, Ljava/security/MessageDigest;->update([B)V

    .line 139
    .line 140
    .line 141
    iget-object p0, p0, Ll/m8s0;->c:Ljava/security/MessageDigest;

    .line 142
    .line 143
    invoke-virtual {p0}, Ljava/security/MessageDigest;->digest()[B

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    array-length p1, p0

    .line 148
    if-le p1, v1, :cond_4

    .line 149
    .line 150
    goto :goto_3

    .line 151
    :cond_4
    move v1, p1

    .line 152
    :goto_3
    new-array p1, v1, [B

    .line 153
    .line 154
    invoke-static {p0, v2, p1, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 155
    .line 156
    .line 157
    monitor-exit v0

    .line 158
    return-object p1

    .line 159
    :goto_4
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 160
    throw p0
.end method
