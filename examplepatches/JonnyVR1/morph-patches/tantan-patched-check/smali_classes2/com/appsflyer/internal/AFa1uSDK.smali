.class public final Lcom/appsflyer/internal/AFa1uSDK;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/appsflyer/internal/AFd1vSDK;


# static fields
.field private static getMonetizationNetwork:Landroid/content/IntentFilter;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Landroid/content/IntentFilter;

    .line 2
    .line 3
    const-string v1, "android.intent.action.BATTERY_CHANGED"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/appsflyer/internal/AFa1uSDK;->getMonetizationNetwork:Landroid/content/IntentFilter;

    .line 9
    .line 10
    return-void
.end method

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
.method public final getMonetizationNetwork(Landroid/content/Context;)Lcom/appsflyer/internal/AFd1vSDK$AFa1ySDK;
    .locals 5
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    const/4 v0, 0x0

    .line 3
    :try_start_0
    sget-object v1, Lcom/appsflyer/internal/AFa1uSDK;->getMonetizationNetwork:Landroid/content/IntentFilter;

    .line 4
    .line 5
    invoke-static {p1, p0, v1}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    if-eqz p1, :cond_4

    .line 10
    .line 11
    const-string v1, "status"

    .line 12
    .line 13
    const/4 v2, -0x1

    .line 14
    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const/4 v3, 0x2

    .line 19
    if-ne v3, v1, :cond_3

    .line 20
    .line 21
    const-string v1, "plugged"

    .line 22
    .line 23
    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    const/4 v4, 0x1

    .line 28
    if-eq v1, v4, :cond_2

    .line 29
    .line 30
    if-eq v1, v3, :cond_1

    .line 31
    .line 32
    const/4 v3, 0x4

    .line 33
    if-eq v1, v3, :cond_0

    .line 34
    .line 35
    const-string p0, "other"

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :catchall_0
    move-exception p1

    .line 39
    goto :goto_1

    .line 40
    :cond_0
    const-string p0, "wireless"

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    const-string p0, "usb"

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    const-string p0, "ac"

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_3
    const-string p0, "no"

    .line 50
    .line 51
    :goto_0
    const-string v1, "level"

    .line 52
    .line 53
    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    const-string v3, "scale"

    .line 58
    .line 59
    invoke-virtual {p1, v3, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 60
    .line 61
    .line 62
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 63
    if-eq v2, v1, :cond_4

    .line 64
    .line 65
    if-eq v2, p1, :cond_4

    .line 66
    .line 67
    const/high16 v0, 0x42c80000    # 100.0f

    .line 68
    .line 69
    int-to-float v1, v1

    .line 70
    mul-float/2addr v1, v0

    .line 71
    int-to-float p1, p1

    .line 72
    div-float v0, v1, p1

    .line 73
    .line 74
    goto :goto_2

    .line 75
    :goto_1
    const-string v1, "Device that failed to register receiver"

    .line 76
    .line 77
    invoke-static {v1, p1}, Lcom/appsflyer/AFLogger;->afErrorLogForExcManagerOnly(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 78
    .line 79
    .line 80
    :cond_4
    :goto_2
    new-instance p1, Lcom/appsflyer/internal/AFd1vSDK$AFa1ySDK;

    .line 81
    .line 82
    invoke-direct {p1, v0, p0}, Lcom/appsflyer/internal/AFd1vSDK$AFa1ySDK;-><init>(FLjava/lang/String;)V

    .line 83
    .line 84
    .line 85
    return-object p1
.end method
