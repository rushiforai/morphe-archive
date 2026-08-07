.class public Lcom/tencent/cloud/ai/network/okio/n$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/cloud/ai/network/okio/w;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/cloud/ai/network/okio/n;->a(Ljava/io/InputStream;Lcom/tencent/cloud/ai/network/okio/x;)Lcom/tencent/cloud/ai/network/okio/w;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/tencent/cloud/ai/network/okio/x;

.field public final synthetic b:Ljava/io/InputStream;


# direct methods
.method public constructor <init>(Lcom/tencent/cloud/ai/network/okio/x;Ljava/io/InputStream;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okio/n$a;->a:Lcom/tencent/cloud/ai/network/okio/x;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okio/n$a;->b:Ljava/io/InputStream;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Lcom/tencent/cloud/ai/network/okio/e;J)J
    .locals 3

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v2, p2, v0

    .line 4
    .line 5
    if-ltz v2, :cond_3

    .line 6
    .line 7
    if-nez v2, :cond_0

    .line 8
    .line 9
    return-wide v0

    .line 10
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/n$a;->a:Lcom/tencent/cloud/ai/network/okio/x;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okio/x;->e()V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    invoke-virtual {p1, v0}, Lcom/tencent/cloud/ai/network/okio/e;->d(I)Lcom/tencent/cloud/ai/network/okio/s;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget v1, v0, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 21
    .line 22
    rsub-int v1, v1, 0x2000

    .line 23
    .line 24
    int-to-long v1, v1

    .line 25
    invoke-static {p2, p3, v1, v2}, Ljava/lang/Math;->min(JJ)J

    .line 26
    .line 27
    .line 28
    move-result-wide p2

    .line 29
    long-to-int p2, p2

    .line 30
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/n$a;->b:Ljava/io/InputStream;

    .line 31
    .line 32
    iget-object p3, v0, Lcom/tencent/cloud/ai/network/okio/s;->a:[B

    .line 33
    .line 34
    iget v1, v0, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 35
    .line 36
    invoke-virtual {p0, p3, v1, p2}, Ljava/io/InputStream;->read([BII)I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    const/4 p2, -0x1

    .line 41
    if-ne p0, p2, :cond_1

    .line 42
    .line 43
    const-wide/16 p0, -0x1

    .line 44
    .line 45
    return-wide p0

    .line 46
    :cond_1
    iget p2, v0, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 47
    .line 48
    add-int/2addr p2, p0

    .line 49
    iput p2, v0, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 50
    .line 51
    iget-wide p2, p1, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 52
    .line 53
    int-to-long v0, p0

    .line 54
    add-long/2addr p2, v0

    .line 55
    iput-wide p2, p1, Lcom/tencent/cloud/ai/network/okio/e;->b:J
    :try_end_0
    .catch Ljava/lang/AssertionError; {:try_start_0 .. :try_end_0} :catch_0

    .line 56
    .line 57
    return-wide v0

    .line 58
    :catch_0
    move-exception p0

    .line 59
    invoke-static {p0}, Lcom/tencent/cloud/ai/network/okio/n;->a(Ljava/lang/AssertionError;)Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-eqz p1, :cond_2

    .line 64
    .line 65
    new-instance p1, Ljava/io/IOException;

    .line 66
    .line 67
    invoke-direct {p1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    .line 68
    .line 69
    .line 70
    throw p1

    .line 71
    :cond_2
    throw p0

    .line 72
    :cond_3
    const-string p0, "byteCount < 0: "

    .line 73
    .line 74
    invoke-static {p0, p2, p3}, Ll/fcg0;->a(Ljava/lang/String;J)V

    .line 75
    .line 76
    .line 77
    return-wide v0
.end method

.method public close()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/n$a;->b:Ljava/io/InputStream;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public timeout()Lcom/tencent/cloud/ai/network/okio/x;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/n$a;->a:Lcom/tencent/cloud/ai/network/okio/x;

    .line 2
    .line 3
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "source("

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/n$a;->b:Ljava/io/InputStream;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p0, ")"

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method
