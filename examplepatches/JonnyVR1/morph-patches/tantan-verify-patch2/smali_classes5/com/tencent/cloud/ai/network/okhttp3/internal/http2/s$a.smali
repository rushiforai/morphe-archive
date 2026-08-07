.class public final Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/s$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/s;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public final a:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/s$a;

.field public final b:I

.field public final c:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x100

    .line 19
    new-array v0, v0, [Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/s$a;

    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/s$a;->a:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/s$a;

    const/4 v0, 0x0

    .line 20
    iput v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/s$a;->b:I

    .line 21
    iput v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/s$a;->c:I

    return-void
.end method

.method public constructor <init>(II)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/s$a;->a:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/s$a;

    .line 6
    .line 7
    iput p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/s$a;->b:I

    .line 8
    .line 9
    and-int/lit8 p1, p2, 0x7

    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    const/16 p1, 0x8

    .line 14
    .line 15
    :cond_0
    iput p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/s$a;->c:I

    .line 16
    .line 17
    return-void
.end method
