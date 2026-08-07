.class public final Ll/c890;
.super Ll/y4;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/c890$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u0000 \u001a2\u00020\u0001:\u0001\u0007B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u000f\u0010\u0007\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u000f\u0010\n\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u000f\u0010\u000c\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\u000c\u0010\u000bJ\u000f\u0010\u000e\u001a\u00020\rH\u0016\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\u000f\u0010\u0010\u001a\u00020\tH\u0002\u00a2\u0006\u0004\u0008\u0010\u0010\u000bJ\u000f\u0010\u0011\u001a\u00020\rH\u0002\u00a2\u0006\u0004\u0008\u0011\u0010\u000fR\u0018\u0010\u0015\u001a\u0004\u0018\u00010\u00128\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0013\u0010\u0014R\u0018\u0010\u0019\u001a\u0004\u0018\u00010\u00168\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0017\u0010\u0018\u00a8\u0006\u001b"
    }
    d2 = {
        "Ll/c890;",
        "Ll/y4;",
        "Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;",
        "privilegeEntranceInfo",
        "<init>",
        "(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V",
        "",
        "a",
        "()Z",
        "",
        "b",
        "()V",
        "m",
        "",
        "h",
        "()Ljava/lang/String;",
        "s",
        "r",
        "Lcom/p1/mobile/putong/core/data/Merchandise;",
        "d",
        "Lcom/p1/mobile/putong/core/data/Merchandise;",
        "merchandise",
        "Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceDefaultView;",
        "e",
        "Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceDefaultView;",
        "_default_view",
        "Companion",
        "pay_intlGmsRelease"
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
.field public static final Companion:Ll/c890$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public d:Lcom/p1/mobile/putong/core/data/Merchandise;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public e:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceDefaultView;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/c890$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/c890$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/c890;->Companion:Ll/c890$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ll/y4;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static p(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthly()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static synthetic q(Ll/c890;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/c890;->t(Ll/c890;Landroid/view/View;)V

    return-void
.end method

.method public static final t(Ll/c890;Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/c890;->h()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Ll/y4;->f()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/cs20;->a()Ll/cs20;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Ll/cs20;->f()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Ie()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, p1}, Ll/y4;->o(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Tn()I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {p0}, Ll/y4;->g()Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;->a()Lcom/p1/mobile/android/app/Act;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    const-string v2, "p_privilege,navigation_banner"

    .line 70
    .line 71
    invoke-interface {v0, v1, v2, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->nk(Landroid/content/Context;Ljava/lang/String;I)Landroid/content/Intent;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p0}, Ll/y4;->g()Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;->a()Lcom/p1/mobile/android/app/Act;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public b()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/c890;->s()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/c890;->e:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceDefaultView;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/y4;->g()Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;->a()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0}, Ll/y4;->g()Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;->c()Landroid/view/ViewGroup;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    sget-object v2, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeViewType;->DEFAULT_PRIVILEGE_VIEW:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeViewType;

    .line 25
    .line 26
    invoke-virtual {p0, v0, v1, v2}, Ll/y4;->i(Landroid/content/Context;Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeViewType;)Ll/n3m;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceDefaultView;

    .line 31
    .line 32
    iput-object v0, p0, Ll/c890;->e:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceDefaultView;

    .line 33
    .line 34
    :cond_0
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 35
    .line 36
    const/16 v1, 0x46

    .line 37
    .line 38
    invoke-static {v1}, Ll/txq;->c(I)I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    const/4 v2, -0x1

    .line 43
    invoke-direct {v0, v2, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 44
    .line 45
    .line 46
    const/4 v1, 0x5

    .line 47
    invoke-static {v1}, Ll/txq;->c(I)I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 52
    .line 53
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 54
    .line 55
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 56
    .line 57
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/y4;->g()Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;->c()Landroid/view/ViewGroup;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    iget-object p0, p0, Ll/c890;->e:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceDefaultView;

    .line 68
    .line 69
    invoke-virtual {v1, p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public h()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const-string p0, "e_privilege_banner_default"

    .line 2
    .line 3
    return-object p0
.end method

.method public m()V
    .locals 5

    .line 1
    invoke-super {p0}, Ll/y4;->m()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/y4;->g()Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;->c()Landroid/view/ViewGroup;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget v1, Ll/jbc0;->k3:I

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/c890;->e:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceDefaultView;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceDefaultView;->get_texture()Lv/VImage;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    sget v2, Ll/jbc0;->h6:I

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceDefaultView;->get_border()Lv/VImage;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    sget v2, Ll/jbc0;->l3:I

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceDefaultView;->get_arrow_right()Lv/VImage;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    sget v2, Ll/jbc0;->A9:I

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceDefaultView;->get_title()Lv/VText;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->Q9:I

    .line 53
    .line 54
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Ll/y4;->g()Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;->a()Lcom/p1/mobile/android/app/Act;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    sget v2, Ll/h9c0;->r:I

    .line 66
    .line 67
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceDefaultView;->get_title()Lv/VText;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceDefaultView;->get_desc()Lv/VText;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {v1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    const/4 v2, 0x0

    .line 87
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceDefaultView;->get_desc()Lv/VText;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    const v2, 0x3f666666    # 0.9f

    .line 95
    .line 96
    .line 97
    invoke-virtual {v1, v2}, Landroid/view/View;->setAlpha(F)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceDefaultView;->get_desc()Lv/VText;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-virtual {p0}, Ll/y4;->g()Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;->a()Lcom/p1/mobile/android/app/Act;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    sget v3, Ll/h9c0;->r:I

    .line 113
    .line 114
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 115
    .line 116
    .line 117
    move-result v2

    .line 118
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0}, Ll/c890;->r()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 126
    .line 127
    .line 128
    move-result v2

    .line 129
    if-eqz v2, :cond_0

    .line 130
    .line 131
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceDefaultView;->get_desc()Lv/VText;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    const-string v2, "\u89e3\u9501VIP\u4f1a\u5458"

    .line 136
    .line 137
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 138
    .line 139
    .line 140
    goto :goto_0

    .line 141
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceDefaultView;->get_desc()Lv/VText;

    .line 142
    .line 143
    .line 144
    move-result-object v2

    .line 145
    sget-object v3, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 146
    .line 147
    invoke-virtual {p0}, Ll/y4;->g()Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;

    .line 148
    .line 149
    .line 150
    move-result-object v3

    .line 151
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;->a()Lcom/p1/mobile/android/app/Act;

    .line 152
    .line 153
    .line 154
    move-result-object v3

    .line 155
    sget v4, Lcom/p1/mobile/putong/core/pay/R$string;->E6:I

    .line 156
    .line 157
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v3

    .line 161
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 162
    .line 163
    .line 164
    const/4 v4, 0x1

    .line 165
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    move-result-object v1

    .line 169
    invoke-static {v1, v4}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 170
    .line 171
    .line 172
    move-result-object v1

    .line 173
    invoke-static {v3, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 178
    .line 179
    .line 180
    :goto_0
    new-instance v1, Ll/a890;

    .line 181
    .line 182
    invoke-direct {v1, p0}, Ll/a890;-><init>(Ll/c890;)V

    .line 183
    .line 184
    .line 185
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 186
    .line 187
    .line 188
    :cond_1
    return-void
.end method

.method public final r()Ljava/lang/String;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/c890;->d:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-static {v0}, Ll/v5b0;->n(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->getFirstCouponPrice()D

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 17
    .line 18
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 19
    .line 20
    iget-wide v1, v1, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 21
    .line 22
    :goto_0
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Prices;->currencySymbol:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/y4;->g()Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;->b()Ljava/text/NumberFormat;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0, v1, v2}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    new-instance v1, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0

    .line 56
    :cond_1
    const-string p0, ""

    .line 57
    .line 58
    return-object p0
.end method

.method public final s()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/y4;->g()Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;->b()Ljava/text/NumberFormat;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x2

    .line 10
    invoke-virtual {v0, v1}, Ljava/text/NumberFormat;->setMaximumFractionDigits(I)V

    .line 11
    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 16
    .line 17
    const-string v1, "tttVip"

    .line 18
    .line 19
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->D5(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Ljava/util/Collection;

    .line 28
    .line 29
    new-instance v1, Ll/b890;

    .line 30
    .line 31
    invoke-direct {v1}, Ll/b890;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 39
    .line 40
    iput-object v0, p0, Ll/c890;->d:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 41
    .line 42
    return-void
.end method
