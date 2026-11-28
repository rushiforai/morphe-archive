.class public final Lnicoid/network238/okhttp3/ResponseBody$BomAwareReader;
.super Ljava/io/Reader;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/ResponseBody;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "BomAwareReader"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0019\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\u0008\u0000\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J \u0010\u000b\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u000c2\u0006\u0010\u0010\u001a\u00020\u000cH\u0016J\u0008\u0010\u0011\u001a\u00020\u0012H\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\tX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\n\u001a\u0004\u0018\u00010\u0001X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0013"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/ResponseBody$BomAwareReader;",
        "Ljava/io/Reader;",
        "source",
        "Lnicoid/network238/okio/BufferedSource;",
        "charset",
        "Ljava/nio/charset/Charset;",
        "<init>",
        "(Lnicoid/network238/okio/BufferedSource;Ljava/nio/charset/Charset;)V",
        "closed",
        "",
        "delegate",
        "read",
        "",
        "cbuf",
        "",
        "off",
        "len",
        "close",
        "",
        "okhttp"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final charset:Ljava/nio/charset/Charset;

.field private closed:Z

.field private delegate:Ljava/io/Reader;

.field private final source:Lnicoid/network238/okio/BufferedSource;


# direct methods
.method public constructor <init>(Lnicoid/network238/okio/BufferedSource;Ljava/nio/charset/Charset;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 197
    invoke-direct {p0}, Ljava/io/Reader;-><init>()V

    .line 198
    iput-object p1, p0, Lnicoid/network238/okhttp3/ResponseBody$BomAwareReader;->source:Lnicoid/network238/okio/BufferedSource;

    .line 199
    iput-object p2, p0, Lnicoid/network238/okhttp3/ResponseBody$BomAwareReader;->charset:Ljava/nio/charset/Charset;

    return-void
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 224
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnicoid/network238/okhttp3/ResponseBody$BomAwareReader;->closed:Z

    .line 225
    iget-object v0, p0, Lnicoid/network238/okhttp3/ResponseBody$BomAwareReader;->delegate:Ljava/io/Reader;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/io/Reader;->close()V

    return-void

    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/ResponseBody$BomAwareReader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v0}, Lnicoid/network238/okio/Source;->close()V

    return-void
.end method

.method public read([CII)I
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 210
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/ResponseBody$BomAwareReader;->closed:Z

    if-nez v0, :cond_1

    .line 213
    iget-object v0, p0, Lnicoid/network238/okhttp3/ResponseBody$BomAwareReader;->delegate:Ljava/io/Reader;

    if-nez v0, :cond_0

    new-instance v0, Ljava/io/InputStreamReader;

    .line 214
    iget-object v1, p0, Lnicoid/network238/okhttp3/ResponseBody$BomAwareReader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v1}, Lnicoid/network238/okio/BufferedSource;->inputStream()Ljava/io/InputStream;

    move-result-object v1

    .line 215
    iget-object v2, p0, Lnicoid/network238/okhttp3/ResponseBody$BomAwareReader;->source:Lnicoid/network238/okio/BufferedSource;

    iget-object v3, p0, Lnicoid/network238/okhttp3/ResponseBody$BomAwareReader;->charset:Ljava/nio/charset/Charset;

    invoke-static {v2, v3}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->readBomAsCharset(Lnicoid/network238/okio/BufferedSource;Ljava/nio/charset/Charset;)Ljava/nio/charset/Charset;

    move-result-object v2

    .line 213
    invoke-direct {v0, v1, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    .line 217
    iput-object v0, p0, Lnicoid/network238/okhttp3/ResponseBody$BomAwareReader;->delegate:Ljava/io/Reader;

    .line 219
    :cond_0
    invoke-virtual {v0, p1, p2, p3}, Ljava/io/Reader;->read([CII)I

    move-result p1

    return p1

    .line 210
    :cond_1
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Stream closed"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
