.class final Lcom/appsflyer/AFLogger$1;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/appsflyer/AFLogger;->e(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;Ljava/lang/Throwable;ZZZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function1<",
        "Lcom/appsflyer/internal/AFh1ySDK;",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0001\u001a\u00020\u0000H\n\u00a2\u0006\u0004\u0008\u0003\u0010\u0004"
    }
    d2 = {
        "Lcom/appsflyer/internal/AFh1ySDK;",
        "p0",
        "",
        "getCurrencyIso4217Code",
        "(Lcom/appsflyer/internal/AFh1ySDK;)V"
    }
    k = 0x3
    mv = {
        0x1,
        0x6,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private synthetic $AFAdRevenueData:Z

.field private synthetic $areAllFieldsValid:Z

.field private synthetic $component4:Z

.field private synthetic $getCurrencyIso4217Code:Ljava/lang/String;

.field private synthetic $getMediationNetwork:Ljava/lang/Throwable;

.field private synthetic $getMonetizationNetwork:Lcom/appsflyer/internal/AFg1cSDK;

.field private synthetic $getRevenue:Z


# direct methods
.method public constructor <init>(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;Ljava/lang/Throwable;ZZZZ)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/appsflyer/AFLogger$1;->$getMonetizationNetwork:Lcom/appsflyer/internal/AFg1cSDK;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/appsflyer/AFLogger$1;->$getCurrencyIso4217Code:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/appsflyer/AFLogger$1;->$getMediationNetwork:Ljava/lang/Throwable;

    .line 6
    .line 7
    iput-boolean p4, p0, Lcom/appsflyer/AFLogger$1;->$getRevenue:Z

    .line 8
    .line 9
    iput-boolean p5, p0, Lcom/appsflyer/AFLogger$1;->$AFAdRevenueData:Z

    .line 10
    .line 11
    iput-boolean p6, p0, Lcom/appsflyer/AFLogger$1;->$component4:Z

    .line 12
    .line 13
    iput-boolean p7, p0, Lcom/appsflyer/AFLogger$1;->$areAllFieldsValid:Z

    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public final getCurrencyIso4217Code(Lcom/appsflyer/internal/AFh1ySDK;)V
    .locals 8
    .param p1    # Lcom/appsflyer/internal/AFh1ySDK;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v1, p0, Lcom/appsflyer/AFLogger$1;->$getMonetizationNetwork:Lcom/appsflyer/internal/AFg1cSDK;

    .line 5
    .line 6
    iget-object v2, p0, Lcom/appsflyer/AFLogger$1;->$getCurrencyIso4217Code:Ljava/lang/String;

    .line 7
    .line 8
    iget-object v3, p0, Lcom/appsflyer/AFLogger$1;->$getMediationNetwork:Ljava/lang/Throwable;

    .line 9
    .line 10
    iget-boolean v4, p0, Lcom/appsflyer/AFLogger$1;->$getRevenue:Z

    .line 11
    .line 12
    iget-boolean v5, p0, Lcom/appsflyer/AFLogger$1;->$AFAdRevenueData:Z

    .line 13
    .line 14
    iget-boolean v6, p0, Lcom/appsflyer/AFLogger$1;->$component4:Z

    .line 15
    .line 16
    iget-boolean v7, p0, Lcom/appsflyer/AFLogger$1;->$areAllFieldsValid:Z

    .line 17
    .line 18
    move-object v0, p1

    .line 19
    invoke-virtual/range {v0 .. v7}, Lcom/appsflyer/internal/AFh1ySDK;->e(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;Ljava/lang/Throwable;ZZZZ)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/appsflyer/internal/AFh1ySDK;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/appsflyer/AFLogger$1;->getCurrencyIso4217Code(Lcom/appsflyer/internal/AFh1ySDK;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 7
    .line 8
    return-object p0
.end method
