.class public Ll/f5q0$b;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/f5q0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/f5q0;


# direct methods
.method public constructor <init>(Ll/f5q0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/f5q0$b;->a:Ll/f5q0;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 6
    .param p1    # Landroid/os/Message;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget p1, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const/16 v0, 0x2711

    .line 4
    .line 5
    const-string v1, "privacy_check_tip"

    .line 6
    .line 7
    const/16 v2, 0x2712

    .line 8
    .line 9
    if-eq p1, v0, :cond_1

    .line 10
    .line 11
    if-eq p1, v2, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    invoke-virtual {p0, v2}, Landroid/os/Handler;->hasMessages(I)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    const-wide/16 v3, 0x7d0

    .line 27
    .line 28
    if-eqz p1, :cond_2

    .line 29
    .line 30
    invoke-virtual {p0, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, v2, v3, v4}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_2
    const-string p1, "agreement_entrance"

    .line 38
    .line 39
    const-string v0, "landing_page"

    .line 40
    .line 41
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    filled-new-array {p1}, [Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    const-string v0, "e_agree_privacy_policy"

    .line 50
    .line 51
    const-string v5, "p_sign_in_type_selection_view"

    .line 52
    .line 53
    invoke-static {v0, v5, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 54
    .line 55
    .line 56
    new-instance p1, Lcom/p1/mobile/android/ui/bubble/a;

    .line 57
    .line 58
    iget-object v0, p0, Ll/f5q0$b;->a:Ll/f5q0;

    .line 59
    .line 60
    invoke-interface {v0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-direct {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Ll/f5q0$b;->a:Ll/f5q0;

    .line 68
    .line 69
    invoke-interface {v0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    sget v5, Lcom/p1/mobile/putong/account/R$string;->H2:I

    .line 78
    .line 79
    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    const/high16 v0, 0x41500000    # 13.0f

    .line 88
    .line 89
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->J(F)Lcom/p1/mobile/android/ui/bubble/a;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    sget v0, Ll/qa00;->g:I

    .line 94
    .line 95
    neg-int v0, v0

    .line 96
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->x(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    sget v0, Lcom/p1/mobile/android/ui/bubble/a;->O:I

    .line 101
    .line 102
    const/high16 v5, 0x41400000    # 12.0f

    .line 103
    .line 104
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 105
    .line 106
    .line 107
    move-result v5

    .line 108
    invoke-virtual {p1, v0, v5}, Lcom/p1/mobile/android/ui/bubble/a;->o(II)Lcom/p1/mobile/android/ui/bubble/a;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    sget v0, Lcom/p1/mobile/android/ui/bubble/a;->O:I

    .line 113
    .line 114
    sget v5, Lcom/p1/mobile/android/ui/bubble/a;->Q:I

    .line 115
    .line 116
    or-int/2addr v0, v5

    .line 117
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    iget-object v5, p0, Ll/f5q0$b;->a:Ll/f5q0;

    .line 126
    .line 127
    iget-object v5, v5, Ll/f5q0;->K:Lv/VCheckBox;

    .line 128
    .line 129
    invoke-virtual {v0, p1, v5, v1}, Lcom/p1/mobile/android/ui/bubble/d;->u(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p0, v2, v3, v4}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 133
    .line 134
    .line 135
    return-void
.end method
