.class public final Ll/slj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/b13;

.field public final b:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;

.field public final c:Ljava/lang/StringBuilder;


# direct methods
.method public constructor <init>(Ll/b13;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/slj;->b:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;

    .line 10
    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/slj;->c:Ljava/lang/StringBuilder;

    .line 17
    .line 18
    iput-object p1, p0, Ll/slj;->a:Ll/b13;

    .line 19
    .line 20
    return-void
.end method

.method public static g(Ll/b13;II)I
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    if-ge v0, p2, :cond_1

    .line 4
    .line 5
    add-int v2, p1, v0

    .line 6
    .line 7
    invoke-virtual {p0, v2}, Ll/b13;->f(I)Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    sub-int v2, p2, v0

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    sub-int/2addr v2, v3

    .line 17
    shl-int v2, v3, v2

    .line 18
    .line 19
    or-int/2addr v1, v2

    .line 20
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    return v1
.end method


# virtual methods
.method public a(Ljava/lang/StringBuilder;I)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    move-object v1, v0

    .line 3
    :goto_0
    invoke-virtual {p0, p2, v1}, Ll/slj;->c(ILjava/lang/String;)Ll/zhd;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ll/zhd;->b()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-static {v2}, Ll/fii;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-virtual {v1}, Ll/zhd;->d()Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_1

    .line 25
    .line 26
    invoke-virtual {v1}, Ll/zhd;->c()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    goto :goto_1

    .line 35
    :cond_1
    move-object v2, v0

    .line 36
    :goto_1
    invoke-virtual {v1}, Ll/bid;->a()I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    if-eq p2, v3, :cond_2

    .line 41
    .line 42
    invoke-virtual {v1}, Ll/bid;->a()I

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    move-object v1, v2

    .line 47
    goto :goto_0

    .line 48
    :cond_2
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0
.end method

.method public final b(I)Ll/xhd;
    .locals 3

    .line 1
    const/4 v0, 0x5

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/slj;->f(II)I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    const/16 v2, 0xf

    .line 7
    .line 8
    if-ne v1, v2, :cond_0

    .line 9
    .line 10
    new-instance p0, Ll/xhd;

    .line 11
    .line 12
    add-int/2addr p1, v0

    .line 13
    const/16 v0, 0x24

    .line 14
    .line 15
    invoke-direct {p0, p1, v0}, Ll/xhd;-><init>(IC)V

    .line 16
    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    if-lt v1, v0, :cond_1

    .line 20
    .line 21
    if-ge v1, v2, :cond_1

    .line 22
    .line 23
    new-instance p0, Ll/xhd;

    .line 24
    .line 25
    add-int/2addr p1, v0

    .line 26
    add-int/lit8 v1, v1, 0x2b

    .line 27
    .line 28
    int-to-char v0, v1

    .line 29
    invoke-direct {p0, p1, v0}, Ll/xhd;-><init>(IC)V

    .line 30
    .line 31
    .line 32
    return-object p0

    .line 33
    :cond_1
    const/4 v0, 0x6

    .line 34
    invoke-virtual {p0, p1, v0}, Ll/slj;->f(II)I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    const/16 v1, 0x20

    .line 39
    .line 40
    if-lt p0, v1, :cond_2

    .line 41
    .line 42
    const/16 v1, 0x3a

    .line 43
    .line 44
    if-ge p0, v1, :cond_2

    .line 45
    .line 46
    new-instance v1, Ll/xhd;

    .line 47
    .line 48
    add-int/2addr p1, v0

    .line 49
    add-int/lit8 p0, p0, 0x21

    .line 50
    .line 51
    int-to-char p0, p0

    .line 52
    invoke-direct {v1, p1, p0}, Ll/xhd;-><init>(IC)V

    .line 53
    .line 54
    .line 55
    return-object v1

    .line 56
    :cond_2
    packed-switch p0, :pswitch_data_0

    .line 57
    .line 58
    .line 59
    const-string p1, "Decoding invalid alphanumeric value: "

    .line 60
    .line 61
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    const/4 p0, 0x0

    .line 73
    return-object p0

    .line 74
    :pswitch_0
    const/16 p0, 0x2f

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :pswitch_1
    const/16 p0, 0x2e

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :pswitch_2
    const/16 p0, 0x2d

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :pswitch_3
    const/16 p0, 0x2c

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :pswitch_4
    const/16 p0, 0x2a

    .line 87
    .line 88
    :goto_0
    new-instance v1, Ll/xhd;

    .line 89
    .line 90
    add-int/2addr p1, v0

    .line 91
    invoke-direct {v1, p1, p0}, Ll/xhd;-><init>(IC)V

    .line 92
    .line 93
    .line 94
    return-object v1

    .line 95
    :pswitch_data_0
    .packed-switch 0x3a
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public c(ILjava/lang/String;)Ll/zhd;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/slj;->c:Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 5
    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/slj;->c:Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p2, p0, Ll/slj;->b:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;

    .line 15
    .line 16
    invoke-virtual {p2, p1}, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->h(I)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ll/slj;->o()Ll/zhd;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    invoke-virtual {p1}, Ll/zhd;->d()Z

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    if-eqz p2, :cond_1

    .line 30
    .line 31
    new-instance p2, Ll/zhd;

    .line 32
    .line 33
    iget-object v0, p0, Ll/slj;->b:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->a()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iget-object p0, p0, Ll/slj;->c:Ljava/lang/StringBuilder;

    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p1}, Ll/zhd;->c()I

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    invoke-direct {p2, v0, p0, p1}, Ll/zhd;-><init>(ILjava/lang/String;I)V

    .line 50
    .line 51
    .line 52
    return-object p2

    .line 53
    :cond_1
    new-instance p1, Ll/zhd;

    .line 54
    .line 55
    iget-object p2, p0, Ll/slj;->b:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;

    .line 56
    .line 57
    invoke-virtual {p2}, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->a()I

    .line 58
    .line 59
    .line 60
    move-result p2

    .line 61
    iget-object p0, p0, Ll/slj;->c:Ljava/lang/StringBuilder;

    .line 62
    .line 63
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-direct {p1, p2, p0}, Ll/zhd;-><init>(ILjava/lang/String;)V

    .line 68
    .line 69
    .line 70
    return-object p1
