.class public final Lcom/appsflyer/internal/AFa1bSDK$AFa1uSDK;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/appsflyer/internal/AFa1bSDK;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "AFa1uSDK"
.end annotation


# instance fields
.field private final getCurrencyIso4217Code:Z

.field public final getRevenue:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/appsflyer/internal/AFa1bSDK$AFa1uSDK;->getRevenue:Ljava/lang/String;

    .line 5
    .line 6
    iput-boolean p2, p0, Lcom/appsflyer/internal/AFa1bSDK$AFa1uSDK;->getCurrencyIso4217Code:Z

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final getCurrencyIso4217Code()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/appsflyer/internal/AFa1bSDK$AFa1uSDK;->getCurrencyIso4217Code:Z

    .line 2
    .line 3
    return p0
.end method
