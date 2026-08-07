.class public Lcom/tencent/cloud/ai/network/okhttp3/RequestBody$b;
.super Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;->create(Lcom/tencent/cloud/ai/network/okhttp3/MediaType;[BII)Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/tencent/cloud/ai/network/okhttp3/MediaType;

.field public final synthetic b:I

.field public final synthetic c:[B

.field public final synthetic d:I


# direct methods
.method public constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/MediaType;I[BI)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/RequestBody$b;->a:Lcom/tencent/cloud/ai/network/okhttp3/MediaType;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/RequestBody$b;->b:I

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/cloud/ai/network/okhttp3/RequestBody$b;->c:[B

    .line 6
    .line 7
    iput p4, p0, Lcom/tencent/cloud/ai/network/okhttp3/RequestBody$b;->d:I

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public contentLength()J
    .locals 2

    .line 1
    iget p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/RequestBody$b;->b:I

    .line 2
    .line 3
    int-to-long v0, p0

    .line 4
    return-wide v0
.end method

.method public contentType()Lcom/tencent/cloud/ai/network/okhttp3/MediaType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/RequestBody$b;->a:Lcom/tencent/cloud/ai/network/okhttp3/MediaType;

    .line 2
    .line 3
    return-object p0
.end method

.method public writeTo(Lcom/tencent/cloud/ai/network/okio/f;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/RequestBody$b;->c:[B

    .line 2
    .line 3
    iget v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/RequestBody$b;->d:I

    .line 4
    .line 5
    iget p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/RequestBody$b;->b:I

    .line 6
    .line 7
    check-cast p1, Lcom/tencent/cloud/ai/network/okio/q;

    .line 8
    .line 9
    invoke-virtual {p1, v0, v1, p0}, Lcom/tencent/cloud/ai/network/okio/q;->a([BII)Lcom/tencent/cloud/ai/network/okio/f;

    .line 10
    .line 11
    .line 12
    return-void
.end method
