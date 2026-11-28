.class final Lnicoid/network238/okhttp3/MultipartBody$NoCloseSink;
.super Lnicoid/network238/okio/ForwardingSink;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/MultipartBody;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NoCloseSink"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\u0008\u0002\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0008\u0010\u0006\u001a\u00020\u0007H\u0016\u00a8\u0006\u0008"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/MultipartBody$NoCloseSink;",
        "Lnicoid/network238/okio/ForwardingSink;",
        "sink",
        "Lnicoid/network238/okio/Sink;",
        "<init>",
        "(Lnicoid/network238/okio/Sink;)V",
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


# direct methods
.method public constructor <init>(Lnicoid/network238/okio/Sink;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 384
    invoke-direct {p0, p1}, Lnicoid/network238/okio/ForwardingSink;-><init>(Lnicoid/network238/okio/Sink;)V

    return-void
.end method


# virtual methods
.method public close()V
    .registers 1

    return-void
.end method