.end method

.method public final d(I)Ll/xhd;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x5

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/slj;->f(II)I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    const/16 v2, 0xf

    .line 7
    .line 8
    if-ne v1, v2, :cond_0

    .line 9
    .line 10
    new-instance p0, Ll/xhd;

    .line 11
    .line 12
    add-int/2addr p1, v0

    .line 13
    const/16 v0, 0x24

    .line 14
    .line 15
    invoke-direct {p0, p1, v0}, Ll/xhd;-><init>(IC)V

    .line 16
    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    const/16 v3, 0x2b

    .line 20
    .line 21
    if-lt v1, v0, :cond_1

    .line 22
    .line 23
    if-ge v1, v2, :cond_1

    .line 24
    .line 25
    new-instance p0, Ll/xhd;

    .line 26
    .line 27
    add-int/2addr p1, v0

    .line 28
    add-int/2addr v1, v3

    .line 29
    int-to-char v0, v1

    .line 30
    invoke-direct {p0, p1, v0}, Ll/xhd;-><init>(IC)V

    .line 31
    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_1
    const/4 v0, 0x7

    .line 35
    invoke-virtual {p0, p1, v0}, Ll/slj;->f(II)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    const/16 v2, 0x40

    .line 40
    .line 41
    const/16 v4, 0x5a

    .line 42
    .line 43
    if-lt v1, v2, :cond_2

    .line 44
    .line 45
    if-ge v1, v4, :cond_2

    .line 46
    .line 47
    new-instance p0, Ll/xhd;

    .line 48
    .line 49
    add-int/2addr p1, v0

    .line 50
    add-int/lit8 v1, v1, 0x1

    .line 51
    .line 52
    int-to-char v0, v1

    .line 53
    invoke-direct {p0, p1, v0}, Ll/xhd;-><init>(IC)V

    .line 54
    .line 55
    .line 56
    return-object p0

    .line 57
    :cond_2
    if-lt v1, v4, :cond_3

    .line 58
    .line 59
    const/16 v2, 0x74

    .line 60
    .line 61
    if-ge v1, v2, :cond_3

    .line 62
    .line 63
    new-instance p0, Ll/xhd;

    .line 64
    .line 65
    add-int/2addr p1, v0

    .line 66
    add-int/2addr v1, v0

    .line 67
    int-to-char v0, v1

    .line 68
    invoke-direct {p0, p1, v0}, Ll/xhd;-><init>(IC)V

    .line 69
    .line 70
    .line 71
    return-object p0

    .line 72
    :cond_3
    const/16 v0, 0x8

    .line 73
    .line 74
    invoke-virtual {p0, p1, v0}, Ll/slj;->f(II)I

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    packed-switch p0, :pswitch_data_0

    .line 79
    .line 80
    .line 81
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    throw p0

    .line 86
    :pswitch_0
    const/16 v3, 0x20

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :pswitch_1
    const/16 v3, 0x5f

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :pswitch_2
    const/16 v3, 0x3f

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :pswitch_3
    const/16 v3, 0x3e

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :pswitch_4
    const/16 v3, 0x3d

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :pswitch_5
    const/16 v3, 0x3c

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :pswitch_6
    const/16 v3, 0x3b

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :pswitch_7
    const/16 v3, 0x3a

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :pswitch_8
    const/16 v3, 0x2f

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :pswitch_9
    const/16 v3, 0x2e

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :pswitch_a
    const/16 v3, 0x2d

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :pswitch_b
    const/16 v3, 0x2c

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :pswitch_c
    const/16 v3, 0x2a

    .line 123
    .line 124
    goto :goto_0

    .line 125
    :pswitch_d
    const/16 v3, 0x29

    .line 126
    .line 127
    goto :goto_0

    .line 128
    :pswitch_e
    const/16 v3, 0x28

    .line 129
    .line 130
    goto :goto_0

    .line 131
    :pswitch_f
    const/16 v3, 0x27

    .line 132
    .line 133
    goto :goto_0

    .line 134
    :pswitch_10
    const/16 v3, 0x26

    .line 135
    .line 136
    goto :goto_0

    .line 137
    :pswitch_11
    const/16 v3, 0x25

    .line 138
    .line 139
    goto :goto_0

    .line 140
    :pswitch_12
    const/16 v3, 0x22

    .line 141
    .line 142
    goto :goto_0

    .line 143
    :pswitch_13
    const/16 v3, 0x21

    .line 144
    .line 145
    :goto_0
    :pswitch_14
    new-instance p0, Ll/xhd;

    .line 146
    .line 147
    add-int/2addr p1, v0

    .line 148
    invoke-direct {p0, p1, v3}, Ll/xhd;-><init>(IC)V

    .line 149
    .line 150
    .line 151
    return-object p0

    .line 152
    nop

    .line 153
    :pswitch_data_0
    .packed-switch 0xe8
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_14
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final e(I)Ll/aid;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 1
    add-int/lit8 v0, p1, 0x7

    .line 2
    .line 3
    iget-object v1, p0, Ll/slj;->a:Ll/b13;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/b13;->m()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-le v0, v1, :cond_1

    .line 10
    .line 11
    const/4 v0, 0x4

    .line 12
    invoke-virtual {p0, p1, v0}, Ll/slj;->f(II)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iget-object p0, p0, Ll/slj;->a:Ll/b13;

    .line 17
    .line 18
    const/16 v0, 0xa

    .line 19
    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    new-instance p1, Ll/aid;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/b13;->m()I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    invoke-direct {p1, p0, v0, v0}, Ll/aid;-><init>(III)V

    .line 29
    .line 30
    .line 31
    return-object p1

    .line 32
    :cond_0
    new-instance v1, Ll/aid;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/b13;->m()I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    add-int/lit8 p1, p1, -0x1

    .line 39
    .line 40
    invoke-direct {v1, p0, p1, v0}, Ll/aid;-><init>(III)V

    .line 41
    .line 42
    .line 43
    return-object v1

    .line 44
    :cond_1
    const/4 v1, 0x7

    .line 45
    invoke-virtual {p0, p1, v1}, Ll/slj;->f(II)I

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    add-int/lit8 p0, p0, -0x8

    .line 50
    .line 51
    div-int/lit8 p1, p0, 0xb

    .line 52
    .line 53
    rem-int/lit8 p0, p0, 0xb

    .line 54
    .line 55
    new-instance v1, Ll/aid;

    .line 56
    .line 57
    invoke-direct {v1, v0, p1, p0}, Ll/aid;-><init>(III)V

    .line 58
    .line 59
    .line 60
    return-object v1
