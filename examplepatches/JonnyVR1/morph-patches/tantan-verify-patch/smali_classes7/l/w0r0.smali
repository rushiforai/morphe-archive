.class public Ll/w0r0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static g:Ljava/lang/String;

.field private static h:J

.field private static final i:[B


# instance fields
.field private a:Ll/fzq0;

.field private b:S

.field private c:[B

.field d:Ljava/lang/String;

.field e:I

.field private final f:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x5

    .line 7
    invoke-static {v1}, Ll/n2r0;->a(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, "-"

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sput-object v0, Ll/w0r0;->g:Ljava/lang/String;

    .line 24
    .line 25
    const-wide/16 v0, 0x0

    .line 26
    .line 27
    sput-wide v0, Ll/w0r0;->h:J

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    new-array v0, v0, [B

    .line 31
    .line 32
    sput-object v0, Ll/w0r0;->i:[B

    .line 33
    .line 34
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    iput-short v0, p0, Ll/w0r0;->b:S

    .line 6
    .line 7
    sget-object v0, Ll/w0r0;->i:[B

    .line 8
    .line 9
    iput-object v0, p0, Ll/w0r0;->c:[B

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Ll/w0r0;->d:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    iput-wide v0, p0, Ll/w0r0;->f:J

    .line 19
    .line 20
    new-instance v0, Ll/fzq0;

    .line 21
    .line 22
    invoke-direct {v0}, Ll/fzq0;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Ll/w0r0;->a:Ll/fzq0;

    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    iput v0, p0, Ll/w0r0;->e:I

    .line 29
    .line 30
    return-void
.end method

.method public constructor <init>(Ll/fzq0;S[B)V
    .locals 3

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x2

    .line 32
    iput-short v0, p0, Ll/w0r0;->b:S

    .line 33
    sget-object v1, Ll/w0r0;->i:[B

    iput-object v1, p0, Ll/w0r0;->c:[B

    const/4 v1, 0x0

    .line 34
    iput-object v1, p0, Ll/w0r0;->d:Ljava/lang/String;

    .line 35
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iput-wide v1, p0, Ll/w0r0;->f:J

    .line 36
    iput-object p1, p0, Ll/w0r0;->a:Ll/fzq0;

    .line 37
    iput-short p2, p0, Ll/w0r0;->b:S

    .line 38
    iput-object p3, p0, Ll/w0r0;->c:[B

    .line 39
    iput v0, p0, Ll/w0r0;->e:I

    return-void
.end method

.method public static declared-synchronized C()Ljava/lang/String;
    .locals 6

    .line 1
    const-class v0, Ll/w0r0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    sget-object v2, Ll/w0r0;->g:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    sget-wide v2, Ll/w0r0;->h:J

    .line 15
    .line 16
    const-wide/16 v4, 0x1

    .line 17
    .line 18
    add-long/2addr v4, v2

    .line 19
    sput-wide v4, Ll/w0r0;->h:J

    .line 20
    .line 21
    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    monitor-exit v0

    .line 33
    return-object v1

    .line 34
    :catchall_0
    move-exception v1

    .line 35
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 36
    throw v1
.end method

.method public static e(Ljava/nio/ByteBuffer;)Ll/w0r0;
    .locals 7

    .line 1
    :try_start_0
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->getShort(I)S

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x2

    .line 11
    invoke-virtual {p0, v2}, Ljava/nio/ByteBuffer;->getShort(I)S

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    const/4 v3, 0x4

    .line 16
    invoke-virtual {p0, v3}, Ljava/nio/ByteBuffer;->getInt(I)I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    new-instance v4, Ll/fzq0;

    .line 21
    .line 22
    invoke-direct {v4}, Ll/fzq0;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->array()[B

    .line 26
    .line 27
    .line 28
    move-result-object v5

    .line 29
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->arrayOffset()I

    .line 30
    .line 31
    .line 32
    move-result v6

    .line 33
    add-int/lit8 v6, v6, 0x8

    .line 34
    .line 35
    invoke-virtual {v4, v5, v6, v2}, Ll/e0r0;->d([BII)Ll/e0r0;

    .line 36
    .line 37
    .line 38
    new-array v5, v3, [B

    .line 39
    .line 40
    add-int/lit8 v2, v2, 0x8

    .line 41
    .line 42
    invoke-virtual {p0, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, v5, v0, v3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 46
    .line 47
    .line 48
    new-instance p0, Ll/w0r0;

    .line 49
    .line 50
    invoke-direct {p0, v4, v1, v5}, Ll/w0r0;-><init>(Ll/fzq0;S[B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    .line 52
    .line 53
    return-object p0

    .line 54
    :catch_0
    move-exception p0

    .line 55
    new-instance v0, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    const-string v1, "read Blob err :"

    .line 58
    .line 59
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    const-string p0, "Malformed Input"

    .line 77
    .line 78
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    const/4 p0, 0x0

    .line 82
    return-object p0
.end method

.method public static f(Ll/g2r0;Ljava/lang/String;)Ll/w0r0;
    .locals 4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    new-instance v0, Ll/w0r0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/w0r0;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Ll/g2r0;->m()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 11
    .line 12
    .line 13
    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    goto :goto_0

    .line 15
    :catch_0
    move-exception v1

    .line 16
    new-instance v2, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v3, "Blob parse chid err "

    .line 19
    .line 20
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-static {v1}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    const/4 v1, 0x1

    .line 38
    :goto_0
    invoke-virtual {v0, v1}, Ll/w0r0;->h(I)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ll/g2r0;->l()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v0, v1}, Ll/w0r0;->k(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Ll/g2r0;->q()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0, v1}, Ll/w0r0;->B(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Ll/g2r0;->s()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v0, v1}, Ll/w0r0;->v(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    const-string v1, "XMLMSG"

    .line 63
    .line 64
    const/4 v2, 0x0

    .line 65
    invoke-virtual {v0, v1, v2}, Ll/w0r0;->l(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    :try_start_1
    invoke-virtual {p0}, Ll/g2r0;->d()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    const-string v1, "utf8"

    .line 73
    .line 74
    invoke-virtual {p0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {v0, p0, p1}, Ll/w0r0;->n([BLjava/lang/String;)V

    .line 79
    .line 80
    .line 81
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    if-eqz p0, :cond_0

    .line 86
    .line 87
    const/4 p0, 0x3

    .line 88
    invoke-virtual {v0, p0}, Ll/w0r0;->m(S)V

    .line 89
    .line 90
    .line 91
    goto :goto_2

    .line 92
    :catch_1
    move-exception p0

    .line 93
    goto :goto_1

    .line 94
    :cond_0
    const/4 p0, 0x2

    .line 95
    invoke-virtual {v0, p0}, Ll/w0r0;->m(S)V

    .line 96
    .line 97
    .line 98
    const-string p0, "SECMSG"

    .line 99
    .line 100
    invoke-virtual {v0, p0, v2}, Ll/w0r0;->l(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_1

    .line 101
    .line 102
    .line 103
    goto :goto_2

    .line 104
    :goto_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 105
    .line 106
    const-string v1, "Blob setPayload err\uff1a "

    .line 107
    .line 108
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    :goto_2
    return-object v0
.end method


# virtual methods
.method public A(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w0r0;->a:Ll/fzq0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/fzq0;->B(J)Ll/fzq0;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public B(Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string v0, "@"

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    :try_start_0
    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 19
    .line 20
    .line 21
    move-result-wide v1

    .line 22
    const-string v3, "/"

    .line 23
    .line 24
    invoke-virtual {p1, v3, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    add-int/lit8 v0, v0, 0x1

    .line 29
    .line 30
    invoke-virtual {p1, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    add-int/lit8 v3, v3, 0x1

    .line 35
    .line 36
    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iget-object v3, p0, Ll/w0r0;->a:Ll/fzq0;

    .line 41
    .line 42
    invoke-virtual {v3, v1, v2}, Ll/fzq0;->n(J)Ll/fzq0;

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Ll/w0r0;->a:Ll/fzq0;

    .line 46
    .line 47
    invoke-virtual {v1, v0}, Ll/fzq0;->o(Ljava/lang/String;)Ll/fzq0;

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Ll/w0r0;->a:Ll/fzq0;

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Ll/fzq0;->v(Ljava/lang/String;)Ll/fzq0;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :catch_0
    move-exception p0

    .line 57
    new-instance p1, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    const-string v0, "Blob parse user err "

    .line 60
    .line 61
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    :cond_0
    return-void
.end method

.method public D()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/w0r0;->a:Ll/fzq0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/fzq0;->K()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "ID_NOT_AVAILABLE"

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return-object p0

    .line 17
    :cond_0
    iget-object v1, p0, Ll/w0r0;->a:Ll/fzq0;

    .line 18
    .line 19
    invoke-virtual {v1}, Ll/fzq0;->R()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_1

    .line 24
    .line 25
    invoke-static {}, Ll/w0r0;->C()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object p0, p0, Ll/w0r0;->a:Ll/fzq0;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Ll/fzq0;->L(Ljava/lang/String;)Ll/fzq0;

    .line 32
    .line 33
    .line 34
    :cond_1
    return-object v0
.end method

.method public E()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w0r0;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public F()Ljava/lang/String;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/w0r0;->a:Ll/fzq0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/fzq0;->w()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Ll/w0r0;->a:Ll/fzq0;

    .line 15
    .line 16
    invoke-virtual {v1}, Ll/fzq0;->j()J

    .line 17
    .line 18
    .line 19
    move-result-wide v1

    .line 20
    invoke-static {v1, v2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v1, "@"

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Ll/w0r0;->a:Ll/fzq0;

    .line 33
    .line 34
    invoke-virtual {v1}, Ll/fzq0;->k()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v1, "/"

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Ll/w0r0;->a:Ll/fzq0;

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/fzq0;->s()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0

    .line 60
    :cond_0
    const/4 p0, 0x0

    .line 61
    return-object p0
.end method

.method public a()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w0r0;->a:Ll/fzq0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/fzq0;->x()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public b()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/w0r0;->f:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w0r0;->a:Ll/fzq0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/fzq0;->z()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public d(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;
    .locals 5

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/w0r0;->x()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    :cond_0
    iget-short v0, p0, Ll/w0r0;->b:S

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/w0r0;->a:Ll/fzq0;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/fzq0;->a()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    int-to-short v0, v0

    .line 23
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/w0r0;->c:[B

    .line 27
    .line 28
    array-length v0, v0

    .line 29
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1}, Ljava/nio/Buffer;->position()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    iget-object v1, p0, Ll/w0r0;->a:Ll/fzq0;

    .line 37
    .line 38
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->arrayOffset()I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    add-int/2addr v3, v0

    .line 47
    iget-object v4, p0, Ll/w0r0;->a:Ll/fzq0;

    .line 48
    .line 49
    invoke-virtual {v4}, Ll/fzq0;->a()I

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    invoke-virtual {v1, v2, v3, v4}, Ll/e0r0;->f([BII)V

    .line 54
    .line 55
    .line 56
    iget-object v1, p0, Ll/w0r0;->a:Ll/fzq0;

    .line 57
    .line 58
    invoke-virtual {v1}, Ll/fzq0;->a()I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    add-int/2addr v0, v1

    .line 63
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Ll/w0r0;->c:[B

    .line 67
    .line 68
    invoke-virtual {p1, p0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 69
    .line 70
    .line 71
    return-object p1
.end method

.method public g()S
    .locals 0

    .line 1
    iget-short p0, p0, Ll/w0r0;->b:S

    .line 2
    .line 3
    return p0
.end method

.method public h(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w0r0;->a:Ll/fzq0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/fzq0;->m(I)Ll/fzq0;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w0r0;->a:Ll/fzq0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/fzq0;->n(J)Ll/fzq0;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public j(JLjava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/w0r0;->a:Ll/fzq0;

    .line 8
    .line 9
    invoke-virtual {v0, p1, p2}, Ll/fzq0;->n(J)Ll/fzq0;

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-nez p1, :cond_1

    .line 17
    .line 18
    iget-object p1, p0, Ll/w0r0;->a:Ll/fzq0;

    .line 19
    .line 20
    invoke-virtual {p1, p3}, Ll/fzq0;->o(Ljava/lang/String;)Ll/fzq0;

    .line 21
    .line 22
    .line 23
    :cond_1
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-nez p1, :cond_2

    .line 28
    .line 29
    iget-object p0, p0, Ll/w0r0;->a:Ll/fzq0;

    .line 30
    .line 31
    invoke-virtual {p0, p4}, Ll/fzq0;->v(Ljava/lang/String;)Ll/fzq0;

    .line 32
    .line 33
    .line 34
    :cond_2
    return-void
.end method

.method public k(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w0r0;->a:Ll/fzq0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/fzq0;->L(Ljava/lang/String;)Ll/fzq0;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public l(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Ll/w0r0;->a:Ll/fzq0;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ll/fzq0;->C(Ljava/lang/String;)Ll/fzq0;

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/w0r0;->a:Ll/fzq0;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/fzq0;->l()Ll/fzq0;

    .line 15
    .line 16
    .line 17
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Ll/w0r0;->a:Ll/fzq0;

    .line 24
    .line 25
    invoke-virtual {p0, p2}, Ll/fzq0;->H(Ljava/lang/String;)Ll/fzq0;

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void

    .line 29
    :cond_1
    const-string p0, "command should not be empty"

    .line 30
    .line 31
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public m(S)V
    .locals 0

    .line 1
    iput-short p1, p0, Ll/w0r0;->b:S

    .line 2
    .line 3
    return-void
.end method

.method public n([BLjava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/w0r0;->a:Ll/fzq0;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-virtual {v1, v0}, Ll/fzq0;->A(I)Ll/fzq0;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/w0r0;->D()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {p2, v0}, Lcom/xiaomi/push/service/ar;->a(Ljava/lang/String;Ljava/lang/String;)[B

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-static {p2, p1}, Lcom/xiaomi/push/service/ar;->a([B[B)[B

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-object p1, p0, Ll/w0r0;->c:[B

    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    const/4 p2, 0x0

    .line 29
    invoke-virtual {v1, p2}, Ll/fzq0;->A(I)Ll/fzq0;

    .line 30
    .line 31
    .line 32
    iput-object p1, p0, Ll/w0r0;->c:[B

    .line 33
    .line 34
    return-void
.end method

.method public o()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w0r0;->a:Ll/fzq0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/fzq0;->U()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public p()[B
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w0r0;->c:[B

    .line 2
    .line 3
    invoke-static {p0, v0}, Ll/x0r0;->a(Ll/w0r0;[B)[B

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public q(Ljava/lang/String;)[B
    .locals 2

    .line 1
    iget-object v0, p0, Ll/w0r0;->a:Ll/fzq0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/fzq0;->J()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/w0r0;->D()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {p1, v0}, Lcom/xiaomi/push/service/ar;->a(Ljava/lang/String;Ljava/lang/String;)[B

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object v0, p0, Ll/w0r0;->c:[B

    .line 19
    .line 20
    invoke-static {p1, v0}, Lcom/xiaomi/push/service/ar;->a([B[B)[B

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-static {p0, p1}, Ll/x0r0;->a(Ll/w0r0;[B)[B

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0

    .line 29
    :cond_0
    iget-object p1, p0, Ll/w0r0;->a:Ll/fzq0;

    .line 30
    .line 31
    invoke-virtual {p1}, Ll/fzq0;->J()I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-nez p1, :cond_1

    .line 36
    .line 37
    iget-object p1, p0, Ll/w0r0;->c:[B

    .line 38
    .line 39
    invoke-static {p0, p1}, Ll/x0r0;->a(Ll/w0r0;[B)[B

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0

    .line 44
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    const-string v0, "unknow cipher = "

    .line 47
    .line 48
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/w0r0;->a:Ll/fzq0;

    .line 52
    .line 53
    invoke-virtual {v0}, Ll/fzq0;->J()I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-static {p1}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Ll/w0r0;->c:[B

    .line 68
    .line 69
    invoke-static {p0, p1}, Ll/x0r0;->a(Ll/w0r0;[B)[B

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    return-object p0
.end method

.method public r()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w0r0;->a:Ll/fzq0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/fzq0;->N()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public s()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/w0r0;->a:Ll/fzq0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/fzq0;->r()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public t()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w0r0;->a:Ll/fzq0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/fzq0;->F()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Blob [chid="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/w0r0;->a()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, "; Id="

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ll/w0r0;->D()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-static {v1}, Lcom/xiaomi/push/service/aj;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v1, "; cmd="

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/w0r0;->c()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, "; type="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Ll/w0r0;->g()S

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string v1, "; from="

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Ll/w0r0;->F()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string p0, " ]"

    .line 68
    .line 69
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    return-object p0
.end method

.method public u(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w0r0;->a:Ll/fzq0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/fzq0;->u(J)Ll/fzq0;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public v(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w0r0;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public w()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w0r0;->a:Ll/fzq0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/fzq0;->W()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public x()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w0r0;->a:Ll/fzq0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/fzq0;->i()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-int/lit8 v0, v0, 0x8

    .line 8
    .line 9
    iget-object p0, p0, Ll/w0r0;->c:[B

    .line 10
    .line 11
    array-length p0, p0

    .line 12
    add-int/2addr v0, p0

    .line 13
    return v0
.end method

.method public y()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/w0r0;->a:Ll/fzq0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/fzq0;->j()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public z()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w0r0;->a:Ll/fzq0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/fzq0;->O()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
