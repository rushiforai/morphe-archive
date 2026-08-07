.class public Ll/j690;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Z


# direct methods
.method public static A()Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/j690;->z()Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 10
    .line 11
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/data/PurchaseType;->getPrivilegeDataForGP(Lcom/p1/mobile/putong/data/Gender;)Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->svip_badge:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 22
    .line 23
    invoke-static {v1, v2}, Ll/jyb;->c0(Ljava/util/List;Ljava/lang/Object;)Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const/4 v3, 0x0

    .line 28
    invoke-interface {v1, v3, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v0, v1}, Ll/jyb;->p(Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Ljava/util/ArrayList;

    .line 36
    .line 37
    return-object v0
.end method

.method public static B(Z)V
    .locals 0

    .line 1
    sput-boolean p0, Ll/j690;->a:Z

    .line 2
    .line 3
    return-void
.end method

.method public static C()I
    .locals 1

    .line 1
    const/16 v0, 0xe

    .line 2
    .line 3
    return v0
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;Ljava/util/List;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 1

    .line 1
    invoke-static {p0, p3}, Ll/j690;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, v0}, Ll/a690;->Z(Z)V

    .line 7
    .line 8
    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    if-ne p3, p1, :cond_0

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    invoke-interface {p2, p1, p0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/data/Privilege;Ljava/util/List;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_O_DIAMOND:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    invoke-static {v0, p2}, Ll/j690;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v2, 0x1

    .line 8
    invoke-virtual {v1, v2}, Ll/a690;->Q(Z)V

    .line 9
    .line 10
    .line 11
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    const/4 v3, 0x0

    .line 16
    if-eqz v2, :cond_0

    .line 17
    .line 18
    if-ne p2, p0, :cond_0

    .line 19
    .line 20
    invoke-interface {p1, v3, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-eqz v2, :cond_1

    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/data/PurchaseType;->getPrivilegeData(Lcom/p1/mobile/putong/data/Gender;)Ljava/util/ArrayList;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-nez p0, :cond_1

    .line 40
    .line 41
    sget-object p0, Lcom/p1/mobile/putong/core/data/Privilege;->oDiamondSvipExtra:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 42
    .line 43
    if-ne p2, p0, :cond_1

    .line 44
    .line 45
    invoke-interface {p1, v3, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;Ljava/util/List;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 1

    .line 1
    invoke-static {p0, p3}, Ll/j690;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, v0}, Ll/a690;->e0(Z)V

    .line 7
    .line 8
    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    if-ne p3, p1, :cond_0

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    invoke-interface {p2, p1, p0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public static synthetic d(Ljava/util/List;Lcom/p1/mobile/putong/core/data/Privilege;Ljava/util/List;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 2

    .line 1
    invoke-static {p3}, Ll/j690;->l(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-le p0, v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ll/a690;->d0(Z)V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {v0, v1}, Ll/a690;->S(Z)V

    .line 17
    .line 18
    .line 19
    :goto_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    if-ne p3, p1, :cond_1

    .line 26
    .line 27
    const/4 p0, 0x0

    .line 28
    invoke-interface {p2, p0, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_2

    .line 37
    .line 38
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    :cond_2
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/data/Privilege;Ljava/util/List;ZLcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    if-ne p4, p0, :cond_0

    .line 8
    .line 9
    invoke-static {p3, p4}, Ll/j690;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p1, p2, p0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    invoke-static {p3, p4}, Ll/j690;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/data/Privilege;Ljava/util/List;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_O_PLATINUM:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    invoke-static {v0, p2}, Ll/j690;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {v0, v1}, Ll/a690;->T(Z)V

    .line 9
    .line 10
    .line 11
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    if-ne p2, p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    invoke-interface {p1, p0, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-eqz p0, :cond_1

    .line 29
    .line 30
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void
.end method

.method public static g()Ljava/lang/String;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->P8:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method public static h()I
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Bs()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->Y2:I

    .line 16
    .line 17
    return v0

    .line 18
    :cond_0
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->X2:I

    .line 19
    .line 20
    return v0
.end method

.method public static i(Ljava/util/List;Lcom/p1/mobile/putong/core/data/Privilege;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ">;",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ")",
            "Ljava/util/List<",
            "Ll/a690;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/h690;

    .line 7
    .line 8
    invoke-direct {v1, p1, v0}, Ll/h690;-><init>(Lcom/p1/mobile/putong/core/data/Privilege;Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public static j(Ljava/util/List;Lcom/p1/mobile/putong/core/data/Privilege;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ">;",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ")",
            "Ljava/util/List<",
            "Ll/a690;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/f690;

    .line 7
    .line 8
    invoke-direct {v1, p0, p1, v0}, Ll/f690;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/core/data/Privilege;Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public static k(Ljava/util/List;Lcom/p1/mobile/putong/core/data/Privilege;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ">;",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ")",
            "Ljava/util/List<",
            "Ll/a690;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/i690;

    .line 7
    .line 8
    invoke-direct {v1, p1, v0}, Ll/i690;-><init>(Lcom/p1/mobile/putong/core/data/Privilege;Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public static l(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0, p0}, Ll/j690;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static m(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;
    .locals 10

    .line 1
    sget-object v0, Ll/j690$a;->a:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const-string v1, "https://auto.tancdn.com/v1/raw/0750872a-d3b6-4b59-afec-3ed32fbb5e5511.webp"

    const-string v2, "https://auto.tancdn.com/v1/raw/b8927b15-478d-4a2b-b514-2da53e084ae010.webp"

    const-string v3, "https://auto.tancdn.com/v1/raw/d81da4e9-8ed7-4917-a1fd-05a5446adab710.webp"

    const-string v4, "https://auto.tancdn.com/v1/raw/4ad5dbbb-6860-4461-b45f-9a6209d7df6f11.webp"

    const-string v5, "https://auto.tancdn.com/v1/raw/f6c163cb-aa67-455d-b289-5953e6d9b54411.webp"

    const-string v6, "\u79c1\u4eba\u5b9a\u5236"

    const-string v7, "\u65e0\u9700\u914d\u5bf9\uff0c\u76f4\u63a5\u5411\u5bf9\u65b9\u8868\u8fbe\u4f60\u7684\u5fc3\u610f\uff01"

    const-string v8, "\u5979"

    const-string v9, "\u4ed6"

    packed-switch v0, :pswitch_data_0

    .line 2
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 3
    :pswitch_0
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 4
    invoke-virtual {v0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p1

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    if-ne p0, v0, :cond_0

    .line 6
    const-string p0, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IjRDQzE3REQxNTdBNjRGRkNBNUFGRTg1Nzg5QUVENDM5IiwidyI6NzExLCJoIjozNzgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoyOTE2MjEzOTkwOTY1OTU5ODIsInB0IjoyMDI1MDYxNzE1fQ.webp"

    goto :goto_0

    .line 7
    :cond_0
    const-string p0, "https://fe-static.tancdn.com/v1/images/eyJpZCI6Ijc4NzFCRkFDMUZFQzQzMDc5RDMzMTFDQUMxMDY5MDJCIiwidyI6NzExLCJoIjozODEsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxNjY5MzIwNDEyNDEwMzU5Mzg4LCJwdCI6MjAyNTA2MTcxNX0.webp"

    .line 8
    :goto_0
    invoke-virtual {p1, p0}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->u6:I

    .line 9
    invoke-virtual {p0, p1}, Ll/b690;->n(I)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->t6:I

    .line 10
    invoke-virtual {p0, p1}, Ll/b690;->l(I)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->t6:I

    .line 11
    invoke-virtual {p0, p1}, Ll/b690;->f(I)Ll/b690;

    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 13
    :pswitch_1
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    .line 14
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    const-string p1, "\u5b9a\u5411\u9690\u8eab"

    .line 15
    invoke-virtual {p0, p1}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 16
    const-string p1, "\u4e0d\u8ba9\u8ddd\u79bb\u592a\u8fd1\u7684\u4eba\u770b\u5230\u6211\uff0c\u968f\u65f6\u4fdd\u62a4\u9690\u79c1"

    invoke-virtual {p0, p1}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 17
    invoke-virtual {p0, p1}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    sget p1, Ll/jbc0;->Y6:I

    .line 18
    invoke-virtual {p0, p1}, Ll/b690;->i(I)Ll/b690;

    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 20
    :pswitch_2
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    .line 21
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    .line 22
    invoke-virtual {p0, v6}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 23
    const-string p1, "\u6839\u636e\u5b9a\u5236\u9700\u6c42\u5b9e\u65f6\u63a8\u9001\uff0c\u5f00\u542f\u4e13\u5c5e\u793e\u4ea4\u4f53\u9a8c"

    invoke-virtual {p0, p1}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 24
    invoke-virtual {p0, p1}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    sget p1, Ll/jbc0;->k5:I

    .line 25
    invoke-virtual {p0, p1}, Ll/b690;->i(I)Ll/b690;

    move-result-object p0

    .line 26
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 27
    :pswitch_3
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    .line 28
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    const-string p1, "\u67e5\u770b\u6d88\u606f\u662f\u5426\u5df2\u8bfb"

    .line 29
    invoke-virtual {p0, p1}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 30
    const-string p1, "\u4f60\u53d1\u51fa\u7684\u6d88\u606f\u8fd8\u6ca1\u88ab\u770b\u5230\uff1f\u8fd8\u662f\u5df2\u8bfb\u4e0d\u56de\uff1f"

    invoke-virtual {p0, p1}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 31
    invoke-virtual {p0, p1}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    sget p1, Ll/jbc0;->gc:I

    .line 32
    invoke-virtual {p0, p1}, Ll/b690;->i(I)Ll/b690;

    move-result-object p0

    .line 33
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 34
    :pswitch_4
    invoke-static {}, Ll/c17;->u0()Z

    move-result p0

    if-eqz p0, :cond_1

    const-string p0, "\u4f18\u5148\u8ba9\u4ed6\u770b\u89c1\u4f60\uff0c\u77e5\u6653\u4f60\u7684\u7279\u522b\u5fc3\u610f"

    goto :goto_1

    :cond_1
    const-string p0, "\u4f18\u5148\u8ba9\u5979\u770b\u89c1\u4f60\uff0c\u77e5\u6653\u4f60\u7684\u7279\u522b\u5fc3\u610f"

    .line 35
    :goto_1
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 36
    invoke-virtual {v0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p1

    sget v0, Ll/jbc0;->u9:I

    .line 37
    invoke-virtual {p1, v0}, Ll/b690;->e(I)Ll/b690;

    move-result-object p1

    sget v0, Ll/h9c0;->p0:I

    sget v1, Ll/h9c0;->o0:I

    .line 38
    invoke-virtual {p1, v0, v1}, Ll/b690;->h(II)Ll/b690;

    move-result-object p1

    const-string v0, "\u6bcf\u59291\u4e2a\u8d85\u7ea7\u559c\u6b22"

    .line 39
    invoke-virtual {p1, v0}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p1

    .line 40
    invoke-virtual {p1, p0}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p1

    .line 41
    invoke-virtual {p1, p0}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 42
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 43
    :pswitch_5
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    .line 44
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->Q1:Lcom/p1/mobile/putong/core/api/t;

    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/t;->R:Lcom/p1/mobile/putong/core/api/t$a;

    .line 45
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/t$a;->H()I

    move-result p1

    .line 46
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    .line 47
    const-string v0, "\u6bcf\u5929%s\u6b21\u989d\u5916\u514d\u8d39\u76f2\u76d2"

    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 48
    invoke-virtual {p0, p1}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 49
    const-string p1, "\u5f00\u542f\u60ca\u559c\u76f2\u76d2\u5bf9\u8c61\uff0c\u8ba4\u8bc6\u6709\u8da3\u7684\u65b0\u670b\u53cb"

    invoke-virtual {p0, p1}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 50
    invoke-virtual {p0, p1}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    sget p1, Ll/jbc0;->zb:I

    .line 51
    invoke-virtual {p0, p1}, Ll/b690;->i(I)Ll/b690;

    move-result-object p0

    .line 52
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 53
    :pswitch_6
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    .line 54
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->Q1:Lcom/p1/mobile/putong/core/api/t;

    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/t;->R:Lcom/p1/mobile/putong/core/api/t$a;

    .line 55
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/t$a;->I()I

    move-result p1

    .line 56
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    .line 57
    const-string v0, "\u6bcf\u5929%s\u6b21\u514d\u8d39\u627e\u642d\u5b50\u7279\u6743"

    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 58
    invoke-virtual {p0, p1}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 59
    const-string p1, "\u76f4\u63a5\u548c\u4f60\u5fc3\u4eea\u7684\u5bf9\u8c61\u53d1\u8d77\u79c1\u804a\uff0c\u9080\u7ea6\u65e0\u9700\u7b49\u5f85"

    invoke-virtual {p0, p1}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 60
    invoke-virtual {p0, p1}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    sget p1, Ll/jbc0;->yb:I

    .line 61
    invoke-virtual {p0, p1}, Ll/b690;->i(I)Ll/b690;

    move-result-object p0

    .line 62
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 63
    :pswitch_7
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    .line 64
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    const-string p1, "\u4efb\u610f\u4fee\u6539\u5b9a\u4f4d"

    .line 65
    invoke-virtual {p0, p1}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 66
    const-string p1, "\u524d\u5f80\u5b66\u6821\u9644\u8fd1\u3001\u65c5\u884c\u76ee\u7684\u5730\u6216\u4efb\u610f\u5730\u65b9\u4ea4\u53cb"

    invoke-virtual {p0, p1}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 67
    invoke-virtual {p0, p1}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    sget p1, Ll/jbc0;->N:I

    .line 68
    invoke-virtual {p0, p1}, Ll/b690;->i(I)Ll/b690;

    move-result-object p0

    sget p1, Ll/jbc0;->r6:I

    .line 69
    invoke-virtual {p0, p1}, Ll/b690;->d(I)Ll/b690;

    move-result-object p0

    .line 70
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 71
    :pswitch_8
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    .line 72
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    const-string p1, "\u76f4\u63a5\u5c4f\u853d\u9a9a\u6270\u8bcd"

    .line 73
    invoke-virtual {p0, p1}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 74
    const-string p1, "\u5e2e\u4f60\u76f4\u63a5\u62e6\u622a\u9a9a\u6270\u8bcd\uff0c\u804a\u5929\u66f4\u5b89\u5fc3"

    invoke-virtual {p0, p1}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 75
    invoke-virtual {p0, p1}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    sget p1, Ll/jbc0;->N:I

    .line 76
    invoke-virtual {p0, p1}, Ll/b690;->i(I)Ll/b690;

    move-result-object p0

    sget p1, Ll/jbc0;->r6:I

    .line 77
    invoke-virtual {p0, p1}, Ll/b690;->d(I)Ll/b690;

    move-result-object p0

    .line 78
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 79
    :pswitch_9
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    .line 80
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    const-string p1, "\u5e7f\u544a\u514d\u6253\u6270"

    .line 81
    invoke-virtual {p0, p1}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 82
    const-string p1, "\u4e00\u952e\u5173\u95ed\u5f00\u5c4f\u5e7f\u544a\uff0c\u9ad8\u6548\u793e\u4ea4\u65e0\u9700\u7b49\u5f85\uff0c24h\u540e\u751f\u6548"

    invoke-virtual {p0, p1}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 83
    invoke-virtual {p0, p1}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    sget p1, Ll/jbc0;->Q:I

    .line 84
    invoke-virtual {p0, p1}, Ll/b690;->i(I)Ll/b690;

    move-result-object p0

    sget p1, Ll/jbc0;->q6:I

    .line 85
    invoke-virtual {p0, p1}, Ll/b690;->d(I)Ll/b690;

    move-result-object p0

    .line 86
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 87
    :pswitch_a
    invoke-static {p0}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    move-result p0

    if-eqz p0, :cond_3

    .line 88
    invoke-static {}, Ll/c17;->u0()Z

    move-result p0

    if-eqz p0, :cond_2

    move-object v8, v9

    :cond_2
    move-object v9, v8

    .line 89
    :cond_3
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    const-string v0, "\u89e3\u9501\u66f4\u4e86\u89e3%s\u6a21\u5757"

    filled-new-array {v9}, [Ljava/lang/Object;

    move-result-object v1

    .line 90
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    filled-new-array {v9, v9}, [Ljava/lang/Object;

    move-result-object v0

    .line 91
    const-string v1, "\u4e86\u89e3%s\u7684\u6027\u683c\uff0c\u770b%s\u662f\u5426\u548c\u4f60\u5408\u62cd"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    filled-new-array {v9, v9}, [Ljava/lang/Object;

    move-result-object v0

    .line 92
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 93
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    .line 94
    invoke-static {}, Ll/c17;->u0()Z

    move-result p1

    if-eqz p1, :cond_4

    .line 95
    sget p1, Ll/jbc0;->P:I

    goto :goto_2

    .line 96
    :cond_4
    sget p1, Ll/jbc0;->I8:I

    .line 97
    :goto_2
    invoke-virtual {p0, p1}, Ll/b690;->i(I)Ll/b690;

    move-result-object p0

    .line 98
    invoke-static {}, Ll/c17;->u0()Z

    move-result p1

    if-eqz p1, :cond_5

    .line 99
    sget p1, Ll/jbc0;->p6:I

    goto :goto_3

    .line 100
    :cond_5
    sget p1, Ll/jbc0;->u6:I

    .line 101
    :goto_3
    invoke-virtual {p0, p1}, Ll/b690;->d(I)Ll/b690;

    move-result-object p0

    .line 102
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 103
    :pswitch_b
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    .line 104
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    const-string p1, "\u7cbe\u9009\u5c55\u793a\u7537\u6027\u7528\u6237\u63a2\u63a2\u4fe1\u7528\u5206"

    .line 105
    invoke-virtual {p0, p1}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 106
    const-string p1, "\u5e2e\u4f60\u901a\u8fc7\u771f\u4eba\u8ba4\u8bc1\uff0c\u771f\u5b9e\u5934\u50cf\uff0c\u4e3e\u62a5\u8bb0\u5f55\u7b49\u4fe1\u606f\u8bc4\u4f30\u7537\u6027\u7528\u6237"

    invoke-virtual {p0, p1}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 107
    invoke-virtual {p0, p1}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    sget p1, Ll/jbc0;->O:I

    .line 108
    invoke-virtual {p0, p1}, Ll/b690;->i(I)Ll/b690;

    move-result-object p0

    sget p1, Ll/jbc0;->t6:I

    .line 109
    invoke-virtual {p0, p1}, Ll/b690;->d(I)Ll/b690;

    move-result-object p0

    .line 110
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 111
    :pswitch_c
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    .line 112
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    .line 113
    invoke-static {}, Ll/joa;->u3()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    const-string v0, "\u6bcf\u5929%s\u6b21\u62a2\u5148\u544a\u767d"

    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 114
    invoke-virtual {p0, p1}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 115
    invoke-virtual {p0, v7}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 116
    invoke-virtual {p0, v7}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 117
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 118
    :pswitch_d
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object p0

    .line 119
    invoke-virtual {p0}, Ll/j49;->e()Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;

    move-result-object p0

    .line 120
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;->Xm()I

    move-result p0

    .line 121
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string v1, "\u6bcf\u6708%d\u6b21\u673a\u4f1a\uff0c\u5f00\u542f\u540e\u8bbf\u95ee\u5176\u4ed6\u4eba\uff0c\u5bf9\u65b9\u5c06\u4e0d\u4f1a\u770b\u5230\u4f60\u7684\u8bbf\u95ee\u8bb0\u5f55"

    invoke-static {v0, v1, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    .line 122
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 123
    invoke-virtual {v0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p1

    const-string v0, "\u9690\u85cf\u6211\u7684\u8bbf\u95ee\u8db3\u8ff9"

    .line 124
    invoke-virtual {p1, v0}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p1

    .line 125
    invoke-virtual {p1, p0}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p1

    .line 126
    invoke-virtual {p1, p0}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 127
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 128
    :pswitch_e
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    sget-object p1, Lcom/p1/mobile/putong/core/data/Privilege;->exclusive_dressing_up:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 129
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    const-string p1, "\u5c0a\u4eab\u88c5\u626e"

    .line 130
    invoke-virtual {p0, p1}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 131
    const-string p1, "\u81f3\u5c0a\u5408\u4f19\u4eba\u72ec\u4eab\u5361\u7247\u88c5\u626e"

    invoke-virtual {p0, p1}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 132
    invoke-virtual {p0, p1}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 133
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 134
    :pswitch_f
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    sget-object p1, Lcom/p1/mobile/putong/core/data/Privilege;->nearby_people:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 135
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    const-string p1, "\u9644\u8fd1\u7684\u4eba"

    .line 136
    invoke-virtual {p0, p1}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 137
    const-string p1, "\u6839\u636e\u60a8\u7684\u5730\u7406\u4f4d\u7f6e\uff0c\u4e3a\u60a8\u7cbe\u786e\u641c\u7d22\u9644\u8fd13\u516c\u91cc\u5185\u7684\u7528\u6237"

    invoke-virtual {p0, p1}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 138
    invoke-virtual {p0, p1}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 139
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 140
    :pswitch_10
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    sget-object p1, Lcom/p1/mobile/putong/core/data/Privilege;->mysterious_mode:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 141
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    const-string p1, "\u795e\u79d8\u6a21\u5f0f"

    .line 142
    invoke-virtual {p0, p1}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 143
    const-string p1, "\u795e\u79d8\u4eba\u6a21\u5f0f\uff0c\u4ecd\u53ef\u65a9\u83b7\u65e0\u9650\u559c\u6b22"

    invoke-virtual {p0, p1}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 144
    invoke-virtual {p0, p1}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 145
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 146
    :pswitch_11
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    sget-object p1, Lcom/p1/mobile/putong/core/data/Privilege;->personal_customization:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 147
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    .line 148
    invoke-virtual {p0, v6}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 149
    const-string p1, "\u6839\u636e\u60a8\u7684\u559c\u597d\uff0c\u7b5b\u9009\u51fa\u7b26\u5408\u60a8\u8981\u6c42\u7684\u7528\u6237\uff0c\u63d0\u5347\u60a8\u7684\u793e\u4ea4\u6548\u7387"

    invoke-virtual {p0, p1}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 150
    invoke-virtual {p0, p1}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 151
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 152
    :pswitch_12
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    sget-object p1, Lcom/p1/mobile/putong/core/data/Privilege;->city_topping:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 153
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    const-string p1, "\u57ce\u5e02\u7f6e\u9876"

    .line 154
    invoke-virtual {p0, p1}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 155
    const-string p1, "\u5728\u7ebf\u671f\u95f4\uff0c\u60a8\u7684\u8d44\u6599\u4f1a\u5728\u7b2c\u4e00\u4f4d\uff0c\u66dd\u5149\u7ed9\u6240\u5728\u57ce\u5e02\u4e2d\uff0c\u5168\u90e8\u7b26\u5408\u60a8\u7b5b\u9009\u8981\u6c42\u7684\u7528\u6237"

    invoke-virtual {p0, p1}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 156
    invoke-virtual {p0, p1}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 157
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 158
    :pswitch_13
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    sget-object p1, Lcom/p1/mobile/putong/core/data/Privilege;->accelerate_pairing:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 159
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    .line 160
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object p1

    invoke-virtual {p1}, Ll/j49;->e()Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;

    move-result-object p1

    invoke-interface {p1}, Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;->x6()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    .line 161
    const-string v0, "\u6bcf\u6708%s\u6b21\u52a0\u901f\u914d\u5bf9"

    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 162
    invoke-virtual {p0, p1}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 163
    const-string p1, "30\u5206\u949f\u5185\u628a\u4f60\u4f18\u5148\u63a8\u8350\u7ed9\u559c\u6b22\u7684\u4eba\uff0c\u65a9\u83b7\u6700\u591a10\u500d\u914d\u5bf9\uff01"

    invoke-virtual {p0, p1}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 164
    invoke-virtual {p0, p1}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 165
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 166
    :pswitch_14
    invoke-static {p0}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    move-result v0

    if-nez v0, :cond_7

    .line 167
    invoke-static {p0}, Ll/wib0;->j(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    move-result v0

    if-eqz v0, :cond_6

    goto :goto_4

    .line 168
    :cond_6
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    move-result-object v0

    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->h8()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "\u6bcf\u6708%s\u6b21\u52a8\u6001\u8d85\u7ea7\u66dd\u5149"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_5

    .line 169
    :cond_7
    :goto_4
    const-string v0, "\u5168\u7a0b\u52a8\u6001\u8d85\u7ea7\u66dd\u5149"

    .line 170
    :goto_5
    invoke-static {p0}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    move-result v1

    if-nez v1, :cond_9

    .line 171
    invoke-static {p0}, Ll/wib0;->j(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    move-result p0

    if-eqz p0, :cond_8

    goto :goto_6

    .line 172
    :cond_8
    const-string p0, "\u52a8\u6001\u667a\u80fd\u7cbe\u51c6\u6295\u653e\uff0c\u6536\u83b7\u5927\u91cf\u6d4f\u89c8\u4e92\u52a8"

    goto :goto_7

    .line 173
    :cond_9
    :goto_6
    const-string p0, "\u53d1\u5e03\u52a8\u6001\u5168\u7a0b\u5f00\u542f\u8d85\u7ea7\u66dd\u5149\uff0c\u6536\u83b7\u5927\u91cf\u70b9\u8d5e\u4e92\u52a8"

    .line 174
    :goto_7
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v1

    .line 175
    invoke-virtual {v1, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p1

    .line 176
    invoke-static {}, Ll/c17;->u0()Z

    move-result v1

    if-eqz v1, :cond_a

    .line 177
    sget v1, Ll/jbc0;->l0:I

    goto :goto_8

    .line 178
    :cond_a
    sget v1, Ll/jbc0;->k0:I

    .line 179
    :goto_8
    invoke-virtual {p1, v1}, Ll/b690;->i(I)Ll/b690;

    move-result-object p1

    .line 180
    invoke-virtual {p1, v0}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p1

    .line 181
    invoke-virtual {p1, p0}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p1

    .line 182
    invoke-virtual {p1, p0}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 183
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 184
    :pswitch_15
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    .line 185
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    .line 186
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object p1

    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I5()Z

    move-result p1

    if-eqz p1, :cond_b

    .line 187
    const-string p1, "\u6bcf\u59293\u6b21\u62a2\u5148\u544a\u767d"

    goto :goto_9

    .line 188
    :cond_b
    const-string p1, "\u6bcf\u59293\u6b21\u6253\u62db\u547c"

    .line 189
    :goto_9
    invoke-virtual {p0, p1}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 190
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object p1

    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I5()Z

    move-result p1

    const-string v0, "\u5411%s\u4e3b\u52a8\u8868\u767d\uff0c\u771f\u8bda\u8d62\u5f97\u5bf9\u65b9\u7684\u5fc3"

    if-eqz p1, :cond_c

    move-object p1, v7

    goto :goto_b

    .line 191
    :cond_c
    invoke-static {}, Ll/c17;->u0()Z

    move-result p1

    if-eqz p1, :cond_d

    move-object p1, v9

    goto :goto_a

    :cond_d
    move-object p1, v8

    :goto_a
    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 192
    :goto_b
    invoke-virtual {p0, p1}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 193
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object p1

    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I5()Z

    move-result p1

    if-eqz p1, :cond_e

    goto :goto_c

    .line 194
    :cond_e
    invoke-static {}, Ll/c17;->u0()Z

    move-result p1

    if-eqz p1, :cond_f

    move-object v8, v9

    :cond_f
    filled-new-array {v8}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    .line 195
    :goto_c
    invoke-virtual {p0, v7}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 196
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 197
    :pswitch_16
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 198
    invoke-virtual {v0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p1

    const-string v0, "\u4e13\u5c5e\u5ba2\u670d"

    .line 199
    invoke-virtual {p1, v0}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p1

    .line 200
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SUPREME_PARTNER:Lcom/p1/mobile/putong/core/data/PurchaseType;

    const-string v1, "\u4e00\u5bf9\u4e00\u4e13\u5c5e\u5ba2\u670d\uff0c\u4e3a\u4f60\u7684\u4f53\u9a8c\u4fdd\u9a7e\u62a4\u822a"

    const-string v2, "\u4e00\u5bf9\u4e00\u4e13\u5c5e\u5ba2\u670d\uff0c\u4e3a\u60a8\u7684\u4f53\u9a8c\u4fdd\u9a7e\u62a4\u822a"

    if-ne p0, v0, :cond_10

    move-object v3, v2

    goto :goto_d

    :cond_10
    move-object v3, v1

    .line 201
    :goto_d
    invoke-virtual {p1, v3}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p1

    if-ne p0, v0, :cond_11

    move-object v1, v2

    .line 202
    :cond_11
    invoke-virtual {p1, v1}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 203
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 204
    :pswitch_17
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    .line 205
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    .line 206
    invoke-static {}, Ll/c17;->u0()Z

    move-result p1

    if-eqz p1, :cond_12

    .line 207
    sget p1, Ll/jbc0;->f0:I

    goto :goto_e

    .line 208
    :cond_12
    sget p1, Ll/jbc0;->e0:I

    .line 209
    :goto_e
    invoke-virtual {p0, p1}, Ll/b690;->d(I)Ll/b690;

    move-result-object p0

    .line 210
    invoke-static {}, Ll/c17;->u0()Z

    move-result p1

    if-eqz p1, :cond_13

    .line 211
    sget p1, Ll/jbc0;->d0:I

    goto :goto_f

    .line 212
    :cond_13
    sget p1, Ll/jbc0;->c0:I

    .line 213
    :goto_f
    invoke-virtual {p0, p1}, Ll/b690;->i(I)Ll/b690;

    move-result-object p0

    const-string p1, "\u76f4\u64ad\u95f4\u5fbd\u7ae0 \u5165\u573a\u7279\u6548"

    .line 214
    invoke-virtual {p0, p1}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 215
    const-string p1, "\u4e13\u5c5e\u5fbd\u7ae0\u548c\u5165\u573a\u7279\u6548\uff0c\u6210\u4e3a\u5168\u573a\u6700\u95ea\u4eae\u7684\u661f"

    invoke-virtual {p0, p1}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 216
    invoke-virtual {p0, p1}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 217
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 218
    :pswitch_18
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 219
    invoke-virtual {v0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p1

    .line 220
    invoke-static {}, Ll/c17;->u0()Z

    move-result v0

    if-eqz v0, :cond_14

    .line 221
    sget v0, Ll/jbc0;->h0:I

    goto :goto_10

    .line 222
    :cond_14
    sget v0, Ll/jbc0;->g0:I

    .line 223
    :goto_10
    invoke-virtual {p1, v0}, Ll/b690;->d(I)Ll/b690;

    move-result-object p1

    .line 224
    invoke-static {}, Ll/c17;->u0()Z

    move-result v0

    if-eqz v0, :cond_15

    .line 225
    sget v0, Ll/jbc0;->r4:I

    goto :goto_11

    .line 226
    :cond_15
    sget v0, Ll/jbc0;->s4:I

    .line 227
    :goto_11
    invoke-virtual {p1, v0}, Ll/b690;->i(I)Ll/b690;

    move-result-object p1

    const-string v0, "\u4e00\u952e\u914d\u5bf9"

    .line 228
    invoke-virtual {p1, v0}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p1

    .line 229
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SUPREME_PARTNER:Lcom/p1/mobile/putong/core/data/PurchaseType;

    const-string v1, "\u4e00\u952e\u4e0e\u7406\u60f3\u578b\u914d\u5bf9\u5f00\u804a\uff0c\u4f60\u7684\u559c\u6b22\u65e0\u9700\u7b49\u5f85\uff0c\u5c0a\u4eab\u6bcf\u5929%s\u6b21\u5f00\u6302\u5f0f\u4f53\u9a8c"

    const/4 v2, 0x5

    const-string v3, "\u4e00\u952e\u5f00\u804a\uff0c\u65e0\u9700\u7b49\u5f85\uff0c\u6bcf\u5929%s\u6b21\u5f00\u6302\u4f53\u9a8c!"

    if-ne p0, v0, :cond_16

    .line 230
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    goto :goto_12

    .line 231
    :cond_16
    invoke-static {}, Ll/c690;->a()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    .line 232
    invoke-static {v1, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 233
    :goto_12
    invoke-virtual {p1, v4}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p1

    if-ne p0, v0, :cond_17

    .line 234
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {v3, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    goto :goto_13

    .line 235
    :cond_17
    invoke-static {}, Ll/c690;->a()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    .line 236
    invoke-static {v1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    .line 237
    :goto_13
    invoke-virtual {p1, p0}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 238
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 239
    :pswitch_19
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    .line 240
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    const-string p1, "https://auto.tancdn.com/v1/images/eyJpZCI6IjY5NTcwM0Y2MjE1MTQ1NjI4QUExNTU0QjNCMjBERTVFIiwidyI6NDc0LCJoIjoyNTQsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo4Njc1MTI1MzU3OTIwOTQ3MzQsInB0IjoyMDI2MDIwMzE3fQ.png"

    .line 241
    invoke-virtual {p0, p1}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    move-result-object p0

    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->e3:I

    .line 242
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    .line 243
    invoke-static {}, Ll/joa;->s3()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    .line 244
    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 245
    invoke-virtual {p0, p1}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->d3:I

    .line 246
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->d3:I

    .line 247
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 248
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 249
    :pswitch_1a
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    .line 250
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    const-string p1, "https://auto.tancdn.com/v1/images/eyJpZCI6IlFFM0hMVTQ3M0haWklWVUk0MkdOSzRBQUxPRlQyRDE0IiwidyI6NzExLCJoIjozODEsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo4Njg2NDcyMTQ2MTIwOTAzODJ9.png"

    .line 251
    invoke-virtual {p0, p1}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    move-result-object p0

    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->r3:I

    .line 252
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->q3:I

    .line 253
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->q3:I

    .line 254
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 255
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 256
    :pswitch_1b
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    .line 257
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    const-string p1, "https://auto.tancdn.com/v1/raw/7e034371-9f6f-4254-95c6-16b0937f6d2b13.webp"

    .line 258
    invoke-virtual {p0, p1}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    move-result-object p0

    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->o3:I

    .line 259
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->w6:I

    .line 260
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    .line 261
    invoke-virtual {p0, p1}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->w6:I

    .line 262
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    .line 263
    invoke-virtual {p0, p1}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 264
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 265
    :pswitch_1c
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    .line 266
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    .line 267
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object p1

    invoke-virtual {p1}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    move-result-object p1

    invoke-interface {p1}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Bs()Z

    move-result p1

    if-eqz p1, :cond_18

    .line 268
    const-string p1, "https://auto.tancdn.com/v1/raw/85663437-d130-4bc7-bba1-5821f0b7943c12.webp"

    goto :goto_14

    .line 269
    :cond_18
    const-string p1, "https://auto.tancdn.com/v1/images/eyJpZCI6IkZPVFE3SVBPRVJWSE1FQ1JSNklUUjdSUkk1M1pXVTEzIiwidyI6NzExLCJoIjozODEsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxMTE3NzE0NjExMDk3MjM5NzMxOH0.png"

    .line 270
    :goto_14
    invoke-virtual {p0, p1}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    move-result-object p0

    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->Z2:I

    .line 271
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 272
    invoke-static {}, Ll/j690;->h()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 273
    invoke-static {}, Ll/j690;->h()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 274
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 275
    :pswitch_1d
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    .line 276
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    .line 277
    invoke-static {}, Ll/c17;->u0()Z

    move-result p1

    if-eqz p1, :cond_19

    .line 278
    sget p1, Ll/jbc0;->j0:I

    goto :goto_15

    .line 279
    :cond_19
    sget p1, Ll/jbc0;->i0:I

    .line 280
    :goto_15
    invoke-virtual {p0, p1}, Ll/b690;->d(I)Ll/b690;

    move-result-object p0

    const-string p1, "\u6211\u7684\u8bbf\u5ba2"

    .line 281
    invoke-virtual {p0, p1}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 282
    const-string p1, "\u77e5\u6653\u8c01\u770b\u8fc7\u6211\u7684\u8d44\u6599\u548c\u52a8\u6001\uff0c\u4e0d\u9519\u8fc7\u6bcf\u4e2a\u9ed8\u9ed8\u5173\u5fc3\u6211\u7684\u4eba"

    invoke-virtual {p0, p1}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 283
    invoke-virtual {p0, p1}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 284
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 285
    :pswitch_1e
    invoke-static {}, Ll/c17;->u0()Z

    move-result p0

    if-eqz p0, :cond_1a

    const-string p0, "\u65e0\u9700\u9001\u793c\u7269\uff0c\u968f\u65f6\u5411\u4ed6\u6253\u62db\u547c"

    goto :goto_16

    :cond_1a
    const-string p0, "\u65e0\u9700\u9001\u793c\u7269\uff0c\u968f\u65f6\u5411\u5979\u6253\u62db\u547c"

    .line 286
    :goto_16
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object v0

    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I5()Z

    move-result v0

    if-eqz v0, :cond_1b

    goto :goto_17

    :cond_1b
    move-object v7, p0

    .line 287
    :goto_17
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    .line 288
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    .line 289
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object p1

    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I5()Z

    move-result p1

    if-eqz p1, :cond_1c

    const-string p1, "\u65e0\u9650\u62a2\u5148\u544a\u767d"

    goto :goto_18

    :cond_1c
    const-string p1, "\u65e0\u9650\u6253\u62db\u547c"

    .line 290
    :goto_18
    invoke-virtual {p0, p1}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 291
    invoke-virtual {p0, v7}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 292
    invoke-virtual {p0, v7}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 293
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 294
    :pswitch_1f
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    .line 295
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    const-string p1, "\u4e13\u5c5e\u5c0a\u8d35\u76ae\u80a4"

    .line 296
    invoke-virtual {p0, p1}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 297
    const-string p1, "\u4e13\u5c5e\u88c5\u626e\u8fb9\u6846\uff0c\u968f\u65f6\u5f70\u663e\u4e0e\u4f17\u4e0d\u540c"

    invoke-virtual {p0, p1}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 298
    invoke-virtual {p0, p1}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 299
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 300
    :pswitch_20
    sget p0, Ll/jbc0;->e5:I

    .line 301
    sget v0, Ll/jbc0;->d5:I

    .line 302
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v1

    .line 303
    invoke-virtual {v1, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p1

    .line 304
    invoke-virtual {p1, v0}, Ll/b690;->d(I)Ll/b690;

    move-result-object p1

    .line 305
    invoke-virtual {p1, p0}, Ll/b690;->i(I)Ll/b690;

    move-result-object p0

    const-string p1, "SVIP\u5404\u9879\u7279\u6743"

    .line 306
    invoke-virtual {p0, p1}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 307
    const-string p1, "\u5305\u542b\u89e3\u5bc6\u8c01\u559c\u6b22\u6211\u3001\u9ad8\u7ea7\u7b5b\u9009\u3001\u9690\u79c1\u4fdd\u62a4\u7b49\u5168\u90e8SVIP\u7279\u6743"

    invoke-virtual {p0, p1}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 308
    invoke-virtual {p0, p1}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 309
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 310
    :pswitch_21
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->W2:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    .line 311
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->V2:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 312
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v1

    .line 313
    invoke-virtual {v1, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p1

    const-string v1, "https://auto.tancdn.com/v1/images/eyJpZCI6IjZEWklIQ0dUN0FKSUZSNU5WQ0lZNlRXN0I0NlFEWjE0IiwidyI6NzExLCJoIjozODEsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo4Njg2Mzg0MzU2OTg5MzczNTh9.png"

    .line 314
    invoke-virtual {p1, v1}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    move-result-object p1

    .line 315
    invoke-virtual {p1, p0}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 316
    invoke-virtual {p0, v0}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 317
    invoke-virtual {p0, v0}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 318
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 319
    :pswitch_22
    invoke-static {}, Ll/j690;->C()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string v0, "\u5305\u542b\u63ed\u79d8\u559c\u6b22\u6211\u7684\u4eba\u3001\u95ea\u804a\u5339\u914d\u3001\u6bcf\u67083\u6b21\u4f18\u5148\u63a8\u8350\u7b49\u5168\u90e8%s\u9879\u7279\u6743"

    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    .line 320
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 321
    invoke-virtual {v0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p1

    sget v0, Ll/jbc0;->M5:I

    .line 322
    invoke-virtual {p1, v0}, Ll/b690;->i(I)Ll/b690;

    move-result-object p1

    .line 323
    invoke-static {}, Ll/j690;->C()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "SVIP\u5168\u90e8%s\u9879\u7279\u6743"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p1

    .line 324
    invoke-virtual {p1, p0}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p1

    .line 325
    invoke-virtual {p1, p0}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 326
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 327
    :pswitch_23
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    move-result-object p0

    .line 328
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1e

    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    move-result v0

    if-nez v0, :cond_1d

    goto :goto_19

    .line 329
    :cond_1d
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->m3:I

    goto :goto_1a

    .line 330
    :cond_1e
    :goto_19
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v0

    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v0

    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->G7()Z

    move-result v0

    if-eqz v0, :cond_1f

    .line 331
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->l3:I

    goto :goto_1a

    .line 332
    :cond_1f
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->n3:I

    .line 333
    :goto_1a
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_21

    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    move-result p0

    if-nez p0, :cond_20

    goto :goto_1b

    .line 334
    :cond_20
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->j3:I

    goto :goto_1c

    .line 335
    :cond_21
    :goto_1b
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object p0

    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object p0

    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->G7()Z

    move-result p0

    if-eqz p0, :cond_22

    .line 336
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->i3:I

    goto :goto_1c

    .line 337
    :cond_22
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->k3:I

    .line 338
    :goto_1c
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v1

    .line 339
    invoke-virtual {v1, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p1

    sget v1, Ll/jbc0;->f8:I

    .line 340
    invoke-virtual {p1, v1}, Ll/b690;->i(I)Ll/b690;

    move-result-object p1

    .line 341
    invoke-virtual {p1, v0}, Ll/b690;->n(I)Ll/b690;

    move-result-object p1

    .line 342
    invoke-virtual {p1, p0}, Ll/b690;->l(I)Ll/b690;

    move-result-object p1

    .line 343
    invoke-virtual {p1, p0}, Ll/b690;->f(I)Ll/b690;

    move-result-object p0

    .line 344
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 345
    :pswitch_24
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object p0

    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object p0

    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->eg()Z

    move-result p0

    if-eqz p0, :cond_23

    .line 346
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->u8:I

    goto :goto_1d

    .line 347
    :cond_23
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->t8:I

    .line 348
    :goto_1d
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 349
    invoke-virtual {v0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p1

    sget v0, Ll/jbc0;->i8:I

    .line 350
    invoke-virtual {p1, v0}, Ll/b690;->i(I)Ll/b690;

    move-result-object p1

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->v8:I

    .line 351
    invoke-virtual {p1, v0}, Ll/b690;->n(I)Ll/b690;

    move-result-object p1

    .line 352
    invoke-virtual {p1, p0}, Ll/b690;->l(I)Ll/b690;

    move-result-object p1

    .line 353
    invoke-virtual {p1, p0}, Ll/b690;->f(I)Ll/b690;

    move-result-object p0

    .line 354
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 355
    :pswitch_25
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object p0

    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object p0

    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->eg()Z

    move-result p0

    if-eqz p0, :cond_24

    .line 356
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->r8:I

    goto :goto_1e

    .line 357
    :cond_24
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->q8:I

    .line 358
    :goto_1e
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 359
    invoke-virtual {v0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p1

    sget v0, Ll/jbc0;->j8:I

    .line 360
    invoke-virtual {p1, v0}, Ll/b690;->i(I)Ll/b690;

    move-result-object p1

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->s8:I

    .line 361
    invoke-virtual {p1, v0}, Ll/b690;->n(I)Ll/b690;

    move-result-object p1

    .line 362
    invoke-virtual {p1, p0}, Ll/b690;->l(I)Ll/b690;

    move-result-object p1

    .line 363
    invoke-virtual {p1, p0}, Ll/b690;->f(I)Ll/b690;

    move-result-object p0

    .line 364
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 365
    :pswitch_26
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    move-result-object p0

    .line 366
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_27

    .line 367
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    if-eqz p0, :cond_25

    .line 368
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Settings;->lookingFor:Lcom/p1/mobile/putong/data/LookingFor;

    const-string v1, "female"

    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_25

    .line 369
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->n8:I

    goto :goto_1f

    :cond_25
    if-eqz p0, :cond_26

    .line 370
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Settings;->lookingFor:Lcom/p1/mobile/putong/data/LookingFor;

    const-string v0, "male"

    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_26

    .line 371
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->o8:I

    goto :goto_1f

    .line 372
    :cond_26
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->m8:I

    goto :goto_1f

    .line 373
    :cond_27
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->m8:I

    .line 374
    :goto_1f
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 375
    invoke-virtual {v0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p1

    sget v0, Ll/jbc0;->h8:I

    .line 376
    invoke-virtual {p1, v0}, Ll/b690;->i(I)Ll/b690;

    move-result-object p1

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->p8:I

    .line 377
    invoke-virtual {p1, v0}, Ll/b690;->n(I)Ll/b690;

    move-result-object p1

    .line 378
    invoke-virtual {p1, p0}, Ll/b690;->l(I)Ll/b690;

    move-result-object p1

    .line 379
    invoke-virtual {p1, p0}, Ll/b690;->f(I)Ll/b690;

    move-result-object p0

    .line 380
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 381
    :pswitch_27
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    if-ne p0, v0, :cond_28

    .line 382
    const-string p0, "https://auto.tancdn.com/v1/raw/be3eb17b-9d4e-48dc-b971-7d84414e73c811.webp"

    goto :goto_20

    .line 383
    :cond_28
    const-string p0, "https://auto.tancdn.com/v1/raw/45513e7b-3754-4ca0-85f8-96f11d94b80710.webp"

    .line 384
    :goto_20
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 385
    invoke-virtual {v0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p1

    .line 386
    invoke-virtual {p1, p0}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->P6:I

    .line 387
    invoke-virtual {p0, p1}, Ll/b690;->n(I)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->O6:I

    .line 388
    invoke-virtual {p0, p1}, Ll/b690;->l(I)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->O6:I

    .line 389
    invoke-virtual {p0, p1}, Ll/b690;->f(I)Ll/b690;

    move-result-object p0

    .line 390
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 391
    :pswitch_28
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    .line 392
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    .line 393
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    move-result p1

    if-eqz p1, :cond_29

    .line 394
    const-string p1, "https://auto.tancdn.com/v1/images/eyJpZCI6IktXQkVFRzZHMkZGQU8yRzdXTzNTN01SUlhDREhPSzEzIiwidyI6NzExLCJoIjozODEsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozNjg5MzQ4ODQ5NzcyNzI5MTM5fQ.png"

    goto :goto_21

    .line 395
    :cond_29
    const-string p1, "https://auto.tancdn.com/v1/images/eyJpZCI6IlNXNTNKU0ZKVFdNSk5HNU5YNDJGSkZJUlhRVldFUTE0IiwidyI6NzExLCJoIjozODEsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxNTkxNzY2MzgxNzc2MjgxMzk0fQ.png"

    .line 396
    :goto_21
    invoke-virtual {p0, p1}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    move-result-object p0

    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->u3:I

    .line 397
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->Z3:I

    .line 398
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->Z3:I

    .line 399
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 400
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 401
    :pswitch_29
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    if-ne p0, v0, :cond_2a

    .line 402
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IloyWFdESVVWRkNLUFhZNUFYNFZZRFBTTFRZUkhHRTEwIiwidyI6NDc0LCJoIjoyNTQsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoyMTc2OTQyOTIzMjkwOTA4MTc0fQ.png"

    goto :goto_22

    .line 403
    :cond_2a
    const-string p0, "https://auto.tancdn.com/v1/raw/6375caf8-5b50-4426-be1f-a3b88a12fe6e11.webp"

    .line 404
    :goto_22
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 405
    invoke-virtual {v0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p1

    .line 406
    invoke-virtual {p1, p0}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->E3:I

    .line 407
    invoke-virtual {p0, p1}, Ll/b690;->n(I)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->F3:I

    .line 408
    invoke-virtual {p0, p1}, Ll/b690;->l(I)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->G3:I

    .line 409
    invoke-virtual {p0, p1}, Ll/b690;->f(I)Ll/b690;

    move-result-object p0

    .line 410
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 411
    :pswitch_2a
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    if-ne p0, v0, :cond_2b

    .line 412
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkhTU0dQRTZPTkRBRFpCSkdQQTJORExPVkc2Q0Y0RjEwIiwidyI6NDc0LCJoIjoyNTQsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxMDIyODk1NTIzMzkwOTUwOTM0fQ.png"

    goto :goto_23

    .line 413
    :cond_2b
    const-string p0, "https://auto.tancdn.com/v1/raw/7b981e39-f2fa-4441-9cd3-7908c69650ab10.webp"

    .line 414
    :goto_23
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 415
    invoke-virtual {v0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p1

    .line 416
    invoke-virtual {p1, p0}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->H3:I

    .line 417
    invoke-virtual {p0, p1}, Ll/b690;->n(I)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->I3:I

    .line 418
    invoke-virtual {p0, p1}, Ll/b690;->l(I)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->J3:I

    .line 419
    invoke-virtual {p0, p1}, Ll/b690;->f(I)Ll/b690;

    move-result-object p0

    .line 420
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 421
    :pswitch_2b
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    .line 422
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    sget p1, Ll/jbc0;->rc:I

    .line 423
    invoke-virtual {p0, p1}, Ll/b690;->i(I)Ll/b690;

    move-result-object p0

    sget p1, Ll/jbc0;->qc:I

    .line 424
    invoke-virtual {p0, p1}, Ll/b690;->e(I)Ll/b690;

    move-result-object p0

    sget p1, Ll/h9c0;->k0:I

    sget v0, Ll/h9c0;->j0:I

    .line 425
    invoke-virtual {p0, p1, v0}, Ll/b690;->h(II)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->T2:I

    .line 426
    invoke-virtual {p0, p1}, Ll/b690;->n(I)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->S2:I

    .line 427
    invoke-virtual {p0, p1}, Ll/b690;->l(I)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->S2:I

    .line 428
    invoke-virtual {p0, p1}, Ll/b690;->f(I)Ll/b690;

    move-result-object p0

    .line 429
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 430
    :pswitch_2c
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    if-ne p0, v0, :cond_2c

    .line 431
    const-string p0, "https://auto.tancdn.com/v1/raw/d4b2a799-22f7-4973-ac67-1b2084a0ea5310.webp"

    goto :goto_24

    .line 432
    :cond_2c
    const-string p0, "https://auto.tancdn.com/v1/raw/8a5d2dc5-4f66-4903-b7f7-eec6197d5b1711.webp"

    .line 433
    :goto_24
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 434
    invoke-virtual {v0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p1

    .line 435
    invoke-virtual {p1, p0}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->G2:I

    .line 436
    invoke-virtual {p0, p1}, Ll/b690;->n(I)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->H2:I

    .line 437
    invoke-virtual {p0, p1}, Ll/b690;->l(I)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->I2:I

    .line 438
    invoke-virtual {p0, p1}, Ll/b690;->f(I)Ll/b690;

    move-result-object p0

    .line 439
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 440
    :pswitch_2d
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object p0

    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object p0

    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    move-result p0

    if-eqz p0, :cond_2e

    .line 441
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->P0:I

    .line 442
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    .line 443
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->P0:I

    .line 444
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 445
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v1

    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v1

    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->z1()Z

    move-result v1

    if-eqz v1, :cond_2d

    .line 446
    const-string p0, "\u4f18\u5148\u770b\u771f\u5b9e\u5934\u50cf\u8ba4\u8bc1\u3001\u6700\u53d7\u6b22\u8fce\u3001\u5f53\u524d\u5728\u7ebf\u7684\u7528\u6237\uff0c\u53ea\u770b\u6211\u7684\u7406\u60f3\u578b"

    move-object v0, p0

    .line 447
    :cond_2d
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v1

    .line 448
    invoke-virtual {v1, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p1

    sget v1, Ll/jbc0;->p:I

    .line 449
    invoke-virtual {p1, v1}, Ll/b690;->i(I)Ll/b690;

    move-result-object p1

    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->Q0:I

    .line 450
    invoke-virtual {p1, v1}, Ll/b690;->n(I)Ll/b690;

    move-result-object p1

    .line 451
    invoke-virtual {p1, v0}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p1

    .line 452
    invoke-virtual {p1, p0}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 453
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 454
    :cond_2e
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object p0

    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object p0

    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    move-result p0

    const-string v0, "\u66f4\u591a\u7b5b\u9009\u6761\u4ef6\uff0c\u9047\u89c1\u76f8\u4f3c\u7684\u4eba"

    if-eqz p0, :cond_2f

    move-object p0, v0

    goto :goto_25

    .line 455
    :cond_2f
    const-string p0, "\u66f4\u591a\u7b5b\u9009\u6761\u4ef6\n\u9047\u89c1\u76f8\u4f3c\u7684\u4eba"

    .line 456
    :goto_25
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v1

    .line 457
    invoke-virtual {v1, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p1

    sget v1, Ll/jbc0;->p:I

    .line 458
    invoke-virtual {p1, v1}, Ll/b690;->i(I)Ll/b690;

    move-result-object p1

    const-string v1, "\u9ad8\u7ea7\u7b5b\u9009"

    .line 459
    invoke-virtual {p1, v1}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p1

    .line 460
    invoke-virtual {p1, v0}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p1

    .line 461
    invoke-virtual {p1, p0}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 462
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 463
    :pswitch_2e
    invoke-static {}, Ll/c17;->u0()Z

    move-result p0

    .line 464
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 465
    invoke-virtual {v0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p1

    if-eqz p0, :cond_30

    .line 466
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->V0:I

    goto :goto_26

    .line 467
    :cond_30
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->U0:I

    .line 468
    :goto_26
    invoke-virtual {p1, v0}, Ll/b690;->n(I)Ll/b690;

    move-result-object p1

    if-eqz p0, :cond_31

    .line 469
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->T0:I

    goto :goto_27

    .line 470
    :cond_31
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->S0:I

    .line 471
    :goto_27
    invoke-virtual {p1, v0}, Ll/b690;->l(I)Ll/b690;

    move-result-object p1

    if-eqz p0, :cond_32

    .line 472
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->T0:I

    goto :goto_28

    .line 473
    :cond_32
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->S0:I

    .line 474
    :goto_28
    invoke-virtual {p1, p0}, Ll/b690;->f(I)Ll/b690;

    move-result-object p0

    .line 475
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object p1

    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object p1

    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->fo()I

    move-result p1

    invoke-virtual {p0, p1}, Ll/b690;->i(I)Ll/b690;

    move-result-object p0

    .line 476
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 477
    :pswitch_2f
    invoke-static {}, Ll/c17;->u0()Z

    move-result p0

    .line 478
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 479
    invoke-virtual {v0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p1

    const-string v0, "\u6bcf\u59295\u6761\"\u8d44\u6599\u7559\u8a00\""

    .line 480
    invoke-virtual {p1, v0}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p1

    if-nez p0, :cond_33

    .line 481
    sget v0, Ll/jbc0;->sa:I

    goto :goto_29

    .line 482
    :cond_33
    sget v0, Ll/jbc0;->ta:I

    .line 483
    :goto_29
    invoke-virtual {p1, v0}, Ll/b690;->i(I)Ll/b690;

    move-result-object p1

    if-nez p0, :cond_34

    move-object v0, v8

    goto :goto_2a

    :cond_34
    move-object v0, v9

    .line 484
    :goto_2a
    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "\u8ba9%s\u7b2c\u4e00\u65f6\u95f4\u770b\u5230\u4f60\uff0c\u914d\u5bf9\u51e0\u7387\u63d0\u53473\u500d"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p1

    if-nez p0, :cond_35

    goto :goto_2b

    :cond_35
    move-object v8, v9

    .line 485
    :goto_2b
    filled-new-array {v8}, [Ljava/lang/Object;

    move-result-object p0

    const-string v0, "\u901a\u8fc7\u7ed9\u8d44\u6599\u7559\u8a00\uff0c\u8ba9%s\u7b2c\u4e00\u65f6\u95f4\u770b\u5230\u4f60\uff0c\u914d\u5bf9\u51e0\u7387\u63d0\u53473\u500d"

    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    .line 486
    invoke-virtual {p1, p0}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 487
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 488
    :pswitch_30
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->l6:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    .line 489
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->k6:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 490
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v1

    .line 491
    invoke-virtual {v1, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p1

    const-string v1, "https://auto.tancdn.com/v1/raw/1e055c6e-1294-4455-b39b-25165fc3c4a112.webp"

    .line 492
    invoke-virtual {p1, v1}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    move-result-object p1

    .line 493
    invoke-virtual {p1, p0}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 494
    invoke-virtual {p0, v0}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 495
    invoke-virtual {p0, v0}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 496
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 497
    :pswitch_31
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    .line 498
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    const-string p1, "\u4f1a\u5458\u4e13\u4eab\u793c\u7269"

    .line 499
    invoke-virtual {p0, p1}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    sget p1, Ll/jbc0;->la:I

    .line 500
    invoke-virtual {p0, p1}, Ll/b690;->i(I)Ll/b690;

    move-result-object p0

    sget p1, Ll/jbc0;->m0:I

    .line 501
    invoke-virtual {p0, p1}, Ll/b690;->d(I)Ll/b690;

    move-result-object p0

    .line 502
    const-string p1, "\u6bcf\u6708\u4e13\u4eab10\u4e2a\u793c\u7269\uff0c\u5411\u559c\u6b22\u7684\u4eba\u6253\u62db\u547c\u8868\u8fbe\u7279\u522b\u5fc3\u610f"

    invoke-virtual {p0, p1}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 503
    invoke-virtual {p0, p1}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 504
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 505
    :pswitch_32
    invoke-static {}, Ll/c17;->u0()Z

    move-result p0

    if-eqz p0, :cond_36

    .line 506
    const-string v0, "\u5728\u4ed6\u6536\u5230\u7684\u6d88\u606f\u4e2d\u7f6e\u9876\uff0c\u66f4\u5feb\u6536\u5230\u56de\u590d\uff01"

    goto :goto_2c

    :cond_36
    const-string v0, "\u5728\u5979\u6536\u5230\u7684\u6d88\u606f\u4e2d\u7f6e\u9876\uff0c\u66f4\u5feb\u6536\u5230\u56de\u590d\uff01"

    .line 507
    :goto_2c
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v1

    .line 508
    invoke-virtual {v1, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p1

    if-eqz p0, :cond_37

    .line 509
    const-string v1, "\u6210\u4e3a\u4ed6\u7684\u7f6e\u9876\u804a\u5929"

    goto :goto_2d

    :cond_37
    const-string v1, "\u6210\u4e3a\u5979\u7684\u7f6e\u9876\u804a\u5929"

    :goto_2d
    invoke-virtual {p1, v1}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p1

    if-eqz p0, :cond_38

    .line 510
    sget v1, Ll/jbc0;->p0:I

    goto :goto_2e

    .line 511
    :cond_38
    sget v1, Ll/jbc0;->o0:I

    .line 512
    :goto_2e
    invoke-virtual {p1, v1}, Ll/b690;->i(I)Ll/b690;

    move-result-object p1

    if-eqz p0, :cond_39

    .line 513
    sget p0, Ll/jbc0;->ia:I

    goto :goto_2f

    .line 514
    :cond_39
    sget p0, Ll/jbc0;->ha:I

    .line 515
    :goto_2f
    invoke-virtual {p1, p0}, Ll/b690;->d(I)Ll/b690;

    move-result-object p0

    .line 516
    invoke-virtual {p0, v0}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 517
    invoke-virtual {p0, v0}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 518
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 519
    :pswitch_33
    invoke-static {}, Ll/c17;->u0()Z

    move-result p0

    if-eqz p0, :cond_3a

    move-object v0, v9

    goto :goto_30

    :cond_3a
    move-object v0, v8

    .line 520
    :goto_30
    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "\u8ba9%s\u7b2c\u4e00\u4e2a\u6ed1\u5230\u4f60\uff0c\u6bcf\u59293\u6b21\u62a2\u5360\u914d\u5bf9\u5148\u673a\uff01"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    if-eqz p0, :cond_3b

    .line 521
    sget v1, Ll/jbc0;->r0:I

    goto :goto_31

    .line 522
    :cond_3b
    sget v1, Ll/jbc0;->q0:I

    :goto_31
    if-eqz p0, :cond_3c

    .line 523
    sget v2, Ll/jbc0;->ka:I

    goto :goto_32

    .line 524
    :cond_3c
    sget v2, Ll/jbc0;->ja:I

    .line 525
    :goto_32
    invoke-static {}, Ll/s7a;->r()Z

    move-result v3

    if-eqz v3, :cond_3f

    if-eqz p0, :cond_3d

    move-object v8, v9

    .line 526
    :cond_3d
    filled-new-array {v8}, [Ljava/lang/Object;

    move-result-object p0

    const-string v0, "\u8ba9%s\u7b2c\u4e00\u4e2a\u6ed1\u5230\u4f60\u7684\u5361\u7247\uff0c\u6bcf\u59293\u6b21\u62a2\u5360\u914d\u5bf9\u5148\u673a\uff01"

    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 527
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    move-result-object p0

    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    move-result p0

    if-eqz p0, :cond_3e

    .line 528
    sget p0, Ll/jbc0;->S5:I

    :goto_33
    move v2, p0

    goto :goto_34

    .line 529
    :cond_3e
    sget p0, Ll/jbc0;->T5:I

    goto :goto_33

    :goto_34
    const-string p0, "\u5361\u7247\u63d2\u961f"

    goto :goto_35

    .line 530
    :cond_3f
    const-string p0, "\u7f6e\u9876\u559c\u6b22"

    .line 531
    :goto_35
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v3

    .line 532
    invoke-virtual {v3, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p1

    .line 533
    invoke-virtual {p1, p0}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 534
    invoke-virtual {p0, v1}, Ll/b690;->i(I)Ll/b690;

    move-result-object p0

    .line 535
    invoke-virtual {p0, v2}, Ll/b690;->d(I)Ll/b690;

    move-result-object p0

    .line 536
    invoke-virtual {p0, v0}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 537
    invoke-virtual {p0, v0}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 538
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 539
    :pswitch_34
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    .line 540
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    const-string p1, "\u4e13\u5c5e\u793c\u7269"

    .line 541
    invoke-virtual {p0, p1}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    sget p1, Ll/jbc0;->ga:I

    .line 542
    invoke-virtual {p0, p1}, Ll/b690;->i(I)Ll/b690;

    move-result-object p0

    sget p1, Ll/jbc0;->n0:I

    .line 543
    invoke-virtual {p0, p1}, Ll/b690;->d(I)Ll/b690;

    move-result-object p0

    const-string p1, "2"

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object v0

    .line 544
    const-string v1, "\u6bcf\u5929%s\u4e2a\u514d\u8d39\u793c\u7269\uff0c\u7528\u793c\u7269\u8868\u8fbe\u5fc3\u610f"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    .line 545
    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 546
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 547
    :pswitch_35
    invoke-static {}, Ll/c17;->u0()Z

    move-result p0

    .line 548
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 549
    invoke-virtual {v0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p1

    if-eqz p0, :cond_40

    .line 550
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->V0:I

    goto :goto_36

    .line 551
    :cond_40
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->U0:I

    .line 552
    :goto_36
    invoke-virtual {p1, v0}, Ll/b690;->n(I)Ll/b690;

    move-result-object p1

    sget v0, Ll/jbc0;->Ib:I

    .line 553
    invoke-virtual {p1, v0}, Ll/b690;->i(I)Ll/b690;

    move-result-object p1

    if-eqz p0, :cond_41

    .line 554
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->T0:I

    goto :goto_37

    .line 555
    :cond_41
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->S0:I

    .line 556
    :goto_37
    invoke-virtual {p1, v0}, Ll/b690;->l(I)Ll/b690;

    move-result-object p1

    if-eqz p0, :cond_42

    .line 557
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->T0:I

    goto :goto_38

    .line 558
    :cond_42
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->S0:I

    .line 559
    :goto_38
    invoke-virtual {p1, p0}, Ll/b690;->f(I)Ll/b690;

    move-result-object p0

    .line 560
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 561
    :pswitch_36
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v0

    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v0

    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    move-result v0

    if-eqz v0, :cond_43

    .line 562
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 563
    invoke-virtual {v0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p1

    sget v0, Ll/jbc0;->ec:I

    .line 564
    invoke-virtual {p1, v0}, Ll/b690;->i(I)Ll/b690;

    move-result-object p1

    .line 565
    invoke-static {}, Ll/j690;->t()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p1

    .line 566
    invoke-static {p0}, Ll/j690;->s(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p1

    .line 567
    invoke-static {p0}, Ll/j690;->s(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 568
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 569
    :cond_43
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    .line 570
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    .line 571
    invoke-virtual {p0, v5}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    move-result-object p0

    .line 572
    invoke-static {}, Ll/j690;->x()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 573
    invoke-static {}, Ll/j690;->v()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 574
    invoke-static {}, Ll/j690;->w()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 575
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 576
    :pswitch_37
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    .line 577
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    sget p1, Ll/jbc0;->Kb:I

    .line 578
    invoke-virtual {p0, p1}, Ll/b690;->i(I)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->d1:I

    .line 579
    invoke-virtual {p0, p1}, Ll/b690;->n(I)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->c1:I

    .line 580
    invoke-virtual {p0, p1}, Ll/b690;->l(I)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->c1:I

    .line 581
    invoke-virtual {p0, p1}, Ll/b690;->f(I)Ll/b690;

    move-result-object p0

    .line 582
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 583
    :pswitch_38
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->b1:I

    .line 584
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->a1:I

    .line 585
    sget-object v2, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    if-ne p0, v2, :cond_44

    .line 586
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object p0

    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object p0

    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Xi()Z

    move-result p0

    if-eqz p0, :cond_44

    .line 587
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->m6:I

    .line 588
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->n6:I

    :cond_44
    move p0, v1

    .line 589
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v2

    .line 590
    invoke-virtual {v2, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p1

    .line 591
    const-string v2, "https://auto.tancdn.com/v1/raw/1ed2b13c-d582-4afa-8c09-32d9fc4f2f9a10.webp"

    invoke-virtual {p1, v2}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    move-result-object p1

    .line 592
    invoke-virtual {p1, v0}, Ll/b690;->n(I)Ll/b690;

    move-result-object p1

    .line 593
    invoke-virtual {p1, v1}, Ll/b690;->l(I)Ll/b690;

    move-result-object p1

    .line 594
    invoke-virtual {p1, p0}, Ll/b690;->f(I)Ll/b690;

    move-result-object p0

    .line 595
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 596
    :pswitch_39
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->Y0:I

    .line 597
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 598
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->Y0:I

    .line 599
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 600
    invoke-static {}, Ll/s7a;->k()Z

    move-result v2

    if-eqz v2, :cond_45

    .line 601
    invoke-static {p0}, Ll/wib0;->g(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    move-result p0

    if-eqz p0, :cond_45

    .line 602
    sget p0, Ll/jbc0;->s6:I

    const-string v0, "\u4e00\u952e\u5f00\u542f\u51bb\u7ed3\u6d3b\u8dc3\u65f6\u95f4\u548c\u9690\u85cf\u8ddd\u79bb\u4f4d\u7f6e\u529f\u80fd"

    move-object v1, v0

    goto :goto_39

    .line 603
    :cond_45
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object p0

    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object p0

    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->z1()Z

    move-result p0

    const/4 v2, 0x0

    if-eqz p0, :cond_46

    .line 604
    const-string v0, "\u9690\u85cf\u6211\u7684\u4f4d\u7f6e\u3001\u6700\u540e\u6d3b\u8dc3\u65f6\u95f4\u548c\u5e74\u9f84\u4fe1\u606f\uff0c\u9690\u79c1\u66f4\u6709\u4fdd\u969c"

    move-object v1, v0

    :cond_46
    move p0, v2

    .line 605
    :goto_39
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v2

    invoke-virtual {v2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v2

    invoke-interface {v2}, Ll/r97;->N()Z

    move-result v2

    if-eqz v2, :cond_47

    .line 606
    const-string v0, "\u53ea\u8ba9\u4f60\u53f3\u6ed1\u7684\u4eba\u770b\u5230\u4f60\uff0c\u8fd8\u53ef\u9690\u85cf\u5e74\u9f84\u3001\u4f4d\u7f6e\u7b49\u4fe1\u606f"

    move-object v1, v0

    .line 607
    :cond_47
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v2

    .line 608
    invoke-virtual {v2, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p1

    sget v2, Ll/jbc0;->Lc:I

    .line 609
    invoke-virtual {p1, v2}, Ll/b690;->i(I)Ll/b690;

    move-result-object p1

    .line 610
    invoke-virtual {p1, p0}, Ll/b690;->d(I)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->Z0:I

    .line 611
    invoke-virtual {p0, p1}, Ll/b690;->n(I)Ll/b690;

    move-result-object p0

    .line 612
    invoke-virtual {p0, v1}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 613
    invoke-virtual {p0, v0}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 614
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 615
    :pswitch_3a
    invoke-static {p0}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    move-result v0

    if-nez v0, :cond_49

    .line 616
    invoke-static {p0}, Ll/wib0;->j(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    move-result p0

    if-eqz p0, :cond_48

    goto :goto_3a

    :cond_48
    const-string p0, "1"

    goto :goto_3b

    .line 617
    :cond_49
    :goto_3a
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    move-result-object p0

    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    move-result p0

    if-eqz p0, :cond_4a

    const-string p0, "21"

    goto :goto_3b

    :cond_4a
    const-string p0, "4"

    .line 618
    :goto_3b
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 619
    invoke-virtual {v0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p1

    sget v0, Ll/jbc0;->b:I

    .line 620
    invoke-virtual {p1, v0}, Ll/b690;->i(I)Ll/b690;

    move-result-object p1

    sget v0, Ll/h9c0;->R:I

    .line 621
    invoke-virtual {p1, v0}, Ll/b690;->p(I)Ll/b690;

    move-result-object p1

    const-string v0, "\u8bed\u97f3\u95ea\u804a"

    .line 622
    invoke-virtual {p1, v0}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p1

    .line 623
    invoke-static {}, Ll/c17;->u0()Z

    move-result v0

    const-string v1, "\u5c0f\u59d0\u59d0"

    const-string v2, "\u5c0f\u54e5\u54e5"

    if-eqz v0, :cond_4b

    move-object v0, v2

    goto :goto_3c

    :cond_4b
    move-object v0, v1

    :goto_3c
    filled-new-array {p0, v0}, [Ljava/lang/Object;

    move-result-object v0

    .line 624
    const-string v3, "\u6bcf\u5929\u989d\u5916%s\u6b21\u8bed\u97f3\u95ea\u804a\uff0c\u968f\u65f6\u8fde\u7ebf\u9644\u8fd1\u7684%s"

    invoke-static {v3, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 625
    invoke-virtual {p1, v0}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p1

    .line 626
    invoke-static {}, Ll/c17;->u0()Z

    move-result v0

    if-eqz v0, :cond_4c

    move-object v1, v2

    :cond_4c
    filled-new-array {p0, v1}, [Ljava/lang/Object;

    move-result-object p0

    .line 627
    invoke-static {v3, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    .line 628
    invoke-virtual {p1, p0}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 629
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 630
    :pswitch_3b
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v0

    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v0

    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    move-result v0

    if-eqz v0, :cond_54

    .line 631
    invoke-static {p0}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    move-result v0

    if-nez v0, :cond_4f

    .line 632
    invoke-static {p0}, Ll/wib0;->j(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    move-result v0

    if-eqz v0, :cond_4d

    goto :goto_3d

    .line 633
    :cond_4d
    invoke-static {p0}, Ll/wib0;->u(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    move-result v0

    if-eqz v0, :cond_4e

    .line 634
    const-string v0, "\u65e0\u9650\u6b21\u95ea\u804a\u5339\u914d"

    goto :goto_3e

    .line 635
    :cond_4e
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v0

    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v0

    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->wp()Ljava/lang/String;

    move-result-object v0

    goto :goto_3e

    .line 636
    :cond_4f
    :goto_3d
    const-string v0, "\u65e0\u9650\u6b21\u5728\u7ebf\u95ea\u804a"

    .line 637
    :goto_3e
    invoke-static {p0}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    move-result v1

    if-nez v1, :cond_52

    .line 638
    invoke-static {p0}, Ll/wib0;->j(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    move-result v1

    if-eqz v1, :cond_50

    goto :goto_3f

    .line 639
    :cond_50
    invoke-static {p0}, Ll/wib0;->u(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    move-result p0

    if-eqz p0, :cond_51

    .line 640
    const-string p0, "\u65e0\u9650\u6b21\u95ea\u804a\u673a\u4f1a\uff0c\u65e0\u9700\u914d\u5bf9\uff0c\u7acb\u5373\u5f00\u804a\uff01"

    goto :goto_40

    .line 641
    :cond_51
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object p0

    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object p0

    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Il()Ljava/lang/String;

    move-result-object p0

    .line 642
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v1

    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v1

    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Jj()Ljava/lang/String;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    .line 643
    invoke-static {p0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    goto :goto_40

    .line 644
    :cond_52
    :goto_3f
    invoke-static {}, Ll/c17;->u0()Z

    move-result p0

    if-eqz p0, :cond_53

    .line 645
    const-string p0, "\u65e0\u9650\u6b21\u5728\u7ebf\u95ea\u804a\u5339\u914d\u9644\u8fd1\u5728\u7ebf\u7684\u5c0f\u54e5\u54e5\uff0c\u65e0\u9700\u76f8\u4e92\u559c\u6b22\uff0c\u76f4\u63a5\u5728\u7ebf\u5f00\u804a"

    goto :goto_40

    .line 646
    :cond_53
    const-string p0, "\u65e0\u9650\u6b21\u5728\u7ebf\u95ea\u804a\u5339\u914d\u9644\u8fd1\u5728\u7ebf\u7684\u5c0f\u59d0\u59d0\uff0c\u65e0\u9700\u76f8\u4e92\u559c\u6b22\uff0c\u76f4\u63a5\u5728\u7ebf\u5f00\u804a"

    .line 647
    :goto_40
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v1

    .line 648
    invoke-virtual {v1, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p1

    sget v1, Ll/jbc0;->b0:I

    .line 649
    invoke-virtual {p1, v1}, Ll/b690;->i(I)Ll/b690;

    move-result-object p1

    .line 650
    invoke-virtual {p1, v0}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p1

    .line 651
    invoke-virtual {p1, p0}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p1

    .line 652
    invoke-virtual {p1, p0}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 653
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 654
    :cond_54
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    .line 655
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    sget p1, Ll/jbc0;->b0:I

    .line 656
    invoke-virtual {p0, p1}, Ll/b690;->i(I)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->f7:I

    .line 657
    invoke-virtual {p0, p1}, Ll/b690;->n(I)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->Z6:I

    .line 658
    invoke-virtual {p0, p1}, Ll/b690;->l(I)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->Z6:I

    .line 659
    invoke-virtual {p0, p1}, Ll/b690;->f(I)Ll/b690;

    move-result-object p0

    .line 660
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 661
    :pswitch_3c
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    if-ne p0, v0, :cond_55

    .line 662
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    .line 663
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    const-string p1, "https://auto.tancdn.com/v1/raw/9a4c7c22-b275-44ab-8ebb-aeebc7e0a84210.webp"

    .line 664
    invoke-virtual {p0, p1}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->t7:I

    .line 665
    invoke-virtual {p0, p1}, Ll/b690;->n(I)Ll/b690;

    move-result-object p0

    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 666
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->v7:I

    .line 667
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    .line 668
    invoke-virtual {p0, p1}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->v7:I

    .line 669
    invoke-virtual {p0, p1}, Ll/b690;->f(I)Ll/b690;

    move-result-object p0

    .line 670
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 671
    :cond_55
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    .line 672
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    sget p1, Ll/jbc0;->fc:I

    .line 673
    invoke-virtual {p0, p1}, Ll/b690;->i(I)Ll/b690;

    move-result-object p0

    sget p1, Ll/jbc0;->sc:I

    .line 674
    invoke-virtual {p0, p1}, Ll/b690;->e(I)Ll/b690;

    move-result-object p0

    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->u7:I

    .line 675
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 676
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->v7:I

    .line 677
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    .line 678
    invoke-virtual {p0, p1}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 679
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->v7:I

    .line 680
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    .line 681
    invoke-virtual {p0, p1}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 682
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 683
    :pswitch_3d
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    if-ne p0, v0, :cond_56

    .line 684
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->p6:I

    .line 685
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->q6:I

    .line 686
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v1

    .line 687
    invoke-virtual {v1, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p1

    const-string v1, "https://auto.tancdn.com/v1/raw/11c58ba4-4e09-4b06-907e-46899bf7117611.webp"

    .line 688
    invoke-virtual {p1, v1}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    move-result-object p1

    .line 689
    invoke-virtual {p1, p0}, Ll/b690;->n(I)Ll/b690;

    move-result-object p0

    .line 690
    invoke-virtual {p0, v0}, Ll/b690;->l(I)Ll/b690;

    move-result-object p0

    .line 691
    invoke-virtual {p0, v0}, Ll/b690;->f(I)Ll/b690;

    move-result-object p0

    .line 692
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 693
    :cond_56
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->o:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    .line 694
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 695
    invoke-virtual {v0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p1

    sget v0, Ll/jbc0;->Ic:I

    .line 696
    invoke-virtual {p1, v0}, Ll/b690;->i(I)Ll/b690;

    move-result-object p1

    sget v0, Ll/jbc0;->l:I

    .line 697
    invoke-virtual {p1, v0}, Ll/b690;->e(I)Ll/b690;

    move-result-object p1

    sget v0, Ll/h9c0;->b:I

    sget v1, Ll/h9c0;->a:I

    .line 698
    invoke-virtual {p1, v0, v1}, Ll/b690;->h(II)Ll/b690;

    move-result-object p1

    .line 699
    invoke-virtual {p1, p0}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->j:I

    .line 700
    invoke-virtual {p0, p1}, Ll/b690;->l(I)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->j:I

    .line 701
    invoke-virtual {p0, p1}, Ll/b690;->f(I)Ll/b690;

    move-result-object p0

    .line 702
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 703
    :pswitch_3e
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    move-result v0

    if-eqz v0, :cond_57

    move-object v3, v4

    .line 704
    :cond_57
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    if-ne p0, v0, :cond_59

    .line 705
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    move-result p0

    if-eqz p0, :cond_58

    move-object v1, v2

    :cond_58
    move-object v3, v1

    .line 706
    :cond_59
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    .line 707
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    .line 708
    invoke-virtual {p0, v3}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->Y8:I

    .line 709
    invoke-virtual {p0, p1}, Ll/b690;->n(I)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->S8:I

    .line 710
    invoke-virtual {p0, p1}, Ll/b690;->l(I)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->S8:I

    .line 711
    invoke-virtual {p0, p1}, Ll/b690;->f(I)Ll/b690;

    move-result-object p0

    .line 712
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 713
    :pswitch_3f
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v0

    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v0

    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    move-result v0

    if-eqz v0, :cond_5a

    .line 714
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    .line 715
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    sget p1, Ll/jbc0;->Hc:I

    .line 716
    invoke-virtual {p0, p1}, Ll/b690;->i(I)Ll/b690;

    move-result-object p0

    sget p1, Ll/jbc0;->nc:I

    .line 717
    invoke-virtual {p0, p1}, Ll/b690;->e(I)Ll/b690;

    move-result-object p0

    sget p1, Ll/h9c0;->i0:I

    sget v0, Ll/h9c0;->h0:I

    .line 718
    invoke-virtual {p0, p1, v0}, Ll/b690;->h(II)Ll/b690;

    move-result-object p0

    .line 719
    invoke-static {}, Ll/j690;->x()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 720
    invoke-static {}, Ll/j690;->v()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 721
    invoke-static {}, Ll/j690;->v()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 722
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 723
    :cond_5a
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->a9:I

    .line 724
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->U8:I

    .line 725
    sget-object v2, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    if-ne v2, p0, :cond_5b

    .line 726
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->U6:I

    .line 727
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->T6:I

    :goto_41
    move p0, v1

    goto :goto_42

    .line 728
    :cond_5b
    const-string v5, "https://auto.tancdn.com/v1/raw/471883b1-4132-4349-a95a-5806d9df838510.webp"

    goto :goto_41

    .line 729
    :goto_42
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v2

    .line 730
    invoke-virtual {v2, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p1

    .line 731
    invoke-virtual {p1, v5}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    move-result-object p1

    .line 732
    invoke-virtual {p1, v0}, Ll/b690;->n(I)Ll/b690;

    move-result-object p1

    .line 733
    invoke-virtual {p1, v1}, Ll/b690;->l(I)Ll/b690;

    move-result-object p1

    .line 734
    invoke-virtual {p1, p0}, Ll/b690;->f(I)Ll/b690;

    move-result-object p0

    .line 735
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 736
    :pswitch_40
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v0

    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v0

    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    move-result v0

    if-eqz v0, :cond_5c

    .line 737
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    .line 738
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    sget p1, Ll/jbc0;->Kc:I

    .line 739
    invoke-virtual {p0, p1}, Ll/b690;->i(I)Ll/b690;

    move-result-object p0

    sget p1, Ll/jbc0;->uc:I

    .line 740
    invoke-virtual {p0, p1}, Ll/b690;->e(I)Ll/b690;

    move-result-object p0

    sget p1, Ll/h9c0;->m0:I

    sget v0, Ll/h9c0;->l0:I

    .line 741
    invoke-virtual {p0, p1, v0}, Ll/b690;->h(II)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->X0:I

    .line 742
    invoke-virtual {p0, p1}, Ll/b690;->n(I)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->W0:I

    .line 743
    invoke-virtual {p0, p1}, Ll/b690;->l(I)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->W0:I

    .line 744
    invoke-virtual {p0, p1}, Ll/b690;->f(I)Ll/b690;

    move-result-object p0

    .line 745
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 746
    :cond_5c
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    if-ne p0, v0, :cond_5d

    .line 747
    const-string p0, "https://auto.tancdn.com/v1/raw/fad6222d-a1b8-4505-8537-48f54a09580111.webp"

    goto :goto_43

    .line 748
    :cond_5d
    const-string p0, "https://auto.tancdn.com/v1/raw/30a18977-468d-4e52-a7ff-c69087efcfa411.webp"

    .line 749
    :goto_43
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 750
    invoke-virtual {v0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p1

    .line 751
    invoke-virtual {p1, p0}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->X0:I

    .line 752
    invoke-virtual {p0, p1}, Ll/b690;->n(I)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->W0:I

    .line 753
    invoke-virtual {p0, p1}, Ll/b690;->l(I)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->Q8:I

    .line 754
    invoke-virtual {p0, p1}, Ll/b690;->f(I)Ll/b690;

    move-result-object p0

    .line 755
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 756
    :pswitch_41
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v0

    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v0

    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    move-result v0

    if-eqz v0, :cond_5e

    .line 757
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->o1:I

    .line 758
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    .line 759
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 760
    invoke-virtual {v0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p1

    sget v0, Ll/jbc0;->Nc:I

    .line 761
    invoke-virtual {p1, v0}, Ll/b690;->i(I)Ll/b690;

    move-result-object p1

    sget v0, Ll/jbc0;->Ec:I

    .line 762
    invoke-virtual {p1, v0}, Ll/b690;->e(I)Ll/b690;

    move-result-object p1

    sget v0, Ll/h9c0;->t0:I

    sget v1, Ll/h9c0;->s0:I

    .line 763
    invoke-virtual {p1, v0, v1}, Ll/b690;->h(II)Ll/b690;

    move-result-object p1

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->p1:I

    .line 764
    invoke-virtual {p1, v0}, Ll/b690;->n(I)Ll/b690;

    move-result-object p1

    .line 765
    invoke-virtual {p1, p0}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p1

    .line 766
    invoke-virtual {p1, p0}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 767
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 768
    :cond_5e
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    move-result v0

    if-eqz v0, :cond_5f

    .line 769
    const-string v0, "https://auto.tancdn.com/v1/raw/1216f433-f408-44a2-add9-e3a9969270c611.webp"

    goto :goto_44

    .line 770
    :cond_5f
    const-string v0, "https://auto.tancdn.com/v1/raw/9e7625c5-4002-421b-bf5c-fb6ed0ea90ee11.webp"

    .line 771
    :goto_44
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    if-ne p0, v1, :cond_61

    .line 772
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    move-result p0

    if-eqz p0, :cond_60

    .line 773
    const-string p0, "https://auto.tancdn.com/v1/raw/8a46ab26-dd56-484a-bd09-43ee42fd5e1311.webp"

    :goto_45
    move-object v0, p0

    goto :goto_46

    .line 774
    :cond_60
    const-string p0, "https://auto.tancdn.com/v1/raw/406c7711-a037-4e25-8acf-db68636ebce010.webp"

    goto :goto_45

    .line 775
    :cond_61
    :goto_46
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    .line 776
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    .line 777
    invoke-virtual {p0, v0}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->W8:I

    .line 778
    invoke-virtual {p0, p1}, Ll/b690;->n(I)Ll/b690;

    move-result-object p0

    .line 779
    invoke-static {}, Ll/j690;->g()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 780
    invoke-static {}, Ll/j690;->g()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 781
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 782
    :pswitch_42
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v0

    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v0

    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    move-result v0

    if-eqz v0, :cond_67

    .line 783
    invoke-static {}, Ll/c17;->u0()Z

    move-result p0

    .line 784
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 785
    invoke-virtual {v0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p1

    sget v1, Ll/jbc0;->Mc:I

    .line 786
    invoke-virtual {p1, v1}, Ll/b690;->i(I)Ll/b690;

    move-result-object p1

    sget v1, Ll/jbc0;->Bc:I

    .line 787
    invoke-virtual {p1, v1}, Ll/b690;->e(I)Ll/b690;

    move-result-object p1

    sget v1, Ll/h9c0;->r0:I

    sget v2, Ll/h9c0;->q0:I

    .line 788
    invoke-virtual {p1, v1, v2}, Ll/b690;->h(II)Ll/b690;

    move-result-object p1

    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->n1:I

    .line 789
    invoke-virtual {p1, v1}, Ll/b690;->n(I)Ll/b690;

    move-result-object p1

    if-eqz p0, :cond_62

    .line 790
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->K0:I

    goto :goto_47

    :cond_62
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->J0:I

    .line 791
    :goto_47
    invoke-virtual {p1, v1}, Ll/b690;->l(I)Ll/b690;

    move-result-object p1

    if-eqz p0, :cond_63

    .line 792
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->K0:I

    goto :goto_48

    :cond_63
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->J0:I

    .line 793
    :goto_48
    invoke-virtual {p1, p0}, Ll/b690;->f(I)Ll/b690;

    .line 794
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object p0

    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object p0

    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Vf()Z

    move-result p0

    if-eqz p0, :cond_66

    .line 795
    const-string p0, "\u53cd\u6094\u7279\u6743"

    invoke-virtual {v0, p0}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    .line 796
    invoke-static {}, Ll/c17;->u0()Z

    move-result p0

    const-string p1, "\u624b\u6ed1\u5566\uff1f\u4f7f\u7528\u53cd\u6094\u7279\u6743\uff0c\u91cd\u65b0\u559c\u6b22\u4ed6\uff01"

    if-eqz p0, :cond_64

    move-object p0, p1

    goto :goto_49

    :cond_64
    const-string p0, "\u624b\u6ed1\u5566\uff1f\u4f7f\u7528\u53cd\u6094\u7279\u6743\uff0c\u91cd\u65b0\u559c\u6b22\u5979\uff01"

    .line 797
    :goto_49
    invoke-virtual {v0, p0}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    .line 798
    invoke-static {}, Ll/c17;->u0()Z

    move-result p0

    if-eqz p0, :cond_65

    goto :goto_4a

    :cond_65
    const-string p1, "\u624b\u6ed1\u5566\uff1f\u4f7f\u7528\u53cd\u6094\u7279\u6743\uff0c\u91cd\u65b0\u559c\u6b22\u5979\uff01"

    .line 799
    :goto_4a
    invoke-virtual {v0, p1}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    .line 800
    :cond_66
    invoke-virtual {v0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 801
    :cond_67
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    move-result v0

    if-eqz v0, :cond_68

    .line 802
    const-string v0, "https://auto.tancdn.com/v1/raw/1c363bb1-527a-4e73-bf75-af3337532e8711.webp"

    goto :goto_4b

    .line 803
    :cond_68
    const-string v0, "https://auto.tancdn.com/v1/raw/efbb251e-8a64-450e-80e4-af960390eabd11.webp"

    .line 804
    :goto_4b
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    if-ne p0, v1, :cond_6a

    .line 805
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    move-result p0

    if-eqz p0, :cond_69

    .line 806
    const-string p0, "https://auto.tancdn.com/v1/raw/8e0c607c-ba1e-4754-8b7a-9ec6ceef9dfd11.webp"

    :goto_4c
    move-object v0, p0

    goto :goto_4d

    .line 807
    :cond_69
    const-string p0, "https://auto.tancdn.com/v1/raw/3e3a2ee9-7170-4b5b-92f7-d4f4dfca3dc311.webp"

    goto :goto_4c

    .line 808
    :cond_6a
    :goto_4d
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    .line 809
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p1

    .line 810
    invoke-virtual {p1, v0}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    move-result-object p1

    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->Z8:I

    .line 811
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p1

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->T8:I

    .line 812
    invoke-virtual {p1, v0}, Ll/b690;->l(I)Ll/b690;

    move-result-object p1

    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->T8:I

    .line 813
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    .line 814
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 815
    :pswitch_43
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v0

    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v0

    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    move-result v0

    if-eqz v0, :cond_6f

    .line 816
    invoke-static {}, Ll/c17;->u0()Z

    move-result v0

    if-eqz v0, :cond_6b

    .line 817
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->f1:I

    goto :goto_4e

    .line 818
    :cond_6b
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->e1:I

    .line 819
    :goto_4e
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    invoke-virtual {v1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 820
    invoke-static {p0}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    move-result v1

    if-nez v1, :cond_6d

    .line 821
    invoke-static {p0}, Ll/wib0;->j(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    move-result v1

    if-eqz v1, :cond_6c

    goto :goto_4f

    .line 822
    :cond_6c
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->g1:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_50

    .line 823
    :cond_6d
    :goto_4f
    const-string v1, "\u65e0\u9650\u6b21\u8d85\u7ea7\u559c\u6b22"

    .line 824
    :goto_50
    invoke-static {p0}, Ll/wib0;->u(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    move-result p0

    if-eqz p0, :cond_6e

    .line 825
    const-string v1, "\u65e0\u9650\u6b21\u8d85\u7ea7\u559c\u6b22"

    const-string v0, "\u65e0\u9650\u6b21\u8d85\u7ea7\u559c\u6b22\uff0c\u4f7f\u7528\u540e\u8ba9\u4f60\u7684\u559c\u6b22\u8131\u9896\u800c\u51fa\uff01"

    .line 826
    :cond_6e
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    .line 827
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    sget p1, Ll/jbc0;->T9:I

    .line 828
    invoke-virtual {p0, p1}, Ll/b690;->i(I)Ll/b690;

    move-result-object p0

    sget p1, Ll/jbc0;->u9:I

    .line 829
    invoke-virtual {p0, p1}, Ll/b690;->e(I)Ll/b690;

    move-result-object p0

    sget p1, Ll/h9c0;->p0:I

    sget v2, Ll/h9c0;->o0:I

    .line 830
    invoke-virtual {p0, p1, v2}, Ll/b690;->h(II)Ll/b690;

    move-result-object p0

    .line 831
    invoke-virtual {p0, v1}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 832
    invoke-virtual {p0, v0}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 833
    invoke-virtual {p0, v0}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 834
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 835
    :cond_6f
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v5, Lcom/p1/mobile/putong/core/pay/R$string;->V8:I

    invoke-virtual {v0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 836
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    move-result v5

    if-eqz v5, :cond_70

    move-object v3, v4

    .line 837
    :cond_70
    sget-object v4, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    if-ne p0, v4, :cond_72

    .line 838
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    move-result v3

    if-eqz v3, :cond_71

    move-object v1, v2

    :cond_71
    move-object v3, v1

    .line 839
    :cond_72
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->Y8:I

    if-ne p0, v4, :cond_74

    .line 840
    invoke-static {}, Ll/gta;->e()Ll/gta;

    move-result-object p0

    .line 841
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object p0

    .line 842
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Oi()Z

    move-result p0

    if-eqz p0, :cond_74

    .line 843
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    move-result p0

    if-eqz p0, :cond_73

    .line 844
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->h3:I

    :goto_51
    move v1, p0

    goto :goto_52

    .line 845
    :cond_73
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->g3:I

    goto :goto_51

    .line 846
    :cond_74
    :goto_52
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    .line 847
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p1

    .line 848
    invoke-virtual {p1, v3}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    move-result-object p1

    .line 849
    invoke-virtual {p1, v1}, Ll/b690;->n(I)Ll/b690;

    move-result-object p1

    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->V8:I

    .line 850
    invoke-virtual {p1, v1}, Ll/b690;->l(I)Ll/b690;

    move-result-object p1

    .line 851
    invoke-virtual {p1, v0}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    .line 852
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 853
    :pswitch_44
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    if-ne p0, v0, :cond_75

    .line 854
    const-string p0, "https://auto.tancdn.com/v1/raw/7e9d55ce-e487-41fe-8dd2-7a0147470ef110.webp"

    goto :goto_53

    .line 855
    :cond_75
    const-string p0, "https://auto.tancdn.com/v1/raw/55c2177d-65e6-4c75-801a-499403525f5e10.webp"

    .line 856
    :goto_53
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 857
    invoke-virtual {v0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p1

    .line 858
    invoke-virtual {p1, p0}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->s6:I

    .line 859
    invoke-virtual {p0, p1}, Ll/b690;->n(I)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->r6:I

    .line 860
    invoke-virtual {p0, p1}, Ll/b690;->l(I)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->r6:I

    .line 861
    invoke-virtual {p0, p1}, Ll/b690;->f(I)Ll/b690;

    move-result-object p0

    .line 862
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 863
    :pswitch_45
    invoke-static {}, Ll/c17;->u0()Z

    move-result p0

    .line 864
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 865
    invoke-virtual {v0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p1

    sget v0, Ll/jbc0;->Bc:I

    .line 866
    invoke-virtual {p1, v0}, Ll/b690;->e(I)Ll/b690;

    move-result-object p1

    sget v0, Ll/h9c0;->r0:I

    sget v1, Ll/h9c0;->q0:I

    .line 867
    invoke-virtual {p1, v0, v1}, Ll/b690;->h(II)Ll/b690;

    move-result-object p1

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->n1:I

    .line 868
    invoke-virtual {p1, v0}, Ll/b690;->n(I)Ll/b690;

    move-result-object p1

    if-eqz p0, :cond_76

    .line 869
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->K0:I

    goto :goto_54

    :cond_76
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->J0:I

    .line 870
    :goto_54
    invoke-virtual {p1, v0}, Ll/b690;->l(I)Ll/b690;

    move-result-object p1

    if-eqz p0, :cond_77

    .line 871
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->K0:I

    goto :goto_55

    :cond_77
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->J0:I

    .line 872
    :goto_55
    invoke-virtual {p1, p0}, Ll/b690;->f(I)Ll/b690;

    move-result-object p0

    .line 873
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 874
    :pswitch_46
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object p0

    .line 875
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    sget p1, Ll/jbc0;->Kc:I

    .line 876
    invoke-virtual {p0, p1}, Ll/b690;->i(I)Ll/b690;

    move-result-object p0

    sget p1, Ll/jbc0;->uc:I

    .line 877
    invoke-virtual {p0, p1}, Ll/b690;->e(I)Ll/b690;

    move-result-object p0

    sget p1, Ll/h9c0;->m0:I

    sget v0, Ll/h9c0;->l0:I

    .line 878
    invoke-virtual {p0, p1, v0}, Ll/b690;->h(II)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->X0:I

    .line 879
    invoke-virtual {p0, p1}, Ll/b690;->n(I)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->W0:I

    .line 880
    invoke-virtual {p0, p1}, Ll/b690;->l(I)Ll/b690;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->W0:I

    .line 881
    invoke-virtual {p0, p1}, Ll/b690;->f(I)Ll/b690;

    move-result-object p0

    .line 882
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 883
    :pswitch_47
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->o1:I

    .line 884
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    .line 885
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 886
    invoke-virtual {v0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p1

    sget v0, Ll/jbc0;->Nc:I

    .line 887
    invoke-virtual {p1, v0}, Ll/b690;->i(I)Ll/b690;

    move-result-object p1

    sget v0, Ll/jbc0;->Ec:I

    .line 888
    invoke-virtual {p1, v0}, Ll/b690;->e(I)Ll/b690;

    move-result-object p1

    sget v0, Ll/h9c0;->t0:I

    sget v1, Ll/h9c0;->s0:I

    .line 889
    invoke-virtual {p1, v0, v1}, Ll/b690;->h(II)Ll/b690;

    move-result-object p1

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->p1:I

    .line 890
    invoke-virtual {p1, v0}, Ll/b690;->n(I)Ll/b690;

    move-result-object p1

    .line 891
    invoke-virtual {p1, p0}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p1

    .line 892
    invoke-virtual {p1, p0}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 893
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 894
    :pswitch_48
    invoke-static {}, Ll/c17;->u0()Z

    move-result p0

    if-eqz p0, :cond_78

    .line 895
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->f1:I

    goto :goto_56

    .line 896
    :cond_78
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->e1:I

    .line 897
    :goto_56
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 898
    invoke-virtual {v0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p1

    sget v0, Ll/jbc0;->T9:I

    .line 899
    invoke-virtual {p1, v0}, Ll/b690;->i(I)Ll/b690;

    move-result-object p1

    sget v0, Ll/jbc0;->u9:I

    .line 900
    invoke-virtual {p1, v0}, Ll/b690;->e(I)Ll/b690;

    move-result-object p1

    sget v0, Ll/h9c0;->p0:I

    sget v1, Ll/h9c0;->o0:I

    .line 901
    invoke-virtual {p1, v0, v1}, Ll/b690;->h(II)Ll/b690;

    move-result-object p1

    .line 902
    const-string v0, "\u6bcf\u59293\u4e2a\u8d85\u7ea7\u559c\u6b22"

    invoke-virtual {p1, v0}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p1

    .line 903
    invoke-virtual {p1, p0}, Ll/b690;->l(I)Ll/b690;

    move-result-object p1

    .line 904
    invoke-virtual {p1, p0}, Ll/b690;->f(I)Ll/b690;

    move-result-object p0

    .line 905
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_48
        :pswitch_47
        :pswitch_46
        :pswitch_45
        :pswitch_44
        :pswitch_43
        :pswitch_42
        :pswitch_41
        :pswitch_40
        :pswitch_3f
        :pswitch_3e
        :pswitch_3d
        :pswitch_3c
        :pswitch_3c
        :pswitch_3b
        :pswitch_3a
        :pswitch_39
        :pswitch_38
        :pswitch_37
        :pswitch_36
        :pswitch_35
        :pswitch_34
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_30
        :pswitch_2f
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static n(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;Z)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            "Z)",
            "Ljava/util/List<",
            "Ll/a690;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    invoke-static {p0}, Ll/wib0;->s(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-static {}, Ll/j690;->r()Ll/a690;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    return-object v0

    .line 22
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 25
    .line 26
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 31
    .line 32
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/data/PurchaseType;->getPrivilegeDataForGP(Lcom/p1/mobile/putong/data/Gender;)Ljava/util/ArrayList;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    new-instance v2, Ll/e690;

    .line 37
    .line 38
    invoke-direct {v2, p1, v0, p2, p0}, Ll/e690;-><init>(Lcom/p1/mobile/putong/core/data/Privilege;Ljava/util/List;ZLcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v1, v2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 42
    .line 43
    .line 44
    return-object v0
.end method

.method public static o(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;
    .locals 4

    .line 1
    sget-object v0, Ll/j690$a;->a:[I

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1f

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1e

    const/4 v1, 0x3

    if-eq v0, v1, :cond_1d

    const/4 v1, 0x4

    if-eq v0, v1, :cond_1a

    const/16 v1, 0x1e

    if-eq v0, v1, :cond_19

    const/16 v1, 0x22

    if-eq v0, v1, :cond_18

    const/16 v1, 0x34

    if-eq v0, v1, :cond_17

    const/16 v1, 0x3d

    if-eq v0, v1, :cond_16

    const/16 v1, 0x28

    if-eq v0, v1, :cond_15

    const/16 v1, 0x29

    if-eq v0, v1, :cond_12

    packed-switch v0, :pswitch_data_0

    const-string v1, "\u5c0f\u59d0\u59d0"

    const-string v2, "\u5c0f\u54e5\u54e5"

    const-string v3, "\u6bcf\u5929\u989d\u59161\u6b21\u8bed\u97f3\u95ea\u804a\uff0c\u968f\u65f6\u8fde\u7ebf\u9644\u8fd1\u7684%s"

    packed-switch v0, :pswitch_data_1

    packed-switch v0, :pswitch_data_2

    const/4 p0, 0x0

    return-object p0

    .line 2
    :pswitch_0
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 3
    invoke-virtual {v0, p0}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    .line 4
    invoke-static {}, Ll/c17;->u0()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 5
    sget v0, Ll/jbc0;->r4:I

    goto :goto_0

    .line 6
    :cond_0
    sget v0, Ll/jbc0;->s4:I

    .line 7
    :goto_0
    invoke-virtual {p0, v0}, Ll/b690;->i(I)Ll/b690;

    move-result-object p0

    const-string v0, "\u4e00\u952e\u914d\u5bf9"

    .line 8
    invoke-virtual {p0, v0}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 9
    invoke-static {}, Ll/c17;->u0()Z

    move-result v0

    if-eqz v0, :cond_1

    move-object v0, v2

    goto :goto_1

    :cond_1
    move-object v0, v1

    :goto_1
    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    .line 10
    invoke-static {v3, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 12
    invoke-static {}, Ll/c17;->u0()Z

    move-result v0

    if-eqz v0, :cond_2

    move-object v1, v2

    :cond_2
    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v0

    .line 13
    invoke-static {v3, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 16
    :pswitch_1
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 17
    invoke-virtual {v0, p0}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->e3:I

    .line 18
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 19
    invoke-static {}, Ll/joa;->s3()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    .line 20
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 21
    invoke-virtual {p0, v0}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->d3:I

    .line 22
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->d3:I

    .line 23
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 24
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 25
    :pswitch_2
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 26
    invoke-virtual {v0, p0}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->r3:I

    .line 27
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->q3:I

    .line 28
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->q3:I

    .line 29
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 30
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 31
    :pswitch_3
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 32
    invoke-virtual {v0, p0}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->o3:I

    .line 33
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->w6:I

    .line 34
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 35
    invoke-virtual {p0, v0}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->w6:I

    .line 36
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 37
    invoke-virtual {p0, v0}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 38
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 39
    :pswitch_4
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 40
    invoke-virtual {v0, p0}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->Z2:I

    .line 41
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 42
    invoke-static {}, Ll/j690;->h()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 43
    invoke-static {}, Ll/j690;->h()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 44
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 45
    :pswitch_5
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 46
    invoke-virtual {v0, p0}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    sget v0, Ll/jbc0;->b:I

    .line 47
    invoke-virtual {p0, v0}, Ll/b690;->i(I)Ll/b690;

    move-result-object p0

    sget v0, Ll/h9c0;->R:I

    .line 48
    invoke-virtual {p0, v0}, Ll/b690;->p(I)Ll/b690;

    move-result-object p0

    const-string v0, "\u8bed\u97f3\u95ea\u804a"

    .line 49
    invoke-virtual {p0, v0}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 50
    invoke-static {}, Ll/c17;->u0()Z

    move-result v0

    if-eqz v0, :cond_3

    move-object v0, v2

    goto :goto_2

    :cond_3
    move-object v0, v1

    :goto_2
    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    .line 51
    invoke-static {v3, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 52
    invoke-virtual {p0, v0}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 53
    invoke-static {}, Ll/c17;->u0()Z

    move-result v0

    if-eqz v0, :cond_4

    move-object v1, v2

    :cond_4
    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v0

    .line 54
    invoke-static {v3, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 55
    invoke-virtual {p0, v0}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 56
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 57
    :pswitch_6
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v0

    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v0

    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 58
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v0

    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v0

    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Il()Ljava/lang/String;

    move-result-object v0

    .line 59
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v1

    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v1

    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->wp()Ljava/lang/String;

    move-result-object v1

    .line 60
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v2

    .line 61
    invoke-virtual {v2, p0}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    sget v2, Ll/jbc0;->b:I

    .line 62
    invoke-virtual {p0, v2}, Ll/b690;->i(I)Ll/b690;

    move-result-object p0

    sget v2, Ll/h9c0;->R:I

    .line 63
    invoke-virtual {p0, v2}, Ll/b690;->p(I)Ll/b690;

    move-result-object p0

    .line 64
    invoke-virtual {p0, v1}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 65
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v1

    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v1

    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Jj()Ljava/lang/String;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    .line 66
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 67
    invoke-virtual {p0, v1}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 68
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v1

    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v1

    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Jj()Ljava/lang/String;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    .line 69
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 70
    invoke-virtual {p0, v0}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 71
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 72
    :cond_5
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 73
    invoke-virtual {v0, p0}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    sget v0, Ll/jbc0;->b:I

    .line 74
    invoke-virtual {p0, v0}, Ll/b690;->i(I)Ll/b690;

    move-result-object p0

    sget v0, Ll/h9c0;->R:I

    .line 75
    invoke-virtual {p0, v0}, Ll/b690;->p(I)Ll/b690;

    move-result-object p0

    const-string v0, "\u5728\u7ebf\u95ea\u804a"

    .line 76
    invoke-virtual {p0, v0}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 77
    const-string v0, "\u4f7f\u7528\u5728\u7ebf\u95ea\u804a\u529f\u80fd\u7acb\u523b\u83b7\u5f97\u804a\u5f97\u6765\u7684\u795e\u79d8\u914d\u5bf9\uff0c\u8499\u8138\u804a\u5929\u4e00\u6b65\u6b65\u53d1\u73b0\u795e\u79d8\u5934\u50cf\u80cc\u540e\u7684TA\uff01"

    invoke-virtual {p0, v0}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 78
    invoke-virtual {p0, v0}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 79
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 80
    :pswitch_7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    move-result-object v0

    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    const-string v1, "female"

    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 81
    sget v0, Ll/jbc0;->Wb:I

    goto :goto_3

    .line 82
    :cond_6
    sget v0, Ll/jbc0;->Xb:I

    .line 83
    :goto_3
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v1

    .line 84
    invoke-virtual {v1, p0}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    .line 85
    invoke-virtual {p0, v0}, Ll/b690;->i(I)Ll/b690;

    move-result-object p0

    sget v0, Ll/h9c0;->R:I

    .line 86
    invoke-virtual {p0, v0}, Ll/b690;->p(I)Ll/b690;

    move-result-object p0

    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->t7:I

    .line 87
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->v7:I

    .line 88
    invoke-virtual {p0, v0}, Ll/b690;->l(I)Ll/b690;

    move-result-object p0

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->v7:I

    .line 89
    invoke-virtual {p0, v0}, Ll/b690;->f(I)Ll/b690;

    move-result-object p0

    .line 90
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 91
    :pswitch_8
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 92
    invoke-virtual {v0, p0}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    sget v0, Ll/jbc0;->Wb:I

    .line 93
    invoke-virtual {p0, v0}, Ll/b690;->i(I)Ll/b690;

    move-result-object p0

    sget v0, Ll/h9c0;->R:I

    .line 94
    invoke-virtual {p0, v0}, Ll/b690;->p(I)Ll/b690;

    move-result-object p0

    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->i9:I

    .line 95
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v2

    invoke-virtual {v2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v2

    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Y4()I

    move-result v2

    .line 96
    invoke-static {v2}, Ll/a9g0;->f(I)Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    .line 97
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 98
    invoke-virtual {p0, v0}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->h9:I

    .line 99
    invoke-virtual {p0, v0}, Ll/b690;->l(I)Ll/b690;

    move-result-object p0

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->h9:I

    .line 100
    invoke-virtual {p0, v0}, Ll/b690;->f(I)Ll/b690;

    move-result-object p0

    .line 101
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 102
    :pswitch_9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->o:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 103
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->H9:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 104
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v2

    .line 105
    invoke-virtual {v2, p0}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    .line 106
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v2

    invoke-virtual {v2}, Ll/j49;->e()Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;

    move-result-object v2

    invoke-interface {v2}, Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;->jn()I

    move-result v2

    .line 107
    invoke-virtual {p0, v2}, Ll/b690;->i(I)Ll/b690;

    move-result-object p0

    sget v2, Ll/h9c0;->R:I

    .line 108
    invoke-virtual {p0, v2}, Ll/b690;->p(I)Ll/b690;

    move-result-object p0

    .line 109
    invoke-virtual {p0, v0}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 110
    invoke-virtual {p0, v1}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 111
    invoke-virtual {p0, v1}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 112
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 113
    :pswitch_a
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v0

    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v0

    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 114
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 115
    invoke-virtual {v0, p0}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    sget v0, Ll/jbc0;->Hc:I

    .line 116
    invoke-virtual {p0, v0}, Ll/b690;->i(I)Ll/b690;

    move-result-object p0

    .line 117
    invoke-static {}, Ll/j690;->x()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 118
    invoke-static {}, Ll/j690;->v()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 119
    invoke-static {}, Ll/j690;->v()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 120
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 121
    :cond_7
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 122
    invoke-virtual {v0, p0}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    sget v0, Ll/jbc0;->nc:I

    .line 123
    invoke-virtual {p0, v0}, Ll/b690;->e(I)Ll/b690;

    move-result-object p0

    sget v0, Ll/h9c0;->i0:I

    sget v1, Ll/h9c0;->h0:I

    .line 124
    invoke-virtual {p0, v0, v1}, Ll/b690;->h(II)Ll/b690;

    move-result-object p0

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->G9:I

    .line 125
    invoke-virtual {p0, v0}, Ll/b690;->n(I)Ll/b690;

    move-result-object p0

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->F9:I

    .line 126
    invoke-virtual {p0, v0}, Ll/b690;->l(I)Ll/b690;

    move-result-object p0

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->F9:I

    .line 127
    invoke-virtual {p0, v0}, Ll/b690;->f(I)Ll/b690;

    move-result-object p0

    .line 128
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 129
    :pswitch_b
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v0

    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v0

    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 130
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 131
    invoke-virtual {v0, p0}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    sget v0, Ll/jbc0;->uc:I

    .line 132
    invoke-virtual {p0, v0}, Ll/b690;->e(I)Ll/b690;

    move-result-object p0

    sget v0, Ll/h9c0;->m0:I

    sget v1, Ll/h9c0;->l0:I

    .line 133
    invoke-virtual {p0, v0, v1}, Ll/b690;->h(II)Ll/b690;

    move-result-object p0

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->X0:I

    .line 134
    invoke-virtual {p0, v0}, Ll/b690;->n(I)Ll/b690;

    move-result-object p0

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->W0:I

    .line 135
    invoke-virtual {p0, v0}, Ll/b690;->l(I)Ll/b690;

    move-result-object p0

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->W0:I

    .line 136
    invoke-virtual {p0, v0}, Ll/b690;->f(I)Ll/b690;

    move-result-object p0

    .line 137
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 138
    :cond_8
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 139
    invoke-virtual {v0, p0}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    sget v0, Ll/jbc0;->uc:I

    .line 140
    invoke-virtual {p0, v0}, Ll/b690;->e(I)Ll/b690;

    move-result-object p0

    sget v0, Ll/h9c0;->m0:I

    sget v1, Ll/h9c0;->l0:I

    .line 141
    invoke-virtual {p0, v0, v1}, Ll/b690;->h(II)Ll/b690;

    move-result-object p0

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->J9:I

    .line 142
    invoke-virtual {p0, v0}, Ll/b690;->n(I)Ll/b690;

    move-result-object p0

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->I9:I

    .line 143
    invoke-virtual {p0, v0}, Ll/b690;->l(I)Ll/b690;

    move-result-object p0

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->p:I

    .line 144
    invoke-virtual {p0, v0}, Ll/b690;->f(I)Ll/b690;

    move-result-object p0

    .line 145
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 146
    :pswitch_c
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v0

    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v0

    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 147
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->o1:I

    .line 148
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 149
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v1

    .line 150
    invoke-virtual {v1, p0}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    sget v1, Ll/jbc0;->Ec:I

    .line 151
    invoke-virtual {p0, v1}, Ll/b690;->e(I)Ll/b690;

    move-result-object p0

    sget v1, Ll/h9c0;->t0:I

    sget v2, Ll/h9c0;->s0:I

    .line 152
    invoke-virtual {p0, v1, v2}, Ll/b690;->h(II)Ll/b690;

    move-result-object p0

    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->p1:I

    .line 153
    invoke-virtual {p0, v1}, Ll/b690;->n(I)Ll/b690;

    move-result-object p0

    .line 154
    invoke-virtual {p0, v0}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 155
    invoke-virtual {p0, v0}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 156
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 157
    :cond_9
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 158
    invoke-virtual {v0, p0}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    sget v0, Ll/jbc0;->Ec:I

    .line 159
    invoke-virtual {p0, v0}, Ll/b690;->e(I)Ll/b690;

    move-result-object p0

    sget v0, Ll/h9c0;->t0:I

    sget v1, Ll/h9c0;->s0:I

    .line 160
    invoke-virtual {p0, v0, v1}, Ll/b690;->h(II)Ll/b690;

    move-result-object p0

    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->P9:I

    .line 161
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 162
    invoke-static {}, Ll/j690;->u()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 163
    invoke-static {}, Ll/j690;->u()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 164
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 165
    :pswitch_d
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v0

    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v0

    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 166
    invoke-static {}, Ll/c17;->u0()Z

    move-result v0

    .line 167
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v1

    .line 168
    invoke-virtual {v1, p0}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    sget v2, Ll/jbc0;->Bc:I

    .line 169
    invoke-virtual {p0, v2}, Ll/b690;->e(I)Ll/b690;

    move-result-object p0

    sget v2, Ll/h9c0;->r0:I

    sget v3, Ll/h9c0;->q0:I

    .line 170
    invoke-virtual {p0, v2, v3}, Ll/b690;->h(II)Ll/b690;

    move-result-object p0

    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->n1:I

    .line 171
    invoke-virtual {p0, v2}, Ll/b690;->n(I)Ll/b690;

    move-result-object p0

    if-eqz v0, :cond_a

    .line 172
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->m1:I

    goto :goto_4

    .line 173
    :cond_a
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->l1:I

    .line 174
    :goto_4
    invoke-virtual {p0, v2}, Ll/b690;->l(I)Ll/b690;

    move-result-object p0

    if-eqz v0, :cond_b

    .line 175
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->m1:I

    goto :goto_5

    .line 176
    :cond_b
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->l1:I

    .line 177
    :goto_5
    invoke-virtual {p0, v0}, Ll/b690;->f(I)Ll/b690;

    .line 178
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object p0

    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object p0

    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Vf()Z

    move-result p0

    if-eqz p0, :cond_e

    .line 179
    const-string p0, "\u53cd\u6094\u7279\u6743"

    invoke-virtual {v1, p0}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    .line 180
    invoke-static {}, Ll/c17;->u0()Z

    move-result p0

    const-string v0, "\u624b\u6ed1\u5566\uff1f\u4f7f\u7528\u53cd\u6094\u7279\u6743\uff0c\u91cd\u65b0\u559c\u6b22\u5979\uff01"

    const-string v2, "\u624b\u6ed1\u5566\uff1f\u4f7f\u7528\u53cd\u6094\u7279\u6743\uff0c\u91cd\u65b0\u559c\u6b22\u4ed6\uff01"

    if-eqz p0, :cond_c

    move-object p0, v2

    goto :goto_6

    :cond_c
    move-object p0, v0

    .line 181
    :goto_6
    invoke-virtual {v1, p0}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    .line 182
    invoke-static {}, Ll/c17;->u0()Z

    move-result p0

    if-eqz p0, :cond_d

    move-object v0, v2

    .line 183
    :cond_d
    invoke-virtual {v1, v0}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    .line 184
    :cond_e
    invoke-virtual {v1}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 185
    :cond_f
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 186
    invoke-virtual {v0, p0}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    sget v0, Ll/jbc0;->Bc:I

    .line 187
    invoke-virtual {p0, v0}, Ll/b690;->e(I)Ll/b690;

    move-result-object p0

    sget v0, Ll/h9c0;->r0:I

    sget v1, Ll/h9c0;->q0:I

    .line 188
    invoke-virtual {p0, v0, v1}, Ll/b690;->h(II)Ll/b690;

    move-result-object p0

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->N9:I

    .line 189
    invoke-virtual {p0, v0}, Ll/b690;->n(I)Ll/b690;

    move-result-object p0

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->M9:I

    .line 190
    invoke-virtual {p0, v0}, Ll/b690;->l(I)Ll/b690;

    move-result-object p0

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->L7:I

    .line 191
    invoke-virtual {p0, v0}, Ll/b690;->f(I)Ll/b690;

    move-result-object p0

    .line 192
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 193
    :pswitch_e
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v0

    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v0

    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    move-result v0

    if-eqz v0, :cond_11

    .line 194
    invoke-static {}, Ll/c17;->u0()Z

    move-result v0

    if-eqz v0, :cond_10

    .line 195
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->f1:I

    goto :goto_7

    .line 196
    :cond_10
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->e1:I

    .line 197
    :goto_7
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v1

    .line 198
    invoke-virtual {v1, p0}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    sget v1, Ll/jbc0;->u9:I

    .line 199
    invoke-virtual {p0, v1}, Ll/b690;->e(I)Ll/b690;

    move-result-object p0

    sget v1, Ll/h9c0;->p0:I

    sget v2, Ll/h9c0;->o0:I

    .line 200
    invoke-virtual {p0, v1, v2}, Ll/b690;->h(II)Ll/b690;

    move-result-object p0

    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->g1:I

    .line 201
    invoke-virtual {p0, v1}, Ll/b690;->n(I)Ll/b690;

    move-result-object p0

    .line 202
    invoke-virtual {p0, v0}, Ll/b690;->l(I)Ll/b690;

    move-result-object p0

    .line 203
    invoke-virtual {p0, v0}, Ll/b690;->f(I)Ll/b690;

    move-result-object p0

    .line 204
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 205
    :cond_11
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 206
    invoke-virtual {v0, p0}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    sget v0, Ll/jbc0;->u9:I

    .line 207
    invoke-virtual {p0, v0}, Ll/b690;->e(I)Ll/b690;

    move-result-object p0

    sget v0, Ll/h9c0;->p0:I

    sget v1, Ll/h9c0;->o0:I

    .line 208
    invoke-virtual {p0, v0, v1}, Ll/b690;->h(II)Ll/b690;

    move-result-object p0

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->L9:I

    .line 209
    invoke-virtual {p0, v0}, Ll/b690;->n(I)Ll/b690;

    move-result-object p0

    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->K9:I

    .line 210
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->K9:I

    .line 211
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 212
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 213
    :cond_12
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v0

    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v0

    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Tr()Z

    move-result v0

    if-eqz v0, :cond_13

    .line 214
    const-string v0, "\u6bcf\u5929\u5b9a\u5236\u63a8\u8350\u4f18\u8d28\u5a5a\u604b\u7528\u6237\uff0c\u52a9\u4f60\u65e9\u65e5\u8131\u5355"

    goto :goto_8

    .line 215
    :cond_13
    const-string v0, "\u6bcf\u5929\u66f4\u65b010\u4e2a\u4f18\u8d28\u8ba4\u8bc1\u7528\u6237\uff0c\u9047\u89c1\u4f60\u7684\u5fc3\u52a8"

    .line 216
    :goto_8
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v1

    .line 217
    invoke-virtual {v1, p0}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    .line 218
    invoke-static {}, Ll/c17;->u0()Z

    move-result v1

    if-eqz v1, :cond_14

    .line 219
    sget v1, Ll/jbc0;->L5:I

    goto :goto_9

    .line 220
    :cond_14
    sget v1, Ll/jbc0;->K5:I

    .line 221
    :goto_9
    invoke-virtual {p0, v1}, Ll/b690;->i(I)Ll/b690;

    move-result-object p0

    .line 222
    const-string v1, "\u6bcf\u65e5\u5fc3\u52a8"

    invoke-virtual {p0, v1}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 223
    invoke-virtual {p0, v0}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 224
    invoke-virtual {p0, v0}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 225
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 226
    :cond_15
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 227
    invoke-virtual {v0, p0}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    sget v0, Ll/jbc0;->M5:I

    .line 228
    invoke-virtual {p0, v0}, Ll/b690;->i(I)Ll/b690;

    move-result-object p0

    .line 229
    invoke-static {}, Ll/j690;->C()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "SVIP\u5168\u90e8%s\u9879\u7279\u6743"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 230
    invoke-static {}, Ll/j690;->C()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "\u5305\u542b\u63ed\u79d8\u559c\u6b22\u6211\u7684\u4eba\u3001\u95ea\u804a\u5339\u914d\u3001\u6bcf\u67083\u6b21\u4f18\u5148\u63a8\u8350\u7b49\u5168\u90e8%s\u9879\u7279\u6743"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 231
    invoke-static {}, Ll/j690;->C()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 232
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 233
    :cond_16
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v0

    .line 234
    invoke-virtual {v0}, Ll/j49;->e()Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;

    move-result-object v0

    .line 235
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;->Xm()I

    move-result v0

    .line 236
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const-string v2, "\u6bcf\u6708%\u6b21\u673a\u4f1a\uff0c\u5f00\u542f\u540e\u8bbf\u95ee\u5176\u4ed6\u4eba\uff0c\u5bf9\u65b9\u5c06\u4e0d\u4f1a\u770b\u5230\u4f60\u7684\u8bbf\u95ee\u8bb0\u5f55"

    invoke-static {v1, v2, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 237
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v1

    .line 238
    invoke-virtual {v1, p0}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    const-string v1, "\u9690\u85cf\u6211\u7684\u8bbf\u95ee\u8db3\u8ff9"

    .line 239
    invoke-virtual {p0, v1}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 240
    invoke-virtual {p0, v0}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 241
    invoke-virtual {p0, v0}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 242
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 243
    :cond_17
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 244
    invoke-virtual {v0, p0}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    const-string v0, "\u4e13\u5c5e\u5ba2\u670d"

    .line 245
    invoke-virtual {p0, v0}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 246
    const-string v0, "\u4e00\u5bf9\u4e00\u4e13\u5c5e\u5ba2\u670d\uff0c\u4e3a\u4f60\u7684\u4f53\u9a8c\u4fdd\u9a7e\u62a4\u822a"

    invoke-virtual {p0, v0}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 247
    invoke-virtual {p0, v0}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 248
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 249
    :cond_18
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 250
    invoke-virtual {v0, p0}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->a4:I

    .line 251
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->Z3:I

    .line 252
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->Z3:I

    .line 253
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 254
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 255
    :cond_19
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 256
    invoke-virtual {v0, p0}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    sget v0, Ll/jbc0;->pc:I

    .line 257
    invoke-virtual {p0, v0}, Ll/b690;->e(I)Ll/b690;

    move-result-object p0

    sget v0, Ll/h9c0;->p0:I

    sget v1, Ll/h9c0;->o0:I

    .line 258
    invoke-virtual {p0, v0, v1}, Ll/b690;->h(II)Ll/b690;

    move-result-object p0

    .line 259
    const-string v0, "\u9690\u85cf\u6d3b\u8dc3\u65f6\u95f4"

    invoke-virtual {p0, v0}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 260
    invoke-virtual {p0, v0}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 261
    invoke-virtual {p0, v0}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 262
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 263
    :cond_1a
    invoke-static {}, Ll/c17;->u0()Z

    move-result v0

    .line 264
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v1

    .line 265
    invoke-virtual {v1, p0}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    sget v1, Ll/jbc0;->Bc:I

    .line 266
    invoke-virtual {p0, v1}, Ll/b690;->e(I)Ll/b690;

    move-result-object p0

    sget v1, Ll/h9c0;->r0:I

    sget v2, Ll/h9c0;->q0:I

    .line 267
    invoke-virtual {p0, v1, v2}, Ll/b690;->h(II)Ll/b690;

    move-result-object p0

    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->n1:I

    .line 268
    invoke-virtual {p0, v1}, Ll/b690;->n(I)Ll/b690;

    move-result-object p0

    if-eqz v0, :cond_1b

    .line 269
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->m1:I

    goto :goto_a

    .line 270
    :cond_1b
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->l1:I

    .line 271
    :goto_a
    invoke-virtual {p0, v1}, Ll/b690;->l(I)Ll/b690;

    move-result-object p0

    if-eqz v0, :cond_1c

    .line 272
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->m1:I

    goto :goto_b

    .line 273
    :cond_1c
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->l1:I

    .line 274
    :goto_b
    invoke-virtual {p0, v0}, Ll/b690;->f(I)Ll/b690;

    move-result-object p0

    .line 275
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 276
    :cond_1d
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v0

    .line 277
    invoke-virtual {v0, p0}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    sget v0, Ll/jbc0;->Kc:I

    .line 278
    invoke-virtual {p0, v0}, Ll/b690;->i(I)Ll/b690;

    move-result-object p0

    sget v0, Ll/jbc0;->uc:I

    .line 279
    invoke-virtual {p0, v0}, Ll/b690;->e(I)Ll/b690;

    move-result-object p0

    sget v0, Ll/h9c0;->m0:I

    sget v1, Ll/h9c0;->l0:I

    .line 280
    invoke-virtual {p0, v0, v1}, Ll/b690;->h(II)Ll/b690;

    move-result-object p0

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->X0:I

    .line 281
    invoke-virtual {p0, v0}, Ll/b690;->n(I)Ll/b690;

    move-result-object p0

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->W0:I

    .line 282
    invoke-virtual {p0, v0}, Ll/b690;->l(I)Ll/b690;

    move-result-object p0

    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->W0:I

    .line 283
    invoke-virtual {p0, v0}, Ll/b690;->f(I)Ll/b690;

    move-result-object p0

    .line 284
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 285
    :cond_1e
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->o1:I

    .line 286
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 287
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v1

    .line 288
    invoke-virtual {v1, p0}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    sget v1, Ll/jbc0;->Nc:I

    .line 289
    invoke-virtual {p0, v1}, Ll/b690;->i(I)Ll/b690;

    move-result-object p0

    sget v1, Ll/jbc0;->Ec:I

    .line 290
    invoke-virtual {p0, v1}, Ll/b690;->e(I)Ll/b690;

    move-result-object p0

    sget v1, Ll/h9c0;->t0:I

    sget v2, Ll/h9c0;->s0:I

    .line 291
    invoke-virtual {p0, v1, v2}, Ll/b690;->h(II)Ll/b690;

    move-result-object p0

    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->p1:I

    .line 292
    invoke-virtual {p0, v1}, Ll/b690;->n(I)Ll/b690;

    move-result-object p0

    .line 293
    invoke-virtual {p0, v0}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 294
    invoke-virtual {p0, v0}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 295
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    .line 296
    :cond_1f
    invoke-static {}, Ll/c17;->u0()Z

    move-result v0

    if-eqz v0, :cond_20

    .line 297
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->f1:I

    goto :goto_c

    .line 298
    :cond_20
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->e1:I

    .line 299
    :goto_c
    invoke-static {}, Ll/b690;->b()Ll/b690;

    move-result-object v1

    .line 300
    invoke-virtual {v1, p0}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    move-result-object p0

    sget v1, Ll/jbc0;->T9:I

    .line 301
    invoke-virtual {p0, v1}, Ll/b690;->i(I)Ll/b690;

    move-result-object p0

    sget v1, Ll/jbc0;->u9:I

    .line 302
    invoke-virtual {p0, v1}, Ll/b690;->e(I)Ll/b690;

    move-result-object p0

    sget v1, Ll/h9c0;->p0:I

    sget v2, Ll/h9c0;->o0:I

    .line 303
    invoke-virtual {p0, v1, v2}, Ll/b690;->h(II)Ll/b690;

    move-result-object p0

    .line 304
    const-string v1, "\u6bcf\u59293\u4e2a\u8d85\u7ea7\u559c\u6b22"

    invoke-virtual {p0, v1}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    move-result-object p0

    .line 305
    invoke-virtual {p0, v0}, Ll/b690;->l(I)Ll/b690;

    move-result-object p0

    .line 306
    invoke-virtual {p0, v0}, Ll/b690;->f(I)Ll/b690;

    move-result-object p0

    .line 307
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    move-result-object p0

    return-object p0

    :pswitch_data_0
    .packed-switch 0x6
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xc
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x2e
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static p(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/util/List;Lcom/p1/mobile/putong/core/data/Privilege;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ">;",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ")",
            "Ljava/util/List<",
            "Ll/a690;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/g690;

    .line 7
    .line 8
    invoke-direct {v1, p0, p2, v0}, Ll/g690;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p1, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public static q(Ljava/util/List;Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ">;",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ")",
            "Ljava/util/List<",
            "Ll/a690;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/d690;

    .line 7
    .line 8
    invoke-direct {v1, p2, p1, v0}, Ll/d690;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public static r()Ll/a690;
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->t5()Lcom/p1/mobile/putong/core/api/CoreLikers$a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget v0, v0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->b:I

    .line 14
    .line 15
    :goto_0
    invoke-static {}, Ll/b690;->b()Ll/b690;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-virtual {v1, v2}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    sget v2, Ll/jbc0;->vc:I

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Ll/b690;->i(I)Ll/b690;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->o9:I

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Ll/b690;->n(I)Ll/b690;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    if-lez v0, :cond_1

    .line 37
    .line 38
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 39
    .line 40
    sget v3, Lcom/p1/mobile/putong/core/pay/R$string;->n9:I

    .line 41
    .line 42
    new-instance v4, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string v0, ""

    .line 51
    .line 52
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v2, v3, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    goto :goto_1

    .line 68
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 69
    .line 70
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->m9:I

    .line 71
    .line 72
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    :goto_1
    invoke-virtual {v1, v0}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->l9:I

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Ll/b690;->f(I)Ll/b690;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {v0}, Ll/b690;->a()Ll/a690;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    return-object v0
.end method

.method public static s(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {p0}, Ll/wib0;->o(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "\u5c55\u793a \u767d\u91d1\u4f1a\u5458 \u5c0a\u8d35\u6807\u8bc6\uff0c\u6216\u8005\u4f4e\u8c03\u5730\u9690\u85cf\u4f1a\u5458\u8eab\u4efd"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 11
    .line 12
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->i1:I

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static t()Ljava/lang/String;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->j1:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method public static u()Ljava/lang/String;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->O9:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method public static v()Ljava/lang/String;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->r1:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method public static w()Ljava/lang/String;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->q1:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method public static x()Ljava/lang/String;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->s1:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method public static y()Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 6
    .line 7
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/data/PurchaseType;->getPrivilegeData(Lcom/p1/mobile/putong/data/Gender;)Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    return-object v0
.end method

.method public static z()Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 6
    .line 7
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/data/PurchaseType;->getPrivilegeDataForGP(Lcom/p1/mobile/putong/data/Gender;)Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    return-object v0
.end method
