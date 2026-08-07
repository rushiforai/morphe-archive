.class public Ll/rd5;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static a(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ll/z20;)Ll/jic0;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            "Ljava/lang/Boolean;",
            ">;)",
            "Ll/jic0<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/y7n;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/y7n;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ll/z20;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static b(Lcom/p1/mobile/android/app/Act;ILcom/p1/mobile/putong/core/data/PurchaseType;)Ll/frl;
    .locals 1

    .line 1
    invoke-static {p1}, Ll/rd5;->g(I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/doo;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1, p2}, Ll/doo;-><init>(Lcom/p1/mobile/android/app/Act;ILcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 10
    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->xf()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    new-instance v0, Ll/shn;

    .line 24
    .line 25
    invoke-direct {v0, p0, p1, p2}, Ll/shn;-><init>(Lcom/p1/mobile/android/app/Act;ILcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 26
    .line 27
    .line 28
    return-object v0

    .line 29
    :cond_1
    new-instance v0, Ll/mgj;

    .line 30
    .line 31
    invoke-direct {v0, p0, p1, p2}, Ll/mgj;-><init>(Lcom/p1/mobile/android/app/Act;ILcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 32
    .line 33
    .line 34
    return-object v0
.end method

.method public static c(Lcom/p1/mobile/android/app/Act;I)Ll/grl;
    .locals 1

    .line 1
    invoke-static {p1}, Ll/rd5;->g(I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/goo;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1}, Ll/goo;-><init>(Lcom/p1/mobile/android/app/Act;I)V

    .line 10
    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->xf()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    new-instance v0, Ll/p9n;

    .line 24
    .line 25
    invoke-direct {v0, p0, p1}, Ll/p9n;-><init>(Lcom/p1/mobile/android/app/Act;I)V

    .line 26
    .line 27
    .line 28
    return-object v0

    .line 29
    :cond_1
    new-instance v0, Ll/pd5;

    .line 30
    .line 31
    invoke-direct {v0, p0, p1}, Ll/pd5;-><init>(Lcom/p1/mobile/android/app/Act;I)V

    .line 32
    .line 33
    .line 34
    return-object v0
.end method

.method public static d(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)Ll/hrl;
    .locals 1

    .line 1
    new-instance v0, Ll/ioo;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/ioo;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static e(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ll/z20;I)Ll/a;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            "Ljava/lang/Boolean;",
            ">;I)",
            "Ll/a<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/oe5;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Ll/oe5;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ll/z20;I)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static f(Lcom/p1/mobile/android/app/Act;I)Ll/hrl;
    .locals 1

    .line 1
    new-instance v0, Ll/le5;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/le5;-><init>(Lcom/p1/mobile/android/app/Act;I)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static g(I)Z
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq v0, p0, :cond_1

    .line 3
    .line 4
    const/4 v1, 0x2

    .line 5
    if-eq v1, p0, :cond_1

    .line 6
    .line 7
    const/16 v1, 0xc

    .line 8
    .line 9
    if-eq v1, p0, :cond_1

    .line 10
    .line 11
    const/16 v1, 0xe

    .line 12
    .line 13
    if-eq v1, p0, :cond_1

    .line 14
    .line 15
    const/16 v1, 0x16

    .line 16
    .line 17
    if-eq v1, p0, :cond_1

    .line 18
    .line 19
    const/16 v1, 0x1b

    .line 20
    .line 21
    if-eq v1, p0, :cond_1

    .line 22
    .line 23
    const/16 v1, 0x1c

    .line 24
    .line 25
    if-eq v1, p0, :cond_1

    .line 26
    .line 27
    const/16 v1, 0x1d

    .line 28
    .line 29
    if-eq v1, p0, :cond_1

    .line 30
    .line 31
    const/16 v1, 0x1e

    .line 32
    .line 33
    if-ne v1, p0, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    const/4 p0, 0x0

    .line 37
    return p0

    .line 38
    :cond_1
    :goto_0
    return v0
.end method
