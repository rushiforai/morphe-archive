.class Lcom/tencent/liteav/basic/util/TXHttpRequest$a;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/liteav/basic/util/TXHttpRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "[B",
        "Ljava/lang/Void;",
        "Lcom/tencent/liteav/basic/util/TXHttpRequest$b;",
        ">;"
    }
.end annotation


# instance fields
.field private a:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tencent/liteav/basic/util/TXHttpRequest;",
            ">;"
        }
    .end annotation
.end field

.field private b:Landroid/os/Handler;

.field private c:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/basic/util/TXHttpRequest;Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tencent/liteav/basic/util/TXHttpRequest;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/tencent/liteav/basic/util/TXHttpRequest$a;->b:Landroid/os/Handler;

    .line 6
    .line 7
    iput-object p2, p0, Lcom/tencent/liteav/basic/util/TXHttpRequest$a;->c:Ljava/util/Map;

    .line 8
    .line 9
    new-instance p2, Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    invoke-direct {p2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iput-object p2, p0, Lcom/tencent/liteav/basic/util/TXHttpRequest$a;->a:Ljava/lang/ref/WeakReference;

    .line 15
    .line 16
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    new-instance p2, Landroid/os/Handler;

    .line 23
    .line 24
    invoke-direct {p2, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 25
    .line 26
    .line 27
    iput-object p2, p0, Lcom/tencent/liteav/basic/util/TXHttpRequest$a;->b:Landroid/os/Handler;

    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iput-object v0, p0, Lcom/tencent/liteav/basic/util/TXHttpRequest$a;->b:Landroid/os/Handler;

    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public varargs a([[B)Lcom/tencent/liteav/basic/util/TXHttpRequest$b;
    .locals 5

    .line 1
    new-instance v0, Lcom/tencent/liteav/basic/util/TXHttpRequest$b;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tencent/liteav/basic/util/TXHttpRequest$b;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    :try_start_0
    new-instance v2, Ljava/lang/String;

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    aget-object v4, p1, v3

    .line 11
    .line 12
    invoke-direct {v2, v4}, Ljava/lang/String;-><init>([B)V

    .line 13
    .line 14
    .line 15
    const-string v4, "https"

    .line 16
    .line 17
    invoke-virtual {v2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    iget-object p0, p0, Lcom/tencent/liteav/basic/util/TXHttpRequest$a;->c:Ljava/util/Map;

    .line 22
    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    :try_start_1
    new-instance v2, Ljava/lang/String;

    .line 26
    .line 27
    aget-object v4, p1, v3

    .line 28
    .line 29
    invoke-direct {v2, v4}, Ljava/lang/String;-><init>([B)V

    .line 30
    .line 31
    .line 32
    aget-object p1, p1, v1

    .line 33
    .line 34
    invoke-static {p0, v2, p1}, Lcom/tencent/liteav/basic/util/TXHttpRequest;->getHttpsPostRsp(Ljava/util/Map;Ljava/lang/String;[B)[B

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    iput-object p0, v0, Lcom/tencent/liteav/basic/util/TXHttpRequest$b;->c:[B

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :catch_0
    move-exception p0

    .line 42
    goto :goto_1

    .line 43
    :cond_0
    new-instance v2, Ljava/lang/String;

    .line 44
    .line 45
    aget-object v4, p1, v3

    .line 46
    .line 47
    invoke-direct {v2, v4}, Ljava/lang/String;-><init>([B)V

    .line 48
    .line 49
    .line 50
    aget-object p1, p1, v1

    .line 51
    .line 52
    invoke-static {p0, v2, p1}, Lcom/tencent/liteav/basic/util/TXHttpRequest;->getHttpPostRsp(Ljava/util/Map;Ljava/lang/String;[B)[B

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    iput-object p0, v0, Lcom/tencent/liteav/basic/util/TXHttpRequest$b;->c:[B

    .line 57
    .line 58
    :goto_0
    iput v3, v0, Lcom/tencent/liteav/basic/util/TXHttpRequest$b;->a:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 59
    .line 60
    goto :goto_2

    .line 61
    :goto_1
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    iput-object p0, v0, Lcom/tencent/liteav/basic/util/TXHttpRequest$b;->b:Ljava/lang/String;

    .line 66
    .line 67
    iput v1, v0, Lcom/tencent/liteav/basic/util/TXHttpRequest$b;->a:I

    .line 68
    .line 69
    :goto_2
    new-instance p0, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    const-string p1, "TXPostRequest->result: "

    .line 72
    .line 73
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    iget p1, v0, Lcom/tencent/liteav/basic/util/TXHttpRequest$b;->a:I

    .line 77
    .line 78
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    const-string p1, "|"

    .line 82
    .line 83
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    iget-object p1, v0, Lcom/tencent/liteav/basic/util/TXHttpRequest$b;->b:Ljava/lang/String;

    .line 87
    .line 88
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    const-string p1, "TXHttpRequest"

    .line 96
    .line 97
    invoke-static {p1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    return-object v0
.end method

.method public a(Lcom/tencent/liteav/basic/util/TXHttpRequest$b;)V
    .locals 5

    .line 101
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 102
    iget-object v0, p0, Lcom/tencent/liteav/basic/util/TXHttpRequest$a;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/tencent/liteav/basic/util/TXHttpRequest;

    if-eqz v0, :cond_1

    .line 103
    invoke-static {v0}, Lcom/tencent/liteav/basic/util/TXHttpRequest;->access$000(Lcom/tencent/liteav/basic/util/TXHttpRequest;)J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_1

    .line 104
    iget-object v1, p0, Lcom/tencent/liteav/basic/util/TXHttpRequest$a;->b:Landroid/os/Handler;

    if-eqz v1, :cond_0

    .line 105
    new-instance v2, Lcom/tencent/liteav/basic/util/TXHttpRequest$a$1;

    invoke-direct {v2, p0, p1, v0}, Lcom/tencent/liteav/basic/util/TXHttpRequest$a$1;-><init>(Lcom/tencent/liteav/basic/util/TXHttpRequest$a;Lcom/tencent/liteav/basic/util/TXHttpRequest$b;Lcom/tencent/liteav/basic/util/TXHttpRequest;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    .line 106
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v1, "TXPostRequest->recvMsg: "

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p1, Lcom/tencent/liteav/basic/util/TXHttpRequest$b;->a:I

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "|"

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p1, Lcom/tencent/liteav/basic/util/TXHttpRequest$b;->b:Ljava/lang/String;

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v1, "TXHttpRequest"

    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    invoke-static {v0}, Lcom/tencent/liteav/basic/util/TXHttpRequest;->access$000(Lcom/tencent/liteav/basic/util/TXHttpRequest;)J

    move-result-wide v1

    iget p0, p1, Lcom/tencent/liteav/basic/util/TXHttpRequest$b;->a:I

    iget-object p1, p1, Lcom/tencent/liteav/basic/util/TXHttpRequest$b;->c:[B

    invoke-static {v0, v1, v2, p0, p1}, Lcom/tencent/liteav/basic/util/TXHttpRequest;->access$100(Lcom/tencent/liteav/basic/util/TXHttpRequest;JI[B)V

    :cond_1
    return-void
.end method

.method public synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, [[B

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/basic/util/TXHttpRequest$a;->a([[B)Lcom/tencent/liteav/basic/util/TXHttpRequest$b;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/tencent/liteav/basic/util/TXHttpRequest$b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/basic/util/TXHttpRequest$a;->a(Lcom/tencent/liteav/basic/util/TXHttpRequest$b;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
