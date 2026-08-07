.class public Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi$a;
    }
.end annotation


# instance fields
.field public a:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field public b:Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;

.field public c:Lcom/tencent/could/huiyansdk/entity/HuiYanBaseConfig;

.field public volatile d:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->d:Z

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public a()Landroid/content/Context;
    .locals 0

    .line 50
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->a:Ljava/lang/ref/WeakReference;

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 51
    :cond_0
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/Context;

    return-object p0
.end method

.method public a(II)V
    .locals 3

    .line 1
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v1, "updatePreviewSize width:"

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " height:"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const/4 v1, 0x1

    .line 26
    const-string v2, "HuiYanBaseApi"

    .line 27
    .line 28
    invoke-virtual {p0, v1, v2, v0}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    sget-object p0, Lcom/tencent/could/huiyansdk/helper/b$a;->a:Lcom/tencent/could/huiyansdk/helper/b;

    .line 32
    .line 33
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 34
    .line 35
    .line 36
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    new-instance v0, Landroid/graphics/Rect;

    .line 41
    .line 42
    const/4 v1, 0x0

    .line 43
    invoke-direct {v0, v1, v1, p1, p2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->setPreviewRect(Landroid/graphics/Rect;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public a(Ljava/lang/String;IJLjava/lang/String;)V
    .locals 0

    .line 52
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->b:Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;

    if-eqz p0, :cond_0

    .line 53
    invoke-interface/range {p0 .. p5}, Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;->updateOperateInfo(Ljava/lang/String;IJLjava/lang/String;)V

    :cond_0
    return-void
.end method

.method public b()Lcom/tencent/could/huiyansdk/enums/HuiYanLiveMode;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->c:Lcom/tencent/could/huiyansdk/entity/HuiYanBaseConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lcom/tencent/could/huiyansdk/enums/HuiYanLiveMode;->ACTION_REFLECT_MODE:Lcom/tencent/could/huiyansdk/enums/HuiYanLiveMode;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/entity/HuiYanBaseConfig;->getHuiYanLiveMode()Lcom/tencent/could/huiyansdk/enums/HuiYanLiveMode;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method
