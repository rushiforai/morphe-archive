.class Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->asyncLoadModel(Lcom/momo/mcamera/mask/cartoon/ILoadModelListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;

.field final synthetic val$listener:Lcom/momo/mcamera/mask/cartoon/ILoadModelListener;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;Lcom/momo/mcamera/mask/cartoon/ILoadModelListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess$1;->this$0:Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess$1;->val$listener:Lcom/momo/mcamera/mask/cartoon/ILoadModelListener;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess$1;->this$0:Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->access$000(Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;)Lcom/momocv/stylizeface/Stylizeface;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess$1;->this$0:Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->access$000(Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;)Lcom/momocv/stylizeface/Stylizeface;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {}, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->access$200()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Lcom/momocv/stylizeface/Stylizeface;->LoadModel(Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-static {v0}, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->access$102(Z)Z

    .line 24
    .line 25
    .line 26
    invoke-static {}, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->access$100()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_0

    .line 31
    .line 32
    iget-object p0, p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess$1;->this$0:Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;

    .line 33
    .line 34
    invoke-static {p0}, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->access$000(Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;)Lcom/momocv/stylizeface/Stylizeface;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const-string v0, "cartoon model is invalid:%s"

    .line 43
    .line 44
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess$1;->val$listener:Lcom/momo/mcamera/mask/cartoon/ILoadModelListener;

    .line 49
    .line 50
    if-eqz p0, :cond_1

    .line 51
    .line 52
    const-string v0, "StylizeFaceProcess"

    .line 53
    .line 54
    invoke-interface {p0, v0}, Lcom/momo/mcamera/mask/cartoon/ILoadModelListener;->onComplete(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 58
    invoke-static {p0}, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->access$302(Z)Z

    .line 59
    .line 60
    .line 61
    :cond_2
    return-void
.end method
