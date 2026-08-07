.class public Lcom/bef/effectsdk/EffectApplicationInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static appContext:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getAppContext()Landroid/content/Context;
    .locals 1

    .line 1
    sget-object v0, Lcom/bef/effectsdk/EffectApplicationInfo;->appContext:Landroid/content/Context;

    .line 2
    .line 3
    return-object v0
.end method

.method private static native nativeSetHomeDir(Ljava/lang/String;)I
.end method

.method private static onSetAppContext()V
    .locals 1

    .line 1
    sget-object v0, Lcom/bef/effectsdk/EffectApplicationInfo;->appContext:Landroid/content/Context;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Lcom/bef/effectsdk/EffectApplicationInfo;->nativeSetHomeDir(Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public static setAppContext(Landroid/content/Context;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/bef/effectsdk/EffectApplicationInfo;->appContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {}, Lcom/bef/effectsdk/EffectApplicationInfo;->onSetAppContext()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
