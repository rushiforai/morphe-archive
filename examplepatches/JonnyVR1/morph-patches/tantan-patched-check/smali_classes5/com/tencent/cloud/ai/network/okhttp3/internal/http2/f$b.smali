.class public Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$b;
.super Lcom/tencent/cloud/ai/network/okhttp3/internal/b;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->a(IJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic b:I

.field public final synthetic c:J

.field public final synthetic d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;


# direct methods
.method public varargs constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;Ljava/lang/String;[Ljava/lang/Object;IJ)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$b;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 2
    .line 3
    iput p4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$b;->b:I

    .line 4
    .line 5
    iput-wide p5, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$b;->c:J

    .line 6
    .line 7
    invoke-direct {p0, p2, p3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/b;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()V
    .locals 4

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$b;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->v:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/r;

    .line 4
    .line 5
    iget v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$b;->b:I

    .line 6
    .line 7
    iget-wide v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$b;->c:J

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2, v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/r;->a(IJ)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :catch_0
    move-exception v0

    .line 14
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$b;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 15
    .line 16
    sget-object v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;

    .line 17
    .line 18
    invoke-virtual {p0, v1, v1, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->a(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;Ljava/io/IOException;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
