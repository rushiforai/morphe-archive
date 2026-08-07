.class public Ll/esh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/q6m;


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


# virtual methods
.method public a()V
    .locals 1

    .line 1
    sget-object p0, Lcom/ss/android/ttvecamera/TEVBoostInterface$VBoostCapabilityType;->CPU_FREQ_MIN:Lcom/ss/android/ttvecamera/TEVBoostInterface$VBoostCapabilityType;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/ss/android/ttvecamera/TEVBoostInterface;->c(Lcom/ss/android/ttvecamera/TEVBoostInterface$VBoostCapabilityType;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {p0}, Lcom/ss/android/ttvecamera/TEVBoostInterface;->a(Lcom/ss/android/ttvecamera/TEVBoostInterface$VBoostCapabilityType;)I

    .line 10
    .line 11
    .line 12
    :cond_0
    sget-object p0, Lcom/ss/android/ttvecamera/TEVBoostInterface$VBoostCapabilityType;->CPU_FREQ_MAX:Lcom/ss/android/ttvecamera/TEVBoostInterface$VBoostCapabilityType;

    .line 13
    .line 14
    invoke-static {p0}, Lcom/ss/android/ttvecamera/TEVBoostInterface;->c(Lcom/ss/android/ttvecamera/TEVBoostInterface$VBoostCapabilityType;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-static {p0}, Lcom/ss/android/ttvecamera/TEVBoostInterface;->a(Lcom/ss/android/ttvecamera/TEVBoostInterface$VBoostCapabilityType;)I

    .line 21
    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method public b(I)V
    .locals 4

    .line 1
    sget-object p0, Lcom/ss/android/ttvecamera/TEVBoostInterface$VBoostCapabilityType;->CPU_FREQ_MIN:Lcom/ss/android/ttvecamera/TEVBoostInterface$VBoostCapabilityType;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/ss/android/ttvecamera/TEVBoostInterface;->c(Lcom/ss/android/ttvecamera/TEVBoostInterface$VBoostCapabilityType;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/16 v1, 0x9

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    int-to-long v2, p1

    .line 12
    invoke-static {p0, v1, v2, v3}, Lcom/ss/android/ttvecamera/TEVBoostInterface;->d(Lcom/ss/android/ttvecamera/TEVBoostInterface$VBoostCapabilityType;IJ)I

    .line 13
    .line 14
    .line 15
    :cond_0
    sget-object p0, Lcom/ss/android/ttvecamera/TEVBoostInterface$VBoostCapabilityType;->CPU_FREQ_MAX:Lcom/ss/android/ttvecamera/TEVBoostInterface$VBoostCapabilityType;

    .line 16
    .line 17
    invoke-static {p0}, Lcom/ss/android/ttvecamera/TEVBoostInterface;->c(Lcom/ss/android/ttvecamera/TEVBoostInterface$VBoostCapabilityType;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    int-to-long v2, p1

    .line 24
    invoke-static {p0, v1, v2, v3}, Lcom/ss/android/ttvecamera/TEVBoostInterface;->d(Lcom/ss/android/ttvecamera/TEVBoostInterface$VBoostCapabilityType;IJ)I

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public init(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/ss/android/ttvecamera/TEVBoostInterface;->b(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
