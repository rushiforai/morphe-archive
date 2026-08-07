.class public final Lcom/appsflyer/internal/AFg1jSDK;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final AFAdRevenueData:Ljava/lang/String;

.field public final getCurrencyIso4217Code:J

.field private final getRevenue:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;JZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/appsflyer/internal/AFg1jSDK;->AFAdRevenueData:Ljava/lang/String;

    .line 5
    .line 6
    iput-wide p2, p0, Lcom/appsflyer/internal/AFg1jSDK;->getCurrencyIso4217Code:J

    .line 7
    .line 8
    iput-boolean p4, p0, Lcom/appsflyer/internal/AFg1jSDK;->getRevenue:Z

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final getRevenue()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/appsflyer/internal/AFg1jSDK;->getRevenue:Z

    .line 2
    .line 3
    return p0
.end method