.end method

.method public f(II)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/slj;->a:Ll/b13;

    .line 2
    .line 3
    invoke-static {p0, p1, p2}, Ll/slj;->g(Ll/b13;II)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final h(I)Z
    .locals 3

    .line 1
    add-int/lit8 v0, p1, 0x3

    .line 2
    .line 3
    iget-object v1, p0, Ll/slj;->a:Ll/b13;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/b13;->m()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    if-le v0, v1, :cond_0

    .line 11
    .line 12
    return v2

    .line 13
    :cond_0
    :goto_0
    if-ge p1, v0, :cond_2

    .line 14
    .line 15
    iget-object v1, p0, Ll/slj;->a:Ll/b13;

    .line 16
    .line 17
    invoke-virtual {v1, p1}, Ll/b13;->f(I)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    return v2

    .line 24
    :cond_1
    add-int/lit8 p1, p1, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_2
    const/4 p0, 0x1

    .line 28
    return p0
.end method

.method public final i(I)Z
    .locals 5

    .line 1
    add-int/lit8 v0, p1, 0x1

    .line 2
    .line 3
    iget-object v1, p0, Ll/slj;->a:Ll/b13;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/b13;->m()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    if-le v0, v1, :cond_0

    .line 11
    .line 12
    return v2

    .line 13
    :cond_0
    move v0, v2

    .line 14
    :goto_0
    const/4 v1, 0x5

    .line 15
    if-ge v0, v1, :cond_3

    .line 16
    .line 17
    add-int v1, v0, p1

    .line 18
    .line 19
    iget-object v3, p0, Ll/slj;->a:Ll/b13;

    .line 20
    .line 21
    invoke-virtual {v3}, Ll/b13;->m()I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-ge v1, v3, :cond_3

    .line 26
    .line 27
    iget-object v3, p0, Ll/slj;->a:Ll/b13;

    .line 28
    .line 29
    const/4 v4, 0x2

    .line 30
    if-ne v0, v4, :cond_1

    .line 31
    .line 32
    add-int/lit8 v1, p1, 0x2

    .line 33
    .line 34
    invoke-virtual {v3, v1}, Ll/b13;->f(I)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-nez v1, :cond_2

    .line 39
    .line 40
    return v2

    .line 41
    :cond_1
    invoke-virtual {v3, v1}, Ll/b13;->f(I)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_2

    .line 46
    .line 47
    return v2

    .line 48
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_3
    const/4 p0, 0x1

    .line 52
    return p0
