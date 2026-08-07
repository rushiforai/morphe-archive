.class Lcom/momo/momortc/MMRtcHttpUtils$1;
.super Ll/b2d0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/momortc/MMRtcHttpUtils;->postSignalDispatchEx(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/momo/momortc/MMRtcHttpUtils$MMRtcHttpCallback;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/b2d0<",
        "Ll/ze2;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/momortc/MMRtcHttpUtils;

.field final synthetic val$callback:Lcom/momo/momortc/MMRtcHttpUtils$MMRtcHttpCallback;


# direct methods
.method public constructor <init>(Lcom/momo/momortc/MMRtcHttpUtils;Lcom/momo/momortc/MMRtcHttpUtils$MMRtcHttpCallback;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/momortc/MMRtcHttpUtils$1;->this$0:Lcom/momo/momortc/MMRtcHttpUtils;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/momo/momortc/MMRtcHttpUtils$1;->val$callback:Lcom/momo/momortc/MMRtcHttpUtils$MMRtcHttpCallback;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/b2d0;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onCancel()V
    .locals 1

    .line 1
    const-string p0, "MMRtcHttpUtils"

    .line 2
    .line 3
    const-string v0, "onCancel"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onError(ILjava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onError ec="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ";em="

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string p2, ";body = "

    .line 20
    .line 21
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    const-string v0, "MMRtcHttpUtils"

    .line 32
    .line 33
    invoke-static {v0, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/momo/momortc/MMRtcHttpUtils$1;->val$callback:Lcom/momo/momortc/MMRtcHttpUtils$MMRtcHttpCallback;

    .line 37
    .line 38
    invoke-interface {p0, p1, p3}, Lcom/momo/momortc/MMRtcHttpUtils$MMRtcHttpCallback;->onError(ILjava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public onFinish()V
    .locals 1

    .line 1
    const-string p0, "MMRtcHttpUtils"

    .line 2
    .line 3
    const-string v0, "onFinish"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onSuccess(ILl/ze2;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/momortc/MMRtcHttpUtils$1;->val$callback:Lcom/momo/momortc/MMRtcHttpUtils$MMRtcHttpCallback;

    .line 2
    .line 3
    invoke-interface {p0, p1, p3}, Lcom/momo/momortc/MMRtcHttpUtils$MMRtcHttpCallback;->onSuccess(ILjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
