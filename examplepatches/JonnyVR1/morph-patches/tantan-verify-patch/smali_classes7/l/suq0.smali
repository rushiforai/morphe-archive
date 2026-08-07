.class public final Ll/suq0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final a:[B

.field private b:I

.field private c:I

.field private d:I

.field private final e:Ljava/io/InputStream;

.field private f:I

.field private g:I

.field private h:I

.field private i:I

.field private j:I

.field private k:I


# direct methods
.method private constructor <init>(Ljava/io/InputStream;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7fffffff

    .line 5
    .line 6
    .line 7
    iput v0, p0, Ll/suq0;->h:I

    .line 8
    .line 9
    const/16 v0, 0x40

    .line 10
    .line 11
    iput v0, p0, Ll/suq0;->j:I

    .line 12
    .line 13
    const/high16 v0, 0x4000000

    .line 14
    .line 15
    iput v0, p0, Ll/suq0;->k:I

    .line 16
    .line 17
    const/16 v0, 0x1000

    .line 18
    .line 19
    new-array v0, v0, [B

    .line 20
    .line 21
    iput-object v0, p0, Ll/suq0;->a:[B

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    iput v0, p0, Ll/suq0;->b:I

    .line 25
    .line 26
    iput v0, p0, Ll/suq0;->d:I

    .line 27
    .line 28
    iput-object p1, p0, Ll/suq0;->e:Ljava/io/InputStream;

    .line 29
    .line 30
    return-void
.end method

.method private constructor <init>([BII)V
    .locals 1

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const v0, 0x7fffffff

    .line 32
    iput v0, p0, Ll/suq0;->h:I

    const/16 v0, 0x40

    .line 33
    iput v0, p0, Ll/suq0;->j:I

    const/high16 v0, 0x4000000

    .line 34
    iput v0, p0, Ll/suq0;->k:I

    .line 35
    iput-object p1, p0, Ll/suq0;->a:[B

    add-int/2addr p3, p2

    .line 36
    iput p3, p0, Ll/suq0;->b:I

    .line 37
    iput p2, p0, Ll/suq0;->d:I

    const/4 p1, 0x0

    .line 38
    iput-object p1, p0, Ll/suq0;->e:Ljava/io/InputStream;

    return-void
.end method

.method public static g(Ljava/io/InputStream;)Ll/suq0;
    .locals 1

    .line 1
    new-instance v0, Ll/suq0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/suq0;-><init>(Ljava/io/InputStream;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static h([BII)Ll/suq0;
    .locals 1

    .line 1
    new-instance v0, Ll/suq0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/suq0;-><init>([BII)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private n(Z)Z
    .locals 5

    .line 1
    iget v0, p0, Ll/suq0;->d:I

    .line 2
    .line 3
    iget v1, p0, Ll/suq0;->b:I

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-lt v0, v1, :cond_7

    .line 7
    .line 8
    iget v0, p0, Ll/suq0;->g:I

    .line 9
    .line 10
    add-int v3, v0, v1

    .line 11
    .line 12
    iget v4, p0, Ll/suq0;->h:I

    .line 13
    .line 14
    if-ne v3, v4, :cond_1

    .line 15
    .line 16
    if-nez p1, :cond_0

    .line 17
    .line 18
    return v2

    .line 19
    :cond_0
    invoke-static {}, Lcom/xiaomi/push/d;->a()Lcom/xiaomi/push/d;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    throw p0

    .line 24
    :cond_1
    add-int/2addr v0, v1

    .line 25
    iput v0, p0, Ll/suq0;->g:I

    .line 26
    .line 27
    iput v2, p0, Ll/suq0;->d:I

    .line 28
    .line 29
    iget-object v0, p0, Ll/suq0;->e:Ljava/io/InputStream;

    .line 30
    .line 31
    const/4 v1, -0x1

    .line 32
    if-nez v0, :cond_2

    .line 33
    .line 34
    move v0, v1

    .line 35
    goto :goto_0

    .line 36
    :cond_2
    iget-object v3, p0, Ll/suq0;->a:[B

    .line 37
    .line 38
    invoke-virtual {v0, v3}, Ljava/io/InputStream;->read([B)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    :goto_0
    iput v0, p0, Ll/suq0;->b:I

    .line 43
    .line 44
    if-eqz v0, :cond_6

    .line 45
    .line 46
    if-lt v0, v1, :cond_6

    .line 47
    .line 48
    if-ne v0, v1, :cond_4

    .line 49
    .line 50
    iput v2, p0, Ll/suq0;->b:I

    .line 51
    .line 52
    if-nez p1, :cond_3

    .line 53
    .line 54
    return v2

    .line 55
    :cond_3
    invoke-static {}, Lcom/xiaomi/push/d;->a()Lcom/xiaomi/push/d;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    throw p0

    .line 60
    :cond_4
    invoke-direct {p0}, Ll/suq0;->r()V

    .line 61
    .line 62
    .line 63
    iget p1, p0, Ll/suq0;->g:I

    .line 64
    .line 65
    iget v0, p0, Ll/suq0;->b:I

    .line 66
    .line 67
    add-int/2addr p1, v0

    .line 68
    iget v0, p0, Ll/suq0;->c:I

    .line 69
    .line 70
    add-int/2addr p1, v0

    .line 71
    iget p0, p0, Ll/suq0;->k:I

    .line 72
    .line 73
    if-gt p1, p0, :cond_5

    .line 74
    .line 75
    if-ltz p1, :cond_5

    .line 76
    .line 77
    const/4 p0, 0x1

    .line 78
    return p0

    .line 79
    :cond_5
    invoke-static {}, Lcom/xiaomi/push/d;->h()Lcom/xiaomi/push/d;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    throw p0

    .line 84
    :cond_6
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 85
    .line 86
    iget p0, p0, Ll/suq0;->b:I

    .line 87
    .line 88
    new-instance v0, Ljava/lang/StringBuilder;

    .line 89
    .line 90
    const-string v1, "InputStream#read(byte[]) returned invalid result: "

    .line 91
    .line 92
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    const-string p0, "\nThe InputStream implementation is buggy."

    .line 99
    .line 100
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    throw p1

    .line 111
    :cond_7
    const-string p0, "refillBuffer() called when buffer wasn\'t empty."

    .line 112
    .line 113
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    return v2
.end method

.method private r()V
    .locals 3

    .line 1
    iget v0, p0, Ll/suq0;->b:I

    .line 2
    .line 3
    iget v1, p0, Ll/suq0;->c:I

    .line 4
    .line 5
    add-int/2addr v0, v1

    .line 6
    iput v0, p0, Ll/suq0;->b:I

    .line 7
    .line 8
    iget v1, p0, Ll/suq0;->g:I

    .line 9
    .line 10
    add-int/2addr v1, v0

    .line 11
    iget v2, p0, Ll/suq0;->h:I

    .line 12
    .line 13
    if-le v1, v2, :cond_0

    .line 14
    .line 15
    sub-int/2addr v1, v2

    .line 16
    iput v1, p0, Ll/suq0;->c:I

    .line 17
    .line 18
    sub-int/2addr v0, v1

    .line 19
    iput v0, p0, Ll/suq0;->b:I

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    const/4 v0, 0x0

    .line 23
    iput v0, p0, Ll/suq0;->c:I

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public a()B
    .locals 3

    .line 1
    iget v0, p0, Ll/suq0;->d:I

    .line 2
    .line 3
    iget v1, p0, Ll/suq0;->b:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-direct {p0, v0}, Ll/suq0;->n(Z)Z

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Ll/suq0;->a:[B

    .line 12
    .line 13
    iget v1, p0, Ll/suq0;->d:I

    .line 14
    .line 15
    add-int/lit8 v2, v1, 0x1

    .line 16
    .line 17
    iput v2, p0, Ll/suq0;->d:I

    .line 18
    .line 19
    aget-byte p0, v0, v1

    .line 20
    .line 21
    return p0
.end method

.method public b()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/suq0;->t()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Ll/suq0;->f:I

    .line 9
    .line 10
    return v0

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/suq0;->x()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Ll/suq0;->f:I

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    return v0

    .line 20
    :cond_1
    invoke-static {}, Lcom/xiaomi/push/d;->d()Lcom/xiaomi/push/d;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    throw p0
.end method

.method public c(I)I
    .locals 2

    .line 1
    if-ltz p1, :cond_1

    .line 2
    .line 3
    iget v0, p0, Ll/suq0;->g:I

    .line 4
    .line 5
    iget v1, p0, Ll/suq0;->d:I

    .line 6
    .line 7
    add-int/2addr v0, v1

    .line 8
    add-int/2addr p1, v0

    .line 9
    iget v0, p0, Ll/suq0;->h:I

    .line 10
    .line 11
    if-gt p1, v0, :cond_0

    .line 12
    .line 13
    iput p1, p0, Ll/suq0;->h:I

    .line 14
    .line 15
    invoke-direct {p0}, Ll/suq0;->r()V

    .line 16
    .line 17
    .line 18
    return v0

    .line 19
    :cond_0
    invoke-static {}, Lcom/xiaomi/push/d;->a()Lcom/xiaomi/push/d;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    throw p0

    .line 24
    :cond_1
    invoke-static {}, Lcom/xiaomi/push/d;->b()Lcom/xiaomi/push/d;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    throw p0
.end method

.method public d()J
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/suq0;->v()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method public e()Ljava/lang/String;
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/suq0;->x()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Ll/suq0;->b:I

    .line 6
    .line 7
    iget v2, p0, Ll/suq0;->d:I

    .line 8
    .line 9
    sub-int/2addr v1, v2

    .line 10
    const-string v3, "UTF-8"

    .line 11
    .line 12
    if-gt v0, v1, :cond_0

    .line 13
    .line 14
    if-lez v0, :cond_0

    .line 15
    .line 16
    new-instance v1, Ljava/lang/String;

    .line 17
    .line 18
    iget-object v4, p0, Ll/suq0;->a:[B

    .line 19
    .line 20
    invoke-direct {v1, v4, v2, v0, v3}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget v2, p0, Ll/suq0;->d:I

    .line 24
    .line 25
    add-int/2addr v2, v0

    .line 26
    iput v2, p0, Ll/suq0;->d:I

    .line 27
    .line 28
    return-object v1

    .line 29
    :cond_0
    new-instance v1, Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Ll/suq0;->o(I)[B

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-direct {v1, p0, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-object v1
.end method

.method public f()Ll/asq0;
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/suq0;->x()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Ll/suq0;->b:I

    .line 6
    .line 7
    iget v2, p0, Ll/suq0;->d:I

    .line 8
    .line 9
    sub-int/2addr v1, v2

    .line 10
    if-gt v0, v1, :cond_0

    .line 11
    .line 12
    if-lez v0, :cond_0

    .line 13
    .line 14
    iget-object v1, p0, Ll/suq0;->a:[B

    .line 15
    .line 16
    invoke-static {v1, v2, v0}, Ll/asq0;->c([BII)Ll/asq0;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget v2, p0, Ll/suq0;->d:I

    .line 21
    .line 22
    add-int/2addr v2, v0

    .line 23
    iput v2, p0, Ll/suq0;->d:I

    .line 24
    .line 25
    return-object v1

    .line 26
    :cond_0
    invoke-virtual {p0, v0}, Ll/suq0;->o(I)[B

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {p0}, Ll/asq0;->b([B)Ll/asq0;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method

.method public i()V
    .locals 1

    .line 1
    :cond_0
    invoke-virtual {p0}, Ll/suq0;->b()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/suq0;->m(I)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    :cond_1
    return-void
.end method

.method public j(I)V
    .locals 0

    .line 1
    iget p0, p0, Ll/suq0;->f:I

    .line 2
    .line 3
    if-ne p0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {}, Lcom/xiaomi/push/d;->e()Lcom/xiaomi/push/d;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    throw p0
.end method

.method public k(Ll/e0r0;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/suq0;->x()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Ll/suq0;->i:I

    .line 6
    .line 7
    iget v2, p0, Ll/suq0;->j:I

    .line 8
    .line 9
    if-ge v1, v2, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/suq0;->c(I)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget v1, p0, Ll/suq0;->i:I

    .line 16
    .line 17
    add-int/lit8 v1, v1, 0x1

    .line 18
    .line 19
    iput v1, p0, Ll/suq0;->i:I

    .line 20
    .line 21
    invoke-virtual {p1, p0}, Ll/e0r0;->b(Ll/suq0;)Ll/e0r0;

    .line 22
    .line 23
    .line 24
    const/4 p1, 0x0

    .line 25
    invoke-virtual {p0, p1}, Ll/suq0;->j(I)V

    .line 26
    .line 27
    .line 28
    iget p1, p0, Ll/suq0;->i:I

    .line 29
    .line 30
    add-int/lit8 p1, p1, -0x1

    .line 31
    .line 32
    iput p1, p0, Ll/suq0;->i:I

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Ll/suq0;->s(I)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    invoke-static {}, Lcom/xiaomi/push/d;->g()Lcom/xiaomi/push/d;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    throw p0
.end method

.method public l()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/suq0;->x()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public m(I)Z
    .locals 4

    .line 1
    invoke-static {p1}, Ll/s1r0;->a(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_5

    .line 7
    .line 8
    if-eq v0, v1, :cond_4

    .line 9
    .line 10
    const/4 v2, 0x2

    .line 11
    if-eq v0, v2, :cond_3

    .line 12
    .line 13
    const/4 v2, 0x3

    .line 14
    const/4 v3, 0x4

    .line 15
    if-eq v0, v2, :cond_2

    .line 16
    .line 17
    if-eq v0, v3, :cond_1

    .line 18
    .line 19
    const/4 p1, 0x5

    .line 20
    if-ne v0, p1, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/suq0;->z()I

    .line 23
    .line 24
    .line 25
    return v1

    .line 26
    :cond_0
    invoke-static {}, Lcom/xiaomi/push/d;->f()Lcom/xiaomi/push/d;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    throw p0

    .line 31
    :cond_1
    const/4 p0, 0x0

    .line 32
    return p0

    .line 33
    :cond_2
    invoke-virtual {p0}, Ll/suq0;->i()V

    .line 34
    .line 35
    .line 36
    invoke-static {p1}, Ll/s1r0;->c(I)I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    invoke-static {p1, v3}, Ll/s1r0;->b(II)I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    invoke-virtual {p0, p1}, Ll/suq0;->j(I)V

    .line 45
    .line 46
    .line 47
    return v1

    .line 48
    :cond_3
    invoke-virtual {p0}, Ll/suq0;->x()I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    invoke-virtual {p0, p1}, Ll/suq0;->w(I)V

    .line 53
    .line 54
    .line 55
    return v1

    .line 56
    :cond_4
    invoke-virtual {p0}, Ll/suq0;->y()J

    .line 57
    .line 58
    .line 59
    return v1

    .line 60
    :cond_5
    invoke-virtual {p0}, Ll/suq0;->p()I

    .line 61
    .line 62
    .line 63
    return v1
.end method

.method public o(I)[B
    .locals 12

    .line 1
    if-ltz p1, :cond_9

    .line 2
    .line 3
    iget v0, p0, Ll/suq0;->g:I

    .line 4
    .line 5
    iget v1, p0, Ll/suq0;->d:I

    .line 6
    .line 7
    add-int v2, v0, v1

    .line 8
    .line 9
    add-int/2addr v2, p1

    .line 10
    iget v3, p0, Ll/suq0;->h:I

    .line 11
    .line 12
    if-gt v2, v3, :cond_8

    .line 13
    .line 14
    iget v2, p0, Ll/suq0;->b:I

    .line 15
    .line 16
    sub-int v3, v2, v1

    .line 17
    .line 18
    const/4 v4, 0x0

    .line 19
    if-gt p1, v3, :cond_0

    .line 20
    .line 21
    new-array v0, p1, [B

    .line 22
    .line 23
    iget-object v2, p0, Ll/suq0;->a:[B

    .line 24
    .line 25
    invoke-static {v2, v1, v0, v4, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 26
    .line 27
    .line 28
    iget v1, p0, Ll/suq0;->d:I

    .line 29
    .line 30
    add-int/2addr v1, p1

    .line 31
    iput v1, p0, Ll/suq0;->d:I

    .line 32
    .line 33
    return-object v0

    .line 34
    :cond_0
    const/16 v3, 0x1000

    .line 35
    .line 36
    if-ge p1, v3, :cond_2

    .line 37
    .line 38
    new-array v0, p1, [B

    .line 39
    .line 40
    sub-int/2addr v2, v1

    .line 41
    iget-object v3, p0, Ll/suq0;->a:[B

    .line 42
    .line 43
    invoke-static {v3, v1, v0, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 44
    .line 45
    .line 46
    iget v1, p0, Ll/suq0;->b:I

    .line 47
    .line 48
    iput v1, p0, Ll/suq0;->d:I

    .line 49
    .line 50
    const/4 v1, 0x1

    .line 51
    invoke-direct {p0, v1}, Ll/suq0;->n(Z)Z

    .line 52
    .line 53
    .line 54
    :goto_0
    sub-int v3, p1, v2

    .line 55
    .line 56
    iget v5, p0, Ll/suq0;->b:I

    .line 57
    .line 58
    iget-object v6, p0, Ll/suq0;->a:[B

    .line 59
    .line 60
    if-le v3, v5, :cond_1

    .line 61
    .line 62
    invoke-static {v6, v4, v0, v2, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 63
    .line 64
    .line 65
    iget v3, p0, Ll/suq0;->b:I

    .line 66
    .line 67
    add-int/2addr v2, v3

    .line 68
    iput v3, p0, Ll/suq0;->d:I

    .line 69
    .line 70
    invoke-direct {p0, v1}, Ll/suq0;->n(Z)Z

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_1
    invoke-static {v6, v4, v0, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 75
    .line 76
    .line 77
    iput v3, p0, Ll/suq0;->d:I

    .line 78
    .line 79
    return-object v0

    .line 80
    :cond_2
    add-int/2addr v0, v2

    .line 81
    iput v0, p0, Ll/suq0;->g:I

    .line 82
    .line 83
    iput v4, p0, Ll/suq0;->d:I

    .line 84
    .line 85
    iput v4, p0, Ll/suq0;->b:I

    .line 86
    .line 87
    sub-int/2addr v2, v1

    .line 88
    sub-int v0, p1, v2

    .line 89
    .line 90
    new-instance v5, Ljava/util/Vector;

    .line 91
    .line 92
    invoke-direct {v5}, Ljava/util/Vector;-><init>()V

    .line 93
    .line 94
    .line 95
    :goto_1
    if-lez v0, :cond_6

    .line 96
    .line 97
    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    .line 98
    .line 99
    .line 100
    move-result v6

    .line 101
    new-array v7, v6, [B

    .line 102
    .line 103
    move v8, v4

    .line 104
    :goto_2
    if-ge v8, v6, :cond_5

    .line 105
    .line 106
    iget-object v9, p0, Ll/suq0;->e:Ljava/io/InputStream;

    .line 107
    .line 108
    const/4 v10, -0x1

    .line 109
    if-nez v9, :cond_3

    .line 110
    .line 111
    move v9, v10

    .line 112
    goto :goto_3

    .line 113
    :cond_3
    sub-int v11, v6, v8

    .line 114
    .line 115
    invoke-virtual {v9, v7, v8, v11}, Ljava/io/InputStream;->read([BII)I

    .line 116
    .line 117
    .line 118
    move-result v9

    .line 119
    :goto_3
    if-eq v9, v10, :cond_4

    .line 120
    .line 121
    iget v10, p0, Ll/suq0;->g:I

    .line 122
    .line 123
    add-int/2addr v10, v9

    .line 124
    iput v10, p0, Ll/suq0;->g:I

    .line 125
    .line 126
    add-int/2addr v8, v9

    .line 127
    goto :goto_2

    .line 128
    :cond_4
    invoke-static {}, Lcom/xiaomi/push/d;->a()Lcom/xiaomi/push/d;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    throw p0

    .line 133
    :cond_5
    sub-int/2addr v0, v6

    .line 134
    invoke-virtual {v5, v7}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 135
    .line 136
    .line 137
    goto :goto_1

    .line 138
    :cond_6
    new-array p1, p1, [B

    .line 139
    .line 140
    iget-object p0, p0, Ll/suq0;->a:[B

    .line 141
    .line 142
    invoke-static {p0, v1, p1, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 143
    .line 144
    .line 145
    move p0, v4

    .line 146
    :goto_4
    invoke-virtual {v5}, Ljava/util/Vector;->size()I

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    if-ge p0, v0, :cond_7

    .line 151
    .line 152
    invoke-virtual {v5, p0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    check-cast v0, [B

    .line 157
    .line 158
    array-length v1, v0

    .line 159
    invoke-static {v0, v4, p1, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 160
    .line 161
    .line 162
    array-length v0, v0

    .line 163
    add-int/2addr v2, v0

    .line 164
    add-int/lit8 p0, p0, 0x1

    .line 165
    .line 166
    goto :goto_4

    .line 167
    :cond_7
    return-object p1

    .line 168
    :cond_8
    sub-int/2addr v3, v0

    .line 169
    sub-int/2addr v3, v1

    .line 170
    invoke-virtual {p0, v3}, Ll/suq0;->w(I)V

    .line 171
    .line 172
    .line 173
    invoke-static {}, Lcom/xiaomi/push/d;->a()Lcom/xiaomi/push/d;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    throw p0

    .line 178
    :cond_9
    invoke-static {}, Lcom/xiaomi/push/d;->b()Lcom/xiaomi/push/d;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    throw p0
.end method

.method public p()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/suq0;->x()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public q()J
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/suq0;->v()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method public s(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/suq0;->h:I

    .line 2
    .line 3
    invoke-direct {p0}, Ll/suq0;->r()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public t()Z
    .locals 3

    .line 1
    iget v0, p0, Ll/suq0;->d:I

    .line 2
    .line 3
    iget v1, p0, Ll/suq0;->b:I

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    invoke-direct {p0, v2}, Ll/suq0;->n(Z)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-nez p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    return v2
.end method

.method public u()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/suq0;->x()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public v()J
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    const-wide/16 v1, 0x0

    .line 3
    .line 4
    :goto_0
    const/16 v3, 0x40

    .line 5
    .line 6
    if-ge v0, v3, :cond_1

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/suq0;->a()B

    .line 9
    .line 10
    .line 11
    move-result v3

    .line 12
    and-int/lit8 v4, v3, 0x7f

    .line 13
    .line 14
    int-to-long v4, v4

    .line 15
    shl-long/2addr v4, v0

    .line 16
    or-long/2addr v1, v4

    .line 17
    and-int/lit16 v3, v3, 0x80

    .line 18
    .line 19
    if-nez v3, :cond_0

    .line 20
    .line 21
    return-wide v1

    .line 22
    :cond_0
    add-int/lit8 v0, v0, 0x7

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    invoke-static {}, Lcom/xiaomi/push/d;->c()Lcom/xiaomi/push/d;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    throw p0
.end method

.method public w(I)V
    .locals 4

    .line 1
    if-ltz p1, :cond_5

    .line 2
    .line 3
    iget v0, p0, Ll/suq0;->g:I

    .line 4
    .line 5
    iget v1, p0, Ll/suq0;->d:I

    .line 6
    .line 7
    add-int v2, v0, v1

    .line 8
    .line 9
    add-int/2addr v2, p1

    .line 10
    iget v3, p0, Ll/suq0;->h:I

    .line 11
    .line 12
    if-gt v2, v3, :cond_4

    .line 13
    .line 14
    iget v2, p0, Ll/suq0;->b:I

    .line 15
    .line 16
    sub-int v3, v2, v1

    .line 17
    .line 18
    if-gt p1, v3, :cond_0

    .line 19
    .line 20
    add-int/2addr v1, p1

    .line 21
    iput v1, p0, Ll/suq0;->d:I

    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    sub-int v1, v2, v1

    .line 25
    .line 26
    add-int/2addr v0, v2

    .line 27
    iput v0, p0, Ll/suq0;->g:I

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    iput v0, p0, Ll/suq0;->d:I

    .line 31
    .line 32
    iput v0, p0, Ll/suq0;->b:I

    .line 33
    .line 34
    :goto_0
    if-ge v1, p1, :cond_3

    .line 35
    .line 36
    iget-object v0, p0, Ll/suq0;->e:Ljava/io/InputStream;

    .line 37
    .line 38
    if-nez v0, :cond_1

    .line 39
    .line 40
    const/4 v0, -0x1

    .line 41
    goto :goto_1

    .line 42
    :cond_1
    sub-int v2, p1, v1

    .line 43
    .line 44
    int-to-long v2, v2

    .line 45
    invoke-virtual {v0, v2, v3}, Ljava/io/InputStream;->skip(J)J

    .line 46
    .line 47
    .line 48
    move-result-wide v2

    .line 49
    long-to-int v0, v2

    .line 50
    :goto_1
    if-lez v0, :cond_2

    .line 51
    .line 52
    add-int/2addr v1, v0

    .line 53
    iget v2, p0, Ll/suq0;->g:I

    .line 54
    .line 55
    add-int/2addr v2, v0

    .line 56
    iput v2, p0, Ll/suq0;->g:I

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_2
    invoke-static {}, Lcom/xiaomi/push/d;->a()Lcom/xiaomi/push/d;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    throw p0

    .line 64
    :cond_3
    return-void

    .line 65
    :cond_4
    sub-int/2addr v3, v0

    .line 66
    sub-int/2addr v3, v1

    .line 67
    invoke-virtual {p0, v3}, Ll/suq0;->w(I)V

    .line 68
    .line 69
    .line 70
    invoke-static {}, Lcom/xiaomi/push/d;->a()Lcom/xiaomi/push/d;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    throw p0

    .line 75
    :cond_5
    invoke-static {}, Lcom/xiaomi/push/d;->b()Lcom/xiaomi/push/d;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    throw p0
.end method

.method public x()I
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/suq0;->a()B

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-ltz v0, :cond_0

    .line 6
    .line 7
    return v0

    .line 8
    :cond_0
    and-int/lit8 v0, v0, 0x7f

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/suq0;->a()B

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-ltz v1, :cond_1

    .line 15
    .line 16
    shl-int/lit8 p0, v1, 0x7

    .line 17
    .line 18
    :goto_0
    or-int/2addr p0, v0

    .line 19
    return p0

    .line 20
    :cond_1
    and-int/lit8 v1, v1, 0x7f

    .line 21
    .line 22
    shl-int/lit8 v1, v1, 0x7

    .line 23
    .line 24
    or-int/2addr v0, v1

    .line 25
    invoke-virtual {p0}, Ll/suq0;->a()B

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-ltz v1, :cond_2

    .line 30
    .line 31
    shl-int/lit8 p0, v1, 0xe

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    and-int/lit8 v1, v1, 0x7f

    .line 35
    .line 36
    shl-int/lit8 v1, v1, 0xe

    .line 37
    .line 38
    or-int/2addr v0, v1

    .line 39
    invoke-virtual {p0}, Ll/suq0;->a()B

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-ltz v1, :cond_3

    .line 44
    .line 45
    shl-int/lit8 p0, v1, 0x15

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_3
    and-int/lit8 v1, v1, 0x7f

    .line 49
    .line 50
    shl-int/lit8 v1, v1, 0x15

    .line 51
    .line 52
    or-int/2addr v0, v1

    .line 53
    invoke-virtual {p0}, Ll/suq0;->a()B

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    shl-int/lit8 v2, v1, 0x1c

    .line 58
    .line 59
    or-int/2addr v0, v2

    .line 60
    if-gez v1, :cond_6

    .line 61
    .line 62
    const/4 v1, 0x0

    .line 63
    :goto_1
    const/4 v2, 0x5

    .line 64
    if-ge v1, v2, :cond_5

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/suq0;->a()B

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    if-ltz v2, :cond_4

    .line 71
    .line 72
    goto :goto_2

    .line 73
    :cond_4
    add-int/lit8 v1, v1, 0x1

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_5
    invoke-static {}, Lcom/xiaomi/push/d;->c()Lcom/xiaomi/push/d;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    throw p0

    .line 81
    :cond_6
    :goto_2
    return v0
.end method

.method public y()J
    .locals 12

    .line 1
    invoke-virtual {p0}, Ll/suq0;->a()B

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Ll/suq0;->a()B

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0}, Ll/suq0;->a()B

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-virtual {p0}, Ll/suq0;->a()B

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    invoke-virtual {p0}, Ll/suq0;->a()B

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    invoke-virtual {p0}, Ll/suq0;->a()B

    .line 22
    .line 23
    .line 24
    move-result v5

    .line 25
    invoke-virtual {p0}, Ll/suq0;->a()B

    .line 26
    .line 27
    .line 28
    move-result v6

    .line 29
    invoke-virtual {p0}, Ll/suq0;->a()B

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    int-to-long v7, v0

    .line 34
    const-wide/16 v9, 0xff

    .line 35
    .line 36
    and-long/2addr v7, v9

    .line 37
    int-to-long v0, v1

    .line 38
    and-long/2addr v0, v9

    .line 39
    const/16 v11, 0x8

    .line 40
    .line 41
    shl-long/2addr v0, v11

    .line 42
    or-long/2addr v0, v7

    .line 43
    int-to-long v7, v2

    .line 44
    and-long/2addr v7, v9

    .line 45
    const/16 v2, 0x10

    .line 46
    .line 47
    shl-long/2addr v7, v2

    .line 48
    or-long/2addr v0, v7

    .line 49
    int-to-long v2, v3

    .line 50
    and-long/2addr v2, v9

    .line 51
    const/16 v7, 0x18

    .line 52
    .line 53
    shl-long/2addr v2, v7

    .line 54
    or-long/2addr v0, v2

    .line 55
    int-to-long v2, v4

    .line 56
    and-long/2addr v2, v9

    .line 57
    const/16 v4, 0x20

    .line 58
    .line 59
    shl-long/2addr v2, v4

    .line 60
    or-long/2addr v0, v2

    .line 61
    int-to-long v2, v5

    .line 62
    and-long/2addr v2, v9

    .line 63
    const/16 v4, 0x28

    .line 64
    .line 65
    shl-long/2addr v2, v4

    .line 66
    or-long/2addr v0, v2

    .line 67
    int-to-long v2, v6

    .line 68
    and-long/2addr v2, v9

    .line 69
    const/16 v4, 0x30

    .line 70
    .line 71
    shl-long/2addr v2, v4

    .line 72
    or-long/2addr v0, v2

    .line 73
    int-to-long v2, p0

    .line 74
    and-long/2addr v2, v9

    .line 75
    const/16 p0, 0x38

    .line 76
    .line 77
    shl-long/2addr v2, p0

    .line 78
    or-long/2addr v0, v2

    .line 79
    return-wide v0
.end method

.method public z()I
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/suq0;->a()B

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Ll/suq0;->a()B

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0}, Ll/suq0;->a()B

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-virtual {p0}, Ll/suq0;->a()B

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    and-int/lit16 v0, v0, 0xff

    .line 18
    .line 19
    and-int/lit16 v1, v1, 0xff

    .line 20
    .line 21
    shl-int/lit8 v1, v1, 0x8

    .line 22
    .line 23
    or-int/2addr v0, v1

    .line 24
    and-int/lit16 v1, v2, 0xff

    .line 25
    .line 26
    shl-int/lit8 v1, v1, 0x10

    .line 27
    .line 28
    or-int/2addr v0, v1

    .line 29
    and-int/lit16 p0, p0, 0xff

    .line 30
    .line 31
    shl-int/lit8 p0, p0, 0x18

    .line 32
    .line 33
    or-int/2addr p0, v0

    .line 34
    return p0
.end method
