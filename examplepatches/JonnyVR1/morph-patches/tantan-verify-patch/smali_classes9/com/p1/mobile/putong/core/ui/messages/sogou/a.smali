.class public Lcom/p1/mobile/putong/core/ui/messages/sogou/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/messages/sogou/a$b;,
        Lcom/p1/mobile/putong/core/ui/messages/sogou/a$a;
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


# virtual methods
.method public a(Ljava/io/InputStream;)Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/sogou/a$b;

    .line 2
    .line 3
    invoke-static {p1}, Ll/xn80;->p(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ljava/io/InputStream;

    .line 8
    .line 9
    invoke-direct {v0, p1}, Lcom/p1/mobile/putong/core/ui/messages/sogou/a$b;-><init>(Ljava/io/InputStream;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/sogou/a;->b(Lcom/p1/mobile/putong/core/ui/messages/sogou/a$a;)Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public final b(Lcom/p1/mobile/putong/core/ui/messages/sogou/a$a;)Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/ui/messages/sogou/a$a;->a()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const v0, 0xffd8

    .line 6
    .line 7
    .line 8
    if-ne p0, v0, :cond_0

    .line 9
    .line 10
    sget-object p0, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;->JPEG:Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    shl-int/lit8 p0, p0, 0x10

    .line 14
    .line 15
    const/high16 v0, -0x10000

    .line 16
    .line 17
    and-int/2addr p0, v0

    .line 18
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/ui/messages/sogou/a$a;->a()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    const v2, 0xffff

    .line 23
    .line 24
    .line 25
    and-int/2addr v1, v2

    .line 26
    or-int/2addr p0, v1

    .line 27
    const v1, -0x76afb1b9

    .line 28
    .line 29
    .line 30
    if-ne p0, v1, :cond_2

    .line 31
    .line 32
    const-wide/16 v0, 0x15

    .line 33
    .line 34
    invoke-interface {p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/sogou/a$a;->skip(J)J

    .line 35
    .line 36
    .line 37
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/ui/messages/sogou/a$a;->b()I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    const/4 p1, 0x3

    .line 42
    if-lt p0, p1, :cond_1

    .line 43
    .line 44
    sget-object p0, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;->PNG_A:Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 45
    .line 46
    return-object p0

    .line 47
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;->PNG:Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 48
    .line 49
    return-object p0

    .line 50
    :cond_2
    shr-int/lit8 v1, p0, 0x8

    .line 51
    .line 52
    const v3, 0x474946

    .line 53
    .line 54
    .line 55
    if-ne v1, v3, :cond_3

    .line 56
    .line 57
    sget-object p0, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;->GIF:Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 58
    .line 59
    return-object p0

    .line 60
    :cond_3
    const v1, 0x52494646

    .line 61
    .line 62
    .line 63
    if-eq p0, v1, :cond_4

    .line 64
    .line 65
    sget-object p0, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;->UNKNOWN:Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 66
    .line 67
    return-object p0

    .line 68
    :cond_4
    const-wide/16 v3, 0x4

    .line 69
    .line 70
    invoke-interface {p1, v3, v4}, Lcom/p1/mobile/putong/core/ui/messages/sogou/a$a;->skip(J)J

    .line 71
    .line 72
    .line 73
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/ui/messages/sogou/a$a;->a()I

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    shl-int/lit8 p0, p0, 0x10

    .line 78
    .line 79
    and-int/2addr p0, v0

    .line 80
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/ui/messages/sogou/a$a;->a()I

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    and-int/2addr v1, v2

    .line 85
    or-int/2addr p0, v1

    .line 86
    const v1, 0x57454250

    .line 87
    .line 88
    .line 89
    if-eq p0, v1, :cond_5

    .line 90
    .line 91
    sget-object p0, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;->UNKNOWN:Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 92
    .line 93
    return-object p0

    .line 94
    :cond_5
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/ui/messages/sogou/a$a;->a()I

    .line 95
    .line 96
    .line 97
    move-result p0

    .line 98
    shl-int/lit8 p0, p0, 0x10

    .line 99
    .line 100
    and-int/2addr p0, v0

    .line 101
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/ui/messages/sogou/a$a;->a()I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    and-int/2addr v0, v2

    .line 106
    or-int/2addr p0, v0

    .line 107
    and-int/lit16 v0, p0, -0x100

    .line 108
    .line 109
    const v1, 0x56503800

    .line 110
    .line 111
    .line 112
    if-eq v0, v1, :cond_6

    .line 113
    .line 114
    sget-object p0, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;->UNKNOWN:Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 115
    .line 116
    return-object p0

    .line 117
    :cond_6
    and-int/lit16 p0, p0, 0xff

    .line 118
    .line 119
    const/16 v0, 0x58

    .line 120
    .line 121
    if-ne p0, v0, :cond_8

    .line 122
    .line 123
    invoke-interface {p1, v3, v4}, Lcom/p1/mobile/putong/core/ui/messages/sogou/a$a;->skip(J)J

    .line 124
    .line 125
    .line 126
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/ui/messages/sogou/a$a;->b()I

    .line 127
    .line 128
    .line 129
    move-result p0

    .line 130
    and-int/lit8 p0, p0, 0x10

    .line 131
    .line 132
    if-eqz p0, :cond_7

    .line 133
    .line 134
    sget-object p0, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;->WEBP_A:Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 135
    .line 136
    return-object p0

    .line 137
    :cond_7
    sget-object p0, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;->WEBP:Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 138
    .line 139
    return-object p0

    .line 140
    :cond_8
    const/16 v0, 0x4c

    .line 141
    .line 142
    if-ne p0, v0, :cond_a

    .line 143
    .line 144
    invoke-interface {p1, v3, v4}, Lcom/p1/mobile/putong/core/ui/messages/sogou/a$a;->skip(J)J

    .line 145
    .line 146
    .line 147
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/ui/messages/sogou/a$a;->b()I

    .line 148
    .line 149
    .line 150
    move-result p0

    .line 151
    and-int/lit8 p0, p0, 0x8

    .line 152
    .line 153
    if-eqz p0, :cond_9

    .line 154
    .line 155
    sget-object p0, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;->WEBP_A:Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 156
    .line 157
    return-object p0

    .line 158
    :cond_9
    sget-object p0, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;->WEBP:Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 159
    .line 160
    return-object p0

    .line 161
    :cond_a
    sget-object p0, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;->WEBP:Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 162
    .line 163
    return-object p0
.end method