.end method

.method public final j(I)Z
    .locals 4

    .line 1
    add-int/lit8 v0, p1, 0x1

    .line 2
    .line 3
    iget-object v1, p0, Ll/slj;->a:Ll/b13;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/b13;->m()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    if-le v0, v1, :cond_0

    .line 11
    .line 12
    return v2

    .line 13
    :cond_0
    move v0, v2

    .line 14
    :goto_0
    const/4 v1, 0x4

    .line 15
    if-ge v0, v1, :cond_2

    .line 16
    .line 17
    add-int v1, v0, p1

    .line 18
    .line 19
    iget-object v3, p0, Ll/slj;->a:Ll/b13;

    .line 20
    .line 21
    invoke-virtual {v3}, Ll/b13;->m()I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-ge v1, v3, :cond_2

    .line 26
    .line 27
    iget-object v3, p0, Ll/slj;->a:Ll/b13;

    .line 28
    .line 29
    invoke-virtual {v3, v1}, Ll/b13;->f(I)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    return v2

    .line 36
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_2
    const/4 p0, 0x1

    .line 40
    return p0
.end method

.method public final k(I)Z
    .locals 5

    .line 1
    add-int/lit8 v0, p1, 0x5

    .line 2
    .line 3
    iget-object v1, p0, Ll/slj;->a:Ll/b13;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/b13;->m()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    if-le v0, v1, :cond_0

    .line 11
    .line 12
    return v2

    .line 13
    :cond_0
    const/4 v0, 0x5

    .line 14
    invoke-virtual {p0, p1, v0}, Ll/slj;->f(II)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const/4 v3, 0x1

    .line 19
    const/16 v4, 0x10

    .line 20
    .line 21
    if-lt v1, v0, :cond_1

    .line 22
    .line 23
    if-ge v1, v4, :cond_1

    .line 24
    .line 25
    return v3

    .line 26
    :cond_1
    add-int/lit8 v0, p1, 0x6

    .line 27
    .line 28
    iget-object v1, p0, Ll/slj;->a:Ll/b13;

    .line 29
    .line 30
    invoke-virtual {v1}, Ll/b13;->m()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-le v0, v1, :cond_2

    .line 35
    .line 36
    return v2

    .line 37
    :cond_2
    const/4 v0, 0x6

    .line 38
    invoke-virtual {p0, p1, v0}, Ll/slj;->f(II)I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-lt p0, v4, :cond_3

    .line 43
    .line 44
    const/16 p1, 0x3f

    .line 45
    .line 46
    if-ge p0, p1, :cond_3

    .line 47
    .line 48
    return v3

    .line 49
    :cond_3
    return v2
