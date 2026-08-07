.class Lcom/momo/mcamera/mask/cartoon/CartoonProcess$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->loadModel(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/mcamera/mask/cartoon/CartoonProcess;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/cartoon/CartoonProcess;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess$1;->this$0:Lcom/momo/mcamera/mask/cartoon/CartoonProcess;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess$1;->this$0:Lcom/momo/mcamera/mask/cartoon/CartoonProcess;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->access$100(Lcom/momo/mcamera/mask/cartoon/CartoonProcess;)Lcom/momocv/cartoonface/Cartoonface;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget-object v0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->path:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/momocv/cartoonface/Cartoonface;->LoadModel(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->access$002(Z)Z

    .line 14
    .line 15
    .line 16
    invoke-static {}, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->access$000()Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-nez p0, :cond_0

    .line 21
    .line 22
    sget-object p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->path:Ljava/lang/String;

    .line 23
    .line 24
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string v0, "cartoon model is invalid:%s"

    .line 29
    .line 30
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method
