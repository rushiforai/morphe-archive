.class Lcom/tencent/open/utils/d$1;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/open/utils/d;-><init>(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/open/utils/d;


# direct methods
.method public constructor <init>(Lcom/tencent/open/utils/d;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/open/utils/d$1;->a:Lcom/tencent/open/utils/d;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "handleMessage:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p1, Landroid/os/Message;->arg1:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "AsynLoadImg"

    .line 18
    .line 19
    invoke-static {v1, v0}, Lcom/tencent/open/log/SLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget v0, p1, Landroid/os/Message;->arg1:I

    .line 23
    .line 24
    iget-object p0, p0, Lcom/tencent/open/utils/d$1;->a:Lcom/tencent/open/utils/d;

    .line 25
    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    invoke-static {p0}, Lcom/tencent/open/utils/d;->a(Lcom/tencent/open/utils/d;)Lcom/tencent/open/utils/e;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    iget v0, p1, Landroid/os/Message;->arg1:I

    .line 33
    .line 34
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 35
    .line 36
    check-cast p1, Ljava/lang/String;

    .line 37
    .line 38
    invoke-interface {p0, v0, p1}, Lcom/tencent/open/utils/e;->a(ILjava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    invoke-static {p0}, Lcom/tencent/open/utils/d;->a(Lcom/tencent/open/utils/d;)Lcom/tencent/open/utils/e;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    iget p1, p1, Landroid/os/Message;->arg1:I

    .line 47
    .line 48
    const/4 v0, 0x0

    .line 49
    invoke-interface {p0, p1, v0}, Lcom/tencent/open/utils/e;->a(ILjava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method
