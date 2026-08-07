.class Ll/k5r0$b;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/k5r0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field private a:J

.field private b:J

.field private c:Ljava/io/File;

.field private d:Lorg/json/JSONObject;


# direct methods
.method private constructor <init>(Ljava/io/File;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/k5r0$b;->d:Lorg/json/JSONObject;

    .line 6
    .line 7
    iput-object p1, p0, Ll/k5r0$b;->c:Ljava/io/File;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "-|\\."

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    array-length v1, v0

    .line 20
    const/4 v2, 0x2

    .line 21
    const/4 v3, 0x0

    .line 22
    if-lt v1, v2, :cond_0

    .line 23
    .line 24
    aget-object p1, v0, v3

    .line 25
    .line 26
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 27
    .line 28
    .line 29
    move-result-wide v1

    .line 30
    iput-wide v1, p0, Ll/k5r0$b;->a:J

    .line 31
    .line 32
    const/4 p1, 0x1

    .line 33
    aget-object p1, v0, p1

    .line 34
    .line 35
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 36
    .line 37
    .line 38
    move-result-wide v0

    .line 39
    :goto_0
    iput-wide v0, p0, Ll/k5r0$b;->b:J

    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-nez v0, :cond_1

    .line 51
    .line 52
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    const/16 v1, 0xd

    .line 57
    .line 58
    if-lt v0, v1, :cond_1

    .line 59
    .line 60
    invoke-virtual {p1, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-static {p1}, Landroid/text/TextUtils;->isDigitsOnly(Ljava/lang/CharSequence;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_1

    .line 69
    .line 70
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 71
    .line 72
    .line 73
    move-result-wide v0

    .line 74
    iput-wide v0, p0, Ll/k5r0$b;->a:J

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_1
    return-void
.end method

.method public synthetic constructor <init>(Ljava/io/File;Ll/k5r0$a;)V
    .locals 0

    .line 78
    invoke-direct {p0, p1}, Ll/k5r0$b;-><init>(Ljava/io/File;)V

    return-void
.end method

.method private a()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-wide v1, p0, Ll/k5r0$b;->a:J

    .line 7
    .line 8
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, "-"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget-wide v1, p0, Ll/k5r0$b;->b:J

    .line 17
    .line 18
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string p0, ".ctx"

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public static synthetic b(Ll/k5r0$b;)Lorg/json/JSONObject;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/k5r0$b;->f()Lorg/json/JSONObject;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private c(J)V
    .locals 1

    .line 1
    iput-wide p1, p0, Ll/k5r0$b;->b:J

    .line 2
    .line 3
    new-instance p1, Ljava/io/File;

    .line 4
    .line 5
    iget-object p2, p0, Ll/k5r0$b;->c:Ljava/io/File;

    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/io/File;->getParent()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-direct {p0}, Ll/k5r0$b;->a()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-direct {p1, p2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/k5r0$b;->c:Ljava/io/File;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic d(Ll/k5r0$b;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/k5r0$b;->c(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Ll/k5r0$b;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/k5r0$b;->a:J

    .line 2
    .line 3
    return-wide v0
.end method

.method private f()Lorg/json/JSONObject;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/k5r0$b;->d:Lorg/json/JSONObject;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 6
    .line 7
    iget-object v1, p0, Ll/k5r0$b;->c:Ljava/io/File;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v1}, Ll/r3r0;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Ll/k5r0$b;->d:Lorg/json/JSONObject;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    .line 22
    :catchall_0
    iget-object v0, p0, Ll/k5r0$b;->d:Lorg/json/JSONObject;

    .line 23
    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    new-instance v0, Lorg/json/JSONObject;

    .line 27
    .line 28
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Ll/k5r0$b;->d:Lorg/json/JSONObject;

    .line 32
    .line 33
    :cond_0
    iget-object p0, p0, Ll/k5r0$b;->d:Lorg/json/JSONObject;

    .line 34
    .line 35
    return-object p0
.end method

.method private g(J)Z
    .locals 5

    .line 1
    iget-wide v0, p0, Ll/k5r0$b;->a:J

    .line 2
    .line 3
    cmp-long v2, v0, p1

    .line 4
    .line 5
    const-wide/32 v3, 0x240c8400

    .line 6
    .line 7
    .line 8
    if-lez v2, :cond_0

    .line 9
    .line 10
    sub-long/2addr v0, p1

    .line 11
    cmp-long v0, v0, v3

    .line 12
    .line 13
    if-gtz v0, :cond_2

    .line 14
    .line 15
    :cond_0
    iget-wide v0, p0, Ll/k5r0$b;->b:J

    .line 16
    .line 17
    cmp-long v2, v0, p1

    .line 18
    .line 19
    if-gez v2, :cond_1

    .line 20
    .line 21
    sub-long v0, p1, v0

    .line 22
    .line 23
    cmp-long v0, v0, v3

    .line 24
    .line 25
    if-gtz v0, :cond_2

    .line 26
    .line 27
    :cond_1
    iget-object v0, p0, Ll/k5r0$b;->c:Ljava/io/File;

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    .line 30
    .line 31
    .line 32
    move-result-wide v0

    .line 33
    cmp-long v0, v0, p1

    .line 34
    .line 35
    if-gez v0, :cond_3

    .line 36
    .line 37
    iget-object p0, p0, Ll/k5r0$b;->c:Ljava/io/File;

    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/io/File;->lastModified()J

    .line 40
    .line 41
    .line 42
    move-result-wide v0

    .line 43
    sub-long/2addr p1, v0

    .line 44
    cmp-long p0, p1, v3

    .line 45
    .line 46
    if-lez p0, :cond_3

    .line 47
    .line 48
    :cond_2
    const/4 p0, 0x1

    .line 49
    return p0

    .line 50
    :cond_3
    const/4 p0, 0x0

    .line 51
    return p0
.end method

.method public static synthetic h(Ll/k5r0$b;J)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/k5r0$b;->g(J)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic i(Ll/k5r0$b;)Ljava/io/File;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k5r0$b;->c:Ljava/io/File;

    .line 2
    .line 3
    return-object p0
.end method

.method private j()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k5r0$b;->c:Ljava/io/File;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic k(Ll/k5r0$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/k5r0$b;->j()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l(Ll/k5r0$b;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/k5r0$b;->b:J

    .line 2
    .line 3
    return-wide v0
.end method
