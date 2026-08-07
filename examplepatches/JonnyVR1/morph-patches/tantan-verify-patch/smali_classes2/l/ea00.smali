.class public Ll/ea00;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/AnyThread;
.end annotation

.annotation build Landroidx/annotation/RequiresApi;
    value = 0x13
.end annotation

.annotation build Landroidx/annotation/RestrictTo;
    value = {
        .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroidx/annotation/RestrictTo$Scope;
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ea00$a;,
        Ll/ea00$c;,
        Ll/ea00$b;
    }
.end annotation


# direct methods
.method public static a(Ll/ea00$c;)Ll/ea00$b;
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-interface {p0, v0}, Ll/ea00$c;->skip(I)V

    .line 3
    .line 4
    .line 5
    invoke-interface {p0}, Ll/ea00$c;->readUnsignedShort()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/16 v2, 0x64

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    const-string v4, "Cannot read metadata."

    .line 13
    .line 14
    if-gt v1, v2, :cond_5

    .line 15
    .line 16
    const/4 v2, 0x6

    .line 17
    invoke-interface {p0, v2}, Ll/ea00$c;->skip(I)V

    .line 18
    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    move v5, v2

    .line 22
    :goto_0
    const-wide/16 v6, -0x1

    .line 23
    .line 24
    if-ge v5, v1, :cond_1

    .line 25
    .line 26
    invoke-interface {p0}, Ll/ea00$c;->a()I

    .line 27
    .line 28
    .line 29
    move-result v8

    .line 30
    invoke-interface {p0, v0}, Ll/ea00$c;->skip(I)V

    .line 31
    .line 32
    .line 33
    invoke-interface {p0}, Ll/ea00$c;->b()J

    .line 34
    .line 35
    .line 36
    move-result-wide v9

    .line 37
    invoke-interface {p0, v0}, Ll/ea00$c;->skip(I)V

    .line 38
    .line 39
    .line 40
    const v11, 0x6d657461

    .line 41
    .line 42
    .line 43
    if-ne v11, v8, :cond_0

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_0
    add-int/lit8 v5, v5, 0x1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    move-wide v9, v6

    .line 50
    :goto_1
    cmp-long v0, v9, v6

    .line 51
    .line 52
    if-eqz v0, :cond_4

    .line 53
    .line 54
    invoke-interface {p0}, Ll/ea00$c;->getPosition()J

    .line 55
    .line 56
    .line 57
    move-result-wide v0

    .line 58
    sub-long v0, v9, v0

    .line 59
    .line 60
    long-to-int v0, v0

    .line 61
    invoke-interface {p0, v0}, Ll/ea00$c;->skip(I)V

    .line 62
    .line 63
    .line 64
    const/16 v0, 0xc

    .line 65
    .line 66
    invoke-interface {p0, v0}, Ll/ea00$c;->skip(I)V

    .line 67
    .line 68
    .line 69
    invoke-interface {p0}, Ll/ea00$c;->b()J

    .line 70
    .line 71
    .line 72
    move-result-wide v0

    .line 73
    :goto_2
    int-to-long v5, v2

    .line 74
    cmp-long v5, v5, v0

    .line 75
    .line 76
    if-gez v5, :cond_4

    .line 77
    .line 78
    invoke-interface {p0}, Ll/ea00$c;->a()I

    .line 79
    .line 80
    .line 81
    move-result v5

    .line 82
    invoke-interface {p0}, Ll/ea00$c;->b()J

    .line 83
    .line 84
    .line 85
    move-result-wide v6

    .line 86
    invoke-interface {p0}, Ll/ea00$c;->b()J

    .line 87
    .line 88
    .line 89
    move-result-wide v11

    .line 90
    const v8, 0x456d6a69

    .line 91
    .line 92
    .line 93
    if-eq v8, v5, :cond_3

    .line 94
    .line 95
    const v8, 0x656d6a69

    .line 96
    .line 97
    .line 98
    if-ne v8, v5, :cond_2

    .line 99
    .line 100
    goto :goto_3

    .line 101
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 102
    .line 103
    goto :goto_2

    .line 104
    :cond_3
    :goto_3
    new-instance p0, Ll/ea00$b;

    .line 105
    .line 106
    add-long/2addr v6, v9

    .line 107
    invoke-direct {p0, v6, v7, v11, v12}, Ll/ea00$b;-><init>(JJ)V

    .line 108
    .line 109
    .line 110
    return-object p0

    .line 111
    :cond_4
    invoke-static {v4}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    return-object v3

    .line 115
    :cond_5
    invoke-static {v4}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    return-object v3
.end method

.method public static b(Ljava/nio/ByteBuffer;)Ll/da00;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->duplicate()Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/ea00$a;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/ea00$a;-><init>(Ljava/nio/ByteBuffer;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0}, Ll/ea00;->a(Ll/ea00$c;)Ll/ea00$b;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/ea00$b;->a()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    long-to-int v0, v0

    .line 19
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 20
    .line 21
    .line 22
    invoke-static {p0}, Ll/da00;->g(Ljava/nio/ByteBuffer;)Ll/da00;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public static c(I)J
    .locals 4

    .line 1
    int-to-long v0, p0

    .line 2
    const-wide v2, 0xffffffffL

    .line 3
    .line 4
    .line 5
    .line 6
    .line 7
    and-long/2addr v0, v2

    .line 8
    return-wide v0
.end method

.method public static d(S)I
    .locals 1

    .line 1
    const v0, 0xffff

    .line 2
    .line 3
    .line 4
    and-int/2addr p0, v0

    .line 5
    return p0
.end method
