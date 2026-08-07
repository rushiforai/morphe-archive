.class public Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# instance fields
.field public a:Ljava/net/Socket;

.field public b:Ljava/lang/String;

.field public c:Lcom/tencent/cloud/ai/network/okio/g;

.field public d:Lcom/tencent/cloud/ai/network/okio/f;

.field public e:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$e;

.field public f:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/t;

.field public g:Z

.field public h:I


# direct methods
.method public constructor <init>(Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$e;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$e;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$c;->e:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$e;

    .line 7
    .line 8
    sget-object v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/t;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/t;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$c;->f:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/t;

    .line 11
    .line 12
    iput-boolean p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$c;->g:Z

    .line 13
    .line 14
    return-void
.end method
