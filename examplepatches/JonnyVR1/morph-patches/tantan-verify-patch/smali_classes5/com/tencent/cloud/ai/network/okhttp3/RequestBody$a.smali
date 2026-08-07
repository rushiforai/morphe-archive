.class public Lcom/tencent/cloud/ai/network/okhttp3/RequestBody$a;
.super Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;->create(Lcom/tencent/cloud/ai/network/okhttp3/MediaType;Lcom/tencent/cloud/ai/network/okio/ByteString;)Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/tencent/cloud/ai/network/okhttp3/MediaType;

.field public final synthetic b:Lcom/tencent/cloud/ai/network/okio/ByteString;


# direct methods
.method public constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/MediaType;Lcom/tencent/cloud/ai/network/okio/ByteString;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/RequestBody$a;->a:Lcom/tencent/cloud/ai/network/okhttp3/MediaType;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/RequestBody$a;->b:Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public contentLength()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/RequestBody$a;->b:Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    int-to-long v0, p0

    .line 8
    return-wide v0
.end method

.method public contentType()Lcom/tencent/cloud/ai/network/okhttp3/MediaType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/RequestBody$a;->a:Lcom/tencent/cloud/ai/network/okhttp3/MediaType;

    .line 2
    .line 3
    return-object p0
.end method

.method public writeTo(Lcom/tencent/cloud/ai/network/okio/f;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/RequestBody$a;->b:Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 2
    .line 3
    check-cast p1, Lcom/tencent/cloud/ai/network/okio/q;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Lcom/tencent/cloud/ai/network/okio/q;->a(Lcom/tencent/cloud/ai/network/okio/ByteString;)Lcom/tencent/cloud/ai/network/okio/f;

    .line 6
    .line 7
    .line 8
    return-void
.end method
