.class public final Ll/fix;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/fix$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u000b\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J%\u0010\u000b\u001a\u00020\n2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\'\u0010\u000f\u001a\u00020\n2\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u001f\u0010\u0011\u001a\u00020\n2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u000e\u001a\u00020\rH\u0002\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\u000f\u0010\u0013\u001a\u00020\nH\u0002\u00a2\u0006\u0004\u0008\u0013\u0010\u0003J\u001f\u0010\u0014\u001a\u00020\n2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u000e\u001a\u00020\rH\u0002\u00a2\u0006\u0004\u0008\u0014\u0010\u0012J\u0017\u0010\u0015\u001a\u00020\n2\u0006\u0010\u0005\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008\u0015\u0010\u0016J\u0017\u0010\u0017\u001a\u00020\n2\u0006\u0010\u0005\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008\u0017\u0010\u0016\u00a8\u0006\u0018"
    }
    d2 = {
        "Ll/fix;",
        "",
        "<init>",
        "()V",
        "Lcom/p1/mobile/android/app/Act;",
        "act",
        "Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;",
        "type",
        "",
        "layoutType",
        "",
        "a",
        "(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;Ljava/lang/String;)V",
        "Lcom/p1/mobile/putong/data/User;",
        "me",
        "g",
        "(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;Ljava/lang/String;)V",
        "b",
        "(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V",
        "f",
        "e",
        "c",
        "(Lcom/p1/mobile/android/app/Act;)V",
        "d",
        "b_core_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Ll/fix;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/fix;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/fix;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/fix;->INSTANCE:Ll/fix;

    .line 7
    .line 8
    return-void
.end method

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
.method public final a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;Ljava/lang/String;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-virtual {p0, v0, p2, p3}, Ll/fix;->g(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sget-object p3, Ll/fix$a;->a:[I

    .line 25
    .line 26
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    aget p2, p3, p2

    .line 31
    .line 32
    const/4 p3, 0x1

    .line 33
    if-eq p2, p3, :cond_4

    .line 34
    .line 35
    const/4 p3, 0x2

    .line 36
    if-eq p2, p3, :cond_3

    .line 37
    .line 38
    const/4 p3, 0x3

    .line 39
    if-eq p2, p3, :cond_2

    .line 40
    .line 41
    const/4 p3, 0x4

    .line 42
    if-ne p2, p3, :cond_1

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Ll/fix;->d(Lcom/p1/mobile/android/app/Act;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    invoke-static {}, Ll/nbr;->a()V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    invoke-virtual {p0, p1}, Ll/fix;->c(Lcom/p1/mobile/android/app/Act;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_3
    invoke-virtual {p0, p1, v0}, Ll/fix;->e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_4
    invoke-virtual {p0, p1, v0}, Ll/fix;->b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public final b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V
    .locals 8

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isUltraPremium()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/joa;->k4()Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-nez p2, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/fix;->f()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 20
    .line 21
    invoke-virtual {p2}, Ll/m27;->F3()Z

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    if-eqz p2, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/fix;->f()V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    invoke-static {}, Ll/y63;->j()Ll/y63;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Ll/y63;->o()Lrx/subjects/a;

    .line 36
    .line 37
    .line 38
    sget-object v0, Ll/ma3;->Companion:Ll/ma3$a;

    .line 39
    .line 40
    const/16 v6, 0x8

    .line 41
    .line 42
    const/4 v7, 0x0

    .line 43
    const/4 v2, 0x0

    .line 44
    const/4 v3, 0x0

    .line 45
    const/4 v4, 0x0

    .line 46
    const-string v5, "p_navigation_view,e_intl_me_tab_consumables_sku_click,click"

    .line 47
    .line 48
    move-object v1, p1

    .line 49
    invoke-static/range {v0 .. v7}, Ll/ma3$a;->h(Ll/ma3$a;Lcom/p1/mobile/android/app/Act;ZLl/x20;ZLjava/lang/String;ILjava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final c(Lcom/p1/mobile/android/app/Act;)V
    .locals 7

    .line 1
    sget-object v0, Ll/o8n;->Companion:Ll/o8n$b;

    .line 2
    .line 3
    const/16 v5, 0xc

    .line 4
    .line 5
    const/4 v6, 0x0

    .line 6
    const-string v2, "p_navigation_view,e_intl_me_tab_consumables_sku_click,click"

    .line 7
    .line 8
    const/4 v3, 0x0

    .line 9
    const/4 v4, 0x0

    .line 10
    move-object v1, p1

    .line 11
    invoke-static/range {v0 .. v6}, Ll/o8n$b;->b(Ll/o8n$b;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/a30;Ll/x20;ILjava/lang/Object;)Ll/o8n;

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final d(Lcom/p1/mobile/android/app/Act;)V
    .locals 9

    .line 1
    invoke-static {}, Ll/gix;->c()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object v5, Lcom/p1/mobile/putong/core/data/Privilege;->immediately_match:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 8
    .line 9
    const/16 v7, 0x5c

    .line 10
    .line 11
    const/4 v8, 0x0

    .line 12
    const-string v1, "p_navigation_view,e_intl_me_tab_consumables_sku_click,click"

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    const/4 v3, 0x0

    .line 16
    const/4 v4, 0x0

    .line 17
    const/4 v6, 0x0

    .line 18
    move-object v0, p1

    .line 19
    invoke-static/range {v0 .. v8}, Lcom/p1/mobile/putong/core/ui/purchase/c;->N0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/core/data/Privilege;Ljava/lang/String;ILjava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    move-object v0, p1

    .line 24
    new-instance p0, Ll/nxm$e;

    .line 25
    .line 26
    invoke-direct {p0, v0}, Ll/nxm$e;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 27
    .line 28
    .line 29
    const-string p1, "p_navigation_view,e_intl_me_tab_consumables_sku_click,click"

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Ll/nxm$e;->b(Ljava/lang/String;)Ll/nxm$e;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Ll/nxm$e;->d()Ll/nxm;

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V
    .locals 6

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isUltraPremium()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Ll/joa;->k4()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_1

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Br:I

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    sget p0, Lcom/p1/mobile/putong/core/R$string;->ut:I

    .line 23
    .line 24
    :goto_0
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    const/16 v4, 0xc

    .line 29
    .line 30
    const/4 v5, 0x0

    .line 31
    const-string v1, "p_navigation_view,e_intl_me_tab_consumables_sku_click,click"

    .line 32
    .line 33
    const/4 v2, 0x0

    .line 34
    const/4 v3, 0x0

    .line 35
    move-object v0, p1

    .line 36
    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/purchase/c;->H1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ILl/a30;ILjava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final f()V
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/core/R$string;->rt:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final g(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isUltraPremium()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x1

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    const-string p0, "ultra_premium"

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isSVIP()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    const-string p0, "premium"

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    const/4 p0, 0x0

    .line 21
    invoke-static {p0, v0, p0}, Ll/rbb0;->s(Lcom/p1/mobile/putong/data/Counter;ILjava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-nez p0, :cond_2

    .line 26
    .line 27
    const-string p0, "see"

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-eqz p0, :cond_3

    .line 35
    .line 36
    const-string p0, "vip"

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_3
    const-string p0, "free"

    .line 40
    .line 41
    :goto_0
    sget-object p1, Ll/fix$a;->a:[I

    .line 42
    .line 43
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    aget p1, p1, v1

    .line 48
    .line 49
    if-eq p1, v0, :cond_7

    .line 50
    .line 51
    const/4 v1, 0x2

    .line 52
    if-eq p1, v1, :cond_6

    .line 53
    .line 54
    const/4 v1, 0x3

    .line 55
    if-eq p1, v1, :cond_5

    .line 56
    .line 57
    const/4 v1, 0x4

    .line 58
    if-ne p1, v1, :cond_4

    .line 59
    .line 60
    const-string p1, "instant_match"

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_4
    invoke-static {}, Ll/nbr;->a()V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_5
    const-string p1, "compliment"

    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_6
    const-string p1, "superlike"

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_7
    const-string p1, "boost"

    .line 74
    .line 75
    :goto_1
    invoke-static {p2}, Ll/gix;->f(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;)I

    .line 76
    .line 77
    .line 78
    move-result p2

    .line 79
    if-lez p2, :cond_8

    .line 80
    .line 81
    goto :goto_2

    .line 82
    :cond_8
    const/4 v0, 0x0

    .line 83
    :goto_2
    sget-object p2, Ll/box;->INSTANCE:Ll/box;

    .line 84
    .line 85
    invoke-virtual {p2, p0, p1, p3, v0}, Ll/box;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 86
    .line 87
    .line 88
    return-void
.end method
