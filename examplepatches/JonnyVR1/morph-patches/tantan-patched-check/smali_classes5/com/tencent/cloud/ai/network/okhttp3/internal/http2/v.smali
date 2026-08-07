.class public final Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/v;
.super Ljava/io/IOException;
.source "SourceFile"


# instance fields
.field public final a:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;


# direct methods
.method public constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "stream was reset: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/v;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;

    .line 19
    .line 20
    return-void
.end method
