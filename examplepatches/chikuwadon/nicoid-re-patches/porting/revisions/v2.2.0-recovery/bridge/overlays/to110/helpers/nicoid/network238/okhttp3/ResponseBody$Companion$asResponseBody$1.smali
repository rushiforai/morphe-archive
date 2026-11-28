.class public final Lnicoid/network238/okhttp3/ResponseBody$Companion$asResponseBody$1;
.super Lnicoid/network238/okhttp3/ResponseBody;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/okhttp3/ResponseBody$Companion;->create(Lnicoid/network238/okio/BufferedSource;Lnicoid/network238/okhttp3/MediaType;J)Lnicoid/network238/okhttp3/ResponseBody;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u001d\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\n\u0010\u0002\u001a\u0004\u0018\u00010\u0003H\u0016J\u0008\u0010\u0004\u001a\u00020\u0005H\u0016J\u0008\u0010\u0006\u001a\u00020\u0007H\u0016\u00a8\u0006\u0008"
    }
    d2 = {
        "nicoid/network238/okhttp3/ResponseBody$Companion$asResponseBody$1",
        "Lnicoid/network238/okhttp3/ResponseBody;",
        "contentType",
        "Lnicoid/network238/okhttp3/MediaType;",
        "contentLength",
        "",
        "source",
        "Lnicoid/network238/okio/BufferedSource;",
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
.field final synthetic $contentLength:J

.field final synthetic $contentType:Lnicoid/network238/okhttp3/MediaType;

.field final synthetic $this_asResponseBody:Lnicoid/network238/okio/BufferedSource;


# direct methods
.method constructor <init>(Lnicoid/network238/okhttp3/MediaType;JLnicoid/network238/okio/BufferedSource;)V
    .registers 5

    iput-object p1, p0, Lnicoid/network238/okhttp3/ResponseBody$Companion$asResponseBody$1;->$contentType:Lnicoid/network238/okhttp3/MediaType;

    iput-wide p2, p0, Lnicoid/network238/okhttp3/ResponseBody$Companion$asResponseBody$1;->$contentLength:J

    iput-object p4, p0, Lnicoid/network238/okhttp3/ResponseBody$Companion$asResponseBody$1;->$this_asResponseBody:Lnicoid/network238/okio/BufferedSource;

    .line 273
    invoke-direct {p0}, Lnicoid/network238/okhttp3/ResponseBody;-><init>()V

    return-void
.end method


# virtual methods
.method public contentLength()J
    .registers 3

    .line 276
    iget-wide v0, p0, Lnicoid/network238/okhttp3/ResponseBody$Companion$asResponseBody$1;->$contentLength:J

    return-wide v0
.end method

.method public contentType()Lnicoid/network238/okhttp3/MediaType;
    .registers 2

    .line 274
    iget-object v0, p0, Lnicoid/network238/okhttp3/ResponseBody$Companion$asResponseBody$1;->$contentType:Lnicoid/network238/okhttp3/MediaType;

    return-object v0
.end method

.method public source()Lnicoid/network238/okio/BufferedSource;
    .registers 2

    .line 278
    iget-object v0, p0, Lnicoid/network238/okhttp3/ResponseBody$Companion$asResponseBody$1;->$this_asResponseBody:Lnicoid/network238/okio/BufferedSource;

    return-object v0
.end method
