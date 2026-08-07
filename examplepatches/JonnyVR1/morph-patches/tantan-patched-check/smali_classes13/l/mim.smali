.class public Ll/mim;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/mim$c;,
        Ll/mim$b;,
        Ll/mim$a;
    }
.end annotation


# static fields
.field public static final b:[B

.field public static final c:[I


# instance fields
.field public final a:Ll/mim$b;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-string v0, "UTF-8"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "Exif\u0000\u0000"

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, Ll/mim;->b:[B

    .line 14
    .line 15
    const/16 v0, 0xd

    .line 16
    .line 17
    new-array v0, v0, [I

    .line 18
    .line 19
    fill-array-data v0, :array_0

    .line 20
    .line 21
    .line 22
    sput-object v0, Ll/mim;->c:[I

    .line 23
    .line 24
    return-void

    .line 25
    :array_0
    .array-data 4
        0x0
        0x1
        0x1
        0x2
        0x4
        0x8
        0x1
        0x1
        0x2
        0x4
        0x8
        0x4
        0x8
    .end array-data
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/mim$c;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ll/mim$c;-><init>(Ljava/io/InputStream;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/mim;->a:Ll/mim$b;

    .line 10
    .line 11
    return-void
.end method

.method public static a(II)I
    .locals 0

    .line 1
    add-int/lit8 p0, p0, 0x2

    .line 2
    .line 3
    mul-int/lit8 p1, p1, 0xc

    .line 4
    .line 5
    add-int/2addr p0, p1

    .line 6
    return p0
.end method

.method public static c(I)Z
    .locals 2

    .line 1
    const v0, 0xffd8

    .line 2
    .line 3
    .line 4
    and-int v1, p0, v0

    .line 5
    .line 6
    if-eq v1, v0, :cond_1

    .line 7
    .line 8
    const/16 v0, 0x4d4d

    .line 9
    .line 10
    if-eq p0, v0, :cond_1

    .line 11
    .line 12
    const/16 v0, 0x4949

    .line 13
    .line 14
    if-ne p0, v0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0

    .line 19
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 20
    return p0
.end method

.method public static f(Ll/mim$a;)I
    .locals 9

    .line 1
    const/4 v0, 0x6

    .line 2
    invoke-virtual {p0, v0}, Ll/mim$a;->a(I)S

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    const/16 v2, 0x4d4d

    .line 7
    .line 8
    const/4 v3, 0x3

    .line 9
    const-string v4, "ImageHeaderParser"

    .line 10
    .line 11
    if-ne v1, v2, :cond_0

    .line 12
    .line 13
    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/16 v2, 0x4949

    .line 17
    .line 18
    if-ne v1, v2, :cond_1

    .line 19
    .line 20
    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    invoke-static {v4, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 24
    .line 25
    .line 26
    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    .line 27
    .line 28
    :goto_0
    invoke-virtual {p0, v1}, Ll/mim$a;->d(Ljava/nio/ByteOrder;)V

    .line 29
    .line 30
    .line 31
    const/16 v1, 0xa

    .line 32
    .line 33
    invoke-virtual {p0, v1}, Ll/mim$a;->b(I)I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    add-int/2addr v1, v0

    .line 38
    invoke-virtual {p0, v1}, Ll/mim$a;->a(I)S

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    const/4 v2, 0x0

    .line 43
    :goto_1
    if-ge v2, v0, :cond_b

    .line 44
    .line 45
    invoke-static {v1, v2}, Ll/mim;->a(II)I

    .line 46
    .line 47
    .line 48
    move-result v5

    .line 49
    invoke-virtual {p0, v5}, Ll/mim$a;->a(I)S

    .line 50
    .line 51
    .line 52
    move-result v6

    .line 53
    const/16 v7, 0x112

    .line 54
    .line 55
    if-eq v6, v7, :cond_2

    .line 56
    .line 57
    goto :goto_5

    .line 58
    :cond_2
    add-int/lit8 v6, v5, 0x2

    .line 59
    .line 60
    invoke-virtual {p0, v6}, Ll/mim$a;->a(I)S

    .line 61
    .line 62
    .line 63
    move-result v6

    .line 64
    const/4 v7, 0x1

    .line 65
    if-lt v6, v7, :cond_a

    .line 66
    .line 67
    const/16 v7, 0xc

    .line 68
    .line 69
    if-le v6, v7, :cond_3

    .line 70
    .line 71
    goto :goto_4

    .line 72
    :cond_3
    add-int/lit8 v7, v5, 0x4

    .line 73
    .line 74
    invoke-virtual {p0, v7}, Ll/mim$a;->b(I)I

    .line 75
    .line 76
    .line 77
    move-result v7

    .line 78
    if-gez v7, :cond_4

    .line 79
    .line 80
    invoke-static {v4, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 81
    .line 82
    .line 83
    goto :goto_5

    .line 84
    :cond_4
    invoke-static {v4, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 85
    .line 86
    .line 87
    sget-object v8, Ll/mim;->c:[I

    .line 88
    .line 89
    aget v6, v8, v6

    .line 90
    .line 91
    add-int/2addr v7, v6

    .line 92
    const/4 v6, 0x4

    .line 93
    if-le v7, v6, :cond_5

    .line 94
    .line 95
    invoke-static {v4, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 96
    .line 97
    .line 98
    goto :goto_5

    .line 99
    :cond_5
    add-int/lit8 v5, v5, 0x8

    .line 100
    .line 101
    if-ltz v5, :cond_9

    .line 102
    .line 103
    invoke-virtual {p0}, Ll/mim$a;->c()I

    .line 104
    .line 105
    .line 106
    move-result v6

    .line 107
    if-le v5, v6, :cond_6

    .line 108
    .line 109
    goto :goto_3

    .line 110
    :cond_6
    if-ltz v7, :cond_8

    .line 111
    .line 112
    add-int/2addr v7, v5

    .line 113
    invoke-virtual {p0}, Ll/mim$a;->c()I

    .line 114
    .line 115
    .line 116
    move-result v6

    .line 117
    if-le v7, v6, :cond_7

    .line 118
    .line 119
    goto :goto_2

    .line 120
    :cond_7
    invoke-virtual {p0, v5}, Ll/mim$a;->a(I)S

    .line 121
    .line 122
    .line 123
    move-result p0

    .line 124
    return p0

    .line 125
    :cond_8
    :goto_2
    invoke-static {v4, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 126
    .line 127
    .line 128
    goto :goto_5

    .line 129
    :cond_9
    :goto_3
    invoke-static {v4, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 130
    .line 131
    .line 132
    goto :goto_5

    .line 133
    :cond_a
    :goto_4
    invoke-static {v4, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 134
    .line 135
    .line 136
    :goto_5
    add-int/lit8 v2, v2, 0x1

    .line 137
    .line 138
    goto :goto_1

    .line 139
    :cond_b
    const/4 p0, -0x1

    .line 140
    return p0
.end method


# virtual methods
.method public b()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/mim;->a:Ll/mim$b;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/mim$b;->a()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {v0}, Ll/mim;->c(I)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x3

    .line 12
    const-string v2, "ImageHeaderParser"

    .line 13
    .line 14
    const/4 v3, -0x1

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-static {v2, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 18
    .line 19
    .line 20
    return v3

    .line 21
    :cond_0
    invoke-virtual {p0}, Ll/mim;->e()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-ne v0, v3, :cond_1

    .line 26
    .line 27
    invoke-static {v2, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 28
    .line 29
    .line 30
    return v3

    .line 31
    :cond_1
    new-array v1, v0, [B

    .line 32
    .line 33
    invoke-virtual {p0, v1, v0}, Ll/mim;->g([BI)I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    return p0
.end method

.method public final d([BI)Z
    .locals 3

    .line 1
    const/4 p0, 0x0

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    sget-object v0, Ll/mim;->b:[B

    .line 5
    .line 6
    array-length v0, v0

    .line 7
    if-le p2, v0, :cond_0

    .line 8
    .line 9
    const/4 p2, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move p2, p0

    .line 12
    :goto_0
    if-eqz p2, :cond_2

    .line 13
    .line 14
    move v0, p0

    .line 15
    :goto_1
    sget-object v1, Ll/mim;->b:[B

    .line 16
    .line 17
    array-length v2, v1

    .line 18
    if-ge v0, v2, :cond_2

    .line 19
    .line 20
    aget-byte v2, p1, v0

    .line 21
    .line 22
    aget-byte v1, v1, v0

    .line 23
    .line 24
    if-eq v2, v1, :cond_1

    .line 25
    .line 26
    return p0

    .line 27
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_2
    return p2
.end method

.method public final e()I
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    :cond_0
    iget-object v0, p0, Ll/mim;->a:Ll/mim$b;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/mim$b;->b()S

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/16 v1, 0xff

    .line 8
    .line 9
    const/4 v2, 0x3

    .line 10
    const-string v3, "ImageHeaderParser"

    .line 11
    .line 12
    const/4 v4, -0x1

    .line 13
    if-eq v0, v1, :cond_1

    .line 14
    .line 15
    invoke-static {v3, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 16
    .line 17
    .line 18
    return v4

    .line 19
    :cond_1
    iget-object v0, p0, Ll/mim;->a:Ll/mim$b;

    .line 20
    .line 21
    invoke-interface {v0}, Ll/mim$b;->b()S

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/16 v1, 0xda

    .line 26
    .line 27
    if-ne v0, v1, :cond_2

    .line 28
    .line 29
    return v4

    .line 30
    :cond_2
    const/16 v1, 0xd9

    .line 31
    .line 32
    if-ne v0, v1, :cond_3

    .line 33
    .line 34
    invoke-static {v3, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 35
    .line 36
    .line 37
    return v4

    .line 38
    :cond_3
    iget-object v1, p0, Ll/mim;->a:Ll/mim$b;

    .line 39
    .line 40
    invoke-interface {v1}, Ll/mim$b;->a()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    add-int/lit8 v1, v1, -0x2

    .line 45
    .line 46
    const/16 v5, 0xe1

    .line 47
    .line 48
    if-eq v0, v5, :cond_4

    .line 49
    .line 50
    iget-object v0, p0, Ll/mim;->a:Ll/mim$b;

    .line 51
    .line 52
    int-to-long v5, v1

    .line 53
    invoke-interface {v0, v5, v6}, Ll/mim$b;->skip(J)J

    .line 54
    .line 55
    .line 56
    move-result-wide v0

    .line 57
    cmp-long v0, v0, v5

    .line 58
    .line 59
    if-eqz v0, :cond_0

    .line 60
    .line 61
    invoke-static {v3, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 62
    .line 63
    .line 64
    return v4

    .line 65
    :cond_4
    return v1
.end method

.method public final g([BI)I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/mim;->a:Ll/mim$b;

    .line 2
    .line 3
    invoke-interface {v0, p1, p2}, Ll/mim$b;->read([BI)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, -0x1

    .line 8
    const/4 v2, 0x3

    .line 9
    const-string v3, "ImageHeaderParser"

    .line 10
    .line 11
    if-eq v0, p2, :cond_0

    .line 12
    .line 13
    invoke-static {v3, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 14
    .line 15
    .line 16
    return v1

    .line 17
    :cond_0
    invoke-virtual {p0, p1, p2}, Ll/mim;->d([BI)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    new-instance p0, Ll/mim$a;

    .line 24
    .line 25
    invoke-direct {p0, p1, p2}, Ll/mim$a;-><init>([BI)V

    .line 26
    .line 27
    .line 28
    invoke-static {p0}, Ll/mim;->f(Ll/mim$a;)I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    return p0

    .line 33
    :cond_1
    invoke-static {v3, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 34
    .line 35
    .line 36
    return v1
.end method
