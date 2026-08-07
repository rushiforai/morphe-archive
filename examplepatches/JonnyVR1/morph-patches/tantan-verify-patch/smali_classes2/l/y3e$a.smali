.class Ll/y3e$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/VisibleForTesting;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/y3e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field a:J

.field final b:Ljava/lang/String;

.field final c:Ljava/lang/String;

.field final d:J

.field final e:J

.field final f:J

.field final g:J

.field final h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/yzk;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/android/volley/a$a;)V
    .locals 12

    .line 28
    iget-object v2, p2, Lcom/android/volley/a$a;->b:Ljava/lang/String;

    iget-wide v3, p2, Lcom/android/volley/a$a;->c:J

    iget-wide v5, p2, Lcom/android/volley/a$a;->d:J

    iget-wide v7, p2, Lcom/android/volley/a$a;->e:J

    iget-wide v9, p2, Lcom/android/volley/a$a;->f:J

    .line 29
    invoke-static {p2}, Ll/y3e$a;->a(Lcom/android/volley/a$a;)Ljava/util/List;

    move-result-object v11

    move-object v0, p0

    move-object v1, p1

    .line 30
    invoke-direct/range {v0 .. v11}, Ll/y3e$a;-><init>(Ljava/lang/String;Ljava/lang/String;JJJJLjava/util/List;)V

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;Ljava/lang/String;JJJJLjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "JJJJ",
            "Ljava/util/List<",
            "Ll/yzk;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/y3e$a;->b:Ljava/lang/String;

    .line 5
    .line 6
    const-string p1, ""

    .line 7
    .line 8
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    const/4 p2, 0x0

    .line 15
    :cond_0
    iput-object p2, p0, Ll/y3e$a;->c:Ljava/lang/String;

    .line 16
    .line 17
    iput-wide p3, p0, Ll/y3e$a;->d:J

    .line 18
    .line 19
    iput-wide p5, p0, Ll/y3e$a;->e:J

    .line 20
    .line 21
    iput-wide p7, p0, Ll/y3e$a;->f:J

    .line 22
    .line 23
    iput-wide p9, p0, Ll/y3e$a;->g:J

    .line 24
    .line 25
    iput-object p11, p0, Ll/y3e$a;->h:Ljava/util/List;

    .line 26
    .line 27
    return-void
.end method

