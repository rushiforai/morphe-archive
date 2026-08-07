.class public final Lcom/appsflyer/internal/AFh1dSDK;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final AFAdRevenueData:J

.field public final areAllFieldsValid:Ljava/lang/Throwable;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final component1:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final component2:Lcom/appsflyer/internal/AFi1uSDK;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final getCurrencyIso4217Code:J

.field public final getMediationNetwork:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final getMonetizationNetwork:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public final getRevenue:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;JJILcom/appsflyer/internal/AFi1uSDK;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p8    # Lcom/appsflyer/internal/AFi1uSDK;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p9    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/appsflyer/internal/AFh1dSDK;->getMediationNetwork:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/appsflyer/internal/AFh1dSDK;->getMonetizationNetwork:Ljava/lang/String;

    .line 7
    .line 8
    iput-wide p3, p0, Lcom/appsflyer/internal/AFh1dSDK;->getCurrencyIso4217Code:J

    .line 9
    .line 10
    iput-wide p5, p0, Lcom/appsflyer/internal/AFh1dSDK;->AFAdRevenueData:J

    .line 11
    .line 12
    iput p7, p0, Lcom/appsflyer/internal/AFh1dSDK;->getRevenue:I

    .line 13
    .line 14
    iput-object p8, p0, Lcom/appsflyer/internal/AFh1dSDK;->component2:Lcom/appsflyer/internal/AFi1uSDK;

    .line 15
    .line 16
    iput-object p9, p0, Lcom/appsflyer/internal/AFh1dSDK;->component1:Ljava/lang/String;

    .line 17
    .line 18
    iput-object p10, p0, Lcom/appsflyer/internal/AFh1dSDK;->areAllFieldsValid:Ljava/lang/Throwable;

    .line 19
    .line 20
    return-void
.end method
