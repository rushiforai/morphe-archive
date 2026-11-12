.class public final Lcom/opera/android/browser/OperaContentBrowserClient;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Z


# direct methods
.method public static allowIoctl0x7001()Z
    .registers 2

    const-string v0, "Xiaomi"

    sget-object v1, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static allowIoctlZero()Z
    .registers 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-ne v0, v1, :cond_1a

    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    const-string v1, "INFINIX MOBILITY LIMITED"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_18

    const-string v1, "TECNO MOBILE LIMITED"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1a

    :cond_18
    const/4 v0, 0x1

    return v0

    :cond_1a
    const/4 v0, 0x0

    return v0
.end method

.method public static onNetworkServiceCreated()V
    .registers 2

    sget-boolean v0, Lcom/opera/android/browser/OperaContentBrowserClient;->a:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    sput-boolean v0, Lcom/opera/android/browser/OperaContentBrowserClient;->a:Z

    new-instance v0, Lvk2;

    const/16 v1, 0x12

    invoke-direct {v0, v1}, Lvk2;-><init>(B)V

    invoke-static {v0}, Lcqp;->o0(Lcom/opera/api/Callback;)V

    return-void
.end method
