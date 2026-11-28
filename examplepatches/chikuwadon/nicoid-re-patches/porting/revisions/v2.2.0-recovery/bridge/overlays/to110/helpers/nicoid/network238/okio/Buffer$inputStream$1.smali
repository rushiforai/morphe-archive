.class public final Lnicoid/network238/okio/Buffer$inputStream$1;
.super Ljava/io/InputStream;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/okio/Buffer;->inputStream()Ljava/io/InputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000%\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0012\n\u0002\u0008\u0004\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0008\u0010\u0002\u001a\u00020\u0003H\u0016J \u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00032\u0006\u0010\u0007\u001a\u00020\u0003H\u0016J\u0008\u0010\u0008\u001a\u00020\u0003H\u0016J\u0008\u0010\t\u001a\u00020\nH\u0016J\u0008\u0010\u000b\u001a\u00020\u000cH\u0016\u00a8\u0006\r"
    }
    d2 = {
        "nicoid/network238/okio/Buffer$inputStream$1",
        "Ljava/io/InputStream;",
        "read",
        "",
        "sink",
        "",
        "offset",
        "byteCount",
        "available",
        "close",
        "",
        "toString",
        "",
        "okio"
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
.field final synthetic this$0:Lnicoid/network238/okio/Buffer;


# direct methods
.method constructor <init>(Lnicoid/network238/okio/Buffer;)V
    .registers 2

    iput-object p1, p0, Lnicoid/network238/okio/Buffer$inputStream$1;->this$0:Lnicoid/network238/okio/Buffer;

    .line 190
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    return-void
.end method


# virtual methods
.method public available()I
    .registers 5

    .line 203
    iget-object v0, p0, Lnicoid/network238/okio/Buffer$inputStream$1;->this$0:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    .line 718
    const-wide/32 v2, 0x7fffffff

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    long-to-int v0, v0

    return v0
.end method

.method public close()V
    .registers 1

    return-void
.end method

.method public read()I
    .registers 5

    .line 192
    iget-object v0, p0, Lnicoid/network238/okio/Buffer$inputStream$1;->this$0:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 193
    iget-object v0, p0, Lnicoid/network238/okio/Buffer$inputStream$1;->this$0:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->readByte()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    return v0

    :cond_0
    const/4 v0, -0x1

    return v0
.end method

.method public read([BII)I
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 200
    iget-object v0, p0, Lnicoid/network238/okio/Buffer$inputStream$1;->this$0:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v0, p1, p2, p3}, Lnicoid/network238/okio/Buffer;->read([BII)I

    move-result p1

    return p1
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 207
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lnicoid/network238/okio/Buffer$inputStream$1;->this$0:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".inputStream()"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