.end method

.method public final l(I)Z
    .locals 4

    .line 1
    add-int/lit8 v0, p1, 0x5

    .line 2
    .line 3
    iget-object v1, p0, Ll/slj;->a:Ll/b13;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/b13;->m()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    if-le v0, v1, :cond_0

    .line 11
    .line 12
    return v2

    .line 13
    :cond_0
    const/4 v0, 0x5

    .line 14
    invoke-virtual {p0, p1, v0}, Ll/slj;->f(II)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const/4 v3, 0x1

    .line 19
    if-lt v1, v0, :cond_1

    .line 20
    .line 21
    const/16 v0, 0x10

    .line 22
    .line 23
    if-ge v1, v0, :cond_1

    .line 24
    .line 25
    return v3

    .line 26
    :cond_1
    add-int/lit8 v0, p1, 0x7

    .line 27
    .line 28
    iget-object v1, p0, Ll/slj;->a:Ll/b13;

    .line 29
    .line 30
    invoke-virtual {v1}, Ll/b13;->m()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-le v0, v1, :cond_2

    .line 35
    .line 36
    return v2

    .line 37
    :cond_2
    const/4 v0, 0x7

    .line 38
    invoke-virtual {p0, p1, v0}, Ll/slj;->f(II)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    const/16 v1, 0x40

    .line 43
    .line 44
    if-lt v0, v1, :cond_3

    .line 45
    .line 46
    const/16 v1, 0x74

    .line 47
    .line 48
    if-ge v0, v1, :cond_3

    .line 49
    .line 50
    return v3

    .line 51
    :cond_3
    add-int/lit8 v0, p1, 0x8

    .line 52
    .line 53
    iget-object v1, p0, Ll/slj;->a:Ll/b13;

    .line 54
    .line 55
    invoke-virtual {v1}, Ll/b13;->m()I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-le v0, v1, :cond_4

    .line 60
    .line 61
    return v2

    .line 62
    :cond_4
    const/16 v0, 0x8

    .line 63
    .line 64
    invoke-virtual {p0, p1, v0}, Ll/slj;->f(II)I

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    const/16 p1, 0xe8

    .line 69
    .line 70
    if-lt p0, p1, :cond_5

    .line 71
    .line 72
    const/16 p1, 0xfd

    .line 73
    .line 74
    if-ge p0, p1, :cond_5

    .line 75
    .line 76
    return v3

    .line 77
    :cond_5
    return v2
.end method

.method public final m(I)Z
    .locals 4

    .line 1
    add-int/lit8 v0, p1, 0x7

    .line 2
    .line 3
    iget-object v1, p0, Ll/slj;->a:Ll/b13;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/b13;->m()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x1

    .line 10
    if-le v0, v1, :cond_1

    .line 11
    .line 12
    add-int/lit8 p1, p1, 0x4

    .line 13
    .line 14
    iget-object p0, p0, Ll/slj;->a:Ll/b13;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/b13;->m()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-gt p1, p0, :cond_0

    .line 21
    .line 22
    return v2

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0

    .line 25
    :cond_1
    move v0, p1

    .line 26
    :goto_0
    add-int/lit8 v1, p1, 0x3

    .line 27
    .line 28
    iget-object v3, p0, Ll/slj;->a:Ll/b13;

    .line 29
    .line 30
    if-ge v0, v1, :cond_3

    .line 31
    .line 32
    invoke-virtual {v3, v0}, Ll/b13;->f(I)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    return v2

    .line 39
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_3
    invoke-virtual {v3, v1}, Ll/b13;->f(I)Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    return p0
