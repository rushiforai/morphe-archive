.class public final Lcom/appsflyer/internal/AFa1rSDK$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/reflect/InvocationHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/appsflyer/internal/AFa1rSDK;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field private synthetic getMediationNetwork:Ljava/lang/Class;

.field private synthetic getRevenue:Lcom/appsflyer/internal/AFa1rSDK$AFa1tSDK;


# direct methods
.method public constructor <init>(Ljava/lang/Class;Lcom/appsflyer/internal/AFa1rSDK$AFa1tSDK;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/appsflyer/internal/AFa1rSDK$3;->getMediationNetwork:Ljava/lang/Class;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/appsflyer/internal/AFa1rSDK$3;->getRevenue:Lcom/appsflyer/internal/AFa1rSDK$AFa1tSDK;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string p2, "onDeferredAppLinkDataFetched"

    .line 6
    .line 7
    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    const/4 p2, 0x0

    .line 12
    if-eqz p1, :cond_4

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    aget-object p1, p3, p1

    .line 16
    .line 17
    if-eqz p1, :cond_2

    .line 18
    .line 19
    iget-object p3, p0, Lcom/appsflyer/internal/AFa1rSDK$3;->getMediationNetwork:Ljava/lang/Class;

    .line 20
    .line 21
    invoke-virtual {p3, p1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iget-object p3, p0, Lcom/appsflyer/internal/AFa1rSDK$3;->getMediationNetwork:Ljava/lang/Class;

    .line 26
    .line 27
    const-string v0, "getArgumentBundle"

    .line 28
    .line 29
    invoke-virtual {p3, v0, p2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 30
    .line 31
    .line 32
    move-result-object p3

    .line 33
    const-class v0, Landroid/os/Bundle;

    .line 34
    .line 35
    invoke-virtual {p3, p1, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {v0, p1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    check-cast p1, Landroid/os/Bundle;

    .line 44
    .line 45
    if-eqz p1, :cond_1

    .line 46
    .line 47
    const-string p3, "com.facebook.platform.APPLINK_NATIVE_URL"

    .line 48
    .line 49
    invoke-virtual {p1, p3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p3

    .line 53
    const-string v0, "target_url"

    .line 54
    .line 55
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    const-string v1, "extras"

    .line 60
    .line 61
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    if-eqz p1, :cond_0

    .line 66
    .line 67
    const-string v1, "deeplink_context"

    .line 68
    .line 69
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    if-eqz p1, :cond_0

    .line 74
    .line 75
    const-string v1, "promo_code"

    .line 76
    .line 77
    invoke-virtual {p1, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    goto :goto_0

    .line 82
    :cond_0
    move-object p1, p2

    .line 83
    goto :goto_0

    .line 84
    :cond_1
    move-object p1, p2

    .line 85
    move-object p3, p1

    .line 86
    move-object v0, p3

    .line 87
    :goto_0
    iget-object p0, p0, Lcom/appsflyer/internal/AFa1rSDK$3;->getRevenue:Lcom/appsflyer/internal/AFa1rSDK$AFa1tSDK;

    .line 88
    .line 89
    if-eqz p0, :cond_3

    .line 90
    .line 91
    invoke-interface {p0, p3, v0, p1}, Lcom/appsflyer/internal/AFa1rSDK$AFa1tSDK;->getMonetizationNetwork(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_2
    iget-object p0, p0, Lcom/appsflyer/internal/AFa1rSDK$3;->getRevenue:Lcom/appsflyer/internal/AFa1rSDK$AFa1tSDK;

    .line 96
    .line 97
    if-eqz p0, :cond_3

    .line 98
    .line 99
    invoke-interface {p0, p2, p2, p2}, Lcom/appsflyer/internal/AFa1rSDK$AFa1tSDK;->getMonetizationNetwork(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    :cond_3
    :goto_1
    return-object p2

    .line 103
    :cond_4
    iget-object p0, p0, Lcom/appsflyer/internal/AFa1rSDK$3;->getRevenue:Lcom/appsflyer/internal/AFa1rSDK$AFa1tSDK;

    .line 104
    .line 105
    if-eqz p0, :cond_5

    .line 106
    .line 107
    const-string p1, "onDeferredAppLinkDataFetched invocation failed"

    .line 108
    .line 109
    invoke-interface {p0, p1}, Lcom/appsflyer/internal/AFa1rSDK$AFa1tSDK;->getRevenue(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    :cond_5
    return-object p2
.end method
