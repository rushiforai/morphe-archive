.class public Lcom/tantanapp/android/injecter/routes/Injecter$$Providers$$b_live;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/android/injecter/facade/template/IProviderGroup;


# direct methods
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
.method public loadInto(Ljava/util/Map;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/tantanapp/android/injecter/facade/model/RouteMeta;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/tantanapp/android/injecter/facade/enums/RouteType;->PROVIDER:Lcom/tantanapp/android/injecter/facade/enums/RouteType;

    .line 2
    .line 3
    const/4 v5, -0x1

    .line 4
    const/high16 v6, -0x80000000

    .line 5
    .line 6
    const-class v1, Lcom/p1/mobile/putong/live/LiveCommonServiceImpl;

    .line 7
    .line 8
    const-string v2, "/live_common_service/service"

    .line 9
    .line 10
    const-string v3, "live_common_service"

    .line 11
    .line 12
    const/4 v4, 0x0

    .line 13
    invoke-static/range {v0 .. v6}, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->build(Lcom/tantanapp/android/injecter/facade/enums/RouteType;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;II)Lcom/tantanapp/android/injecter/facade/model/RouteMeta;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v1, "com.p1.mobile.putong.live_api.api.serviceprovider.api.live.LiveCommonService"

    .line 18
    .line 19
    invoke-interface {p1, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    const-class v1, Lcom/p1/mobile/putong/live/LiveModule;

    .line 23
    .line 24
    const-string v2, "/live_module/module"

    .line 25
    .line 26
    const-string v3, "live_module"

    .line 27
    .line 28
    invoke-static/range {v0 .. v6}, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->build(Lcom/tantanapp/android/injecter/facade/enums/RouteType;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;II)Lcom/tantanapp/android/injecter/facade/model/RouteMeta;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string v1, "com.tantanapp.putong.module.Module"

    .line 33
    .line 34
    invoke-interface {p1, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    const-class v1, Lcom/p1/mobile/putong/live/LiveServiceImpl;

    .line 38
    .line 39
    const-string v2, "/live_service/service"

    .line 40
    .line 41
    const-string v3, "live_service"

    .line 42
    .line 43
    invoke-static/range {v0 .. v6}, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->build(Lcom/tantanapp/android/injecter/facade/enums/RouteType;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;II)Lcom/tantanapp/android/injecter/facade/model/RouteMeta;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    const-string v0, "com.p1.mobile.putong.live_api.api.serviceprovider.api.LiveService"

    .line 48
    .line 49
    invoke-interface {p1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    return-void
.end method