.end method

.method public final n()Ll/j43;
    .locals 4

    .line 1
    :goto_0
    iget-object v0, p0, Ll/slj;->b:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->a()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0, v0}, Ll/slj;->k(I)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Ll/slj;->b:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->a()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-virtual {p0, v0}, Ll/slj;->b(I)Ll/xhd;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Ll/slj;->b:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/bid;->a()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    invoke-virtual {v1, v2}, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->h(I)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ll/xhd;->c()Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_0

    .line 37
    .line 38
    new-instance v0, Ll/zhd;

    .line 39
    .line 40
    iget-object v1, p0, Ll/slj;->b:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;

    .line 41
    .line 42
    invoke-virtual {v1}, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->a()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    iget-object p0, p0, Ll/slj;->c:Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-direct {v0, v1, p0}, Ll/zhd;-><init>(ILjava/lang/String;)V

    .line 53
    .line 54
    .line 55
    new-instance p0, Ll/j43;

    .line 56
    .line 57
    const/4 v1, 0x1

    .line 58
    invoke-direct {p0, v0, v1}, Ll/j43;-><init>(Ll/zhd;Z)V

    .line 59
    .line 60
    .line 61
    return-object p0

    .line 62
    :cond_0
    iget-object v1, p0, Ll/slj;->c:Ljava/lang/StringBuilder;

    .line 63
    .line 64
    invoke-virtual {v0}, Ll/xhd;->b()C

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_1
    invoke-virtual {v1}, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->a()I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    invoke-virtual {p0, v0}, Ll/slj;->h(I)Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    iget-object v1, p0, Ll/slj;->b:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;

    .line 81
    .line 82
    if-eqz v0, :cond_2

    .line 83
    .line 84
    const/4 v0, 0x3

    .line 85
    invoke-virtual {v1, v0}, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->b(I)V

    .line 86
    .line 87
    .line 88
    iget-object p0, p0, Ll/slj;->b:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;

    .line 89
    .line 90
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->g()V

    .line 91
    .line 92
    .line 93
    goto :goto_2

    .line 94
    :cond_2
    invoke-virtual {v1}, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->a()I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    invoke-virtual {p0, v0}, Ll/slj;->i(I)Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-eqz v0, :cond_4

    .line 103
    .line 104
    iget-object v0, p0, Ll/slj;->b:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;

    .line 105
    .line 106
    invoke-virtual {v0}, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->a()I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    const/4 v1, 0x5

    .line 111
    add-int/2addr v0, v1

    .line 112
    iget-object v2, p0, Ll/slj;->a:Ll/b13;

    .line 113
    .line 114
    invoke-virtual {v2}, Ll/b13;->m()I

    .line 115
    .line 116
    .line 117
    move-result v2

    .line 118
    iget-object v3, p0, Ll/slj;->b:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;

    .line 119
    .line 120
    if-ge v0, v2, :cond_3

    .line 121
    .line 122
    invoke-virtual {v3, v1}, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->b(I)V

    .line 123
    .line 124
    .line 125
    goto :goto_1

    .line 126
    :cond_3
    iget-object v0, p0, Ll/slj;->a:Ll/b13;

    .line 127
    .line 128
    invoke-virtual {v0}, Ll/b13;->m()I

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    invoke-virtual {v3, v0}, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->h(I)V

    .line 133
    .line 134
    .line 135
    :goto_1
    iget-object p0, p0, Ll/slj;->b:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;

    .line 136
    .line 137
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->f()V

    .line 138
    .line 139
    .line 140
    :cond_4
    :goto_2
    new-instance p0, Ll/j43;

    .line 141
    .line 142
    const/4 v0, 0x0

    .line 143
    invoke-direct {p0, v0}, Ll/j43;-><init>(Z)V

    .line 144
    .line 145
    .line 146
    return-object p0
.end method

