.class public Lcom/sina/deviceidjnisdk/DeviceId;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/sina/deviceidjnisdk/IDeviceId;


# instance fields
.field private mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "weibosdkcore"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private native getDeviceIdNative(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
.end method
