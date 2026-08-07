.class public final Lcom/guardsquare/dexguard/setContentView;
.super Ljava/io/FilterInputStream;
.source "SourceFile"


# instance fields
.field private Movie:I

.field private onContextItemSelected:I

.field private onOptionsItemSelected:[B

.field private final openContextMenu:I

.field private registerForContextMenu:[B

.field private setContentView:[B

.field private unregisterForContextMenu:Lcom/guardsquare/dexguard/openContextMenu;

.field private valueOf:I

.field private values:I

.field private width:[I


# direct methods
.method public constructor <init>(Ljava/io/InputStream;[I[BIZI)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 2
    .line 3
    .line 4
    const p1, 0x7fffffff

    .line 5
    .line 6
    .line 7
    iput p1, p0, Lcom/guardsquare/dexguard/setContentView;->values:I

    .line 8
    .line 9
    const/4 p1, 0x3

    .line 10
    invoke-static {p4, p1}, Ljava/lang/Math;->max(II)I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    const/16 p4, 0x10

    .line 15
    .line 16
    invoke-static {p1, p4}, Ljava/lang/Math;->min(II)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    iput p1, p0, Lcom/guardsquare/dexguard/setContentView;->openContextMenu:I

    .line 21
    .line 22
    const/16 p4, 0x8

    .line 23
    .line 24
    new-array p5, p4, [B

    .line 25
    .line 26
    iput-object p5, p0, Lcom/guardsquare/dexguard/setContentView;->registerForContextMenu:[B

    .line 27
    .line 28
    new-array p5, p4, [B

    .line 29
    .line 30
    iput-object p5, p0, Lcom/guardsquare/dexguard/setContentView;->setContentView:[B

    .line 31
    .line 32
    new-array v0, p4, [B

    .line 33
    .line 34
    iput-object v0, p0, Lcom/guardsquare/dexguard/setContentView;->onOptionsItemSelected:[B

    .line 35
    .line 36
    const/4 v0, 0x2

    .line 37
    new-array v1, v0, [I

    .line 38
    .line 39
    iput-object v1, p0, Lcom/guardsquare/dexguard/setContentView;->width:[I

    .line 40
    .line 41
    iput p4, p0, Lcom/guardsquare/dexguard/setContentView;->Movie:I

    .line 42
    .line 43
    iput p4, p0, Lcom/guardsquare/dexguard/setContentView;->onContextItemSelected:I

    .line 44
    .line 45
    iput p6, p0, Lcom/guardsquare/dexguard/setContentView;->valueOf:I

    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    if-ne p6, v0, :cond_0

    .line 49
    .line 50
    invoke-static {p3, v1, p5, v1, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 51
    .line 52
    .line 53
    :cond_0
    new-instance p3, Lcom/guardsquare/dexguard/openContextMenu;

    .line 54
    .line 55
    const/4 p4, 0x1

    .line 56
    invoke-direct {p3, p2, p1, p4, v1}, Lcom/guardsquare/dexguard/openContextMenu;-><init>([IIZZ)V

    .line 57
    .line 58
    .line 59
    iput-object p3, p0, Lcom/guardsquare/dexguard/setContentView;->unregisterForContextMenu:Lcom/guardsquare/dexguard/openContextMenu;

    .line 60
    .line 61
    return-void
.end method

.method private registerForContextMenu()V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget v1, v0, Lcom/guardsquare/dexguard/setContentView;->valueOf:I

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x2

    .line 7
    if-ne v1, v3, :cond_0

    .line 8
    .line 9
    iget-object v1, v0, Lcom/guardsquare/dexguard/setContentView;->registerForContextMenu:[B

    .line 10
    .line 11
    iget-object v4, v0, Lcom/guardsquare/dexguard/setContentView;->onOptionsItemSelected:[B

    .line 12
    .line 13
    array-length v5, v1

    .line 14
    invoke-static {v1, v2, v4, v2, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v1, v0, Lcom/guardsquare/dexguard/setContentView;->registerForContextMenu:[B

    .line 18
    .line 19
    aget-byte v4, v1, v2

    .line 20
    .line 21
    shl-int/lit8 v4, v4, 0x18

    .line 22
    .line 23
    const/high16 v5, -0x1000000

    .line 24
    .line 25
    and-int/2addr v4, v5

    .line 26
    const/4 v6, 0x1

    .line 27
    aget-byte v7, v1, v6

    .line 28
    .line 29
    shl-int/lit8 v7, v7, 0x10

    .line 30
    .line 31
    const/high16 v8, 0xff0000

    .line 32
    .line 33
    and-int/2addr v7, v8

    .line 34
    add-int/2addr v4, v7

    .line 35
    aget-byte v7, v1, v3

    .line 36
    .line 37
    const/16 v9, 0x8

    .line 38
    .line 39
    shl-int/2addr v7, v9

    .line 40
    const v10, 0xff00

    .line 41
    .line 42
    .line 43
    and-int/2addr v7, v10

    .line 44
    add-int/2addr v4, v7

    .line 45
    const/4 v7, 0x3

    .line 46
    aget-byte v11, v1, v7

    .line 47
    .line 48
    and-int/lit16 v11, v11, 0xff

    .line 49
    .line 50
    add-int v12, v4, v11

    .line 51
    .line 52
    const/4 v4, 0x4

    .line 53
    aget-byte v11, v1, v4

    .line 54
    .line 55
    shl-int/lit8 v11, v11, 0x18

    .line 56
    .line 57
    and-int/2addr v5, v11

    .line 58
    const/4 v11, 0x5

    .line 59
    aget-byte v13, v1, v11

    .line 60
    .line 61
    shl-int/lit8 v13, v13, 0x10

    .line 62
    .line 63
    and-int/2addr v8, v13

    .line 64
    add-int/2addr v5, v8

    .line 65
    const/4 v8, 0x6

    .line 66
    aget-byte v13, v1, v8

    .line 67
    .line 68
    shl-int/2addr v13, v9

    .line 69
    and-int/2addr v10, v13

    .line 70
    add-int/2addr v5, v10

    .line 71
    const/4 v10, 0x7

    .line 72
    aget-byte v1, v1, v10

    .line 73
    .line 74
    and-int/lit16 v1, v1, 0xff

    .line 75
    .line 76
    add-int v13, v5, v1

    .line 77
    .line 78
    iget v15, v0, Lcom/guardsquare/dexguard/setContentView;->openContextMenu:I

    .line 79
    .line 80
    iget-object v1, v0, Lcom/guardsquare/dexguard/setContentView;->unregisterForContextMenu:Lcom/guardsquare/dexguard/openContextMenu;

    .line 81
    .line 82
    iget-object v5, v1, Lcom/guardsquare/dexguard/openContextMenu;->registerForContextMenu:[I

    .line 83
    .line 84
    iget-object v1, v1, Lcom/guardsquare/dexguard/openContextMenu;->setContentView:[[I

    .line 85
    .line 86
    iget-object v14, v0, Lcom/guardsquare/dexguard/setContentView;->width:[I

    .line 87
    .line 88
    move-object/from16 v18, v14

    .line 89
    .line 90
    const/4 v14, 0x0

    .line 91
    move-object/from16 v17, v1

    .line 92
    .line 93
    move-object/from16 v16, v5

    .line 94
    .line 95
    invoke-static/range {v12 .. v18}, Lcom/guardsquare/dexguard/unregisterForContextMenu;->unregisterForContextMenu(IIZI[I[[I[I)V

    .line 96
    .line 97
    .line 98
    iget-object v1, v0, Lcom/guardsquare/dexguard/setContentView;->width:[I

    .line 99
    .line 100
    aget v5, v1, v2

    .line 101
    .line 102
    aget v1, v1, v6

    .line 103
    .line 104
    iget-object v12, v0, Lcom/guardsquare/dexguard/setContentView;->registerForContextMenu:[B

    .line 105
    .line 106
    shr-int/lit8 v13, v5, 0x18

    .line 107
    .line 108
    int-to-byte v13, v13

    .line 109
    aput-byte v13, v12, v2

    .line 110
    .line 111
    shr-int/lit8 v13, v5, 0x10

    .line 112
    .line 113
    int-to-byte v13, v13

    .line 114
    aput-byte v13, v12, v6

    .line 115
    .line 116
    shr-int/lit8 v6, v5, 0x8

    .line 117
    .line 118
    int-to-byte v6, v6

    .line 119
    aput-byte v6, v12, v3

    .line 120
    .line 121
    int-to-byte v5, v5

    .line 122
    aput-byte v5, v12, v7

    .line 123
    .line 124
    shr-int/lit8 v5, v1, 0x18

    .line 125
    .line 126
    int-to-byte v5, v5

    .line 127
    aput-byte v5, v12, v4

    .line 128
    .line 129
    shr-int/lit8 v4, v1, 0x10

    .line 130
    .line 131
    int-to-byte v4, v4

    .line 132
    aput-byte v4, v12, v11

    .line 133
    .line 134
    shr-int/lit8 v4, v1, 0x8

    .line 135
    .line 136
    int-to-byte v4, v4

    .line 137
    aput-byte v4, v12, v8

    .line 138
    .line 139
    int-to-byte v1, v1

    .line 140
    aput-byte v1, v12, v10

    .line 141
    .line 142
    iget v1, v0, Lcom/guardsquare/dexguard/setContentView;->valueOf:I

    .line 143
    .line 144
    if-ne v1, v3, :cond_2

    .line 145
    .line 146
    move v1, v2

    .line 147
    :goto_0
    if-ge v1, v9, :cond_1

    .line 148
    .line 149
    iget-object v3, v0, Lcom/guardsquare/dexguard/setContentView;->registerForContextMenu:[B

    .line 150
    .line 151
    aget-byte v4, v3, v1

    .line 152
    .line 153
    iget-object v5, v0, Lcom/guardsquare/dexguard/setContentView;->setContentView:[B

    .line 154
    .line 155
    aget-byte v5, v5, v1

    .line 156
    .line 157
    xor-int/2addr v4, v5

    .line 158
    int-to-byte v4, v4

    .line 159
    aput-byte v4, v3, v1

    .line 160
    .line 161
    add-int/lit8 v1, v1, 0x1

    .line 162
    .line 163
    goto :goto_0

    .line 164
    :cond_1
    iget-object v1, v0, Lcom/guardsquare/dexguard/setContentView;->onOptionsItemSelected:[B

    .line 165
    .line 166
    iget-object v0, v0, Lcom/guardsquare/dexguard/setContentView;->setContentView:[B

    .line 167
    .line 168
    array-length v3, v1

    .line 169
    invoke-static {v1, v2, v0, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 170
    .line 171
    .line 172
    :cond_2
    return-void
.end method

.method private unregisterForContextMenu()I
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/guardsquare/dexguard/setContentView;->values:I

    .line 2
    .line 3
    const v1, 0x7fffffff

    .line 4
    .line 5
    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Ljava/io/FilterInputStream;->in:Ljava/io/InputStream;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iput v0, p0, Lcom/guardsquare/dexguard/setContentView;->values:I

    .line 15
    .line 16
    :cond_0
    iget v0, p0, Lcom/guardsquare/dexguard/setContentView;->Movie:I

    .line 17
    .line 18
    const/16 v1, 0x8

    .line 19
    .line 20
    if-ne v0, v1, :cond_6

    .line 21
    .line 22
    iget-object v0, p0, Lcom/guardsquare/dexguard/setContentView;->registerForContextMenu:[B

    .line 23
    .line 24
    iget v2, p0, Lcom/guardsquare/dexguard/setContentView;->values:I

    .line 25
    .line 26
    int-to-byte v3, v2

    .line 27
    const/4 v4, 0x0

    .line 28
    aput-byte v3, v0, v4

    .line 29
    .line 30
    const-string v0, "unexpected block size"

    .line 31
    .line 32
    if-ltz v2, :cond_5

    .line 33
    .line 34
    const/4 v2, 0x1

    .line 35
    :cond_1
    iget-object v3, p0, Ljava/io/FilterInputStream;->in:Ljava/io/InputStream;

    .line 36
    .line 37
    iget-object v5, p0, Lcom/guardsquare/dexguard/setContentView;->registerForContextMenu:[B

    .line 38
    .line 39
    rsub-int/lit8 v6, v2, 0x8

    .line 40
    .line 41
    invoke-virtual {v3, v5, v2, v6}, Ljava/io/InputStream;->read([BII)I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-lez v3, :cond_2

    .line 46
    .line 47
    add-int/2addr v2, v3

    .line 48
    if-lt v2, v1, :cond_1

    .line 49
    .line 50
    :cond_2
    if-lt v2, v1, :cond_4

    .line 51
    .line 52
    invoke-direct {p0}, Lcom/guardsquare/dexguard/setContentView;->registerForContextMenu()V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ljava/io/FilterInputStream;->in:Ljava/io/InputStream;

    .line 56
    .line 57
    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    iput v0, p0, Lcom/guardsquare/dexguard/setContentView;->values:I

    .line 62
    .line 63
    iput v4, p0, Lcom/guardsquare/dexguard/setContentView;->Movie:I

    .line 64
    .line 65
    if-gez v0, :cond_3

    .line 66
    .line 67
    iget-object v0, p0, Lcom/guardsquare/dexguard/setContentView;->registerForContextMenu:[B

    .line 68
    .line 69
    const/4 v2, 0x7

    .line 70
    aget-byte v0, v0, v2

    .line 71
    .line 72
    and-int/lit16 v0, v0, 0xff

    .line 73
    .line 74
    sub-int/2addr v1, v0

    .line 75
    :cond_3
    iput v1, p0, Lcom/guardsquare/dexguard/setContentView;->onContextItemSelected:I

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_4
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    :goto_0
    const/4 p0, 0x0

    .line 82
    return p0

    .line 83
    :cond_5
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_6
    :goto_1
    iget p0, p0, Lcom/guardsquare/dexguard/setContentView;->onContextItemSelected:I

    .line 88
    .line 89
    return p0
.end method


# virtual methods
.method public final available()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/guardsquare/dexguard/setContentView;->unregisterForContextMenu()I

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/guardsquare/dexguard/setContentView;->onContextItemSelected:I

    .line 5
    .line 6
    iget p0, p0, Lcom/guardsquare/dexguard/setContentView;->Movie:I

    .line 7
    .line 8
    sub-int/2addr v0, p0

    .line 9
    return v0
.end method

.method public final markSupported()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public final read()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 37
    invoke-direct {p0}, Lcom/guardsquare/dexguard/setContentView;->unregisterForContextMenu()I

    .line 38
    iget v0, p0, Lcom/guardsquare/dexguard/setContentView;->Movie:I

    iget v1, p0, Lcom/guardsquare/dexguard/setContentView;->onContextItemSelected:I

    if-lt v0, v1, :cond_0

    const/4 p0, -0x1

    return p0

    .line 39
    :cond_0
    iget-object v1, p0, Lcom/guardsquare/dexguard/setContentView;->registerForContextMenu:[B

    add-int/lit8 v2, v0, 0x1

    iput v2, p0, Lcom/guardsquare/dexguard/setContentView;->Movie:I

    aget-byte p0, v1, v0

    and-int/lit16 p0, p0, 0xff

    return p0
.end method

.method public final read([BII)I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    add-int v0, p2, p3

    .line 2
    .line 3
    move v1, p2

    .line 4
    :goto_0
    if-ge v1, v0, :cond_2

    .line 5
    .line 6
    invoke-direct {p0}, Lcom/guardsquare/dexguard/setContentView;->unregisterForContextMenu()I

    .line 7
    .line 8
    .line 9
    iget v2, p0, Lcom/guardsquare/dexguard/setContentView;->Movie:I

    .line 10
    .line 11
    iget v3, p0, Lcom/guardsquare/dexguard/setContentView;->onContextItemSelected:I

    .line 12
    .line 13
    if-lt v2, v3, :cond_1

    .line 14
    .line 15
    if-ne v1, p2, :cond_0

    .line 16
    .line 17
    const/4 p0, -0x1

    .line 18
    return p0

    .line 19
    :cond_0
    sub-int/2addr v0, v1

    .line 20
    sub-int/2addr p3, v0

    .line 21
    return p3

    .line 22
    :cond_1
    add-int/lit8 v3, v1, 0x1

    .line 23
    .line 24
    iget-object v4, p0, Lcom/guardsquare/dexguard/setContentView;->registerForContextMenu:[B

    .line 25
    .line 26
    add-int/lit8 v5, v2, 0x1

    .line 27
    .line 28
    iput v5, p0, Lcom/guardsquare/dexguard/setContentView;->Movie:I

    .line 29
    .line 30
    aget-byte v2, v4, v2

    .line 31
    .line 32
    aput-byte v2, p1, v1

    .line 33
    .line 34
    move v1, v3

    .line 35
    goto :goto_0

    .line 36
    :cond_2
    return p3
.end method

.method public final skip(J)J
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    :goto_0
    cmp-long v2, v0, p1

    .line 4
    .line 5
    if-gez v2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    const/4 v3, -0x1

    .line 12
    if-eq v2, v3, :cond_0

    .line 13
    .line 14
    const-wide/16 v2, 0x1

    .line 15
    .line 16
    add-long/2addr v0, v2

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    return-wide v0
.end method
