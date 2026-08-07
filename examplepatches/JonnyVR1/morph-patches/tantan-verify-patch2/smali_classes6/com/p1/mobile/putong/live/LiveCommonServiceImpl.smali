.class public Lcom/p1/mobile/putong/live/LiveCommonServiceImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/LiveCommonService;


# annotations
.annotation build Lcom/tantanapp/android/injecter/facade/annotation/Route;
    name = "putong-common \u4f7f\u7528\u7684 live \u670d\u52a1"
    path = "/live_common_service/service"
.end annotation


# instance fields
.field public a:Ll/m2;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/nqr;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/nqr;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/LiveCommonServiceImpl;->a:Ll/m2;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a()Ll/hbs;
    .locals 0

    .line 1
    invoke-static {}, Ll/ibs;->g()Ll/ibs;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public init(Landroid/content/Context;)V
    .locals 0

    return-void
.end method
