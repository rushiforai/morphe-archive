.class public Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody$a;
.super Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;->create(Lcom/tencent/cloud/ai/network/okhttp3/MediaType;JLcom/tencent/cloud/ai/network/okio/g;)Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic b:Lcom/tencent/cloud/ai/network/okhttp3/MediaType;

.field public final synthetic c:J

.field public final synthetic d:Lcom/tencent/cloud/ai/network/okio/g;


# direct methods
.method public constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/MediaType;JLcom/tencent/cloud/ai/network/okio/g;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody$a;->b:Lcom/tencent/cloud/ai/network/okhttp3/MediaType;

    .line 2
    .line 3
    iput-wide p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody$a;->c:J

    .line 4
    .line 5
    iput-object p4, p0, Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody$a;->d:Lcom/tencent/cloud/ai/network/okio/g;

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public contentLength()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody$a;->c:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public contentType()Lcom/tencent/cloud/ai/network/okhttp3/MediaType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody$a;->b:Lcom/tencent/cloud/ai/network/okhttp3/MediaType;

    .line 2
    .line 3
    return-object p0
.end method

.method public source()Lcom/tencent/cloud/ai/network/okio/g;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody$a;->d:Lcom/tencent/cloud/ai/network/okio/g;

    .line 2
    .line 3
    return-object p0
.end method
