.class public Lcom/tencent/cloud/ai/network/okio/r$a;
.super Ljava/io/InputStream;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/cloud/ai/network/okio/r;->d()Ljava/io/InputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/tencent/cloud/ai/network/okio/r;


# direct methods
.method public constructor <init>(Lcom/tencent/cloud/ai/network/okio/r;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okio/r$a;->a:Lcom/tencent/cloud/ai/network/okio/r;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public available()I
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/r$a;->a:Lcom/tencent/cloud/ai/network/okio/r;

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okio/r;->c:Z

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 8
    .line 9
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 10
    .line 11
    const-wide/32 v2, 0x7fffffff

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    long-to-int p0, v0

    .line 19
    return p0

    .line 20
    :cond_0
    const-string p0, "closed"

    .line 21
    .line 22
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public close()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/r$a;->a:Lcom/tencent/cloud/ai/network/okio/r;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/r;->close()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public read()I
    .locals 6

    .line 58
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/r$a;->a:Lcom/tencent/cloud/ai/network/okio/r;

    iget-boolean v1, v0, Lcom/tencent/cloud/ai/network/okio/r;->c:Z

    if-nez v1, :cond_1

    .line 59
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    iget-wide v2, v1, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    .line 60
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okio/r;->b:Lcom/tencent/cloud/ai/network/okio/w;

    const-wide/16 v2, 0x2000

    invoke-interface {v0, v1, v2, v3}, Lcom/tencent/cloud/ai/network/okio/w;->a(Lcom/tencent/cloud/ai/network/okio/e;J)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 p0, -0x1

    return p0

    .line 61
    :cond_0
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/r$a;->a:Lcom/tencent/cloud/ai/network/okio/r;

    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/e;->readByte()B

    move-result p0

    and-int/lit16 p0, p0, 0xff

    return p0

    .line 62
    :cond_1
    const-string p0, "closed"

    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method

.method public read([BII)I
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/r$a;->a:Lcom/tencent/cloud/ai/network/okio/r;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/tencent/cloud/ai/network/okio/r;->c:Z

    .line 4
    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    array-length v0, p1

    .line 8
    int-to-long v1, v0

    .line 9
    int-to-long v3, p2

    .line 10
    int-to-long v5, p3

    .line 11
    invoke-static/range {v1 .. v6}, Lcom/tencent/cloud/ai/network/okio/y;->a(JJJ)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/r$a;->a:Lcom/tencent/cloud/ai/network/okio/r;

    .line 15
    .line 16
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 17
    .line 18
    iget-wide v2, v1, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 19
    .line 20
    const-wide/16 v4, 0x0

    .line 21
    .line 22
    cmp-long v2, v2, v4

    .line 23
    .line 24
    if-nez v2, :cond_0

    .line 25
    .line 26
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okio/r;->b:Lcom/tencent/cloud/ai/network/okio/w;

    .line 27
    .line 28
    const-wide/16 v2, 0x2000

    .line 29
    .line 30
    invoke-interface {v0, v1, v2, v3}, Lcom/tencent/cloud/ai/network/okio/w;->a(Lcom/tencent/cloud/ai/network/okio/e;J)J

    .line 31
    .line 32
    .line 33
    move-result-wide v0

    .line 34
    const-wide/16 v2, -0x1

    .line 35
    .line 36
    cmp-long v0, v0, v2

    .line 37
    .line 38
    if-nez v0, :cond_0

    .line 39
    .line 40
    const/4 p0, -0x1

    .line 41
    return p0

    .line 42
    :cond_0
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/r$a;->a:Lcom/tencent/cloud/ai/network/okio/r;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 45
    .line 46
    invoke-virtual {p0, p1, p2, p3}, Lcom/tencent/cloud/ai/network/okio/e;->a([BII)I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    return p0

    .line 51
    :cond_1
    const-string p0, "closed"

    .line 52
    .line 53
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    const/4 p0, 0x0

    .line 57
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/r$a;->a:Lcom/tencent/cloud/ai/network/okio/r;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p0, ".inputStream()"

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method
