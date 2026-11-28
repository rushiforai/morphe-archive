.class final Lcom/google/common/io/MultiInputStream;
.super Ljava/io/InputStream;
.source "MultiInputStream.java"


# instance fields
.field private in:Ljava/io/InputStream;

.field private final it:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator<",
            "+",
            "Lcom/google/common/io/ByteSource;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/Iterator;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "it"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Iterator<",
            "+",
            "Lcom/google/common/io/ByteSource;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 45
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 46
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Iterator;

    iput-object p1, p0, Lcom/google/common/io/MultiInputStream;->it:Ljava/util/Iterator;

    .line 47
    invoke-direct {p0}, Lcom/google/common/io/MultiInputStream;->advance()V

    return-void
.end method

.method private advance()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 63
    invoke-virtual {p0}, Lcom/google/common/io/MultiInputStream;->close()V

    .line 64
    iget-object v0, p0, Lcom/google/common/io/MultiInputStream;->it:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 65
    iget-object v0, p0, Lcom/google/common/io/MultiInputStream;->it:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/io/ByteSource;

    invoke-virtual {v0}, Lcom/google/common/io/ByteSource;->openStream()Ljava/io/InputStream;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/io/MultiInputStream;->in:Ljava/io/InputStream;

    :cond_0
    return-void
.end method


# virtual methods
.method public available()I
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 71
    iget-object p0, p0, Lcom/google/common/io/MultiInputStream;->in:Ljava/io/InputStream;

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    .line 74
    :cond_0
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result p0

    return p0
.end method

.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 52
    iget-object v0, p0, Lcom/google/common/io/MultiInputStream;->in:Ljava/io/InputStream;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    .line 54
    :try_start_0
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    iput-object v1, p0, Lcom/google/common/io/MultiInputStream;->in:Ljava/io/InputStream;

    return-void

    :catchall_0
    move-exception v0

    iput-object v1, p0, Lcom/google/common/io/MultiInputStream;->in:Ljava/io/InputStream;

    .line 57
    throw v0

    :cond_0
    return-void
.end method

.method public markSupported()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public read()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 84
    :goto_0
    iget-object v0, p0, Lcom/google/common/io/MultiInputStream;->in:Ljava/io/InputStream;

    const/4 v1, -0x1

    if-eqz v0, :cond_1

    .line 85
    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    if-eq v0, v1, :cond_0

    return v0

    .line 89
    :cond_0
    invoke-direct {p0}, Lcom/google/common/io/MultiInputStream;->advance()V

    goto :goto_0

    :cond_1
    return v1
.end method

.method public read([BII)I
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "b",
            "off",
            "len"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 96
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    :goto_0
    iget-object v0, p0, Lcom/google/common/io/MultiInputStream;->in:Ljava/io/InputStream;

    const/4 v1, -0x1

    if-eqz v0, :cond_1

    .line 98
    invoke-virtual {v0, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    if-eq v0, v1, :cond_0

    return v0

    .line 102
    :cond_0
    invoke-direct {p0}, Lcom/google/common/io/MultiInputStream;->advance()V

    goto :goto_0

    :cond_1
    return v1
.end method

.method public skip(J)J
    .registers 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "n"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 109
    iget-object v0, p0, Lcom/google/common/io/MultiInputStream;->in:Ljava/io/InputStream;

    const-wide/16 v1, 0x0

    if-eqz v0, :cond_2

    cmp-long v3, p1, v1

    if-lez v3, :cond_2

    .line 112
    invoke-virtual {v0, p1, p2}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v3

    cmp-long v0, v3, v1

    if-eqz v0, :cond_0

    return-wide v3

    .line 116
    :cond_0
    invoke-virtual {p0}, Lcom/google/common/io/MultiInputStream;->read()I

    move-result v0

    const/4 v3, -0x1

    if-ne v0, v3, :cond_1

    return-wide v1

    .line 119
    :cond_1
    iget-object p0, p0, Lcom/google/common/io/MultiInputStream;->in:Ljava/io/InputStream;

    const-wide/16 v0, 0x1

    sub-long/2addr p1, v0

    invoke-virtual {p0, p1, p2}, Ljava/io/InputStream;->skip(J)J

    move-result-wide p0

    add-long/2addr p0, v0

    return-wide p0

    :cond_2
    return-wide v1
.end method
