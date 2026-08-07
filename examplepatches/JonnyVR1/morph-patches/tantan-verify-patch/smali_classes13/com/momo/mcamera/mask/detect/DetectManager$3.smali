.class Lcom/momo/mcamera/mask/detect/DetectManager$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/mcamera/mask/detect/IPatternDetect$ExpressDetectListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/mcamera/mask/detect/DetectManager;->getExpressDetectListener()Lcom/momo/mcamera/mask/detect/IPatternDetect$ExpressDetectListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/mcamera/mask/detect/DetectManager;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/detect/DetectManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/detect/DetectManager$3;->this$0:Lcom/momo/mcamera/mask/detect/DetectManager;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onExpressDetect(Lcom/momocv/express/ExpressInfo;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/detect/DetectManager$3;->this$0:Lcom/momo/mcamera/mask/detect/DetectManager;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/mcamera/mask/detect/DetectManager;->access$200(Lcom/momo/mcamera/mask/detect/DetectManager;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/detect/DetectManager$3;->this$0:Lcom/momo/mcamera/mask/detect/DetectManager;

    .line 11
    .line 12
    invoke-static {p0}, Lcom/momo/mcamera/mask/detect/DetectManager;->access$200(Lcom/momo/mcamera/mask/detect/DetectManager;)Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lcom/momo/mcamera/mask/detect/IDetectManager$IExpressDetectListener;

    .line 31
    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    invoke-interface {v0, p1}, Lcom/momo/mcamera/mask/detect/IDetectManager$IExpressDetectListener;->onExpressDetected(Lcom/momocv/express/ExpressInfo;)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    :goto_1
    return-void
.end method
