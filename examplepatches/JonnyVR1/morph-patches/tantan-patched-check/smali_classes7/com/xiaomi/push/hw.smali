.class public Lcom/xiaomi/push/hw;
.super Ll/w3r0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/push/hw$a;
    }
.end annotation


# static fields
.field private static final n:Ll/z3r0;


# instance fields
.field protected b:Z

.field protected c:Z

.field protected d:I

.field protected e:Z

.field private f:[B

.field private g:[B

.field private h:[B

.field private i:[B

.field private j:[B

.field private k:[B

.field private l:[B

.field private m:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/z3r0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/z3r0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/xiaomi/push/hw;->n:Ll/z3r0;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Ll/e4r0;ZZ)V
    .locals 4

    .line 1
    invoke-direct {p0, p1}, Ll/w3r0;-><init>(Ll/e4r0;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/xiaomi/push/hw;->e:Z

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    new-array v0, p1, [B

    .line 9
    .line 10
    iput-object v0, p0, Lcom/xiaomi/push/hw;->f:[B

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    new-array v1, v0, [B

    .line 14
    .line 15
    iput-object v1, p0, Lcom/xiaomi/push/hw;->g:[B

    .line 16
    .line 17
    const/4 v1, 0x4

    .line 18
    new-array v2, v1, [B

    .line 19
    .line 20
    iput-object v2, p0, Lcom/xiaomi/push/hw;->h:[B

    .line 21
    .line 22
    const/16 v2, 0x8

    .line 23
    .line 24
    new-array v3, v2, [B

    .line 25
    .line 26
    iput-object v3, p0, Lcom/xiaomi/push/hw;->i:[B

    .line 27
    .line 28
    new-array p1, p1, [B

    .line 29
    .line 30
    iput-object p1, p0, Lcom/xiaomi/push/hw;->j:[B

    .line 31
    .line 32
    new-array p1, v0, [B

    .line 33
    .line 34
    iput-object p1, p0, Lcom/xiaomi/push/hw;->k:[B

    .line 35
    .line 36
    new-array p1, v1, [B

    .line 37
    .line 38
    iput-object p1, p0, Lcom/xiaomi/push/hw;->l:[B

    .line 39
    .line 40
    new-array p1, v2, [B

    .line 41
    .line 42
    iput-object p1, p0, Lcom/xiaomi/push/hw;->m:[B

    .line 43
    .line 44
    iput-boolean p2, p0, Lcom/xiaomi/push/hw;->b:Z

    .line 45
    .line 46
    iput-boolean p3, p0, Lcom/xiaomi/push/hw;->c:Z

    .line 47
    .line 48
    return-void
.end method

.method private J([BII)I
    .locals 0

    .line 1
    invoke-virtual {p0, p3}, Lcom/xiaomi/push/hw;->M(I)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/w3r0;->a:Ll/e4r0;

    .line 5
    .line 6
    invoke-virtual {p0, p1, p2, p3}, Ll/e4r0;->g([BII)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method


# virtual methods
.method public A()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/xiaomi/push/hw;->n(B)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public B()V
    .locals 0

    .line 1
    return-void
.end method

.method public C()V
    .locals 0

    .line 1
    return-void
.end method

.method public D()V
    .locals 0

    .line 1
    return-void
.end method

.method public E()V
    .locals 0

    .line 1
    return-void
.end method

.method public F()V
    .locals 0

    .line 1
    return-void
.end method

.method public G()V
    .locals 0

    .line 1
    return-void
.end method

.method public H()V
    .locals 0

    .line 1
    return-void
.end method

.method public K(I)Ljava/lang/String;
    .locals 2

    .line 1
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/hw;->M(I)V

    .line 2
    .line 3
    .line 4
    new-array v0, p1, [B

    .line 5
    .line 6
    iget-object p0, p0, Ll/w3r0;->a:Ll/e4r0;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {p0, v0, v1, p1}, Ll/e4r0;->g([BII)I

    .line 10
    .line 11
    .line 12
    new-instance p0, Ljava/lang/String;

    .line 13
    .line 14
    const-string p1, "UTF-8"

    .line 15
    .line 16
    invoke-direct {p0, v0, p1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    .line 19
    return-object p0

    .line 20
    :catch_0
    new-instance p0, Lcom/xiaomi/push/hu;

    .line 21
    .line 22
    const-string p1, "JVM DOES NOT SUPPORT UTF-8"

    .line 23
    .line 24
    invoke-direct {p0, p1}, Lcom/xiaomi/push/hu;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    throw p0
.end method

.method public L(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/xiaomi/push/hw;->d:I

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Lcom/xiaomi/push/hw;->e:Z

    .line 5
    .line 6
    return-void
.end method

.method public M(I)V
    .locals 2

    .line 1
    if-ltz p1, :cond_2

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/xiaomi/push/hw;->e:Z

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget v0, p0, Lcom/xiaomi/push/hw;->d:I

    .line 8
    .line 9
    sub-int/2addr v0, p1

    .line 10
    iput v0, p0, Lcom/xiaomi/push/hw;->d:I

    .line 11
    .line 12
    if-ltz v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    new-instance p0, Lcom/xiaomi/push/hu;

    .line 16
    .line 17
    new-instance v0, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v1, "Message length exceeded: "

    .line 20
    .line 21
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-direct {p0, p1}, Lcom/xiaomi/push/hu;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    throw p0

    .line 35
    :cond_1
    :goto_0
    return-void

    .line 36
    :cond_2
    new-instance p0, Lcom/xiaomi/push/hu;

    .line 37
    .line 38
    new-instance v0, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    const-string v1, "Negative length: "

    .line 41
    .line 42
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-direct {p0, p1}, Lcom/xiaomi/push/hu;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    throw p0
.end method

.method public a()B
    .locals 3

    .line 1
    iget-object v0, p0, Ll/w3r0;->a:Ll/e4r0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/e4r0;->f()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-lt v0, v1, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/w3r0;->a:Ll/e4r0;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/e4r0;->d()[B

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v2, p0, Ll/w3r0;->a:Ll/e4r0;

    .line 17
    .line 18
    invoke-virtual {v2}, Ll/e4r0;->e()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    aget-byte v0, v0, v2

    .line 23
    .line 24
    iget-object p0, p0, Ll/w3r0;->a:Ll/e4r0;

    .line 25
    .line 26
    invoke-virtual {p0, v1}, Ll/e4r0;->b(I)V

    .line 27
    .line 28
    .line 29
    return v0

    .line 30
    :cond_0
    iget-object v0, p0, Lcom/xiaomi/push/hw;->j:[B

    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    invoke-direct {p0, v0, v2, v1}, Lcom/xiaomi/push/hw;->J([BII)I

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/xiaomi/push/hw;->j:[B

    .line 37
    .line 38
    aget-byte p0, p0, v2

    .line 39
    .line 40
    return p0
.end method

.method public b()D
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/xiaomi/push/hw;->d()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {v0, v1}, Ljava/lang/Double;->longBitsToDouble(J)D

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public c()I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/xiaomi/push/hw;->l:[B

    .line 2
    .line 3
    iget-object v1, p0, Ll/w3r0;->a:Ll/e4r0;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/e4r0;->f()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x4

    .line 10
    if-lt v1, v2, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/w3r0;->a:Ll/e4r0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/e4r0;->d()[B

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v1, p0, Ll/w3r0;->a:Ll/e4r0;

    .line 19
    .line 20
    invoke-virtual {v1}, Ll/e4r0;->e()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    iget-object p0, p0, Ll/w3r0;->a:Ll/e4r0;

    .line 25
    .line 26
    invoke-virtual {p0, v2}, Ll/e4r0;->b(I)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    iget-object v1, p0, Lcom/xiaomi/push/hw;->l:[B

    .line 31
    .line 32
    const/4 v3, 0x0

    .line 33
    invoke-direct {p0, v1, v3, v2}, Lcom/xiaomi/push/hw;->J([BII)I

    .line 34
    .line 35
    .line 36
    move v1, v3

    .line 37
    :goto_0
    aget-byte p0, v0, v1

    .line 38
    .line 39
    and-int/lit16 p0, p0, 0xff

    .line 40
    .line 41
    shl-int/lit8 p0, p0, 0x18

    .line 42
    .line 43
    add-int/lit8 v2, v1, 0x1

    .line 44
    .line 45
    aget-byte v2, v0, v2

    .line 46
    .line 47
    and-int/lit16 v2, v2, 0xff

    .line 48
    .line 49
    shl-int/lit8 v2, v2, 0x10

    .line 50
    .line 51
    or-int/2addr p0, v2

    .line 52
    add-int/lit8 v2, v1, 0x2

    .line 53
    .line 54
    aget-byte v2, v0, v2

    .line 55
    .line 56
    and-int/lit16 v2, v2, 0xff

    .line 57
    .line 58
    shl-int/lit8 v2, v2, 0x8

    .line 59
    .line 60
    or-int/2addr p0, v2

    .line 61
    add-int/lit8 v1, v1, 0x3

    .line 62
    .line 63
    aget-byte v0, v0, v1

    .line 64
    .line 65
    and-int/lit16 v0, v0, 0xff

    .line 66
    .line 67
    or-int/2addr p0, v0

    .line 68
    return p0
.end method

.method public d()J
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/xiaomi/push/hw;->m:[B

    .line 2
    .line 3
    iget-object v1, p0, Ll/w3r0;->a:Ll/e4r0;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/e4r0;->f()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/16 v2, 0x8

    .line 10
    .line 11
    if-lt v1, v2, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/w3r0;->a:Ll/e4r0;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/e4r0;->d()[B

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v1, p0, Ll/w3r0;->a:Ll/e4r0;

    .line 20
    .line 21
    invoke-virtual {v1}, Ll/e4r0;->e()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    iget-object p0, p0, Ll/w3r0;->a:Ll/e4r0;

    .line 26
    .line 27
    invoke-virtual {p0, v2}, Ll/e4r0;->b(I)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iget-object v1, p0, Lcom/xiaomi/push/hw;->m:[B

    .line 32
    .line 33
    const/4 v3, 0x0

    .line 34
    invoke-direct {p0, v1, v3, v2}, Lcom/xiaomi/push/hw;->J([BII)I

    .line 35
    .line 36
    .line 37
    move v1, v3

    .line 38
    :goto_0
    aget-byte p0, v0, v1

    .line 39
    .line 40
    and-int/lit16 p0, p0, 0xff

    .line 41
    .line 42
    int-to-long v3, p0

    .line 43
    const/16 p0, 0x38

    .line 44
    .line 45
    shl-long/2addr v3, p0

    .line 46
    add-int/lit8 p0, v1, 0x1

    .line 47
    .line 48
    aget-byte p0, v0, p0

    .line 49
    .line 50
    and-int/lit16 p0, p0, 0xff

    .line 51
    .line 52
    int-to-long v5, p0

    .line 53
    const/16 p0, 0x30

    .line 54
    .line 55
    shl-long/2addr v5, p0

    .line 56
    or-long/2addr v3, v5

    .line 57
    add-int/lit8 p0, v1, 0x2

    .line 58
    .line 59
    aget-byte p0, v0, p0

    .line 60
    .line 61
    and-int/lit16 p0, p0, 0xff

    .line 62
    .line 63
    int-to-long v5, p0

    .line 64
    const/16 p0, 0x28

    .line 65
    .line 66
    shl-long/2addr v5, p0

    .line 67
    or-long/2addr v3, v5

    .line 68
    add-int/lit8 p0, v1, 0x3

    .line 69
    .line 70
    aget-byte p0, v0, p0

    .line 71
    .line 72
    and-int/lit16 p0, p0, 0xff

    .line 73
    .line 74
    int-to-long v5, p0

    .line 75
    const/16 p0, 0x20

    .line 76
    .line 77
    shl-long/2addr v5, p0

    .line 78
    or-long/2addr v3, v5

    .line 79
    add-int/lit8 p0, v1, 0x4

    .line 80
    .line 81
    aget-byte p0, v0, p0

    .line 82
    .line 83
    and-int/lit16 p0, p0, 0xff

    .line 84
    .line 85
    int-to-long v5, p0

    .line 86
    const/16 p0, 0x18

    .line 87
    .line 88
    shl-long/2addr v5, p0

    .line 89
    or-long/2addr v3, v5

    .line 90
    add-int/lit8 p0, v1, 0x5

    .line 91
    .line 92
    aget-byte p0, v0, p0

    .line 93
    .line 94
    and-int/lit16 p0, p0, 0xff

    .line 95
    .line 96
    int-to-long v5, p0

    .line 97
    const/16 p0, 0x10

    .line 98
    .line 99
    shl-long/2addr v5, p0

    .line 100
    or-long/2addr v3, v5

    .line 101
    add-int/lit8 p0, v1, 0x6

    .line 102
    .line 103
    aget-byte p0, v0, p0

    .line 104
    .line 105
    and-int/lit16 p0, p0, 0xff

    .line 106
    .line 107
    int-to-long v5, p0

    .line 108
    shl-long/2addr v5, v2

    .line 109
    or-long v2, v3, v5

    .line 110
    .line 111
    add-int/lit8 v1, v1, 0x7

    .line 112
    .line 113
    aget-byte p0, v0, v1

    .line 114
    .line 115
    and-int/lit16 p0, p0, 0xff

    .line 116
    .line 117
    int-to-long v0, p0

    .line 118
    or-long/2addr v0, v2

    .line 119
    return-wide v0
.end method

.method public e()Ljava/lang/String;
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/xiaomi/push/hw;->c()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/w3r0;->a:Ll/e4r0;

    .line 6
    .line 7
    invoke-virtual {v1}, Ll/e4r0;->f()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-lt v1, v0, :cond_0

    .line 12
    .line 13
    :try_start_0
    new-instance v1, Ljava/lang/String;

    .line 14
    .line 15
    iget-object v2, p0, Ll/w3r0;->a:Ll/e4r0;

    .line 16
    .line 17
    invoke-virtual {v2}, Ll/e4r0;->d()[B

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    iget-object v3, p0, Ll/w3r0;->a:Ll/e4r0;

    .line 22
    .line 23
    invoke-virtual {v3}, Ll/e4r0;->e()I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    const-string v4, "UTF-8"

    .line 28
    .line 29
    invoke-direct {v1, v2, v3, v0, v4}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ll/w3r0;->a:Ll/e4r0;

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Ll/e4r0;->b(I)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    .line 36
    .line 37
    return-object v1

    .line 38
    :catch_0
    new-instance p0, Lcom/xiaomi/push/hu;

    .line 39
    .line 40
    const-string v0, "JVM DOES NOT SUPPORT UTF-8"

    .line 41
    .line 42
    invoke-direct {p0, v0}, Lcom/xiaomi/push/hu;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    throw p0

    .line 46
    :cond_0
    invoke-virtual {p0, v0}, Lcom/xiaomi/push/hw;->K(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0
.end method

.method public f()Ljava/nio/ByteBuffer;
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/xiaomi/push/hw;->c()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0}, Lcom/xiaomi/push/hw;->M(I)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/w3r0;->a:Ll/e4r0;

    .line 9
    .line 10
    invoke-virtual {v1}, Ll/e4r0;->f()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-lt v1, v0, :cond_0

    .line 15
    .line 16
    iget-object v1, p0, Ll/w3r0;->a:Ll/e4r0;

    .line 17
    .line 18
    invoke-virtual {v1}, Ll/e4r0;->d()[B

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iget-object v2, p0, Ll/w3r0;->a:Ll/e4r0;

    .line 23
    .line 24
    invoke-virtual {v2}, Ll/e4r0;->e()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    invoke-static {v1, v2, v0}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iget-object p0, p0, Ll/w3r0;->a:Ll/e4r0;

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Ll/e4r0;->b(I)V

    .line 35
    .line 36
    .line 37
    return-object v1

    .line 38
    :cond_0
    new-array v1, v0, [B

    .line 39
    .line 40
    iget-object p0, p0, Ll/w3r0;->a:Ll/e4r0;

    .line 41
    .line 42
    const/4 v2, 0x0

    .line 43
    invoke-virtual {p0, v1, v2, v0}, Ll/e4r0;->g([BII)I

    .line 44
    .line 45
    .line 46
    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0
.end method

.method public g()Ll/m3r0;
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/xiaomi/push/hw;->a()B

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-virtual {p0}, Lcom/xiaomi/push/hw;->l()S

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    :goto_0
    new-instance v1, Ll/m3r0;

    .line 14
    .line 15
    const-string v2, ""

    .line 16
    .line 17
    invoke-direct {v1, v2, v0, p0}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 18
    .line 19
    .line 20
    return-object v1
.end method

.method public h()Ll/n3r0;
    .locals 2

    .line 1
    new-instance v0, Ll/n3r0;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/xiaomi/push/hw;->a()B

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {p0}, Lcom/xiaomi/push/hw;->c()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-direct {v0, v1, p0}, Ll/n3r0;-><init>(BI)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public i()Ll/o3r0;
    .locals 3

    .line 1
    new-instance v0, Ll/o3r0;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/xiaomi/push/hw;->a()B

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {p0}, Lcom/xiaomi/push/hw;->a()B

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    invoke-virtual {p0}, Lcom/xiaomi/push/hw;->c()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-direct {v0, v1, v2, p0}, Ll/o3r0;-><init>(BBI)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public j()Ll/y3r0;
    .locals 2

    .line 1
    new-instance v0, Ll/y3r0;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/xiaomi/push/hw;->a()B

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {p0}, Lcom/xiaomi/push/hw;->c()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-direct {v0, v1, p0}, Ll/y3r0;-><init>(BI)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public k()Ll/z3r0;
    .locals 0

    .line 1
    sget-object p0, Lcom/xiaomi/push/hw;->n:Ll/z3r0;

    .line 2
    .line 3
    return-object p0
.end method

.method public l()S
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/xiaomi/push/hw;->k:[B

    .line 2
    .line 3
    iget-object v1, p0, Ll/w3r0;->a:Ll/e4r0;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/e4r0;->f()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x2

    .line 10
    if-lt v1, v2, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/w3r0;->a:Ll/e4r0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/e4r0;->d()[B

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v1, p0, Ll/w3r0;->a:Ll/e4r0;

    .line 19
    .line 20
    invoke-virtual {v1}, Ll/e4r0;->e()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    iget-object p0, p0, Ll/w3r0;->a:Ll/e4r0;

    .line 25
    .line 26
    invoke-virtual {p0, v2}, Ll/e4r0;->b(I)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    iget-object v1, p0, Lcom/xiaomi/push/hw;->k:[B

    .line 31
    .line 32
    const/4 v3, 0x0

    .line 33
    invoke-direct {p0, v1, v3, v2}, Lcom/xiaomi/push/hw;->J([BII)I

    .line 34
    .line 35
    .line 36
    move v1, v3

    .line 37
    :goto_0
    aget-byte p0, v0, v1

    .line 38
    .line 39
    and-int/lit16 p0, p0, 0xff

    .line 40
    .line 41
    shl-int/lit8 p0, p0, 0x8

    .line 42
    .line 43
    add-int/lit8 v1, v1, 0x1

    .line 44
    .line 45
    aget-byte v0, v0, v1

    .line 46
    .line 47
    and-int/lit16 v0, v0, 0xff

    .line 48
    .line 49
    or-int/2addr p0, v0

    .line 50
    int-to-short p0, p0

    .line 51
    return p0
.end method

.method public m()V
    .locals 0

    .line 1
    return-void
.end method

.method public n(B)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/xiaomi/push/hw;->f:[B

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aput-byte p1, v0, v1

    .line 5
    .line 6
    iget-object p0, p0, Ll/w3r0;->a:Ll/e4r0;

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    invoke-virtual {p0, v0, v1, p1}, Ll/e4r0;->c([BII)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public o(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/xiaomi/push/hw;->h:[B

    .line 2
    .line 3
    shr-int/lit8 v1, p1, 0x18

    .line 4
    .line 5
    and-int/lit16 v1, v1, 0xff

    .line 6
    .line 7
    int-to-byte v1, v1

    .line 8
    const/4 v2, 0x0

    .line 9
    aput-byte v1, v0, v2

    .line 10
    .line 11
    shr-int/lit8 v1, p1, 0x10

    .line 12
    .line 13
    and-int/lit16 v1, v1, 0xff

    .line 14
    .line 15
    int-to-byte v1, v1

    .line 16
    const/4 v3, 0x1

    .line 17
    aput-byte v1, v0, v3

    .line 18
    .line 19
    shr-int/lit8 v1, p1, 0x8

    .line 20
    .line 21
    and-int/lit16 v1, v1, 0xff

    .line 22
    .line 23
    int-to-byte v1, v1

    .line 24
    const/4 v3, 0x2

    .line 25
    aput-byte v1, v0, v3

    .line 26
    .line 27
    and-int/lit16 p1, p1, 0xff

    .line 28
    .line 29
    int-to-byte p1, p1

    .line 30
    const/4 v1, 0x3

    .line 31
    aput-byte p1, v0, v1

    .line 32
    .line 33
    iget-object p0, p0, Ll/w3r0;->a:Ll/e4r0;

    .line 34
    .line 35
    const/4 p1, 0x4

    .line 36
    invoke-virtual {p0, v0, v2, p1}, Ll/e4r0;->c([BII)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public p(J)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/xiaomi/push/hw;->i:[B

    .line 2
    .line 3
    const/16 v1, 0x38

    .line 4
    .line 5
    shr-long v1, p1, v1

    .line 6
    .line 7
    const-wide/16 v3, 0xff

    .line 8
    .line 9
    and-long/2addr v1, v3

    .line 10
    long-to-int v1, v1

    .line 11
    int-to-byte v1, v1

    .line 12
    const/4 v2, 0x0

    .line 13
    aput-byte v1, v0, v2

    .line 14
    .line 15
    const/16 v1, 0x30

    .line 16
    .line 17
    shr-long v5, p1, v1

    .line 18
    .line 19
    and-long/2addr v5, v3

    .line 20
    long-to-int v1, v5

    .line 21
    int-to-byte v1, v1

    .line 22
    const/4 v5, 0x1

    .line 23
    aput-byte v1, v0, v5

    .line 24
    .line 25
    const/16 v1, 0x28

    .line 26
    .line 27
    shr-long v5, p1, v1

    .line 28
    .line 29
    and-long/2addr v5, v3

    .line 30
    long-to-int v1, v5

    .line 31
    int-to-byte v1, v1

    .line 32
    const/4 v5, 0x2

    .line 33
    aput-byte v1, v0, v5

    .line 34
    .line 35
    const/16 v1, 0x20

    .line 36
    .line 37
    shr-long v5, p1, v1

    .line 38
    .line 39
    and-long/2addr v5, v3

    .line 40
    long-to-int v1, v5

    .line 41
    int-to-byte v1, v1

    .line 42
    const/4 v5, 0x3

    .line 43
    aput-byte v1, v0, v5

    .line 44
    .line 45
    const/16 v1, 0x18

    .line 46
    .line 47
    shr-long v5, p1, v1

    .line 48
    .line 49
    and-long/2addr v5, v3

    .line 50
    long-to-int v1, v5

    .line 51
    int-to-byte v1, v1

    .line 52
    const/4 v5, 0x4

    .line 53
    aput-byte v1, v0, v5

    .line 54
    .line 55
    const/16 v1, 0x10

    .line 56
    .line 57
    shr-long v5, p1, v1

    .line 58
    .line 59
    and-long/2addr v5, v3

    .line 60
    long-to-int v1, v5

    .line 61
    int-to-byte v1, v1

    .line 62
    const/4 v5, 0x5

    .line 63
    aput-byte v1, v0, v5

    .line 64
    .line 65
    const/16 v1, 0x8

    .line 66
    .line 67
    shr-long v5, p1, v1

    .line 68
    .line 69
    and-long/2addr v5, v3

    .line 70
    long-to-int v5, v5

    .line 71
    int-to-byte v5, v5

    .line 72
    const/4 v6, 0x6

    .line 73
    aput-byte v5, v0, v6

    .line 74
    .line 75
    and-long/2addr p1, v3

    .line 76
    long-to-int p1, p1

    .line 77
    int-to-byte p1, p1

    .line 78
    const/4 p2, 0x7

    .line 79
    aput-byte p1, v0, p2

    .line 80
    .line 81
    iget-object p0, p0, Ll/w3r0;->a:Ll/e4r0;

    .line 82
    .line 83
    invoke-virtual {p0, v0, v2, v1}, Ll/e4r0;->c([BII)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public q(Ljava/lang/String;)V
    .locals 2

    .line 1
    :try_start_0
    const-string v0, "UTF-8"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    array-length v0, p1

    .line 8
    invoke-virtual {p0, v0}, Lcom/xiaomi/push/hw;->o(I)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/w3r0;->a:Ll/e4r0;

    .line 12
    .line 13
    array-length v0, p1

    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {p0, p1, v1, v0}, Ll/e4r0;->c([BII)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :catch_0
    new-instance p0, Lcom/xiaomi/push/hu;

    .line 20
    .line 21
    const-string p1, "JVM DOES NOT SUPPORT UTF-8"

    .line 22
    .line 23
    invoke-direct {p0, p1}, Lcom/xiaomi/push/hu;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    throw p0
.end method

.method public r(Ljava/nio/ByteBuffer;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Ljava/nio/Buffer;->position()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-int/2addr v0, v1

    .line 10
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->arrayOffset()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    sub-int/2addr v0, v1

    .line 15
    invoke-virtual {p0, v0}, Lcom/xiaomi/push/hw;->o(I)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/w3r0;->a:Ll/e4r0;

    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {p1}, Ljava/nio/Buffer;->position()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->arrayOffset()I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    add-int/2addr v2, p1

    .line 33
    invoke-virtual {p0, v1, v2, v0}, Ll/e4r0;->c([BII)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public s(Ll/m3r0;)V
    .locals 1

    .line 1
    iget-byte v0, p1, Ll/m3r0;->b:B

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/xiaomi/push/hw;->n(B)V

    .line 4
    .line 5
    .line 6
    iget-short p1, p1, Ll/m3r0;->c:S

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/hw;->w(S)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public t(Ll/n3r0;)V
    .locals 1

    .line 1
    iget-byte v0, p1, Ll/n3r0;->a:B

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/xiaomi/push/hw;->n(B)V

    .line 4
    .line 5
    .line 6
    iget p1, p1, Ll/n3r0;->b:I

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/hw;->o(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public u(Ll/o3r0;)V
    .locals 1

    .line 1
    iget-byte v0, p1, Ll/o3r0;->a:B

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/xiaomi/push/hw;->n(B)V

    .line 4
    .line 5
    .line 6
    iget-byte v0, p1, Ll/o3r0;->b:B

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lcom/xiaomi/push/hw;->n(B)V

    .line 9
    .line 10
    .line 11
    iget p1, p1, Ll/o3r0;->c:I

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/hw;->o(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public v(Ll/z3r0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public w(S)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/xiaomi/push/hw;->g:[B

    .line 2
    .line 3
    shr-int/lit8 v1, p1, 0x8

    .line 4
    .line 5
    and-int/lit16 v1, v1, 0xff

    .line 6
    .line 7
    int-to-byte v1, v1

    .line 8
    const/4 v2, 0x0

    .line 9
    aput-byte v1, v0, v2

    .line 10
    .line 11
    and-int/lit16 p1, p1, 0xff

    .line 12
    .line 13
    int-to-byte p1, p1

    .line 14
    const/4 v1, 0x1

    .line 15
    aput-byte p1, v0, v1

    .line 16
    .line 17
    iget-object p0, p0, Ll/w3r0;->a:Ll/e4r0;

    .line 18
    .line 19
    const/4 p1, 0x2

    .line 20
    invoke-virtual {p0, v0, v2, p1}, Ll/e4r0;->c([BII)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public x(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/hw;->n(B)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public y()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/xiaomi/push/hw;->a()B

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x1

    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public z()V
    .locals 0

    .line 1
    return-void
.end method
