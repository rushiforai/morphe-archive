.class public final Lcom/appsflyer/internal/AFd1eSDK;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/appsflyer/internal/AFd1aSDK;


# annotations
.annotation build Landroidx/annotation/WorkerThread;
.end annotation


# instance fields
.field private final getMediationNetwork:Lcom/appsflyer/internal/AFd1iSDK;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/appsflyer/internal/AFd1iSDK;)V
    .locals 0
    .param p1    # Lcom/appsflyer/internal/AFd1iSDK;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lcom/appsflyer/internal/AFd1eSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFd1iSDK;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final AFAdRevenueData([BLjava/util/Map;I)V
    .locals 1
    .param p1    # [B
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    new-instance p3, Lcom/appsflyer/internal/AFd1cSDK;

    .line 8
    .line 9
    const/16 v0, 0x7d0

    .line 10
    .line 11
    invoke-direct {p3, p1, p2, v0}, Lcom/appsflyer/internal/AFd1cSDK;-><init>([BLjava/util/Map;I)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p3}, Lcom/appsflyer/internal/AFd1hSDK;->getMonetizationNetwork()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Lcom/appsflyer/internal/AFd1eSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFd1iSDK;

    .line 21
    .line 22
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1iSDK;->getMonetizationNetwork()Z

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method
