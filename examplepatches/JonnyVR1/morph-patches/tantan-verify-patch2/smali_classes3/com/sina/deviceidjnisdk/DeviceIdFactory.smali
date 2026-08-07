.class public Lcom/sina/deviceidjnisdk/DeviceIdFactory;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static volatile sInstance:Lcom/sina/deviceidjnisdk/IDeviceId;


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

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static native calculateM(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
.end method

.method private static native getIValueNative(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
.end method

.method private static native getInstanceNative(Landroid/content/Context;I)Lcom/sina/deviceidjnisdk/IDeviceId;
.end method
