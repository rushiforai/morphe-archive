.class public Lcom/tantanapp/android/injecter/routes/Injecter$$Providers$$b_core;
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
    const-class v1, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;

    .line 7
    .line 8
    const-string v2, "/member_business_service/service"

    .line 9
    .line 10
    const-string v3, "member_business_service"

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
    const-string v1, "com.p1.mobile.putong.core.member.module.CoreMemberBusinessService"

    .line 18
    .line 19
    invoke-interface {p1, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    const-class v1, Lcom/p1/mobile/putong/core/module/CoreProviderImpl;

    .line 23
    .line 24
    const-string v2, "/core_global/service"

    .line 25
    .line 26
    const-string v3, "core_global"

    .line 27
    .line 28
    invoke-static/range {v0 .. v6}, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->build(Lcom/tantanapp/android/injecter/facade/enums/RouteType;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;II)Lcom/tantanapp/android/injecter/facade/model/RouteMeta;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string v1, "com.p1.mobile.putong.core.api.inject.provider.CoreProviderInterface"

    .line 33
    .line 34
    invoke-interface {p1, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    const-class v1, Lcom/p1/mobile/putong/core/api/CoreServiceImpl;

    .line 38
    .line 39
    const-string v2, "/core_service/service"

    .line 40
    .line 41
    const-string v3, "core_service"

    .line 42
    .line 43
    invoke-static/range {v0 .. v6}, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->build(Lcom/tantanapp/android/injecter/facade/enums/RouteType;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;II)Lcom/tantanapp/android/injecter/facade/model/RouteMeta;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    const-string v1, "com.p1.mobile.putong.core_api.api.serviceprovider.api.CoreService"

    .line 48
    .line 49
    invoke-interface {p1, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    const-class v1, Lcom/p1/mobile/putong/core/CoreBusinessModule;

    .line 53
    .line 54
    const-string v2, "/core_module/module"

    .line 55
    .line 56
    const-string v3, "core_module"

    .line 57
    .line 58
    invoke-static/range {v0 .. v6}, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->build(Lcom/tantanapp/android/injecter/facade/enums/RouteType;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;II)Lcom/tantanapp/android/injecter/facade/model/RouteMeta;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const-string v1, "com.tantanapp.putong.module.Module"

    .line 63
    .line 64
    invoke-interface {p1, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    const-class v1, Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml;

    .line 68
    .line 69
    const-string v2, "/core_business/service"

    .line 70
    .line 71
    const-string v3, "core_business"

    .line 72
    .line 73
    invoke-static/range {v0 .. v6}, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->build(Lcom/tantanapp/android/injecter/facade/enums/RouteType;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;II)Lcom/tantanapp/android/injecter/facade/model/RouteMeta;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    const-string v1, "com.p1.mobile.putong.core.api.inject.provider.CoreBusinessService"

    .line 78
    .line 79
    invoke-interface {p1, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    const-class v1, Lcom/p1/mobile/putong/core/api/CoreCommonServiceImpl;

    .line 83
    .line 84
    const-string v2, "/core_common_service/service"

    .line 85
    .line 86
    const-string v3, "core_common_service"

    .line 87
    .line 88
    invoke-static/range {v0 .. v6}, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->build(Lcom/tantanapp/android/injecter/facade/enums/RouteType;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;II)Lcom/tantanapp/android/injecter/facade/model/RouteMeta;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    const-string v0, "com.p1.mobile.putong.core_api.api.serviceprovider.api.core.CoreCommonService"

    .line 93
    .line 94
    invoke-interface {p1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    return-void
.end method
