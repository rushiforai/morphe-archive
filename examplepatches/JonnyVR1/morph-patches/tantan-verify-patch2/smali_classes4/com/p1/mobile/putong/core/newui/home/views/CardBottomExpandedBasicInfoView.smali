.class public Lcom/p1/mobile/putong/core/newui/home/views/CardBottomExpandedBasicInfoView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Landroid/widget/ImageView;

.field public f:Landroid/widget/ImageView;

.field public g:Landroid/widget/ImageView;

.field public h:Lv/VDraweeView;

.field public i:I
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "#FFFFFF"

    .line 5
    .line 6
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomExpandedBasicInfoView;->i:I

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 14
    const-string p1, "#FFFFFF"

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomExpandedBasicInfoView;->i:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 15
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 16
    const-string p1, "#FFFFFF"

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomExpandedBasicInfoView;->i:I

    return-void
.end method

.method private V(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomExpandedBasicInfoView;->e:Landroid/widget/ImageView;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/4 p1, 0x0

    .line 15
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final P(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/wh4;->a(Lcom/p1/mobile/putong/core/newui/home/views/CardBottomExpandedBasicInfoView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final Q(Lcom/p1/mobile/putong/data/User;)Z
    .locals 2

    .line 1
    const/4 p0, 0x1

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v1, 0x0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    return v1

    .line 23
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isBannedNew()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_3

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isAccountCancellation()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_2

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_2
    return v1

    .line 37
    :cond_3
    :goto_0
    return p0
.end method

.method public final R(Lcom/p1/mobile/putong/data/User;Z)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomExpandedBasicInfoView;->Q(Lcom/p1/mobile/putong/data/User;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isHideAgeFromSVip()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-lez v0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isHideAgeForTeamAccount()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 29
    .line 30
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    goto :goto_1

    .line 35
    :cond_1
    :goto_0
    const-string v0, ""

    .line 36
    .line 37
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomExpandedBasicInfoView;->d:Lv/VText;

    .line 38
    .line 39
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 40
    .line 41
    .line 42
    goto :goto_2

    .line 43
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomExpandedBasicInfoView;->d:Lv/VText;

    .line 44
    .line 45
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 46
    .line 47
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 52
    .line 53
    .line 54
    :goto_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomExpandedBasicInfoView;->d:Lv/VText;

    .line 55
    .line 56
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomExpandedBasicInfoView;->i:I

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isHideAgeFromSVipWithOutMe()Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    xor-int/lit8 v0, v0, 0x1

    .line 66
    .line 67
    if-eqz p2, :cond_3

    .line 68
    .line 69
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isHideAgeFromSVip()Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_3

    .line 74
    .line 75
    const/4 v0, 0x0

    .line 76
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomExpandedBasicInfoView;->d:Lv/VText;

    .line 77
    .line 78
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public final S(Lcom/p1/mobile/putong/data/User;Z)V
    .locals 1

    .line 1
    invoke-static {}, Ll/xu90;->d()Ll/xu90;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2, p1}, Ll/xu90;->f(Lcom/p1/mobile/putong/data/User;)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    const/4 p2, -0x1

    .line 10
    if-eq p1, p2, :cond_0

    .line 11
    .line 12
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomExpandedBasicInfoView;->e:Landroid/widget/ImageView;

    .line 13
    .line 14
    invoke-static {p2}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    if-nez p2, :cond_0

    .line 19
    .line 20
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomExpandedBasicInfoView;->f:Landroid/widget/ImageView;

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Ll/xu90;->d()Ll/xu90;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomExpandedBasicInfoView;->f:Landroid/widget/ImageView;

    .line 31
    .line 32
    invoke-virtual {p2, p1, p0, v0}, Ll/xu90;->j(ILandroid/widget/ImageView;Z)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomExpandedBasicInfoView;->f:Landroid/widget/ImageView;

    .line 37
    .line 38
    const/16 p1, 0x8

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final T(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomExpandedBasicInfoView;->Q(Lcom/p1/mobile/putong/data/User;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomExpandedBasicInfoView;->c:Lv/VText;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomExpandedBasicInfoView;->c:Lv/VText;

    .line 21
    .line 22
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomExpandedBasicInfoView;->c:Lv/VText;

    .line 28
    .line 29
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomExpandedBasicInfoView;->i:I

    .line 30
    .line 31
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public W(Lcom/p1/mobile/putong/data/User;ZZ)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomExpandedBasicInfoView;->T(Lcom/p1/mobile/putong/data/User;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomExpandedBasicInfoView;->R(Lcom/p1/mobile/putong/data/User;Z)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomExpandedBasicInfoView;->V(Lcom/p1/mobile/putong/data/User;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomExpandedBasicInfoView;->S(Lcom/p1/mobile/putong/data/User;Z)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomExpandedBasicInfoView;->X(Lcom/p1/mobile/putong/data/User;ZZ)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final X(Lcom/p1/mobile/putong/data/User;ZZ)V
    .locals 1

    .line 1
    const/4 p3, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomExpandedBasicInfoView;->g:Landroid/widget/ImageView;

    .line 5
    .line 6
    invoke-static {p0, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isSVIP()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isHideIconFromSVip()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_2

    .line 21
    .line 22
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_3

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->gpHideVip()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_3

    .line 33
    .line 34
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomExpandedBasicInfoView;->g:Landroid/widget/ImageView;

    .line 35
    .line 36
    invoke-static {p0, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_3
    if-eqz p2, :cond_5

    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isHideIconFromSVipWithMe()Z

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    if-nez p2, :cond_4

    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->gpHideVip()Z

    .line 49
    .line 50
    .line 51
    move-result p2

    .line 52
    if-eqz p2, :cond_5

    .line 53
    .line 54
    :cond_4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomExpandedBasicInfoView;->g:Landroid/widget/ImageView;

    .line 55
    .line 56
    invoke-static {p0, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_5
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 61
    .line 62
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    invoke-interface {p2, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->ve(Lcom/p1/mobile/putong/data/User;)Z

    .line 67
    .line 68
    .line 69
    move-result p2

    .line 70
    const/4 v0, 0x1

    .line 71
    if-eqz p2, :cond_6

    .line 72
    .line 73
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomExpandedBasicInfoView;->g:Landroid/widget/ImageView;

    .line 74
    .line 75
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 76
    .line 77
    .line 78
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomExpandedBasicInfoView;->g:Landroid/widget/ImageView;

    .line 79
    .line 80
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 81
    .line 82
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    sget p2, Ll/dbc0;->Sc:I

    .line 87
    .line 88
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_6
    invoke-static {}, Ll/d79;->T()Z

    .line 97
    .line 98
    .line 99
    move-result p2

    .line 100
    if-eqz p2, :cond_7

    .line 101
    .line 102
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isSVIP()Z

    .line 103
    .line 104
    .line 105
    move-result p2

    .line 106
    if-eqz p2, :cond_7

    .line 107
    .line 108
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomExpandedBasicInfoView;->g:Landroid/widget/ImageView;

    .line 109
    .line 110
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 111
    .line 112
    .line 113
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomExpandedBasicInfoView;->g:Landroid/widget/ImageView;

    .line 114
    .line 115
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 116
    .line 117
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    sget p2, Ll/dbc0;->Rc:I

    .line 122
    .line 123
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 128
    .line 129
    .line 130
    return-void

    .line 131
    :cond_7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 132
    .line 133
    .line 134
    move-result p1

    .line 135
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomExpandedBasicInfoView;->g:Landroid/widget/ImageView;

    .line 136
    .line 137
    if-eqz p1, :cond_8

    .line 138
    .line 139
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomExpandedBasicInfoView;->g:Landroid/widget/ImageView;

    .line 147
    .line 148
    const-string p3, "vip"

    .line 149
    .line 150
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUtils;->d(Landroid/content/Context;Landroid/view/View;Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomExpandedBasicInfoView;->g:Landroid/widget/ImageView;

    .line 154
    .line 155
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 156
    .line 157
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    sget p2, Ll/dbc0;->Tc:I

    .line 162
    .line 163
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 168
    .line 169
    .line 170
    return-void

    .line 171
    :cond_8
    invoke-static {p2, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 172
    .line 173
    .line 174
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomExpandedBasicInfoView;->P(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    const/high16 v0, 0x40800000    # 4.0f

    .line 8
    .line 9
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-static {p0, v0}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setTextColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomExpandedBasicInfoView;->i:I

    .line 2
    .line 3
    return-void
.end method