.method public final o()Ll/zhd;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 1
    :cond_0
    iget-object v0, p0, Ll/slj;->b:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->a()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/slj;->b:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->c()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/slj;->n()Ll/j43;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Ll/j43;->b()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    goto :goto_0

    .line 24
    :cond_1
    iget-object v1, p0, Ll/slj;->b:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->d()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_2

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/slj;->p()Ll/j43;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v1}, Ll/j43;->b()Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    goto :goto_0

    .line 41
    :cond_2
    invoke-virtual {p0}, Ll/slj;->q()Ll/j43;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v1}, Ll/j43;->b()Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    :goto_0
    iget-object v3, p0, Ll/slj;->b:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;

    .line 50
    .line 51
    invoke-virtual {v3}, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->a()I

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    if-eq v0, v3, :cond_3

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_3
    if-eqz v2, :cond_4

    .line 59
    .line 60
    :goto_1
    if-eqz v2, :cond_0

    .line 61
    .line 62
    :cond_4
    invoke-virtual {v1}, Ll/j43;->a()Ll/zhd;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    return-object p0
.end method

.method public final p()Ll/j43;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 1
    :goto_0
    iget-object v0, p0, Ll/slj;->b:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->a()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0, v0}, Ll/slj;->l(I)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Ll/slj;->b:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->a()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-virtual {p0, v0}, Ll/slj;->d(I)Ll/xhd;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Ll/slj;->b:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/bid;->a()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    invoke-virtual {v1, v2}, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->h(I)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ll/xhd;->c()Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_0

    .line 37
    .line 38
    new-instance v0, Ll/zhd;

    .line 39
    .line 40
    iget-object v1, p0, Ll/slj;->b:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;

    .line 41
    .line 42
    invoke-virtual {v1}, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->a()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    iget-object p0, p0, Ll/slj;->c:Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-direct {v0, v1, p0}, Ll/zhd;-><init>(ILjava/lang/String;)V

    .line 53
    .line 54
    .line 55
    new-instance p0, Ll/j43;

    .line 56
    .line 57
    const/4 v1, 0x1

    .line 58
    invoke-direct {p0, v0, v1}, Ll/j43;-><init>(Ll/zhd;Z)V

    .line 59
    .line 60
    .line 61
    return-object p0

    .line 62
    :cond_0
    iget-object v1, p0, Ll/slj;->c:Ljava/lang/StringBuilder;

    .line 63
    .line 64
    invoke-virtual {v0}, Ll/xhd;->b()C

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_1
    invoke-virtual {v1}, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->a()I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    invoke-virtual {p0, v0}, Ll/slj;->h(I)Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    iget-object v1, p0, Ll/slj;->b:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;

    .line 81
    .line 82
    if-eqz v0, :cond_2

    .line 83
    .line 84
    const/4 v0, 0x3

    .line 85
    invoke-virtual {v1, v0}, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->b(I)V

    .line 86
    .line 87
    .line 88
    iget-object p0, p0, Ll/slj;->b:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;

    .line 89
    .line 90
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->g()V

    .line 91
    .line 92
    .line 93
    goto :goto_2

    .line 94
    :cond_2
    invoke-virtual {v1}, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->a()I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    invoke-virtual {p0, v0}, Ll/slj;->i(I)Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-eqz v0, :cond_4

    .line 103
    .line 104
    iget-object v0, p0, Ll/slj;->b:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;

    .line 105
    .line 106
    invoke-virtual {v0}, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->a()I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    const/4 v1, 0x5

    .line 111
    add-int/2addr v0, v1

    .line 112
    iget-object v2, p0, Ll/slj;->a:Ll/b13;

    .line 113
    .line 114
    invoke-virtual {v2}, Ll/b13;->m()I

    .line 115
    .line 116
    .line 117
    move-result v2

    .line 118
    iget-object v3, p0, Ll/slj;->b:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;

    .line 119
    .line 120
    if-ge v0, v2, :cond_3

    .line 121
    .line 122
    invoke-virtual {v3, v1}, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->b(I)V

    .line 123
    .line 124
    .line 125
    goto :goto_1

    .line 126
    :cond_3
    iget-object v0, p0, Ll/slj;->a:Ll/b13;

    .line 127
    .line 128
    invoke-virtual {v0}, Ll/b13;->m()I

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    invoke-virtual {v3, v0}, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->h(I)V

    .line 133
    .line 134
    .line 135
    :goto_1
    iget-object p0, p0, Ll/slj;->b:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;

    .line 136
    .line 137
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->e()V

    .line 138
    .line 139
    .line 140
    :cond_4
    :goto_2
    new-instance p0, Ll/j43;

    .line 141
    .line 142
    const/4 v0, 0x0

    .line 143
    invoke-direct {p0, v0}, Ll/j43;-><init>(Z)V

    .line 144
    .line 145
    .line 146
    return-object p0
