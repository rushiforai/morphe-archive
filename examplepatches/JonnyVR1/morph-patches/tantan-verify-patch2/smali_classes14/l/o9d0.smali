.class public Ll/o9d0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Landroid/view/ViewGroup;

.field public b:Lv/VText;

.field public c:Lv/VImage;

.field public d:Lv/VImage;

.field public e:Lv/VDraweeView;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lv/VButton;

.field public i:Landroid/widget/FrameLayout;

.field public j:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

.field public k:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public l:Landroid/content/Context;


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

.method public static synthetic a(Ll/d9d0;Ll/j9d0;Landroid/view/View;)V
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object p2, p0, Ll/d9d0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 5
    .line 6
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->isGray()Z

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    if-eqz p2, :cond_1

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_1
    invoke-virtual {p0}, Ll/d9d0;->U()Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    if-eqz p2, :cond_2

    .line 18
    .line 19
    sget p1, Lcom/p1/mobile/putong/live/base/R$string;->s0:I

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/d9d0;->Q()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {p1, p0}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_2
    invoke-virtual {p0}, Ll/d9d0;->T()Z

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    if-eqz p2, :cond_3

    .line 42
    .line 43
    sget p0, Lcom/p1/mobile/putong/live/base/R$string;->r0:I

    .line 44
    .line 45
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_3
    invoke-virtual {p0}, Ll/d9d0;->L()Z

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    if-eqz p2, :cond_4

    .line 54
    .line 55
    sget p0, Lcom/p1/mobile/putong/live/base/R$string;->q0:I

    .line 56
    .line 57
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_4
    iget-object p2, p0, Ll/d9d0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 62
    .line 63
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->isLocked()Z

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    if-eqz p2, :cond_5

    .line 68
    .line 69
    sget p0, Lcom/p1/mobile/putong/live/base/R$string;->X0:I

    .line 70
    .line 71
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_5
    if-eqz p1, :cond_6

    .line 76
    .line 77
    invoke-interface {p1, p0}, Ll/j9d0;->a(Ll/d9d0;)V

    .line 78
    .line 79
    .line 80
    :cond_6
    :goto_0
    return-void
.end method

