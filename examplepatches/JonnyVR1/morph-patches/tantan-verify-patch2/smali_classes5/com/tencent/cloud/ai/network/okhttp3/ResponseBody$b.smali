.class public final Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody$b;
.super Ljava/io/Reader;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public final a:Lcom/tencent/cloud/ai/network/okio/g;

.field public final b:Ljava/nio/charset/Charset;

.field public c:Z

.field public d:Ljava/io/Reader;


# direct methods
.method public constructor <init>(Lcom/tencent/cloud/ai/network/okio/g;Ljava/nio/charset/Charset;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/io/Reader;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody$b;->a:Lcom/tencent/cloud/ai/network/okio/g;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody$b;->b:Ljava/nio/charset/Charset;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody$b;->c:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody$b;->d:Ljava/io/Reader;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/io/Reader;->close()V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody$b;->a:Lcom/tencent/cloud/ai/network/okio/g;

    .line 13
    .line 14
    invoke-interface {p0}, Lcom/tencent/cloud/ai/network/okio/w;->close()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public read([CII)I
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody$b;->c:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody$b;->d:Ljava/io/Reader;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody$b;->a:Lcom/tencent/cloud/ai/network/okio/g;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody$b;->b:Ljava/nio/charset/Charset;

    .line 12
    .line 13
    invoke-static {v0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Lcom/tencent/cloud/ai/network/okio/g;Ljava/nio/charset/Charset;)Ljava/nio/charset/Charset;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ljava/io/InputStreamReader;

    .line 18
    .line 19
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody$b;->a:Lcom/tencent/cloud/ai/network/okio/g;

    .line 20
    .line 21
    invoke-interface {v2}, Lcom/tencent/cloud/ai/network/okio/g;->d()Ljava/io/InputStream;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-direct {v1, v2, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    .line 26
    .line 27
    .line 28
    iput-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody$b;->d:Ljava/io/Reader;

    .line 29
    .line 30
    move-object v0, v1

    .line 31
    :cond_0
    invoke-virtual {v0, p1, p2, p3}, Ljava/io/Reader;->read([CII)I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0

    .line 36
    :cond_1
    const-string p0, "Stream closed"

    .line 37
    .line 38
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x0

    .line 42
    return p0
.end method
