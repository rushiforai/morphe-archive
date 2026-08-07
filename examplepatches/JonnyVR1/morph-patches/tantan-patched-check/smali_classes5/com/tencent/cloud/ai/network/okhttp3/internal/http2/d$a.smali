.class public final Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Lcom/tencent/cloud/ai/network/okio/g;

.field public final c:I

.field public d:I

.field public e:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

.field public f:I

.field public g:I

.field public h:I


# direct methods
.method public constructor <init>(IILcom/tencent/cloud/ai/network/okio/w;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->a:Ljava/util/List;

    .line 10
    .line 11
    const/16 v0, 0x8

    .line 12
    .line 13
    new-array v0, v0, [Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->e:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 16
    .line 17
    const/4 v0, 0x7

    .line 18
    iput v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->f:I

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    iput v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->g:I

    .line 22
    .line 23
    iput v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->h:I

    .line 24
    .line 25
    iput p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->c:I

    .line 26
    .line 27
    iput p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->d:I

    .line 28
    .line 29
    invoke-static {p3}, Lcom/tencent/cloud/ai/network/okio/n;->a(Lcom/tencent/cloud/ai/network/okio/w;)Lcom/tencent/cloud/ai/network/okio/g;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->b:Lcom/tencent/cloud/ai/network/okio/g;

    .line 34
    .line 35
    return-void
.end method

.method public constructor <init>(ILcom/tencent/cloud/ai/network/okio/w;)V
    .locals 0

    .line 36
    invoke-direct {p0, p1, p1, p2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;-><init>(IILcom/tencent/cloud/ai/network/okio/w;)V

    return-void
.end method


# virtual methods
.method public final a(I)I
    .locals 0

    .line 104
    iget p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->f:I

    add-int/lit8 p0, p0, 0x1

    add-int/2addr p0, p1

    return p0
.end method

.method public a(II)I
    .locals 3

    and-int/2addr p1, p2

    if-ge p1, p2, :cond_0

    return p1

    :cond_0
    const/4 p1, 0x0

    .line 109
    :goto_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->b:Lcom/tencent/cloud/ai/network/okio/g;

    invoke-interface {v0}, Lcom/tencent/cloud/ai/network/okio/g;->readByte()B

    move-result v0

    and-int/lit16 v1, v0, 0xff

    and-int/lit16 v2, v0, 0x80

    if-eqz v2, :cond_1

    and-int/lit8 v0, v0, 0x7f

    shl-int/2addr v0, p1

    add-int/2addr p2, v0

    add-int/lit8 p1, p1, 0x7

    goto :goto_0

    :cond_1
    shl-int p0, v1, p1

    add-int/2addr p2, p0

    return p2
.end method

.method public final a()V
    .locals 2

    .line 105
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->e:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 106
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->e:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->f:I

    const/4 v0, 0x0

    .line 107
    iput v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->g:I

    .line 108
    iput v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->h:I

    return-void
.end method

.method public final a(ILcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    iget v0, p2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;->c:I

    .line 7
    .line 8
    const/4 v1, -0x1

    .line 9
    if-eq p1, v1, :cond_0

    .line 10
    .line 11
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->e:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 12
    .line 13
    iget v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->f:I

    .line 14
    .line 15
    add-int/lit8 v3, v3, 0x1

    .line 16
    .line 17
    add-int/2addr v3, p1

    .line 18
    aget-object v2, v2, v3

    .line 19
    .line 20
    iget v2, v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;->c:I

    .line 21
    .line 22
    sub-int/2addr v0, v2

    .line 23
    :cond_0
    iget v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->d:I

    .line 24
    .line 25
    if-le v0, v2, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->a()V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    iget v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->h:I

    .line 32
    .line 33
    add-int/2addr v3, v0

    .line 34
    sub-int/2addr v3, v2

    .line 35
    invoke-virtual {p0, v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->b(I)I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-ne p1, v1, :cond_3

    .line 40
    .line 41
    iget p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->g:I

    .line 42
    .line 43
    add-int/lit8 p1, p1, 0x1

    .line 44
    .line 45
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->e:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 46
    .line 47
    array-length v2, v1

    .line 48
    if-le p1, v2, :cond_2

    .line 49
    .line 50
    array-length p1, v1

    .line 51
    mul-int/lit8 p1, p1, 0x2

    .line 52
    .line 53
    new-array p1, p1, [Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 54
    .line 55
    array-length v2, v1

    .line 56
    array-length v3, v1

    .line 57
    const/4 v4, 0x0

    .line 58
    invoke-static {v1, v4, p1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 59
    .line 60
    .line 61
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->e:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 62
    .line 63
    array-length v1, v1

    .line 64
    add-int/lit8 v1, v1, -0x1

    .line 65
    .line 66
    iput v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->f:I

    .line 67
    .line 68
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->e:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 69
    .line 70
    :cond_2
    iget p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->f:I

    .line 71
    .line 72
    add-int/lit8 v1, p1, -0x1

    .line 73
    .line 74
    iput v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->f:I

    .line 75
    .line 76
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->e:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 77
    .line 78
    aput-object p2, v1, p1

    .line 79
    .line 80
    iget p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->g:I

    .line 81
    .line 82
    add-int/lit8 p1, p1, 0x1

    .line 83
    .line 84
    iput p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->g:I

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_3
    iget v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->f:I

    .line 88
    .line 89
    add-int/lit8 v1, v1, 0x1

    .line 90
    .line 91
    add-int/2addr v1, p1

    .line 92
    add-int/2addr v1, v2

    .line 93
    add-int/2addr p1, v1

    .line 94
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->e:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 95
    .line 96
    aput-object p2, v1, p1

    .line 97
    .line 98
    :goto_0
    iget p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->h:I

    .line 99
    .line 100
    add-int/2addr p1, v0

    .line 101
    iput p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->h:I

    .line 102
    .line 103
    return-void
.end method

.method public final b(I)I
    .locals 4

    const/4 v0, 0x0

    if-lez p1, :cond_1

    .line 143
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->e:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    :goto_0
    iget v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->f:I

    if-lt v1, v2, :cond_0

    if-lez p1, :cond_0

    .line 144
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->e:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    aget-object v2, v2, v1

    iget v2, v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;->c:I

    sub-int/2addr p1, v2

    .line 145
    iget v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->h:I

    sub-int/2addr v3, v2

    iput v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->h:I

    .line 146
    iget v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->g:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->g:I

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 147
    :cond_0
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->e:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    add-int/lit8 v2, v2, 0x1

    add-int v1, v2, v0

    iget v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->g:I

    invoke-static {p1, v2, p1, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 148
    iget p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->f:I

    add-int/2addr p1, v0

    iput p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->f:I

    :cond_1
    return v0
.end method

.method public b()Lcom/tencent/cloud/ai/network/okio/ByteString;
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->b:Lcom/tencent/cloud/ai/network/okio/g;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/tencent/cloud/ai/network/okio/g;->readByte()B

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    and-int/lit16 v1, v0, 0xff

    .line 8
    .line 9
    const/16 v2, 0x80

    .line 10
    .line 11
    and-int/2addr v0, v2

    .line 12
    const/4 v3, 0x0

    .line 13
    if-ne v0, v2, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v0, v3

    .line 18
    :goto_0
    const/16 v2, 0x7f

    .line 19
    .line 20
    invoke-virtual {p0, v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->a(II)I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v0, :cond_6

    .line 25
    .line 26
    sget-object v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/s;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/s;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->b:Lcom/tencent/cloud/ai/network/okio/g;

    .line 29
    .line 30
    int-to-long v1, v1

    .line 31
    invoke-interface {p0, v1, v2}, Lcom/tencent/cloud/ai/network/okio/g;->g(J)[B

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 36
    .line 37
    .line 38
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    .line 39
    .line 40
    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 41
    .line 42
    .line 43
    iget-object v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/s;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/s$a;

    .line 44
    .line 45
    move v4, v3

    .line 46
    move v5, v4

    .line 47
    :goto_1
    array-length v6, p0

    .line 48
    if-ge v3, v6, :cond_3

    .line 49
    .line 50
    aget-byte v6, p0, v3

    .line 51
    .line 52
    and-int/lit16 v6, v6, 0xff

    .line 53
    .line 54
    shl-int/lit8 v4, v4, 0x8

    .line 55
    .line 56
    or-int/2addr v4, v6

    .line 57
    add-int/lit8 v5, v5, 0x8

    .line 58
    .line 59
    :goto_2
    const/16 v6, 0x8

    .line 60
    .line 61
    if-lt v5, v6, :cond_2

    .line 62
    .line 63
    add-int/lit8 v6, v5, -0x8

    .line 64
    .line 65
    ushr-int v6, v4, v6

    .line 66
    .line 67
    and-int/lit16 v6, v6, 0xff

    .line 68
    .line 69
    iget-object v2, v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/s$a;->a:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/s$a;

    .line 70
    .line 71
    aget-object v2, v2, v6

    .line 72
    .line 73
    iget-object v6, v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/s$a;->a:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/s$a;

    .line 74
    .line 75
    if-nez v6, :cond_1

    .line 76
    .line 77
    iget v6, v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/s$a;->b:I

    .line 78
    .line 79
    invoke-virtual {v1, v6}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 80
    .line 81
    .line 82
    iget v2, v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/s$a;->c:I

    .line 83
    .line 84
    sub-int/2addr v5, v2

    .line 85
    iget-object v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/s;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/s$a;

    .line 86
    .line 87
    goto :goto_2

    .line 88
    :cond_1
    add-int/lit8 v5, v5, -0x8

    .line 89
    .line 90
    goto :goto_2

    .line 91
    :cond_2
    add-int/lit8 v3, v3, 0x1

    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_3
    :goto_3
    if-lez v5, :cond_5

    .line 95
    .line 96
    rsub-int/lit8 p0, v5, 0x8

    .line 97
    .line 98
    shl-int p0, v4, p0

    .line 99
    .line 100
    and-int/lit16 p0, p0, 0xff

    .line 101
    .line 102
    iget-object v2, v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/s$a;->a:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/s$a;

    .line 103
    .line 104
    aget-object p0, v2, p0

    .line 105
    .line 106
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/s$a;->a:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/s$a;

    .line 107
    .line 108
    if-nez v2, :cond_5

    .line 109
    .line 110
    iget v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/s$a;->c:I

    .line 111
    .line 112
    if-le v2, v5, :cond_4

    .line 113
    .line 114
    goto :goto_4

    .line 115
    :cond_4
    iget v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/s$a;->b:I

    .line 116
    .line 117
    invoke-virtual {v1, v2}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 118
    .line 119
    .line 120
    iget p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/s$a;->c:I

    .line 121
    .line 122
    sub-int/2addr v5, p0

    .line 123
    iget-object v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/s;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/s$a;

    .line 124
    .line 125
    goto :goto_3

    .line 126
    :cond_5
    :goto_4
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    invoke-static {p0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->of([B)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    return-object p0

    .line 135
    :cond_6
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->b:Lcom/tencent/cloud/ai/network/okio/g;

    .line 136
    .line 137
    int-to-long v0, v1

    .line 138
    invoke-interface {p0, v0, v1}, Lcom/tencent/cloud/ai/network/okio/g;->a(J)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    return-object p0
.end method

.method public final c(I)Lcom/tencent/cloud/ai/network/okio/ByteString;
    .locals 2

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    sget-object v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d;->a:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 4
    .line 5
    array-length v1, v0

    .line 6
    add-int/lit8 v1, v1, -0x1

    .line 7
    .line 8
    if-gt p1, v1, :cond_0

    .line 9
    .line 10
    aget-object p0, v0, p1

    .line 11
    .line 12
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;->a:Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    sget-object v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d;->a:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 16
    .line 17
    array-length v0, v0

    .line 18
    sub-int v0, p1, v0

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->a(I)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-ltz v0, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->e:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 27
    .line 28
    array-length v1, p0

    .line 29
    if-ge v0, v1, :cond_1

    .line 30
    .line 31
    aget-object p0, p0, v0

    .line 32
    .line 33
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;->a:Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 34
    .line 35
    return-object p0

    .line 36
    :cond_1
    const-string p0, "Header index too large "

    .line 37
    .line 38
    add-int/lit8 p1, p1, 0x1

    .line 39
    .line 40
    invoke-static {p0, p1}, Ll/yll;->a(Ljava/lang/String;I)V

    .line 41
    .line 42
    .line 43
    const/4 p0, 0x0

    .line 44
    return-object p0
.end method
