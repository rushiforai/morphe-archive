.class public Lcom/tencent/cloud/ai/network/okhttp3/RequestBody$c;
.super Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;->create(Lcom/tencent/cloud/ai/network/okhttp3/MediaType;Ljava/io/File;)Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/tencent/cloud/ai/network/okhttp3/MediaType;

.field public final synthetic b:Ljava/io/File;


# direct methods
.method public constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/MediaType;Ljava/io/File;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/RequestBody$c;->a:Lcom/tencent/cloud/ai/network/okhttp3/MediaType;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/RequestBody$c;->b:Ljava/io/File;

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public contentLength()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/RequestBody$c;->b:Ljava/io/File;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/io/File;->length()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public contentType()Lcom/tencent/cloud/ai/network/okhttp3/MediaType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/RequestBody$c;->a:Lcom/tencent/cloud/ai/network/okhttp3/MediaType;

    .line 2
    .line 3
    return-object p0
.end method

.method public writeTo(Lcom/tencent/cloud/ai/network/okio/f;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/RequestBody$c;->b:Ljava/io/File;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tencent/cloud/ai/network/okio/n;->a(Ljava/io/File;)Lcom/tencent/cloud/ai/network/okio/w;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p1, Lcom/tencent/cloud/ai/network/okio/q;

    .line 8
    .line 9
    :try_start_0
    invoke-virtual {p1, p0}, Lcom/tencent/cloud/ai/network/okio/q;->a(Lcom/tencent/cloud/ai/network/okio/w;)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    .line 11
    .line 12
    check-cast p0, Lcom/tencent/cloud/ai/network/okio/n$a;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/n$a;->b:Ljava/io/InputStream;

    .line 15
    .line 16
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catchall_0
    move-exception p1

    .line 21
    :try_start_1
    check-cast p0, Lcom/tencent/cloud/ai/network/okio/n$a;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/n$a;->b:Ljava/io/InputStream;

    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :catchall_1
    move-exception p0

    .line 30
    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 31
    .line 32
    .line 33
    :goto_0
    throw p1
.end method