.method public static synthetic b(Ll/j9d0;Ll/d9d0;Landroid/view/View;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/j9d0;->c(Ll/d9d0;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static synthetic c(Ll/j9d0;Ll/d9d0;Landroid/view/View;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p2, p1, Ll/d9d0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 6
    .line 7
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->jumpUrl:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-nez p2, :cond_0

    .line 14
    .line 15
    iget-object p1, p1, Ll/d9d0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->jumpUrl:Ljava/lang/String;

    .line 18
    .line 19
    invoke-interface {p0, p1}, Ll/j9d0;->b(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public static e(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;)Ljava/lang/String;
    .locals 1

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->permanent:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget p1, Lcom/p1/mobile/putong/live/base/R$string;->V0:I

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->isGray()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    sget p1, Lcom/p1/mobile/putong/live/base/R$string;->U0:I

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0

    .line 25
    :cond_1
    iget-wide p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->periodEndTimeInSeconds:J

    .line 26
    .line 27
    invoke-static {p0, p1}, Ll/kdu;->U(J)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method


# virtual methods
.method public d(Ll/c5m;)V
    .locals 1

    .line 1
    invoke-interface {p1}, Ll/c5m;->getRightContentView()Landroid/view/ViewGroup;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Ll/o9d0;->a:Landroid/view/ViewGroup;

    .line 6
    .line 7
    invoke-interface {p1}, Ll/c5m;->getRightDurationView()Lv/VText;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Ll/o9d0;->b:Lv/VText;

    .line 12
    .line 13
    invoke-interface {p1}, Ll/c5m;->getRightArrowView()Lv/VImage;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Ll/o9d0;->c:Lv/VImage;

    .line 18
    .line 19
    invoke-interface {p1}, Ll/c5m;->getRightLockIconView()Lv/VImage;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Ll/o9d0;->d:Lv/VImage;

    .line 24
    .line 25
    invoke-interface {p1}, Ll/c5m;->getRightIconView()Lv/VDraweeView;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Ll/o9d0;->e:Lv/VDraweeView;

    .line 30
    .line 31
    invoke-interface {p1}, Ll/c5m;->getRightTitleView()Lv/VText;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iput-object v0, p0, Ll/o9d0;->f:Lv/VText;

    .line 36
    .line 37
    invoke-interface {p1}, Ll/c5m;->getRightDescView()Lv/VText;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iput-object v0, p0, Ll/o9d0;->g:Lv/VText;

    .line 42
    .line 43
    invoke-interface {p1}, Ll/c5m;->getCraftButton()Lv/VButton;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iput-object v0, p0, Ll/o9d0;->h:Lv/VButton;

    .line 48
    .line 49
    invoke-interface {p1}, Ll/c5m;->getDescLayout()Landroid/widget/FrameLayout;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iput-object v0, p0, Ll/o9d0;->i:Landroid/widget/FrameLayout;

    .line 54
    .line 55
    invoke-interface {p1}, Ll/c5m;->getCommonIconView()Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iput-object v0, p0, Ll/o9d0;->j:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 60
    .line 61
    invoke-interface {p1}, Ll/c5m;->getDynamicIcon()Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    iput-object p1, p0, Ll/o9d0;->k:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 66
    .line 67
    iget-object p1, p0, Ll/o9d0;->a:Landroid/view/ViewGroup;

    .line 68
    .line 69
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    iput-object p1, p0, Ll/o9d0;->l:Landroid/content/Context;

    .line 74
    .line 75
    return-void
.end method

.method public final f(Ll/d9d0;)V
    .locals 4

    .line 1
    iget-object p1, p1, Ll/d9d0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 2
    .line 3
    iget-object v0, p0, Ll/o9d0;->b:Lv/VText;

    .line 4
    .line 5
    iget-object v1, p0, Ll/o9d0;->l:Landroid/content/Context;

    .line 6
    .line 7
    invoke-static {v1, p1}, Ll/o9d0;->e(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->isGray()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    const-string v0, "#999999"

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const-string v0, "#212121"

    .line 24
    .line 25
    :goto_0
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iget-object v1, p0, Ll/o9d0;->f:Lv/VText;

    .line 30
    .line 31
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Ll/o9d0;->b:Lv/VText;

    .line 35
    .line 36
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/o9d0;->e:Lv/VDraweeView;

    .line 40
    .line 41
    const/high16 v1, 0x3f800000    # 1.0f

    .line 42
    .line 43
    const/high16 v2, 0x3f000000    # 0.5f

    .line 44
    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->isGray()Z

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    if-eqz v3, :cond_1

    .line 52
    .line 53
    move v3, v2

    .line 54
    goto :goto_1

    .line 55
    :cond_1
    move v3, v1

    .line 56
    :goto_1
    invoke-virtual {v0, v3}, Landroid/view/View;->setAlpha(F)V

    .line 57
    .line 58
    .line 59
    :cond_2
    iget-object v0, p0, Ll/o9d0;->k:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 60
    .line 61
    if-eqz v0, :cond_4

    .line 62
    .line 63
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->isGray()Z

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    if-eqz v3, :cond_3

    .line 68
    .line 69
    move v1, v2

    .line 70
    :cond_3
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 71
    .line 72
    .line 73
    :cond_4
    iget-object v0, p0, Ll/o9d0;->l:Landroid/content/Context;

    .line 74
    .line 75
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->isGray()Z

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    if-eqz p1, :cond_5

    .line 84
    .line 85
    sget p1, Ll/mbc0;->s:I

    .line 86
    .line 87
    goto :goto_2

    .line 88
    :cond_5
    sget p1, Ll/mbc0;->S:I

    .line 89
    .line 90
    :goto_2
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    const/high16 v0, 0x41a00000    # 20.0f

    .line 95
    .line 96
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    const/4 v2, 0x0

    .line 105
    invoke-virtual {p1, v2, v2, v1, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 106
    .line 107
    .line 108
    iget-object p0, p0, Ll/o9d0;->b:Lv/VText;

    .line 109
    .line 110
    const/4 v0, 0x0

    .line 111
    invoke-virtual {p0, p1, v0, v0, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method public g(Ll/d9d0;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/d9d0;->N()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    sget p1, Ll/mbc0;->A:I

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget p1, Ll/mbc0;->z:I

    .line 11
    .line 12
    :goto_0
    iget-object p0, p0, Ll/o9d0;->a:Landroid/view/ViewGroup;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final h(Ll/d9d0;Ll/j9d0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/o9d0;->a:Landroid/view/ViewGroup;

    .line 2
    .line 3
    new-instance v1, Ll/m9d0;

    .line 4
    .line 5
    invoke-direct {v1, p1, p2}, Ll/m9d0;-><init>(Ll/d9d0;Ll/j9d0;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/o9d0;->g:Lv/VText;

    .line 12
    .line 13
    new-instance v0, Ll/n9d0;

    .line 14
    .line 15
    invoke-direct {v0, p2, p1}, Ll/n9d0;-><init>(Ll/j9d0;Ll/d9d0;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final i(Ll/d9d0;)V
    .locals 2

    .line 1
    iget-object p1, p1, Ll/d9d0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 2
    .line 3
    iget-object v0, p0, Ll/o9d0;->f:Lv/VText;

    .line 4
    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->rightName:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v1}, Ll/bpj;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/o9d0;->g:Lv/VText;

    .line 15
    .line 16
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->description:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {v1}, Ll/bpj;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/o9d0;->k:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-object v0, p0, Ll/o9d0;->e:Lv/VDraweeView;

    .line 34
    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->getThumbnailUrl()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-static {v0}, Ll/xau;->z(Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_1

    .line 46
    .line 47
    iget-object v0, p0, Ll/o9d0;->e:Lv/VDraweeView;

    .line 48
    .line 49
    sget v1, Ll/mbc0;->q:I

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Ll/o9d0;->e:Lv/VDraweeView;

    .line 55
    .line 56
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->getThumbnailUrl()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    const-string v0, "context_right_act"

    .line 61
    .line 62
    invoke-static {v0, p0, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_1
    iget-object v0, p0, Ll/o9d0;->k:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 67
    .line 68
    if-eqz v0, :cond_2

    .line 69
    .line 70
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->getThumbnailUrl()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-static {v0}, Ll/xau;->z(Ljava/lang/String;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-eqz v0, :cond_2

    .line 79
    .line 80
    iget-object v0, p0, Ll/o9d0;->k:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 81
    .line 82
    const/4 v1, 0x1

    .line 83
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 84
    .line 85
    .line 86
    iget-object p0, p0, Ll/o9d0;->k:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 87
    .line 88
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->getThumbnailUrl()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    const/4 v0, -0x1

    .line 93
    const/4 v1, 0x0

    .line 94
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->l(Ljava/lang/String;ILl/wo0;)V

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_2
    iget-object p0, p0, Ll/o9d0;->j:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 99
    .line 100
    if-eqz p0, :cond_3

    .line 101
    .line 102
    const/high16 v0, 0x41a80000    # 21.0f

    .line 103
    .line 104
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->thumbnailUrl:Ljava/lang/String;

    .line 109
    .line 110
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->dynamicUrl:Ljava/lang/String;

    .line 111
    .line 112
    invoke-static {p0, v0, v1, p1}, Ll/biv;->i(Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;ILjava/lang/String;Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    :cond_3
    return-void
.end method

.method public final j(Ll/d9d0;Ll/j9d0;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/d9d0;->L()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/o9d0;->h:Lv/VButton;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    const/high16 v0, 0x42980000    # 76.0f

    .line 17
    .line 18
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iget-object v1, p0, Ll/o9d0;->f:Lv/VText;

    .line 23
    .line 24
    invoke-static {v1, v0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Ll/o9d0;->i:Landroid/widget/FrameLayout;

    .line 28
    .line 29
    invoke-static {v1, v0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ll/o9d0;->h:Lv/VButton;

    .line 33
    .line 34
    new-instance v0, Ll/l9d0;

    .line 35
    .line 36
    invoke-direct {v0, p2, p1}, Ll/l9d0;-><init>(Ll/j9d0;Ll/d9d0;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    :goto_0
    iget-object p1, p0, Ll/o9d0;->h:Lv/VButton;

    .line 44
    .line 45
    const/16 p2, 0x8

    .line 46
    .line 47
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Ll/o9d0;->f:Lv/VText;

    .line 51
    .line 52
    sget p2, Ll/qa00;->j:I

    .line 53
    .line 54
    invoke-static {p1, p2}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Ll/o9d0;->i:Landroid/widget/FrameLayout;

    .line 58
    .line 59
    invoke-static {p0, p2}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public final k(Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;)V
    .locals 4

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->jumpUrl:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, 0x0

    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Ll/o9d0;->l:Landroid/content/Context;

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    sget v1, Ll/mbc0;->D:I

    .line 17
    .line 18
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    move-object p1, v0

    .line 24
    :goto_0
    if-eqz p1, :cond_1

    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getMinimumWidth()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getMinimumHeight()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    const/4 v3, 0x0

    .line 35
    invoke-virtual {p1, v3, v3, v1, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 36
    .line 37
    .line 38
    :cond_1
    iget-object p0, p0, Ll/o9d0;->g:Lv/VText;

    .line 39
    .line 40
    invoke-virtual {p0, v0, v0, p1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final l(Ll/d9d0;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/o9d0;->a:Landroid/view/ViewGroup;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    instance-of v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    move-object v1, v0

    .line 12
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/d9d0;->R()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    iput v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 19
    .line 20
    invoke-virtual {p1}, Ll/d9d0;->O()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    iput v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 25
    .line 26
    invoke-virtual {p1}, Ll/d9d0;->P()I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    iput p1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 31
    .line 32
    :cond_0
    iget-object p0, p0, Ll/o9d0;->a:Landroid/view/ViewGroup;

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final m(Ll/d9d0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o9d0;->n(Ll/d9d0;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/o9d0;->f(Ll/d9d0;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final n(Ll/d9d0;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ll/d9d0;->K()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/o9d0;->c:Lv/VImage;

    .line 6
    .line 7
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Ll/o9d0;->d:Lv/VImage;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-virtual {p1}, Ll/d9d0;->S()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const/4 v1, -0x1

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    sget p1, Ll/mbc0;->N:I

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    invoke-virtual {p1}, Ll/d9d0;->I()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    sget p1, Ll/mbc0;->K:I

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    invoke-virtual {p1}, Ll/d9d0;->J()Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-eqz p1, :cond_3

    .line 43
    .line 44
    sget p1, Ll/mbc0;->R:I

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_3
    move p1, v1

    .line 48
    :goto_0
    iget-object v0, p0, Ll/o9d0;->d:Lv/VImage;

    .line 49
    .line 50
    if-eq p1, v1, :cond_4

    .line 51
    .line 52
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Ll/o9d0;->d:Lv/VImage;

    .line 56
    .line 57
    const/4 p1, 0x1

    .line 58
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_4
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public o(Ll/d9d0;Ll/j9d0;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/o9d0;->h(Ll/d9d0;Ll/j9d0;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Ll/d9d0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/o9d0;->i(Ll/d9d0;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/o9d0;->k(Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/o9d0;->l(Ll/d9d0;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/o9d0;->g(Ll/d9d0;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ll/o9d0;->m(Ll/d9d0;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p1, p2}, Ll/o9d0;->j(Ll/d9d0;Ll/j9d0;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