.end method

.method public final q()Ll/j43;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 1
    :goto_0
    iget-object v0, p0, Ll/slj;->b:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->a()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0, v0}, Ll/slj;->m(I)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Ll/slj;->b:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;

    .line 12
    .line 13
    if-eqz v0, :cond_3

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->a()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-virtual {p0, v0}, Ll/slj;->e(I)Ll/aid;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Ll/slj;->b:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/bid;->a()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    invoke-virtual {v1, v2}, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->h(I)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ll/aid;->d()Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    const/4 v2, 0x1

    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/aid;->e()Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    iget-object v3, p0, Ll/slj;->b:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;

    .line 44
    .line 45
    if-eqz v1, :cond_0

    .line 46
    .line 47
    new-instance v0, Ll/zhd;

    .line 48
    .line 49
    invoke-virtual {v3}, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->a()I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    iget-object p0, p0, Ll/slj;->c:Ljava/lang/StringBuilder;

    .line 54
    .line 55
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-direct {v0, v1, p0}, Ll/zhd;-><init>(ILjava/lang/String;)V

    .line 60
    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_0
    new-instance v1, Ll/zhd;

    .line 64
    .line 65
    invoke-virtual {v3}, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->a()I

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    iget-object p0, p0, Ll/slj;->c:Ljava/lang/StringBuilder;

    .line 70
    .line 71
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {v0}, Ll/aid;->c()I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    invoke-direct {v1, v3, p0, v0}, Ll/zhd;-><init>(ILjava/lang/String;I)V

    .line 80
    .line 81
    .line 82
    move-object v0, v1

    .line 83
    :goto_1
    new-instance p0, Ll/j43;

    .line 84
    .line 85
    invoke-direct {p0, v0, v2}, Ll/j43;-><init>(Ll/zhd;Z)V

    .line 86
    .line 87
    .line 88
    return-object p0

    .line 89
    :cond_1
    iget-object v1, p0, Ll/slj;->c:Ljava/lang/StringBuilder;

    .line 90
    .line 91
    invoke-virtual {v0}, Ll/aid;->b()I

    .line 92
    .line 93
    .line 94
    move-result v3

    .line 95
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0}, Ll/aid;->e()Z

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    if-eqz v1, :cond_2

    .line 103
    .line 104
    new-instance v0, Ll/zhd;

    .line 105
    .line 106
    iget-object v1, p0, Ll/slj;->b:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;

    .line 107
    .line 108
    invoke-virtual {v1}, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->a()I

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    iget-object p0, p0, Ll/slj;->c:Ljava/lang/StringBuilder;

    .line 113
    .line 114
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-direct {v0, v1, p0}, Ll/zhd;-><init>(ILjava/lang/String;)V

    .line 119
    .line 120
    .line 121
    new-instance p0, Ll/j43;

    .line 122
    .line 123
    invoke-direct {p0, v0, v2}, Ll/j43;-><init>(Ll/zhd;Z)V

    .line 124
    .line 125
    .line 126
    return-object p0

    .line 127
    :cond_2
    iget-object v1, p0, Ll/slj;->c:Ljava/lang/StringBuilder;

    .line 128
    .line 129
    invoke-virtual {v0}, Ll/aid;->c()I

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    goto/16 :goto_0

    .line 137
    .line 138
    :cond_3
    invoke-virtual {v1}, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->a()I

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    invoke-virtual {p0, v0}, Ll/slj;->j(I)Z

    .line 143
    .line 144
    .line 145
    move-result v0

    .line 146
    if-eqz v0, :cond_4

    .line 147
    .line 148
    iget-object v0, p0, Ll/slj;->b:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;

    .line 149
    .line 150
    invoke-virtual {v0}, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->e()V

    .line 151
    .line 152
    .line 153
    iget-object p0, p0, Ll/slj;->b:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;

    .line 154
    .line 155
    const/4 v0, 0x4

    .line 156
    invoke-virtual {p0, v0}, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->b(I)V

    .line 157
    .line 158
    .line 159
    :cond_4
    new-instance p0, Ll/j43;

    .line 160
    .line 161
    const/4 v0, 0x0

    .line 162
    invoke-direct {p0, v0}, Ll/j43;-><init>(Z)V

    .line 163
    .line 164
    .line 165
    return-object p0
.end method
