.class public final Lcom/tencent/cloud/ai/network/okhttp3/internal/http/d;
.super Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;
.source "SourceFile"


# instance fields
.field public final b:Ljava/lang/String;

.field public final c:J

.field public final d:Lcom/tencent/cloud/ai/network/okio/g;


# direct methods
.method public constructor <init>(Ljava/lang/String;JLcom/tencent/cloud/ai/network/okio/g;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/d;->b:Ljava/lang/String;

    .line 5
    .line 6
    iput-wide p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/d;->c:J

    .line 7
    .line 8
    iput-object p4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/d;->d:Lcom/tencent/cloud/ai/network/okio/g;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public contentLength()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/d;->c:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public contentType()Lcom/tencent/cloud/ai/network/okhttp3/MediaType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/d;->b:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Lcom/tencent/cloud/ai/network/okhttp3/MediaType;->parse(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/MediaType;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public source()Lcom/tencent/cloud/ai/network/okio/g;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/d;->d:Lcom/tencent/cloud/ai/network/okio/g;

    .line 2
    .line 3
    return-object p0
.end method
