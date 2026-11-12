.class public Lcom/leanplum/utils/BuildUtil;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static targetSdk:I = -0x1


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createIntentFlags(I)I
    .registers 2

    const/high16 v0, 0x4000000

    or-int/2addr p0, v0

    return p0
.end method

.method private static getTargetSdkVersion(Landroid/content/Context;)I
    .registers 3

    sget v0, Lcom/leanplum/utils/BuildUtil;->targetSdk:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_10

    if-eqz p0, :cond_10

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object p0

    iget p0, p0, Landroid/content/pm/ApplicationInfo;->targetSdkVersion:I

    sput p0, Lcom/leanplum/utils/BuildUtil;->targetSdk:I

    return p0

    :cond_10
    return v0
.end method

.method public static isNotificationChannelSupported(Landroid/content/Context;)Z
    .registers 2

    invoke-static {p0}, Lcom/leanplum/utils/BuildUtil;->getTargetSdkVersion(Landroid/content/Context;)I

    move-result p0

    const/16 v0, 0x1a

    if-lt p0, v0, :cond_a

    const/4 p0, 0x1

    return p0

    :cond_a
    const/4 p0, 0x0

    return p0
.end method

.method public static shouldDisableTrampolines(Landroid/content/Context;)Z
    .registers 3

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-lt v0, v1, :cond_e

    invoke-static {p0}, Lcom/leanplum/utils/BuildUtil;->getTargetSdkVersion(Landroid/content/Context;)I

    move-result p0

    if-lt p0, v1, :cond_e

    const/4 p0, 0x1

    return p0

    :cond_e
    const/4 p0, 0x0

    return p0
.end method