.method private static a(Lcom/android/volley/a$a;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/a$a;",
            ")",
            "Ljava/util/List<",
            "Ll/yzk;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/volley/a$a;->h:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    iget-object p0, p0, Lcom/android/volley/a$a;->g:Ljava/util/Map;

    .line 7
    .line 8
    invoke-static {p0}, Ll/xml;->h(Ljava/util/Map;)Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static b(Ll/y3e$b;)Ll/y3e$a;
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {p0}, Ll/y3e;->l(Ljava/io/InputStream;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const v1, 0x20150306

    .line 6
    .line 7
    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    invoke-static {p0}, Ll/y3e;->n(Ll/y3e$b;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    invoke-static {p0}, Ll/y3e;->n(Ll/y3e$b;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v4

    .line 18
    invoke-static {p0}, Ll/y3e;->m(Ljava/io/InputStream;)J

    .line 19
    .line 20
    .line 21
    move-result-wide v5

    .line 22
    invoke-static {p0}, Ll/y3e;->m(Ljava/io/InputStream;)J

    .line 23
    .line 24
    .line 25
    move-result-wide v7

    .line 26
    invoke-static {p0}, Ll/y3e;->m(Ljava/io/InputStream;)J

    .line 27
    .line 28
    .line 29
    move-result-wide v9

    .line 30
    invoke-static {p0}, Ll/y3e;->m(Ljava/io/InputStream;)J

    .line 31
    .line 32
    .line 33
    move-result-wide v11

    .line 34
    invoke-static {p0}, Ll/y3e;->k(Ll/y3e$b;)Ljava/util/List;

    .line 35
    .line 36
    .line 37
    move-result-object v13

    .line 38
    new-instance v2, Ll/y3e$a;

    .line 39
    .line 40
    invoke-direct/range {v2 .. v13}, Ll/y3e$a;-><init>(Ljava/lang/String;Ljava/lang/String;JJJJLjava/util/List;)V

    .line 41
    .line 42
    .line 43
    return-object v2

    .line 44
    :cond_0
    new-instance p0, Ljava/io/IOException;

    .line 45
    .line 46
    invoke-direct {p0}, Ljava/io/IOException;-><init>()V

    .line 47
    .line 48
    .line 49
    throw p0
.end method


# virtual methods
.method public c([B)Lcom/android/volley/a$a;
    .locals 3

    .line 1
    new-instance v0, Lcom/android/volley/a$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/volley/a$a;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, v0, Lcom/android/volley/a$a;->a:[B

    .line 7
    .line 8
    iget-object p1, p0, Ll/y3e$a;->c:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p1, v0, Lcom/android/volley/a$a;->b:Ljava/lang/String;

    .line 11
    .line 12
    iget-wide v1, p0, Ll/y3e$a;->d:J

    .line 13
    .line 14
    iput-wide v1, v0, Lcom/android/volley/a$a;->c:J

    .line 15
    .line 16
    iget-wide v1, p0, Ll/y3e$a;->e:J

    .line 17
    .line 18
    iput-wide v1, v0, Lcom/android/volley/a$a;->d:J

    .line 19
    .line 20
    iget-wide v1, p0, Ll/y3e$a;->f:J

    .line 21
    .line 22
    iput-wide v1, v0, Lcom/android/volley/a$a;->e:J

    .line 23
    .line 24
    iget-wide v1, p0, Ll/y3e$a;->g:J

    .line 25
    .line 26
    iput-wide v1, v0, Lcom/android/volley/a$a;->f:J

    .line 27
    .line 28
    iget-object p1, p0, Ll/y3e$a;->h:Ljava/util/List;

    .line 29
    .line 30
    invoke-static {p1}, Ll/xml;->i(Ljava/util/List;)Ljava/util/Map;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iput-object p1, v0, Lcom/android/volley/a$a;->g:Ljava/util/Map;

    .line 35
    .line 36
    iget-object p0, p0, Ll/y3e$a;->h:Ljava/util/List;

    .line 37
    .line 38
    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    iput-object p0, v0, Lcom/android/volley/a$a;->h:Ljava/util/List;

    .line 43
    .line 44
    return-object v0
.end method

.method public d(Ljava/io/OutputStream;)Z
    .locals 2

    .line 1
    const v0, 0x20150306

    .line 2
    .line 3
    .line 4
    :try_start_0
    invoke-static {p1, v0}, Ll/y3e;->s(Ljava/io/OutputStream;I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/y3e$a;->b:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p1, v0}, Ll/y3e;->u(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/y3e$a;->c:Ljava/lang/String;

    .line 13
    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    const-string v0, ""

    .line 17
    .line 18
    :cond_0
    invoke-static {p1, v0}, Ll/y3e;->u(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-wide v0, p0, Ll/y3e$a;->d:J

    .line 22
    .line 23
    invoke-static {p1, v0, v1}, Ll/y3e;->t(Ljava/io/OutputStream;J)V

    .line 24
    .line 25
    .line 26
    iget-wide v0, p0, Ll/y3e$a;->e:J

    .line 27
    .line 28
    invoke-static {p1, v0, v1}, Ll/y3e;->t(Ljava/io/OutputStream;J)V

    .line 29
    .line 30
    .line 31
    iget-wide v0, p0, Ll/y3e$a;->f:J

    .line 32
    .line 33
    invoke-static {p1, v0, v1}, Ll/y3e;->t(Ljava/io/OutputStream;J)V

    .line 34
    .line 35
    .line 36
    iget-wide v0, p0, Ll/y3e$a;->g:J

    .line 37
    .line 38
    invoke-static {p1, v0, v1}, Ll/y3e;->t(Ljava/io/OutputStream;J)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Ll/y3e$a;->h:Ljava/util/List;

    .line 42
    .line 43
    invoke-static {p0, p1}, Ll/y3e;->r(Ljava/util/List;Ljava/io/OutputStream;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    .line 48
    .line 49
    const/4 p0, 0x1

    .line 50
    return p0

    .line 51
    :catch_0
    move-exception p0

    .line 52
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    const-string p1, "%s"

    .line 61
    .line 62
    invoke-static {p1, p0}, Lcom/android/volley/e;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    const/4 p0, 0x0

    .line 66
    return p0
.end method
