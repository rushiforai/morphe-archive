.class public Lcom/xiaomi/push/ig;
.super Lcom/xiaomi/push/hw;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/push/ig$a;
    }
.end annotation


# static fields
.field private static o:I = 0x2710

.field private static p:I = 0x2710

.field private static q:I = 0x2710

.field private static r:I = 0xa00000

.field private static s:I = 0x6400000


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Ll/e4r0;ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/xiaomi/push/hw;-><init>(Ll/e4r0;ZZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public e()Ljava/lang/String;
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/xiaomi/push/hw;->c()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sget v1, Lcom/xiaomi/push/ig;->r:I

    .line 6
    .line 7
    if-gt v0, v1, :cond_1

    .line 8
    .line 9
    iget-object v1, p0, Ll/w3r0;->a:Ll/e4r0;

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/e4r0;->f()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-lt v1, v0, :cond_0

    .line 16
    .line 17
    :try_start_0
    new-instance v1, Ljava/lang/String;

    .line 18
    .line 19
    iget-object v2, p0, Ll/w3r0;->a:Ll/e4r0;

    .line 20
    .line 21
    invoke-virtual {v2}, Ll/e4r0;->d()[B

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    iget-object v3, p0, Ll/w3r0;->a:Ll/e4r0;

    .line 26
    .line 27
    invoke-virtual {v3}, Ll/e4r0;->e()I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    const-string v4, "UTF-8"

    .line 32
    .line 33
    invoke-direct {v1, v2, v3, v0, v4}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/w3r0;->a:Ll/e4r0;

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Ll/e4r0;->b(I)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    .line 40
    .line 41
    return-object v1

    .line 42
    :catch_0
    new-instance p0, Lcom/xiaomi/push/hu;

    .line 43
    .line 44
    const-string v0, "JVM DOES NOT SUPPORT UTF-8"

    .line 45
    .line 46
    invoke-direct {p0, v0}, Lcom/xiaomi/push/hu;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    throw p0

    .line 50
    :cond_0
    invoke-virtual {p0, v0}, Lcom/xiaomi/push/hw;->K(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0

    .line 55
    :cond_1
    const-string p0, "Thrift string size "

    .line 56
    .line 57
    invoke-static {p0, v0}, Ll/a4r0;->a(Ljava/lang/String;I)V

    .line 58
    .line 59
    .line 60
    const/4 p0, 0x0

    .line 61
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
    sget v1, Lcom/xiaomi/push/ig;->s:I

    .line 6
    .line 7
    if-gt v0, v1, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/xiaomi/push/hw;->M(I)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Ll/w3r0;->a:Ll/e4r0;

    .line 13
    .line 14
    invoke-virtual {v1}, Ll/e4r0;->f()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-lt v1, v0, :cond_0

    .line 19
    .line 20
    iget-object v1, p0, Ll/w3r0;->a:Ll/e4r0;

    .line 21
    .line 22
    invoke-virtual {v1}, Ll/e4r0;->d()[B

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iget-object v2, p0, Ll/w3r0;->a:Ll/e4r0;

    .line 27
    .line 28
    invoke-virtual {v2}, Ll/e4r0;->e()I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    invoke-static {v1, v2, v0}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iget-object p0, p0, Ll/w3r0;->a:Ll/e4r0;

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Ll/e4r0;->b(I)V

    .line 39
    .line 40
    .line 41
    return-object v1

    .line 42
    :cond_0
    new-array v1, v0, [B

    .line 43
    .line 44
    iget-object p0, p0, Ll/w3r0;->a:Ll/e4r0;

    .line 45
    .line 46
    const/4 v2, 0x0

    .line 47
    invoke-virtual {p0, v1, v2, v0}, Ll/e4r0;->g([BII)I

    .line 48
    .line 49
    .line 50
    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0

    .line 55
    :cond_1
    const-string p0, "Thrift binary size "

    .line 56
    .line 57
    invoke-static {p0, v0}, Ll/a4r0;->a(Ljava/lang/String;I)V

    .line 58
    .line 59
    .line 60
    const/4 p0, 0x0

    .line 61
    return-object p0
.end method

.method public h()Ll/n3r0;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/xiaomi/push/hw;->a()B

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Lcom/xiaomi/push/hw;->c()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    sget v1, Lcom/xiaomi/push/ig;->p:I

    .line 10
    .line 11
    if-gt p0, v1, :cond_0

    .line 12
    .line 13
    new-instance v1, Ll/n3r0;

    .line 14
    .line 15
    invoke-direct {v1, v0, p0}, Ll/n3r0;-><init>(BI)V

    .line 16
    .line 17
    .line 18
    return-object v1

    .line 19
    :cond_0
    const-string v0, "Thrift list size "

    .line 20
    .line 21
    invoke-static {v0, p0}, Ll/a4r0;->a(Ljava/lang/String;I)V

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    return-object p0
.end method

.method public i()Ll/o3r0;
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/xiaomi/push/hw;->a()B

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Lcom/xiaomi/push/hw;->a()B

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0}, Lcom/xiaomi/push/hw;->c()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    sget v2, Lcom/xiaomi/push/ig;->o:I

    .line 14
    .line 15
    if-gt p0, v2, :cond_0

    .line 16
    .line 17
    new-instance v2, Ll/o3r0;

    .line 18
    .line 19
    invoke-direct {v2, v0, v1, p0}, Ll/o3r0;-><init>(BBI)V

    .line 20
    .line 21
    .line 22
    return-object v2

    .line 23
    :cond_0
    const-string v0, "Thrift map size "

    .line 24
    .line 25
    invoke-static {v0, p0}, Ll/a4r0;->a(Ljava/lang/String;I)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    return-object p0
.end method

.method public j()Ll/y3r0;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/xiaomi/push/hw;->a()B

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Lcom/xiaomi/push/hw;->c()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    sget v1, Lcom/xiaomi/push/ig;->q:I

    .line 10
    .line 11
    if-gt p0, v1, :cond_0

    .line 12
    .line 13
    new-instance v1, Ll/y3r0;

    .line 14
    .line 15
    invoke-direct {v1, v0, p0}, Ll/y3r0;-><init>(BI)V

    .line 16
    .line 17
    .line 18
    return-object v1

    .line 19
    :cond_0
    const-string v0, "Thrift set size "

    .line 20
    .line 21
    invoke-static {v0, p0}, Ll/a4r0;->a(Ljava/lang/String;I)V

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    return-object p0
.end method
