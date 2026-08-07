.class public Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileViewLarge;
.super Lv/VLinear;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public c:Lv/VFrame_Anim;

.field public d:Lv/VProgressBar;

.field public e:Landroid/widget/ImageView;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Landroid/widget/LinearLayout;

.field public i:Landroid/widget/FrameLayout;

.field public j:Lv/VDraweeView;

.field public k:Lv/VText;

.field public l:Lcom/p1/mobile/putong/feed/data/Moment;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/api/b;->j4(Lcom/p1/mobile/putong/feed/data/Moment;)Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const/4 p1, 0x1

    .line 10
    if-ne p1, p3, :cond_1

    .line 11
    .line 12
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 13
    .line 14
    iget-wide p2, p0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 15
    .line 16
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/putong/feed/api/b;->h3(J)Lrx/c;

    .line 17
    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileViewLarge;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileViewLarge;->W(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileViewLarge;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileViewLarge;->V(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V

    return-void
.end method

.method private synthetic V(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileViewLarge;->T()Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileViewLarge;->Y(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic W(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileViewLarge;->T()Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileViewLarge;->T()Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileViewLarge;->l:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-static {v0, v1, p0, v2, v2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailAct;->X1(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method public final S(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/p010;->a(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileViewLarge;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public T()Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public X(Lcom/p1/mobile/putong/feed/data/Moment;ILcom/p1/mobile/putong/feed/data/Moment;Z)V
    .locals 8

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileViewLarge;->l:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/Moment;->status()Lcom/p1/mobile/putong/data/LocalStatus;

    move-result-object p2

    const-string v0, "normal"

    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result p2

    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz p2, :cond_0

    .line 3
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileViewLarge;->c:Lv/VFrame_Anim;

    const/4 v3, 0x4

    invoke-virtual {p2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 4
    invoke-virtual {p0, v0}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    move p2, v1

    goto :goto_1

    .line 5
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/Moment;->status()Lcom/p1/mobile/putong/data/LocalStatus;

    move-result-object p2

    const-string v3, "sending"

    invoke-static {p2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result p2

    .line 6
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileViewLarge;->c:Lv/VFrame_Anim;

    if-eqz p2, :cond_1

    .line 7
    invoke-virtual {v3, v2}, Landroid/view/View;->setVisibility(I)V

    .line 8
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileViewLarge;->c:Lv/VFrame_Anim;

    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileViewLarge;->d:Lv/VProgressBar;

    invoke-virtual {p2, v3}, Lv/VFrame_Anim;->G(Landroid/view/View;)V

    .line 9
    invoke-virtual {p0, v0}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :goto_0
    move p2, v2

    goto :goto_1

    .line 10
    :cond_1
    invoke-virtual {v3, v2}, Landroid/view/View;->setVisibility(I)V

    .line 11
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileViewLarge;->c:Lv/VFrame_Anim;

    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileViewLarge;->e:Landroid/widget/ImageView;

    invoke-virtual {p2, v3}, Lv/VFrame_Anim;->G(Landroid/view/View;)V

    .line 12
    new-instance p2, Ll/m010;

    invoke-direct {p2, p0, p1}, Ll/m010;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileViewLarge;Lcom/p1/mobile/putong/feed/data/Moment;)V

    invoke-virtual {p0, p2}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0

    .line 13
    :goto_1
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v3

    const/high16 v4, 0x41000000    # 8.0f

    if-eqz v3, :cond_8

    .line 14
    new-instance v3, Ljava/util/Date;

    iget-wide v5, p1, Lcom/p1/mobile/putong/feed/data/Moment;->createdTime:D

    double-to-long v5, v5

    invoke-direct {v3, v5, v6}, Ljava/util/Date;-><init>(J)V

    .line 15
    new-instance v5, Ljava/util/Date;

    iget-wide v6, p3, Lcom/p1/mobile/putong/feed/data/Moment;->createdTime:D

    double-to-long v6, v6

    invoke-direct {v5, v6, v7}, Ljava/util/Date;-><init>(J)V

    .line 16
    invoke-virtual {v3}, Ljava/util/Date;->getYear()I

    move-result p3

    invoke-virtual {v5}, Ljava/util/Date;->getYear()I

    move-result v6

    if-ne p3, v6, :cond_3

    .line 17
    invoke-virtual {v3}, Ljava/util/Date;->getMonth()I

    move-result p3

    invoke-virtual {v5}, Ljava/util/Date;->getMonth()I

    move-result v6

    if-ne p3, v6, :cond_3

    .line 18
    invoke-virtual {v3}, Ljava/util/Date;->getDate()I

    move-result p3

    invoke-virtual {v5}, Ljava/util/Date;->getDate()I

    move-result v3

    if-eq p3, v3, :cond_2

    goto :goto_2

    :cond_2
    move p3, v2

    goto :goto_3

    :cond_3
    :goto_2
    move p3, v1

    :goto_3
    if-eqz p2, :cond_4

    if-eqz p3, :cond_4

    move p2, v1

    goto :goto_4

    :cond_4
    move p2, v2

    :goto_4
    if-nez p2, :cond_6

    if-eqz p4, :cond_5

    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    sget p4, Ll/gac0;->b:I

    invoke-virtual {p3, p4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p3

    goto :goto_5

    .line 20
    :cond_5
    invoke-static {v4}, Ll/qa00;->d(F)I

    move-result p3

    .line 21
    :goto_5
    invoke-virtual {p0, v2, v2, v2, p3}, Landroid/view/View;->setPadding(IIII)V

    goto :goto_8

    :cond_6
    const/high16 p3, 0x41800000    # 16.0f

    .line 22
    invoke-static {p3}, Ll/qa00;->d(F)I

    move-result p3

    if-eqz p4, :cond_7

    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p4

    sget v3, Ll/gac0;->b:I

    invoke-virtual {p4, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p4

    goto :goto_6

    .line 24
    :cond_7
    invoke-static {v4}, Ll/qa00;->d(F)I

    move-result p4

    .line 25
    :goto_6
    invoke-virtual {p0, v2, p3, v2, p4}, Landroid/view/View;->setPadding(IIII)V

    goto :goto_8

    :cond_8
    const/high16 p3, 0x41a00000    # 20.0f

    .line 26
    invoke-static {p3}, Ll/qa00;->d(F)I

    move-result p3

    if-eqz p4, :cond_9

    .line 27
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p4

    sget v3, Ll/gac0;->b:I

    invoke-virtual {p4, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p4

    goto :goto_7

    .line 28
    :cond_9
    invoke-static {v4}, Ll/qa00;->d(F)I

    move-result p4

    .line 29
    :goto_7
    invoke-virtual {p0, v2, p3, v2, p4}, Landroid/view/View;->setPadding(IIII)V

    .line 30
    :goto_8
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileViewLarge;->g:Lv/VText;

    if-eqz p2, :cond_a

    .line 31
    sget-object p2, Ll/pzi0;->n:Ljava/text/SimpleDateFormat;

    iget-wide v3, p1, Lcom/p1/mobile/putong/feed/data/Moment;->createdTime:D

    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p4

    invoke-virtual {p2, p4}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileViewLarge;->f:Lv/VText;

    sget-object p3, Ll/pzi0;->o:Ljava/text/SimpleDateFormat;

    iget-wide v3, p1, Lcom/p1/mobile/putong/feed/data/Moment;->createdTime:D

    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p4

    invoke-virtual {p3, p4}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_9

    .line 33
    :cond_a
    const-string p2, ""

    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileViewLarge;->f:Lv/VText;

    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    :goto_9
    iget-object p2, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    .line 36
    iget-object p3, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    const/4 p4, 0x2

    if-lt p2, p4, :cond_b

    .line 37
    invoke-interface {p3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/putong/data/Media;

    goto :goto_a

    .line 38
    :cond_b
    invoke-interface {p3}, Ljava/util/List;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_c

    iget-object p2, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/putong/data/Media;

    goto :goto_a

    :cond_c
    move-object p2, v0

    .line 39
    :goto_a
    instance-of p3, p2, Lcom/p1/mobile/putong/data/Video;

    if-eqz p3, :cond_d

    .line 40
    check-cast p2, Lcom/p1/mobile/putong/data/Video;

    iget-object v0, p2, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    goto :goto_b

    .line 41
    :cond_d
    instance-of p3, p2, Lcom/p1/mobile/putong/data/Picture;

    if-eqz p3, :cond_e

    .line 42
    move-object v0, p2

    check-cast v0, Lcom/p1/mobile/putong/data/Picture;

    .line 43
    :cond_e
    :goto_b
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_f

    .line 44
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    iget-object p3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileViewLarge;->j:Lv/VDraweeView;

    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->momentPictureSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object p4

    invoke-virtual {p2, p3, p4}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    goto :goto_c

    .line 45
    :cond_f
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    iget-object p3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileViewLarge;->j:Lv/VDraweeView;

    invoke-virtual {p2, p3}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 46
    :goto_c
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileViewLarge;->k:Lv/VText;

    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileViewLarge;->h:Landroid/widget/LinearLayout;

    new-instance p2, Ll/n010;

    invoke-direct {p2, p0}, Ll/n010;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileViewLarge;)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 48
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileViewLarge;->h:Landroid/widget/LinearLayout;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    return-void
.end method

.method public Y(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->n:I

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->f:I

    .line 12
    .line 13
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    filled-new-array {v0, p1}, [Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->f0([Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    new-instance p1, Ll/o010;

    .line 26
    .line 27
    invoke-direct {p1, p2}, Ll/o010;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->g0(Lcom/p1/mobile/android/app/Dialog$g;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileViewLarge;->S(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 9

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileViewLarge;->T()Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileViewLarge;->l:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 6
    .line 7
    iget-object v1, v2, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 8
    .line 9
    const/4 v7, 0x1

    .line 10
    const/4 v8, 0x0

    .line 11
    const/4 v3, 0x0

    .line 12
    const/4 v4, 0x0

    .line 13
    const/4 v5, 0x0

    .line 14
    const/4 v6, 0x0

    .line 15
    invoke-static/range {v0 .. v8}, Ll/k3h;->x0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;Ll/y20;Ll/y20;Ll/y20;ZZZ)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0
.end method
