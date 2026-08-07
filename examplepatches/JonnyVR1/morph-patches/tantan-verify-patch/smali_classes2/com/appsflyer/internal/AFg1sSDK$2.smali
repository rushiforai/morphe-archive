.class final Lcom/appsflyer/internal/AFg1sSDK$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/appsflyer/lvl/AppsFlyerLVL$resultListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/appsflyer/internal/AFg1sSDK;->AFAdRevenueData(JLandroid/content/Context;Lcom/appsflyer/internal/AFg1sSDK$AFa1ySDK;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field private synthetic AFAdRevenueData:Lcom/appsflyer/internal/AFg1sSDK;

.field private synthetic getMonetizationNetwork:Lcom/appsflyer/internal/AFg1sSDK$AFa1ySDK;


# direct methods
.method public constructor <init>(Lcom/appsflyer/internal/AFg1sSDK;Lcom/appsflyer/internal/AFg1sSDK$AFa1ySDK;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/appsflyer/internal/AFg1sSDK$2;->AFAdRevenueData:Lcom/appsflyer/internal/AFg1sSDK;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/appsflyer/internal/AFg1sSDK$2;->getMonetizationNetwork:Lcom/appsflyer/internal/AFg1sSDK$AFa1ySDK;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onLvlFailure(Ljava/lang/Exception;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1sSDK$2;->getMonetizationNetwork:Lcom/appsflyer/internal/AFg1sSDK$AFa1ySDK;

    .line 2
    .line 3
    const-string v0, "onLvlFailure with exception"

    .line 4
    .line 5
    invoke-interface {p0, v0, p1}, Lcom/appsflyer/internal/AFg1sSDK$AFa1ySDK;->AFAdRevenueData(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final onLvlResult(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1sSDK$2;->getMonetizationNetwork:Lcom/appsflyer/internal/AFg1sSDK$AFa1ySDK;

    .line 6
    .line 7
    invoke-interface {p0, p1, p2}, Lcom/appsflyer/internal/AFg1sSDK$AFa1ySDK;->getCurrencyIso4217Code(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1sSDK$2;->getMonetizationNetwork:Lcom/appsflyer/internal/AFg1sSDK$AFa1ySDK;

    .line 12
    .line 13
    const-string p1, "onLvlResult with error"

    .line 14
    .line 15
    if-nez p2, :cond_1

    .line 16
    .line 17
    new-instance p2, Ljava/lang/Exception;

    .line 18
    .line 19
    const-string v0, "AFLVL Invalid signature"

    .line 20
    .line 21
    invoke-direct {p2, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-interface {p0, p1, p2}, Lcom/appsflyer/internal/AFg1sSDK$AFa1ySDK;->AFAdRevenueData(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    new-instance p2, Ljava/lang/Exception;

    .line 29
    .line 30
    const-string v0, "AFLVL Invalid signedData"

    .line 31
    .line 32
    invoke-direct {p2, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-interface {p0, p1, p2}, Lcom/appsflyer/internal/AFg1sSDK$AFa1ySDK;->AFAdRevenueData(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method
