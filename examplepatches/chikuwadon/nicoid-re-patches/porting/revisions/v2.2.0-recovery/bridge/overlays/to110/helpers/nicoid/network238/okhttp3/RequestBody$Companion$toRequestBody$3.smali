.class public final Lnicoid/network238/okhttp3/RequestBody$Companion$toRequestBody$3;
.super Lnicoid/network238/okhttp3/RequestBody;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/okhttp3/RequestBody$Companion;->create([BLnicoid/network238/okhttp3/MediaType;II)Lnicoid/network238/okhttp3/RequestBody;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000#\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\n\u0010\u0002\u001a\u0004\u0018\u00010\u0003H\u0016J\u0008\u0010\u0004\u001a\u00020\u0005H\u0016J\u0010\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\tH\u0016\u00a8\u0006\n"
    }
    d2 = {
        "nicoid/network238/okhttp3/RequestBody$Companion$toRequestBody$3",
        "Lnicoid/network238/okhttp3/RequestBody;",
        "contentType",
        "Lnicoid/network238/okhttp3/MediaType;",
        "contentLength",
        "",
        "writeTo",
        "",
        "sink",
        "Lnicoid/network238/okio/BufferedSink;",
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
.field final synthetic $byteCount:I

.field final synthetic $contentType:Lnicoid/network238/okhttp3/MediaType;

.field final synthetic $offset:I

.field final synthetic $this_toRequestBody:[B


# direct methods
.method constructor <init>(Lnicoid/network238/okhttp3/MediaType;I[BI)V
    .registers 5

    iput-object p1, p0, Lnicoid/network238/okhttp3/RequestBody$Companion$toRequestBody$3;->$contentType:Lnicoid/network238/okhttp3/MediaType;

    iput p2, p0, Lnicoid/network238/okhttp3/RequestBody$Companion$toRequestBody$3;->$byteCount:I

    iput-object p3, p0, Lnicoid/network238/okhttp3/RequestBody$Companion$toRequestBody$3;->$this_toRequestBody:[B

    iput p4, p0, Lnicoid/network238/okhttp3/RequestBody$Companion$toRequestBody$3;->$offset:I

    .line 169
    invoke-direct {p0}, Lnicoid/network238/okhttp3/RequestBody;-><init>()V

    return-void
.end method


# virtual methods
.method public contentLength()J
    .registers 3

    .line 172
    iget v0, p0, Lnicoid/network238/okhttp3/RequestBody$Companion$toRequestBody$3;->$byteCount:I

    int-to-long v0, v0

    return-wide v0
.end method

.method public contentType()Lnicoid/network238/okhttp3/MediaType;
    .registers 2

    .line 170
    iget-object v0, p0, Lnicoid/network238/okhttp3/RequestBody$Companion$toRequestBody$3;->$contentType:Lnicoid/network238/okhttp3/MediaType;

    return-object v0
.end method

.method public writeTo(Lnicoid/network238/okio/BufferedSink;)V
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 175
    iget-object v0, p0, Lnicoid/network238/okhttp3/RequestBody$Companion$toRequestBody$3;->$this_toRequestBody:[B

    iget v1, p0, Lnicoid/network238/okhttp3/RequestBody$Companion$toRequestBody$3;->$offset:I

    iget v2, p0, Lnicoid/network238/okhttp3/RequestBody$Companion$toRequestBody$3;->$byteCount:I

    invoke-interface {p1, v0, v1, v2}, Lnicoid/network238/okio/BufferedSink;->write([BII)Lnicoid/network238/okio/BufferedSink;

    return-void
.end method
