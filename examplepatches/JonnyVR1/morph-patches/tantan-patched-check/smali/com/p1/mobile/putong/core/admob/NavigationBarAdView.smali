.class public final Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;
.super Lv/VFrame;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010\u000b\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0018\u00002\u00020\u0001B\u001d\u0008\u0007\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\n\u0008\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u000f\u0010\t\u001a\u00020\u0008H\u0014\u00a2\u0006\u0004\u0008\t\u0010\nJ\u0015\u0010\r\u001a\u00020\u00082\u0006\u0010\u000c\u001a\u00020\u000b\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\r\u0010\u000f\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u000f\u0010\nJ\r\u0010\u0010\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u0010\u0010\nJ\r\u0010\u0011\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u0011\u0010\nJ\u0019\u0010\u0014\u001a\u00020\u00082\u0008\u0008\u0002\u0010\u0013\u001a\u00020\u0012H\u0002\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J\u000f\u0010\u0016\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008\u0016\u0010\nJ\u000f\u0010\u0017\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008\u0017\u0010\nR\u0018\u0010\u001a\u001a\u0004\u0018\u00010\u00018\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0018\u0010\u0019R\u0018\u0010\u001e\u001a\u0004\u0018\u00010\u001b8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001c\u0010\u001d\u00a8\u0006\u001f"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;",
        "Lv/VFrame;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
        "",
        "onFinishInflate",
        "()V",
        "Lcom/p1/mobile/android/app/Act;",
        "act",
        "L",
        "(Lcom/p1/mobile/android/app/Act;)V",
        "E",
        "G",
        "M",
        "",
        "byUser",
        "B",
        "(Z)V",
        "K",
        "F",
        "a",
        "Lv/VFrame;",
        "adContainer",
        "Landroid/view/View;",
        "b",
        "Landroid/view/View;",
        "admobClose",
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


# instance fields
.field public a:Lv/VFrame;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public b:Landroid/view/View;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-direct {p0, p1, v0, v1, v0}, Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 3
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public static synthetic C(Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;ZILjava/lang/Object;)V
    .locals 0

    .line 1
    and-int/lit8 p2, p2, 0x1

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;->B(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static p(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->INSTANCE:Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->d()V

    .line 4
    .line 5
    .line 6
    const-string p0, "load_result"

    .line 7
    .line 8
    const-string v0, "fail_no_fill"

    .line 9
    .line 10
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    filled-new-array {p0}, [Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string v0, "e_intl_ad_request_call"

    .line 19
    .line 20
    const-string v1, "p_intl_main_ad_view"

    .line 21
    .line 22
    invoke-static {v0, v1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static s(Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;Ljava/lang/String;)V
    .locals 3

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->INSTANCE:Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->e()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->x()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;->K()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    const/4 v0, 0x1

    .line 21
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;->K()V

    .line 25
    .line 26
    .line 27
    const-string p0, "load_result"

    .line 28
    .line 29
    const-string v1, "success"

    .line 30
    .line 31
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    filled-new-array {p0}, [Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string v1, "e_intl_ad_request_call"

    .line 40
    .line 41
    const-string v2, "p_intl_main_ad_view"

    .line 42
    .line 43
    invoke-static {v1, v2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 44
    .line 45
    .line 46
    new-instance p0, Ll/l4g0;

    .line 47
    .line 48
    const-class v1, Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;

    .line 49
    .line 50
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-direct {p0, v2, v1}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    const-string v1, "ad_unit_id"

    .line 58
    .line 59
    const-string v2, "ca-app-pub-6567608331519569/1242795139"

    .line 60
    .line 61
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->m()I

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-ne p1, v0, :cond_1

    .line 70
    .line 71
    const-string p1, "cold_start"

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_1
    const-string p1, "tab_refresh"

    .line 75
    .line 76
    :goto_0
    const-string v0, "request_type"

    .line 77
    .line 78
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    filled-new-array {v1, p1}, [Ll/pf60;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-virtual {p0, p1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 87
    .line 88
    .line 89
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public static u(Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;)Lkotlin/Unit;
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    const/4 v2, 0x0

    .line 4
    invoke-static {p0, v2, v0, v1}, Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;->C(Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;ZILjava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 8
    .line 9
    return-object p0
.end method

.method public static v(Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;Ljava/lang/String;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;->B(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static w(Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;->B(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static z(Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;)Lkotlin/Unit;
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    const/4 v2, 0x0

    .line 4
    invoke-static {p0, v2, v0, v1}, Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;->C(Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;ZILjava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 8
    .line 9
    return-object p0
.end method


# virtual methods
.method public final B(Z)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->INSTANCE:Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->c()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;->F()V

    .line 7
    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->n()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string p1, "session_swipe_count"

    .line 20
    .line 21
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    filled-new-array {p0}, [Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string p1, "e_intl_ad_banner_close"

    .line 30
    .line 31
    const-string v0, "p_intl_main_ad_view"

    .line 32
    .line 33
    invoke-static {p1, v0, p0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public final E()V
    .locals 1

    return-void

    .line 1
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;->K()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final F()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;->a:Lv/VFrame;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;->K()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final G()V
    .locals 1

    return-void

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->INSTANCE:Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->p()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;->K()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final K()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->INSTANCE:Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->h()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->INSTANCE:Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->z(I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final L(Lcom/p1/mobile/android/app/Act;)V
    .locals 4
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    return-void

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;->a:Lv/VFrame;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->INSTANCE:Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;

    .line 10
    .line 11
    new-instance v1, Ll/ff20;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/ff20;-><init>(Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->g(Lkotlin/jvm/functions/Function0;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-nez v1, :cond_1

    .line 21
    .line 22
    :goto_0
    return-void

    .line 23
    :cond_1
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->f()V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Ll/u2n;->l()Ll/u2n;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const/16 v1, 0xb

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ll/u2n;->j(I)Ll/o2n;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 37
    .line 38
    .line 39
    check-cast v0, Ll/fsw;

    .line 40
    .line 41
    new-instance v1, Ll/gf20;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/gf20;-><init>(Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;)V

    .line 44
    .line 45
    .line 46
    new-instance v2, Ll/hf20;

    .line 47
    .line 48
    invoke-direct {v2, p0}, Ll/hf20;-><init>(Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;)V

    .line 49
    .line 50
    .line 51
    new-instance v3, Ll/if20;

    .line 52
    .line 53
    invoke-direct {v3}, Ll/if20;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, v1, v2, v3}, Ll/fsw;->t(Ll/y20;Ll/y20;Ll/y20;)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;->a:Lv/VFrame;

    .line 60
    .line 61
    invoke-virtual {v0, p1, p0}, Ll/fsw;->h(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public final M()V
    .locals 2

    return-void

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;->a:Lv/VFrame;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->INSTANCE:Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->p()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    new-instance v1, Ll/ef20;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/ef20;-><init>(Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->g(Lkotlin/jvm/functions/Function0;)Z

    .line 20
    .line 21
    .line 22
    :cond_1
    :goto_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget v1, Ll/kec0;->pe:I

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-static {v0, v1, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    .line 23
    .line 24
    const/4 v2, -0x1

    .line 25
    const/4 v3, -0x2

    .line 26
    invoke-direct {v1, v2, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 30
    .line 31
    .line 32
    sget v0, Ll/adc0;->k:I

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Lv/VFrame;

    .line 39
    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;->a:Lv/VFrame;

    .line 41
    .line 42
    sget v0, Ll/adc0;->y:I

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iput-object v0, p0, Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;->b:Landroid/view/View;

    .line 49
    .line 50
    new-instance v1, Ll/df20;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Ll/df20;-><init>(Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method
