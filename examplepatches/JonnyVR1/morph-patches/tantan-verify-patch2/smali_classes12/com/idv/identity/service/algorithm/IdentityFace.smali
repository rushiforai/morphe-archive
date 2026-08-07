.class public Lcom/idv/identity/service/algorithm/IdentityFace;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native config(Lcom/idv/identity/base/algorithm/IIdentityDelegate;Lcom/idv/identity/base/algorithm/IdentityAlgConfig;)V
.end method

.method public static getClassLoader()Ljava/lang/ClassLoader;
    .locals 1

    const-class v0, Lcom/idv/identity/service/algorithm/IdentityFace;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    return-object v0
.end method

.method public static loadLibrary(Landroid/content/Context;)Z
    .locals 2

    const/4 p0, 0x0

    :try_start_0
    invoke-static {}, Ll/ifm;->a()Z

    move-result v0

    if-nez v0, :cond_0

    return p0

    :cond_0
    const-string v0, "face"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p0, 0x1

    return p0

    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    :goto_0
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/idv/identity/platform/log/RecordService;->recordException(Ljava/lang/Throwable;)V

    return p0
.end method

.method public static native loadModel([BI)Z
.end method

.method public static native loadModelPath(Ljava/lang/String;I)Z
.end method

.method public static native processImage(Lcom/idv/identity/base/algorithm/IDFrame;)I
.end method

.method public static native release()V
.end method

.method public static native reset()V
.end method

.method public static native setFarNeatAction(Z)V
.end method

.method public static native updateState(Ljava/lang/String;I)V
.end method
