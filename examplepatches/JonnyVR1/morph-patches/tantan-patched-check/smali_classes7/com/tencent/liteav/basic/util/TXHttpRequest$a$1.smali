.class Lcom/tencent/liteav/basic/util/TXHttpRequest$a$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/basic/util/TXHttpRequest$a;->a(Lcom/tencent/liteav/basic/util/TXHttpRequest$b;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/liteav/basic/util/TXHttpRequest$b;

.field final synthetic b:Lcom/tencent/liteav/basic/util/TXHttpRequest;

.field final synthetic c:Lcom/tencent/liteav/basic/util/TXHttpRequest$a;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/basic/util/TXHttpRequest$a;Lcom/tencent/liteav/basic/util/TXHttpRequest$b;Lcom/tencent/liteav/basic/util/TXHttpRequest;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/basic/util/TXHttpRequest$a$1;->c:Lcom/tencent/liteav/basic/util/TXHttpRequest$a;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/basic/util/TXHttpRequest$a$1;->a:Lcom/tencent/liteav/basic/util/TXHttpRequest$b;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/liteav/basic/util/TXHttpRequest$a$1;->b:Lcom/tencent/liteav/basic/util/TXHttpRequest;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "TXPostRequest->recvMsg: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/tencent/liteav/basic/util/TXHttpRequest$a$1;->a:Lcom/tencent/liteav/basic/util/TXHttpRequest$b;

    .line 9
    .line 10
    iget v1, v1, Lcom/tencent/liteav/basic/util/TXHttpRequest$b;->a:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, "|"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lcom/tencent/liteav/basic/util/TXHttpRequest$a$1;->a:Lcom/tencent/liteav/basic/util/TXHttpRequest$b;

    .line 21
    .line 22
    iget-object v1, v1, Lcom/tencent/liteav/basic/util/TXHttpRequest$b;->b:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "TXHttpRequest"

    .line 32
    .line 33
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/tencent/liteav/basic/util/TXHttpRequest$a$1;->b:Lcom/tencent/liteav/basic/util/TXHttpRequest;

    .line 37
    .line 38
    invoke-static {v0}, Lcom/tencent/liteav/basic/util/TXHttpRequest;->access$000(Lcom/tencent/liteav/basic/util/TXHttpRequest;)J

    .line 39
    .line 40
    .line 41
    move-result-wide v1

    .line 42
    iget-object p0, p0, Lcom/tencent/liteav/basic/util/TXHttpRequest$a$1;->a:Lcom/tencent/liteav/basic/util/TXHttpRequest$b;

    .line 43
    .line 44
    iget v3, p0, Lcom/tencent/liteav/basic/util/TXHttpRequest$b;->a:I

    .line 45
    .line 46
    iget-object p0, p0, Lcom/tencent/liteav/basic/util/TXHttpRequest$b;->c:[B

    .line 47
    .line 48
    invoke-static {v0, v1, v2, v3, p0}, Lcom/tencent/liteav/basic/util/TXHttpRequest;->access$100(Lcom/tencent/liteav/basic/util/TXHttpRequest;JI[B)V

    .line 49
    .line 50
    .line 51
    return-void
.end method
