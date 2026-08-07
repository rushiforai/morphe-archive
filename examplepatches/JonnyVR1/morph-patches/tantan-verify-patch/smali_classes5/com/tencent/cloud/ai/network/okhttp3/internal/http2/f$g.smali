.class public Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;
.super Lcom/tencent/cloud/ai/network/okhttp3/internal/b;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "g"
.end annotation


# instance fields
.field public final b:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;

.field public final synthetic c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;


# direct methods
.method public constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->d:Ljava/lang/String;

    .line 4
    .line 5
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "OkHttp %s"

    .line 10
    .line 11
    invoke-direct {p0, v0, p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/b;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public a()V
    .locals 5

    .line 1
    sget-object v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;

    .line 5
    .line 6
    invoke-virtual {v2, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->a(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p$b;)V

    .line 7
    .line 8
    .line 9
    :goto_0
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    invoke-virtual {v2, v3, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->a(ZLcom/tencent/cloud/ai/network/okhttp3/internal/http2/p$b;)Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    sget-object v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 20
    .line 21
    :try_start_1
    sget-object v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    .line 23
    goto :goto_4

    .line 24
    :catchall_0
    move-exception v3

    .line 25
    goto :goto_5

    .line 26
    :catch_0
    move-exception v1

    .line 27
    goto :goto_3

    .line 28
    :catchall_1
    move-exception v2

    .line 29
    move-object v3, v2

    .line 30
    goto :goto_1

    .line 31
    :catch_1
    move-exception v1

    .line 32
    goto :goto_2

    .line 33
    :goto_1
    move-object v2, v0

    .line 34
    goto :goto_5

    .line 35
    :goto_2
    move-object v2, v0

    .line 36
    :goto_3
    :try_start_2
    sget-object v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 37
    .line 38
    move-object v0, v2

    .line 39
    :goto_4
    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 40
    .line 41
    invoke-virtual {v3, v2, v0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->a(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;Ljava/io/IOException;)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;

    .line 45
    .line 46
    invoke-static {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/io/Closeable;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :goto_5
    iget-object v4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 51
    .line 52
    invoke-virtual {v4, v2, v0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->a(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;Ljava/io/IOException;)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;

    .line 56
    .line 57
    invoke-static {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/io/Closeable;)V

    .line 58
    .line 59
    .line 60
    throw v3
.end method
