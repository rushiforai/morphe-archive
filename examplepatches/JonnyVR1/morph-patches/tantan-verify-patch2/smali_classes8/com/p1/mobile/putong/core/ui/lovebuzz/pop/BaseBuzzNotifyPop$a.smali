.class public final Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "com/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop$a",
        "Landroid/animation/AnimatorListenerAdapter;",
        "Landroid/animation/Animator;",
        "animation",
        "",
        "onAnimationEnd",
        "(Landroid/animation/Animator;)V",
        "buzz_intlGmsRelease"
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
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop$a;->a:Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop$a;->a:Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->getType$buzz_intlGmsRelease()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string v0, "textBuzz"

    .line 14
    .line 15
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-nez p1, :cond_1

    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop$a;->a:Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;

    .line 22
    .line 23
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->k0(Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    sget-object p1, Ll/nbw;->INSTANCE:Ll/nbw;

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop$a;->a:Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->getType$buzz_intlGmsRelease()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p1, v0}, Ll/nbw;->W(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 41
    .line 42
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop$a;->a:Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;

    .line 45
    .line 46
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->l0(Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/c0;->u(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    sget-object p0, Ll/haw;->Companion:Ll/haw$a;

    .line 54
    .line 55
    invoke-virtual {p0}, Ll/haw$a;->a()Ll/haw;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0}, Ll/haw;->G0()Lrx/subjects/a;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    const-string p1, "intl.text.lovebuzz.close.notify"

    .line 64
    .line 65
    const/4 v0, 0x0

    .line 66
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_1
    sget-object p1, Ll/k8w;->INSTANCE:Ll/k8w;

    .line 75
    .line 76
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop$a;->a:Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;

    .line 77
    .line 78
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->get_buzz_progress_bar()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzProgressBar;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop$a;->a:Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;

    .line 83
    .line 84
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->get_close_buzz()Landroid/view/View;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    const/4 v2, 0x2

    .line 89
    new-array v3, v2, [Landroid/view/View;

    .line 90
    .line 91
    const/4 v4, 0x0

    .line 92
    aput-object v0, v3, v4

    .line 93
    .line 94
    const/4 v0, 0x1

    .line 95
    aput-object v1, v3, v0

    .line 96
    .line 97
    invoke-virtual {p1, v3}, Ll/k8w;->j([Landroid/view/View;)V

    .line 98
    .line 99
    .line 100
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop$a;->a:Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;

    .line 101
    .line 102
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->get_accept_buzz()Lv/VText;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop$a;->a:Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;

    .line 107
    .line 108
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->get_refuse_buzz()Lv/VText;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    new-array v2, v2, [Landroid/view/View;

    .line 113
    .line 114
    aput-object v1, v2, v4

    .line 115
    .line 116
    aput-object p0, v2, v0

    .line 117
    .line 118
    invoke-virtual {p1, v2}, Ll/k8w;->l([Landroid/view/View;)V

    .line 119
    .line 120
    .line 121
    return-void
.end method
