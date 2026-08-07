.class final Lcom/appsflyer/internal/AFb1tSDK$AFa1uSDK;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/appsflyer/internal/AFb1tSDK;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AFa1uSDK"
.end annotation


# instance fields
.field private final getMonetizationNetwork:Lcom/appsflyer/internal/AFa1mSDK;

.field private synthetic getRevenue:Lcom/appsflyer/internal/AFb1tSDK;


# direct methods
.method private constructor <init>(Lcom/appsflyer/internal/AFb1tSDK;Lcom/appsflyer/internal/AFa1mSDK;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/appsflyer/internal/AFb1tSDK$AFa1uSDK;->getRevenue:Lcom/appsflyer/internal/AFb1tSDK;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/appsflyer/internal/AFb1tSDK$AFa1uSDK;->getMonetizationNetwork:Lcom/appsflyer/internal/AFa1mSDK;

    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>(Lcom/appsflyer/internal/AFb1tSDK;Lcom/appsflyer/internal/AFa1mSDK;B)V
    .locals 0

    .line 9
    invoke-direct {p0, p1, p2}, Lcom/appsflyer/internal/AFb1tSDK$AFa1uSDK;-><init>(Lcom/appsflyer/internal/AFb1tSDK;Lcom/appsflyer/internal/AFa1mSDK;)V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/appsflyer/internal/AFb1tSDK$AFa1uSDK;->getRevenue:Lcom/appsflyer/internal/AFb1tSDK;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/appsflyer/internal/AFb1tSDK$AFa1uSDK;->getMonetizationNetwork:Lcom/appsflyer/internal/AFa1mSDK;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code(Lcom/appsflyer/internal/AFb1tSDK;Lcom/appsflyer/internal/AFa1mSDK;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
