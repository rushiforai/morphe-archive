.class public final Ll/iix;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0004\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003JM\u0010\u0010\u001a\u00020\u000e2\u0006\u0010\u0005\u001a\u00020\u00042\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u00062\u0008\u0010\t\u001a\u0004\u0018\u00010\u00082\u000e\u0010\u000c\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u000b0\n2\u0012\u0010\u000f\u001a\u000e\u0012\u0004\u0012\u00020\u000b\u0012\u0004\u0012\u00020\u000e0\r\u00a2\u0006\u0004\u0008\u0010\u0010\u0011\u00a8\u0006\u0012"
    }
    d2 = {
        "Ll/iix;",
        "",
        "<init>",
        "()V",
        "Landroid/view/ViewGroup;",
        "container",
        "Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;",
        "guide",
        "Lcom/p1/mobile/android/app/Act;",
        "act",
        "Lkotlin/Function0;",
        "Lcom/p1/mobile/putong/core/newui/profile/newme/ProfilePrivilegePayGuide;",
        "bannerRef",
        "Lkotlin/Function1;",
        "",
        "onBannerCreated",
        "a",
        "(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;Lcom/p1/mobile/android/app/Act;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;)V",
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
.field public static final INSTANCE:Ll/iix;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/iix;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/iix;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/iix;->INSTANCE:Ll/iix;

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
.method public final a(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;Lcom/p1/mobile/android/app/Act;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;)V
    .locals 1
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p4    # Lkotlin/jvm/functions/Function0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p5    # Lkotlin/jvm/functions/Function1;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;",
            "Lcom/p1/mobile/android/app/Act;",
            "Lkotlin/jvm/functions/Function0<",
            "Lcom/p1/mobile/putong/core/newui/profile/newme/ProfilePrivilegePayGuide;",
            ">;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Lcom/p1/mobile/putong/core/newui/profile/newme/ProfilePrivilegePayGuide;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    if-eqz p2, :cond_4

    .line 12
    .line 13
    iget-boolean v0, p2, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;->showBanner:Z

    .line 14
    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    invoke-interface {p4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p4

    .line 21
    check-cast p4, Lcom/p1/mobile/putong/core/newui/profile/newme/ProfilePrivilegePayGuide;

    .line 22
    .line 23
    if-nez p4, :cond_0

    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object p4

    .line 29
    invoke-static {p4}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 30
    .line 31
    .line 32
    move-result-object p4

    .line 33
    sget v0, Ll/kec0;->U4:I

    .line 34
    .line 35
    invoke-virtual {p4, v0, p1, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object p4

    .line 39
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 40
    .line 41
    .line 42
    check-cast p4, Lcom/p1/mobile/putong/core/newui/profile/newme/ProfilePrivilegePayGuide;

    .line 43
    .line 44
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, p4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 48
    .line 49
    .line 50
    invoke-interface {p5, p4}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    :cond_0
    invoke-virtual {p4}, Lcom/p1/mobile/putong/core/newui/profile/newme/ProfilePrivilegePayGuide;->l0()Z

    .line 54
    .line 55
    .line 56
    move-result p5

    .line 57
    if-eqz p5, :cond_1

    .line 58
    .line 59
    const/4 p0, 0x1

    .line 60
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 61
    .line 62
    .line 63
    invoke-static {p4, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p4, p2, p3}, Lcom/p1/mobile/putong/core/newui/profile/newme/ProfilePrivilegePayGuide;->m0(Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;Lcom/p1/mobile/android/app/Act;)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_1
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_2
    invoke-interface {p4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    check-cast p2, Lcom/p1/mobile/putong/core/newui/profile/newme/ProfilePrivilegePayGuide;

    .line 79
    .line 80
    if-eqz p2, :cond_3

    .line 81
    .line 82
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/core/newui/profile/newme/ProfilePrivilegePayGuide;->o0(Lcom/p1/mobile/android/app/Act;)V

    .line 83
    .line 84
    .line 85
    :cond_3
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_4
    invoke-interface {p4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object p2

    .line 93
    check-cast p2, Lcom/p1/mobile/putong/core/newui/profile/newme/ProfilePrivilegePayGuide;

    .line 94
    .line 95
    if-eqz p2, :cond_5

    .line 96
    .line 97
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/core/newui/profile/newme/ProfilePrivilegePayGuide;->o0(Lcom/p1/mobile/android/app/Act;)V

    .line 98
    .line 99
    .line 100
    :cond_5
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 101
    .line 102
    .line 103
    return-void
.end method
