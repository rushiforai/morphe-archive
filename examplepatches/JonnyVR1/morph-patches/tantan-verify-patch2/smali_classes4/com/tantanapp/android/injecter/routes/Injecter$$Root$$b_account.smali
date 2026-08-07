.class public Lcom/tantanapp/android/injecter/routes/Injecter$$Root$$b_account;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/android/injecter/facade/template/IRouteRoot;


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
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "+",
            "Lcom/tantanapp/android/injecter/facade/template/IRouteGroup;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    const-string p0, "account_common_service"

    .line 2
    .line 3
    const-class v0, Lcom/tantanapp/android/injecter/routes/Injecter$$Group$$account_common_service;

    .line 4
    .line 5
    invoke-interface {p1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    const-string p0, "account_module"

    .line 9
    .line 10
    const-class v0, Lcom/tantanapp/android/injecter/routes/Injecter$$Group$$account_module;

    .line 11
    .line 12
    invoke-interface {p1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    const-string p0, "account_service"

    .line 16
    .line 17
    const-class v0, Lcom/tantanapp/android/injecter/routes/Injecter$$Group$$account_service;

    .line 18
    .line 19
    invoke-interface {p1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    return-void
.end method
