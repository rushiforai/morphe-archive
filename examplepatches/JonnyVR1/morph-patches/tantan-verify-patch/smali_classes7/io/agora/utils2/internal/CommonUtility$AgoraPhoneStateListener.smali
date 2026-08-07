.class Lio/agora/utils2/internal/CommonUtility$AgoraPhoneStateListener;
.super Landroid/telephony/PhoneStateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/utils2/internal/CommonUtility;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AgoraPhoneStateListener"
.end annotation


# instance fields
.field private final mCommonUtilityRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lio/agora/utils2/internal/CommonUtility;",
            ">;"
        }
    .end annotation
.end field

.field private final mHandlerRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/os/Handler;",
            ">;"
        }
    .end annotation
.end field

.field private mSignalStrength:Landroid/telephony/SignalStrength;

.field private volatile phoneStatusNeedResume:Z


# direct methods
.method public constructor <init>(Lio/agora/utils2/internal/CommonUtility;Landroid/os/Handler;)V
    .locals 1

    invoke-direct {p0}, Landroid/telephony/PhoneStateListener;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/agora/utils2/internal/CommonUtility$AgoraPhoneStateListener;->phoneStatusNeedResume:Z

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lio/agora/utils2/internal/CommonUtility$AgoraPhoneStateListener;->mCommonUtilityRef:Ljava/lang/ref/WeakReference;

    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lio/agora/utils2/internal/CommonUtility$AgoraPhoneStateListener;->mHandlerRef:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method private invokeMethod(Ljava/lang/String;)I
    .locals 2

    :try_start_0
    iget-object v0, p0, Lio/agora/utils2/internal/CommonUtility$AgoraPhoneStateListener;->mSignalStrength:Landroid/telephony/SignalStrength;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    iget-object p0, p0, Lio/agora/utils2/internal/CommonUtility$AgoraPhoneStateListener;->mSignalStrength:Landroid/telephony/SignalStrength;

    invoke-virtual {p1, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    :cond_0
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public fillCellInfoByNetworkType(Ljava/util/List;Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;)V
    .locals 2
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x1a
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/telephony/CellSignalStrength;",
            ">;",
            "Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;",
            ")V"
        }
    .end annotation

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_4

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/telephony/CellSignalStrength;

    instance-of v0, p1, Landroid/telephony/CellSignalStrengthLte;

    if-eqz v0, :cond_1

    check-cast p1, Landroid/telephony/CellSignalStrengthLte;

    invoke-virtual {p1}, Landroid/telephony/CellSignalStrengthLte;->getDbm()I

    move-result p0

    iput p0, p2, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->rssi:I

    invoke-virtual {p1}, Landroid/telephony/CellSignalStrengthLte;->getLevel()I

    move-result p0

    iput p0, p2, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->signalLevel:I

    invoke-static {p1}, Ll/ln5;->a(Landroid/telephony/CellSignalStrengthLte;)I

    move-result p0

    iput p0, p2, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->snr:I

    return-void

    :cond_1
    instance-of v0, p1, Landroid/telephony/CellSignalStrengthGsm;

    if-nez v0, :cond_3

    instance-of v0, p1, Landroid/telephony/CellSignalStrengthCdma;

    if-nez v0, :cond_3

    instance-of v0, p1, Landroid/telephony/CellSignalStrengthWcdma;

    if-eqz v0, :cond_2

    goto :goto_0

    :cond_2
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_0

    invoke-static {p1}, Ll/mn5;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p1}, Ll/nn5;->a(Ljava/lang/Object;)Landroid/telephony/CellSignalStrengthNr;

    move-result-object p0

    invoke-static {p0}, Ll/on5;->a(Landroid/telephony/CellSignalStrengthNr;)I

    move-result p1

    iput p1, p2, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->rssi:I

    invoke-static {p0}, Ll/pn5;->a(Landroid/telephony/CellSignalStrengthNr;)I

    move-result p0

    iput p0, p2, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->signalLevel:I

    return-void

    :cond_3
    :goto_0
    invoke-virtual {p1}, Landroid/telephony/CellSignalStrength;->getDbm()I

    move-result p0

    iput p0, p2, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->rssi:I

    invoke-virtual {p1}, Landroid/telephony/CellSignalStrength;->getLevel()I

    move-result p0

    iput p0, p2, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->signalLevel:I

    :cond_4
    return-void
.end method

