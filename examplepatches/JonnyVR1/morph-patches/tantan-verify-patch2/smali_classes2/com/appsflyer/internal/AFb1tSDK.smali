.class public final Lcom/appsflyer/internal/AFb1tSDK;
.super Lcom/appsflyer/AppsFlyerLib;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/appsflyer/internal/AFb1tSDK$AFa1vSDK;,
        Lcom/appsflyer/internal/AFb1tSDK$AFa1uSDK;
    }
.end annotation


# static fields
.field private static $10:I = 0x0

.field private static $11:I = 0x1

.field static final AFAdRevenueData:Ljava/lang/String;

.field private static AFInAppEventParameterName:[I = null

.field private static AFKeystoreWrapper:I = 0x0

.field private static areAllFieldsValid:Lcom/appsflyer/internal/AFb1tSDK; = null
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field static getCurrencyIso4217Code:Lcom/appsflyer/AppsFlyerInAppPurchaseValidatorListener; = null

.field public static final getMonetizationNetwork:Ljava/lang/String;

.field public static final getRevenue:Ljava/lang/String;

.field private static values:I = 0x1


# instance fields
.field private AFInAppEventType:Lcom/appsflyer/internal/AFg1ySDK;

.field private component1:J

.field private component2:J

.field private component3:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Long;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private component4:J

.field private copy:Landroid/app/Application;

.field private final copydefault:Lcom/appsflyer/internal/AFd1nSDK;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field private equals:Z

.field public volatile getMediationNetwork:Lcom/appsflyer/AppsFlyerConversionListener;

.field private hashCode:Z

.field private toString:Landroid/content/SharedPreferences;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/appsflyer/internal/AFb1tSDK;->getRevenue()V

    .line 2
    .line 3
    .line 4
    const-string v0, "295"

    .line 5
    .line 6
    sput-object v0, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData:Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, "6.15"

    .line 9
    .line 10
    sput-object v0, Lcom/appsflyer/internal/AFb1tSDK;->getRevenue:Ljava/lang/String;

    .line 11
    .line 12
    new-instance v1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v0, "/androidevent?buildnumber=6.15.0&app_id="

    .line 21
    .line 22
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sput-object v0, Lcom/appsflyer/internal/AFb1tSDK;->getMonetizationNetwork:Ljava/lang/String;

    .line 30
    .line 31
    const/4 v0, 0x0

    .line 32
    sput-object v0, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code:Lcom/appsflyer/AppsFlyerInAppPurchaseValidatorListener;

    .line 33
    .line 34
    new-instance v1, Lcom/appsflyer/internal/AFb1tSDK;

    .line 35
    .line 36
    invoke-direct {v1}, Lcom/appsflyer/internal/AFb1tSDK;-><init>()V

    .line 37
    .line 38
    .line 39
    sput-object v1, Lcom/appsflyer/internal/AFb1tSDK;->areAllFieldsValid:Lcom/appsflyer/internal/AFb1tSDK;

    .line 40
    .line 41
    sget v1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 42
    .line 43
    add-int/lit8 v1, v1, 0x2d

    .line 44
    .line 45
    rem-int/lit16 v2, v1, 0x80

    .line 46
    .line 47
    sput v2, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 48
    .line 49
    rem-int/lit8 v1, v1, 0x2

    .line 50
    .line 51
    if-eqz v1, :cond_0

    .line 52
    .line 53
    return-void

    .line 54
    :cond_0
    throw v0
.end method

.method public constructor <init>()V
    .locals 3
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/appsflyer/AppsFlyerLib;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/appsflyer/internal/AFb1tSDK;->getMediationNetwork:Lcom/appsflyer/AppsFlyerConversionListener;

    .line 6
    .line 7
    const-wide/16 v0, -0x1

    .line 8
    .line 9
    iput-wide v0, p0, Lcom/appsflyer/internal/AFb1tSDK;->component1:J

    .line 10
    .line 11
    iput-wide v0, p0, Lcom/appsflyer/internal/AFb1tSDK;->component2:J

    .line 12
    .line 13
    const-wide/16 v0, 0x1388

    .line 14
    .line 15
    iput-wide v0, p0, Lcom/appsflyer/internal/AFb1tSDK;->component4:J

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    iput-boolean v0, p0, Lcom/appsflyer/internal/AFb1tSDK;->equals:Z

    .line 19
    .line 20
    invoke-static {}, Lcom/appsflyer/AFVersionDeclaration;->init()V

    .line 21
    .line 22
    .line 23
    new-instance v1, Lcom/appsflyer/internal/AFd1nSDK;

    .line 24
    .line 25
    invoke-direct {v1}, Lcom/appsflyer/internal/AFd1nSDK;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v1, p0, Lcom/appsflyer/internal/AFb1tSDK;->copydefault:Lcom/appsflyer/internal/AFd1nSDK;

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-interface {v1}, Lcom/appsflyer/internal/AFd1fSDK;->v()Lcom/appsflyer/internal/AFh1vSDK;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-interface {v1}, Lcom/appsflyer/internal/AFh1vSDK;->getMonetizationNetwork()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-interface {v1}, Lcom/appsflyer/internal/AFd1fSDK;->v()Lcom/appsflyer/internal/AFh1vSDK;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-interface {v1}, Lcom/appsflyer/internal/AFh1vSDK;->getMediationNetwork()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-interface {v1}, Lcom/appsflyer/internal/AFd1fSDK;->copy()Lcom/appsflyer/internal/AFe1aSDK;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    new-instance v2, Lcom/appsflyer/internal/AFb1tSDK$AFa1vSDK;

    .line 61
    .line 62
    invoke-direct {v2, p0, v0}, Lcom/appsflyer/internal/AFb1tSDK$AFa1vSDK;-><init>(Lcom/appsflyer/internal/AFb1tSDK;B)V

    .line 63
    .line 64
    .line 65
    iget-object p0, v1, Lcom/appsflyer/internal/AFe1aSDK;->getCurrencyIso4217Code:Ljava/util/List;

    .line 66
    .line 67
    invoke-interface {p0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method private AFAdRevenueData(Ljava/util/Map;)Lcom/appsflyer/internal/AFf1cSDK$AFa1zSDK;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/appsflyer/internal/AFf1cSDK$AFa1zSDK;"
        }
    .end annotation

    .line 646
    new-instance v0, Lcom/appsflyer/internal/AFb1tSDK$3;

    invoke-direct {v0, p0, p1}, Lcom/appsflyer/internal/AFb1tSDK$3;-><init>(Lcom/appsflyer/internal/AFb1tSDK;Ljava/util/Map;)V

    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    add-int/lit8 p0, p0, 0x7d

    rem-int/lit16 p1, p0, 0x80

    sput p1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    rem-int/lit8 p0, p0, 0x2

    if-eqz p0, :cond_0

    return-object v0

    :cond_0
    const/4 p0, 0x0

    throw p0
.end method

.method public static synthetic AFAdRevenueData(Lcom/appsflyer/internal/AFb1tSDK;)Lcom/appsflyer/internal/AFg1ySDK;
    .locals 1

    .line 589
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    add-int/lit8 v0, v0, 0x73

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    invoke-direct {p0}, Lcom/appsflyer/internal/AFb1tSDK;->component3()Lcom/appsflyer/internal/AFg1ySDK;

    move-result-object p0

    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    add-int/lit8 v0, v0, 0x35

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    return-object p0
.end method

.method private static synthetic AFAdRevenueData([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    const/4 v0, 0x0

    aget-object p0, p0, v0

    check-cast p0, Landroid/content/Context;

    const/4 v0, 0x0

    .line 632
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    const/16 v2, 0x1000

    invoke-virtual {v1, p0, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p0

    .line 633
    iget-object p0, p0, Landroid/content/pm/PackageInfo;->requestedPermissions:[Ljava/lang/String;

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    .line 634
    const-string v1, "android.permission.INTERNET"

    invoke-interface {p0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x1

    xor-int/2addr v1, v2

    if-eq v1, v2, :cond_0

    goto :goto_0

    .line 635
    :cond_0
    sget-object v1, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    sget-object v2, Lcom/appsflyer/internal/AFg1cSDK;->AFLogger:Lcom/appsflyer/internal/AFg1cSDK;

    const-string v3, "Permission android.permission.INTERNET is missing in the AndroidManifest.xml"

    invoke-virtual {v1, v2, v3}, Lcom/appsflyer/internal/AFh1ySDK;->w(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;)V

    .line 636
    :goto_0
    const-string v1, "android.permission.ACCESS_NETWORK_STATE"

    invoke-interface {p0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v1, :cond_1

    goto :goto_1

    .line 637
    :cond_1
    sget v1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 v1, v1, 0x65

    rem-int/lit16 v1, v1, 0x80

    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 638
    :try_start_1
    sget-object v1, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    sget-object v2, Lcom/appsflyer/internal/AFg1cSDK;->AFLogger:Lcom/appsflyer/internal/AFg1cSDK;

    const-string v3, "Permission android.permission.ACCESS_NETWORK_STATE is missing in the AndroidManifest.xml"

    invoke-virtual {v1, v2, v3}, Lcom/appsflyer/internal/AFh1ySDK;->w(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;)V

    .line 639
    :goto_1
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    const/16 v2, 0x20

    if-le v1, v2, :cond_3

    .line 640
    sget v1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    add-int/lit8 v1, v1, 0xb

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    rem-int/lit8 v1, v1, 0x2

    const-string v2, "com.google.android.gms.permission.AD_ID"

    if-eqz v1, :cond_2

    .line 641
    :try_start_2
    invoke-interface {p0, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3

    .line 642
    sget-object p0, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    sget-object v1, Lcom/appsflyer/internal/AFg1cSDK;->AFLogger:Lcom/appsflyer/internal/AFg1cSDK;

    const-string v2, "Permission com.google.android.gms.permission.AD_ID is missing in the AndroidManifest.xml"

    invoke-virtual {p0, v1, v2}, Lcom/appsflyer/internal/AFh1ySDK;->w(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 643
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 p0, p0, 0x2b

    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    goto :goto_2

    :catch_0
    move-exception p0

    goto :goto_3

    :cond_2
    :try_start_3
    invoke-interface {p0, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    :try_start_4
    throw v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :catchall_0
    move-exception p0

    .line 644
    throw p0

    :cond_3
    :goto_2
    return-object v0

    .line 645
    :goto_3
    sget-object v1, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    sget-object v2, Lcom/appsflyer/internal/AFg1cSDK;->AFLogger:Lcom/appsflyer/internal/AFg1cSDK;

    const-string v3, "Exception while validation permissions. "

    invoke-virtual {v1, v2, v3, p0}, Lcom/appsflyer/internal/AFh1ySDK;->e(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object v0
.end method

.method public static synthetic AFAdRevenueData([Ljava/lang/Object;III)Ljava/lang/Object;
    .locals 6

    .line 1
    mul-int/lit16 v0, p1, 0x18f

    .line 2
    .line 3
    mul-int/lit16 v1, p2, 0x18f

    .line 4
    .line 5
    add-int/2addr v0, v1

    .line 6
    not-int v1, p1

    .line 7
    or-int/2addr v1, p2

    .line 8
    not-int v1, v1

    .line 9
    not-int v2, p2

    .line 10
    or-int v3, v2, p1

    .line 11
    .line 12
    not-int v3, v3

    .line 13
    or-int v4, v1, v3

    .line 14
    .line 15
    or-int v5, v2, p3

    .line 16
    .line 17
    not-int v5, v5

    .line 18
    or-int/2addr v4, v5

    .line 19
    mul-int/lit16 v4, v4, 0x18e

    .line 20
    .line 21
    add-int/2addr v0, v4

    .line 22
    or-int/2addr p1, p2

    .line 23
    mul-int/lit16 p1, p1, -0x4aa

    .line 24
    .line 25
    add-int/2addr v0, p1

    .line 26
    not-int p1, p3

    .line 27
    or-int/2addr p1, v2

    .line 28
    not-int p1, p1

    .line 29
    or-int/2addr p1, v1

    .line 30
    or-int/2addr p1, v3

    .line 31
    mul-int/lit16 p1, p1, 0x18e

    .line 32
    .line 33
    add-int/2addr v0, p1

    .line 34
    const/4 p1, 0x2

    .line 35
    const/4 p2, 0x1

    .line 36
    const/4 p3, 0x0

    .line 37
    const/4 v1, 0x0

    .line 38
    packed-switch v0, :pswitch_data_0

    .line 39
    .line 40
    .line 41
    invoke-static {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getMonetizationNetwork([Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0

    .line 46
    :pswitch_0
    invoke-static {p0}, Lcom/appsflyer/internal/AFb1tSDK;->values([Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0

    .line 51
    :pswitch_1
    aget-object p3, p0, p3

    .line 52
    .line 53
    check-cast p3, Lcom/appsflyer/internal/AFb1tSDK;

    .line 54
    .line 55
    aget-object p2, p0, p2

    .line 56
    .line 57
    check-cast p2, Landroid/content/Context;

    .line 58
    .line 59
    aget-object p0, p0, p1

    .line 60
    .line 61
    check-cast p0, Ljava/lang/String;

    .line 62
    .line 63
    new-instance p1, Lcom/appsflyer/internal/AFh1mSDK;

    .line 64
    .line 65
    invoke-direct {p1}, Lcom/appsflyer/internal/AFh1mSDK;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p3, p2}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code(Landroid/content/Context;)V

    .line 69
    .line 70
    .line 71
    iput-object v1, p1, Lcom/appsflyer/internal/AFa1mSDK;->component4:Ljava/lang/String;

    .line 72
    .line 73
    iput-object v1, p1, Lcom/appsflyer/internal/AFa1mSDK;->getMonetizationNetwork:Ljava/util/Map;

    .line 74
    .line 75
    iput-object p0, p1, Lcom/appsflyer/internal/AFa1mSDK;->component2:Ljava/lang/String;

    .line 76
    .line 77
    iput-object v1, p1, Lcom/appsflyer/internal/AFa1mSDK;->getCurrencyIso4217Code:Ljava/lang/String;

    .line 78
    .line 79
    filled-new-array {p3, p1}, [Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-static {p3}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    const p2, 0x94b72ff

    .line 88
    .line 89
    .line 90
    const p3, -0x94b72fa

    .line 91
    .line 92
    .line 93
    invoke-static {p0, p2, p3, p1}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 97
    .line 98
    add-int/lit8 p0, p0, 0x2b

    .line 99
    .line 100
    rem-int/lit16 p0, p0, 0x80

    .line 101
    .line 102
    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 103
    .line 104
    return-object v1

    .line 105
    :pswitch_2
    invoke-static {p0}, Lcom/appsflyer/internal/AFb1tSDK;->AFInAppEventParameterName([Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    return-object p0

    .line 110
    :pswitch_3
    invoke-static {p0}, Lcom/appsflyer/internal/AFb1tSDK;->equals([Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    return-object p0

    .line 115
    :pswitch_4
    invoke-static {p0}, Lcom/appsflyer/internal/AFb1tSDK;->toString([Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    return-object p0

    .line 120
    :pswitch_5
    invoke-static {p0}, Lcom/appsflyer/internal/AFb1tSDK;->hashCode([Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    return-object p0

    .line 125
    :pswitch_6
    invoke-static {p0}, Lcom/appsflyer/internal/AFb1tSDK;->copy([Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    return-object p0

    .line 130
    :pswitch_7
    aget-object p0, p0, p3

    .line 131
    .line 132
    check-cast p0, Lcom/appsflyer/internal/AFb1tSDK;

    .line 133
    .line 134
    sget p1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 135
    .line 136
    add-int/lit8 p1, p1, 0x27

    .line 137
    .line 138
    rem-int/lit16 p1, p1, 0x80

    .line 139
    .line 140
    sput p1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 141
    .line 142
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->equals()Lcom/appsflyer/internal/AFj1vSDK;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFj1vSDK;->AFAdRevenueData()[Lcom/appsflyer/internal/AFj1zSDK;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    sget p1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 155
    .line 156
    add-int/lit8 p1, p1, 0x3f

    .line 157
    .line 158
    rem-int/lit16 p1, p1, 0x80

    .line 159
    .line 160
    sput p1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 161
    .line 162
    return-object p0

    .line 163
    :pswitch_8
    aget-object p1, p0, p3

    .line 164
    .line 165
    check-cast p1, Lcom/appsflyer/internal/AFb1tSDK;

    .line 166
    .line 167
    aget-object p0, p0, p2

    .line 168
    .line 169
    check-cast p0, Ljava/lang/Boolean;

    .line 170
    .line 171
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 172
    .line 173
    .line 174
    move-result p0

    .line 175
    sget p1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 176
    .line 177
    add-int/lit8 p1, p1, 0x6f

    .line 178
    .line 179
    rem-int/lit16 p1, p1, 0x80

    .line 180
    .line 181
    sput p1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 182
    .line 183
    const-string p1, "setDisableNetworkData: "

    .line 184
    .line 185
    invoke-static {p0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object p2

    .line 189
    invoke-virtual {p1, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object p1

    .line 193
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    .line 194
    .line 195
    .line 196
    const-string p1, "disableCollectNetworkData"

    .line 197
    .line 198
    invoke-static {p1, p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code(Ljava/lang/String;Z)V

    .line 199
    .line 200
    .line 201
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 202
    .line 203
    add-int/lit8 p0, p0, 0x15

    .line 204
    .line 205
    rem-int/lit16 p0, p0, 0x80

    .line 206
    .line 207
    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 208
    .line 209
    return-object v1

    .line 210
    :pswitch_9
    invoke-static {p0}, Lcom/appsflyer/internal/AFb1tSDK;->copydefault([Ljava/lang/Object;)Ljava/lang/Object;

    .line 211
    .line 212
    .line 213
    move-result-object p0

    .line 214
    return-object p0

    .line 215
    :pswitch_a
    invoke-static {p0}, Lcom/appsflyer/internal/AFb1tSDK;->component4([Ljava/lang/Object;)Ljava/lang/Object;

    .line 216
    .line 217
    .line 218
    move-result-object p0

    .line 219
    return-object p0

    .line 220
    :pswitch_b
    invoke-static {p0}, Lcom/appsflyer/internal/AFb1tSDK;->component2([Ljava/lang/Object;)Ljava/lang/Object;

    .line 221
    .line 222
    .line 223
    move-result-object p0

    .line 224
    return-object p0

    .line 225
    :pswitch_c
    invoke-static {p0}, Lcom/appsflyer/internal/AFb1tSDK;->component3([Ljava/lang/Object;)Ljava/lang/Object;

    .line 226
    .line 227
    .line 228
    move-result-object p0

    .line 229
    return-object p0

    .line 230
    :pswitch_d
    aget-object p0, p0, p3

    .line 231
    .line 232
    check-cast p0, Lcom/appsflyer/internal/AFb1tSDK;

    .line 233
    .line 234
    new-instance p1, Lcom/appsflyer/internal/AFh1oSDK;

    .line 235
    .line 236
    invoke-direct {p1}, Lcom/appsflyer/internal/AFh1oSDK;-><init>()V

    .line 237
    .line 238
    .line 239
    invoke-direct {p0, p1}, Lcom/appsflyer/internal/AFb1tSDK;->getRevenue(Lcom/appsflyer/internal/AFa1mSDK;)V

    .line 240
    .line 241
    .line 242
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 243
    .line 244
    add-int/lit8 p0, p0, 0x5f

    .line 245
    .line 246
    rem-int/lit16 p0, p0, 0x80

    .line 247
    .line 248
    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 249
    .line 250
    return-object v1

    .line 251
    :pswitch_e
    aget-object v0, p0, p3

    .line 252
    .line 253
    check-cast v0, Lcom/appsflyer/internal/AFb1tSDK;

    .line 254
    .line 255
    aget-object p2, p0, p2

    .line 256
    .line 257
    check-cast p2, Landroid/content/Context;

    .line 258
    .line 259
    aget-object v2, p0, p1

    .line 260
    .line 261
    check-cast v2, Ljava/util/Map;

    .line 262
    .line 263
    const/4 v3, 0x3

    .line 264
    aget-object p0, p0, v3

    .line 265
    .line 266
    check-cast p0, Lcom/appsflyer/PurchaseHandler$PurchaseValidationCallback;

    .line 267
    .line 268
    sget v3, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 269
    .line 270
    add-int/lit8 v3, v3, 0x57

    .line 271
    .line 272
    rem-int/lit16 v4, v3, 0x80

    .line 273
    .line 274
    sput v4, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 275
    .line 276
    rem-int/2addr v3, p1

    .line 277
    const-string p1, "subscriptions"

    .line 278
    .line 279
    if-eqz v3, :cond_0

    .line 280
    .line 281
    invoke-virtual {v0, p2}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code(Landroid/content/Context;)V

    .line 282
    .line 283
    .line 284
    invoke-virtual {v0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 285
    .line 286
    .line 287
    move-result-object p2

    .line 288
    invoke-interface {p2}, Lcom/appsflyer/internal/AFd1fSDK;->areAllFieldsValid()Lcom/appsflyer/PurchaseHandler;

    .line 289
    .line 290
    .line 291
    move-result-object p2

    .line 292
    new-array v0, p3, [Ljava/lang/String;

    .line 293
    .line 294
    aput-object p1, v0, p3

    .line 295
    .line 296
    invoke-virtual {p2, v2, p0, v0}, Lcom/appsflyer/PurchaseHandler;->getMonetizationNetwork(Ljava/util/Map;Lcom/appsflyer/PurchaseHandler$PurchaseValidationCallback;[Ljava/lang/String;)Z

    .line 297
    .line 298
    .line 299
    move-result p1

    .line 300
    if-eqz p1, :cond_1

    .line 301
    .line 302
    goto :goto_0

    .line 303
    :cond_0
    invoke-virtual {v0, p2}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code(Landroid/content/Context;)V

    .line 304
    .line 305
    .line 306
    invoke-virtual {v0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 307
    .line 308
    .line 309
    move-result-object p2

    .line 310
    invoke-interface {p2}, Lcom/appsflyer/internal/AFd1fSDK;->areAllFieldsValid()Lcom/appsflyer/PurchaseHandler;

    .line 311
    .line 312
    .line 313
    move-result-object p2

    .line 314
    filled-new-array {p1}, [Ljava/lang/String;

    .line 315
    .line 316
    .line 317
    move-result-object p1

    .line 318
    invoke-virtual {p2, v2, p0, p1}, Lcom/appsflyer/PurchaseHandler;->getMonetizationNetwork(Ljava/util/Map;Lcom/appsflyer/PurchaseHandler$PurchaseValidationCallback;[Ljava/lang/String;)Z

    .line 319
    .line 320
    .line 321
    move-result p1

    .line 322
    if-eqz p1, :cond_1

    .line 323
    .line 324
    :goto_0
    new-instance p1, Lcom/appsflyer/internal/AFf1vSDK;

    .line 325
    .line 326
    iget-object p3, p2, Lcom/appsflyer/PurchaseHandler;->getMonetizationNetwork:Lcom/appsflyer/internal/AFd1fSDK;

    .line 327
    .line 328
    invoke-direct {p1, v2, p0, p3}, Lcom/appsflyer/internal/AFf1vSDK;-><init>(Ljava/util/Map;Lcom/appsflyer/PurchaseHandler$PurchaseValidationCallback;Lcom/appsflyer/internal/AFd1fSDK;)V

    .line 329
    .line 330
    .line 331
    iget-object p0, p2, Lcom/appsflyer/PurchaseHandler;->AFAdRevenueData:Lcom/appsflyer/internal/AFe1aSDK;

    .line 332
    .line 333
    iget-object p2, p0, Lcom/appsflyer/internal/AFe1aSDK;->AFAdRevenueData:Ljava/util/concurrent/Executor;

    .line 334
    .line 335
    new-instance p3, Lcom/appsflyer/internal/AFe1aSDK$5;

    .line 336
    .line 337
    invoke-direct {p3, p0, p1}, Lcom/appsflyer/internal/AFe1aSDK$5;-><init>(Lcom/appsflyer/internal/AFe1aSDK;Lcom/appsflyer/internal/AFf1wSDK;)V

    .line 338
    .line 339
    .line 340
    invoke-interface {p2, p3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 341
    .line 342
    .line 343
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 344
    .line 345
    add-int/lit8 p0, p0, 0x1f

    .line 346
    .line 347
    rem-int/lit16 p0, p0, 0x80

    .line 348
    .line 349
    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 350
    .line 351
    :cond_1
    return-object v1

    .line 352
    :pswitch_f
    invoke-static {p0}, Lcom/appsflyer/internal/AFb1tSDK;->component1([Ljava/lang/Object;)Ljava/lang/Object;

    .line 353
    .line 354
    .line 355
    move-result-object p0

    .line 356
    return-object p0

    .line 357
    :pswitch_10
    invoke-static {p0}, Lcom/appsflyer/internal/AFb1tSDK;->areAllFieldsValid([Ljava/lang/Object;)Ljava/lang/Object;

    .line 358
    .line 359
    .line 360
    move-result-object p0

    .line 361
    return-object p0

    .line 362
    :pswitch_11
    invoke-static {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getMediationNetwork([Ljava/lang/Object;)Ljava/lang/Object;

    .line 363
    .line 364
    .line 365
    move-result-object p0

    .line 366
    return-object p0

    .line 367
    :pswitch_12
    aget-object p0, p0, p3

    .line 368
    .line 369
    check-cast p0, Ljava/lang/String;

    .line 370
    .line 371
    sget p2, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 372
    .line 373
    add-int/lit8 p2, p2, 0x27

    .line 374
    .line 375
    rem-int/lit16 v0, p2, 0x80

    .line 376
    .line 377
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 378
    .line 379
    rem-int/2addr p2, p1

    .line 380
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    .line 381
    .line 382
    .line 383
    move-result-object p1

    .line 384
    invoke-virtual {p1, p0, p3}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    .line 385
    .line 386
    .line 387
    move-result p0

    .line 388
    sget p1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 389
    .line 390
    add-int/lit8 p1, p1, 0x75

    .line 391
    .line 392
    rem-int/lit16 p1, p1, 0x80

    .line 393
    .line 394
    sput p1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 395
    .line 396
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 397
    .line 398
    .line 399
    move-result-object p0

    .line 400
    return-object p0

    .line 401
    :pswitch_13
    aget-object p1, p0, p3

    .line 402
    .line 403
    check-cast p1, Lcom/appsflyer/internal/AFb1tSDK;

    .line 404
    .line 405
    aget-object p0, p0, p2

    .line 406
    .line 407
    check-cast p0, Lcom/appsflyer/internal/AFa1mSDK;

    .line 408
    .line 409
    iget-object v0, p0, Lcom/appsflyer/internal/AFa1mSDK;->component4:Ljava/lang/String;

    .line 410
    .line 411
    if-nez v0, :cond_2

    .line 412
    .line 413
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 414
    .line 415
    add-int/lit8 v0, v0, 0x15

    .line 416
    .line 417
    rem-int/lit16 v0, v0, 0x80

    .line 418
    .line 419
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 420
    .line 421
    add-int/lit8 v0, v0, 0x2b

    .line 422
    .line 423
    rem-int/lit16 v0, v0, 0x80

    .line 424
    .line 425
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 426
    .line 427
    move v0, p2

    .line 428
    goto :goto_1

    .line 429
    :cond_2
    move v0, p3

    .line 430
    :goto_1
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData()Z

    .line 431
    .line 432
    .line 433
    move-result v2

    .line 434
    if-eqz v2, :cond_3

    .line 435
    .line 436
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 437
    .line 438
    add-int/lit8 p0, p0, 0x33

    .line 439
    .line 440
    rem-int/lit16 p0, p0, 0x80

    .line 441
    .line 442
    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 443
    .line 444
    const-string p0, "CustomerUserId not set, reporting is disabled"

    .line 445
    .line 446
    invoke-static {p0, p2}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;Z)V

    .line 447
    .line 448
    .line 449
    return-object v1

    .line 450
    :cond_3
    if-eqz v0, :cond_7

    .line 451
    .line 452
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    .line 453
    .line 454
    .line 455
    move-result-object v0

    .line 456
    const-string v2, "launchProtectEnabled"

    .line 457
    .line 458
    invoke-virtual {v0, v2, p2}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    .line 459
    .line 460
    .line 461
    move-result p2

    .line 462
    if-eqz p2, :cond_5

    .line 463
    .line 464
    invoke-direct {p1}, Lcom/appsflyer/internal/AFb1tSDK;->component1()Z

    .line 465
    .line 466
    .line 467
    move-result p2

    .line 468
    if-eqz p2, :cond_6

    .line 469
    .line 470
    sget p1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 471
    .line 472
    add-int/lit8 p1, p1, 0x35

    .line 473
    .line 474
    rem-int/lit16 p1, p1, 0x80

    .line 475
    .line 476
    sput p1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 477
    .line 478
    iget-object p0, p0, Lcom/appsflyer/internal/AFa1mSDK;->getRevenue:Lcom/appsflyer/attribution/AppsFlyerRequestListener;

    .line 479
    .line 480
    if-eqz p0, :cond_4

    .line 481
    .line 482
    const/16 p1, 0xa

    .line 483
    .line 484
    const-string p2, "Event timeout. Check \'minTimeBetweenSessions\' param"

    .line 485
    .line 486
    invoke-interface {p0, p1, p2}, Lcom/appsflyer/attribution/AppsFlyerRequestListener;->onError(ILjava/lang/String;)V

    .line 487
    .line 488
    .line 489
    :cond_4
    return-object v1

    .line 490
    :cond_5
    const-string p2, "Allowing multiple launches within a 5 second time window."

    .line 491
    .line 492
    invoke-static {p2}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 493
    .line 494
    .line 495
    :cond_6
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 496
    .line 497
    .line 498
    move-result-wide v2

    .line 499
    iput-wide v2, p1, Lcom/appsflyer/internal/AFb1tSDK;->component1:J

    .line 500
    .line 501
    :cond_7
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 502
    .line 503
    .line 504
    move-result-object p2

    .line 505
    invoke-interface {p2}, Lcom/appsflyer/internal/AFd1fSDK;->getCurrencyIso4217Code()Ljava/util/concurrent/ScheduledExecutorService;

    .line 506
    .line 507
    .line 508
    move-result-object p2

    .line 509
    new-instance v0, Lcom/appsflyer/internal/AFb1tSDK$AFa1uSDK;

    .line 510
    .line 511
    invoke-direct {v0, p1, p0, p3}, Lcom/appsflyer/internal/AFb1tSDK$AFa1uSDK;-><init>(Lcom/appsflyer/internal/AFb1tSDK;Lcom/appsflyer/internal/AFa1mSDK;B)V

    .line 512
    .line 513
    .line 514
    const-wide/16 p0, 0x0

    .line 515
    .line 516
    sget-object p3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 517
    .line 518
    invoke-static {p2, v0, p0, p1, p3}, Lcom/appsflyer/internal/AFj1oSDK;->getRevenue(Ljava/util/concurrent/ScheduledExecutorService;Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)V

    .line 519
    .line 520
    .line 521
    return-object v1

    .line 522
    :pswitch_14
    aget-object p1, p0, p3

    .line 523
    .line 524
    check-cast p1, Lcom/appsflyer/internal/AFb1tSDK;

    .line 525
    .line 526
    aget-object p0, p0, p2

    .line 527
    .line 528
    check-cast p0, Ljava/lang/String;

    .line 529
    .line 530
    sget p3, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 531
    .line 532
    add-int/lit8 p3, p3, 0x55

    .line 533
    .line 534
    rem-int/lit16 p3, p3, 0x80

    .line 535
    .line 536
    sput p3, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 537
    .line 538
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 539
    .line 540
    .line 541
    move-result-object p3

    .line 542
    invoke-interface {p3}, Lcom/appsflyer/internal/AFd1fSDK;->copydefault()Lcom/appsflyer/internal/AFb1bSDK;

    .line 543
    .line 544
    .line 545
    move-result-object p3

    .line 546
    const-string v0, "setImeiData"

    .line 547
    .line 548
    filled-new-array {p0}, [Ljava/lang/String;

    .line 549
    .line 550
    .line 551
    move-result-object v2

    .line 552
    invoke-interface {p3, v0, v2}, Lcom/appsflyer/internal/AFb1bSDK;->getMediationNetwork(Ljava/lang/String;[Ljava/lang/String;)V

    .line 553
    .line 554
    .line 555
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 556
    .line 557
    .line 558
    move-result-object p1

    .line 559
    invoke-interface {p1}, Lcom/appsflyer/internal/AFd1fSDK;->AFKeystoreWrapper()Lcom/appsflyer/internal/AFg1rSDK;

    .line 560
    .line 561
    .line 562
    move-result-object p1

    .line 563
    iput-object p0, p1, Lcom/appsflyer/internal/AFg1rSDK;->areAllFieldsValid:Ljava/lang/String;

    .line 564
    .line 565
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 566
    .line 567
    add-int/2addr p0, p2

    .line 568
    rem-int/lit16 p0, p0, 0x80

    .line 569
    .line 570
    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 571
    .line 572
    return-object v1

    .line 573
    :pswitch_15
    invoke-static {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getRevenue([Ljava/lang/Object;)Ljava/lang/Object;

    .line 574
    .line 575
    .line 576
    move-result-object p0

    .line 577
    return-object p0

    .line 578
    :pswitch_16
    invoke-static {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code([Ljava/lang/Object;)Ljava/lang/Object;

    .line 579
    .line 580
    .line 581
    move-result-object p0

    .line 582
    return-object p0

    .line 583
    :pswitch_17
    invoke-static {p0}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData([Ljava/lang/Object;)Ljava/lang/Object;

    .line 584
    .line 585
    .line 586
    move-result-object p0

    .line 587
    return-object p0

    .line 588
    nop

    .line 589
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private AFAdRevenueData(Landroid/content/Context;Lcom/appsflyer/internal/AFh1xSDK;)V
    .locals 3

    .line 592
    invoke-virtual {p0, p1}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code(Landroid/content/Context;)V

    .line 593
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    move-result-object p0

    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->component4()Lcom/appsflyer/internal/AFh1qSDK;

    move-result-object p0

    .line 594
    invoke-static {p1}, Lcom/appsflyer/internal/AFa1pSDK;->getMonetizationNetwork(Landroid/content/Context;)Lcom/appsflyer/internal/AFh1uSDK;

    move-result-object p1

    .line 595
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFh1qSDK;->getCurrencyIso4217Code()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 596
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 v0, v0, 0xf

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    rem-int/lit8 v0, v0, 0x2

    .line 597
    iget-object v1, p0, Lcom/appsflyer/internal/AFh1qSDK;->getRevenue:Ljava/util/Map;

    .line 598
    const-string v2, "api_name"

    if-eqz v0, :cond_0

    .line 599
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {v1, v2, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 600
    invoke-virtual {p0, p1}, Lcom/appsflyer/internal/AFh1qSDK;->getMediationNetwork(Lcom/appsflyer/internal/AFh1uSDK;)V

    const/16 p1, 0x4f

    .line 601
    div-int/lit8 p1, p1, 0x0

    goto :goto_0

    .line 602
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {v1, v2, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 603
    invoke-virtual {p0, p1}, Lcom/appsflyer/internal/AFh1qSDK;->getMediationNetwork(Lcom/appsflyer/internal/AFh1uSDK;)V

    .line 604
    :goto_0
    sget p1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 p1, p1, 0x3f

    rem-int/lit16 p1, p1, 0x80

    sput p1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 605
    :cond_1
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFh1qSDK;->getRevenue()V

    return-void
.end method

.method private static synthetic AFAdRevenueData(Lcom/appsflyer/internal/AFd1fSDK;)V
    .locals 1

    .line 590
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    add-int/lit8 v0, v0, 0x13

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->AFInAppEventType()Lcom/appsflyer/internal/AFb1uSDK;

    move-result-object p0

    invoke-interface {p0}, Lcom/appsflyer/internal/AFb1uSDK;->getMonetizationNetwork()V

    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    add-int/lit8 p0, p0, 0x23

    rem-int/lit16 v0, p0, 0x80

    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    rem-int/lit8 p0, p0, 0x2

    if-eqz p0, :cond_0

    return-void

    :cond_0
    const/4 p0, 0x0

    throw p0
.end method

.method private static AFAdRevenueData(Ljava/lang/String;)Z
    .locals 3

    .line 647
    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    long-to-int v0, v0

    const v1, -0x62b70ec8

    const v2, 0x62b70ece

    invoke-static {p0, v1, v2, v0}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData([Ljava/lang/Object;III)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0
.end method

.method private static synthetic AFInAppEventParameterName([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-object p0, p0, v0

    .line 3
    .line 4
    check-cast p0, Landroid/content/Context;

    .line 5
    .line 6
    sget v1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 7
    .line 8
    add-int/lit8 v1, v1, 0x39

    .line 9
    .line 10
    rem-int/lit16 v1, v1, 0x80

    .line 11
    .line 12
    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-virtual {v2, v3, v0}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    iget-object v2, v2, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    .line 28
    .line 29
    iget v2, v2, Landroid/content/pm/ApplicationInfo;->flags:I

    .line 30
    .line 31
    const v3, 0x8000

    .line 32
    .line 33
    .line 34
    and-int/2addr v2, v3

    .line 35
    if-eqz v2, :cond_5

    .line 36
    .line 37
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    .line 39
    const/16 v3, 0x1f

    .line 40
    .line 41
    const-string v4, "xml"

    .line 42
    .line 43
    const/4 v5, 0x1

    .line 44
    if-lt v2, v3, :cond_3

    .line 45
    .line 46
    sget v2, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 47
    .line 48
    add-int/lit8 v2, v2, 0x23

    .line 49
    .line 50
    rem-int/lit16 v3, v2, 0x80

    .line 51
    .line 52
    sput v3, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 53
    .line 54
    rem-int/lit8 v2, v2, 0x2

    .line 55
    .line 56
    const-string v3, "appsflyer_data_extraction_rules"

    .line 57
    .line 58
    if-nez v2, :cond_0

    .line 59
    .line 60
    :try_start_1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {v2, v3, v4, p0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    const/16 v2, 0x3c

    .line 73
    .line 74
    div-int/2addr v2, v0

    .line 75
    if-eqz p0, :cond_2

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :catchall_0
    move-exception p0

    .line 79
    goto :goto_1

    .line 80
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {v2, v3, v4, p0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    .line 90
    .line 91
    move-result p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 92
    if-eqz p0, :cond_2

    .line 93
    .line 94
    :goto_0
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 95
    .line 96
    add-int/lit8 p0, p0, 0x7b

    .line 97
    .line 98
    rem-int/lit16 v2, p0, 0x80

    .line 99
    .line 100
    sput v2, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 101
    .line 102
    rem-int/lit8 p0, p0, 0x2

    .line 103
    .line 104
    const-string v2, "appsflyer_data_extraction_rules.xml detected, using AppsFlyer data extraction rules for AppsFlyer SDK data"

    .line 105
    .line 106
    if-eqz p0, :cond_1

    .line 107
    .line 108
    :try_start_2
    sget-object p0, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 109
    .line 110
    sget-object v3, Lcom/appsflyer/internal/AFg1cSDK;->AFLogger:Lcom/appsflyer/internal/AFg1cSDK;

    .line 111
    .line 112
    invoke-virtual {p0, v3, v2, v0}, Lcom/appsflyer/internal/AFh1ySDK;->i(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;Z)V

    .line 113
    .line 114
    .line 115
    return-object v1

    .line 116
    :cond_1
    sget-object p0, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 117
    .line 118
    sget-object v0, Lcom/appsflyer/internal/AFg1cSDK;->AFLogger:Lcom/appsflyer/internal/AFg1cSDK;

    .line 119
    .line 120
    invoke-virtual {p0, v0, v2, v5}, Lcom/appsflyer/internal/AFh1ySDK;->i(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;Z)V

    .line 121
    .line 122
    .line 123
    return-object v1

    .line 124
    :cond_2
    sget-object p0, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 125
    .line 126
    sget-object v0, Lcom/appsflyer/internal/AFg1cSDK;->AFLogger:Lcom/appsflyer/internal/AFg1cSDK;

    .line 127
    .line 128
    const-string v2, "\'allowBackup\' is set to true; appsflyer_data_extraction_rules.xml is NOT detected.\nAppsFlyer shared preferences should be excluded from auto backup by adding: <exclude domain=\"sharedpref\" path=\"appsflyer-data\"/> to the Application\'s <data-extraction-rules> both in <device-transfer> and <cloud-backup>.\nIf Appsflyer\'s Purchase Connector is in use then you also must add to <device-transfer> and <cloud-backup> the following excludes: <exclude domain=\"sharedpref\" path=\"appsflyer-purchase-data\"/> AND <exclude domain=\"database\" path=\"afpurchases.db\"/>"

    .line 129
    .line 130
    invoke-virtual {p0, v0, v2, v5}, Lcom/appsflyer/internal/AFh1ySDK;->w(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;Z)V

    .line 131
    .line 132
    .line 133
    return-object v1

    .line 134
    :cond_3
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    const-string v2, "appsflyer_backup_rules"

    .line 139
    .line 140
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    invoke-virtual {v0, v2, v4, p0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    .line 146
    .line 147
    move-result p0

    .line 148
    if-eqz p0, :cond_4

    .line 149
    .line 150
    sget-object p0, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 151
    .line 152
    sget-object v0, Lcom/appsflyer/internal/AFg1cSDK;->AFLogger:Lcom/appsflyer/internal/AFg1cSDK;

    .line 153
    .line 154
    const-string v2, "appsflyer_backup_rules.xml detected, using AppsFlyer defined backup rules for AppsFlyer SDK data"

    .line 155
    .line 156
    invoke-virtual {p0, v0, v2, v5}, Lcom/appsflyer/internal/AFh1ySDK;->i(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;Z)V

    .line 157
    .line 158
    .line 159
    return-object v1

    .line 160
    :cond_4
    sget-object p0, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 161
    .line 162
    sget-object v0, Lcom/appsflyer/internal/AFg1cSDK;->AFLogger:Lcom/appsflyer/internal/AFg1cSDK;

    .line 163
    .line 164
    const-string v2, "\'allowBackup\' is set to true; appsflyer_backup_rules.xml is NOT detected.\nAppsFlyer shared preferences should be excluded from auto backup by adding: <exclude domain=\"sharedpref\" path=\"appsflyer-data\"/> to the Application\'s <full-backup-content> rules.\nIf Appsflyer\'s Purchase Connector is in use then you also must add the following to your rules: <exclude domain=\"sharedpref\" path=\"appsflyer-purchase-data\"/> AND <exclude domain=\"database\" path=\"afpurchases.db\"/>"

    .line 165
    .line 166
    invoke-virtual {p0, v0, v2, v5}, Lcom/appsflyer/internal/AFh1ySDK;->w(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 167
    .line 168
    .line 169
    :cond_5
    return-object v1

    .line 170
    :goto_1
    sget-object v0, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 171
    .line 172
    sget-object v2, Lcom/appsflyer/internal/AFg1cSDK;->AFLogger:Lcom/appsflyer/internal/AFg1cSDK;

    .line 173
    .line 174
    const-string v3, "Exception while checking BackupRules: "

    .line 175
    .line 176
    invoke-virtual {v0, v2, v3, p0}, Lcom/appsflyer/internal/AFh1ySDK;->e(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 177
    .line 178
    .line 179
    return-object v1
.end method

.method public static synthetic a(Lcom/appsflyer/internal/AFb1tSDK;)V
    .locals 0

    .line 249
    invoke-direct {p0}, Lcom/appsflyer/internal/AFb1tSDK;->equals()V

    return-void
.end method

.method private static a([II[Ljava/lang/Object;)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Lcom/appsflyer/internal/AFk1wSDK;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/appsflyer/internal/AFk1wSDK;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 v2, 0x4

    .line 9
    new-array v2, v2, [C

    .line 10
    .line 11
    array-length v3, v0

    .line 12
    const/4 v4, 0x2

    .line 13
    mul-int/2addr v3, v4

    .line 14
    new-array v3, v3, [C

    .line 15
    .line 16
    sget-object v5, Lcom/appsflyer/internal/AFb1tSDK;->AFInAppEventParameterName:[I

    .line 17
    .line 18
    const-wide v6, 0x73c631727ff9d6bfL    # 4.965528025744614E249

    .line 19
    .line 20
    .line 21
    .line 22
    .line 23
    const/4 v8, 0x0

    .line 24
    if-eqz v5, :cond_1

    .line 25
    .line 26
    array-length v9, v5

    .line 27
    new-array v10, v9, [I

    .line 28
    .line 29
    move v11, v8

    .line 30
    :goto_0
    if-ge v11, v9, :cond_0

    .line 31
    .line 32
    sget v12, Lcom/appsflyer/internal/AFb1tSDK;->$11:I

    .line 33
    .line 34
    add-int/lit8 v12, v12, 0xb

    .line 35
    .line 36
    rem-int/lit16 v12, v12, 0x80

    .line 37
    .line 38
    sput v12, Lcom/appsflyer/internal/AFb1tSDK;->$10:I

    .line 39
    .line 40
    aget v12, v5, v11

    .line 41
    .line 42
    int-to-long v12, v12

    .line 43
    xor-long/2addr v12, v6

    .line 44
    long-to-int v12, v12

    .line 45
    aput v12, v10, v11

    .line 46
    .line 47
    add-int/lit8 v11, v11, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    move-object v5, v10

    .line 51
    :cond_1
    array-length v5, v5

    .line 52
    new-array v9, v5, [I

    .line 53
    .line 54
    sget-object v10, Lcom/appsflyer/internal/AFb1tSDK;->AFInAppEventParameterName:[I

    .line 55
    .line 56
    if-eqz v10, :cond_3

    .line 57
    .line 58
    array-length v11, v10

    .line 59
    new-array v12, v11, [I

    .line 60
    .line 61
    move v13, v8

    .line 62
    :goto_1
    if-ge v13, v11, :cond_2

    .line 63
    .line 64
    aget v14, v10, v13

    .line 65
    .line 66
    int-to-long v14, v14

    .line 67
    xor-long/2addr v14, v6

    .line 68
    long-to-int v14, v14

    .line 69
    aput v14, v12, v13

    .line 70
    .line 71
    add-int/lit8 v13, v13, 0x1

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_2
    sget v6, Lcom/appsflyer/internal/AFb1tSDK;->$11:I

    .line 75
    .line 76
    add-int/lit8 v6, v6, 0x23

    .line 77
    .line 78
    rem-int/lit16 v6, v6, 0x80

    .line 79
    .line 80
    sput v6, Lcom/appsflyer/internal/AFb1tSDK;->$10:I

    .line 81
    .line 82
    move-object v10, v12

    .line 83
    :cond_3
    invoke-static {v10, v8, v9, v8, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 84
    .line 85
    .line 86
    iput v8, v1, Lcom/appsflyer/internal/AFk1wSDK;->getCurrencyIso4217Code:I

    .line 87
    .line 88
    :goto_2
    iget v5, v1, Lcom/appsflyer/internal/AFk1wSDK;->getCurrencyIso4217Code:I

    .line 89
    .line 90
    array-length v6, v0

    .line 91
    if-ge v5, v6, :cond_5

    .line 92
    .line 93
    sget v6, Lcom/appsflyer/internal/AFb1tSDK;->$11:I

    .line 94
    .line 95
    add-int/lit8 v6, v6, 0x69

    .line 96
    .line 97
    rem-int/lit16 v6, v6, 0x80

    .line 98
    .line 99
    sput v6, Lcom/appsflyer/internal/AFb1tSDK;->$10:I

    .line 100
    .line 101
    aget v6, v0, v5

    .line 102
    .line 103
    shr-int/lit8 v7, v6, 0x10

    .line 104
    .line 105
    int-to-char v7, v7

    .line 106
    aput-char v7, v2, v8

    .line 107
    .line 108
    int-to-char v6, v6

    .line 109
    const/4 v10, 0x1

    .line 110
    aput-char v6, v2, v10

    .line 111
    .line 112
    add-int/lit8 v11, v5, 0x1

    .line 113
    .line 114
    aget v11, v0, v11

    .line 115
    .line 116
    const/16 v12, 0x10

    .line 117
    .line 118
    shr-int/2addr v11, v12

    .line 119
    int-to-char v11, v11

    .line 120
    aput-char v11, v2, v4

    .line 121
    .line 122
    add-int/lit8 v5, v5, 0x1

    .line 123
    .line 124
    aget v5, v0, v5

    .line 125
    .line 126
    int-to-char v5, v5

    .line 127
    const/4 v13, 0x3

    .line 128
    aput-char v5, v2, v13

    .line 129
    .line 130
    shl-int/2addr v7, v12

    .line 131
    add-int/2addr v7, v6

    .line 132
    iput v7, v1, Lcom/appsflyer/internal/AFk1wSDK;->getMediationNetwork:I

    .line 133
    .line 134
    shl-int/lit8 v6, v11, 0x10

    .line 135
    .line 136
    add-int/2addr v6, v5

    .line 137
    iput v6, v1, Lcom/appsflyer/internal/AFk1wSDK;->getMonetizationNetwork:I

    .line 138
    .line 139
    invoke-static {v9}, Lcom/appsflyer/internal/AFk1wSDK;->getMonetizationNetwork([I)V

    .line 140
    .line 141
    .line 142
    move v5, v8

    .line 143
    :goto_3
    iget v6, v1, Lcom/appsflyer/internal/AFk1wSDK;->getMediationNetwork:I

    .line 144
    .line 145
    if-ge v5, v12, :cond_4

    .line 146
    .line 147
    aget v7, v9, v5

    .line 148
    .line 149
    xor-int/2addr v6, v7

    .line 150
    iput v6, v1, Lcom/appsflyer/internal/AFk1wSDK;->getMediationNetwork:I

    .line 151
    .line 152
    invoke-static {v6}, Lcom/appsflyer/internal/AFk1wSDK;->getMediationNetwork(I)I

    .line 153
    .line 154
    .line 155
    move-result v6

    .line 156
    iget v7, v1, Lcom/appsflyer/internal/AFk1wSDK;->getMonetizationNetwork:I

    .line 157
    .line 158
    xor-int/2addr v6, v7

    .line 159
    iget v7, v1, Lcom/appsflyer/internal/AFk1wSDK;->getMediationNetwork:I

    .line 160
    .line 161
    iput v6, v1, Lcom/appsflyer/internal/AFk1wSDK;->getMediationNetwork:I

    .line 162
    .line 163
    iput v7, v1, Lcom/appsflyer/internal/AFk1wSDK;->getMonetizationNetwork:I

    .line 164
    .line 165
    add-int/lit8 v5, v5, 0x1

    .line 166
    .line 167
    goto :goto_3

    .line 168
    :cond_4
    iget v5, v1, Lcom/appsflyer/internal/AFk1wSDK;->getMonetizationNetwork:I

    .line 169
    .line 170
    iput v5, v1, Lcom/appsflyer/internal/AFk1wSDK;->getMediationNetwork:I

    .line 171
    .line 172
    iput v6, v1, Lcom/appsflyer/internal/AFk1wSDK;->getMonetizationNetwork:I

    .line 173
    .line 174
    aget v7, v9, v12

    .line 175
    .line 176
    xor-int/2addr v6, v7

    .line 177
    iput v6, v1, Lcom/appsflyer/internal/AFk1wSDK;->getMonetizationNetwork:I

    .line 178
    .line 179
    const/16 v7, 0x11

    .line 180
    .line 181
    aget v7, v9, v7

    .line 182
    .line 183
    xor-int/2addr v5, v7

    .line 184
    iput v5, v1, Lcom/appsflyer/internal/AFk1wSDK;->getMediationNetwork:I

    .line 185
    .line 186
    ushr-int/lit8 v7, v5, 0x10

    .line 187
    .line 188
    int-to-char v7, v7

    .line 189
    aput-char v7, v2, v8

    .line 190
    .line 191
    int-to-char v5, v5

    .line 192
    aput-char v5, v2, v10

    .line 193
    .line 194
    ushr-int/lit8 v5, v6, 0x10

    .line 195
    .line 196
    int-to-char v5, v5

    .line 197
    aput-char v5, v2, v4

    .line 198
    .line 199
    int-to-char v5, v6

    .line 200
    aput-char v5, v2, v13

    .line 201
    .line 202
    invoke-static {v9}, Lcom/appsflyer/internal/AFk1wSDK;->getMonetizationNetwork([I)V

    .line 203
    .line 204
    .line 205
    iget v5, v1, Lcom/appsflyer/internal/AFk1wSDK;->getCurrencyIso4217Code:I

    .line 206
    .line 207
    mul-int/lit8 v6, v5, 0x2

    .line 208
    .line 209
    aget-char v7, v2, v8

    .line 210
    .line 211
    aput-char v7, v3, v6

    .line 212
    .line 213
    mul-int/lit8 v6, v5, 0x2

    .line 214
    .line 215
    add-int/2addr v6, v10

    .line 216
    aget-char v7, v2, v10

    .line 217
    .line 218
    aput-char v7, v3, v6

    .line 219
    .line 220
    mul-int/lit8 v6, v5, 0x2

    .line 221
    .line 222
    add-int/2addr v6, v4

    .line 223
    aget-char v7, v2, v4

    .line 224
    .line 225
    aput-char v7, v3, v6

    .line 226
    .line 227
    mul-int/lit8 v6, v5, 0x2

    .line 228
    .line 229
    add-int/2addr v6, v13

    .line 230
    aget-char v7, v2, v13

    .line 231
    .line 232
    aput-char v7, v3, v6

    .line 233
    .line 234
    add-int/2addr v5, v4

    .line 235
    iput v5, v1, Lcom/appsflyer/internal/AFk1wSDK;->getCurrencyIso4217Code:I

    .line 236
    .line 237
    goto/16 :goto_2

    .line 238
    .line 239
    :cond_5
    new-instance v0, Ljava/lang/String;

    .line 240
    .line 241
    move/from16 v1, p1

    .line 242
    .line 243
    invoke-direct {v0, v3, v8, v1}, Ljava/lang/String;-><init>([CII)V

    .line 244
    .line 245
    .line 246
    aput-object v0, p2, v8

    .line 247
    .line 248
    return-void
.end method

.method private static synthetic areAllFieldsValid([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-object v0, p0, v0

    .line 3
    .line 4
    check-cast v0, Lcom/appsflyer/internal/AFb1tSDK;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    aget-object v1, p0, v1

    .line 8
    .line 9
    check-cast v1, Landroid/content/Context;

    .line 10
    .line 11
    const/4 v2, 0x2

    .line 12
    aget-object p0, p0, v2

    .line 13
    .line 14
    check-cast p0, Landroid/content/Intent;

    .line 15
    .line 16
    new-instance v3, Lcom/appsflyer/internal/AFj1sSDK;

    .line 17
    .line 18
    invoke-direct {v3, p0}, Lcom/appsflyer/internal/AFj1sSDK;-><init>(Landroid/content/Intent;)V

    .line 19
    .line 20
    .line 21
    const-string p0, "appsflyer_preinstall"

    .line 22
    .line 23
    invoke-virtual {v3, p0}, Lcom/appsflyer/internal/AFj1sSDK;->getMonetizationNetwork(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    if-eqz v4, :cond_0

    .line 28
    .line 29
    invoke-virtual {v3, p0}, Lcom/appsflyer/internal/AFj1sSDK;->getMonetizationNetwork(Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {p0}, Lcom/appsflyer/internal/AFb1tSDK;->component2(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    const-string p0, "****** onReceive called *******"

    .line 37
    .line 38
    invoke-static {p0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    .line 42
    .line 43
    .line 44
    const-string p0, "referrer"

    .line 45
    .line 46
    invoke-virtual {v3, p0}, Lcom/appsflyer/internal/AFj1sSDK;->getMonetizationNetwork(Ljava/lang/String;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    const-string v4, "Play store referrer: "

    .line 51
    .line 52
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v5

    .line 56
    invoke-virtual {v4, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    invoke-static {v4}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    const/4 v4, 0x0

    .line 64
    if-eqz v3, :cond_2

    .line 65
    .line 66
    sget v5, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 67
    .line 68
    add-int/lit8 v5, v5, 0x2d

    .line 69
    .line 70
    rem-int/lit16 v5, v5, 0x80

    .line 71
    .line 72
    sput v5, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Lcom/appsflyer/internal/AFb1tSDK;->getRevenue(Landroid/content/Context;)Lcom/appsflyer/internal/AFd1rSDK;

    .line 75
    .line 76
    .line 77
    move-result-object v5

    .line 78
    invoke-interface {v5, p0, v3}, Lcom/appsflyer/internal/AFd1rSDK;->getRevenue(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    const-string v5, "AF_REFERRER"

    .line 86
    .line 87
    invoke-virtual {p0, v5, v3}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    iput-object v3, p0, Lcom/appsflyer/AppsFlyerProperties;->AFAdRevenueData:Ljava/lang/String;

    .line 91
    .line 92
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-virtual {p0}, Lcom/appsflyer/AppsFlyerProperties;->getRevenue()Z

    .line 97
    .line 98
    .line 99
    move-result p0

    .line 100
    if-eqz p0, :cond_2

    .line 101
    .line 102
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 103
    .line 104
    add-int/lit8 p0, p0, 0x49

    .line 105
    .line 106
    rem-int/lit16 v5, p0, 0x80

    .line 107
    .line 108
    sput v5, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 109
    .line 110
    rem-int/2addr p0, v2

    .line 111
    const-string v2, "onReceive: isLaunchCalled"

    .line 112
    .line 113
    if-eqz p0, :cond_1

    .line 114
    .line 115
    invoke-static {v2}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    sget-object p0, Lcom/appsflyer/internal/AFh1xSDK;->getMonetizationNetwork:Lcom/appsflyer/internal/AFh1xSDK;

    .line 119
    .line 120
    invoke-direct {v0, v1, p0}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData(Landroid/content/Context;Lcom/appsflyer/internal/AFh1xSDK;)V

    .line 121
    .line 122
    .line 123
    invoke-direct {v0, v3}, Lcom/appsflyer/internal/AFb1tSDK;->getMediationNetwork(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 127
    .line 128
    add-int/lit8 p0, p0, 0x6b

    .line 129
    .line 130
    rem-int/lit16 p0, p0, 0x80

    .line 131
    .line 132
    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 133
    .line 134
    goto :goto_0

    .line 135
    :cond_1
    invoke-static {v2}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    sget-object p0, Lcom/appsflyer/internal/AFh1xSDK;->getMonetizationNetwork:Lcom/appsflyer/internal/AFh1xSDK;

    .line 139
    .line 140
    invoke-direct {v0, v1, p0}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData(Landroid/content/Context;Lcom/appsflyer/internal/AFh1xSDK;)V

    .line 141
    .line 142
    .line 143
    invoke-direct {v0, v3}, Lcom/appsflyer/internal/AFb1tSDK;->getMediationNetwork(Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    throw v4

    .line 147
    :cond_2
    :goto_0
    return-object v4
.end method

.method private static areAllFieldsValid()V
    .locals 3

    .line 148
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 v0, v0, 0x17

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    rem-int/lit8 v0, v0, 0x2

    const-string v1, "ERROR: AppsFlyer SDK is not initialized! You must provide AppsFlyer Dev-Key either in the \'init\' API method (should be called on Application\'s onCreate),or in the start() API (should be called on Activity\'s onCreate)."

    if-nez v0, :cond_0

    .line 149
    sget-object v0, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    sget-object v2, Lcom/appsflyer/internal/AFg1cSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFg1cSDK;

    invoke-virtual {v0, v2, v1}, Lcom/appsflyer/internal/AFh1ySDK;->w(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;)V

    return-void

    :cond_0
    sget-object v0, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    sget-object v2, Lcom/appsflyer/internal/AFg1cSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFg1cSDK;

    invoke-virtual {v0, v2, v1}, Lcom/appsflyer/internal/AFh1ySDK;->w(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 150
    throw v0
.end method

.method public static synthetic b(Lcom/appsflyer/internal/AFb1tSDK;Landroid/content/Context;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/appsflyer/internal/AFb1tSDK;->component3(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c(Lcom/appsflyer/internal/AFb1tSDK;Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/appsflyer/internal/AFb1tSDK;->j_(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method private component1(Landroid/content/Context;)Lcom/appsflyer/internal/AFh1sSDK;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 165
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 v0, v0, 0x6d

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 166
    instance-of v1, p1, Landroid/app/Activity;

    if-eqz v1, :cond_0

    .line 167
    new-instance v0, Lcom/appsflyer/internal/AFh1sSDK;

    check-cast p1, Landroid/app/Activity;

    .line 168
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    move-result-object p0

    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->registerClient()Lcom/appsflyer/internal/AFi1pSDK;

    move-result-object p0

    invoke-direct {v0, p1, p0}, Lcom/appsflyer/internal/AFh1sSDK;-><init>(Landroid/app/Activity;Lcom/appsflyer/internal/AFi1pSDK;)V

    return-object v0

    :cond_0
    add-int/lit8 v0, v0, 0x3f

    .line 169
    rem-int/lit16 p0, v0, 0x80

    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    rem-int/lit8 v0, v0, 0x2

    const/4 p0, 0x0

    if-nez v0, :cond_1

    const/16 p1, 0x3e

    div-int/lit8 p1, p1, 0x0

    :cond_1
    return-object p0
.end method

.method private static synthetic component1([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-object v0, p0, v0

    .line 3
    .line 4
    check-cast v0, Lcom/appsflyer/internal/AFb1tSDK;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    aget-object p0, p0, v1

    .line 8
    .line 9
    check-cast p0, Ljava/lang/String;

    .line 10
    .line 11
    sget v2, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 12
    .line 13
    add-int/lit8 v2, v2, 0x37

    .line 14
    .line 15
    rem-int/lit16 v3, v2, 0x80

    .line 16
    .line 17
    sput v3, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 18
    .line 19
    rem-int/lit8 v2, v2, 0x2

    .line 20
    .line 21
    const/4 v3, 0x0

    .line 22
    const-string v4, "setAppInviteOneLink = "

    .line 23
    .line 24
    const-string v5, "setAppInviteOneLink"

    .line 25
    .line 26
    const-string v6, "oneLinkSlug"

    .line 27
    .line 28
    if-nez v2, :cond_0

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1fSDK;->copydefault()Lcom/appsflyer/internal/AFb1bSDK;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-array v2, v1, [Ljava/lang/String;

    .line 39
    .line 40
    aput-object p0, v2, v1

    .line 41
    .line 42
    invoke-interface {v0, v5, v2}, Lcom/appsflyer/internal/AFb1bSDK;->getMediationNetwork(Ljava/lang/String;[Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v4, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    if-eqz p0, :cond_2

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    invoke-virtual {v0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1fSDK;->copydefault()Lcom/appsflyer/internal/AFb1bSDK;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    filled-new-array {p0}, [Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-interface {v0, v5, v1}, Lcom/appsflyer/internal/AFb1bSDK;->getMediationNetwork(Ljava/lang/String;[Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v4, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    if-eqz p0, :cond_2

    .line 86
    .line 87
    :goto_0
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 88
    .line 89
    add-int/lit8 v0, v0, 0x2b

    .line 90
    .line 91
    rem-int/lit16 v1, v0, 0x80

    .line 92
    .line 93
    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 94
    .line 95
    rem-int/lit8 v0, v0, 0x2

    .line 96
    .line 97
    if-nez v0, :cond_1

    .line 98
    .line 99
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {v0, v6}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-nez v0, :cond_3

    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_1
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-virtual {v0, v6}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    throw v3

    .line 126
    :cond_2
    :goto_1
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    const-string v1, "onelinkDomain"

    .line 131
    .line 132
    invoke-virtual {v0, v1}, Lcom/appsflyer/AppsFlyerProperties;->remove(Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    const-string v1, "onelinkVersion"

    .line 140
    .line 141
    invoke-virtual {v0, v1}, Lcom/appsflyer/AppsFlyerProperties;->remove(Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    const-string v1, "onelinkScheme"

    .line 149
    .line 150
    invoke-virtual {v0, v1}, Lcom/appsflyer/AppsFlyerProperties;->remove(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 154
    .line 155
    add-int/lit8 v0, v0, 0x43

    .line 156
    .line 157
    rem-int/lit16 v0, v0, 0x80

    .line 158
    .line 159
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 160
    .line 161
    :cond_3
    invoke-static {v6, p0}, Lcom/appsflyer/internal/AFb1tSDK;->getRevenue(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    return-object v3
.end method

.method private static component1(Ljava/lang/String;)V
    .locals 4

    .line 170
    sget-object v0, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    sget-object v1, Lcom/appsflyer/internal/AFg1cSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFg1cSDK;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "ERROR: AppsFlyer SDK is not initialized! The API call \'"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "()\' must be called after the \'init(String, AppsFlyerConversionListener)\' API method, which should be called on the Application\'s onCreate."

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Lcom/appsflyer/internal/AFh1ySDK;->w(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;)V

    .line 171
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    add-int/lit8 p0, p0, 0x3d

    rem-int/lit16 v0, p0, 0x80

    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    rem-int/lit8 p0, p0, 0x2

    if-eqz p0, :cond_0

    return-void

    :cond_0
    const/4 p0, 0x0

    throw p0
.end method

.method private component1()Z
    .locals 3

    .line 172
    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p0

    const v1, 0x46b3cd62

    const v2, -0x46b3cd54

    invoke-static {v0, v1, v2, p0}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData([Ljava/lang/Object;III)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0
.end method

.method private static synthetic component2([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 12

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-object v0, p0, v0

    .line 3
    .line 4
    check-cast v0, Lcom/appsflyer/internal/AFb1tSDK;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    aget-object v1, p0, v1

    .line 8
    .line 9
    check-cast v1, Landroid/content/Context;

    .line 10
    .line 11
    const/4 v2, 0x2

    .line 12
    aget-object v3, p0, v2

    .line 13
    .line 14
    check-cast v3, Ljava/lang/String;

    .line 15
    .line 16
    const/4 v4, 0x3

    .line 17
    aget-object p0, p0, v4

    .line 18
    .line 19
    check-cast p0, Lcom/appsflyer/attribution/AppsFlyerRequestListener;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    invoke-interface {v4}, Lcom/appsflyer/internal/AFd1fSDK;->i()Lcom/appsflyer/internal/AFd1wSDK;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    invoke-interface {v4}, Lcom/appsflyer/internal/AFd1wSDK;->getCurrencyIso4217Code()Z

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    const/4 v5, 0x0

    .line 34
    if-eqz v4, :cond_0

    .line 35
    .line 36
    return-object v5

    .line 37
    :cond_0
    iget-boolean v4, v0, Lcom/appsflyer/internal/AFb1tSDK;->hashCode:Z

    .line 38
    .line 39
    const-string v6, "No dev key"

    .line 40
    .line 41
    const/16 v7, 0x29

    .line 42
    .line 43
    const-string v8, "start"

    .line 44
    .line 45
    if-nez v4, :cond_3

    .line 46
    .line 47
    sget v4, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 48
    .line 49
    add-int/lit8 v4, v4, 0x6f

    .line 50
    .line 51
    rem-int/lit16 v9, v4, 0x80

    .line 52
    .line 53
    sput v9, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 54
    .line 55
    rem-int/2addr v4, v2

    .line 56
    if-eqz v4, :cond_2

    .line 57
    .line 58
    invoke-static {v8}, Lcom/appsflyer/internal/AFb1tSDK;->component1(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    if-nez v3, :cond_3

    .line 62
    .line 63
    if-eqz p0, :cond_1

    .line 64
    .line 65
    invoke-interface {p0, v7, v6}, Lcom/appsflyer/attribution/AppsFlyerRequestListener;->onError(ILjava/lang/String;)V

    .line 66
    .line 67
    .line 68
    :cond_1
    return-object v5

    .line 69
    :cond_2
    invoke-static {v8}, Lcom/appsflyer/internal/AFb1tSDK;->component1(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    throw v5

    .line 73
    :cond_3
    invoke-virtual {v0, v1}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code(Landroid/content/Context;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 77
    .line 78
    .line 79
    move-result-object v4

    .line 80
    invoke-interface {v4}, Lcom/appsflyer/internal/AFd1fSDK;->component4()Lcom/appsflyer/internal/AFh1qSDK;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    invoke-static {v1}, Lcom/appsflyer/internal/AFa1pSDK;->getMonetizationNetwork(Landroid/content/Context;)Lcom/appsflyer/internal/AFh1uSDK;

    .line 85
    .line 86
    .line 87
    move-result-object v9

    .line 88
    invoke-virtual {v4, v9}, Lcom/appsflyer/internal/AFh1qSDK;->getMediationNetwork(Lcom/appsflyer/internal/AFh1uSDK;)V

    .line 89
    .line 90
    .line 91
    iget-object v9, v0, Lcom/appsflyer/internal/AFb1tSDK;->copy:Landroid/app/Application;

    .line 92
    .line 93
    if-nez v9, :cond_6

    .line 94
    .line 95
    invoke-static {v1}, Lcom/appsflyer/internal/AFb1vSDK;->f_(Landroid/content/Context;)Landroid/app/Application;

    .line 96
    .line 97
    .line 98
    move-result-object v9

    .line 99
    if-eqz v9, :cond_4

    .line 100
    .line 101
    sget v2, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 102
    .line 103
    add-int/lit8 v2, v2, 0x13

    .line 104
    .line 105
    rem-int/lit16 v2, v2, 0x80

    .line 106
    .line 107
    sput v2, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 108
    .line 109
    iput-object v9, v0, Lcom/appsflyer/internal/AFb1tSDK;->copy:Landroid/app/Application;

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_4
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 113
    .line 114
    add-int/lit8 p0, p0, 0x6d

    .line 115
    .line 116
    rem-int/lit16 v0, p0, 0x80

    .line 117
    .line 118
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 119
    .line 120
    rem-int/2addr p0, v2

    .line 121
    if-eqz p0, :cond_5

    .line 122
    .line 123
    return-object v5

    .line 124
    :cond_5
    throw v5

    .line 125
    :cond_6
    :goto_0
    invoke-virtual {v0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    invoke-interface {v2}, Lcom/appsflyer/internal/AFd1fSDK;->copydefault()Lcom/appsflyer/internal/AFb1bSDK;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    filled-new-array {v3}, [Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v9

    .line 137
    invoke-interface {v2, v8, v9}, Lcom/appsflyer/internal/AFb1bSDK;->getMediationNetwork(Ljava/lang/String;[Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    sget-object v2, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 141
    .line 142
    sget-object v8, Lcom/appsflyer/internal/AFg1cSDK;->AFLogger:Lcom/appsflyer/internal/AFg1cSDK;

    .line 143
    .line 144
    sget-object v9, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData:Ljava/lang/String;

    .line 145
    .line 146
    const-string v10, "6.15.0"

    .line 147
    .line 148
    filled-new-array {v10, v9}, [Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object v10

    .line 152
    const-string v11, "Starting AppsFlyer: (v%s.%s)"

    .line 153
    .line 154
    invoke-static {v11, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v10

    .line 158
    invoke-virtual {v2, v8, v10}, Lcom/appsflyer/internal/AFh1ySDK;->i(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    new-instance v10, Ljava/lang/StringBuilder;

    .line 162
    .line 163
    const-string v11, "Build Number: "

    .line 164
    .line 165
    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    invoke-virtual {v10}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v9

    .line 175
    invoke-virtual {v2, v8, v9}, Lcom/appsflyer/internal/AFh1ySDK;->i(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;)V

    .line 176
    .line 177
    .line 178
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    .line 179
    .line 180
    .line 181
    move-result-object v2

    .line 182
    invoke-virtual {v0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 183
    .line 184
    .line 185
    move-result-object v8

    .line 186
    invoke-interface {v8}, Lcom/appsflyer/internal/AFd1fSDK;->getRevenue()Lcom/appsflyer/internal/AFd1rSDK;

    .line 187
    .line 188
    .line 189
    move-result-object v8

    .line 190
    invoke-virtual {v2, v8}, Lcom/appsflyer/AppsFlyerProperties;->loadProperties(Lcom/appsflyer/internal/AFd1rSDK;)V

    .line 191
    .line 192
    .line 193
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 194
    .line 195
    .line 196
    move-result v2

    .line 197
    if-nez v2, :cond_7

    .line 198
    .line 199
    invoke-virtual {v0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 200
    .line 201
    .line 202
    move-result-object v2

    .line 203
    invoke-interface {v2}, Lcom/appsflyer/internal/AFd1fSDK;->AFKeystoreWrapper()Lcom/appsflyer/internal/AFg1rSDK;

    .line 204
    .line 205
    .line 206
    move-result-object v2

    .line 207
    iput-object v3, v2, Lcom/appsflyer/internal/AFg1rSDK;->component1:Ljava/lang/String;

    .line 208
    .line 209
    invoke-static {v3}, Lcom/appsflyer/internal/AFb1kSDK;->AFAdRevenueData(Ljava/lang/String;)V

    .line 210
    .line 211
    .line 212
    goto :goto_1

    .line 213
    :cond_7
    invoke-virtual {v0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 214
    .line 215
    .line 216
    move-result-object v2

    .line 217
    invoke-interface {v2}, Lcom/appsflyer/internal/AFd1fSDK;->AFKeystoreWrapper()Lcom/appsflyer/internal/AFg1rSDK;

    .line 218
    .line 219
    .line 220
    move-result-object v2

    .line 221
    iget-object v2, v2, Lcom/appsflyer/internal/AFg1rSDK;->component1:Ljava/lang/String;

    .line 222
    .line 223
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 224
    .line 225
    .line 226
    move-result v2

    .line 227
    if-eqz v2, :cond_9

    .line 228
    .line 229
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 230
    .line 231
    add-int/lit8 v0, v0, 0x35

    .line 232
    .line 233
    rem-int/lit16 v0, v0, 0x80

    .line 234
    .line 235
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 236
    .line 237
    invoke-static {}, Lcom/appsflyer/internal/AFb1tSDK;->areAllFieldsValid()V

    .line 238
    .line 239
    .line 240
    if-eqz p0, :cond_8

    .line 241
    .line 242
    invoke-interface {p0, v7, v6}, Lcom/appsflyer/attribution/AppsFlyerRequestListener;->onError(ILjava/lang/String;)V

    .line 243
    .line 244
    .line 245
    :cond_8
    return-object v5

    .line 246
    :cond_9
    :goto_1
    invoke-virtual {v0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 247
    .line 248
    .line 249
    move-result-object v2

    .line 250
    invoke-interface {v2}, Lcom/appsflyer/internal/AFd1fSDK;->component2()Lcom/appsflyer/internal/AFg1wSDK;

    .line 251
    .line 252
    .line 253
    move-result-object v2

    .line 254
    invoke-direct {v0}, Lcom/appsflyer/internal/AFb1tSDK;->component3()Lcom/appsflyer/internal/AFg1ySDK;

    .line 255
    .line 256
    .line 257
    move-result-object v3

    .line 258
    invoke-virtual {v2, v3}, Lcom/appsflyer/internal/AFg1wSDK;->getCurrencyIso4217Code(Lcom/appsflyer/internal/AFg1ySDK;)V

    .line 259
    .line 260
    .line 261
    invoke-direct {v0}, Lcom/appsflyer/internal/AFb1tSDK;->component4()V

    .line 262
    .line 263
    .line 264
    iget-object v2, v0, Lcom/appsflyer/internal/AFb1tSDK;->copy:Landroid/app/Application;

    .line 265
    .line 266
    invoke-virtual {v2}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    .line 267
    .line 268
    .line 269
    move-result-object v2

    .line 270
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 271
    .line 272
    .line 273
    move-result-object v2

    .line 274
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 275
    .line 276
    .line 277
    move-result-wide v6

    .line 278
    long-to-int v3, v6

    .line 279
    const v6, -0x578ca6b0

    .line 280
    .line 281
    .line 282
    const v7, 0x578ca6c6

    .line 283
    .line 284
    .line 285
    invoke-static {v2, v6, v7, v3}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 286
    .line 287
    .line 288
    invoke-virtual {v0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 289
    .line 290
    .line 291
    move-result-object v2

    .line 292
    invoke-interface {v2}, Lcom/appsflyer/internal/AFd1fSDK;->d()Lcom/appsflyer/internal/AFc1eSDK;

    .line 293
    .line 294
    .line 295
    move-result-object v2

    .line 296
    invoke-interface {v2}, Lcom/appsflyer/internal/AFc1eSDK;->getRevenue()V

    .line 297
    .line 298
    .line 299
    iget-object v2, v0, Lcom/appsflyer/internal/AFb1tSDK;->copydefault:Lcom/appsflyer/internal/AFd1nSDK;

    .line 300
    .line 301
    invoke-virtual {v2}, Lcom/appsflyer/internal/AFd1nSDK;->i()Lcom/appsflyer/internal/AFd1wSDK;

    .line 302
    .line 303
    .line 304
    move-result-object v2

    .line 305
    new-instance v3, Lcom/appsflyer/internal/AFb1tSDK$5;

    .line 306
    .line 307
    invoke-direct {v3, v0, v4, p0}, Lcom/appsflyer/internal/AFb1tSDK$5;-><init>(Lcom/appsflyer/internal/AFb1tSDK;Lcom/appsflyer/internal/AFh1qSDK;Lcom/appsflyer/attribution/AppsFlyerRequestListener;)V

    .line 308
    .line 309
    .line 310
    invoke-interface {v2, v1, v3}, Lcom/appsflyer/internal/AFd1wSDK;->getCurrencyIso4217Code(Landroid/content/Context;Lcom/appsflyer/internal/AFd1wSDK$AFa1zSDK;)V

    .line 311
    .line 312
    .line 313
    return-object v5
.end method

.method private static component2(Landroid/content/Context;)V
    .locals 3

    .line 324
    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    long-to-int v0, v0

    const v1, 0x459e9d33

    const v2, -0x459e9d32

    invoke-static {p0, v1, v2, v0}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData([Ljava/lang/Object;III)Ljava/lang/Object;

    return-void
.end method

.method private static component2(Ljava/lang/String;)V
    .locals 2

    .line 314
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 315
    const-string v1, "pid"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v0, :cond_1

    .line 316
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 v0, v0, 0x69

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    rem-int/lit8 v0, v0, 0x2

    const-string v1, "preInstallName"

    if-eqz v0, :cond_0

    .line 317
    :try_start_1
    invoke-static {v1, p0}, Lcom/appsflyer/internal/AFb1tSDK;->getRevenue(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    const/4 p0, 0x7

    :try_start_2
    div-int/lit8 p0, p0, 0x0
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    return-void

    :catchall_0
    move-exception p0

    .line 318
    throw p0

    .line 319
    :cond_0
    :try_start_3
    invoke-static {v1, p0}, Lcom/appsflyer/internal/AFb1tSDK;->getRevenue(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 320
    :cond_1
    const-string p0, "Cannot set preinstall attribution data without a media source"

    invoke-static {p0}, Lcom/appsflyer/AFLogger;->afWarnLog(Ljava/lang/String;)V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_0

    .line 321
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 p0, p0, 0x65

    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    return-void

    :catch_0
    move-exception p0

    .line 322
    const-string v0, "Error parsing JSON for preinstall"

    invoke-static {v0, p0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method private component2()[Lcom/appsflyer/internal/AFj1zSDK;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 323
    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p0

    const v1, 0x3448c8f2

    const v2, -0x3448c8e1    # -2.4014398E7f

    invoke-static {v0, v1, v2, p0}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData([Ljava/lang/Object;III)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Lcom/appsflyer/internal/AFj1zSDK;

    return-object p0
.end method

.method private declared-synchronized component3()Lcom/appsflyer/internal/AFg1ySDK;
    .locals 4

    monitor-enter p0

    .line 110
    :try_start_0
    iget-object v0, p0, Lcom/appsflyer/internal/AFb1tSDK;->AFInAppEventType:Lcom/appsflyer/internal/AFg1ySDK;

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 111
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    add-int/lit8 v0, v0, 0xd

    rem-int/lit16 v2, v0, 0x80

    sput v2, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    rem-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_0

    .line 112
    new-instance v0, Lcom/appsflyer/internal/e;

    invoke-direct {v0, p0}, Lcom/appsflyer/internal/e;-><init>(Lcom/appsflyer/internal/AFb1tSDK;)V

    iput-object v0, p0, Lcom/appsflyer/internal/AFb1tSDK;->AFInAppEventType:Lcom/appsflyer/internal/AFg1ySDK;

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_1

    :cond_0
    new-instance v0, Lcom/appsflyer/internal/e;

    invoke-direct {v0, p0}, Lcom/appsflyer/internal/e;-><init>(Lcom/appsflyer/internal/AFb1tSDK;)V

    iput-object v0, p0, Lcom/appsflyer/internal/AFb1tSDK;->AFInAppEventType:Lcom/appsflyer/internal/AFg1ySDK;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 113
    :try_start_1
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :catchall_1
    move-exception v0

    :try_start_2
    throw v0

    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/appsflyer/internal/AFb1tSDK;->AFInAppEventType:Lcom/appsflyer/internal/AFg1ySDK;

    sget v2, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 v2, v2, 0x19

    rem-int/lit16 v3, v2, 0x80

    sput v3, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    rem-int/lit8 v2, v2, 0x2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-nez v2, :cond_2

    monitor-exit p0

    return-object v0

    :cond_2
    :try_start_3
    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :goto_1
    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v0
.end method

.method private static synthetic component3([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-object v0, p0, v0

    .line 3
    .line 4
    check-cast v0, Lcom/appsflyer/internal/AFb1tSDK;

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    aget-object v0, p0, v0

    .line 8
    .line 9
    check-cast v0, Ljava/lang/String;

    .line 10
    .line 11
    const/4 v1, 0x2

    .line 12
    aget-object v2, p0, v1

    .line 13
    .line 14
    check-cast v2, Ljava/lang/String;

    .line 15
    .line 16
    const/4 v3, 0x3

    .line 17
    aget-object p0, p0, v3

    .line 18
    .line 19
    check-cast p0, Ljava/lang/String;

    .line 20
    .line 21
    const-string v3, "setPreinstallAttribution API called"

    .line 22
    .line 23
    invoke-static {v3}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    new-instance v3, Lorg/json/JSONObject;

    .line 27
    .line 28
    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 29
    .line 30
    .line 31
    const-string v4, "pid"

    .line 32
    .line 33
    const/4 v5, 0x0

    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    :try_start_0
    invoke-virtual {v3, v4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catch_0
    move-exception p0

    .line 41
    goto :goto_2

    .line 42
    :cond_0
    :goto_0
    if-eqz v2, :cond_2

    .line 43
    .line 44
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 45
    .line 46
    add-int/lit8 v0, v0, 0x5f

    .line 47
    .line 48
    rem-int/lit16 v6, v0, 0x80

    .line 49
    .line 50
    sput v6, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 51
    .line 52
    rem-int/2addr v0, v1

    .line 53
    const-string v1, "c"

    .line 54
    .line 55
    if-eqz v0, :cond_1

    .line 56
    .line 57
    :try_start_1
    invoke-virtual {v3, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_1
    invoke-virtual {v3, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 62
    .line 63
    .line 64
    throw v5

    .line 65
    :cond_2
    :goto_1
    if-eqz p0, :cond_3

    .line 66
    .line 67
    :try_start_2
    const-string v0, "af_siteid"

    .line 68
    .line 69
    invoke-virtual {v3, v0, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    .line 70
    .line 71
    .line 72
    goto :goto_3

    .line 73
    :goto_2
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-static {v0, p0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 78
    .line 79
    .line 80
    :cond_3
    :goto_3
    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    if-eqz p0, :cond_4

    .line 85
    .line 86
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 87
    .line 88
    add-int/lit8 p0, p0, 0x63

    .line 89
    .line 90
    rem-int/lit16 p0, p0, 0x80

    .line 91
    .line 92
    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 93
    .line 94
    const-string p0, "preInstallName"

    .line 95
    .line 96
    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-static {p0, v0}, Lcom/appsflyer/internal/AFb1tSDK;->getRevenue(Ljava/lang/String;Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    return-object v5

    .line 104
    :cond_4
    const-string p0, "Cannot set preinstall attribution data without a media source"

    .line 105
    .line 106
    invoke-static {p0}, Lcom/appsflyer/AFLogger;->afWarnLog(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    return-object v5
.end method

.method private synthetic component3(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    .line 114
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p0

    const v0, -0x4f280486

    const v1, 0x4f28049a

    invoke-static {p1, v0, v1, p0}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData([Ljava/lang/Object;III)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method private static synthetic component4([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-object p0, p0, v0

    .line 3
    .line 4
    check-cast p0, Lcom/appsflyer/internal/AFb1tSDK;

    .line 5
    .line 6
    iget-wide v1, p0, Lcom/appsflyer/internal/AFb1tSDK;->component1:J

    .line 7
    .line 8
    const-wide/16 v3, 0x0

    .line 9
    .line 10
    cmp-long v1, v1, v3

    .line 11
    .line 12
    if-lez v1, :cond_3

    .line 13
    .line 14
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    iget-wide v2, p0, Lcom/appsflyer/internal/AFb1tSDK;->component1:J

    .line 19
    .line 20
    sub-long/2addr v0, v2

    .line 21
    new-instance v2, Ljava/text/SimpleDateFormat;

    .line 22
    .line 23
    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 24
    .line 25
    const-string v4, "yyyy/MM/dd HH:mm:ss.SSS Z"

    .line 26
    .line 27
    invoke-direct {v2, v4, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 28
    .line 29
    .line 30
    iget-wide v4, p0, Lcom/appsflyer/internal/AFb1tSDK;->component1:J

    .line 31
    .line 32
    invoke-static {v2, v4, v5}, Lcom/appsflyer/internal/AFb1tSDK;->getMediationNetwork(Ljava/text/SimpleDateFormat;J)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    iget-wide v5, p0, Lcom/appsflyer/internal/AFb1tSDK;->component2:J

    .line 37
    .line 38
    invoke-static {v2, v5, v6}, Lcom/appsflyer/internal/AFb1tSDK;->getMediationNetwork(Ljava/text/SimpleDateFormat;J)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    iget-wide v5, p0, Lcom/appsflyer/internal/AFb1tSDK;->component4:J

    .line 43
    .line 44
    cmp-long v5, v0, v5

    .line 45
    .line 46
    if-gez v5, :cond_1

    .line 47
    .line 48
    sget v5, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 49
    .line 50
    add-int/lit8 v5, v5, 0x55

    .line 51
    .line 52
    rem-int/lit16 v6, v5, 0x80

    .line 53
    .line 54
    sput v6, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 55
    .line 56
    rem-int/lit8 v5, v5, 0x2

    .line 57
    .line 58
    if-eqz v5, :cond_0

    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/appsflyer/AppsFlyerLib;->isStopped()Z

    .line 61
    .line 62
    .line 63
    move-result v5

    .line 64
    if-nez v5, :cond_1

    .line 65
    .line 66
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iget-wide v5, p0, Lcom/appsflyer/internal/AFb1tSDK;->component4:J

    .line 71
    .line 72
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    filled-new-array {v4, v2, v0, p0}, [Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    const-string v0, "Last Launch attempt: %s;\nLast successful Launch event: %s;\nThis launch is blocked: %s ms < %s ms"

    .line 81
    .line 82
    invoke-static {v3, v0, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-static {p0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 90
    .line 91
    return-object p0

    .line 92
    :cond_0
    invoke-virtual {p0}, Lcom/appsflyer/AppsFlyerLib;->isStopped()Z

    .line 93
    .line 94
    .line 95
    const/4 p0, 0x0

    .line 96
    throw p0

    .line 97
    :cond_1
    invoke-virtual {p0}, Lcom/appsflyer/AppsFlyerLib;->isStopped()Z

    .line 98
    .line 99
    .line 100
    move-result p0

    .line 101
    if-nez p0, :cond_2

    .line 102
    .line 103
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 104
    .line 105
    add-int/lit8 p0, p0, 0xf

    .line 106
    .line 107
    rem-int/lit16 p0, p0, 0x80

    .line 108
    .line 109
    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 110
    .line 111
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    filled-new-array {v4, v2, p0}, [Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    const-string v0, "Last Launch attempt: %s;\nLast successful Launch event: %s;\nSending launch (+%s ms)"

    .line 120
    .line 121
    invoke-static {v3, v0, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    invoke-static {p0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    :cond_2
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 129
    .line 130
    add-int/lit8 p0, p0, 0x61

    .line 131
    .line 132
    rem-int/lit16 p0, p0, 0x80

    .line 133
    .line 134
    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 135
    .line 136
    goto :goto_0

    .line 137
    :cond_3
    invoke-virtual {p0}, Lcom/appsflyer/AppsFlyerLib;->isStopped()Z

    .line 138
    .line 139
    .line 140
    move-result p0

    .line 141
    if-nez p0, :cond_5

    .line 142
    .line 143
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 144
    .line 145
    add-int/lit8 p0, p0, 0x5b

    .line 146
    .line 147
    rem-int/lit16 v1, p0, 0x80

    .line 148
    .line 149
    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 150
    .line 151
    rem-int/lit8 p0, p0, 0x2

    .line 152
    .line 153
    const-string v1, "Sending first launch for this session!"

    .line 154
    .line 155
    if-nez p0, :cond_4

    .line 156
    .line 157
    invoke-static {v1}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    const/16 p0, 0x36

    .line 161
    .line 162
    div-int/2addr p0, v0

    .line 163
    goto :goto_0

    .line 164
    :cond_4
    invoke-static {v1}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    :cond_5
    :goto_0
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 168
    .line 169
    add-int/lit8 p0, p0, 0x6b

    .line 170
    .line 171
    rem-int/lit16 p0, p0, 0x80

    .line 172
    .line 173
    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 174
    .line 175
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 176
    .line 177
    return-object p0
.end method

.method private component4()V
    .locals 3

    .line 178
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    add-int/lit8 v0, v0, 0x37

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 179
    invoke-static {}, Lcom/appsflyer/internal/AFf1qSDK;->areAllFieldsValid()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 180
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 p0, p0, 0x7b

    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    return-void

    .line 181
    :cond_0
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    move-result-object p0

    .line 182
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->copy()Lcom/appsflyer/internal/AFe1aSDK;

    move-result-object v0

    new-instance v1, Lcom/appsflyer/internal/AFf1qSDK;

    invoke-direct {v1, p0}, Lcom/appsflyer/internal/AFf1qSDK;-><init>(Lcom/appsflyer/internal/AFd1fSDK;)V

    .line 183
    iget-object p0, v0, Lcom/appsflyer/internal/AFe1aSDK;->AFAdRevenueData:Ljava/util/concurrent/Executor;

    new-instance v2, Lcom/appsflyer/internal/AFe1aSDK$5;

    invoke-direct {v2, v0, v1}, Lcom/appsflyer/internal/AFe1aSDK$5;-><init>(Lcom/appsflyer/internal/AFe1aSDK;Lcom/appsflyer/internal/AFf1wSDK;)V

    invoke-interface {p0, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method private static synthetic copy([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-object v0, p0, v0

    .line 3
    .line 4
    check-cast v0, Lcom/appsflyer/internal/AFb1tSDK;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    aget-object v1, p0, v1

    .line 8
    .line 9
    check-cast v1, Landroid/content/Context;

    .line 10
    .line 11
    const/4 v2, 0x2

    .line 12
    aget-object p0, p0, v2

    .line 13
    .line 14
    check-cast p0, Ljava/lang/String;

    .line 15
    .line 16
    sget v3, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 17
    .line 18
    add-int/lit8 v3, v3, 0x47

    .line 19
    .line 20
    rem-int/lit16 v4, v3, 0x80

    .line 21
    .line 22
    sput v4, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 23
    .line 24
    rem-int/2addr v3, v2

    .line 25
    const/4 v4, 0x0

    .line 26
    if-eqz v3, :cond_1

    .line 27
    .line 28
    invoke-virtual {v0, v1, p0, v4}, Lcom/appsflyer/AppsFlyerLib;->start(Landroid/content/Context;Ljava/lang/String;Lcom/appsflyer/attribution/AppsFlyerRequestListener;)V

    .line 29
    .line 30
    .line 31
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 32
    .line 33
    add-int/lit8 p0, p0, 0x1b

    .line 34
    .line 35
    rem-int/lit16 v0, p0, 0x80

    .line 36
    .line 37
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 38
    .line 39
    rem-int/2addr p0, v2

    .line 40
    if-eqz p0, :cond_0

    .line 41
    .line 42
    return-object v4

    .line 43
    :cond_0
    throw v4

    .line 44
    :cond_1
    invoke-virtual {v0, v1, p0, v4}, Lcom/appsflyer/AppsFlyerLib;->start(Landroid/content/Context;Ljava/lang/String;Lcom/appsflyer/attribution/AppsFlyerRequestListener;)V

    .line 45
    .line 46
    .line 47
    throw v4
.end method

.method private static synthetic copydefault([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-object v0, p0, v0

    .line 3
    .line 4
    check-cast v0, Lcom/appsflyer/internal/AFb1tSDK;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    aget-object v1, p0, v1

    .line 8
    .line 9
    move-object v5, v1

    .line 10
    check-cast v5, Lcom/appsflyer/AFPurchaseDetails;

    .line 11
    .line 12
    const/4 v1, 0x2

    .line 13
    aget-object v2, p0, v1

    .line 14
    .line 15
    move-object v6, v2

    .line 16
    check-cast v6, Ljava/util/Map;

    .line 17
    .line 18
    const/4 v2, 0x3

    .line 19
    aget-object p0, p0, v2

    .line 20
    .line 21
    move-object v7, p0

    .line 22
    check-cast v7, Lcom/appsflyer/AppsFlyerInAppPurchaseValidationCallback;

    .line 23
    .line 24
    iget-object p0, v0, Lcom/appsflyer/internal/AFb1tSDK;->copydefault:Lcom/appsflyer/internal/AFd1nSDK;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFd1nSDK;->copy()Lcom/appsflyer/internal/AFe1aSDK;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    new-instance v2, Lcom/appsflyer/internal/AFf1lSDK;

    .line 31
    .line 32
    iget-object v3, v0, Lcom/appsflyer/internal/AFb1tSDK;->copydefault:Lcom/appsflyer/internal/AFd1nSDK;

    .line 33
    .line 34
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    invoke-direct/range {v2 .. v7}, Lcom/appsflyer/internal/AFf1lSDK;-><init>(Lcom/appsflyer/internal/AFd1fSDK;Lcom/appsflyer/AppsFlyerProperties;Lcom/appsflyer/AFPurchaseDetails;Ljava/util/Map;Lcom/appsflyer/AppsFlyerInAppPurchaseValidationCallback;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/appsflyer/internal/AFe1aSDK;->AFAdRevenueData:Ljava/util/concurrent/Executor;

    .line 42
    .line 43
    new-instance v3, Lcom/appsflyer/internal/AFe1aSDK$5;

    .line 44
    .line 45
    invoke-direct {v3, p0, v2}, Lcom/appsflyer/internal/AFe1aSDK$5;-><init>(Lcom/appsflyer/internal/AFe1aSDK;Lcom/appsflyer/internal/AFf1wSDK;)V

    .line 46
    .line 47
    .line 48
    invoke-interface {v0, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 49
    .line 50
    .line 51
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 52
    .line 53
    add-int/lit8 p0, p0, 0x73

    .line 54
    .line 55
    rem-int/lit16 v0, p0, 0x80

    .line 56
    .line 57
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 58
    .line 59
    rem-int/2addr p0, v1

    .line 60
    const/4 v0, 0x0

    .line 61
    if-eqz p0, :cond_0

    .line 62
    .line 63
    return-object v0

    .line 64
    :cond_0
    throw v0
.end method

.method public static synthetic d(Lcom/appsflyer/internal/AFb1tSDK;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code(Z)V

    return-void
.end method

.method public static synthetic e(Lcom/appsflyer/internal/AFd1fSDK;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData(Lcom/appsflyer/internal/AFd1fSDK;)V

    return-void
.end method

.method private static synthetic equals([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-object v1, p0, v0

    .line 3
    .line 4
    check-cast v1, Lcom/appsflyer/internal/AFb1tSDK;

    .line 5
    .line 6
    const/4 v2, 0x1

    .line 7
    aget-object p0, p0, v2

    .line 8
    .line 9
    check-cast p0, Lcom/appsflyer/internal/AFg1zSDK;

    .line 10
    .line 11
    sget v2, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 12
    .line 13
    add-int/lit8 v2, v2, 0x55

    .line 14
    .line 15
    rem-int/lit16 v2, v2, 0x80

    .line 16
    .line 17
    sput v2, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    sget-object v2, Lcom/appsflyer/internal/AFg1zSDK;->getMonetizationNetwork:Lcom/appsflyer/internal/AFg1zSDK;

    .line 24
    .line 25
    if-ne p0, v2, :cond_1

    .line 26
    .line 27
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 28
    .line 29
    add-int/lit8 p0, p0, 0x51

    .line 30
    .line 31
    rem-int/lit16 v2, p0, 0x80

    .line 32
    .line 33
    sput v2, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 34
    .line 35
    rem-int/lit8 p0, p0, 0x2

    .line 36
    .line 37
    if-eqz p0, :cond_0

    .line 38
    .line 39
    invoke-interface {v1}, Lcom/appsflyer/internal/AFd1fSDK;->afDebugLog()Lcom/appsflyer/internal/AFd1bSDK;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1bSDK;->getCurrencyIso4217Code()V

    .line 44
    .line 45
    .line 46
    const/16 p0, 0x5a

    .line 47
    .line 48
    div-int/2addr p0, v0

    .line 49
    goto :goto_0

    .line 50
    :cond_0
    invoke-interface {v1}, Lcom/appsflyer/internal/AFd1fSDK;->afDebugLog()Lcom/appsflyer/internal/AFd1bSDK;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1bSDK;->getCurrencyIso4217Code()V

    .line 55
    .line 56
    .line 57
    :goto_0
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 58
    .line 59
    add-int/lit8 p0, p0, 0x3

    .line 60
    .line 61
    rem-int/lit16 p0, p0, 0x80

    .line 62
    .line 63
    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 64
    .line 65
    :cond_1
    invoke-interface {v1}, Lcom/appsflyer/internal/AFd1fSDK;->copydefault()Lcom/appsflyer/internal/AFb1bSDK;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-interface {p0}, Lcom/appsflyer/internal/AFb1bSDK;->getCurrencyIso4217Code()Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    const/4 v0, 0x0

    .line 74
    if-nez p0, :cond_2

    .line 75
    .line 76
    invoke-interface {v1}, Lcom/appsflyer/internal/AFd1fSDK;->v()Lcom/appsflyer/internal/AFh1vSDK;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-interface {p0}, Lcom/appsflyer/internal/AFh1vSDK;->getCurrencyIso4217Code()V

    .line 81
    .line 82
    .line 83
    return-object v0

    .line 84
    :cond_2
    invoke-interface {v1}, Lcom/appsflyer/internal/AFd1fSDK;->v()Lcom/appsflyer/internal/AFh1vSDK;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-interface {p0}, Lcom/appsflyer/internal/AFh1vSDK;->getMonetizationNetwork()V

    .line 89
    .line 90
    .line 91
    return-object v0
.end method

.method private synthetic equals()V
    .locals 3

    .line 92
    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p0

    const v1, -0x10c3c29b

    const v2, 0x10c3c2a6

    invoke-static {v0, v1, v2, p0}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData([Ljava/lang/Object;III)Ljava/lang/Object;

    return-void
.end method

.method public static synthetic f(Lcom/appsflyer/internal/AFb1tSDK;Lcom/appsflyer/internal/AFg1zSDK;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code(Lcom/appsflyer/internal/AFg1zSDK;)V

    return-void
.end method

.method private static synthetic getCurrencyIso4217Code([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-object p0, p0, v0

    .line 3
    .line 4
    check-cast p0, Ljava/lang/String;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    return-object v0

    .line 10
    :cond_0
    const-string v1, "fb\\d*?://authorize.*"

    .line 11
    .line 12
    invoke-virtual {p0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_9

    .line 17
    .line 18
    const-string v1, "access_token"

    .line 19
    .line 20
    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_9

    .line 25
    .line 26
    sget v2, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 27
    .line 28
    add-int/lit8 v2, v2, 0x9

    .line 29
    .line 30
    rem-int/lit16 v3, v2, 0x80

    .line 31
    .line 32
    sput v3, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 33
    .line 34
    rem-int/lit8 v2, v2, 0x2

    .line 35
    .line 36
    if-nez v2, :cond_8

    .line 37
    .line 38
    invoke-static {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getMonetizationNetwork(Ljava/lang/String;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-nez v3, :cond_1

    .line 47
    .line 48
    goto/16 :goto_3

    .line 49
    .line 50
    :cond_1
    new-instance v3, Ljava/util/ArrayList;

    .line 51
    .line 52
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 53
    .line 54
    .line 55
    const-string v4, "&"

    .line 56
    .line 57
    invoke-virtual {v2, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result v5

    .line 61
    if-eqz v5, :cond_2

    .line 62
    .line 63
    new-instance v3, Ljava/util/ArrayList;

    .line 64
    .line 65
    invoke-virtual {v2, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v5

    .line 69
    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 70
    .line 71
    .line 72
    move-result-object v5

    .line 73
    invoke-direct {v3, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 74
    .line 75
    .line 76
    sget v5, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 77
    .line 78
    add-int/lit8 v5, v5, 0x29

    .line 79
    .line 80
    rem-int/lit16 v5, v5, 0x80

    .line 81
    .line 82
    sput v5, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_2
    invoke-virtual {v3, v2}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    :goto_0
    new-instance v5, Ljava/lang/StringBuilder;

    .line 89
    .line 90
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 98
    .line 99
    .line 100
    move-result v6

    .line 101
    if-eqz v6, :cond_7

    .line 102
    .line 103
    sget v6, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 104
    .line 105
    add-int/lit8 v6, v6, 0x33

    .line 106
    .line 107
    rem-int/lit16 v7, v6, 0x80

    .line 108
    .line 109
    sput v7, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 110
    .line 111
    rem-int/lit8 v6, v6, 0x2

    .line 112
    .line 113
    if-eqz v6, :cond_6

    .line 114
    .line 115
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v6

    .line 119
    check-cast v6, Ljava/lang/String;

    .line 120
    .line 121
    invoke-virtual {v6, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 122
    .line 123
    .line 124
    move-result v7

    .line 125
    if-eqz v7, :cond_3

    .line 126
    .line 127
    invoke-interface {v3}, Ljava/util/Iterator;->remove()V

    .line 128
    .line 129
    .line 130
    goto :goto_1

    .line 131
    :cond_3
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->length()I

    .line 132
    .line 133
    .line 134
    move-result v7

    .line 135
    if-eqz v7, :cond_4

    .line 136
    .line 137
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    goto :goto_2

    .line 141
    :cond_4
    const-string v7, "?"

    .line 142
    .line 143
    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 144
    .line 145
    .line 146
    move-result v8

    .line 147
    if-nez v8, :cond_5

    .line 148
    .line 149
    sget v8, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 150
    .line 151
    add-int/lit8 v8, v8, 0x7b

    .line 152
    .line 153
    rem-int/lit16 v8, v8, 0x80

    .line 154
    .line 155
    sput v8, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 156
    .line 157
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    :cond_5
    :goto_2
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    sget v6, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 164
    .line 165
    add-int/lit8 v6, v6, 0x21

    .line 166
    .line 167
    rem-int/lit16 v6, v6, 0x80

    .line 168
    .line 169
    sput v6, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 170
    .line 171
    goto :goto_1

    .line 172
    :cond_6
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    check-cast p0, Ljava/lang/String;

    .line 177
    .line 178
    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 179
    .line 180
    .line 181
    throw v0

    .line 182
    :cond_7
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object p0

    .line 190
    return-object p0

    .line 191
    :cond_8
    invoke-static {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getMonetizationNetwork(Ljava/lang/String;)Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object p0

    .line 195
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 196
    .line 197
    .line 198
    throw v0

    .line 199
    :cond_9
    :goto_3
    return-object p0
.end method

.method private static getCurrencyIso4217Code(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 219
    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    long-to-int v0, v0

    const v1, 0x1ed181d0

    const v2, -0x1ed181ce

    invoke-static {p0, v1, v2, v0}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData([Ljava/lang/Object;III)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method private getCurrencyIso4217Code(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 220
    filled-new-array {p0, p1, p2}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p0

    const p2, 0x7c4e35c3

    const v0, -0x7c4e35ac

    invoke-static {p1, p2, v0, p0}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData([Ljava/lang/Object;III)Ljava/lang/Object;

    return-void
.end method

.method private getCurrencyIso4217Code(Lcom/appsflyer/AppsFlyerConversionListener;)V
    .locals 2

    .line 221
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p0

    const v0, 0x7e41f0fd

    const v1, -0x7e41f0fd

    invoke-static {p1, v0, v1, p0}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData([Ljava/lang/Object;III)Ljava/lang/Object;

    return-void
.end method

.method public static synthetic getCurrencyIso4217Code(Lcom/appsflyer/internal/AFb1tSDK;Lcom/appsflyer/internal/AFa1mSDK;)V
    .locals 2

    .line 217
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 v0, v0, 0x67

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    rem-int/lit8 v0, v0, 0x2

    invoke-direct {p0, p1}, Lcom/appsflyer/internal/AFb1tSDK;->getRevenue(Lcom/appsflyer/internal/AFa1mSDK;)V

    if-nez v0, :cond_0

    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    add-int/lit8 p0, p0, 0x55

    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    return-void

    :cond_0
    const/4 p0, 0x0

    throw p0
.end method

.method private synthetic getCurrencyIso4217Code(Lcom/appsflyer/internal/AFg1zSDK;)V
    .locals 2

    .line 218
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p0

    const v0, -0x6afed360

    const v1, 0x6afed375

    invoke-static {p1, v0, v1, p0}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData([Ljava/lang/Object;III)Ljava/lang/Object;

    return-void
.end method

.method private static getCurrencyIso4217Code(Ljava/lang/String;Z)V
    .locals 2

    .line 208
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    add-int/lit8 v0, v0, 0x4b

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    rem-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_0

    .line 209
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Z)V

    .line 210
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 p0, p0, 0x3

    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    return-void

    .line 211
    :cond_0
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Z)V

    const/4 p0, 0x0

    .line 212
    throw p0
.end method

.method private synthetic getCurrencyIso4217Code(Z)V
    .locals 2

    .line 213
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    const/16 v1, 0x47

    add-int/2addr v0, v1

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    if-eqz p1, :cond_1

    add-int/lit8 v0, v0, 0x27

    rem-int/lit16 p1, v0, 0x80

    sput p1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    rem-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_0

    .line 214
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    move-result-object p0

    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->v()Lcom/appsflyer/internal/AFh1vSDK;

    move-result-object p0

    invoke-interface {p0}, Lcom/appsflyer/internal/AFh1vSDK;->getRevenue()V

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    move-result-object p0

    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->v()Lcom/appsflyer/internal/AFh1vSDK;

    move-result-object p0

    invoke-interface {p0}, Lcom/appsflyer/internal/AFh1vSDK;->getRevenue()V

    const/4 p0, 0x0

    throw p0

    .line 215
    :cond_1
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    move-result-object p0

    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->v()Lcom/appsflyer/internal/AFh1vSDK;

    move-result-object p0

    invoke-interface {p0}, Lcom/appsflyer/internal/AFh1vSDK;->AFAdRevenueData()V

    .line 216
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    add-int/lit8 p0, p0, 0x63

    rem-int/lit16 p1, p0, 0x80

    sput p1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    rem-int/lit8 p0, p0, 0x2

    if-nez p0, :cond_2

    div-int/lit8 v1, v1, 0x0

    :cond_2
    return-void
.end method

.method private static getMediationNetwork(Lcom/appsflyer/internal/AFd1rSDK;Z)I
    .locals 2

    .line 293
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    add-int/lit8 v0, v0, 0x9

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    rem-int/lit8 v0, v0, 0x2

    const-string v1, "appsFlyerInAppEventCount"

    if-eqz v0, :cond_0

    invoke-static {p0, v1, p1}, Lcom/appsflyer/internal/AFb1tSDK;->getRevenue(Lcom/appsflyer/internal/AFd1rSDK;Ljava/lang/String;Z)I

    move-result p0

    return p0

    :cond_0
    invoke-static {p0, v1, p1}, Lcom/appsflyer/internal/AFb1tSDK;->getRevenue(Lcom/appsflyer/internal/AFd1rSDK;Ljava/lang/String;Z)I

    const/4 p0, 0x0

    throw p0
.end method

.method public static synthetic getMediationNetwork(Lcom/appsflyer/internal/AFb1tSDK;J)J
    .locals 1

    .line 259
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 v0, v0, 0x1d

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    iput-wide p1, p0, Lcom/appsflyer/internal/AFb1tSDK;->component2:J

    add-int/lit8 v0, v0, 0x25

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    return-wide p1
.end method

.method private static synthetic getMediationNetwork([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    const/4 v0, 0x0

    aget-object p0, p0, v0

    check-cast p0, Lcom/appsflyer/internal/AFb1tSDK;

    .line 257
    sget v1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    add-int/lit8 v1, v1, 0x47

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    rem-int/lit8 v1, v1, 0x2

    iget-object p0, p0, Lcom/appsflyer/internal/AFb1tSDK;->copy:Landroid/app/Application;

    if-nez v1, :cond_0

    const/4 v1, 0x5

    div-int/2addr v1, v0

    :cond_0
    return-object p0
.end method

.method public static getMediationNetwork()Ljava/lang/String;
    .locals 3

    .line 260
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    add-int/lit8 v0, v0, 0x2d

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    const-string v0, "AppUserId"

    invoke-static {v0}, Lcom/appsflyer/internal/AFb1tSDK;->getRevenue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget v1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    add-int/lit8 v1, v1, 0x4f

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    rem-int/lit8 v1, v1, 0x2

    if-eqz v1, :cond_0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    throw v0
.end method

.method public static getMediationNetwork(Lcom/appsflyer/internal/AFd1rSDK;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 294
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    long-to-int p1, v0

    const v0, -0x2eea7324

    const v1, 0x2eea733c

    invoke-static {p0, v0, v1, p1}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData([Ljava/lang/Object;III)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public static getMediationNetwork(Ljava/text/SimpleDateFormat;J)Ljava/lang/String;
    .locals 1

    .line 271
    const-string v0, "UTC"

    invoke-static {v0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 272
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, p1, p2}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {p0, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    sget p1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 p1, p1, 0x7

    rem-int/lit16 p1, p1, 0x80

    sput p1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    return-object p0
.end method

.method private getMediationNetwork(Lcom/appsflyer/internal/AFa1mSDK;)V
    .locals 2

    .line 295
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p0

    const v0, 0x94b72ff

    const v1, -0x94b72fa

    invoke-static {p1, v0, v1, p0}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData([Ljava/lang/Object;III)Ljava/lang/Object;

    return-void
.end method

.method private static getMediationNetwork(Lcom/appsflyer/internal/AFa1mSDK;Lcom/appsflyer/internal/AFh1sSDK;)V
    .locals 3
    .param p0    # Lcom/appsflyer/internal/AFa1mSDK;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lcom/appsflyer/internal/AFh1sSDK;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 261
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 v1, v0, 0x4b

    rem-int/lit16 v1, v1, 0x80

    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    const/4 v1, 0x0

    if-eqz p1, :cond_1

    add-int/lit8 v0, v0, 0x4d

    rem-int/lit16 v2, v0, 0x80

    sput v2, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    rem-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_0

    .line 262
    iget-object v0, p1, Lcom/appsflyer/internal/AFh1sSDK;->AFAdRevenueData:Ljava/lang/String;

    .line 263
    iput-object v0, p0, Lcom/appsflyer/internal/AFa1mSDK;->getCurrencyIso4217Code:Ljava/lang/String;

    .line 264
    iget-object p1, p1, Lcom/appsflyer/internal/AFh1sSDK;->getMediationNetwork:Ljava/lang/String;

    .line 265
    iput-object p1, p0, Lcom/appsflyer/internal/AFa1mSDK;->component1:Ljava/lang/String;

    goto :goto_0

    .line 266
    :cond_0
    iget-object v0, p1, Lcom/appsflyer/internal/AFh1sSDK;->AFAdRevenueData:Ljava/lang/String;

    .line 267
    iput-object v0, p0, Lcom/appsflyer/internal/AFa1mSDK;->getCurrencyIso4217Code:Ljava/lang/String;

    .line 268
    iget-object p1, p1, Lcom/appsflyer/internal/AFh1sSDK;->getMediationNetwork:Ljava/lang/String;

    .line 269
    iput-object p1, p0, Lcom/appsflyer/internal/AFa1mSDK;->component1:Ljava/lang/String;

    .line 270
    throw v1

    :cond_1
    :goto_0
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    add-int/lit8 p0, p0, 0x5

    rem-int/lit16 p1, p0, 0x80

    sput p1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    rem-int/lit8 p0, p0, 0x2

    if-eqz p0, :cond_2

    return-void

    :cond_2
    throw v1
.end method

.method private getMediationNetwork(Ljava/lang/String;)V
    .locals 4

    .line 273
    new-instance v0, Lcom/appsflyer/internal/AFh1nSDK;

    invoke-direct {v0}, Lcom/appsflyer/internal/AFh1nSDK;-><init>()V

    .line 274
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    move-result-object v1

    invoke-interface {v1}, Lcom/appsflyer/internal/AFd1fSDK;->getMediationNetwork()Lcom/appsflyer/internal/AFd1pSDK;

    move-result-object v1

    .line 275
    iget-object v1, v1, Lcom/appsflyer/internal/AFd1pSDK;->getRevenue:Lcom/appsflyer/internal/AFd1rSDK;

    const-string v2, "appsFlyerCount"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Lcom/appsflyer/internal/AFd1rSDK;->getMonetizationNetwork(Ljava/lang/String;I)I

    move-result v1

    .line 276
    invoke-virtual {v0, v1}, Lcom/appsflyer/internal/AFa1mSDK;->getMonetizationNetwork(I)Lcom/appsflyer/internal/AFa1mSDK;

    move-result-object v0

    .line 277
    iput-object p1, v0, Lcom/appsflyer/internal/AFa1mSDK;->component2:Ljava/lang/String;

    if-eqz p1, :cond_0

    .line 278
    sget v1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 v1, v1, 0x4b

    rem-int/lit16 v1, v1, 0x80

    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 279
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    const/4 v1, 0x5

    if-le p1, v1, :cond_0

    .line 280
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    move-result-object p1

    invoke-interface {p1}, Lcom/appsflyer/internal/AFd1fSDK;->equals()Lcom/appsflyer/internal/AFj1vSDK;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/appsflyer/internal/AFj1vSDK;->getCurrencyIso4217Code(Lcom/appsflyer/internal/AFa1mSDK;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 281
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    move-result-object p1

    invoke-interface {p1}, Lcom/appsflyer/internal/AFd1fSDK;->getCurrencyIso4217Code()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object p1

    .line 282
    new-instance v1, Lcom/appsflyer/internal/AFb1tSDK$AFa1uSDK;

    invoke-direct {v1, p0, v0, v3}, Lcom/appsflyer/internal/AFb1tSDK$AFa1uSDK;-><init>(Lcom/appsflyer/internal/AFb1tSDK;Lcom/appsflyer/internal/AFa1mSDK;B)V

    const-wide/16 v2, 0x5

    .line 283
    sget-object p0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {p1, v1, v2, v3, p0}, Lcom/appsflyer/internal/AFj1oSDK;->getRevenue(Ljava/util/concurrent/ScheduledExecutorService;Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)V

    .line 284
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    add-int/lit8 p0, p0, 0x11

    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    :cond_0
    return-void
.end method

.method private static getMediationNetwork(Lorg/json/JSONObject;)V
    .locals 14

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    const/4 v3, 0x0

    .line 15
    if-eqz v2, :cond_2

    .line 16
    .line 17
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Ljava/lang/String;

    .line 22
    .line 23
    :try_start_0
    new-instance v4, Lorg/json/JSONArray;

    .line 24
    .line 25
    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Ljava/lang/String;

    .line 30
    .line 31
    invoke-direct {v4, v2}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    :goto_1
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    .line 35
    .line 36
    .line 37
    move-result v2
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    if-ge v3, v2, :cond_0

    .line 39
    .line 40
    sget v2, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 41
    .line 42
    add-int/lit8 v2, v2, 0x2d

    .line 43
    .line 44
    rem-int/lit16 v5, v2, 0x80

    .line 45
    .line 46
    sput v5, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 47
    .line 48
    rem-int/lit8 v2, v2, 0x2

    .line 49
    .line 50
    if-eqz v2, :cond_1

    .line 51
    .line 52
    :try_start_1
    invoke-virtual {v4, v3}, Lorg/json/JSONArray;->getLong(I)J

    .line 53
    .line 54
    .line 55
    move-result-wide v5

    .line 56
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    add-int/lit8 v3, v3, 0x30

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :catch_0
    move-exception v2

    .line 67
    goto :goto_2

    .line 68
    :cond_1
    invoke-virtual {v4, v3}, Lorg/json/JSONArray;->getLong(I)J

    .line 69
    .line 70
    .line 71
    move-result-wide v5

    .line 72
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 77
    .line 78
    .line 79
    add-int/lit8 v3, v3, 0x1

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :goto_2
    const-string v3, "error at timeStampArr"

    .line 83
    .line 84
    invoke-static {v3, v2}, Lcom/appsflyer/AFLogger;->afErrorLogForExcManagerOnly(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 85
    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_2
    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    const/4 v2, 0x0

    .line 96
    :cond_3
    :goto_3
    move-object v4, v2

    .line 97
    :cond_4
    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 98
    .line 99
    .line 100
    move-result v5

    .line 101
    if-eqz v5, :cond_7

    .line 102
    .line 103
    if-nez v4, :cond_7

    .line 104
    .line 105
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v5

    .line 109
    check-cast v5, Ljava/lang/String;

    .line 110
    .line 111
    :try_start_2
    new-instance v6, Lorg/json/JSONArray;

    .line 112
    .line 113
    invoke-virtual {p0, v5}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v7

    .line 117
    check-cast v7, Ljava/lang/String;

    .line 118
    .line 119
    invoke-direct {v6, v7}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    move v7, v3

    .line 123
    :goto_5
    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    .line 124
    .line 125
    .line 126
    move-result v8
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    .line 127
    if-ge v7, v8, :cond_4

    .line 128
    .line 129
    sget v8, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 130
    .line 131
    add-int/lit8 v8, v8, 0x31

    .line 132
    .line 133
    rem-int/lit16 v9, v8, 0x80

    .line 134
    .line 135
    sput v9, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 136
    .line 137
    rem-int/lit8 v8, v8, 0x2

    .line 138
    .line 139
    const/4 v9, 0x1

    .line 140
    if-eqz v8, :cond_5

    .line 141
    .line 142
    :try_start_3
    invoke-virtual {v6, v7}, Lorg/json/JSONArray;->getLong(I)J

    .line 143
    .line 144
    .line 145
    move-result-wide v10

    .line 146
    invoke-interface {v0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object v8

    .line 150
    check-cast v8, Ljava/lang/Long;

    .line 151
    .line 152
    invoke-virtual {v8}, Ljava/lang/Number;->longValue()J

    .line 153
    .line 154
    .line 155
    move-result-wide v12

    .line 156
    cmp-long v8, v10, v12

    .line 157
    .line 158
    if-eqz v8, :cond_3

    .line 159
    .line 160
    goto :goto_6

    .line 161
    :catch_1
    move-exception v5

    .line 162
    goto :goto_7

    .line 163
    :cond_5
    invoke-virtual {v6, v7}, Lorg/json/JSONArray;->getLong(I)J

    .line 164
    .line 165
    .line 166
    move-result-wide v10

    .line 167
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    move-result-object v8

    .line 171
    check-cast v8, Ljava/lang/Long;

    .line 172
    .line 173
    invoke-virtual {v8}, Ljava/lang/Number;->longValue()J

    .line 174
    .line 175
    .line 176
    move-result-wide v12

    .line 177
    cmp-long v8, v10, v12

    .line 178
    .line 179
    if-eqz v8, :cond_3

    .line 180
    .line 181
    :goto_6
    invoke-virtual {v6, v7}, Lorg/json/JSONArray;->getLong(I)J

    .line 182
    .line 183
    .line 184
    move-result-wide v10

    .line 185
    invoke-interface {v0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 186
    .line 187
    .line 188
    move-result-object v8

    .line 189
    check-cast v8, Ljava/lang/Long;

    .line 190
    .line 191
    invoke-virtual {v8}, Ljava/lang/Number;->longValue()J

    .line 192
    .line 193
    .line 194
    move-result-wide v12

    .line 195
    cmp-long v8, v10, v12

    .line 196
    .line 197
    if-eqz v8, :cond_3

    .line 198
    .line 199
    invoke-virtual {v6, v7}, Lorg/json/JSONArray;->getLong(I)J

    .line 200
    .line 201
    .line 202
    move-result-wide v10

    .line 203
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 204
    .line 205
    .line 206
    move-result v8

    .line 207
    sub-int/2addr v8, v9

    .line 208
    invoke-interface {v0, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 209
    .line 210
    .line 211
    move-result-object v8

    .line 212
    check-cast v8, Ljava/lang/Long;

    .line 213
    .line 214
    invoke-virtual {v8}, Ljava/lang/Number;->longValue()J

    .line 215
    .line 216
    .line 217
    move-result-wide v8
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_1

    .line 218
    cmp-long v4, v10, v8

    .line 219
    .line 220
    if-nez v4, :cond_6

    .line 221
    .line 222
    goto :goto_3

    .line 223
    :cond_6
    add-int/lit8 v7, v7, 0x1

    .line 224
    .line 225
    move-object v4, v5

    .line 226
    goto :goto_5

    .line 227
    :goto_7
    const-string v6, "error at manageExtraReferrers"

    .line 228
    .line 229
    invoke-static {v6, v5}, Lcom/appsflyer/AFLogger;->afErrorLogForExcManagerOnly(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 230
    .line 231
    .line 232
    goto/16 :goto_4

    .line 233
    .line 234
    :cond_7
    if-eqz v4, :cond_9

    .line 235
    .line 236
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 237
    .line 238
    add-int/lit8 v0, v0, 0x2b

    .line 239
    .line 240
    rem-int/lit16 v1, v0, 0x80

    .line 241
    .line 242
    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 243
    .line 244
    rem-int/lit8 v0, v0, 0x2

    .line 245
    .line 246
    if-nez v0, :cond_8

    .line 247
    .line 248
    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 249
    .line 250
    .line 251
    goto :goto_8

    .line 252
    :cond_8
    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 253
    .line 254
    .line 255
    throw v2

    .line 256
    :cond_9
    :goto_8
    return-void
.end method

.method public static getMediationNetwork(Landroid/content/Context;)Z
    .locals 4

    .line 285
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 v0, v0, 0x5f

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 286
    :try_start_0
    invoke-static {}, Lcom/google/android/gms/common/GoogleApiAvailability;->getInstance()Lcom/google/android/gms/common/GoogleApiAvailability;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/google/android/gms/common/GoogleApiAvailability;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_1

    .line 287
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 p0, p0, 0x47

    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    return v1

    :catchall_0
    move-exception v0

    goto :goto_0

    .line 288
    :cond_0
    :try_start_1
    invoke-static {}, Lcom/google/android/gms/common/GoogleApiAvailability;->getInstance()Lcom/google/android/gms/common/GoogleApiAvailability;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/google/android/gms/common/GoogleApiAvailability;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    const/4 v0, 0x0

    .line 289
    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 290
    :goto_0
    const-string v2, "WARNING:  Google play services is unavailable. "

    invoke-static {v2, v0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1
    const/4 v0, 0x0

    .line 291
    :try_start_2
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    const-string v2, "com.google.android.gms"

    invoke-virtual {p0, v2, v0}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_2
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2 .. :try_end_2} :catch_0

    return v1

    :catch_0
    move-exception p0

    .line 292
    sget-object v1, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    sget-object v2, Lcom/appsflyer/internal/AFg1cSDK;->AFLogger:Lcom/appsflyer/internal/AFg1cSDK;

    const-string v3, "WARNING:  Google Play Services is unavailable. "

    invoke-virtual {v1, v2, v3, p0}, Lcom/appsflyer/internal/AFh1ySDK;->e(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;Ljava/lang/Throwable;)V

    return v0
.end method

.method public static synthetic getMediationNetwork(Lcom/appsflyer/internal/AFb1tSDK;Z)Z
    .locals 2

    .line 258
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    add-int/lit8 v1, v0, 0x37

    rem-int/lit16 v1, v1, 0x80

    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    iput-boolean p1, p0, Lcom/appsflyer/internal/AFb1tSDK;->equals:Z

    add-int/lit8 v0, v0, 0xd

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    return p1
.end method

.method public static getMonetizationNetwork()Lcom/appsflyer/internal/AFb1tSDK;
    .locals 2

    .line 169
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 v0, v0, 0x63

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    rem-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_0

    sget-object v0, Lcom/appsflyer/internal/AFb1tSDK;->areAllFieldsValid:Lcom/appsflyer/internal/AFb1tSDK;

    return-object v0

    :cond_0
    const/4 v0, 0x0

    throw v0
.end method

.method private static synthetic getMonetizationNetwork([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    const/4 v0, 0x0

    aget-object v0, p0, v0

    check-cast v0, Lcom/appsflyer/internal/AFb1tSDK;

    const/4 v1, 0x1

    aget-object p0, p0, v1

    check-cast p0, Lcom/appsflyer/AppsFlyerConversionListener;

    .line 193
    sget v1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 v1, v1, 0x4f

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    rem-int/lit8 v1, v1, 0x2

    const/4 v3, 0x0

    if-nez v1, :cond_1

    if-nez p0, :cond_0

    add-int/lit8 v2, v2, 0x61

    .line 194
    rem-int/lit16 v2, v2, 0x80

    sput v2, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    return-object v3

    .line 195
    :cond_0
    iput-object p0, v0, Lcom/appsflyer/internal/AFb1tSDK;->getMediationNetwork:Lcom/appsflyer/AppsFlyerConversionListener;

    return-object v3

    .line 196
    :cond_1
    throw v3
.end method

.method private static getMonetizationNetwork(Landroid/app/Activity;)Ljava/lang/String;
    .locals 8

    .line 219
    const-string v0, "af"

    sget v1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    add-int/lit8 v2, v1, 0x2d

    rem-int/lit16 v2, v2, 0x80

    sput v2, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    const/4 v2, 0x0

    if-eqz p0, :cond_1

    add-int/lit8 v1, v1, 0x1f

    rem-int/lit16 v1, v1, 0x80

    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 220
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 221
    :try_start_0
    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 222
    invoke-virtual {v3, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 223
    sget-object v4, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    sget-object v5, Lcom/appsflyer/internal/AFg1cSDK;->AFKeystoreWrapper:Lcom/appsflyer/internal/AFg1cSDK;

    const-string v6, "Push Notification received af payload = "

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/appsflyer/internal/AFh1ySDK;->w(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;)V

    .line 224
    invoke-virtual {v3, v0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 225
    invoke-virtual {v1, v3}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/app/Activity;->setIntent(Landroid/content/Intent;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 226
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 p0, p0, 0x9

    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    return-object v2

    :catchall_0
    move-exception p0

    goto :goto_0

    :cond_0
    return-object v2

    .line 227
    :goto_0
    sget-object v0, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    sget-object v1, Lcom/appsflyer/internal/AFg1cSDK;->AFKeystoreWrapper:Lcom/appsflyer/internal/AFg1cSDK;

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3, p0}, Lcom/appsflyer/internal/AFh1ySDK;->e(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1
    return-object v2
.end method

.method private static getMonetizationNetwork(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 228
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    add-int/lit8 v0, v0, 0x4f

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    const/16 v0, 0x3f

    .line 229
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 230
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 p0, p0, 0x29

    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    const-string p0, ""

    return-object p0

    :cond_0
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static getMonetizationNetwork(Landroid/content/Context;)V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DiscouragedApi"
        }
    .end annotation

    .line 231
    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    long-to-int v0, v0

    const v1, -0x578ca6b0

    const v2, 0x578ca6c6

    invoke-static {p0, v1, v2, v0}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData([Ljava/lang/Object;III)Ljava/lang/Object;

    return-void
.end method

.method private getMonetizationNetwork(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 170
    new-instance v0, Lcom/appsflyer/internal/AFh1kSDK;

    invoke-direct {v0}, Lcom/appsflyer/internal/AFh1kSDK;-><init>()V

    .line 171
    iput-object p2, v0, Lcom/appsflyer/internal/AFa1mSDK;->component4:Ljava/lang/String;

    .line 172
    iput-object p3, v0, Lcom/appsflyer/internal/AFa1mSDK;->getMonetizationNetwork:Ljava/util/Map;

    .line 173
    invoke-direct {p0, p1}, Lcom/appsflyer/internal/AFb1tSDK;->component1(Landroid/content/Context;)Lcom/appsflyer/internal/AFh1sSDK;

    move-result-object p1

    .line 174
    invoke-virtual {p0, v0, p1}, Lcom/appsflyer/internal/AFb1tSDK;->getMonetizationNetwork(Lcom/appsflyer/internal/AFa1mSDK;Lcom/appsflyer/internal/AFh1sSDK;)V

    .line 175
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    add-int/lit8 p0, p0, 0x45

    rem-int/lit16 p1, p0, 0x80

    sput p1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    rem-int/lit8 p0, p0, 0x2

    if-eqz p0, :cond_0

    return-void

    :cond_0
    const/4 p0, 0x0

    throw p0
.end method

.method private getMonetizationNetwork(Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 197
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 v0, v0, 0x1b

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 198
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    .line 199
    const-string v1, "collectAndroidIdForceByUser"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_3

    .line 200
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "collectIMEIForceByUser"

    .line 201
    invoke-virtual {v0, v1, v2}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 202
    :cond_0
    const-string v0, "advertiserId"

    .line 203
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 204
    :try_start_0
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    move-result-object v0

    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1fSDK;->e()Lcom/appsflyer/internal/AFd1mSDK;

    move-result-object v0

    .line 205
    iget-object v0, v0, Lcom/appsflyer/internal/AFd1mSDK;->getRevenue:Ljava/lang/String;

    .line 206
    invoke-static {v0}, Lcom/appsflyer/internal/AFc1tSDK;->getCurrencyIso4217Code(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 207
    const-string v0, "android_id"

    invoke-interface {p1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 208
    const-string v0, "validateGaidAndIMEI :: removing: android_id"

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 209
    :cond_1
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    move-result-object p0

    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->AFKeystoreWrapper()Lcom/appsflyer/internal/AFg1rSDK;

    move-result-object p0

    .line 210
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1rSDK;->areAllFieldsValid:Ljava/lang/String;

    .line 211
    invoke-static {p0}, Lcom/appsflyer/internal/AFc1tSDK;->getCurrencyIso4217Code(Ljava/lang/String;)Z

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz p0, :cond_3

    .line 212
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    add-int/lit8 p0, p0, 0x71

    rem-int/lit16 v0, p0, 0x80

    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    rem-int/lit8 p0, p0, 0x2

    const-string v0, "imei"

    if-eqz p0, :cond_2

    .line 213
    :try_start_1
    invoke-interface {p1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_3

    .line 214
    const-string p0, "validateGaidAndIMEI :: removing: imei"

    invoke-static {p0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    return-void

    .line 215
    :cond_2
    invoke-interface {p1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    const/4 p0, 0x0

    .line 216
    :try_start_2
    throw p0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :catchall_0
    move-exception p0

    .line 217
    throw p0

    :catch_0
    move-exception p0

    .line 218
    const-string p1, "failed to remove IMEI or AndroidID key from params; "

    invoke-static {p1, p0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_3
    :goto_0
    return-void
.end method

.method private static getRevenue(Lcom/appsflyer/internal/AFd1rSDK;Ljava/lang/String;Z)I
    .locals 2

    .line 512
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 v0, v0, 0x39

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 513
    invoke-interface {p0, p1, v1}, Lcom/appsflyer/internal/AFd1rSDK;->getMonetizationNetwork(Ljava/lang/String;I)I

    move-result v0

    if-eqz p2, :cond_1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    invoke-interface {p0, p1, v0}, Lcom/appsflyer/internal/AFd1rSDK;->getMonetizationNetwork(Ljava/lang/String;I)I

    move-result v0

    if-eqz p2, :cond_1

    :goto_0
    add-int/2addr v0, v1

    .line 514
    invoke-interface {p0, p1, v0}, Lcom/appsflyer/internal/AFd1rSDK;->AFAdRevenueData(Ljava/lang/String;I)V

    .line 515
    :cond_1
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 p0, p0, 0x19

    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    return v0
.end method

.method public static getRevenue(Lcom/appsflyer/internal/AFd1rSDK;Z)I
    .locals 2

    .line 511
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    add-int/lit8 v0, v0, 0x73

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    rem-int/lit8 v0, v0, 0x2

    const-string v1, "appsFlyerCount"

    if-eqz v0, :cond_1

    invoke-static {p0, v1, p1}, Lcom/appsflyer/internal/AFb1tSDK;->getRevenue(Lcom/appsflyer/internal/AFd1rSDK;Ljava/lang/String;Z)I

    move-result p0

    sget p1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 p1, p1, 0x21

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    rem-int/lit8 p1, p1, 0x2

    if-eqz p1, :cond_0

    const/16 p1, 0x18

    div-int/lit8 p1, p1, 0x0

    :cond_0
    return p0

    :cond_1
    invoke-static {p0, v1, p1}, Lcom/appsflyer/internal/AFb1tSDK;->getRevenue(Lcom/appsflyer/internal/AFd1rSDK;Ljava/lang/String;Z)I

    const/4 p0, 0x0

    throw p0
.end method

.method private static synthetic getRevenue([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    const/4 v0, 0x0

    aget-object v1, p0, v0

    check-cast v1, Lcom/appsflyer/internal/AFb1tSDK;

    const/4 v2, 0x1

    aget-object p0, p0, v2

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    .line 491
    sget v2, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 v2, v2, 0x41

    rem-int/lit16 v3, v2, 0x80

    sput v3, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    rem-int/lit8 v2, v2, 0x2

    const-string v3, "collectAndroidIdForceByUser"

    const-string v4, "collectAndroidId"

    const-string v5, "setCollectAndroidID"

    if-eqz v2, :cond_0

    .line 492
    invoke-virtual {v1}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    move-result-object v1

    invoke-interface {v1}, Lcom/appsflyer/internal/AFd1fSDK;->copydefault()Lcom/appsflyer/internal/AFb1bSDK;

    move-result-object v1

    new-array v2, v0, [Ljava/lang/String;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v2, v0

    invoke-interface {v1, v5, v2}, Lcom/appsflyer/internal/AFb1bSDK;->getMediationNetwork(Ljava/lang/String;[Ljava/lang/String;)V

    .line 493
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v1

    invoke-static {v4, v1}, Lcom/appsflyer/internal/AFb1tSDK;->getRevenue(Ljava/lang/String;Ljava/lang/String;)V

    .line 494
    invoke-static {p0}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object p0

    invoke-static {v3, p0}, Lcom/appsflyer/internal/AFb1tSDK;->getRevenue(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 495
    :cond_0
    invoke-virtual {v1}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    move-result-object v1

    invoke-interface {v1}, Lcom/appsflyer/internal/AFd1fSDK;->copydefault()Lcom/appsflyer/internal/AFb1bSDK;

    move-result-object v1

    invoke-static {p0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v5, v2}, Lcom/appsflyer/internal/AFb1bSDK;->getMediationNetwork(Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_0

    .line 496
    :goto_1
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    add-int/lit8 p0, p0, 0xf

    rem-int/lit16 v1, p0, 0x80

    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    rem-int/lit8 p0, p0, 0x2

    const/4 v1, 0x0

    if-nez p0, :cond_1

    const/16 p0, 0x1f

    div-int/2addr p0, v0

    :cond_1
    return-object v1
.end method

.method private getRevenue(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 503
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 v0, v0, 0x7

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    if-nez p1, :cond_1

    add-int/lit8 v0, v0, 0x51

    .line 504
    rem-int/lit16 p0, v0, 0x80

    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    rem-int/lit8 v0, v0, 0x2

    const/4 p0, 0x0

    if-nez v0, :cond_0

    const/16 p1, 0x56

    .line 505
    div-int/lit8 p1, p1, 0x0

    :cond_0
    return-object p0

    .line 506
    :cond_1
    invoke-virtual {p0, p1}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code(Landroid/content/Context;)V

    .line 507
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    move-result-object p0

    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->getMediationNetwork()Lcom/appsflyer/internal/AFd1pSDK;

    move-result-object p0

    invoke-virtual {p0, p2}, Lcom/appsflyer/internal/AFd1pSDK;->getRevenue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    sget p1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 p1, p1, 0x3

    rem-int/lit16 p1, p1, 0x80

    sput p1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    return-object p0
.end method

.method private static getRevenue(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 490
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 v0, v0, 0x69

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    rem-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_0

    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    const/4 p0, 0x0

    throw p0
.end method

.method public static getRevenue(Ljava/util/Map;)Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 498
    const-string v0, "meta"

    invoke-interface {p0, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 499
    sget v1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 v1, v1, 0xd

    rem-int/lit16 v1, v1, 0x80

    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 500
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    return-object p0

    .line 501
    :cond_0
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 502
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    add-int/lit8 p0, p0, 0x1d

    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    return-object v1
.end method

.method public static getRevenue()V
    .locals 1

    const/16 v0, 0x12

    .line 516
    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/appsflyer/internal/AFb1tSDK;->AFInAppEventParameterName:[I

    return-void

    :array_0
    .array-data 4
        -0x37986a02
        0x6770cf24
        -0x3e973ef4
        -0x60ef9a09
        -0x4b6e8601
        -0x6b63e873
        -0x6279b6f6
        -0x1fd5e8f8
        -0x5687233d
        0x574a663a
        0x4cea4362
        0x2c98b885
        0x273106ea
        -0x51c09918
        -0x79170000
        -0x8266c7c
        -0x75f75477
        -0x11308983
    .end array-data
.end method

.method private getRevenue(Lcom/appsflyer/internal/AFa1mSDK;)V
    .locals 11

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x3

    .line 4
    .line 5
    rem-int/lit16 v1, v0, 0x80

    .line 6
    .line 7
    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 8
    .line 9
    const/4 v1, 0x2

    .line 10
    rem-int/2addr v0, v1

    .line 11
    const/4 v2, 0x0

    .line 12
    if-eqz v0, :cond_11

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1fSDK;->valueOf()Lcom/appsflyer/internal/AFd1kSDK;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v0, v0, Lcom/appsflyer/internal/AFd1kSDK;->getCurrencyIso4217Code:Landroid/content/Context;

    .line 23
    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    const-string p0, "sendWithEvent - got null context. skipping event/launch."

    .line 27
    .line 28
    invoke-static {p0}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-interface {v3}, Lcom/appsflyer/internal/AFd1fSDK;->AFKeystoreWrapper()Lcom/appsflyer/internal/AFg1rSDK;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    iget-object v3, v3, Lcom/appsflyer/internal/AFg1rSDK;->component1:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v4, p1, Lcom/appsflyer/internal/AFa1mSDK;->getRevenue:Lcom/appsflyer/attribution/AppsFlyerRequestListener;

    .line 43
    .line 44
    if-eqz v3, :cond_f

    .line 45
    .line 46
    sget v5, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 47
    .line 48
    add-int/lit8 v5, v5, 0xf

    .line 49
    .line 50
    rem-int/lit16 v5, v5, 0x80

    .line 51
    .line 52
    sput v5, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 53
    .line 54
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    if-nez v3, :cond_1

    .line 59
    .line 60
    goto/16 :goto_5

    .line 61
    .line 62
    :cond_1
    invoke-virtual {p0, v0}, Lcom/appsflyer/internal/AFb1tSDK;->getRevenue(Landroid/content/Context;)Lcom/appsflyer/internal/AFd1rSDK;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    invoke-virtual {v4, v3}, Lcom/appsflyer/AppsFlyerProperties;->saveProperties(Lcom/appsflyer/internal/AFd1rSDK;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 74
    .line 75
    .line 76
    move-result-object v4

    .line 77
    invoke-interface {v4}, Lcom/appsflyer/internal/AFd1fSDK;->AFKeystoreWrapper()Lcom/appsflyer/internal/AFg1rSDK;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    invoke-virtual {v4}, Lcom/appsflyer/internal/AFg1rSDK;->getMonetizationNetwork()Z

    .line 82
    .line 83
    .line 84
    move-result v4

    .line 85
    if-nez v4, :cond_2

    .line 86
    .line 87
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    const-string v4, "sendWithEvent from activity: "

    .line 96
    .line 97
    invoke-virtual {v4, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 105
    .line 106
    add-int/lit8 v0, v0, 0x65

    .line 107
    .line 108
    rem-int/lit16 v0, v0, 0x80

    .line 109
    .line 110
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 111
    .line 112
    :cond_2
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFa1mSDK;->AFAdRevenueData()Z

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    invoke-virtual {p0, p1}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData(Lcom/appsflyer/internal/AFa1mSDK;)Ljava/util/Map;

    .line 117
    .line 118
    .line 119
    move-result-object v4

    .line 120
    invoke-virtual {p0}, Lcom/appsflyer/AppsFlyerLib;->isStopped()Z

    .line 121
    .line 122
    .line 123
    move-result v5

    .line 124
    if-nez v5, :cond_3

    .line 125
    .line 126
    const-string v5, "AppsFlyerLib.sendWithEvent"

    .line 127
    .line 128
    invoke-static {v5}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    sget v5, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 132
    .line 133
    add-int/lit8 v5, v5, 0x79

    .line 134
    .line 135
    rem-int/lit16 v5, v5, 0x80

    .line 136
    .line 137
    sput v5, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 138
    .line 139
    :cond_3
    const/4 v5, 0x0

    .line 140
    invoke-static {v3, v5}, Lcom/appsflyer/internal/AFb1tSDK;->getRevenue(Lcom/appsflyer/internal/AFd1rSDK;Z)I

    .line 141
    .line 142
    .line 143
    move-result v3

    .line 144
    new-instance v6, Lcom/appsflyer/internal/AFj1mSDK;

    .line 145
    .line 146
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 147
    .line 148
    .line 149
    move-result-object v7

    .line 150
    invoke-interface {v7}, Lcom/appsflyer/internal/AFd1fSDK;->getMediationNetwork()Lcom/appsflyer/internal/AFd1pSDK;

    .line 151
    .line 152
    .line 153
    move-result-object v7

    .line 154
    invoke-direct {v6, v7}, Lcom/appsflyer/internal/AFj1mSDK;-><init>(Lcom/appsflyer/internal/AFd1pSDK;)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFa1mSDK;->AFAdRevenueData()Z

    .line 158
    .line 159
    .line 160
    move-result v7

    .line 161
    instance-of v8, p1, Lcom/appsflyer/internal/AFh1rSDK;

    .line 162
    .line 163
    instance-of v9, p1, Lcom/appsflyer/internal/AFh1nSDK;

    .line 164
    .line 165
    instance-of v10, p1, Lcom/appsflyer/internal/AFh1oSDK;

    .line 166
    .line 167
    if-nez v10, :cond_8

    .line 168
    .line 169
    sget v10, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 170
    .line 171
    add-int/lit8 v10, v10, 0x55

    .line 172
    .line 173
    rem-int/lit16 v10, v10, 0x80

    .line 174
    .line 175
    sput v10, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 176
    .line 177
    if-eqz v9, :cond_4

    .line 178
    .line 179
    goto :goto_0

    .line 180
    :cond_4
    if-eqz v8, :cond_5

    .line 181
    .line 182
    iget-object v7, v6, Lcom/appsflyer/internal/AFj1mSDK;->getRevenue:Lcom/appsflyer/internal/AFj1lSDK;

    .line 183
    .line 184
    sget-object v9, Lcom/appsflyer/internal/AFj1mSDK;->AFAdRevenueData:Ljava/lang/String;

    .line 185
    .line 186
    invoke-interface {v7, v9}, Lcom/appsflyer/internal/AFj1lSDK;->AFAdRevenueData(Ljava/lang/String;)Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v7

    .line 190
    goto :goto_1

    .line 191
    :cond_5
    if-eqz v7, :cond_7

    .line 192
    .line 193
    iget-object v7, v6, Lcom/appsflyer/internal/AFj1mSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFd1pSDK;

    .line 194
    .line 195
    iget-object v7, v7, Lcom/appsflyer/internal/AFd1pSDK;->getRevenue:Lcom/appsflyer/internal/AFd1rSDK;

    .line 196
    .line 197
    const-string v9, "appsFlyerCount"

    .line 198
    .line 199
    invoke-interface {v7, v9, v5}, Lcom/appsflyer/internal/AFd1rSDK;->getMonetizationNetwork(Ljava/lang/String;I)I

    .line 200
    .line 201
    .line 202
    move-result v7

    .line 203
    iget-object v9, v6, Lcom/appsflyer/internal/AFj1mSDK;->getRevenue:Lcom/appsflyer/internal/AFj1lSDK;

    .line 204
    .line 205
    if-ge v7, v1, :cond_6

    .line 206
    .line 207
    sget-object v7, Lcom/appsflyer/internal/AFj1mSDK;->getCurrencyIso4217Code:Ljava/lang/String;

    .line 208
    .line 209
    invoke-interface {v9, v7}, Lcom/appsflyer/internal/AFj1lSDK;->AFAdRevenueData(Ljava/lang/String;)Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object v7

    .line 213
    goto :goto_1

    .line 214
    :cond_6
    sget-object v7, Lcom/appsflyer/internal/AFj1mSDK;->component4:Ljava/lang/String;

    .line 215
    .line 216
    invoke-interface {v9, v7}, Lcom/appsflyer/internal/AFj1lSDK;->AFAdRevenueData(Ljava/lang/String;)Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object v7

    .line 220
    goto :goto_1

    .line 221
    :cond_7
    iget-object v7, v6, Lcom/appsflyer/internal/AFj1mSDK;->getRevenue:Lcom/appsflyer/internal/AFj1lSDK;

    .line 222
    .line 223
    sget-object v9, Lcom/appsflyer/internal/AFj1mSDK;->areAllFieldsValid:Ljava/lang/String;

    .line 224
    .line 225
    invoke-interface {v7, v9}, Lcom/appsflyer/internal/AFj1lSDK;->AFAdRevenueData(Ljava/lang/String;)Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object v7

    .line 229
    goto :goto_1

    .line 230
    :cond_8
    :goto_0
    iget-object v7, v6, Lcom/appsflyer/internal/AFj1mSDK;->getRevenue:Lcom/appsflyer/internal/AFj1lSDK;

    .line 231
    .line 232
    sget-object v9, Lcom/appsflyer/internal/AFj1mSDK;->getMonetizationNetwork:Ljava/lang/String;

    .line 233
    .line 234
    invoke-interface {v7, v9}, Lcom/appsflyer/internal/AFj1lSDK;->AFAdRevenueData(Ljava/lang/String;)Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v7

    .line 238
    :goto_1
    new-instance v9, Ljava/lang/StringBuilder;

    .line 239
    .line 240
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 241
    .line 242
    .line 243
    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 244
    .line 245
    .line 246
    iget-object v7, v6, Lcom/appsflyer/internal/AFj1mSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFd1pSDK;

    .line 247
    .line 248
    iget-object v7, v7, Lcom/appsflyer/internal/AFd1pSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFd1kSDK;

    .line 249
    .line 250
    iget-object v7, v7, Lcom/appsflyer/internal/AFd1kSDK;->getCurrencyIso4217Code:Landroid/content/Context;

    .line 251
    .line 252
    invoke-virtual {v7}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object v7

    .line 256
    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 257
    .line 258
    .line 259
    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 260
    .line 261
    .line 262
    move-result-object v7

    .line 263
    invoke-static {v7, v8}, Lcom/appsflyer/internal/AFj1mSDK;->getMonetizationNetwork(Ljava/lang/String;Z)Ljava/lang/String;

    .line 264
    .line 265
    .line 266
    move-result-object v7

    .line 267
    invoke-virtual {v6, v7}, Lcom/appsflyer/internal/AFj1mSDK;->getMediationNetwork(Ljava/lang/String;)Ljava/lang/String;

    .line 268
    .line 269
    .line 270
    move-result-object v6

    .line 271
    invoke-direct {p0, v4}, Lcom/appsflyer/internal/AFb1tSDK;->getMonetizationNetwork(Ljava/util/Map;)V

    .line 272
    .line 273
    .line 274
    new-instance v7, Lcom/appsflyer/internal/AFc1rSDK;

    .line 275
    .line 276
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 277
    .line 278
    .line 279
    move-result-object v8

    .line 280
    invoke-virtual {p1, v6}, Lcom/appsflyer/internal/AFa1mSDK;->getMonetizationNetwork(Ljava/lang/String;)Lcom/appsflyer/internal/AFa1mSDK;

    .line 281
    .line 282
    .line 283
    move-result-object p1

    .line 284
    invoke-virtual {p1, v4}, Lcom/appsflyer/internal/AFa1mSDK;->getMediationNetwork(Ljava/util/Map;)Lcom/appsflyer/internal/AFa1mSDK;

    .line 285
    .line 286
    .line 287
    move-result-object p1

    .line 288
    invoke-virtual {p1, v3}, Lcom/appsflyer/internal/AFa1mSDK;->getMonetizationNetwork(I)Lcom/appsflyer/internal/AFa1mSDK;

    .line 289
    .line 290
    .line 291
    move-result-object p1

    .line 292
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 293
    .line 294
    .line 295
    move-result-object v3

    .line 296
    invoke-interface {v3}, Lcom/appsflyer/internal/AFd1fSDK;->d()Lcom/appsflyer/internal/AFc1eSDK;

    .line 297
    .line 298
    .line 299
    move-result-object v3

    .line 300
    invoke-interface {v3}, Lcom/appsflyer/internal/AFc1eSDK;->AFAdRevenueData()Ljava/util/Map;

    .line 301
    .line 302
    .line 303
    move-result-object v3

    .line 304
    invoke-direct {v7, v8, p1, v3}, Lcom/appsflyer/internal/AFc1rSDK;-><init>(Lcom/appsflyer/internal/AFd1fSDK;Lcom/appsflyer/internal/AFa1mSDK;Ljava/util/Map;)V

    .line 305
    .line 306
    .line 307
    if-eqz v0, :cond_c

    .line 308
    .line 309
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 310
    .line 311
    .line 312
    move-result-object p1

    .line 313
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 314
    .line 315
    .line 316
    move-result v0

    .line 317
    const v3, 0x3448c8f2

    .line 318
    .line 319
    .line 320
    const v4, -0x3448c8e1    # -2.4014398E7f

    .line 321
    .line 322
    .line 323
    invoke-static {p1, v3, v4, v0}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 324
    .line 325
    .line 326
    move-result-object p1

    .line 327
    check-cast p1, [Lcom/appsflyer/internal/AFj1zSDK;

    .line 328
    .line 329
    array-length v0, p1

    .line 330
    move v3, v5

    .line 331
    :goto_2
    const/4 v4, 0x1

    .line 332
    if-ge v5, v0, :cond_a

    .line 333
    .line 334
    aget-object v6, p1, v5

    .line 335
    .line 336
    iget-object v8, v6, Lcom/appsflyer/internal/AFj1zSDK;->component3:Lcom/appsflyer/internal/AFj1zSDK$AFa1zSDK;

    .line 337
    .line 338
    sget-object v9, Lcom/appsflyer/internal/AFj1zSDK$AFa1zSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFj1zSDK$AFa1zSDK;

    .line 339
    .line 340
    if-ne v8, v9, :cond_9

    .line 341
    .line 342
    new-instance v3, Ljava/lang/StringBuilder;

    .line 343
    .line 344
    const-string v8, "Failed to get "

    .line 345
    .line 346
    invoke-direct {v3, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 347
    .line 348
    .line 349
    iget-object v6, v6, Lcom/appsflyer/internal/AFj1zSDK;->getMonetizationNetwork:Ljava/lang/String;

    .line 350
    .line 351
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 352
    .line 353
    .line 354
    const-string v6, " referrer, wait ..."

    .line 355
    .line 356
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 357
    .line 358
    .line 359
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 360
    .line 361
    .line 362
    move-result-object v3

    .line 363
    invoke-static {v3}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    .line 364
    .line 365
    .line 366
    move v3, v4

    .line 367
    :cond_9
    add-int/lit8 v5, v5, 0x1

    .line 368
    .line 369
    goto :goto_2

    .line 370
    :cond_a
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 371
    .line 372
    .line 373
    move-result-object p1

    .line 374
    invoke-interface {p1}, Lcom/appsflyer/internal/AFd1fSDK;->d()Lcom/appsflyer/internal/AFc1eSDK;

    .line 375
    .line 376
    .line 377
    move-result-object p1

    .line 378
    invoke-interface {p1}, Lcom/appsflyer/internal/AFc1eSDK;->getMonetizationNetwork()Z

    .line 379
    .line 380
    .line 381
    move-result p1

    .line 382
    if-eqz p1, :cond_b

    .line 383
    .line 384
    const-string p1, "fetching Facebook deferred AppLink data, wait ..."

    .line 385
    .line 386
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    .line 387
    .line 388
    .line 389
    move v5, v4

    .line 390
    goto :goto_3

    .line 391
    :cond_b
    move v5, v3

    .line 392
    :goto_3
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 393
    .line 394
    .line 395
    move-result-object p1

    .line 396
    invoke-interface {p1}, Lcom/appsflyer/internal/AFd1fSDK;->AFKeystoreWrapper()Lcom/appsflyer/internal/AFg1rSDK;

    .line 397
    .line 398
    .line 399
    move-result-object p1

    .line 400
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFg1rSDK;->getCurrencyIso4217Code()Z

    .line 401
    .line 402
    .line 403
    move-result p1

    .line 404
    if-eqz p1, :cond_c

    .line 405
    .line 406
    sget p1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 407
    .line 408
    add-int/lit8 p1, p1, 0x37

    .line 409
    .line 410
    rem-int/lit16 p1, p1, 0x80

    .line 411
    .line 412
    sput p1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 413
    .line 414
    move v5, v4

    .line 415
    :cond_c
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 416
    .line 417
    .line 418
    move-result-object p0

    .line 419
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->getCurrencyIso4217Code()Ljava/util/concurrent/ScheduledExecutorService;

    .line 420
    .line 421
    .line 422
    move-result-object p0

    .line 423
    if-eqz v5, :cond_e

    .line 424
    .line 425
    sget p1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 426
    .line 427
    add-int/lit8 p1, p1, 0x7

    .line 428
    .line 429
    rem-int/lit16 v0, p1, 0x80

    .line 430
    .line 431
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 432
    .line 433
    rem-int/2addr p1, v1

    .line 434
    if-nez p1, :cond_d

    .line 435
    .line 436
    const-wide/16 v0, 0x1f4

    .line 437
    .line 438
    goto :goto_4

    .line 439
    :cond_d
    throw v2

    .line 440
    :cond_e
    const-wide/16 v0, 0x0

    .line 441
    .line 442
    :goto_4
    sget-object p1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 443
    .line 444
    invoke-static {p0, v7, v0, v1, p1}, Lcom/appsflyer/internal/AFj1oSDK;->getRevenue(Ljava/util/concurrent/ScheduledExecutorService;Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)V

    .line 445
    .line 446
    .line 447
    return-void

    .line 448
    :cond_f
    :goto_5
    const-string p0, "AppsFlyer dev key is missing!!! Please use  AppsFlyerLib.getInstance().setAppsFlyerKey(...) to set it. "

    .line 449
    .line 450
    invoke-static {p0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 451
    .line 452
    .line 453
    const-string p0, "AppsFlyer will not track this event."

    .line 454
    .line 455
    invoke-static {p0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 456
    .line 457
    .line 458
    if-eqz v4, :cond_10

    .line 459
    .line 460
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 461
    .line 462
    add-int/lit8 p0, p0, 0x6f

    .line 463
    .line 464
    rem-int/lit16 p0, p0, 0x80

    .line 465
    .line 466
    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 467
    .line 468
    const/16 p0, 0x29

    .line 469
    .line 470
    const-string p1, "No dev key"

    .line 471
    .line 472
    invoke-interface {v4, p0, p1}, Lcom/appsflyer/attribution/AppsFlyerRequestListener;->onError(ILjava/lang/String;)V

    .line 473
    .line 474
    .line 475
    :cond_10
    return-void

    .line 476
    :cond_11
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 477
    .line 478
    .line 479
    move-result-object p0

    .line 480
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->valueOf()Lcom/appsflyer/internal/AFd1kSDK;

    .line 481
    .line 482
    .line 483
    move-result-object p0

    .line 484
    iget-object p0, p0, Lcom/appsflyer/internal/AFd1kSDK;->getCurrencyIso4217Code:Landroid/content/Context;

    .line 485
    .line 486
    throw v2
.end method

.method public static synthetic getRevenue(Lcom/appsflyer/internal/AFb1tSDK;)V
    .locals 1

    .line 497
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 v0, v0, 0x3f

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    invoke-direct {p0}, Lcom/appsflyer/internal/AFb1tSDK;->component4()V

    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 p0, p0, 0x11

    rem-int/lit16 v0, p0, 0x80

    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    rem-int/lit8 p0, p0, 0x2

    if-eqz p0, :cond_0

    const/16 p0, 0x2b

    div-int/lit8 p0, p0, 0x0

    :cond_0
    return-void
.end method

.method private static getRevenue(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 487
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    add-int/lit8 v0, v0, 0x35

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    rem-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_0

    .line 488
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    .line 489
    throw p0
.end method

.method private static synthetic hashCode([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-object v1, p0, v0

    .line 3
    .line 4
    check-cast v1, Lcom/appsflyer/internal/AFb1tSDK;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    aget-object v1, p0, v1

    .line 8
    .line 9
    check-cast v1, Ljava/lang/String;

    .line 10
    .line 11
    const/4 v2, 0x2

    .line 12
    aget-object p0, p0, v2

    .line 13
    .line 14
    check-cast p0, Ljava/lang/String;

    .line 15
    .line 16
    sget v3, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 17
    .line 18
    add-int/lit8 v3, v3, 0x4d

    .line 19
    .line 20
    rem-int/lit16 v4, v3, 0x80

    .line 21
    .line 22
    sput v4, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 23
    .line 24
    rem-int/2addr v3, v2

    .line 25
    const/4 v4, 0x0

    .line 26
    if-eqz v3, :cond_0

    .line 27
    .line 28
    invoke-static {p0}, Lcom/appsflyer/internal/AFc1tSDK;->getRevenue(Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    const/16 v5, 0x19

    .line 33
    .line 34
    div-int/2addr v5, v0

    .line 35
    if-nez v3, :cond_3

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    invoke-static {p0}, Lcom/appsflyer/internal/AFc1tSDK;->getRevenue(Ljava/lang/String;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_3

    .line 43
    .line 44
    :goto_0
    if-eqz v1, :cond_2

    .line 45
    .line 46
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 47
    .line 48
    add-int/lit8 v0, v0, 0x33

    .line 49
    .line 50
    rem-int/lit16 v3, v0, 0x80

    .line 51
    .line 52
    sput v3, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 53
    .line 54
    rem-int/2addr v0, v2

    .line 55
    if-eqz v0, :cond_1

    .line 56
    .line 57
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    goto :goto_1

    .line 62
    :cond_1
    throw v4

    .line 63
    :cond_2
    const-string v0, ""

    .line 64
    .line 65
    :goto_1
    new-instance v1, Lcom/appsflyer/internal/AFe1iSDK;

    .line 66
    .line 67
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-direct {v1, v0, p0}, Lcom/appsflyer/internal/AFe1iSDK;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    invoke-static {v1}, Lcom/appsflyer/internal/AFe1fSDK;->getMonetizationNetwork(Lcom/appsflyer/internal/AFe1iSDK;)V

    .line 75
    .line 76
    .line 77
    return-object v4

    .line 78
    :cond_3
    const-string p0, "hostname was empty or null - call for setHost is skipped"

    .line 79
    .line 80
    invoke-static {p0}, Lcom/appsflyer/AFLogger;->afWarnLog(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    return-object v4
.end method

.method public static declared-synchronized i_(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .locals 5

    .line 1
    const-class v0, Lcom/appsflyer/internal/AFb1tSDK;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-static {}, Lcom/appsflyer/internal/AFb1tSDK;->getMonetizationNetwork()Lcom/appsflyer/internal/AFb1tSDK;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    iget-object v1, v1, Lcom/appsflyer/internal/AFb1tSDK;->toString:Landroid/content/SharedPreferences;

    .line 9
    .line 10
    if-nez v1, :cond_1

    .line 11
    .line 12
    sget v1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 13
    .line 14
    add-int/lit8 v1, v1, 0x11

    .line 15
    .line 16
    rem-int/lit16 v2, v1, 0x80

    .line 17
    .line 18
    sput v2, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 19
    .line 20
    rem-int/lit8 v1, v1, 0x2

    .line 21
    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-static {}, Landroid/os/StrictMode;->allowThreadDiskReads()Landroid/os/StrictMode$ThreadPolicy;

    .line 25
    .line 26
    .line 27
    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    :try_start_1
    invoke-static {}, Lcom/appsflyer/internal/AFb1tSDK;->getMonetizationNetwork()Lcom/appsflyer/internal/AFb1tSDK;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const-string v3, "appsflyer-data"

    .line 37
    .line 38
    const/4 v4, 0x1

    .line 39
    invoke-virtual {p0, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    :goto_0
    iput-object p0, v2, Lcom/appsflyer/internal/AFb1tSDK;->toString:Landroid/content/SharedPreferences;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 44
    .line 45
    :try_start_2
    invoke-static {v1}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    .line 46
    .line 47
    .line 48
    goto :goto_2

    .line 49
    :catchall_0
    move-exception p0

    .line 50
    goto :goto_3

    .line 51
    :catchall_1
    move-exception p0

    .line 52
    goto :goto_1

    .line 53
    :cond_0
    invoke-static {}, Landroid/os/StrictMode;->allowThreadDiskReads()Landroid/os/StrictMode$ThreadPolicy;

    .line 54
    .line 55
    .line 56
    move-result-object v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 57
    :try_start_3
    invoke-static {}, Lcom/appsflyer/internal/AFb1tSDK;->getMonetizationNetwork()Lcom/appsflyer/internal/AFb1tSDK;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    const-string v3, "appsflyer-data"

    .line 66
    .line 67
    const/4 v4, 0x0

    .line 68
    invoke-virtual {p0, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 69
    .line 70
    .line 71
    move-result-object p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 72
    goto :goto_0

    .line 73
    :goto_1
    :try_start_4
    invoke-static {v1}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    .line 74
    .line 75
    .line 76
    throw p0

    .line 77
    :cond_1
    :goto_2
    invoke-static {}, Lcom/appsflyer/internal/AFb1tSDK;->getMonetizationNetwork()Lcom/appsflyer/internal/AFb1tSDK;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    iget-object p0, p0, Lcom/appsflyer/internal/AFb1tSDK;->toString:Landroid/content/SharedPreferences;

    .line 82
    .line 83
    sget v1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 84
    .line 85
    add-int/lit8 v1, v1, 0x7

    .line 86
    .line 87
    rem-int/lit16 v1, v1, 0x80

    .line 88
    .line 89
    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 90
    .line 91
    monitor-exit v0

    .line 92
    return-object p0

    .line 93
    :goto_3
    :try_start_5
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 94
    throw p0
.end method

.method private synthetic j_(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5

    .line 1
    invoke-virtual {p0, p1}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1fSDK;->unregisterClient()Lcom/appsflyer/internal/AFc1sSDK;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->getRevenue()Lcom/appsflyer/internal/AFd1rSDK;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const/4 v1, 0x0

    .line 21
    if-eqz p2, :cond_0

    .line 22
    .line 23
    sget v2, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 24
    .line 25
    add-int/lit8 v2, v2, 0x41

    .line 26
    .line 27
    rem-int/lit16 v2, v2, 0x80

    .line 28
    .line 29
    sput v2, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 30
    .line 31
    const-string v2, "android.intent.action.VIEW"

    .line 32
    .line 33
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-eqz v2, :cond_0

    .line 42
    .line 43
    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    goto :goto_0

    .line 48
    :cond_0
    move-object v2, v1

    .line 49
    :goto_0
    const/4 v3, 0x0

    .line 50
    if-eqz v2, :cond_1

    .line 51
    .line 52
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    if-nez v2, :cond_1

    .line 61
    .line 62
    const/4 v2, 0x1

    .line 63
    goto :goto_1

    .line 64
    :cond_1
    move v2, v3

    .line 65
    :goto_1
    const-string v4, "ddl_sent"

    .line 66
    .line 67
    invoke-interface {p0, v4}, Lcom/appsflyer/internal/AFd1rSDK;->AFAdRevenueData(Ljava/lang/String;)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-eqz p0, :cond_3

    .line 72
    .line 73
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 74
    .line 75
    add-int/lit8 p0, p0, 0x43

    .line 76
    .line 77
    rem-int/lit16 p0, p0, 0x80

    .line 78
    .line 79
    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 80
    .line 81
    if-nez v2, :cond_3

    .line 82
    .line 83
    add-int/lit8 p0, p0, 0x69

    .line 84
    .line 85
    rem-int/lit16 p1, p0, 0x80

    .line 86
    .line 87
    sput p1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 88
    .line 89
    rem-int/lit8 p0, p0, 0x2

    .line 90
    .line 91
    const-string p1, "No direct deep link"

    .line 92
    .line 93
    if-nez p0, :cond_2

    .line 94
    .line 95
    invoke-virtual {v0, p1, v1}, Lcom/appsflyer/internal/AFc1sSDK;->getCurrencyIso4217Code(Ljava/lang/String;Lcom/appsflyer/deeplink/DeepLinkResult$Error;)V

    .line 96
    .line 97
    .line 98
    const/16 p0, 0x31

    .line 99
    .line 100
    div-int/2addr p0, v3

    .line 101
    return-void

    .line 102
    :cond_2
    invoke-virtual {v0, p1, v1}, Lcom/appsflyer/internal/AFc1sSDK;->getCurrencyIso4217Code(Ljava/lang/String;Lcom/appsflyer/deeplink/DeepLinkResult$Error;)V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_3
    iget-object p0, v0, Lcom/appsflyer/internal/AFc1sSDK;->areAllFieldsValid:Lcom/appsflyer/internal/AFd1fSDK;

    .line 107
    .line 108
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->w()Lcom/appsflyer/internal/AFc1oSDK;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-static {p0}, Lcom/appsflyer/internal/AFc1kSDK;->getRevenue(Lcom/appsflyer/internal/AFc1oSDK;)Lcom/appsflyer/internal/AFc1kSDK;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    invoke-virtual {v0, p0, p2, p1}, Lcom/appsflyer/internal/AFc1sSDK;->p_(Lcom/appsflyer/internal/AFc1kSDK;Landroid/content/Intent;Landroid/content/Context;)V

    .line 117
    .line 118
    .line 119
    return-void
.end method

.method public static synthetic k_(Lcom/appsflyer/internal/AFb1tSDK;)Landroid/app/Application;
    .locals 3

    .line 1
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    long-to-int v0, v0

    .line 10
    const v1, 0x36fc586b

    .line 11
    .line 12
    .line 13
    const v2, -0x36fc5864    # -539257.75f

    .line 14
    .line 15
    .line 16
    invoke-static {p0, v1, v2, v0}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Landroid/app/Application;

    .line 21
    .line 22
    return-object p0
.end method

.method private static synthetic toString([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-object v0, p0, v0

    .line 3
    .line 4
    check-cast v0, Lcom/appsflyer/internal/AFb1tSDK;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    aget-object p0, p0, v1

    .line 8
    .line 9
    check-cast p0, Landroid/content/Context;

    .line 10
    .line 11
    sget v2, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 12
    .line 13
    add-int/2addr v2, v1

    .line 14
    rem-int/lit16 v2, v2, 0x80

    .line 15
    .line 16
    sput v2, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Lcom/appsflyer/AppsFlyerLib;->getAttributionId(Landroid/content/Context;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 23
    .line 24
    add-int/lit8 v0, v0, 0x35

    .line 25
    .line 26
    rem-int/lit16 v1, v0, 0x80

    .line 27
    .line 28
    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 29
    .line 30
    rem-int/lit8 v0, v0, 0x2

    .line 31
    .line 32
    if-nez v0, :cond_0

    .line 33
    .line 34
    return-object p0

    .line 35
    :cond_0
    const/4 p0, 0x0

    .line 36
    throw p0
.end method

.method private static synthetic values([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-object v0, p0, v0

    .line 3
    .line 4
    check-cast v0, Lcom/appsflyer/internal/AFd1rSDK;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    aget-object p0, p0, v1

    .line 8
    .line 9
    check-cast p0, Ljava/lang/String;

    .line 10
    .line 11
    sget v1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 12
    .line 13
    add-int/lit8 v1, v1, 0xb

    .line 14
    .line 15
    rem-int/lit16 v2, v1, 0x80

    .line 16
    .line 17
    sput v2, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 18
    .line 19
    rem-int/lit8 v1, v1, 0x2

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    const-string v3, "CACHED_CHANNEL"

    .line 23
    .line 24
    if-nez v1, :cond_1

    .line 25
    .line 26
    invoke-interface {v0, v3, v2}, Lcom/appsflyer/internal/AFd1rSDK;->getCurrencyIso4217Code(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    return-object v1

    .line 33
    :cond_0
    invoke-interface {v0, v3, p0}, Lcom/appsflyer/internal/AFd1rSDK;->getRevenue(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 37
    .line 38
    add-int/lit8 v0, v0, 0x73

    .line 39
    .line 40
    rem-int/lit16 v0, v0, 0x80

    .line 41
    .line 42
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 43
    .line 44
    return-object p0

    .line 45
    :cond_1
    invoke-interface {v0, v3, v2}, Lcom/appsflyer/internal/AFd1rSDK;->getCurrencyIso4217Code(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    throw v2
.end method


# virtual methods
.method public final AFAdRevenueData(Lcom/appsflyer/internal/AFa1mSDK;)Ljava/util/Map;
    .locals 12
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/appsflyer/internal/AFa1mSDK;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 606
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    move-result-object v0

    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1fSDK;->valueOf()Lcom/appsflyer/internal/AFd1kSDK;

    move-result-object v0

    .line 607
    iget-object v0, v0, Lcom/appsflyer/internal/AFd1kSDK;->getCurrencyIso4217Code:Landroid/content/Context;

    .line 608
    invoke-virtual {p0, v0}, Lcom/appsflyer/internal/AFb1tSDK;->getRevenue(Landroid/content/Context;)Lcom/appsflyer/internal/AFd1rSDK;

    move-result-object v1

    .line 609
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    move-result-object v2

    invoke-interface {v2}, Lcom/appsflyer/internal/AFd1fSDK;->component3()Lcom/appsflyer/internal/AFg1fSDK;

    move-result-object v2

    .line 610
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFa1mSDK;->AFAdRevenueData()Z

    move-result v3

    .line 611
    iget-object v4, p1, Lcom/appsflyer/internal/AFa1mSDK;->AFAdRevenueData:Ljava/util/Map;

    .line 612
    new-instance v5, Ljava/util/Date;

    invoke-direct {v5}, Ljava/util/Date;-><init>()V

    invoke-virtual {v5}, Ljava/util/Date;->getTime()J

    move-result-wide v5

    const/4 v7, 0x6

    .line 613
    new-array v7, v7, [I

    fill-array-data v7, :array_0

    const/4 v8, 0x0

    invoke-static {v8}, Landroid/graphics/ImageFormat;->getBitsPerPixel(I)I

    move-result v9

    add-int/lit8 v9, v9, 0xd

    const/4 v10, 0x1

    new-array v11, v10, [Ljava/lang/Object;

    invoke-static {v7, v9, v11}, Lcom/appsflyer/internal/AFb1tSDK;->a([II[Ljava/lang/Object;)V

    aget-object v7, v11, v8

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v6}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 614
    :try_start_0
    invoke-virtual {p0}, Lcom/appsflyer/AppsFlyerLib;->isStopped()Z

    move-result v5

    if-nez v5, :cond_2

    .line 615
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "******* sendTrackingWithEvent: "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v3, :cond_1

    .line 616
    sget v6, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 v6, v6, 0x57

    rem-int/lit16 v7, v6, 0x80

    sput v7, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    rem-int/lit8 v6, v6, 0x2

    if-eqz v6, :cond_0

    const/16 v6, 0x20

    :try_start_1
    div-int/2addr v6, v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_4

    .line 617
    :cond_0
    :goto_0
    const-string v6, "Launch"

    goto :goto_1

    .line 618
    :cond_1
    :try_start_2
    iget-object v6, p1, Lcom/appsflyer/internal/AFa1mSDK;->component4:Ljava/lang/String;

    .line 619
    :goto_1
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    goto :goto_2

    .line 620
    :cond_2
    const-string v5, "Reporting has been stopped"

    invoke-static {v5}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 621
    :goto_2
    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v5

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    long-to-int v6, v6

    const v7, 0x459e9d33

    const v9, -0x459e9d32

    invoke-static {v5, v7, v9, v6}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 622
    invoke-virtual {p0, v0}, Lcom/appsflyer/AppsFlyerLib;->isPreInstalledApp(Landroid/content/Context;)Z

    move-result v5

    new-instance v6, Lcom/appsflyer/internal/b;

    invoke-direct {v6, p0, v0}, Lcom/appsflyer/internal/b;-><init>(Lcom/appsflyer/internal/AFb1tSDK;Landroid/content/Context;)V

    .line 623
    invoke-interface {v2, v4, v5, v6}, Lcom/appsflyer/internal/AFg1fSDK;->getCurrencyIso4217Code(Ljava/util/Map;ZLkotlin/jvm/functions/Function0;)V

    .line 624
    invoke-static {v1, v3}, Lcom/appsflyer/internal/AFb1tSDK;->getRevenue(Lcom/appsflyer/internal/AFd1rSDK;Z)I

    move-result p0

    .line 625
    iget-object p1, p1, Lcom/appsflyer/internal/AFa1mSDK;->component4:Ljava/lang/String;

    if-eqz p1, :cond_3

    move v8, v10

    .line 626
    :cond_3
    invoke-static {v1, v8}, Lcom/appsflyer/internal/AFb1tSDK;->getMediationNetwork(Lcom/appsflyer/internal/AFd1rSDK;Z)I

    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v3, :cond_5

    .line 627
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 v0, v0, 0x79

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    rem-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_4

    if-ne p0, v10, :cond_5

    goto :goto_3

    :cond_4
    if-ne p0, v10, :cond_5

    .line 628
    :goto_3
    :try_start_3
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    .line 629
    iput-boolean v10, v0, Lcom/appsflyer/AppsFlyerProperties;->getMediationNetwork:Z

    .line 630
    :cond_5
    invoke-interface {v2, v4, p0, p1}, Lcom/appsflyer/internal/AFg1fSDK;->getRevenue(Ljava/util/Map;II)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    return-object v4

    .line 631
    :goto_4
    invoke-virtual {p0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, p0, v10}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;Z)V

    return-object v4

    nop

    :array_0
    .array-data 4
        -0x78fb6b9d
        -0x6bece25d
        0x7a7c9d99
        0x5b6ba5d4
        -0x36bd73c3
        0x48be7c39
    .end array-data
.end method

.method public final AFAdRevenueData()Z
    .locals 2

    .line 591
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    add-int/lit8 p0, p0, 0x1b

    rem-int/lit16 v0, p0, 0x80

    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    rem-int/lit8 p0, p0, 0x2

    const-string v0, "waitForCustomerId"

    const/4 v1, 0x0

    if-nez p0, :cond_0

    invoke-static {v0}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData(Ljava/lang/String;)Z

    move-result p0

    const/16 v0, 0x50

    div-int/2addr v0, v1

    if-eqz p0, :cond_2

    goto :goto_0

    :cond_0
    invoke-static {v0}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_2

    :goto_0
    invoke-static {}, Lcom/appsflyer/internal/AFb1tSDK;->getMediationNetwork()Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_2

    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    add-int/lit8 p0, p0, 0x7

    rem-int/lit16 v0, p0, 0x80

    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    rem-int/lit8 p0, p0, 0x2

    if-nez p0, :cond_1

    return v1

    :cond_1
    const/4 p0, 0x1

    return p0

    :cond_2
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 p0, p0, 0x43

    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    return v1
.end method

.method public final varargs addPushNotificationDeepLinkPath([Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->unregisterClient()Lcom/appsflyer/internal/AFc1sSDK;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget-object p0, p0, Lcom/appsflyer/internal/AFc1sSDK;->getMediationNetwork:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 22
    .line 23
    add-int/lit8 v0, v0, 0x31

    .line 24
    .line 25
    rem-int/lit16 v1, v0, 0x80

    .line 26
    .line 27
    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 28
    .line 29
    rem-int/lit8 v0, v0, 0x2

    .line 30
    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 37
    .line 38
    add-int/lit8 p0, p0, 0x57

    .line 39
    .line 40
    rem-int/lit16 p0, p0, 0x80

    .line 41
    .line 42
    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    const/4 p0, 0x0

    .line 49
    throw p0

    .line 50
    :cond_1
    :goto_0
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 51
    .line 52
    add-int/lit8 p0, p0, 0xf

    .line 53
    .line 54
    rem-int/lit16 p0, p0, 0x80

    .line 55
    .line 56
    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 57
    .line 58
    return-void
.end method

.method public final anonymizeUser(Z)V
    .locals 2

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x2f

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->copydefault()Lcom/appsflyer/internal/AFb1bSDK;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    filled-new-array {v0}, [Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "anonymizeUser"

    .line 26
    .line 27
    invoke-interface {p0, v1, v0}, Lcom/appsflyer/internal/AFb1bSDK;->getMediationNetwork(Ljava/lang/String;[Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-string v0, "deviceTrackingDisabled"

    .line 35
    .line 36
    invoke-virtual {p0, v0, p1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Z)V

    .line 37
    .line 38
    .line 39
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 40
    .line 41
    add-int/lit8 p0, p0, 0x31

    .line 42
    .line 43
    rem-int/lit16 p1, p0, 0x80

    .line 44
    .line 45
    sput p1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 46
    .line 47
    rem-int/lit8 p0, p0, 0x2

    .line 48
    .line 49
    if-nez p0, :cond_0

    .line 50
    .line 51
    return-void

    .line 52
    :cond_0
    const/4 p0, 0x0

    .line 53
    throw p0
.end method

.method public final appendParametersToDeepLinkingURL(Ljava/lang/String;Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1f

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->unregisterClient()Lcom/appsflyer/internal/AFc1sSDK;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iput-object p1, p0, Lcom/appsflyer/internal/AFc1sSDK;->AFAdRevenueData:Ljava/lang/String;

    .line 18
    .line 19
    iput-object p2, p0, Lcom/appsflyer/internal/AFc1sSDK;->getMonetizationNetwork:Ljava/util/Map;

    .line 20
    .line 21
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 22
    .line 23
    add-int/lit8 p0, p0, 0x7

    .line 24
    .line 25
    rem-int/lit16 p1, p0, 0x80

    .line 26
    .line 27
    sput p1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 28
    .line 29
    rem-int/lit8 p0, p0, 0x2

    .line 30
    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    const/16 p0, 0x44

    .line 34
    .line 35
    div-int/lit8 p0, p0, 0x0

    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public final enableFacebookDeferredApplinks(Z)V
    .locals 1

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x23

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->d()Lcom/appsflyer/internal/AFc1eSDK;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0, p1}, Lcom/appsflyer/internal/AFc1eSDK;->AFAdRevenueData(Z)V

    .line 18
    .line 19
    .line 20
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 21
    .line 22
    add-int/lit8 p0, p0, 0x3b

    .line 23
    .line 24
    rem-int/lit16 p0, p0, 0x80

    .line 25
    .line 26
    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 27
    .line 28
    return-void
.end method

.method public final enableTCFDataCollection(Z)V
    .locals 0

    .line 1
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 2
    .line 3
    add-int/lit8 p0, p0, 0x5

    .line 4
    .line 5
    rem-int/lit16 p0, p0, 0x80

    .line 6
    .line 7
    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 8
    .line 9
    const-string p0, "enableTCFDataCollection"

    .line 10
    .line 11
    invoke-static {p1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {p0, p1}, Lcom/appsflyer/internal/AFb1tSDK;->getRevenue(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 19
    .line 20
    add-int/lit8 p0, p0, 0x6d

    .line 21
    .line 22
    rem-int/lit16 p1, p0, 0x80

    .line 23
    .line 24
    sput p1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 25
    .line 26
    rem-int/lit8 p0, p0, 0x2

    .line 27
    .line 28
    if-eqz p0, :cond_0

    .line 29
    .line 30
    const/4 p0, 0x4

    .line 31
    div-int/lit8 p0, p0, 0x0

    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public final g_(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    .line 1
    filled-new-array {p0, p1, p2}, [Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const p2, -0x165c14ac

    .line 10
    .line 11
    .line 12
    const v0, 0x165c14b4

    .line 13
    .line 14
    .line 15
    invoke-static {p1, p2, v0, p0}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final getAppsFlyerUID(Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1fSDK;->copydefault()Lcom/appsflyer/internal/AFb1bSDK;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    new-array v1, v1, [Ljava/lang/String;

    .line 11
    .line 12
    const-string v2, "getAppsFlyerUID"

    .line 13
    .line 14
    invoke-interface {v0, v2, v1}, Lcom/appsflyer/internal/AFb1bSDK;->getMediationNetwork(Ljava/lang/String;[Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 20
    .line 21
    add-int/lit8 p0, p0, 0x67

    .line 22
    .line 23
    rem-int/lit16 p0, p0, 0x80

    .line 24
    .line 25
    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 26
    .line 27
    const/4 p0, 0x0

    .line 28
    return-object p0

    .line 29
    :cond_0
    invoke-virtual {p0, p1}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code(Landroid/content/Context;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->getMediationNetwork()Lcom/appsflyer/internal/AFd1pSDK;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    iget-object p1, p0, Lcom/appsflyer/internal/AFd1pSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFd1kSDK;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/appsflyer/internal/AFd1pSDK;->getRevenue:Lcom/appsflyer/internal/AFd1rSDK;

    .line 43
    .line 44
    invoke-static {p1, p0}, Lcom/appsflyer/internal/AFb1lSDK;->AFAdRevenueData(Lcom/appsflyer/internal/AFd1kSDK;Lcom/appsflyer/internal/AFd1rSDK;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    sget p1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 49
    .line 50
    add-int/lit8 p1, p1, 0x21

    .line 51
    .line 52
    rem-int/lit16 p1, p1, 0x80

    .line 53
    .line 54
    sput p1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 55
    .line 56
    return-object p0
.end method

.method public final getAttributionId(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    .line 1
    :try_start_0
    new-instance v0, Lcom/appsflyer/internal/AFb1mSDK;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p1, p0}, Lcom/appsflyer/internal/AFb1mSDK;-><init>(Landroid/content/Context;Lcom/appsflyer/internal/AFd1fSDK;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/appsflyer/internal/AFb1mSDK;->getMediationNetwork()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    sget p1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 15
    .line 16
    add-int/lit8 p1, p1, 0x15

    .line 17
    .line 18
    rem-int/lit16 p1, p1, 0x80

    .line 19
    .line 20
    sput p1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 21
    .line 22
    return-object p0

    .line 23
    :catchall_0
    move-exception p0

    .line 24
    const-string p1, "Could not collect facebook attribution id. "

    .line 25
    .line 26
    invoke-static {p1, p0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    const/4 p0, 0x0

    .line 30
    return-object p0
.end method

.method public final getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;
    .locals 1

    .line 200
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 v0, v0, 0x11

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    iget-object p0, p0, Lcom/appsflyer/internal/AFb1tSDK;->copydefault:Lcom/appsflyer/internal/AFd1nSDK;

    add-int/lit8 v0, v0, 0x4b

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    return-object p0
.end method

.method public final getCurrencyIso4217Code(Landroid/content/Context;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 201
    iget-object p0, p0, Lcom/appsflyer/internal/AFb1tSDK;->copydefault:Lcom/appsflyer/internal/AFd1nSDK;

    if-eqz p1, :cond_1

    .line 202
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 v0, v0, 0x27

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    rem-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_0

    .line 203
    iget-object p0, p0, Lcom/appsflyer/internal/AFd1nSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFd1kSDK;

    if-eqz p1, :cond_1

    .line 204
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/appsflyer/internal/AFd1kSDK;->getCurrencyIso4217Code:Landroid/content/Context;

    goto :goto_0

    .line 205
    :cond_0
    iget-object p0, p0, Lcom/appsflyer/internal/AFd1nSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFd1kSDK;

    const/4 p0, 0x0

    .line 206
    throw p0

    .line 207
    :cond_1
    :goto_0
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 p0, p0, 0x4d

    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    return-void
.end method

.method public final getHostName()Ljava/lang/String;
    .locals 2

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x47

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->values()Lcom/appsflyer/internal/AFe1fSDK;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFe1fSDK;->getMediationNetwork()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 22
    .line 23
    add-int/lit8 v0, v0, 0x45

    .line 24
    .line 25
    rem-int/lit16 v1, v0, 0x80

    .line 26
    .line 27
    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 28
    .line 29
    rem-int/lit8 v0, v0, 0x2

    .line 30
    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_0
    const/4 p0, 0x0

    .line 35
    throw p0
.end method

.method public final getHostPrefix()Ljava/lang/String;
    .locals 2

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x57

    .line 4
    .line 5
    rem-int/lit16 v1, v0, 0x80

    .line 6
    .line 7
    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 8
    .line 9
    rem-int/lit8 v0, v0, 0x2

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->values()Lcom/appsflyer/internal/AFe1fSDK;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFe1fSDK;->getMonetizationNetwork()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 26
    .line 27
    add-int/lit8 v0, v0, 0x5d

    .line 28
    .line 29
    rem-int/lit16 v1, v0, 0x80

    .line 30
    .line 31
    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 32
    .line 33
    rem-int/lit8 v0, v0, 0x2

    .line 34
    .line 35
    if-nez v0, :cond_0

    .line 36
    .line 37
    const/4 v0, 0x1

    .line 38
    div-int/lit8 v0, v0, 0x0

    .line 39
    .line 40
    :cond_0
    return-object p0

    .line 41
    :cond_1
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFe1fSDK;->getMonetizationNetwork()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    const/4 p0, 0x0

    .line 45
    throw p0
.end method

.method public final getMonetizationNetwork(Landroid/content/Context;Ljava/lang/String;)V
    .locals 10

    .line 1
    const-string v0, "extraReferrers"

    .line 2
    .line 3
    sget v1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 4
    .line 5
    add-int/lit8 v1, v1, 0x17

    .line 6
    .line 7
    rem-int/lit16 v1, v1, 0x80

    .line 8
    .line 9
    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 10
    .line 11
    const-string v1, "received a new (extra) referrer: "

    .line 12
    .line 13
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {v1}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 25
    .line 26
    .line 27
    move-result-wide v1

    .line 28
    invoke-virtual {p0, p1}, Lcom/appsflyer/internal/AFb1tSDK;->getRevenue(Landroid/content/Context;)Lcom/appsflyer/internal/AFd1rSDK;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    const/4 v4, 0x0

    .line 33
    invoke-interface {v3, v0, v4}, Lcom/appsflyer/internal/AFd1rSDK;->getCurrencyIso4217Code(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    if-nez v3, :cond_0

    .line 38
    .line 39
    new-instance v3, Lorg/json/JSONObject;

    .line 40
    .line 41
    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 42
    .line 43
    .line 44
    new-instance v4, Lorg/json/JSONArray;

    .line 45
    .line 46
    invoke-direct {v4}, Lorg/json/JSONArray;-><init>()V

    .line 47
    .line 48
    .line 49
    goto :goto_1

    .line 50
    :catchall_0
    move-exception p0

    .line 51
    goto :goto_2

    .line 52
    :cond_0
    new-instance v4, Lorg/json/JSONObject;

    .line 53
    .line 54
    invoke-direct {v4, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v4, p2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    if-eqz v3, :cond_1

    .line 62
    .line 63
    new-instance v3, Lorg/json/JSONArray;

    .line 64
    .line 65
    invoke-virtual {v4, p2}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v5

    .line 69
    check-cast v5, Ljava/lang/String;

    .line 70
    .line 71
    invoke-direct {v3, v5}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    :goto_0
    move-object v9, v4

    .line 75
    move-object v4, v3

    .line 76
    move-object v3, v9

    .line 77
    goto :goto_1

    .line 78
    :cond_1
    new-instance v3, Lorg/json/JSONArray;

    .line 79
    .line 80
    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :goto_1
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    .line 85
    .line 86
    .line 87
    move-result v5

    .line 88
    int-to-long v5, v5

    .line 89
    const-wide/16 v7, 0x5

    .line 90
    .line 91
    cmp-long v5, v5, v7

    .line 92
    .line 93
    if-gez v5, :cond_2

    .line 94
    .line 95
    invoke-virtual {v4, v1, v2}, Lorg/json/JSONArray;->put(J)Lorg/json/JSONArray;

    .line 96
    .line 97
    .line 98
    :cond_2
    invoke-virtual {v3}, Lorg/json/JSONObject;->length()I

    .line 99
    .line 100
    .line 101
    move-result v1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 102
    int-to-long v1, v1

    .line 103
    const-wide/16 v5, 0x4

    .line 104
    .line 105
    cmp-long v1, v1, v5

    .line 106
    .line 107
    if-ltz v1, :cond_3

    .line 108
    .line 109
    sget v1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 110
    .line 111
    add-int/lit8 v1, v1, 0x6b

    .line 112
    .line 113
    rem-int/lit16 v1, v1, 0x80

    .line 114
    .line 115
    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 116
    .line 117
    :try_start_1
    invoke-static {v3}, Lcom/appsflyer/internal/AFb1tSDK;->getMediationNetwork(Lorg/json/JSONObject;)V

    .line 118
    .line 119
    .line 120
    :cond_3
    invoke-virtual {v4}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    invoke-virtual {v3, p2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 125
    .line 126
    .line 127
    invoke-virtual {p0, p1}, Lcom/appsflyer/internal/AFb1tSDK;->getRevenue(Landroid/content/Context;)Lcom/appsflyer/internal/AFd1rSDK;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    invoke-interface {p0, v0, p1}, Lcom/appsflyer/internal/AFd1rSDK;->getRevenue(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 136
    .line 137
    .line 138
    return-void

    .line 139
    :goto_2
    new-instance p1, Ljava/lang/StringBuilder;

    .line 140
    .line 141
    const-string v0, "Couldn\'t save referrer - "

    .line 142
    .line 143
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    const-string p2, ": "

    .line 150
    .line 151
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    invoke-static {p1, p0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 159
    .line 160
    .line 161
    return-void

    .line 162
    :catch_0
    move-exception p0

    .line 163
    const-string p1, "error at addReferrer"

    .line 164
    .line 165
    invoke-static {p1, p0}, Lcom/appsflyer/AFLogger;->afErrorLogForExcManagerOnly(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 166
    .line 167
    .line 168
    return-void
.end method

.method public final getMonetizationNetwork(Lcom/appsflyer/internal/AFa1mSDK;Lcom/appsflyer/internal/AFh1sSDK;)V
    .locals 1
    .param p1    # Lcom/appsflyer/internal/AFa1mSDK;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/appsflyer/internal/AFh1sSDK;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 176
    invoke-static {p1, p2}, Lcom/appsflyer/internal/AFb1tSDK;->getMediationNetwork(Lcom/appsflyer/internal/AFa1mSDK;Lcom/appsflyer/internal/AFh1sSDK;)V

    .line 177
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    move-result-object p2

    invoke-interface {p2}, Lcom/appsflyer/internal/AFd1fSDK;->AFKeystoreWrapper()Lcom/appsflyer/internal/AFg1rSDK;

    move-result-object p2

    .line 178
    iget-object p2, p2, Lcom/appsflyer/internal/AFg1rSDK;->component1:Ljava/lang/String;

    if-nez p2, :cond_2

    .line 179
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 p0, p0, 0x37

    rem-int/lit16 p2, p0, 0x80

    sput p2, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    rem-int/lit8 p0, p0, 0x2

    const-string p2, "[LogEvent/Launch] AppsFlyer\'s SDK cannot send any event without providing DevKey."

    if-nez p0, :cond_1

    .line 180
    invoke-static {p2}, Lcom/appsflyer/AFLogger;->afWarnLog(Ljava/lang/String;)V

    .line 181
    iget-object p0, p1, Lcom/appsflyer/internal/AFa1mSDK;->getRevenue:Lcom/appsflyer/attribution/AppsFlyerRequestListener;

    if-eqz p0, :cond_0

    .line 182
    sget p1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    add-int/lit8 p1, p1, 0x5d

    rem-int/lit16 p1, p1, 0x80

    sput p1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    const/16 p1, 0x29

    .line 183
    const-string p2, "No dev key"

    invoke-interface {p0, p1, p2}, Lcom/appsflyer/attribution/AppsFlyerRequestListener;->onError(ILjava/lang/String;)V

    .line 184
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    add-int/lit8 p0, p0, 0x4d

    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    :cond_0
    return-void

    .line 185
    :cond_1
    invoke-static {p2}, Lcom/appsflyer/AFLogger;->afWarnLog(Ljava/lang/String;)V

    .line 186
    iget-object p0, p1, Lcom/appsflyer/internal/AFa1mSDK;->getRevenue:Lcom/appsflyer/attribution/AppsFlyerRequestListener;

    const/4 p0, 0x0

    .line 187
    throw p0

    .line 188
    :cond_2
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object p2

    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    move-result-object v0

    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1fSDK;->getRevenue()Lcom/appsflyer/internal/AFd1rSDK;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/appsflyer/AppsFlyerProperties;->getReferrer(Lcom/appsflyer/internal/AFd1rSDK;)Ljava/lang/String;

    move-result-object p2

    if-nez p2, :cond_3

    .line 189
    sget p2, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 p2, p2, 0x2d

    rem-int/lit16 p2, p2, 0x80

    sput p2, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 190
    const-string p2, ""

    .line 191
    :cond_3
    iput-object p2, p1, Lcom/appsflyer/internal/AFa1mSDK;->component2:Ljava/lang/String;

    .line 192
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p0

    const p2, 0x94b72ff

    const v0, -0x94b72fa

    invoke-static {p1, p2, v0, p0}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData([Ljava/lang/Object;III)Ljava/lang/Object;

    return-void
.end method

.method public final getOutOfStore(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "api_store_value"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 15
    .line 16
    add-int/lit8 p0, p0, 0x1f

    .line 17
    .line 18
    rem-int/lit16 p1, p0, 0x80

    .line 19
    .line 20
    sput p1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 21
    .line 22
    rem-int/lit8 p0, p0, 0x2

    .line 23
    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    div-int/2addr v1, v1

    .line 27
    :cond_0
    return-object v0

    .line 28
    :cond_1
    const-string v0, "AF_STORE"

    .line 29
    .line 30
    invoke-direct {p0, p1, v0}, Lcom/appsflyer/internal/AFb1tSDK;->getRevenue(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    if-eqz p0, :cond_3

    .line 35
    .line 36
    sget p1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 37
    .line 38
    add-int/lit8 p1, p1, 0x77

    .line 39
    .line 40
    rem-int/lit16 v0, p1, 0x80

    .line 41
    .line 42
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 43
    .line 44
    rem-int/lit8 p1, p1, 0x2

    .line 45
    .line 46
    if-eqz p1, :cond_2

    .line 47
    .line 48
    const/16 p1, 0x63

    .line 49
    .line 50
    div-int/2addr p1, v1

    .line 51
    :cond_2
    return-object p0

    .line 52
    :cond_3
    const-string p0, "No out-of-store value set"

    .line 53
    .line 54
    invoke-static {p0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    const/4 p0, 0x0

    .line 58
    return-object p0
.end method

.method public final getRevenue(Landroid/content/Context;)Lcom/appsflyer/internal/AFd1rSDK;
    .locals 1

    .line 508
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    add-int/lit8 v0, v0, 0x17

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 509
    invoke-virtual {p0, p1}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code(Landroid/content/Context;)V

    .line 510
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    move-result-object p0

    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->getRevenue()Lcom/appsflyer/internal/AFd1rSDK;

    move-result-object p0

    sget p1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    add-int/lit8 p1, p1, 0x7

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    rem-int/lit8 p1, p1, 0x2

    if-eqz p1, :cond_0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    throw p0
.end method

.method public final getSdkVersion()Ljava/lang/String;
    .locals 3

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x69

    .line 4
    .line 5
    rem-int/lit16 v1, v0, 0x80

    .line 6
    .line 7
    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 8
    .line 9
    rem-int/lit8 v0, v0, 0x2

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    const-string v2, "getSdkVersion"

    .line 13
    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->copydefault()Lcom/appsflyer/internal/AFb1bSDK;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-array v0, v1, [Ljava/lang/String;

    .line 25
    .line 26
    invoke-interface {p0, v2, v0}, Lcom/appsflyer/internal/AFb1bSDK;->getMediationNetwork(Ljava/lang/String;[Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :goto_0
    invoke-static {}, Lcom/appsflyer/internal/AFd1pSDK;->component3()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0

    .line 34
    :cond_0
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->copydefault()Lcom/appsflyer/internal/AFb1bSDK;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    new-array v0, v1, [Ljava/lang/String;

    .line 43
    .line 44
    invoke-interface {p0, v2, v0}, Lcom/appsflyer/internal/AFb1bSDK;->getMediationNetwork(Ljava/lang/String;[Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    goto :goto_0
.end method

.method public final h_(Landroid/content/Context;Lcom/appsflyer/internal/AFc1kSDK;Landroid/net/Uri;Landroid/net/Uri;)V
    .locals 7
    .param p4    # Landroid/net/Uri;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "af_deeplink"

    .line 5
    .line 6
    invoke-virtual {p2, v0}, Lcom/appsflyer/internal/AFc1kSDK;->AFAdRevenueData(Ljava/lang/String;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-nez v1, :cond_3

    .line 11
    .line 12
    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 21
    .line 22
    .line 23
    move-result-wide v2

    .line 24
    long-to-int v2, v2

    .line 25
    const v3, 0x1ed181d0

    .line 26
    .line 27
    .line 28
    const v4, -0x1ed181ce

    .line 29
    .line 30
    .line 31
    invoke-static {v1, v3, v4, v2}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-interface {v2}, Lcom/appsflyer/internal/AFd1fSDK;->unregisterClient()Lcom/appsflyer/internal/AFc1sSDK;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    iget-object v3, v2, Lcom/appsflyer/internal/AFc1sSDK;->AFAdRevenueData:Ljava/lang/String;

    .line 46
    .line 47
    if-eqz v3, :cond_2

    .line 48
    .line 49
    sget v4, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 50
    .line 51
    add-int/lit8 v4, v4, 0x13

    .line 52
    .line 53
    rem-int/lit16 v5, v4, 0x80

    .line 54
    .line 55
    sput v5, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 56
    .line 57
    rem-int/lit8 v4, v4, 0x2

    .line 58
    .line 59
    iget-object v5, v2, Lcom/appsflyer/internal/AFc1sSDK;->getMonetizationNetwork:Ljava/util/Map;

    .line 60
    .line 61
    if-eqz v4, :cond_0

    .line 62
    .line 63
    const/16 v4, 0x51

    .line 64
    .line 65
    div-int/lit8 v4, v4, 0x0

    .line 66
    .line 67
    if-eqz v5, :cond_2

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_0
    if-eqz v5, :cond_2

    .line 71
    .line 72
    :goto_0
    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    if-eqz v3, :cond_2

    .line 77
    .line 78
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {v1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    sget-object v3, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    .line 87
    .line 88
    invoke-virtual {v3}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    iget-object v2, v2, Lcom/appsflyer/internal/AFc1sSDK;->getMonetizationNetwork:Ljava/util/Map;

    .line 93
    .line 94
    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 103
    .line 104
    .line 105
    move-result v4

    .line 106
    if-eqz v4, :cond_1

    .line 107
    .line 108
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object v4

    .line 112
    check-cast v4, Ljava/util/Map$Entry;

    .line 113
    .line 114
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v5

    .line 118
    check-cast v5, Ljava/lang/String;

    .line 119
    .line 120
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v6

    .line 124
    check-cast v6, Ljava/lang/String;

    .line 125
    .line 126
    invoke-virtual {v1, v5, v6}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 127
    .line 128
    .line 129
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object v5

    .line 133
    check-cast v5, Ljava/lang/String;

    .line 134
    .line 135
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object v4

    .line 139
    check-cast v4, Ljava/lang/String;

    .line 140
    .line 141
    invoke-virtual {v3, v5, v4}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 142
    .line 143
    .line 144
    goto :goto_1

    .line 145
    :cond_1
    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    invoke-virtual {v3}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    invoke-virtual {v2}, Landroid/net/Uri;->getEncodedQuery()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v2

    .line 161
    iget-object v3, p2, Lcom/appsflyer/internal/AFc1kSDK;->AFAdRevenueData:Ljava/util/Map;

    .line 162
    .line 163
    const-string v4, "appended_query_params"

    .line 164
    .line 165
    invoke-interface {v3, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    iget-object v2, p2, Lcom/appsflyer/internal/AFc1kSDK;->getRevenue:Lcom/appsflyer/internal/AFc1oSDK;

    .line 169
    .line 170
    if-eqz v2, :cond_2

    .line 171
    .line 172
    iget-object v3, p2, Lcom/appsflyer/internal/AFc1kSDK;->AFAdRevenueData:Ljava/util/Map;

    .line 173
    .line 174
    invoke-interface {v2, v3}, Lcom/appsflyer/internal/AFc1oSDK;->getMediationNetwork(Ljava/util/Map;)V

    .line 175
    .line 176
    .line 177
    :cond_2
    iget-object v2, p2, Lcom/appsflyer/internal/AFc1kSDK;->AFAdRevenueData:Ljava/util/Map;

    .line 178
    .line 179
    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    .line 181
    .line 182
    iget-object v0, p2, Lcom/appsflyer/internal/AFc1kSDK;->getRevenue:Lcom/appsflyer/internal/AFc1oSDK;

    .line 183
    .line 184
    if-eqz v0, :cond_3

    .line 185
    .line 186
    iget-object v1, p2, Lcom/appsflyer/internal/AFc1kSDK;->AFAdRevenueData:Ljava/util/Map;

    .line 187
    .line 188
    invoke-interface {v0, v1}, Lcom/appsflyer/internal/AFc1oSDK;->getMediationNetwork(Ljava/util/Map;)V

    .line 189
    .line 190
    .line 191
    :cond_3
    new-instance v0, Ljava/util/HashMap;

    .line 192
    .line 193
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 194
    .line 195
    .line 196
    const-string v1, "link"

    .line 197
    .line 198
    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v2

    .line 202
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 203
    .line 204
    .line 205
    if-eqz p4, :cond_4

    .line 206
    .line 207
    const-string v1, "original_link"

    .line 208
    .line 209
    invoke-virtual {p4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object p4

    .line 213
    invoke-interface {v0, v1, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 214
    .line 215
    .line 216
    :cond_4
    invoke-static {p1, v0, p3}, Lcom/appsflyer/internal/AFb1vSDK;->d_(Landroid/content/Context;Ljava/util/Map;Landroid/net/Uri;)Ljava/util/Map;

    .line 217
    .line 218
    .line 219
    new-instance p1, Lcom/appsflyer/internal/AFf1cSDK;

    .line 220
    .line 221
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 222
    .line 223
    .line 224
    move-result-object p4

    .line 225
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 226
    .line 227
    .line 228
    move-result-object v1

    .line 229
    invoke-direct {p1, p4, v1, p3}, Lcom/appsflyer/internal/AFf1cSDK;-><init>(Lcom/appsflyer/internal/AFd1fSDK;Ljava/util/UUID;Landroid/net/Uri;)V

    .line 230
    .line 231
    .line 232
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFf1cSDK;->copydefault()Z

    .line 233
    .line 234
    .line 235
    move-result p3

    .line 236
    if-eqz p3, :cond_5

    .line 237
    .line 238
    sget-object p3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 239
    .line 240
    iget-object p4, p2, Lcom/appsflyer/internal/AFc1kSDK;->AFAdRevenueData:Ljava/util/Map;

    .line 241
    .line 242
    const-string v1, "isBrandedDomain"

    .line 243
    .line 244
    invoke-interface {p4, v1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 245
    .line 246
    .line 247
    iget-object p3, p2, Lcom/appsflyer/internal/AFc1kSDK;->getRevenue:Lcom/appsflyer/internal/AFc1oSDK;

    .line 248
    .line 249
    if-eqz p3, :cond_5

    .line 250
    .line 251
    sget p4, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 252
    .line 253
    add-int/lit8 p4, p4, 0x31

    .line 254
    .line 255
    rem-int/lit16 p4, p4, 0x80

    .line 256
    .line 257
    sput p4, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 258
    .line 259
    iget-object p2, p2, Lcom/appsflyer/internal/AFc1kSDK;->AFAdRevenueData:Ljava/util/Map;

    .line 260
    .line 261
    invoke-interface {p3, p2}, Lcom/appsflyer/internal/AFc1oSDK;->getMediationNetwork(Ljava/util/Map;)V

    .line 262
    .line 263
    .line 264
    :cond_5
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFf1cSDK;->copy()Z

    .line 265
    .line 266
    .line 267
    move-result p2

    .line 268
    if-eqz p2, :cond_6

    .line 269
    .line 270
    invoke-direct {p0, v0}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData(Ljava/util/Map;)Lcom/appsflyer/internal/AFf1cSDK$AFa1zSDK;

    .line 271
    .line 272
    .line 273
    move-result-object p2

    .line 274
    iput-object p2, p1, Lcom/appsflyer/internal/AFf1cSDK;->component3:Lcom/appsflyer/internal/AFf1cSDK$AFa1zSDK;

    .line 275
    .line 276
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 277
    .line 278
    .line 279
    move-result-object p0

    .line 280
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->copy()Lcom/appsflyer/internal/AFe1aSDK;

    .line 281
    .line 282
    .line 283
    move-result-object p0

    .line 284
    iget-object p2, p0, Lcom/appsflyer/internal/AFe1aSDK;->AFAdRevenueData:Ljava/util/concurrent/Executor;

    .line 285
    .line 286
    new-instance p3, Lcom/appsflyer/internal/AFe1aSDK$5;

    .line 287
    .line 288
    invoke-direct {p3, p0, p1}, Lcom/appsflyer/internal/AFe1aSDK$5;-><init>(Lcom/appsflyer/internal/AFe1aSDK;Lcom/appsflyer/internal/AFf1wSDK;)V

    .line 289
    .line 290
    .line 291
    invoke-interface {p2, p3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 292
    .line 293
    .line 294
    return-void

    .line 295
    :cond_6
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 296
    .line 297
    .line 298
    move-result-object p0

    .line 299
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->unregisterClient()Lcom/appsflyer/internal/AFc1sSDK;

    .line 300
    .line 301
    .line 302
    move-result-object p0

    .line 303
    invoke-virtual {p0, v0}, Lcom/appsflyer/internal/AFc1sSDK;->AFAdRevenueData(Ljava/util/Map;)V

    .line 304
    .line 305
    .line 306
    return-void
.end method

.method public final init(Ljava/lang/String;Lcom/appsflyer/AppsFlyerConversionListener;Landroid/content/Context;)Lcom/appsflyer/AppsFlyerLib;
    .locals 8
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-boolean v0, p0, Lcom/appsflyer/internal/AFb1tSDK;->hashCode:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    sget p1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 7
    .line 8
    add-int/lit8 p1, p1, 0x59

    .line 9
    .line 10
    rem-int/lit16 p2, p1, 0x80

    .line 11
    .line 12
    sput p2, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 13
    .line 14
    rem-int/lit8 p1, p1, 0x2

    .line 15
    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    const/16 p1, 0x47

    .line 19
    .line 20
    div-int/2addr p1, v1

    .line 21
    :cond_0
    return-object p0

    .line 22
    :cond_1
    const/4 v0, 0x1

    .line 23
    iput-boolean v0, p0, Lcom/appsflyer/internal/AFb1tSDK;->hashCode:Z

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1fSDK;->AFKeystoreWrapper()Lcom/appsflyer/internal/AFg1rSDK;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iput-object p1, v0, Lcom/appsflyer/internal/AFg1rSDK;->component1:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {p1}, Lcom/appsflyer/internal/AFb1kSDK;->AFAdRevenueData(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    if-eqz p3, :cond_c

    .line 39
    .line 40
    invoke-virtual {p0, p3}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code(Landroid/content/Context;)V

    .line 41
    .line 42
    .line 43
    invoke-static {p3}, Lcom/appsflyer/internal/AFb1vSDK;->f_(Landroid/content/Context;)Landroid/app/Application;

    .line 44
    .line 45
    .line 46
    move-result-object p3

    .line 47
    if-eqz p3, :cond_b

    .line 48
    .line 49
    iput-object p3, p0, Lcom/appsflyer/internal/AFb1tSDK;->copy:Landroid/app/Application;

    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 52
    .line 53
    .line 54
    move-result-object p3

    .line 55
    invoke-interface {p3}, Lcom/appsflyer/internal/AFd1fSDK;->AFInAppEventType()Lcom/appsflyer/internal/AFb1uSDK;

    .line 56
    .line 57
    .line 58
    move-result-object p3

    .line 59
    invoke-interface {p3}, Lcom/appsflyer/internal/AFb1uSDK;->getMediationNetwork()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 63
    .line 64
    .line 65
    move-result-object p3

    .line 66
    invoke-interface {p3}, Lcom/appsflyer/internal/AFd1fSDK;->component4()Lcom/appsflyer/internal/AFh1qSDK;

    .line 67
    .line 68
    .line 69
    move-result-object p3

    .line 70
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 71
    .line 72
    .line 73
    move-result-wide v2

    .line 74
    iput-wide v2, p3, Lcom/appsflyer/internal/AFh1qSDK;->AFAdRevenueData:J

    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 77
    .line 78
    .line 79
    move-result-object p3

    .line 80
    invoke-interface {p3}, Lcom/appsflyer/internal/AFd1fSDK;->copy()Lcom/appsflyer/internal/AFe1aSDK;

    .line 81
    .line 82
    .line 83
    move-result-object p3

    .line 84
    new-instance v0, Lcom/appsflyer/internal/AFf1mSDK;

    .line 85
    .line 86
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-direct {v0, v2}, Lcom/appsflyer/internal/AFf1mSDK;-><init>(Lcom/appsflyer/internal/AFd1fSDK;)V

    .line 91
    .line 92
    .line 93
    iget-object v2, p3, Lcom/appsflyer/internal/AFe1aSDK;->AFAdRevenueData:Ljava/util/concurrent/Executor;

    .line 94
    .line 95
    new-instance v3, Lcom/appsflyer/internal/AFe1aSDK$5;

    .line 96
    .line 97
    invoke-direct {v3, p3, v0}, Lcom/appsflyer/internal/AFe1aSDK$5;-><init>(Lcom/appsflyer/internal/AFe1aSDK;Lcom/appsflyer/internal/AFf1wSDK;)V

    .line 98
    .line 99
    .line 100
    invoke-interface {v2, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 104
    .line 105
    .line 106
    move-result-object p3

    .line 107
    invoke-interface {p3}, Lcom/appsflyer/internal/AFd1fSDK;->AFLogger()Lcom/appsflyer/internal/AFi1xSDK;

    .line 108
    .line 109
    .line 110
    move-result-object p3

    .line 111
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 112
    .line 113
    const/16 v2, 0x1f

    .line 114
    .line 115
    if-lt v0, v2, :cond_2

    .line 116
    .line 117
    new-instance v0, Lcom/appsflyer/internal/AFi1rSDK;

    .line 118
    .line 119
    iget-object v2, p3, Lcom/appsflyer/internal/AFi1xSDK;->getRevenue:Landroid/content/Context;

    .line 120
    .line 121
    invoke-direct {v0, v2}, Lcom/appsflyer/internal/AFi1rSDK;-><init>(Landroid/content/Context;)V

    .line 122
    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_2
    new-instance v0, Lcom/appsflyer/internal/AFi1tSDK;

    .line 126
    .line 127
    iget-object v2, p3, Lcom/appsflyer/internal/AFi1xSDK;->getRevenue:Landroid/content/Context;

    .line 128
    .line 129
    invoke-direct {v0, v2}, Lcom/appsflyer/internal/AFi1tSDK;-><init>(Landroid/content/Context;)V

    .line 130
    .line 131
    .line 132
    :goto_0
    iput-object v0, p3, Lcom/appsflyer/internal/AFi1xSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFi1wSDK;

    .line 133
    .line 134
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 135
    .line 136
    .line 137
    move-result-object p3

    .line 138
    invoke-interface {p3}, Lcom/appsflyer/internal/AFd1fSDK;->afDebugLog()Lcom/appsflyer/internal/AFd1bSDK;

    .line 139
    .line 140
    .line 141
    move-result-object p3

    .line 142
    new-instance v0, Lcom/appsflyer/internal/c;

    .line 143
    .line 144
    invoke-direct {v0, p0}, Lcom/appsflyer/internal/c;-><init>(Lcom/appsflyer/internal/AFb1tSDK;)V

    .line 145
    .line 146
    .line 147
    invoke-interface {p3, v0}, Lcom/appsflyer/internal/AFd1bSDK;->getCurrencyIso4217Code(Lcom/appsflyer/internal/AFd1bSDK$AFa1ySDK;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 151
    .line 152
    .line 153
    move-result-object p3

    .line 154
    invoke-interface {p3}, Lcom/appsflyer/internal/AFd1fSDK;->component2()Lcom/appsflyer/internal/AFg1wSDK;

    .line 155
    .line 156
    .line 157
    move-result-object p3

    .line 158
    invoke-direct {p0}, Lcom/appsflyer/internal/AFb1tSDK;->component3()Lcom/appsflyer/internal/AFg1ySDK;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    invoke-virtual {p3, v0}, Lcom/appsflyer/internal/AFg1wSDK;->getCurrencyIso4217Code(Lcom/appsflyer/internal/AFg1ySDK;)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 166
    .line 167
    .line 168
    move-result-object p3

    .line 169
    invoke-interface {p3}, Lcom/appsflyer/internal/AFd1fSDK;->equals()Lcom/appsflyer/internal/AFj1vSDK;

    .line 170
    .line 171
    .line 172
    move-result-object p3

    .line 173
    new-instance v0, Lcom/appsflyer/internal/d;

    .line 174
    .line 175
    invoke-direct {v0, p0}, Lcom/appsflyer/internal/d;-><init>(Lcom/appsflyer/internal/AFb1tSDK;)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {p3, v0}, Lcom/appsflyer/internal/AFj1vSDK;->getMonetizationNetwork(Ljava/lang/Runnable;)Lcom/appsflyer/internal/AFi1gSDK;

    .line 179
    .line 180
    .line 181
    move-result-object v2

    .line 182
    invoke-virtual {p3, v2, v0}, Lcom/appsflyer/internal/AFj1vSDK;->getCurrencyIso4217Code(Lcom/appsflyer/internal/AFi1gSDK;Ljava/lang/Runnable;)Ljava/lang/Runnable;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    invoke-virtual {p3, v2}, Lcom/appsflyer/internal/AFj1vSDK;->getRevenue(Lcom/appsflyer/internal/AFj1zSDK;)V

    .line 187
    .line 188
    .line 189
    new-instance v2, Lcom/appsflyer/internal/AFj1ySDK;

    .line 190
    .line 191
    iget-object v3, p3, Lcom/appsflyer/internal/AFj1vSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFd1fSDK;

    .line 192
    .line 193
    invoke-interface {v3}, Lcom/appsflyer/internal/AFd1fSDK;->getMediationNetwork()Lcom/appsflyer/internal/AFd1pSDK;

    .line 194
    .line 195
    .line 196
    move-result-object v3

    .line 197
    invoke-direct {v2, v3, v0}, Lcom/appsflyer/internal/AFj1ySDK;-><init>(Lcom/appsflyer/internal/AFd1pSDK;Ljava/lang/Runnable;)V

    .line 198
    .line 199
    .line 200
    invoke-virtual {p3, v2}, Lcom/appsflyer/internal/AFj1vSDK;->getRevenue(Lcom/appsflyer/internal/AFj1zSDK;)V

    .line 201
    .line 202
    .line 203
    new-instance v2, Lcom/appsflyer/internal/AFi1cSDK;

    .line 204
    .line 205
    iget-object v3, p3, Lcom/appsflyer/internal/AFj1vSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFd1fSDK;

    .line 206
    .line 207
    new-instance v4, Lcom/appsflyer/internal/AFi1jSDK;

    .line 208
    .line 209
    invoke-direct {v4}, Lcom/appsflyer/internal/AFi1jSDK;-><init>()V

    .line 210
    .line 211
    .line 212
    invoke-direct {v2, v0, v3, v4}, Lcom/appsflyer/internal/AFi1cSDK;-><init>(Ljava/lang/Runnable;Lcom/appsflyer/internal/AFd1fSDK;Lcom/appsflyer/internal/AFi1fSDK;)V

    .line 213
    .line 214
    .line 215
    invoke-virtual {p3, v2}, Lcom/appsflyer/internal/AFj1vSDK;->getRevenue(Lcom/appsflyer/internal/AFj1zSDK;)V

    .line 216
    .line 217
    .line 218
    new-instance v2, Lcom/appsflyer/internal/AFj1wSDK;

    .line 219
    .line 220
    iget-object v3, p3, Lcom/appsflyer/internal/AFj1vSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFd1fSDK;

    .line 221
    .line 222
    invoke-direct {v2, v0, v3}, Lcom/appsflyer/internal/AFj1wSDK;-><init>(Ljava/lang/Runnable;Lcom/appsflyer/internal/AFd1fSDK;)V

    .line 223
    .line 224
    .line 225
    invoke-virtual {p3, v2}, Lcom/appsflyer/internal/AFj1vSDK;->getRevenue(Lcom/appsflyer/internal/AFj1zSDK;)V

    .line 226
    .line 227
    .line 228
    invoke-virtual {p3, v0}, Lcom/appsflyer/internal/AFj1vSDK;->AFAdRevenueData(Ljava/lang/Runnable;)V

    .line 229
    .line 230
    .line 231
    invoke-virtual {p3}, Lcom/appsflyer/internal/AFj1vSDK;->getCurrencyIso4217Code()Z

    .line 232
    .line 233
    .line 234
    move-result v2

    .line 235
    if-nez v2, :cond_6

    .line 236
    .line 237
    iget-object v2, p3, Lcom/appsflyer/internal/AFj1vSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFd1fSDK;

    .line 238
    .line 239
    invoke-interface {v2}, Lcom/appsflyer/internal/AFd1fSDK;->valueOf()Lcom/appsflyer/internal/AFd1kSDK;

    .line 240
    .line 241
    .line 242
    move-result-object v2

    .line 243
    iget-object v2, v2, Lcom/appsflyer/internal/AFd1kSDK;->getCurrencyIso4217Code:Landroid/content/Context;

    .line 244
    .line 245
    iget-object v3, p3, Lcom/appsflyer/internal/AFj1vSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFd1fSDK;

    .line 246
    .line 247
    new-instance v4, Landroid/content/Intent;

    .line 248
    .line 249
    const-string v5, "com.appsflyer.referrer.INSTALL_PROVIDER"

    .line 250
    .line 251
    invoke-direct {v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 252
    .line 253
    .line 254
    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 255
    .line 256
    .line 257
    move-result-object v2

    .line 258
    invoke-virtual {v2, v4, v1}, Landroid/content/pm/PackageManager;->queryIntentContentProviders(Landroid/content/Intent;I)Ljava/util/List;

    .line 259
    .line 260
    .line 261
    move-result-object v2

    .line 262
    if-eqz v2, :cond_6

    .line 263
    .line 264
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 265
    .line 266
    .line 267
    move-result v4

    .line 268
    if-eqz v4, :cond_3

    .line 269
    .line 270
    goto :goto_2

    .line 271
    :cond_3
    new-instance v4, Ljava/util/ArrayList;

    .line 272
    .line 273
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 274
    .line 275
    .line 276
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 277
    .line 278
    .line 279
    move-result-object v2

    .line 280
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 281
    .line 282
    .line 283
    move-result v5

    .line 284
    if-eqz v5, :cond_5

    .line 285
    .line 286
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 287
    .line 288
    .line 289
    move-result-object v5

    .line 290
    check-cast v5, Landroid/content/pm/ResolveInfo;

    .line 291
    .line 292
    iget-object v5, v5, Landroid/content/pm/ResolveInfo;->providerInfo:Landroid/content/pm/ProviderInfo;

    .line 293
    .line 294
    if-eqz v5, :cond_4

    .line 295
    .line 296
    new-instance v6, Lcom/appsflyer/internal/AFi1bSDK;

    .line 297
    .line 298
    invoke-direct {v6, v5, v0, v3}, Lcom/appsflyer/internal/AFi1bSDK;-><init>(Landroid/content/pm/ProviderInfo;Ljava/lang/Runnable;Lcom/appsflyer/internal/AFd1fSDK;)V

    .line 299
    .line 300
    .line 301
    invoke-interface {v4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 302
    .line 303
    .line 304
    goto :goto_1

    .line 305
    :cond_4
    sget-object v5, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 306
    .line 307
    sget-object v6, Lcom/appsflyer/internal/AFg1cSDK;->e:Lcom/appsflyer/internal/AFg1cSDK;

    .line 308
    .line 309
    const-string v7, "com.appsflyer.referrer.INSTALL_PROVIDER Action is set for non ContentProvider component"

    .line 310
    .line 311
    invoke-virtual {v5, v6, v7}, Lcom/appsflyer/internal/AFh1ySDK;->w(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;)V

    .line 312
    .line 313
    .line 314
    goto :goto_1

    .line 315
    :cond_5
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    .line 316
    .line 317
    .line 318
    move-result v0

    .line 319
    if-nez v0, :cond_6

    .line 320
    .line 321
    iget-object v0, p3, Lcom/appsflyer/internal/AFj1vSDK;->getMonetizationNetwork:Ljava/util/List;

    .line 322
    .line 323
    invoke-interface {v0, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 324
    .line 325
    .line 326
    sget-object v0, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 327
    .line 328
    sget-object v2, Lcom/appsflyer/internal/AFg1cSDK;->e:Lcom/appsflyer/internal/AFg1cSDK;

    .line 329
    .line 330
    new-instance v3, Ljava/lang/StringBuilder;

    .line 331
    .line 332
    const-string v5, "Detected "

    .line 333
    .line 334
    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 335
    .line 336
    .line 337
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 338
    .line 339
    .line 340
    move-result v4

    .line 341
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 342
    .line 343
    .line 344
    const-string v4, " valid preinstall provider(s)"

    .line 345
    .line 346
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 347
    .line 348
    .line 349
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 350
    .line 351
    .line 352
    move-result-object v3

    .line 353
    invoke-virtual {v0, v2, v3}, Lcom/appsflyer/internal/AFh1ySDK;->d(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;)V

    .line 354
    .line 355
    .line 356
    :cond_6
    :goto_2
    invoke-virtual {p3}, Lcom/appsflyer/internal/AFj1vSDK;->AFAdRevenueData()[Lcom/appsflyer/internal/AFj1zSDK;

    .line 357
    .line 358
    .line 359
    move-result-object v0

    .line 360
    array-length v2, v0

    .line 361
    move v3, v1

    .line 362
    :goto_3
    if-ge v3, v2, :cond_7

    .line 363
    .line 364
    aget-object v4, v0, v3

    .line 365
    .line 366
    iget-object v5, p3, Lcom/appsflyer/internal/AFj1vSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFd1fSDK;

    .line 367
    .line 368
    invoke-interface {v5}, Lcom/appsflyer/internal/AFd1fSDK;->valueOf()Lcom/appsflyer/internal/AFd1kSDK;

    .line 369
    .line 370
    .line 371
    move-result-object v5

    .line 372
    iget-object v5, v5, Lcom/appsflyer/internal/AFd1kSDK;->getCurrencyIso4217Code:Landroid/content/Context;

    .line 373
    .line 374
    invoke-virtual {v4, v5}, Lcom/appsflyer/internal/AFj1zSDK;->getMonetizationNetwork(Landroid/content/Context;)V

    .line 375
    .line 376
    .line 377
    add-int/lit8 v3, v3, 0x1

    .line 378
    .line 379
    goto :goto_3

    .line 380
    :cond_7
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 381
    .line 382
    .line 383
    move-result-object p3

    .line 384
    invoke-interface {p3}, Lcom/appsflyer/internal/AFd1fSDK;->afInfoLog()Lcom/appsflyer/internal/AFi1mSDK;

    .line 385
    .line 386
    .line 387
    move-result-object p3

    .line 388
    if-eqz p3, :cond_8

    .line 389
    .line 390
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 391
    .line 392
    add-int/lit8 v0, v0, 0x9

    .line 393
    .line 394
    rem-int/lit16 v0, v0, 0x80

    .line 395
    .line 396
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 397
    .line 398
    invoke-interface {p3}, Lcom/appsflyer/internal/AFi1mSDK;->getCurrencyIso4217Code()Z

    .line 399
    .line 400
    .line 401
    move-result v0

    .line 402
    if-eqz v0, :cond_8

    .line 403
    .line 404
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 405
    .line 406
    .line 407
    move-result-object v0

    .line 408
    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1fSDK;->copy()Lcom/appsflyer/internal/AFe1aSDK;

    .line 409
    .line 410
    .line 411
    move-result-object v0

    .line 412
    new-instance v2, Lcom/appsflyer/internal/AFf1kSDK;

    .line 413
    .line 414
    invoke-direct {v2, p3}, Lcom/appsflyer/internal/AFf1kSDK;-><init>(Lcom/appsflyer/internal/AFi1mSDK;)V

    .line 415
    .line 416
    .line 417
    iget-object p3, v0, Lcom/appsflyer/internal/AFe1aSDK;->AFAdRevenueData:Ljava/util/concurrent/Executor;

    .line 418
    .line 419
    new-instance v3, Lcom/appsflyer/internal/AFe1aSDK$5;

    .line 420
    .line 421
    invoke-direct {v3, v0, v2}, Lcom/appsflyer/internal/AFe1aSDK$5;-><init>(Lcom/appsflyer/internal/AFe1aSDK;Lcom/appsflyer/internal/AFf1wSDK;)V

    .line 422
    .line 423
    .line 424
    invoke-interface {p3, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 425
    .line 426
    .line 427
    sget p3, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 428
    .line 429
    add-int/lit8 p3, p3, 0x5d

    .line 430
    .line 431
    rem-int/lit16 p3, p3, 0x80

    .line 432
    .line 433
    sput p3, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 434
    .line 435
    :cond_8
    iget-object p3, p0, Lcom/appsflyer/internal/AFb1tSDK;->copydefault:Lcom/appsflyer/internal/AFd1nSDK;

    .line 436
    .line 437
    invoke-virtual {p3}, Lcom/appsflyer/internal/AFd1nSDK;->AFKeystoreWrapper()Lcom/appsflyer/internal/AFg1rSDK;

    .line 438
    .line 439
    .line 440
    move-result-object p3

    .line 441
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 442
    .line 443
    .line 444
    move-result-object v0

    .line 445
    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1fSDK;->getMediationNetwork()Lcom/appsflyer/internal/AFd1pSDK;

    .line 446
    .line 447
    .line 448
    move-result-object v0

    .line 449
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 450
    .line 451
    .line 452
    move-result-wide v2

    .line 453
    iput-wide v2, p3, Lcom/appsflyer/internal/AFg1rSDK;->getCurrencyIso4217Code:J

    .line 454
    .line 455
    iget-object v2, p3, Lcom/appsflyer/internal/AFg1rSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFg1sSDK;

    .line 456
    .line 457
    new-instance v3, Ljava/lang/StringBuilder;

    .line 458
    .line 459
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 460
    .line 461
    .line 462
    iget-object v4, v0, Lcom/appsflyer/internal/AFd1pSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFd1kSDK;

    .line 463
    .line 464
    iget-object v0, v0, Lcom/appsflyer/internal/AFd1pSDK;->getRevenue:Lcom/appsflyer/internal/AFd1rSDK;

    .line 465
    .line 466
    invoke-static {v4, v0}, Lcom/appsflyer/internal/AFb1lSDK;->AFAdRevenueData(Lcom/appsflyer/internal/AFd1kSDK;Lcom/appsflyer/internal/AFd1rSDK;)Ljava/lang/String;

    .line 467
    .line 468
    .line 469
    move-result-object v0

    .line 470
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 471
    .line 472
    .line 473
    iget-wide v4, p3, Lcom/appsflyer/internal/AFg1rSDK;->getCurrencyIso4217Code:J

    .line 474
    .line 475
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 476
    .line 477
    .line 478
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 479
    .line 480
    .line 481
    move-result-object v0

    .line 482
    invoke-static {v0}, Lcom/appsflyer/internal/AFb1iSDK;->getMonetizationNetwork(Ljava/lang/String;)[B

    .line 483
    .line 484
    .line 485
    move-result-object v0

    .line 486
    if-eqz v0, :cond_a

    .line 487
    .line 488
    array-length v3, v0

    .line 489
    if-lez v3, :cond_a

    .line 490
    .line 491
    array-length v3, v0

    .line 492
    const/16 v4, 0x8

    .line 493
    .line 494
    if-le v3, v4, :cond_9

    .line 495
    .line 496
    invoke-static {v0, v1, v4}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 497
    .line 498
    .line 499
    move-result-object v0

    .line 500
    :cond_9
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 501
    .line 502
    .line 503
    move-result-object v1

    .line 504
    invoke-virtual {v1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 505
    .line 506
    .line 507
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 508
    .line 509
    .line 510
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->getLong()J

    .line 511
    .line 512
    .line 513
    move-result-wide v0

    .line 514
    goto :goto_4

    .line 515
    :cond_a
    const-wide/16 v0, -0x1

    .line 516
    .line 517
    :goto_4
    iget-object v3, p3, Lcom/appsflyer/internal/AFg1rSDK;->getRevenue:Lcom/appsflyer/internal/AFd1kSDK;

    .line 518
    .line 519
    iget-object v3, v3, Lcom/appsflyer/internal/AFd1kSDK;->getCurrencyIso4217Code:Landroid/content/Context;

    .line 520
    .line 521
    new-instance v4, Lcom/appsflyer/internal/AFg1rSDK$1;

    .line 522
    .line 523
    invoke-direct {v4, p3}, Lcom/appsflyer/internal/AFg1rSDK$1;-><init>(Lcom/appsflyer/internal/AFg1rSDK;)V

    .line 524
    .line 525
    .line 526
    invoke-virtual {v2, v0, v1, v3, v4}, Lcom/appsflyer/internal/AFg1sSDK;->AFAdRevenueData(JLandroid/content/Context;Lcom/appsflyer/internal/AFg1sSDK$AFa1ySDK;)Z

    .line 527
    .line 528
    .line 529
    move-result v0

    .line 530
    iput-boolean v0, p3, Lcom/appsflyer/internal/AFg1rSDK;->getMonetizationNetwork:Z

    .line 531
    .line 532
    goto :goto_5

    .line 533
    :cond_b
    return-object p0

    .line 534
    :cond_c
    sget-object p3, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 535
    .line 536
    sget-object v0, Lcom/appsflyer/internal/AFg1cSDK;->toString:Lcom/appsflyer/internal/AFg1cSDK;

    .line 537
    .line 538
    const-string v1, "context is null, Google Install Referrer will be not initialized"

    .line 539
    .line 540
    invoke-virtual {p3, v0, v1}, Lcom/appsflyer/internal/AFh1ySDK;->w(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;)V

    .line 541
    .line 542
    .line 543
    sget p3, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 544
    .line 545
    add-int/lit8 p3, p3, 0x45

    .line 546
    .line 547
    rem-int/lit16 p3, p3, 0x80

    .line 548
    .line 549
    sput p3, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 550
    .line 551
    :goto_5
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 552
    .line 553
    .line 554
    move-result-object p3

    .line 555
    invoke-interface {p3}, Lcom/appsflyer/internal/AFd1fSDK;->copydefault()Lcom/appsflyer/internal/AFb1bSDK;

    .line 556
    .line 557
    .line 558
    move-result-object p3

    .line 559
    if-nez p2, :cond_d

    .line 560
    .line 561
    const-string v0, "null"

    .line 562
    .line 563
    goto :goto_6

    .line 564
    :cond_d
    const-string v0, "conversionDataListener"

    .line 565
    .line 566
    :goto_6
    filled-new-array {p1, v0}, [Ljava/lang/String;

    .line 567
    .line 568
    .line 569
    move-result-object p1

    .line 570
    const-string v0, "init"

    .line 571
    .line 572
    invoke-interface {p3, v0, p1}, Lcom/appsflyer/internal/AFb1bSDK;->getMediationNetwork(Ljava/lang/String;[Ljava/lang/String;)V

    .line 573
    .line 574
    .line 575
    sget-object p1, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 576
    .line 577
    sget-object p3, Lcom/appsflyer/internal/AFg1cSDK;->AFLogger:Lcom/appsflyer/internal/AFg1cSDK;

    .line 578
    .line 579
    const-string v0, "6.15.0"

    .line 580
    .line 581
    sget-object v1, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData:Ljava/lang/String;

    .line 582
    .line 583
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 584
    .line 585
    .line 586
    move-result-object v0

    .line 587
    const-string v1, "Initializing AppsFlyer SDK: (v%s.%s)"

    .line 588
    .line 589
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 590
    .line 591
    .line 592
    move-result-object v0

    .line 593
    invoke-virtual {p1, p3, v0}, Lcom/appsflyer/internal/AFh1ySDK;->force(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;)V

    .line 594
    .line 595
    .line 596
    iput-object p2, p0, Lcom/appsflyer/internal/AFb1tSDK;->getMediationNetwork:Lcom/appsflyer/AppsFlyerConversionListener;

    .line 597
    .line 598
    return-object p0
.end method

.method public final isPreInstalledApp(Landroid/content/Context;)Z
    .locals 1

    .line 1
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 2
    .line 3
    add-int/lit8 p0, p0, 0x2f

    .line 4
    .line 5
    rem-int/lit16 p0, p0, 0x80

    .line 6
    .line 7
    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {v0, p1, p0}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iget p1, p1, Landroid/content/pm/ApplicationInfo;->flags:I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    and-int/2addr p1, v0

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    return v0

    .line 29
    :cond_0
    sget p1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 30
    .line 31
    add-int/lit8 p1, p1, 0x47

    .line 32
    .line 33
    rem-int/lit16 p1, p1, 0x80

    .line 34
    .line 35
    sput p1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :catch_0
    move-exception p1

    .line 39
    const-string v0, "Could not check if app is pre installed"

    .line 40
    .line 41
    invoke-static {v0, p1}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 42
    .line 43
    .line 44
    :goto_0
    return p0
.end method

.method public final isStopped()Z
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x23

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->AFKeystoreWrapper()Lcom/appsflyer/internal/AFg1rSDK;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFg1rSDK;->getMonetizationNetwork()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 22
    .line 23
    add-int/lit8 v0, v0, 0x7d

    .line 24
    .line 25
    rem-int/lit16 v1, v0, 0x80

    .line 26
    .line 27
    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 28
    .line 29
    rem-int/lit8 v0, v0, 0x2

    .line 30
    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    return p0

    .line 34
    :cond_0
    const/4 p0, 0x0

    .line 35
    throw p0
.end method

.method public final logAdRevenue(Lcom/appsflyer/AFAdRevenueData;Ljava/util/Map;)V
    .locals 2
    .param p1    # Lcom/appsflyer/AFAdRevenueData;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/Map;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/appsflyer/AFAdRevenueData;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x13

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 8
    .line 9
    iget-boolean v0, p0, Lcom/appsflyer/internal/AFb1tSDK;->hashCode:Z

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const-string p0, "logAdRevenue"

    .line 14
    .line 15
    invoke-static {p0}, Lcom/appsflyer/internal/AFb1tSDK;->component1(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-virtual {p1}, Lcom/appsflyer/AFAdRevenueData;->areAllFieldsValid()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 26
    .line 27
    add-int/lit8 p0, p0, 0x6b

    .line 28
    .line 29
    rem-int/lit16 p0, p0, 0x80

    .line 30
    .line 31
    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 32
    .line 33
    sget-object p0, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 34
    .line 35
    sget-object p1, Lcom/appsflyer/internal/AFg1cSDK;->values:Lcom/appsflyer/internal/AFg1cSDK;

    .line 36
    .line 37
    const-string p2, "Invalid ad revenue parameters provided"

    .line 38
    .line 39
    invoke-virtual {p0, p1, p2}, Lcom/appsflyer/internal/AFh1ySDK;->w(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1fSDK;->AFKeystoreWrapper()Lcom/appsflyer/internal/AFg1rSDK;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Lcom/appsflyer/internal/AFg1rSDK;->getMonetizationNetwork()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    const/4 v1, 0x0

    .line 56
    if-eqz v0, :cond_3

    .line 57
    .line 58
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 59
    .line 60
    add-int/lit8 p0, p0, 0x73

    .line 61
    .line 62
    rem-int/lit16 p1, p0, 0x80

    .line 63
    .line 64
    sput p1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 65
    .line 66
    rem-int/lit8 p0, p0, 0x2

    .line 67
    .line 68
    const-string p1, "SDK is stopped"

    .line 69
    .line 70
    if-eqz p0, :cond_2

    .line 71
    .line 72
    sget-object p0, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 73
    .line 74
    sget-object p2, Lcom/appsflyer/internal/AFg1cSDK;->values:Lcom/appsflyer/internal/AFg1cSDK;

    .line 75
    .line 76
    invoke-virtual {p0, p2, p1}, Lcom/appsflyer/internal/AFh1ySDK;->w(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 80
    .line 81
    add-int/lit8 p0, p0, 0x1f

    .line 82
    .line 83
    rem-int/lit16 p0, p0, 0x80

    .line 84
    .line 85
    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 86
    .line 87
    return-void

    .line 88
    :cond_2
    sget-object p0, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 89
    .line 90
    sget-object p2, Lcom/appsflyer/internal/AFg1cSDK;->values:Lcom/appsflyer/internal/AFg1cSDK;

    .line 91
    .line 92
    invoke-virtual {p0, p2, p1}, Lcom/appsflyer/internal/AFh1ySDK;->w(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    throw v1

    .line 96
    :cond_3
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1fSDK;->AFKeystoreWrapper()Lcom/appsflyer/internal/AFg1rSDK;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    iget-object v0, v0, Lcom/appsflyer/internal/AFg1rSDK;->component1:Ljava/lang/String;

    .line 105
    .line 106
    invoke-static {v0}, Lcom/appsflyer/internal/AFc1tSDK;->getCurrencyIso4217Code(Ljava/lang/String;)Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-eqz v0, :cond_5

    .line 111
    .line 112
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 113
    .line 114
    add-int/lit8 p0, p0, 0x49

    .line 115
    .line 116
    rem-int/lit16 p1, p0, 0x80

    .line 117
    .line 118
    sput p1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 119
    .line 120
    rem-int/lit8 p0, p0, 0x2

    .line 121
    .line 122
    if-eqz p0, :cond_4

    .line 123
    .line 124
    invoke-static {}, Lcom/appsflyer/internal/AFb1tSDK;->areAllFieldsValid()V

    .line 125
    .line 126
    .line 127
    return-void

    .line 128
    :cond_4
    invoke-static {}, Lcom/appsflyer/internal/AFb1tSDK;->areAllFieldsValid()V

    .line 129
    .line 130
    .line 131
    throw v1

    .line 132
    :cond_5
    new-instance v0, Lcom/appsflyer/internal/AFh1rSDK;

    .line 133
    .line 134
    invoke-direct {v0, p1, p2}, Lcom/appsflyer/internal/AFh1rSDK;-><init>(Lcom/appsflyer/AFAdRevenueData;Ljava/util/Map;)V

    .line 135
    .line 136
    .line 137
    filled-new-array {p0, v0}, [Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 142
    .line 143
    .line 144
    move-result p0

    .line 145
    const p2, 0x94b72ff

    .line 146
    .line 147
    .line 148
    const v0, -0x94b72fa

    .line 149
    .line 150
    .line 151
    invoke-static {p1, p2, v0, p0}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    return-void
.end method

.method public final logEvent(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 193
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 v0, v0, 0x21

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 194
    invoke-virtual {p0, p1, p2, p3, v1}, Lcom/appsflyer/AppsFlyerLib;->logEvent(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;Lcom/appsflyer/attribution/AppsFlyerRequestListener;)V

    const/16 p0, 0x1f

    .line 195
    div-int/lit8 p0, p0, 0x0

    return-void

    .line 196
    :cond_0
    invoke-virtual {p0, p1, p2, p3, v1}, Lcom/appsflyer/AppsFlyerLib;->logEvent(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;Lcom/appsflyer/attribution/AppsFlyerRequestListener;)V

    return-void
.end method

.method public final logEvent(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;Lcom/appsflyer/attribution/AppsFlyerRequestListener;)V
    .locals 6
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/appsflyer/attribution/AppsFlyerRequestListener;",
            ")V"
        }
    .end annotation

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    const/4 p3, 0x0

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    .line 6
    .line 7
    invoke-direct {v0, p3}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 8
    .line 9
    .line 10
    move-object p3, v0

    .line 11
    :goto_0
    invoke-virtual {p0, p1}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    new-instance v0, Lcom/appsflyer/internal/AFh1kSDK;

    .line 15
    .line 16
    invoke-direct {v0}, Lcom/appsflyer/internal/AFh1kSDK;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p2, v0, Lcom/appsflyer/internal/AFa1mSDK;->component4:Ljava/lang/String;

    .line 20
    .line 21
    iput-object p4, v0, Lcom/appsflyer/internal/AFa1mSDK;->getRevenue:Lcom/appsflyer/attribution/AppsFlyerRequestListener;

    .line 22
    .line 23
    if-eqz p3, :cond_2

    .line 24
    .line 25
    const-string p4, "af_touch_obj"

    .line 26
    .line 27
    invoke-interface {p3, p4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    new-instance v1, Ljava/util/HashMap;

    .line 34
    .line 35
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-interface {p3, p4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    instance-of v3, v2, Landroid/view/MotionEvent;

    .line 43
    .line 44
    if-eqz v3, :cond_1

    .line 45
    .line 46
    check-cast v2, Landroid/view/MotionEvent;

    .line 47
    .line 48
    new-instance v3, Ljava/util/HashMap;

    .line 49
    .line 50
    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v2}, Landroid/view/MotionEvent;->getX()F

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    const-string v5, "x"

    .line 62
    .line 63
    invoke-interface {v3, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v2}, Landroid/view/MotionEvent;->getY()F

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    const-string v5, "y"

    .line 75
    .line 76
    invoke-interface {v3, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    const-string v4, "loc"

    .line 80
    .line 81
    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v2}, Landroid/view/MotionEvent;->getPressure()F

    .line 85
    .line 86
    .line 87
    move-result v3

    .line 88
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    const-string v4, "pf"

    .line 93
    .line 94
    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    invoke-virtual {v2}, Landroid/view/MotionEvent;->getTouchMajor()F

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    const/high16 v3, 0x40000000    # 2.0f

    .line 102
    .line 103
    div-float/2addr v2, v3

    .line 104
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    const-string v3, "rad"

    .line 109
    .line 110
    invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_1
    const-string v2, "error"

    .line 115
    .line 116
    const-string v3, "Parsing failed due to invalid input in \'af_touch_obj\'."

    .line 117
    .line 118
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    sget-object v2, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 122
    .line 123
    sget-object v4, Lcom/appsflyer/internal/AFg1cSDK;->AFInAppEventType:Lcom/appsflyer/internal/AFg1cSDK;

    .line 124
    .line 125
    const/4 v5, 0x1

    .line 126
    invoke-virtual {v2, v4, v3, v5}, Lcom/appsflyer/internal/AFh1ySDK;->w(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;Z)V

    .line 127
    .line 128
    .line 129
    :goto_1
    const-string v2, "tch_data"

    .line 130
    .line 131
    invoke-static {v2, v1}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    invoke-interface {p3, p4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v0, v1}, Lcom/appsflyer/internal/AFa1mSDK;->getMediationNetwork(Ljava/util/Map;)Lcom/appsflyer/internal/AFa1mSDK;

    .line 139
    .line 140
    .line 141
    :cond_2
    iput-object p3, v0, Lcom/appsflyer/internal/AFa1mSDK;->getMonetizationNetwork:Ljava/util/Map;

    .line 142
    .line 143
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 144
    .line 145
    .line 146
    move-result-object p3

    .line 147
    invoke-interface {p3}, Lcom/appsflyer/internal/AFd1fSDK;->copydefault()Lcom/appsflyer/internal/AFb1bSDK;

    .line 148
    .line 149
    .line 150
    move-result-object p3

    .line 151
    new-instance p4, Lorg/json/JSONObject;

    .line 152
    .line 153
    iget-object v1, v0, Lcom/appsflyer/internal/AFa1mSDK;->getMonetizationNetwork:Ljava/util/Map;

    .line 154
    .line 155
    if-nez v1, :cond_3

    .line 156
    .line 157
    new-instance v1, Ljava/util/HashMap;

    .line 158
    .line 159
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 160
    .line 161
    .line 162
    :cond_3
    invoke-direct {p4, v1}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {p4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object p4

    .line 169
    filled-new-array {p2, p4}, [Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object p4

    .line 173
    const-string v1, "logEvent"

    .line 174
    .line 175
    invoke-interface {p3, v1, p4}, Lcom/appsflyer/internal/AFb1bSDK;->getMediationNetwork(Ljava/lang/String;[Ljava/lang/String;)V

    .line 176
    .line 177
    .line 178
    if-nez p2, :cond_4

    .line 179
    .line 180
    sget-object p2, Lcom/appsflyer/internal/AFh1xSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFh1xSDK;

    .line 181
    .line 182
    invoke-direct {p0, p1, p2}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData(Landroid/content/Context;Lcom/appsflyer/internal/AFh1xSDK;)V

    .line 183
    .line 184
    .line 185
    :cond_4
    invoke-direct {p0, p1}, Lcom/appsflyer/internal/AFb1tSDK;->component1(Landroid/content/Context;)Lcom/appsflyer/internal/AFh1sSDK;

    .line 186
    .line 187
    .line 188
    move-result-object p1

    .line 189
    invoke-virtual {p0, v0, p1}, Lcom/appsflyer/internal/AFb1tSDK;->getMonetizationNetwork(Lcom/appsflyer/internal/AFa1mSDK;Lcom/appsflyer/internal/AFh1sSDK;)V

    .line 190
    .line 191
    .line 192
    return-void
.end method

.method public final logLocation(Landroid/content/Context;DD)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1fSDK;->copydefault()Lcom/appsflyer/internal/AFb1bSDK;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {p4, p5}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    filled-new-array {v1, v2}, [Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const-string v2, "logLocation"

    .line 22
    .line 23
    invoke-interface {v0, v2, v1}, Lcom/appsflyer/internal/AFb1bSDK;->getMediationNetwork(Ljava/lang/String;[Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    new-instance v0, Ljava/util/HashMap;

    .line 27
    .line 28
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 29
    .line 30
    .line 31
    const-string v1, "af_long"

    .line 32
    .line 33
    invoke-static {p4, p5}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p4

    .line 37
    invoke-interface {v0, v1, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    const-string p4, "af_lat"

    .line 41
    .line 42
    invoke-static {p2, p3}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    invoke-interface {v0, p4, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    const-string p2, "af_location_coordinates"

    .line 50
    .line 51
    invoke-direct {p0, p1, p2, v0}, Lcom/appsflyer/internal/AFb1tSDK;->getMonetizationNetwork(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;)V

    .line 52
    .line 53
    .line 54
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 55
    .line 56
    add-int/lit8 p0, p0, 0xb

    .line 57
    .line 58
    rem-int/lit16 p0, p0, 0x80

    .line 59
    .line 60
    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 61
    .line 62
    return-void
.end method

.method public final logSession(Landroid/content/Context;)V
    .locals 3

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x51

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1fSDK;->copydefault()Lcom/appsflyer/internal/AFb1bSDK;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const/4 v1, 0x0

    .line 18
    new-array v1, v1, [Ljava/lang/String;

    .line 19
    .line 20
    const-string v2, "logSession"

    .line 21
    .line 22
    invoke-interface {v0, v2, v1}, Lcom/appsflyer/internal/AFb1bSDK;->getMediationNetwork(Ljava/lang/String;[Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1fSDK;->copydefault()Lcom/appsflyer/internal/AFb1bSDK;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-interface {v0}, Lcom/appsflyer/internal/AFb1bSDK;->getMediationNetwork()V

    .line 34
    .line 35
    .line 36
    sget-object v0, Lcom/appsflyer/internal/AFh1xSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFh1xSDK;

    .line 37
    .line 38
    invoke-direct {p0, p1, v0}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData(Landroid/content/Context;Lcom/appsflyer/internal/AFh1xSDK;)V

    .line 39
    .line 40
    .line 41
    const/4 v0, 0x0

    .line 42
    invoke-direct {p0, p1, v0, v0}, Lcom/appsflyer/internal/AFb1tSDK;->getMonetizationNetwork(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;)V

    .line 43
    .line 44
    .line 45
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 46
    .line 47
    add-int/lit8 p0, p0, 0x4b

    .line 48
    .line 49
    rem-int/lit16 p0, p0, 0x80

    .line 50
    .line 51
    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 52
    .line 53
    return-void
.end method

.method public final onPause(Landroid/content/Context;)V
    .locals 0

    .line 1
    sget p1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 2
    .line 3
    add-int/lit8 p1, p1, 0xf

    .line 4
    .line 5
    rem-int/lit16 p1, p1, 0x80

    .line 6
    .line 7
    sput p1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->i()Lcom/appsflyer/internal/AFd1wSDK;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1wSDK;->AFAdRevenueData()V

    .line 18
    .line 19
    .line 20
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 21
    .line 22
    add-int/lit8 p0, p0, 0x17

    .line 23
    .line 24
    rem-int/lit16 p1, p0, 0x80

    .line 25
    .line 26
    sput p1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 27
    .line 28
    rem-int/lit8 p0, p0, 0x2

    .line 29
    .line 30
    if-nez p0, :cond_0

    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    throw p0
.end method

.method public final performOnAppAttribution(Landroid/content/Context;Ljava/net/URI;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/net/URI;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x13

    .line 4
    .line 5
    rem-int/lit16 v1, v0, 0x80

    .line 6
    .line 7
    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 8
    .line 9
    rem-int/lit8 v0, v0, 0x2

    .line 10
    .line 11
    if-eqz v0, :cond_3

    .line 12
    .line 13
    const-string v0, "\""

    .line 14
    .line 15
    if-eqz p2, :cond_2

    .line 16
    .line 17
    add-int/lit8 v1, v1, 0x71

    .line 18
    .line 19
    rem-int/lit16 v1, v1, 0x80

    .line 20
    .line 21
    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 22
    .line 23
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    if-nez p1, :cond_1

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->unregisterClient()Lcom/appsflyer/internal/AFc1sSDK;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    new-instance p2, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    const-string v1, "Context is \""

    .line 47
    .line 48
    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    sget-object p2, Lcom/appsflyer/deeplink/DeepLinkResult$Error;->NETWORK:Lcom/appsflyer/deeplink/DeepLinkResult$Error;

    .line 62
    .line 63
    invoke-virtual {p0, p1, p2}, Lcom/appsflyer/internal/AFc1sSDK;->getCurrencyIso4217Code(Ljava/lang/String;Lcom/appsflyer/deeplink/DeepLinkResult$Error;)V

    .line 64
    .line 65
    .line 66
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 67
    .line 68
    add-int/lit8 p0, p0, 0x29

    .line 69
    .line 70
    rem-int/lit16 p0, p0, 0x80

    .line 71
    .line 72
    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 73
    .line 74
    return-void

    .line 75
    :cond_1
    invoke-virtual {p0, p1}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code(Landroid/content/Context;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1fSDK;->unregisterClient()Lcom/appsflyer/internal/AFc1sSDK;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->w()Lcom/appsflyer/internal/AFc1oSDK;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-static {p0}, Lcom/appsflyer/internal/AFc1kSDK;->getRevenue(Lcom/appsflyer/internal/AFc1oSDK;)Lcom/appsflyer/internal/AFc1kSDK;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p2

    .line 102
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 103
    .line 104
    .line 105
    move-result-object p2

    .line 106
    invoke-virtual {v0, p1, p0, p2}, Lcom/appsflyer/internal/AFc1sSDK;->q_(Landroid/content/Context;Lcom/appsflyer/internal/AFc1kSDK;Landroid/net/Uri;)V

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->unregisterClient()Lcom/appsflyer/internal/AFc1sSDK;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    new-instance p1, Ljava/lang/StringBuilder;

    .line 119
    .line 120
    const-string v1, "Link is \""

    .line 121
    .line 122
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    sget-object p2, Lcom/appsflyer/deeplink/DeepLinkResult$Error;->NETWORK:Lcom/appsflyer/deeplink/DeepLinkResult$Error;

    .line 136
    .line 137
    invoke-virtual {p0, p1, p2}, Lcom/appsflyer/internal/AFc1sSDK;->getCurrencyIso4217Code(Ljava/lang/String;Lcom/appsflyer/deeplink/DeepLinkResult$Error;)V

    .line 138
    .line 139
    .line 140
    return-void

    .line 141
    :cond_3
    const/4 p0, 0x0

    .line 142
    throw p0
.end method

.method public final performOnDeepLinking(Landroid/content/Intent;Landroid/content/Context;)V
    .locals 2
    .param p1    # Landroid/content/Intent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, 0x77

    .line 4
    .line 5
    rem-int/lit16 v1, v1, 0x80

    .line 6
    .line 7
    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 8
    .line 9
    if-nez p1, :cond_2

    .line 10
    .line 11
    add-int/lit8 v0, v0, 0x43

    .line 12
    .line 13
    rem-int/lit16 p1, v0, 0x80

    .line 14
    .line 15
    sput p1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 16
    .line 17
    rem-int/lit8 v0, v0, 0x2

    .line 18
    .line 19
    const-string p1, "performOnDeepLinking was called with null intent"

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->unregisterClient()Lcom/appsflyer/internal/AFc1sSDK;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    sget-object p2, Lcom/appsflyer/deeplink/DeepLinkResult$Error;->DEVELOPER_ERROR:Lcom/appsflyer/deeplink/DeepLinkResult$Error;

    .line 32
    .line 33
    invoke-virtual {p0, p1, p2}, Lcom/appsflyer/internal/AFc1sSDK;->getCurrencyIso4217Code(Ljava/lang/String;Lcom/appsflyer/deeplink/DeepLinkResult$Error;)V

    .line 34
    .line 35
    .line 36
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 37
    .line 38
    add-int/lit8 p0, p0, 0x73

    .line 39
    .line 40
    rem-int/lit16 p1, p0, 0x80

    .line 41
    .line 42
    sput p1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 43
    .line 44
    rem-int/lit8 p0, p0, 0x2

    .line 45
    .line 46
    if-eqz p0, :cond_0

    .line 47
    .line 48
    const/16 p0, 0x30

    .line 49
    .line 50
    div-int/lit8 p0, p0, 0x0

    .line 51
    .line 52
    :cond_0
    return-void

    .line 53
    :cond_1
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->unregisterClient()Lcom/appsflyer/internal/AFc1sSDK;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    sget-object p2, Lcom/appsflyer/deeplink/DeepLinkResult$Error;->DEVELOPER_ERROR:Lcom/appsflyer/deeplink/DeepLinkResult$Error;

    .line 62
    .line 63
    invoke-virtual {p0, p1, p2}, Lcom/appsflyer/internal/AFc1sSDK;->getCurrencyIso4217Code(Ljava/lang/String;Lcom/appsflyer/deeplink/DeepLinkResult$Error;)V

    .line 64
    .line 65
    .line 66
    const/4 p0, 0x0

    .line 67
    throw p0

    .line 68
    :cond_2
    if-nez p2, :cond_3

    .line 69
    .line 70
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->unregisterClient()Lcom/appsflyer/internal/AFc1sSDK;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    const-string p1, "performOnDeepLinking was called with null context"

    .line 79
    .line 80
    sget-object p2, Lcom/appsflyer/deeplink/DeepLinkResult$Error;->DEVELOPER_ERROR:Lcom/appsflyer/deeplink/DeepLinkResult$Error;

    .line 81
    .line 82
    invoke-virtual {p0, p1, p2}, Lcom/appsflyer/internal/AFc1sSDK;->getCurrencyIso4217Code(Ljava/lang/String;Lcom/appsflyer/deeplink/DeepLinkResult$Error;)V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :cond_3
    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    invoke-virtual {p0, p2}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code(Landroid/content/Context;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1fSDK;->AFAdRevenueData()Ljava/util/concurrent/ExecutorService;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    new-instance v1, Lcom/appsflyer/internal/f;

    .line 102
    .line 103
    invoke-direct {v1, p0, p2, p1}, Lcom/appsflyer/internal/f;-><init>(Lcom/appsflyer/internal/AFb1tSDK;Landroid/content/Context;Landroid/content/Intent;)V

    .line 104
    .line 105
    .line 106
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public final registerConversionListener(Landroid/content/Context;Lcom/appsflyer/AppsFlyerConversionListener;)V
    .locals 4

    .line 1
    sget p1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 2
    .line 3
    add-int/lit8 p1, p1, 0x6f

    .line 4
    .line 5
    rem-int/lit16 v0, p1, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 8
    .line 9
    rem-int/lit8 p1, p1, 0x2

    .line 10
    .line 11
    const v0, -0x7e41f0fd

    .line 12
    .line 13
    .line 14
    const v1, 0x7e41f0fd

    .line 15
    .line 16
    .line 17
    const-string v2, "registerConversionListener"

    .line 18
    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-interface {p1}, Lcom/appsflyer/internal/AFd1fSDK;->copydefault()Lcom/appsflyer/internal/AFb1bSDK;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const/4 v3, 0x1

    .line 30
    new-array v3, v3, [Ljava/lang/String;

    .line 31
    .line 32
    invoke-interface {p1, v2, v3}, Lcom/appsflyer/internal/AFb1bSDK;->getMediationNetwork(Ljava/lang/String;[Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    filled-new-array {p0, p2}, [Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    invoke-static {p1, v1, v0, p0}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-interface {p1}, Lcom/appsflyer/internal/AFd1fSDK;->copydefault()Lcom/appsflyer/internal/AFb1bSDK;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    const/4 v3, 0x0

    .line 56
    new-array v3, v3, [Ljava/lang/String;

    .line 57
    .line 58
    invoke-interface {p1, v2, v3}, Lcom/appsflyer/internal/AFb1bSDK;->getMediationNetwork(Ljava/lang/String;[Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    filled-new-array {p0, p2}, [Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    invoke-static {p1, v1, v0, p0}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    :goto_0
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 73
    .line 74
    add-int/lit8 p0, p0, 0x1f

    .line 75
    .line 76
    rem-int/lit16 p0, p0, 0x80

    .line 77
    .line 78
    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 79
    .line 80
    return-void
.end method

.method public final registerValidatorListener(Landroid/content/Context;Lcom/appsflyer/AppsFlyerInAppPurchaseValidatorListener;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->copydefault()Lcom/appsflyer/internal/AFb1bSDK;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 p1, 0x0

    .line 10
    new-array v0, p1, [Ljava/lang/String;

    .line 11
    .line 12
    const-string v1, "registerValidatorListener"

    .line 13
    .line 14
    invoke-interface {p0, v1, v0}, Lcom/appsflyer/internal/AFb1bSDK;->getMediationNetwork(Ljava/lang/String;[Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const-string p0, "registerValidatorListener called"

    .line 18
    .line 19
    invoke-static {p0}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    if-nez p2, :cond_2

    .line 23
    .line 24
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 25
    .line 26
    add-int/lit8 p0, p0, 0x75

    .line 27
    .line 28
    rem-int/lit16 p2, p0, 0x80

    .line 29
    .line 30
    sput p2, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 31
    .line 32
    rem-int/lit8 p0, p0, 0x2

    .line 33
    .line 34
    const-string p2, "registerValidatorListener null listener"

    .line 35
    .line 36
    if-nez p0, :cond_0

    .line 37
    .line 38
    invoke-static {p2}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    const/16 p0, 0xa

    .line 42
    .line 43
    div-int/2addr p0, p1

    .line 44
    goto :goto_0

    .line 45
    :cond_0
    invoke-static {p2}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    :goto_0
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 49
    .line 50
    add-int/lit8 p0, p0, 0x79

    .line 51
    .line 52
    rem-int/lit16 p2, p0, 0x80

    .line 53
    .line 54
    sput p2, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 55
    .line 56
    rem-int/lit8 p0, p0, 0x2

    .line 57
    .line 58
    if-nez p0, :cond_1

    .line 59
    .line 60
    const/16 p0, 0x25

    .line 61
    .line 62
    div-int/2addr p0, p1

    .line 63
    :cond_1
    return-void

    .line 64
    :cond_2
    sput-object p2, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code:Lcom/appsflyer/AppsFlyerInAppPurchaseValidatorListener;

    .line 65
    .line 66
    return-void
.end method

.method public final sendInAppPurchaseData(Landroid/content/Context;Ljava/util/Map;Lcom/appsflyer/PurchaseHandler$PurchaseValidationCallback;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/appsflyer/PurchaseHandler$PurchaseValidationCallback;",
            ")V"
        }
    .end annotation

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x57

    .line 4
    .line 5
    rem-int/lit16 v1, v0, 0x80

    .line 6
    .line 7
    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 8
    .line 9
    rem-int/lit8 v0, v0, 0x2

    .line 10
    .line 11
    const-string v1, "purchases"

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code(Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->areAllFieldsValid()Lcom/appsflyer/PurchaseHandler;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const/4 p1, 0x0

    .line 27
    new-array p1, p1, [Ljava/lang/String;

    .line 28
    .line 29
    const/4 v0, 0x1

    .line 30
    aput-object v1, p1, v0

    .line 31
    .line 32
    invoke-virtual {p0, p2, p3, p1}, Lcom/appsflyer/PurchaseHandler;->getMonetizationNetwork(Ljava/util/Map;Lcom/appsflyer/PurchaseHandler$PurchaseValidationCallback;[Ljava/lang/String;)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    invoke-virtual {p0, p1}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code(Landroid/content/Context;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->areAllFieldsValid()Lcom/appsflyer/PurchaseHandler;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    filled-new-array {v1}, [Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p0, p2, p3, p1}, Lcom/appsflyer/PurchaseHandler;->getMonetizationNetwork(Ljava/util/Map;Lcom/appsflyer/PurchaseHandler$PurchaseValidationCallback;[Ljava/lang/String;)Z

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    if-eqz p1, :cond_1

    .line 59
    .line 60
    :goto_0
    new-instance p1, Lcom/appsflyer/internal/AFf1pSDK;

    .line 61
    .line 62
    iget-object v0, p0, Lcom/appsflyer/PurchaseHandler;->getMonetizationNetwork:Lcom/appsflyer/internal/AFd1fSDK;

    .line 63
    .line 64
    invoke-direct {p1, p2, p3, v0}, Lcom/appsflyer/internal/AFf1pSDK;-><init>(Ljava/util/Map;Lcom/appsflyer/PurchaseHandler$PurchaseValidationCallback;Lcom/appsflyer/internal/AFd1fSDK;)V

    .line 65
    .line 66
    .line 67
    iget-object p0, p0, Lcom/appsflyer/PurchaseHandler;->AFAdRevenueData:Lcom/appsflyer/internal/AFe1aSDK;

    .line 68
    .line 69
    iget-object p2, p0, Lcom/appsflyer/internal/AFe1aSDK;->AFAdRevenueData:Ljava/util/concurrent/Executor;

    .line 70
    .line 71
    new-instance p3, Lcom/appsflyer/internal/AFe1aSDK$5;

    .line 72
    .line 73
    invoke-direct {p3, p0, p1}, Lcom/appsflyer/internal/AFe1aSDK$5;-><init>(Lcom/appsflyer/internal/AFe1aSDK;Lcom/appsflyer/internal/AFf1wSDK;)V

    .line 74
    .line 75
    .line 76
    invoke-interface {p2, p3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 77
    .line 78
    .line 79
    :cond_1
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 80
    .line 81
    add-int/lit8 p0, p0, 0x61

    .line 82
    .line 83
    rem-int/lit16 p1, p0, 0x80

    .line 84
    .line 85
    sput p1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 86
    .line 87
    rem-int/lit8 p0, p0, 0x2

    .line 88
    .line 89
    if-eqz p0, :cond_2

    .line 90
    .line 91
    return-void

    .line 92
    :cond_2
    const/4 p0, 0x0

    .line 93
    throw p0
.end method

.method public final sendPurchaseData(Landroid/content/Context;Ljava/util/Map;Lcom/appsflyer/PurchaseHandler$PurchaseValidationCallback;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/appsflyer/PurchaseHandler$PurchaseValidationCallback;",
            ")V"
        }
    .end annotation

    .line 1
    filled-new-array {p0, p1, p2, p3}, [Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const p2, -0x67f14fa5

    .line 10
    .line 11
    .line 12
    const p3, 0x67f14faf

    .line 13
    .line 14
    .line 15
    invoke-static {p1, p2, p3, p0}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final sendPushNotificationData(Landroid/app/Activity;)V
    .locals 18
    .param p1    # Landroid/app/Activity;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const-string v0, "c"

    .line 4
    .line 5
    const-string v2, "pid"

    .line 6
    .line 7
    const-string v3, "sendPushNotificationData"

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    sget v4, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 12
    .line 13
    add-int/lit8 v4, v4, 0x69

    .line 14
    .line 15
    rem-int/lit16 v4, v4, 0x80

    .line 16
    .line 17
    sput v4, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 18
    .line 19
    invoke-virtual/range {p1 .. p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    if-eqz v4, :cond_0

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    invoke-interface {v4}, Lcom/appsflyer/internal/AFd1fSDK;->copydefault()Lcom/appsflyer/internal/AFb1bSDK;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    invoke-virtual/range {p1 .. p1}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    new-instance v6, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    const-string v7, "activity_intent_"

    .line 40
    .line 41
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual/range {p1 .. p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 45
    .line 46
    .line 47
    move-result-object v7

    .line 48
    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v7

    .line 52
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v6

    .line 59
    filled-new-array {v5, v6}, [Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v5

    .line 63
    invoke-interface {v4, v3, v5}, Lcom/appsflyer/internal/AFb1bSDK;->getMediationNetwork(Ljava/lang/String;[Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_0
    if-eqz p1, :cond_1

    .line 68
    .line 69
    invoke-virtual {v1}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    invoke-interface {v4}, Lcom/appsflyer/internal/AFd1fSDK;->copydefault()Lcom/appsflyer/internal/AFb1bSDK;

    .line 74
    .line 75
    .line 76
    move-result-object v4

    .line 77
    invoke-virtual/range {p1 .. p1}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v5

    .line 81
    const-string v6, "activity_intent_null"

    .line 82
    .line 83
    filled-new-array {v5, v6}, [Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v5

    .line 87
    invoke-interface {v4, v3, v5}, Lcom/appsflyer/internal/AFb1bSDK;->getMediationNetwork(Ljava/lang/String;[Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_1
    invoke-virtual {v1}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 92
    .line 93
    .line 94
    move-result-object v4

    .line 95
    invoke-interface {v4}, Lcom/appsflyer/internal/AFd1fSDK;->copydefault()Lcom/appsflyer/internal/AFb1bSDK;

    .line 96
    .line 97
    .line 98
    move-result-object v4

    .line 99
    const-string v5, "activity_null"

    .line 100
    .line 101
    filled-new-array {v5}, [Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v5

    .line 105
    invoke-interface {v4, v3, v5}, Lcom/appsflyer/internal/AFb1bSDK;->getMediationNetwork(Ljava/lang/String;[Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    :goto_0
    invoke-virtual {v1}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    invoke-interface {v3}, Lcom/appsflyer/internal/AFd1fSDK;->e()Lcom/appsflyer/internal/AFd1mSDK;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    invoke-static/range {p1 .. p1}, Lcom/appsflyer/internal/AFb1tSDK;->getMonetizationNetwork(Landroid/app/Activity;)Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v4

    .line 120
    iput-object v4, v3, Lcom/appsflyer/internal/AFd1mSDK;->AFAdRevenueData:Ljava/lang/String;

    .line 121
    .line 122
    if-eqz v4, :cond_8

    .line 123
    .line 124
    sget v4, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 125
    .line 126
    add-int/lit8 v4, v4, 0x61

    .line 127
    .line 128
    rem-int/lit16 v4, v4, 0x80

    .line 129
    .line 130
    sput v4, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 131
    .line 132
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 133
    .line 134
    .line 135
    move-result-wide v4

    .line 136
    iget-object v6, v1, Lcom/appsflyer/internal/AFb1tSDK;->component3:Ljava/util/Map;

    .line 137
    .line 138
    const-string v7, ")"

    .line 139
    .line 140
    if-nez v6, :cond_2

    .line 141
    .line 142
    const-string v0, "pushes: initializing pushes history.."

    .line 143
    .line 144
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 148
    .line 149
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 150
    .line 151
    .line 152
    iput-object v0, v1, Lcom/appsflyer/internal/AFb1tSDK;->component3:Ljava/util/Map;

    .line 153
    .line 154
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 155
    .line 156
    add-int/lit8 v0, v0, 0x39

    .line 157
    .line 158
    rem-int/lit16 v0, v0, 0x80

    .line 159
    .line 160
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 161
    .line 162
    move-wide v10, v4

    .line 163
    move-wide/from16 v16, v10

    .line 164
    .line 165
    goto/16 :goto_3

    .line 166
    .line 167
    :cond_2
    :try_start_0
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    .line 168
    .line 169
    .line 170
    move-result-object v6

    .line 171
    const-string v8, "pushPayloadMaxAging"

    .line 172
    .line 173
    const-wide/32 v9, 0x1b7740

    .line 174
    .line 175
    .line 176
    invoke-virtual {v6, v8, v9, v10}, Lcom/appsflyer/AppsFlyerProperties;->getLong(Ljava/lang/String;J)J

    .line 177
    .line 178
    .line 179
    move-result-wide v8

    .line 180
    iget-object v6, v1, Lcom/appsflyer/internal/AFb1tSDK;->component3:Ljava/util/Map;

    .line 181
    .line 182
    invoke-interface {v6}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 183
    .line 184
    .line 185
    move-result-object v6

    .line 186
    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 187
    .line 188
    .line 189
    move-result-object v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 190
    move-wide v10, v4

    .line 191
    :goto_1
    :try_start_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 192
    .line 193
    .line 194
    move-result v12

    .line 195
    if-eqz v12, :cond_6

    .line 196
    .line 197
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 198
    .line 199
    .line 200
    move-result-object v12

    .line 201
    check-cast v12, Ljava/lang/Long;

    .line 202
    .line 203
    new-instance v13, Lorg/json/JSONObject;

    .line 204
    .line 205
    iget-object v14, v3, Lcom/appsflyer/internal/AFd1mSDK;->AFAdRevenueData:Ljava/lang/String;

    .line 206
    .line 207
    invoke-direct {v13, v14}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    new-instance v14, Lorg/json/JSONObject;

    .line 211
    .line 212
    iget-object v15, v1, Lcom/appsflyer/internal/AFb1tSDK;->component3:Ljava/util/Map;

    .line 213
    .line 214
    invoke-interface {v15, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 215
    .line 216
    .line 217
    move-result-object v15

    .line 218
    check-cast v15, Ljava/lang/String;

    .line 219
    .line 220
    invoke-direct {v14, v15}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 221
    .line 222
    .line 223
    invoke-virtual {v13, v2}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    .line 224
    .line 225
    .line 226
    move-result-object v15
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 227
    move-wide/from16 v16, v4

    .line 228
    .line 229
    :try_start_2
    invoke-virtual {v14, v2}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    .line 230
    .line 231
    .line 232
    move-result-object v4

    .line 233
    invoke-virtual {v15, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 234
    .line 235
    .line 236
    move-result v4

    .line 237
    if-eqz v4, :cond_3

    .line 238
    .line 239
    invoke-virtual {v13, v0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    .line 240
    .line 241
    .line 242
    move-result-object v4

    .line 243
    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    .line 244
    .line 245
    .line 246
    move-result-object v5

    .line 247
    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 248
    .line 249
    .line 250
    move-result v4

    .line 251
    if-eqz v4, :cond_3

    .line 252
    .line 253
    new-instance v0, Ljava/lang/StringBuilder;

    .line 254
    .line 255
    const-string v2, "PushNotificationMeasurement: A previous payload with same PID and campaign was already acknowledged! (old: "

    .line 256
    .line 257
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 258
    .line 259
    .line 260
    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 261
    .line 262
    .line 263
    const-string v2, ", new: "

    .line 264
    .line 265
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 266
    .line 267
    .line 268
    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 269
    .line 270
    .line 271
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 272
    .line 273
    .line 274
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object v0

    .line 278
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 279
    .line 280
    .line 281
    const/4 v0, 0x0

    .line 282
    iput-object v0, v3, Lcom/appsflyer/internal/AFd1mSDK;->AFAdRevenueData:Ljava/lang/String;

    .line 283
    .line 284
    return-void

    .line 285
    :catchall_0
    move-exception v0

    .line 286
    goto :goto_2

    .line 287
    :cond_3
    invoke-virtual {v12}, Ljava/lang/Number;->longValue()J

    .line 288
    .line 289
    .line 290
    move-result-wide v4

    .line 291
    sub-long v4, v16, v4

    .line 292
    .line 293
    cmp-long v4, v4, v8

    .line 294
    .line 295
    if-lez v4, :cond_4

    .line 296
    .line 297
    iget-object v4, v1, Lcom/appsflyer/internal/AFb1tSDK;->component3:Ljava/util/Map;

    .line 298
    .line 299
    invoke-interface {v4, v12}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 300
    .line 301
    .line 302
    :cond_4
    invoke-virtual {v12}, Ljava/lang/Number;->longValue()J

    .line 303
    .line 304
    .line 305
    move-result-wide v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 306
    cmp-long v4, v4, v10

    .line 307
    .line 308
    if-gtz v4, :cond_5

    .line 309
    .line 310
    sget v4, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 311
    .line 312
    add-int/lit8 v4, v4, 0x65

    .line 313
    .line 314
    rem-int/lit16 v4, v4, 0x80

    .line 315
    .line 316
    sput v4, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 317
    .line 318
    :try_start_3
    invoke-virtual {v12}, Ljava/lang/Number;->longValue()J

    .line 319
    .line 320
    .line 321
    move-result-wide v10
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 322
    sget v4, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 323
    .line 324
    add-int/lit8 v4, v4, 0x7

    .line 325
    .line 326
    rem-int/lit16 v4, v4, 0x80

    .line 327
    .line 328
    sput v4, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 329
    .line 330
    :cond_5
    move-wide/from16 v4, v16

    .line 331
    .line 332
    goto/16 :goto_1

    .line 333
    .line 334
    :catchall_1
    move-exception v0

    .line 335
    move-wide/from16 v16, v4

    .line 336
    .line 337
    goto :goto_2

    .line 338
    :cond_6
    move-wide/from16 v16, v4

    .line 339
    .line 340
    goto :goto_3

    .line 341
    :catchall_2
    move-exception v0

    .line 342
    move-wide/from16 v16, v4

    .line 343
    .line 344
    move-wide/from16 v10, v16

    .line 345
    .line 346
    :goto_2
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 347
    .line 348
    .line 349
    move-result-object v2

    .line 350
    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 351
    .line 352
    .line 353
    move-result-object v2

    .line 354
    const-string v4, "Error while handling push notification measurement: "

    .line 355
    .line 356
    invoke-virtual {v4, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 357
    .line 358
    .line 359
    move-result-object v2

    .line 360
    invoke-static {v2, v0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 361
    .line 362
    .line 363
    :goto_3
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    .line 364
    .line 365
    .line 366
    move-result-object v0

    .line 367
    const-string v2, "pushPayloadHistorySize"

    .line 368
    .line 369
    const/4 v4, 0x2

    .line 370
    invoke-virtual {v0, v2, v4}, Lcom/appsflyer/AppsFlyerProperties;->getInt(Ljava/lang/String;I)I

    .line 371
    .line 372
    .line 373
    move-result v0

    .line 374
    iget-object v2, v1, Lcom/appsflyer/internal/AFb1tSDK;->component3:Ljava/util/Map;

    .line 375
    .line 376
    invoke-interface {v2}, Ljava/util/Map;->size()I

    .line 377
    .line 378
    .line 379
    move-result v2

    .line 380
    if-ne v2, v0, :cond_7

    .line 381
    .line 382
    new-instance v0, Ljava/lang/StringBuilder;

    .line 383
    .line 384
    const-string v2, "pushes: removing oldest overflowing push (oldest push:"

    .line 385
    .line 386
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 387
    .line 388
    .line 389
    invoke-virtual {v0, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 390
    .line 391
    .line 392
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 393
    .line 394
    .line 395
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 396
    .line 397
    .line 398
    move-result-object v0

    .line 399
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 400
    .line 401
    .line 402
    iget-object v0, v1, Lcom/appsflyer/internal/AFb1tSDK;->component3:Ljava/util/Map;

    .line 403
    .line 404
    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 405
    .line 406
    .line 407
    move-result-object v2

    .line 408
    invoke-interface {v0, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 409
    .line 410
    .line 411
    :cond_7
    iget-object v0, v1, Lcom/appsflyer/internal/AFb1tSDK;->component3:Ljava/util/Map;

    .line 412
    .line 413
    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 414
    .line 415
    .line 416
    move-result-object v2

    .line 417
    iget-object v3, v3, Lcom/appsflyer/internal/AFd1mSDK;->AFAdRevenueData:Ljava/lang/String;

    .line 418
    .line 419
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 420
    .line 421
    .line 422
    invoke-virtual/range {p0 .. p1}, Lcom/appsflyer/AppsFlyerLib;->start(Landroid/content/Context;)V

    .line 423
    .line 424
    .line 425
    :cond_8
    return-void
.end method

.method public final setAdditionalData(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x69

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->copydefault()Lcom/appsflyer/internal/AFb1bSDK;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    filled-new-array {v0}, [Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "setAdditionalData"

    .line 28
    .line 29
    invoke-interface {p0, v1, v0}, Lcom/appsflyer/internal/AFb1bSDK;->getMediationNetwork(Ljava/lang/String;[Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    new-instance p0, Lorg/json/JSONObject;

    .line 33
    .line 34
    invoke-direct {p0, p1}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 35
    .line 36
    .line 37
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p1, p0}, Lcom/appsflyer/AppsFlyerProperties;->setCustomData(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 49
    .line 50
    add-int/lit8 p0, p0, 0x75

    .line 51
    .line 52
    rem-int/lit16 p0, p0, 0x80

    .line 53
    .line 54
    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 55
    .line 56
    :cond_0
    return-void
.end method

.method public final setAndroidIdData(Ljava/lang/String;)V
    .locals 3

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x75

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1fSDK;->copydefault()Lcom/appsflyer/internal/AFb1bSDK;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "setAndroidIdData"

    .line 18
    .line 19
    filled-new-array {p1}, [Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-interface {v0, v1, v2}, Lcom/appsflyer/internal/AFb1bSDK;->getMediationNetwork(Ljava/lang/String;[Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->e()Lcom/appsflyer/internal/AFd1mSDK;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    iput-object p1, p0, Lcom/appsflyer/internal/AFd1mSDK;->getRevenue:Ljava/lang/String;

    .line 35
    .line 36
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 37
    .line 38
    add-int/lit8 p0, p0, 0x1d

    .line 39
    .line 40
    rem-int/lit16 p1, p0, 0x80

    .line 41
    .line 42
    sput p1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 43
    .line 44
    rem-int/lit8 p0, p0, 0x2

    .line 45
    .line 46
    if-nez p0, :cond_0

    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    const/4 p0, 0x0

    .line 50
    throw p0
.end method

.method public final setAppId(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x49

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->copydefault()Lcom/appsflyer/internal/AFb1bSDK;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v0, "setAppId"

    .line 18
    .line 19
    filled-new-array {p1}, [Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-interface {p0, v0, v1}, Lcom/appsflyer/internal/AFb1bSDK;->getMediationNetwork(Ljava/lang/String;[Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const-string p0, "appid"

    .line 27
    .line 28
    invoke-static {p0, p1}, Lcom/appsflyer/internal/AFb1tSDK;->getRevenue(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 32
    .line 33
    add-int/lit8 p0, p0, 0x6f

    .line 34
    .line 35
    rem-int/lit16 p0, p0, 0x80

    .line 36
    .line 37
    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 38
    .line 39
    return-void
.end method

.method public final setAppInviteOneLink(Ljava/lang/String;)V
    .locals 2

    .line 1
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const v0, 0x560e4983

    .line 10
    .line 11
    .line 12
    const v1, -0x560e497a

    .line 13
    .line 14
    .line 15
    invoke-static {p1, v0, v1, p0}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final setCollectAndroidID(Z)V
    .locals 2

    .line 1
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    const v0, 0x72c312c7

    .line 14
    .line 15
    .line 16
    const v1, -0x72c312c4

    .line 17
    .line 18
    .line 19
    invoke-static {p1, v0, v1, p0}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final setCollectIMEI(Z)V
    .locals 2

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x4f

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->copydefault()Lcom/appsflyer/internal/AFb1bSDK;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    filled-new-array {v0}, [Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "setCollectIMEI"

    .line 26
    .line 27
    invoke-interface {p0, v1, v0}, Lcom/appsflyer/internal/AFb1bSDK;->getMediationNetwork(Ljava/lang/String;[Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    const-string p0, "collectIMEI"

    .line 31
    .line 32
    invoke-static {p1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {p0, v0}, Lcom/appsflyer/internal/AFb1tSDK;->getRevenue(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    const-string p0, "collectIMEIForceByUser"

    .line 40
    .line 41
    invoke-static {p1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-static {p0, p1}, Lcom/appsflyer/internal/AFb1tSDK;->getRevenue(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 49
    .line 50
    add-int/lit8 p0, p0, 0xf

    .line 51
    .line 52
    rem-int/lit16 p1, p0, 0x80

    .line 53
    .line 54
    sput p1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 55
    .line 56
    rem-int/lit8 p0, p0, 0x2

    .line 57
    .line 58
    if-nez p0, :cond_0

    .line 59
    .line 60
    const/16 p0, 0x10

    .line 61
    .line 62
    div-int/lit8 p0, p0, 0x0

    .line 63
    .line 64
    :cond_0
    return-void
.end method

.method public final setCollectOaid(Z)V
    .locals 5
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x19

    .line 4
    .line 5
    rem-int/lit16 v1, v0, 0x80

    .line 6
    .line 7
    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 8
    .line 9
    rem-int/lit8 v0, v0, 0x2

    .line 10
    .line 11
    const-string v1, "collectOAID"

    .line 12
    .line 13
    const-string v2, "setCollectOaid"

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->copydefault()Lcom/appsflyer/internal/AFb1bSDK;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const/4 v0, 0x0

    .line 26
    new-array v0, v0, [Ljava/lang/String;

    .line 27
    .line 28
    const/4 v3, 0x1

    .line 29
    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    aput-object v4, v0, v3

    .line 34
    .line 35
    invoke-interface {p0, v2, v0}, Lcom/appsflyer/internal/AFb1bSDK;->getMediationNetwork(Ljava/lang/String;[Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    :goto_0
    invoke-static {p1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-static {v1, p0}, Lcom/appsflyer/internal/AFb1tSDK;->getRevenue(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_0
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->copydefault()Lcom/appsflyer/internal/AFb1bSDK;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    filled-new-array {v0}, [Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-interface {p0, v2, v0}, Lcom/appsflyer/internal/AFb1bSDK;->getMediationNetwork(Ljava/lang/String;[Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    goto :goto_0
.end method

.method public final setConsentData(Lcom/appsflyer/AppsFlyerConsent;)V
    .locals 1
    .param p1    # Lcom/appsflyer/AppsFlyerConsent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x49

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 8
    .line 9
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->e()Lcom/appsflyer/internal/AFd1mSDK;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    iput-object p1, p0, Lcom/appsflyer/internal/AFd1mSDK;->component2:Lcom/appsflyer/AppsFlyerConsent;

    .line 21
    .line 22
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 23
    .line 24
    add-int/lit8 p0, p0, 0xb

    .line 25
    .line 26
    rem-int/lit16 p1, p0, 0x80

    .line 27
    .line 28
    sput p1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 29
    .line 30
    rem-int/lit8 p0, p0, 0x2

    .line 31
    .line 32
    if-nez p0, :cond_0

    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    const/4 p0, 0x0

    .line 36
    throw p0
.end method

.method public final setCurrencyCode(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x4f

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->copydefault()Lcom/appsflyer/internal/AFb1bSDK;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v0, "setCurrencyCode"

    .line 18
    .line 19
    filled-new-array {p1}, [Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-interface {p0, v0, v1}, Lcom/appsflyer/internal/AFb1bSDK;->getMediationNetwork(Ljava/lang/String;[Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string v0, "currencyCode"

    .line 31
    .line 32
    invoke-virtual {p0, v0, p1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 36
    .line 37
    add-int/lit8 p0, p0, 0x3

    .line 38
    .line 39
    rem-int/lit16 p0, p0, 0x80

    .line 40
    .line 41
    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 42
    .line 43
    return-void
.end method

.method public final setCustomerIdAndLogSession(Ljava/lang/String;Landroid/content/Context;)V
    .locals 3
    .param p2    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    if-eqz p2, :cond_4

    .line 2
    .line 3
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 4
    .line 5
    add-int/lit8 v0, v0, 0x37

    .line 6
    .line 7
    rem-int/lit16 v0, v0, 0x80

    .line 8
    .line 9
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x1

    .line 16
    if-eqz v0, :cond_3

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lcom/appsflyer/AppsFlyerLib;->setCustomerUserId(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    const-string v2, "CustomerUserId set: "

    .line 24
    .line 25
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string p1, " - Initializing AppsFlyer Tacking"

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-static {p1, v1}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;Z)V

    .line 41
    .line 42
    .line 43
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1fSDK;->getRevenue()Lcom/appsflyer/internal/AFd1rSDK;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p1, v0}, Lcom/appsflyer/AppsFlyerProperties;->getReferrer(Lcom/appsflyer/internal/AFd1rSDK;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    sget-object v0, Lcom/appsflyer/internal/AFh1xSDK;->getRevenue:Lcom/appsflyer/internal/AFh1xSDK;

    .line 60
    .line 61
    invoke-direct {p0, p2, v0}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData(Landroid/content/Context;Lcom/appsflyer/internal/AFh1xSDK;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1fSDK;->AFKeystoreWrapper()Lcom/appsflyer/internal/AFg1rSDK;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iget-object v0, v0, Lcom/appsflyer/internal/AFg1rSDK;->component1:Ljava/lang/String;

    .line 73
    .line 74
    if-nez p1, :cond_1

    .line 75
    .line 76
    sget p1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 77
    .line 78
    add-int/lit8 p1, p1, 0x43

    .line 79
    .line 80
    rem-int/lit16 v0, p1, 0x80

    .line 81
    .line 82
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 83
    .line 84
    rem-int/lit8 p1, p1, 0x2

    .line 85
    .line 86
    if-eqz p1, :cond_0

    .line 87
    .line 88
    const-string p1, ""

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_0
    const/4 p0, 0x0

    .line 92
    throw p0

    .line 93
    :cond_1
    :goto_0
    instance-of v0, p2, Landroid/app/Activity;

    .line 94
    .line 95
    if-eqz v0, :cond_2

    .line 96
    .line 97
    move-object v0, p2

    .line 98
    check-cast v0, Landroid/app/Activity;

    .line 99
    .line 100
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 101
    .line 102
    .line 103
    :cond_2
    filled-new-array {p0, p2, p1}, [Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 108
    .line 109
    .line 110
    move-result p0

    .line 111
    const p2, 0x7c4e35c3

    .line 112
    .line 113
    .line 114
    const v0, -0x7c4e35ac

    .line 115
    .line 116
    .line 117
    invoke-static {p1, p2, v0, p0}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :cond_3
    invoke-virtual {p0, p1}, Lcom/appsflyer/AppsFlyerLib;->setCustomerUserId(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    const-string p0, "waitForCustomerUserId is false; setting CustomerUserID: "

    .line 125
    .line 126
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-static {p0, v1}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;Z)V

    .line 135
    .line 136
    .line 137
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 138
    .line 139
    add-int/lit8 p0, p0, 0x33

    .line 140
    .line 141
    rem-int/lit16 p0, p0, 0x80

    .line 142
    .line 143
    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 144
    .line 145
    :cond_4
    return-void
.end method

.method public final setCustomerUserId(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x19

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->copydefault()Lcom/appsflyer/internal/AFb1bSDK;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v0, "setCustomerUserId"

    .line 18
    .line 19
    filled-new-array {p1}, [Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-interface {p0, v0, v1}, Lcom/appsflyer/internal/AFb1bSDK;->getMediationNetwork(Ljava/lang/String;[Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const-string p0, "setCustomerUserId = "

    .line 27
    .line 28
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {p0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    const-string p0, "AppUserId"

    .line 40
    .line 41
    invoke-static {p0, p1}, Lcom/appsflyer/internal/AFb1tSDK;->getRevenue(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    const-string p0, "waitForCustomerId"

    .line 45
    .line 46
    const/4 p1, 0x0

    .line 47
    invoke-static {p0, p1}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code(Ljava/lang/String;Z)V

    .line 48
    .line 49
    .line 50
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 51
    .line 52
    add-int/lit8 p0, p0, 0x4b

    .line 53
    .line 54
    rem-int/lit16 p1, p0, 0x80

    .line 55
    .line 56
    sput p1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 57
    .line 58
    rem-int/lit8 p0, p0, 0x2

    .line 59
    .line 60
    if-nez p0, :cond_0

    .line 61
    .line 62
    return-void

    .line 63
    :cond_0
    const/4 p0, 0x0

    .line 64
    throw p0
.end method

.method public final setDebugLog(Z)V
    .locals 1

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x61

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    sget-object p1, Lcom/appsflyer/AFLogger$LogLevel;->DEBUG:Lcom/appsflyer/AFLogger$LogLevel;

    .line 12
    .line 13
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 14
    .line 15
    add-int/lit8 v0, v0, 0x5d

    .line 16
    .line 17
    rem-int/lit16 v0, v0, 0x80

    .line 18
    .line 19
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    sget-object p1, Lcom/appsflyer/AFLogger$LogLevel;->NONE:Lcom/appsflyer/AFLogger$LogLevel;

    .line 23
    .line 24
    :goto_0
    invoke-virtual {p0, p1}, Lcom/appsflyer/AppsFlyerLib;->setLogLevel(Lcom/appsflyer/AFLogger$LogLevel;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final setDisableAdvertisingIdentifiers(Z)V
    .locals 3

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x39

    .line 4
    .line 5
    rem-int/lit16 v1, v0, 0x80

    .line 6
    .line 7
    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 8
    .line 9
    rem-int/lit8 v0, v0, 0x2

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    const-string v2, "setDisableAdvertisingIdentifiers: "

    .line 13
    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    const/4 v0, 0x1

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 32
    .line 33
    add-int/lit8 v0, v0, 0x67

    .line 34
    .line 35
    rem-int/lit16 v0, v0, 0x80

    .line 36
    .line 37
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 38
    .line 39
    const/4 v0, 0x0

    .line 40
    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    sput-object v0, Lcom/appsflyer/internal/AFb1rSDK;->AFAdRevenueData:Ljava/lang/Boolean;

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1fSDK;->e()Lcom/appsflyer/internal/AFd1mSDK;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    iput-boolean p1, v2, Lcom/appsflyer/internal/AFd1mSDK;->component3:Z

    .line 55
    .line 56
    if-eqz p1, :cond_1

    .line 57
    .line 58
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 59
    .line 60
    add-int/lit8 p0, p0, 0x43

    .line 61
    .line 62
    rem-int/lit16 p0, p0, 0x80

    .line 63
    .line 64
    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 65
    .line 66
    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1fSDK;->e()Lcom/appsflyer/internal/AFd1mSDK;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    iput-object v1, p0, Lcom/appsflyer/internal/AFd1mSDK;->component4:Lcom/appsflyer/internal/AFh1pSDK;

    .line 71
    .line 72
    return-void

    .line 73
    :cond_1
    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1fSDK;->copy()Lcom/appsflyer/internal/AFe1aSDK;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    new-instance v0, Lcom/appsflyer/internal/AFf1mSDK;

    .line 78
    .line 79
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-direct {v0, p0}, Lcom/appsflyer/internal/AFf1mSDK;-><init>(Lcom/appsflyer/internal/AFd1fSDK;)V

    .line 84
    .line 85
    .line 86
    iget-object p0, p1, Lcom/appsflyer/internal/AFe1aSDK;->AFAdRevenueData:Ljava/util/concurrent/Executor;

    .line 87
    .line 88
    new-instance v1, Lcom/appsflyer/internal/AFe1aSDK$5;

    .line 89
    .line 90
    invoke-direct {v1, p1, v0}, Lcom/appsflyer/internal/AFe1aSDK$5;-><init>(Lcom/appsflyer/internal/AFe1aSDK;Lcom/appsflyer/internal/AFf1wSDK;)V

    .line 91
    .line 92
    .line 93
    invoke-interface {p0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_2
    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-virtual {v2, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-static {p0}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    throw v1
.end method

.method public final setDisableNetworkData(Z)V
    .locals 2

    .line 1
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    const v0, 0x7fb27bdd

    .line 14
    .line 15
    .line 16
    const v1, -0x7fb27bcd

    .line 17
    .line 18
    .line 19
    invoke-static {p1, v0, v1, p0}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final setExtension(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x29

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->copydefault()Lcom/appsflyer/internal/AFb1bSDK;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v0, "setExtension"

    .line 18
    .line 19
    filled-new-array {p1}, [Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-interface {p0, v0, v1}, Lcom/appsflyer/internal/AFb1bSDK;->getMediationNetwork(Ljava/lang/String;[Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string v0, "sdkExtension"

    .line 31
    .line 32
    invoke-virtual {p0, v0, p1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 36
    .line 37
    add-int/lit8 p0, p0, 0x33

    .line 38
    .line 39
    rem-int/lit16 p0, p0, 0x80

    .line 40
    .line 41
    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 42
    .line 43
    return-void
.end method

.method public final setHost(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    filled-new-array {p0, p1, p2}, [Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const p2, -0x75812b98

    .line 10
    .line 11
    .line 12
    const v0, 0x75812bab

    .line 13
    .line 14
    .line 15
    invoke-static {p1, p2, v0, p0}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final setImeiData(Ljava/lang/String;)V
    .locals 2

    .line 1
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const v0, -0x3372f25f    # -7.395252E7f

    .line 10
    .line 11
    .line 12
    const v1, 0x3372f263

    .line 13
    .line 14
    .line 15
    invoke-static {p1, v0, v1, p0}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final setIsUpdate(Z)V
    .locals 2

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x5

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->copydefault()Lcom/appsflyer/internal/AFb1bSDK;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    filled-new-array {v0}, [Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "setIsUpdate"

    .line 26
    .line 27
    invoke-interface {p0, v1, v0}, Lcom/appsflyer/internal/AFb1bSDK;->getMediationNetwork(Ljava/lang/String;[Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-string v0, "IS_UPDATE"

    .line 35
    .line 36
    invoke-virtual {p0, v0, p1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Z)V

    .line 37
    .line 38
    .line 39
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 40
    .line 41
    add-int/lit8 p0, p0, 0x3b

    .line 42
    .line 43
    rem-int/lit16 p1, p0, 0x80

    .line 44
    .line 45
    sput p1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 46
    .line 47
    rem-int/lit8 p0, p0, 0x2

    .line 48
    .line 49
    if-eqz p0, :cond_0

    .line 50
    .line 51
    const/16 p0, 0x5a

    .line 52
    .line 53
    div-int/lit8 p0, p0, 0x0

    .line 54
    .line 55
    :cond_0
    return-void
.end method

.method public final setLogLevel(Lcom/appsflyer/AFLogger$LogLevel;)V
    .locals 4
    .param p1    # Lcom/appsflyer/AFLogger$LogLevel;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x2f

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/appsflyer/AFLogger$LogLevel;->getLevel()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    sget-object v1, Lcom/appsflyer/AFLogger$LogLevel;->NONE:Lcom/appsflyer/AFLogger$LogLevel;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/appsflyer/AFLogger$LogLevel;->getLevel()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const/4 v2, 0x0

    .line 20
    if-le v0, v1, :cond_1

    .line 21
    .line 22
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 23
    .line 24
    add-int/lit8 v0, v0, 0x13

    .line 25
    .line 26
    rem-int/lit16 v1, v0, 0x80

    .line 27
    .line 28
    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 29
    .line 30
    rem-int/lit8 v0, v0, 0x2

    .line 31
    .line 32
    if-nez v0, :cond_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/4 v2, 0x1

    .line 36
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1fSDK;->copydefault()Lcom/appsflyer/internal/AFb1bSDK;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    filled-new-array {v1}, [Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    const-string v3, "log"

    .line 53
    .line 54
    invoke-interface {v0, v3, v1}, Lcom/appsflyer/internal/AFb1bSDK;->getMediationNetwork(Ljava/lang/String;[Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    const-string v1, "logLevel"

    .line 62
    .line 63
    invoke-virtual {p1}, Lcom/appsflyer/AFLogger$LogLevel;->getLevel()I

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    invoke-virtual {v0, v1, p1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;I)V

    .line 68
    .line 69
    .line 70
    if-nez v2, :cond_2

    .line 71
    .line 72
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->v()Lcom/appsflyer/internal/AFh1vSDK;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-interface {p0}, Lcom/appsflyer/internal/AFh1vSDK;->getMediationNetwork()V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_2
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->v()Lcom/appsflyer/internal/AFh1vSDK;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-interface {p0}, Lcom/appsflyer/internal/AFh1vSDK;->component1()V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public final setMinTimeBetweenSessions(I)V
    .locals 4

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x67

    .line 4
    .line 5
    rem-int/lit16 v1, v0, 0x80

    .line 6
    .line 7
    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 8
    .line 9
    rem-int/lit8 v0, v0, 0x2

    .line 10
    .line 11
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    int-to-long v2, p1

    .line 16
    invoke-virtual {v1, v2, v3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    .line 17
    .line 18
    .line 19
    move-result-wide v0

    .line 20
    iput-wide v0, p0, Lcom/appsflyer/internal/AFb1tSDK;->component4:J

    .line 21
    .line 22
    const/16 p0, 0xa

    .line 23
    .line 24
    div-int/lit8 p0, p0, 0x0

    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    int-to-long v2, p1

    .line 28
    invoke-virtual {v1, v2, v3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    .line 29
    .line 30
    .line 31
    move-result-wide v0

    .line 32
    iput-wide v0, p0, Lcom/appsflyer/internal/AFb1tSDK;->component4:J

    .line 33
    .line 34
    return-void
.end method

.method public final setOaidData(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x2b

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->copydefault()Lcom/appsflyer/internal/AFb1bSDK;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v0, "setOaidData"

    .line 18
    .line 19
    filled-new-array {p1}, [Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-interface {p0, v0, v1}, Lcom/appsflyer/internal/AFb1bSDK;->getMediationNetwork(Ljava/lang/String;[Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    sput-object p1, Lcom/appsflyer/internal/AFb1rSDK;->getMonetizationNetwork:Ljava/lang/String;

    .line 27
    .line 28
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 29
    .line 30
    add-int/lit8 p0, p0, 0x45

    .line 31
    .line 32
    rem-int/lit16 p1, p0, 0x80

    .line 33
    .line 34
    sput p1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 35
    .line 36
    rem-int/lit8 p0, p0, 0x2

    .line 37
    .line 38
    if-nez p0, :cond_0

    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    const/4 p0, 0x0

    .line 42
    throw p0
.end method

.method public final varargs setOneLinkCustomDomain([Ljava/lang/String;)V
    .locals 2

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x47

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 8
    .line 9
    invoke-static {p1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "setOneLinkCustomDomain %s"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->unregisterClient()Lcom/appsflyer/internal/AFc1sSDK;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    iput-object p1, p0, Lcom/appsflyer/internal/AFc1sSDK;->component4:[Ljava/lang/String;

    .line 35
    .line 36
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 37
    .line 38
    add-int/lit8 p0, p0, 0x73

    .line 39
    .line 40
    rem-int/lit16 p0, p0, 0x80

    .line 41
    .line 42
    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 43
    .line 44
    return-void
.end method

.method public final setOutOfStore(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 2
    .line 3
    add-int/lit8 v0, p0, 0x2d

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    add-int/lit8 p0, p0, 0x3

    .line 13
    .line 14
    rem-int/lit16 p0, p0, 0x80

    .line 15
    .line 16
    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 17
    .line 18
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p1, p0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const-string v1, "api_store_value"

    .line 31
    .line 32
    invoke-virtual {p1, v1, p0}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    const-string p1, "Store API set with value: "

    .line 36
    .line 37
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-static {p0, v0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;Z)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    const-string p0, "Cannot set setOutOfStore with null"

    .line 50
    .line 51
    invoke-static {p0, v0}, Lcom/appsflyer/AFLogger;->afWarnLog(Ljava/lang/String;Z)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final setPartnerData(Ljava/lang/String;Ljava/util/Map;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->e()Lcom/appsflyer/internal/AFd1mSDK;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object v0, p0, Lcom/appsflyer/internal/AFd1mSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFc1bSDK;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Lcom/appsflyer/internal/AFc1bSDK;

    .line 14
    .line 15
    invoke-direct {v0}, Lcom/appsflyer/internal/AFc1bSDK;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/appsflyer/internal/AFd1mSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFc1bSDK;

    .line 19
    .line 20
    :cond_0
    iget-object p0, p0, Lcom/appsflyer/internal/AFd1mSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFc1bSDK;

    .line 21
    .line 22
    if-eqz p1, :cond_8

    .line 23
    .line 24
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 25
    .line 26
    add-int/lit8 v0, v0, 0x45

    .line 27
    .line 28
    rem-int/lit16 v1, v0, 0x80

    .line 29
    .line 30
    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 31
    .line 32
    rem-int/lit8 v0, v0, 0x2

    .line 33
    .line 34
    if-eqz v0, :cond_7

    .line 35
    .line 36
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    goto/16 :goto_2

    .line 43
    .line 44
    :cond_1
    if-eqz p2, :cond_4

    .line 45
    .line 46
    invoke-interface {p2}, Ljava/util/Map;->isEmpty()Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_2

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    const-string v1, "Setting partner data for "

    .line 56
    .line 57
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, ": "

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    new-instance v0, Lorg/json/JSONObject;

    .line 79
    .line 80
    invoke-direct {v0, p2}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    const/16 v1, 0x3e8

    .line 92
    .line 93
    if-le v0, v1, :cond_3

    .line 94
    .line 95
    const-string p2, "Partner data 1000 characters limit exceeded"

    .line 96
    .line 97
    invoke-static {p2}, Lcom/appsflyer/AFLogger;->afWarnLog(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    new-instance p2, Ljava/util/HashMap;

    .line 101
    .line 102
    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 103
    .line 104
    .line 105
    const-string v1, "limit exceeded: "

    .line 106
    .line 107
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    const-string v1, "error"

    .line 116
    .line 117
    invoke-interface {p2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    iget-object p0, p0, Lcom/appsflyer/internal/AFc1bSDK;->getCurrencyIso4217Code:Ljava/util/Map;

    .line 121
    .line 122
    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    return-void

    .line 126
    :cond_3
    iget-object v0, p0, Lcom/appsflyer/internal/AFc1bSDK;->getMediationNetwork:Ljava/util/Map;

    .line 127
    .line 128
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    iget-object p0, p0, Lcom/appsflyer/internal/AFc1bSDK;->getCurrencyIso4217Code:Ljava/util/Map;

    .line 132
    .line 133
    invoke-interface {p0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    return-void

    .line 137
    :cond_4
    :goto_0
    iget-object p0, p0, Lcom/appsflyer/internal/AFc1bSDK;->getMediationNetwork:Ljava/util/Map;

    .line 138
    .line 139
    invoke-interface {p0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    if-nez p0, :cond_5

    .line 144
    .line 145
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 146
    .line 147
    add-int/lit8 p0, p0, 0x29

    .line 148
    .line 149
    rem-int/lit16 p1, p0, 0x80

    .line 150
    .line 151
    sput p1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 152
    .line 153
    rem-int/lit8 p0, p0, 0x2

    .line 154
    .line 155
    const-string p1, "Partner data is missing or `null`"

    .line 156
    .line 157
    if-eqz p0, :cond_6

    .line 158
    .line 159
    const/16 p0, 0x1e

    .line 160
    .line 161
    div-int/lit8 p0, p0, 0x0

    .line 162
    .line 163
    goto :goto_1

    .line 164
    :cond_5
    const-string p0, "Cleared partner data for "

    .line 165
    .line 166
    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 171
    .line 172
    add-int/lit8 p0, p0, 0x4b

    .line 173
    .line 174
    rem-int/lit16 p0, p0, 0x80

    .line 175
    .line 176
    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 177
    .line 178
    :cond_6
    :goto_1
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->afWarnLog(Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    return-void

    .line 182
    :cond_7
    const/4 p0, 0x0

    .line 183
    throw p0

    .line 184
    :cond_8
    :goto_2
    const-string p0, "Partner ID is missing or `null`"

    .line 185
    .line 186
    invoke-static {p0}, Lcom/appsflyer/AFLogger;->afWarnLog(Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    return-void
.end method

.method public final setPhoneNumber(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x6d

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->e()Lcom/appsflyer/internal/AFd1mSDK;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p1}, Lcom/appsflyer/internal/AFb1iSDK;->getCurrencyIso4217Code(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, p0, Lcom/appsflyer/internal/AFd1mSDK;->getCurrencyIso4217Code:Ljava/lang/String;

    .line 22
    .line 23
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 24
    .line 25
    add-int/lit8 p0, p0, 0x1b

    .line 26
    .line 27
    rem-int/lit16 p0, p0, 0x80

    .line 28
    .line 29
    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 30
    .line 31
    return-void
.end method

.method public final setPluginInfo(Lcom/appsflyer/internal/platform_extension/PluginInfo;)V
    .locals 2
    .param p1    # Lcom/appsflyer/internal/platform_extension/PluginInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x7

    .line 4
    .line 5
    rem-int/lit16 v1, v0, 0x80

    .line 6
    .line 7
    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 8
    .line 9
    rem-int/lit8 v0, v0, 0x2

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->AFInAppEventParameterName()Lcom/appsflyer/internal/AFi1lSDK;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-interface {p0, p1}, Lcom/appsflyer/internal/AFi1lSDK;->getRevenue(Lcom/appsflyer/internal/platform_extension/PluginInfo;)V

    .line 25
    .line 26
    .line 27
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 28
    .line 29
    add-int/lit8 p0, p0, 0x37

    .line 30
    .line 31
    rem-int/lit16 p0, p0, 0x80

    .line 32
    .line 33
    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->AFInAppEventParameterName()Lcom/appsflyer/internal/AFi1lSDK;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-interface {p0, p1}, Lcom/appsflyer/internal/AFi1lSDK;->getRevenue(Lcom/appsflyer/internal/platform_extension/PluginInfo;)V

    .line 48
    .line 49
    .line 50
    const/4 p0, 0x0

    .line 51
    throw p0
.end method

.method public final setPreinstallAttribution(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    filled-new-array {p0, p1, p2, p3}, [Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const p2, -0x284759c7

    .line 10
    .line 11
    .line 12
    const p3, 0x284759d3

    .line 13
    .line 14
    .line 15
    invoke-static {p1, p2, p3, p0}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final varargs setResolveDeepLinkURLs([Ljava/lang/String;)V
    .locals 2

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x41

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 8
    .line 9
    invoke-static {p1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "setResolveDeepLinkURLs %s"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->unregisterClient()Lcom/appsflyer/internal/AFc1sSDK;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    iget-object v0, p0, Lcom/appsflyer/internal/AFc1sSDK;->component1:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/appsflyer/internal/AFc1sSDK;->component1:Ljava/util/List;

    .line 40
    .line 41
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-interface {p0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 46
    .line 47
    .line 48
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 49
    .line 50
    add-int/lit8 p0, p0, 0x59

    .line 51
    .line 52
    rem-int/lit16 p0, p0, 0x80

    .line 53
    .line 54
    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 55
    .line 56
    return-void
.end method

.method public final varargs setSharingFilter([Ljava/lang/String;)V
    .locals 1
    .param p1    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x73

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/appsflyer/AppsFlyerLib;->setSharingFilterForPartners([Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 13
    .line 14
    add-int/lit8 p0, p0, 0x59

    .line 15
    .line 16
    rem-int/lit16 p0, p0, 0x80

    .line 17
    .line 18
    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 19
    .line 20
    return-void
.end method

.method public final setSharingFilterForAllPartners()V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x39

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 8
    .line 9
    const-string v0, "all"

    .line 10
    .line 11
    filled-new-array {v0}, [Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Lcom/appsflyer/AppsFlyerLib;->setSharingFilterForPartners([Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 19
    .line 20
    add-int/lit8 p0, p0, 0x57

    .line 21
    .line 22
    rem-int/lit16 p0, p0, 0x80

    .line 23
    .line 24
    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 25
    .line 26
    return-void
.end method

.method public final varargs setSharingFilterForPartners([Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->e()Lcom/appsflyer/internal/AFd1mSDK;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v0, Lcom/appsflyer/internal/AFd1uSDK;

    .line 10
    .line 11
    invoke-direct {v0, p1}, Lcom/appsflyer/internal/AFd1uSDK;-><init>([Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/appsflyer/internal/AFd1mSDK;->getMonetizationNetwork:Lcom/appsflyer/internal/AFd1uSDK;

    .line 15
    .line 16
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 17
    .line 18
    add-int/lit8 p0, p0, 0x65

    .line 19
    .line 20
    rem-int/lit16 p1, p0, 0x80

    .line 21
    .line 22
    sput p1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 23
    .line 24
    rem-int/lit8 p0, p0, 0x2

    .line 25
    .line 26
    if-nez p0, :cond_0

    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    throw p0
.end method

.method public final varargs setUserEmails(Lcom/appsflyer/AppsFlyerProperties$EmailsCryptType;[Ljava/lang/String;)V
    .locals 6

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    array-length v1, p2

    .line 4
    add-int/lit8 v1, v1, 0x1

    .line 5
    .line 6
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->copydefault()Lcom/appsflyer/internal/AFb1bSDK;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    array-length v1, p2

    .line 32
    add-int/lit8 v1, v1, 0x1

    .line 33
    .line 34
    new-array v1, v1, [Ljava/lang/String;

    .line 35
    .line 36
    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, [Ljava/lang/String;

    .line 41
    .line 42
    const-string v1, "setUserEmails"

    .line 43
    .line 44
    invoke-interface {p0, v1, v0}, Lcom/appsflyer/internal/AFb1bSDK;->getMediationNetwork(Ljava/lang/String;[Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    const-string v0, "userEmailsCryptType"

    .line 52
    .line 53
    invoke-virtual {p1}, Lcom/appsflyer/AppsFlyerProperties$EmailsCryptType;->getValue()I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    invoke-virtual {p0, v0, v1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;I)V

    .line 58
    .line 59
    .line 60
    new-instance p0, Ljava/util/HashMap;

    .line 61
    .line 62
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 63
    .line 64
    .line 65
    new-instance v0, Ljava/util/ArrayList;

    .line 66
    .line 67
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 68
    .line 69
    .line 70
    array-length v1, p2

    .line 71
    sget v2, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 72
    .line 73
    add-int/lit8 v2, v2, 0x1f

    .line 74
    .line 75
    rem-int/lit16 v2, v2, 0x80

    .line 76
    .line 77
    sput v2, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 78
    .line 79
    const/4 v2, 0x0

    .line 80
    const/4 v3, 0x0

    .line 81
    :goto_0
    if-ge v3, v1, :cond_1

    .line 82
    .line 83
    sget v2, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 84
    .line 85
    add-int/lit8 v2, v2, 0x27

    .line 86
    .line 87
    rem-int/lit16 v2, v2, 0x80

    .line 88
    .line 89
    sput v2, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 90
    .line 91
    aget-object v2, p2, v3

    .line 92
    .line 93
    sget-object v4, Lcom/appsflyer/internal/AFb1tSDK$4;->getMonetizationNetwork:[I

    .line 94
    .line 95
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 96
    .line 97
    .line 98
    move-result v5

    .line 99
    aget v4, v4, v5

    .line 100
    .line 101
    const/4 v5, 0x2

    .line 102
    if-eq v4, v5, :cond_0

    .line 103
    .line 104
    invoke-static {v2}, Lcom/appsflyer/internal/AFb1iSDK;->getCurrencyIso4217Code(Ljava/lang/String;)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    invoke-virtual {v0, v2}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    const-string v2, "sha256_el_arr"

    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_0
    invoke-virtual {v0, v2}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    const-string v2, "plain_el_arr"

    .line 118
    .line 119
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_1
    invoke-interface {p0, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    new-instance p1, Lorg/json/JSONObject;

    .line 126
    .line 127
    invoke-direct {p1, p0}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 128
    .line 129
    .line 130
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    invoke-virtual {p0, p1}, Lcom/appsflyer/AppsFlyerProperties;->setUserEmails(Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    return-void
.end method

.method public final varargs setUserEmails([Ljava/lang/String;)V
    .locals 2

    .line 142
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 v0, v0, 0x7d

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    rem-int/lit8 v0, v0, 0x2

    const-string v1, "setUserEmails"

    if-nez v0, :cond_0

    .line 143
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    move-result-object v0

    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1fSDK;->copydefault()Lcom/appsflyer/internal/AFb1bSDK;

    move-result-object v0

    invoke-interface {v0, v1, p1}, Lcom/appsflyer/internal/AFb1bSDK;->getMediationNetwork(Ljava/lang/String;[Ljava/lang/String;)V

    .line 144
    sget-object v0, Lcom/appsflyer/AppsFlyerProperties$EmailsCryptType;->NONE:Lcom/appsflyer/AppsFlyerProperties$EmailsCryptType;

    invoke-virtual {p0, v0, p1}, Lcom/appsflyer/AppsFlyerLib;->setUserEmails(Lcom/appsflyer/AppsFlyerProperties$EmailsCryptType;[Ljava/lang/String;)V

    return-void

    .line 145
    :cond_0
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    move-result-object v0

    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1fSDK;->copydefault()Lcom/appsflyer/internal/AFb1bSDK;

    move-result-object v0

    invoke-interface {v0, v1, p1}, Lcom/appsflyer/internal/AFb1bSDK;->getMediationNetwork(Ljava/lang/String;[Ljava/lang/String;)V

    .line 146
    sget-object v0, Lcom/appsflyer/AppsFlyerProperties$EmailsCryptType;->NONE:Lcom/appsflyer/AppsFlyerProperties$EmailsCryptType;

    invoke-virtual {p0, v0, p1}, Lcom/appsflyer/AppsFlyerLib;->setUserEmails(Lcom/appsflyer/AppsFlyerProperties$EmailsCryptType;[Ljava/lang/String;)V

    const/4 p0, 0x0

    .line 147
    throw p0
.end method

.method public final start(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x23

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, p1, v0}, Lcom/appsflyer/AppsFlyerLib;->start(Landroid/content/Context;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 14
    .line 15
    add-int/lit8 p0, p0, 0x7b

    .line 16
    .line 17
    rem-int/lit16 p1, p0, 0x80

    .line 18
    .line 19
    sput p1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 20
    .line 21
    rem-int/lit8 p0, p0, 0x2

    .line 22
    .line 23
    if-nez p0, :cond_0

    .line 24
    .line 25
    const/16 p0, 0x19

    .line 26
    .line 27
    div-int/lit8 p0, p0, 0x0

    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public final start(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 31
    filled-new-array {p0, p1, p2}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p0

    const p2, 0x6bb2e2d3

    const v0, -0x6bb2e2c1

    invoke-static {p1, p2, v0, p0}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData([Ljava/lang/Object;III)Ljava/lang/Object;

    return-void
.end method

.method public final start(Landroid/content/Context;Ljava/lang/String;Lcom/appsflyer/attribution/AppsFlyerRequestListener;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 30
    filled-new-array {p0, p1, p2, p3}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p0

    const p2, -0x639a8920

    const p3, 0x639a892d

    invoke-static {p1, p2, p3, p0}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData([Ljava/lang/Object;III)Ljava/lang/Object;

    return-void
.end method

.method public final stop(ZLandroid/content/Context;)V
    .locals 1

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0xf

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 8
    .line 9
    invoke-virtual {p0, p2}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->AFKeystoreWrapper()Lcom/appsflyer/internal/AFg1rSDK;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    iput-boolean p1, p2, Lcom/appsflyer/internal/AFg1rSDK;->component4:Z

    .line 21
    .line 22
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->AFAdRevenueData()Ljava/util/concurrent/ExecutorService;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    new-instance v0, Lcom/appsflyer/internal/g;

    .line 27
    .line 28
    invoke-direct {v0, p0}, Lcom/appsflyer/internal/g;-><init>(Lcom/appsflyer/internal/AFd1fSDK;)V

    .line 29
    .line 30
    .line 31
    invoke-interface {p2, v0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 32
    .line 33
    .line 34
    if-eqz p1, :cond_0

    .line 35
    .line 36
    sget p1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 37
    .line 38
    add-int/lit8 p1, p1, 0x6d

    .line 39
    .line 40
    rem-int/lit16 p1, p1, 0x80

    .line 41
    .line 42
    sput p1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 43
    .line 44
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->getRevenue()Lcom/appsflyer/internal/AFd1rSDK;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    const-string p1, "is_stop_tracking_used"

    .line 49
    .line 50
    const/4 p2, 0x1

    .line 51
    invoke-interface {p0, p1, p2}, Lcom/appsflyer/internal/AFd1rSDK;->AFAdRevenueData(Ljava/lang/String;Z)V

    .line 52
    .line 53
    .line 54
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 55
    .line 56
    add-int/lit8 p0, p0, 0x37

    .line 57
    .line 58
    rem-int/lit16 p0, p0, 0x80

    .line 59
    .line 60
    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 61
    .line 62
    :cond_0
    return-void
.end method

.method public final subscribeForDeepLink(Lcom/appsflyer/deeplink/DeepLinkListener;)V
    .locals 3
    .param p1    # Lcom/appsflyer/deeplink/DeepLinkListener;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 46
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    add-int/lit8 v0, v0, 0x73

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    rem-int/lit8 v0, v0, 0x2

    const-wide/16 v1, 0xbb8

    if-nez v0, :cond_0

    .line 47
    invoke-virtual {p0, p1, v1, v2}, Lcom/appsflyer/AppsFlyerLib;->subscribeForDeepLink(Lcom/appsflyer/deeplink/DeepLinkListener;J)V

    return-void

    :cond_0
    invoke-virtual {p0, p1, v1, v2}, Lcom/appsflyer/AppsFlyerLib;->subscribeForDeepLink(Lcom/appsflyer/deeplink/DeepLinkListener;J)V

    const/4 p0, 0x0

    .line 48
    throw p0
.end method

.method public final subscribeForDeepLink(Lcom/appsflyer/deeplink/DeepLinkListener;J)V
    .locals 1
    .param p1    # Lcom/appsflyer/deeplink/DeepLinkListener;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x63

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1fSDK;->unregisterClient()Lcom/appsflyer/internal/AFc1sSDK;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object p1, v0, Lcom/appsflyer/internal/AFc1sSDK;->getRevenue:Lcom/appsflyer/deeplink/DeepLinkListener;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->unregisterClient()Lcom/appsflyer/internal/AFc1sSDK;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    iput-wide p2, p0, Lcom/appsflyer/internal/AFc1sSDK;->component3:J

    .line 28
    .line 29
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 30
    .line 31
    add-int/lit8 p0, p0, 0x13

    .line 32
    .line 33
    rem-int/lit16 p1, p0, 0x80

    .line 34
    .line 35
    sput p1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 36
    .line 37
    rem-int/lit8 p0, p0, 0x2

    .line 38
    .line 39
    if-nez p0, :cond_0

    .line 40
    .line 41
    const/16 p0, 0xe

    .line 42
    .line 43
    div-int/lit8 p0, p0, 0x0

    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method public final unregisterConversionListener()V
    .locals 3

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x37

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1fSDK;->copydefault()Lcom/appsflyer/internal/AFb1bSDK;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const/4 v1, 0x0

    .line 18
    new-array v1, v1, [Ljava/lang/String;

    .line 19
    .line 20
    const-string v2, "unregisterConversionListener"

    .line 21
    .line 22
    invoke-interface {v0, v2, v1}, Lcom/appsflyer/internal/AFb1bSDK;->getMediationNetwork(Ljava/lang/String;[Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    iput-object v0, p0, Lcom/appsflyer/internal/AFb1tSDK;->getMediationNetwork:Lcom/appsflyer/AppsFlyerConversionListener;

    .line 27
    .line 28
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 29
    .line 30
    add-int/lit8 p0, p0, 0x5f

    .line 31
    .line 32
    rem-int/lit16 p0, p0, 0x80

    .line 33
    .line 34
    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 35
    .line 36
    return-void
.end method

.method public final updateServerUninstallToken(Landroid/content/Context;Ljava/lang/String;)V
    .locals 6

    .line 1
    invoke-virtual {p0, p1}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p0, Lcom/appsflyer/internal/AFg1lSDK;

    .line 5
    .line 6
    invoke-direct {p0, p1}, Lcom/appsflyer/internal/AFg1lSDK;-><init>(Landroid/content/Context;)V

    .line 7
    .line 8
    .line 9
    if-eqz p2, :cond_5

    .line 10
    .line 11
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    goto :goto_2

    .line 22
    :cond_0
    sget-object p1, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 23
    .line 24
    sget-object v0, Lcom/appsflyer/internal/AFg1cSDK;->unregisterClient:Lcom/appsflyer/internal/AFg1cSDK;

    .line 25
    .line 26
    const-string v1, "Firebase Refreshed Token = "

    .line 27
    .line 28
    invoke-virtual {v1, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {p1, v0, v1}, Lcom/appsflyer/internal/AFh1ySDK;->i(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFg1lSDK;->AFAdRevenueData()Lcom/appsflyer/internal/AFg1jSDK;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    iget-object v0, p1, Lcom/appsflyer/internal/AFg1jSDK;->AFAdRevenueData:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p2, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_4

    .line 48
    .line 49
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 50
    .line 51
    .line 52
    move-result-wide v0

    .line 53
    if-eqz p1, :cond_3

    .line 54
    .line 55
    iget-wide v2, p1, Lcom/appsflyer/internal/AFg1jSDK;->getCurrencyIso4217Code:J

    .line 56
    .line 57
    sub-long v2, v0, v2

    .line 58
    .line 59
    const-wide/16 v4, 0x7d0

    .line 60
    .line 61
    cmp-long p1, v2, v4

    .line 62
    .line 63
    if-lez p1, :cond_2

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_2
    const/4 p1, 0x0

    .line 67
    goto :goto_1

    .line 68
    :cond_3
    :goto_0
    const/4 p1, 0x1

    .line 69
    :goto_1
    new-instance v2, Lcom/appsflyer/internal/AFg1jSDK;

    .line 70
    .line 71
    xor-int/lit8 v3, p1, 0x1

    .line 72
    .line 73
    invoke-direct {v2, p2, v0, v1, v3}, Lcom/appsflyer/internal/AFg1jSDK;-><init>(Ljava/lang/String;JZ)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lcom/appsflyer/internal/AFg1lSDK;->getRevenue:Lcom/appsflyer/internal/AFd1rSDK;

    .line 77
    .line 78
    const-string v1, "afUninstallToken"

    .line 79
    .line 80
    iget-object v3, v2, Lcom/appsflyer/internal/AFg1jSDK;->AFAdRevenueData:Ljava/lang/String;

    .line 81
    .line 82
    invoke-interface {v0, v1, v3}, Lcom/appsflyer/internal/AFd1rSDK;->getRevenue(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lcom/appsflyer/internal/AFg1lSDK;->getRevenue:Lcom/appsflyer/internal/AFd1rSDK;

    .line 86
    .line 87
    const-string v1, "afUninstallToken_received_time"

    .line 88
    .line 89
    iget-wide v3, v2, Lcom/appsflyer/internal/AFg1jSDK;->getCurrencyIso4217Code:J

    .line 90
    .line 91
    invoke-interface {v0, v1, v3, v4}, Lcom/appsflyer/internal/AFd1rSDK;->getRevenue(Ljava/lang/String;J)V

    .line 92
    .line 93
    .line 94
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1lSDK;->getRevenue:Lcom/appsflyer/internal/AFd1rSDK;

    .line 95
    .line 96
    const-string v0, "afUninstallToken_queued"

    .line 97
    .line 98
    invoke-virtual {v2}, Lcom/appsflyer/internal/AFg1jSDK;->getRevenue()Z

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    invoke-interface {p0, v0, v1}, Lcom/appsflyer/internal/AFd1rSDK;->AFAdRevenueData(Ljava/lang/String;Z)V

    .line 103
    .line 104
    .line 105
    if-eqz p1, :cond_4

    .line 106
    .line 107
    invoke-static {p2}, Lcom/appsflyer/internal/AFg1lSDK;->AFAdRevenueData(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    :cond_4
    return-void

    .line 111
    :cond_5
    :goto_2
    sget-object p0, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 112
    .line 113
    sget-object p1, Lcom/appsflyer/internal/AFg1cSDK;->unregisterClient:Lcom/appsflyer/internal/AFg1cSDK;

    .line 114
    .line 115
    const-string p2, "Firebase Token is either empty or null and was not registered."

    .line 116
    .line 117
    invoke-virtual {p0, p1, p2}, Lcom/appsflyer/internal/AFh1ySDK;->w(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method public final validateAndLogInAppPurchase(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x69

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1fSDK;->copydefault()Lcom/appsflyer/internal/AFb1bSDK;

    .line 14
    .line 15
    .line 16
    move-result-object v6

    .line 17
    if-nez p7, :cond_1

    .line 18
    .line 19
    sget v0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 20
    .line 21
    add-int/lit8 v0, v0, 0x75

    .line 22
    .line 23
    rem-int/lit16 v1, v0, 0x80

    .line 24
    .line 25
    sput v1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 26
    .line 27
    rem-int/lit8 v0, v0, 0x2

    .line 28
    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    const/16 v0, 0x4e

    .line 32
    .line 33
    div-int/lit8 v0, v0, 0x0

    .line 34
    .line 35
    :cond_0
    const-string v0, ""

    .line 36
    .line 37
    :goto_0
    move-object v1, p3

    .line 38
    move-object v2, p4

    .line 39
    move-object/from16 v3, p5

    .line 40
    .line 41
    move-object/from16 v4, p6

    .line 42
    .line 43
    move-object v5, v0

    .line 44
    move-object v0, p2

    .line 45
    goto :goto_1

    .line 46
    :cond_1
    invoke-virtual/range {p7 .. p7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    goto :goto_0

    .line 51
    :goto_1
    filled-new-array/range {v0 .. v5}, [Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    move-object v8, v4

    .line 56
    const-string v0, "validateAndTrackInAppPurchase"

    .line 57
    .line 58
    invoke-interface {v6, v0, v5}, Lcom/appsflyer/internal/AFb1bSDK;->getMediationNetwork(Ljava/lang/String;[Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/appsflyer/AppsFlyerLib;->isStopped()Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-nez v0, :cond_2

    .line 66
    .line 67
    sget-object v0, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 68
    .line 69
    sget-object v1, Lcom/appsflyer/internal/AFg1cSDK;->registerClient:Lcom/appsflyer/internal/AFg1cSDK;

    .line 70
    .line 71
    new-instance v4, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    const-string v5, "Validate in app called with parameters: "

    .line 74
    .line 75
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v4, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    const-string v5, " "

    .line 82
    .line 83
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v4

    .line 99
    invoke-virtual {v0, v1, v4}, Lcom/appsflyer/internal/AFh1ySDK;->i(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    :cond_2
    const/4 v0, 0x0

    .line 103
    if-eqz p2, :cond_5

    .line 104
    .line 105
    if-eqz v3, :cond_5

    .line 106
    .line 107
    sget v1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 108
    .line 109
    add-int/lit8 v1, v1, 0xb

    .line 110
    .line 111
    rem-int/lit16 v4, v1, 0x80

    .line 112
    .line 113
    sput v4, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 114
    .line 115
    rem-int/lit8 v1, v1, 0x2

    .line 116
    .line 117
    if-nez v1, :cond_4

    .line 118
    .line 119
    if-eqz p3, :cond_5

    .line 120
    .line 121
    if-eqz v8, :cond_5

    .line 122
    .line 123
    if-nez p4, :cond_3

    .line 124
    .line 125
    goto :goto_2

    .line 126
    :cond_3
    new-instance v10, Ljava/lang/Thread;

    .line 127
    .line 128
    new-instance v0, Lcom/appsflyer/internal/AFa1cSDK;

    .line 129
    .line 130
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    invoke-interface {p1}, Lcom/appsflyer/internal/AFd1fSDK;->AFKeystoreWrapper()Lcom/appsflyer/internal/AFg1rSDK;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    iget-object p1, p1, Lcom/appsflyer/internal/AFg1rSDK;->component1:Ljava/lang/String;

    .line 143
    .line 144
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->getMediationNetwork()Lcom/appsflyer/internal/AFd1pSDK;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    move-object v2, p1

    .line 153
    move-object v4, p2

    .line 154
    move-object v5, p3

    .line 155
    move-object v6, p4

    .line 156
    move-object/from16 v9, p7

    .line 157
    .line 158
    move-object v7, v3

    .line 159
    move-object v3, p0

    .line 160
    invoke-direct/range {v0 .. v9}, Lcom/appsflyer/internal/AFa1cSDK;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/appsflyer/internal/AFd1pSDK;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 161
    .line 162
    .line 163
    invoke-direct {v10, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {v10}, Ljava/lang/Thread;->start()V

    .line 167
    .line 168
    .line 169
    return-void

    .line 170
    :cond_4
    throw v0

    .line 171
    :cond_5
    :goto_2
    sget-object p0, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code:Lcom/appsflyer/AppsFlyerInAppPurchaseValidatorListener;

    .line 172
    .line 173
    if-eqz p0, :cond_7

    .line 174
    .line 175
    sget p1, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 176
    .line 177
    add-int/lit8 p1, p1, 0x11

    .line 178
    .line 179
    rem-int/lit16 p2, p1, 0x80

    .line 180
    .line 181
    sput p2, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 182
    .line 183
    rem-int/lit8 p1, p1, 0x2

    .line 184
    .line 185
    const-string p2, "Please provide purchase parameters"

    .line 186
    .line 187
    if-nez p1, :cond_6

    .line 188
    .line 189
    invoke-interface {p0, p2}, Lcom/appsflyer/AppsFlyerInAppPurchaseValidatorListener;->onValidateInAppFailure(Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    return-void

    .line 193
    :cond_6
    invoke-interface {p0, p2}, Lcom/appsflyer/AppsFlyerInAppPurchaseValidatorListener;->onValidateInAppFailure(Ljava/lang/String;)V

    .line 194
    .line 195
    .line 196
    throw v0

    .line 197
    :cond_7
    return-void
.end method

.method public final validateAndLogInAppPurchase(Lcom/appsflyer/AFPurchaseDetails;Ljava/util/Map;Lcom/appsflyer/AppsFlyerInAppPurchaseValidationCallback;)V
    .locals 0
    .param p1    # Lcom/appsflyer/AFPurchaseDetails;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/Map;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/appsflyer/AppsFlyerInAppPurchaseValidationCallback;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/appsflyer/AFPurchaseDetails;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/appsflyer/AppsFlyerInAppPurchaseValidationCallback;",
            ")V"
        }
    .end annotation

    .line 198
    filled-new-array {p0, p1, p2, p3}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p0

    const p2, -0x25c72824

    const p3, 0x25c72833

    invoke-static {p1, p2, p3, p0}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData([Ljava/lang/Object;III)Ljava/lang/Object;

    return-void
.end method

.method public final waitForCustomerUserId(Z)V
    .locals 3

    .line 1
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 2
    .line 3
    add-int/lit8 p0, p0, 0x37

    .line 4
    .line 5
    rem-int/lit16 v0, p0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 8
    .line 9
    rem-int/lit8 p0, p0, 0x2

    .line 10
    .line 11
    const-string v0, "waitForCustomerId"

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    const-string v2, "initAfterCustomerUserID: "

    .line 15
    .line 16
    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {v2, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0, v1}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;Z)V

    .line 25
    .line 26
    .line 27
    invoke-static {v0, p1}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code(Ljava/lang/String;Z)V

    .line 28
    .line 29
    .line 30
    sget p0, Lcom/appsflyer/internal/AFb1tSDK;->values:I

    .line 31
    .line 32
    add-int/lit8 p0, p0, 0x13

    .line 33
    .line 34
    rem-int/lit16 p0, p0, 0x80

    .line 35
    .line 36
    sput p0, Lcom/appsflyer/internal/AFb1tSDK;->AFKeystoreWrapper:I

    .line 37
    .line 38
    return-void
.end method
