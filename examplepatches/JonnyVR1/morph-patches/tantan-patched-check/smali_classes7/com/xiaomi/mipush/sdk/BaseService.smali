.class public abstract Lcom/xiaomi/mipush/sdk/BaseService;
.super Landroid/app/Service;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/mipush/sdk/BaseService$a;
    }
.end annotation


# instance fields
.field private a:Lcom/xiaomi/mipush/sdk/BaseService$a;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public abstract a()Z
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public onStart(Landroid/content/Intent;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/app/Service;->onStart(Landroid/content/Intent;I)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/BaseService;->a:Lcom/xiaomi/mipush/sdk/BaseService$a;

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    new-instance p1, Lcom/xiaomi/mipush/sdk/BaseService$a;

    .line 9
    .line 10
    new-instance p2, Ljava/lang/ref/WeakReference;

    .line 11
    .line 12
    invoke-direct {p2, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    invoke-direct {p1, p2}, Lcom/xiaomi/mipush/sdk/BaseService$a;-><init>(Ljava/lang/ref/WeakReference;)V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/BaseService;->a:Lcom/xiaomi/mipush/sdk/BaseService$a;

    .line 19
    .line 20
    :cond_0
    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/BaseService;->a:Lcom/xiaomi/mipush/sdk/BaseService$a;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/xiaomi/mipush/sdk/BaseService$a;->a()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroid/app/Service;->onStartCommand(Landroid/content/Intent;II)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-static {p0}, Ll/l4r0;->j(Landroid/content/Context;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    return p1

    .line 12
    :cond_0
    const/4 p0, 0x2

    .line 13
    return p0
.end method