.method public fillCellInfoHighLevel(Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;)V
    .locals 3
    .param p1    # Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x1a
    .end annotation

    iget-object v0, p0, Lio/agora/utils2/internal/CommonUtility$AgoraPhoneStateListener;->mSignalStrength:Landroid/telephony/SignalStrength;

    if-eqz v0, :cond_0

    :try_start_0
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "getCellSignalStrengths"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lio/agora/utils2/internal/CommonUtility$AgoraPhoneStateListener;->mSignalStrength:Landroid/telephony/SignalStrength;

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-virtual {p0, v0, p1}, Lio/agora/utils2/internal/CommonUtility$AgoraPhoneStateListener;->fillCellInfoByNetworkType(Ljava/util/List;Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    const-string v0, "CommonUtility"

    const-string v1, "fillCellInfoHighLevel getDeclareMethod:getCellSignalStrengths failed! "

    invoke-static {v0, v1}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lio/agora/utils2/internal/CommonUtility$AgoraPhoneStateListener;->fillCellInfoLowLevel(Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;)V

    :cond_0
    return-void
.end method

.method public fillCellInfoIfPossible(Landroid/content/Context;Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;)V
    .locals 1

    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x1c

    if-gt p1, v0, :cond_0

    invoke-virtual {p0, p2}, Lio/agora/utils2/internal/CommonUtility$AgoraPhoneStateListener;->fillCellInfoLowLevel(Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;)V

    return-void

    :cond_0
    invoke-virtual {p0, p2}, Lio/agora/utils2/internal/CommonUtility$AgoraPhoneStateListener;->fillCellInfoHighLevel(Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;)V

    return-void
.end method

.method public fillCellInfoLowLevel(Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;)V
    .locals 1
    .param p1    # Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    invoke-virtual {p0}, Lio/agora/utils2/internal/CommonUtility$AgoraPhoneStateListener;->getRssi()I

    move-result v0

    iput v0, p1, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->rssi:I

    invoke-virtual {p0}, Lio/agora/utils2/internal/CommonUtility$AgoraPhoneStateListener;->getLevel()I

    move-result p0

    iput p0, p1, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->signalLevel:I

    return-void
.end method

.method public getAsuLevel()I
    .locals 1

    const-string v0, "getAsuLevel"

    invoke-direct {p0, v0}, Lio/agora/utils2/internal/CommonUtility$AgoraPhoneStateListener;->invokeMethod(Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public getLevel()I
    .locals 1

    const-string v0, "getLevel"

    invoke-direct {p0, v0}, Lio/agora/utils2/internal/CommonUtility$AgoraPhoneStateListener;->invokeMethod(Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public getRssi()I
    .locals 1

    const-string v0, "getDbm"

    invoke-direct {p0, v0}, Lio/agora/utils2/internal/CommonUtility$AgoraPhoneStateListener;->invokeMethod(Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public onCallStateChanged(ILjava/lang/String;)V
    .locals 5

    invoke-super {p0, p1, p2}, Landroid/telephony/PhoneStateListener;->onCallStateChanged(ILjava/lang/String;)V

    iget-object p2, p0, Lio/agora/utils2/internal/CommonUtility$AgoraPhoneStateListener;->mCommonUtilityRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {p2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lio/agora/utils2/internal/CommonUtility;

    iget-object v0, p0, Lio/agora/utils2/internal/CommonUtility$AgoraPhoneStateListener;->mHandlerRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Handler;

    if-eqz p2, :cond_3

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const-string v1, "CommonUtility"

    const/4 v2, 0x0

    if-nez p1, :cond_1

    iget-boolean p1, p0, Lio/agora/utils2/internal/CommonUtility$AgoraPhoneStateListener;->phoneStatusNeedResume:Z

    if-eqz p1, :cond_3

    iput-boolean v2, p0, Lio/agora/utils2/internal/CommonUtility$AgoraPhoneStateListener;->phoneStatusNeedResume:Z

    const-string p1, "system phone call end delay 1000ms"

    invoke-static {v1, p1}, Lio/agora/utils2/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p1, Lio/agora/utils2/internal/CommonUtility$AgoraPhoneStateListener$1;

    invoke-direct {p1, p0, p2}, Lio/agora/utils2/internal/CommonUtility$AgoraPhoneStateListener$1;-><init>(Lio/agora/utils2/internal/CommonUtility$AgoraPhoneStateListener;Lio/agora/utils2/internal/CommonUtility;)V

    const-wide/16 v1, 0x3e8

    invoke-virtual {v0, p1, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    :cond_1
    const/16 v0, 0x16

    const/4 v3, 0x1

    if-ne p1, v3, :cond_2

    const-string p1, "system phone call ring"

    invoke-static {v1, p1}, Lio/agora/utils2/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    iput-boolean v3, p0, Lio/agora/utils2/internal/CommonUtility$AgoraPhoneStateListener;->phoneStatusNeedResume:Z

    invoke-virtual {p2, v2, v0, v3}, Lio/agora/utils2/internal/CommonUtility;->onAudioRoutingPhoneChanged(ZII)V

    return-void

    :cond_2
    const/4 v4, 0x2

    if-ne p1, v4, :cond_3

    const-string p1, "system phone call start"

    invoke-static {v1, p1}, Lio/agora/utils2/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    iput-boolean v3, p0, Lio/agora/utils2/internal/CommonUtility$AgoraPhoneStateListener;->phoneStatusNeedResume:Z

    invoke-virtual {p2, v2, v0, v4}, Lio/agora/utils2/internal/CommonUtility;->onAudioRoutingPhoneChanged(ZII)V

    :cond_3
    :goto_0
    return-void
.end method

.method public onSignalStrengthsChanged(Landroid/telephony/SignalStrength;)V
    .locals 0

    invoke-super {p0, p1}, Landroid/telephony/PhoneStateListener;->onSignalStrengthsChanged(Landroid/telephony/SignalStrength;)V

    iput-object p1, p0, Lio/agora/utils2/internal/CommonUtility$AgoraPhoneStateListener;->mSignalStrength:Landroid/telephony/SignalStrength;

    return-void
.end method
