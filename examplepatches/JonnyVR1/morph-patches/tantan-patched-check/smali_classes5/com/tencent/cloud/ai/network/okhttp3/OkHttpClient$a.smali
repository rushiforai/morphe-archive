.class public Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$a;
.super Lcom/tencent/cloud/ai/network/okhttp3/internal/a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/a;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Lcom/tencent/cloud/ai/network/okhttp3/i;)Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;
    .locals 0

    .line 16
    iget-object p0, p1, Lcom/tencent/cloud/ai/network/okhttp3/i;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

    return-object p0
.end method

.method public a(Lcom/tencent/cloud/ai/network/okhttp3/o$a;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/tencent/cloud/ai/network/okhttp3/o$a;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    iget-object p0, p1, Lcom/tencent/cloud/ai/network/okhttp3/o$a;->a:Ljava/util/List;

    .line 7
    .line 8
    invoke-virtual {p3}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method
