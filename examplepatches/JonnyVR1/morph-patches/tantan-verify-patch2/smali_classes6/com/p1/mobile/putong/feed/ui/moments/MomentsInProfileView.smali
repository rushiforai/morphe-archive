.class public Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;
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

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:[Lv/VDraweeView;

.field public m:Landroid/view/View;

.field public n:Lcom/p1/mobile/putong/feed/data/Moment;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x4

    .line 5
    new-array p1, p1, [Lv/VDraweeView;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->l:[Lv/VDraweeView;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x4

    .line 11
    new-array p1, p1, [Lv/VDraweeView;

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->l:[Lv/VDraweeView;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 12
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x4

    .line 13
    new-array p1, p1, [Lv/VDraweeView;

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->l:[Lv/VDraweeView;

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

.method public static synthetic Q(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->X(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->Y(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic S(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->Z(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final T(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/f110;->a(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public V()Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;
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

.method public W(I)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->V()Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->i:Landroid/widget/FrameLayout;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, p1, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->l:[Lv/VDraweeView;

    .line 17
    .line 18
    sget v1, Ll/hdc0;->o0:I

    .line 19
    .line 20
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Lv/VDraweeView;

    .line 25
    .line 26
    aput-object v1, v0, v2

    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->l:[Lv/VDraweeView;

    .line 29
    .line 30
    sget v1, Ll/hdc0;->q0:I

    .line 31
    .line 32
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    check-cast v1, Lv/VDraweeView;

    .line 37
    .line 38
    const/4 v3, 0x1

    .line 39
    aput-object v1, v0, v3

    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->l:[Lv/VDraweeView;

    .line 42
    .line 43
    sget v1, Ll/hdc0;->p0:I

    .line 44
    .line 45
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    check-cast v1, Lv/VDraweeView;

    .line 50
    .line 51
    const/4 v3, 0x2

    .line 52
    aput-object v1, v0, v3

    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->l:[Lv/VDraweeView;

    .line 55
    .line 56
    sget v1, Ll/hdc0;->n0:I

    .line 57
    .line 58
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    check-cast v1, Lv/VDraweeView;

    .line 63
    .line 64
    const/4 v3, 0x3

    .line 65
    aput-object v1, v0, v3

    .line 66
    .line 67
    sget v0, Ll/hdc0;->q1:I

    .line 68
    .line 69
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->m:Landroid/view/View;

    .line 74
    .line 75
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->i:Landroid/widget/FrameLayout;

    .line 76
    .line 77
    invoke-virtual {p0, p1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public final synthetic X(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->V()Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->b0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic Y(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->V()Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->V()Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p0, v0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileTextAct;->X1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p2, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic Z(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->V()Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->V()Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p0, v0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->K2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p2, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public a0(Lcom/p1/mobile/putong/feed/data/Moment;ILcom/p1/mobile/putong/feed/data/Moment;Z)V
    .locals 10

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->n:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/Moment;->status()Lcom/p1/mobile/putong/data/LocalStatus;

    move-result-object v0

    const-string v1, "normal"

    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v0, :cond_0

    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->c:Lv/VFrame_Anim;

    const/4 v4, 0x4

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 4
    invoke-virtual {p0, v1}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    move v0, v2

    goto :goto_1

    .line 5
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/Moment;->status()Lcom/p1/mobile/putong/data/LocalStatus;

    move-result-object v0

    const-string v4, "sending"

    invoke-static {v0, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v0

    .line 6
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->c:Lv/VFrame_Anim;

    if-eqz v0, :cond_1

    .line 7
    invoke-virtual {v4, v3}, Landroid/view/View;->setVisibility(I)V

    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->c:Lv/VFrame_Anim;

    iget-object v4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->d:Lv/VProgressBar;

    invoke-virtual {v0, v4}, Lv/VFrame_Anim;->G(Landroid/view/View;)V

    .line 9
    invoke-virtual {p0, v1}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :goto_0
    move v0, v3

    goto :goto_1

    .line 10
    :cond_1
    invoke-virtual {v4, v3}, Landroid/view/View;->setVisibility(I)V

    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->c:Lv/VFrame_Anim;

    iget-object v4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->e:Landroid/widget/ImageView;

    invoke-virtual {v0, v4}, Lv/VFrame_Anim;->G(Landroid/view/View;)V

    .line 12
    new-instance v0, Ll/i010;

    invoke-direct {v0, p0, p1}, Ll/i010;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;Lcom/p1/mobile/putong/feed/data/Moment;)V

    invoke-virtual {p0, v0}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0

    .line 13
    :goto_1
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v4

    const/high16 v5, 0x41800000    # 16.0f

    const/high16 v6, 0x41000000    # 8.0f

    if-eqz v4, :cond_8

    .line 14
    new-instance v4, Ljava/util/Date;

    iget-wide v7, p1, Lcom/p1/mobile/putong/feed/data/Moment;->createdTime:D

    double-to-long v7, v7

    invoke-direct {v4, v7, v8}, Ljava/util/Date;-><init>(J)V

    .line 15
    new-instance v7, Ljava/util/Date;

    iget-wide v8, p3, Lcom/p1/mobile/putong/feed/data/Moment;->createdTime:D

    double-to-long v8, v8

    invoke-direct {v7, v8, v9}, Ljava/util/Date;-><init>(J)V

    .line 16
    invoke-virtual {v4}, Ljava/util/Date;->getYear()I

    move-result p3

    invoke-virtual {v7}, Ljava/util/Date;->getYear()I

    move-result v8

    if-ne p3, v8, :cond_3

    .line 17
    invoke-virtual {v4}, Ljava/util/Date;->getMonth()I

    move-result p3

    invoke-virtual {v7}, Ljava/util/Date;->getMonth()I

    move-result v8

    if-ne p3, v8, :cond_3

    .line 18
    invoke-virtual {v4}, Ljava/util/Date;->getDate()I

    move-result p3

    invoke-virtual {v7}, Ljava/util/Date;->getDate()I

    move-result v4

    if-eq p3, v4, :cond_2

    goto :goto_2

    :cond_2
    move p3, v3

    goto :goto_3

    :cond_3
    :goto_2
    move p3, v2

    :goto_3
    if-eqz v0, :cond_4

    if-eqz p3, :cond_4

    goto :goto_4

    :cond_4
    move v2, v3

    :goto_4
    if-nez v2, :cond_6

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
    invoke-static {v6}, Ll/qa00;->d(F)I

    move-result p3

    .line 21
    :goto_5
    invoke-virtual {p0, v3, v3, v3, p3}, Landroid/view/View;->setPadding(IIII)V

    goto :goto_7

    .line 22
    :cond_6
    invoke-static {v5}, Ll/qa00;->d(F)I

    move-result p3

    if-eqz p4, :cond_7

    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p4

    sget v0, Ll/gac0;->b:I

    invoke-virtual {p4, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p4

    goto :goto_6

    .line 24
    :cond_7
    invoke-static {v6}, Ll/qa00;->d(F)I

    move-result p4

    .line 25
    :goto_6
    invoke-virtual {p0, v3, p3, v3, p4}, Landroid/view/View;->setPadding(IIII)V

    :goto_7
    move v0, v2

    goto :goto_9

    :cond_8
    const/high16 p3, 0x41a00000    # 20.0f

    .line 26
    invoke-static {p3}, Ll/qa00;->d(F)I

    move-result p3

    if-eqz p4, :cond_9

    .line 27
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p4

    sget v2, Ll/gac0;->b:I

    invoke-virtual {p4, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p4

    goto :goto_8

    .line 28
    :cond_9
    invoke-static {v6}, Ll/qa00;->d(F)I

    move-result p4

    .line 29
    :goto_8
    invoke-virtual {p0, v3, p3, v3, p4}, Landroid/view/View;->setPadding(IIII)V

    .line 30
    :goto_9
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->g:Lv/VText;

    if-eqz v0, :cond_a

    .line 31
    sget-object p4, Ll/pzi0;->n:Ljava/text/SimpleDateFormat;

    iget-wide v6, p1, Lcom/p1/mobile/putong/feed/data/Moment;->createdTime:D

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {p4, v0}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->f:Lv/VText;

    sget-object p4, Ll/pzi0;->o:Ljava/text/SimpleDateFormat;

    iget-wide v6, p1, Lcom/p1/mobile/putong/feed/data/Moment;->createdTime:D

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {p4, v0}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_a

    .line 33
    :cond_a
    const-string p4, ""

    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->f:Lv/VText;

    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_a
    move p3, v3

    :goto_b
    if-ge p3, p2, :cond_e

    .line 35
    iget-object p4, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    invoke-interface {p4, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lcom/p1/mobile/putong/data/Media;

    .line 36
    instance-of v0, p4, Lcom/p1/mobile/putong/data/Video;

    if-eqz v0, :cond_b

    .line 37
    check-cast p4, Lcom/p1/mobile/putong/data/Video;

    iget-object p4, p4, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    goto :goto_c

    .line 38
    :cond_b
    instance-of v0, p4, Lcom/p1/mobile/putong/data/Picture;

    if-eqz v0, :cond_c

    .line 39
    check-cast p4, Lcom/p1/mobile/putong/data/Picture;

    goto :goto_c

    :cond_c
    move-object p4, v1

    .line 40
    :goto_c
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 41
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->l:[Lv/VDraweeView;

    aget-object v2, v2, p3

    invoke-virtual {p4}, Lcom/p1/mobile/putong/data/Picture;->momentPictureSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object p4

    invoke-virtual {v0, v2, p4}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    goto :goto_d

    .line 42
    :cond_d
    sget-object p4, Ll/uqb0;->G:Ll/fsb0;

    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->l:[Lv/VDraweeView;

    aget-object v0, v0, p3

    invoke-virtual {p4, v0}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    :goto_d
    add-int/lit8 p3, p3, 0x1

    goto :goto_b

    .line 43
    :cond_e
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->j:Lv/VText;

    iget-object p4, p1, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->h:Landroid/widget/LinearLayout;

    const/16 p4, 0x8

    if-nez p2, :cond_f

    .line 45
    invoke-virtual {p3, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 46
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->h:Landroid/widget/LinearLayout;

    invoke-virtual {p2, v3}, Landroid/view/View;->setClickable(Z)V

    .line 47
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->i:Landroid/widget/FrameLayout;

    invoke-virtual {p2, p4}, Landroid/view/View;->setVisibility(I)V

    .line 48
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->j:Lv/VText;

    const/4 p3, 0x3

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 49
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->j:Lv/VText;

    .line 50
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    sget v0, Ll/lbc0;->n6:I

    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p3

    .line 51
    invoke-virtual {p2, p3}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 52
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->j:Lv/VText;

    invoke-static {v5}, Ll/qa00;->d(F)I

    move-result p3

    const/high16 v0, 0x41400000    # 12.0f

    invoke-static {v0}, Ll/qa00;->d(F)I

    move-result v1

    invoke-static {v5}, Ll/qa00;->d(F)I

    move-result v2

    invoke-static {v0}, Ll/qa00;->d(F)I

    move-result v0

    invoke-virtual {p2, p3, v1, v2, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 53
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->j:Lv/VText;

    new-instance p3, Ll/j010;

    invoke-direct {p3, p0, p1}, Ll/j010;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;Lcom/p1/mobile/putong/feed/data/Moment;)V

    invoke-virtual {p2, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 54
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->j:Lv/VText;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    goto :goto_e

    .line 55
    :cond_f
    new-instance p2, Ll/k010;

    invoke-direct {p2, p0, p1}, Ll/k010;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;Lcom/p1/mobile/putong/feed/data/Moment;)V

    invoke-virtual {p3, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 56
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->h:Landroid/widget/LinearLayout;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 57
    :goto_e
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->k:Lv/VText;

    invoke-virtual {p0, p4}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public b0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;)V
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
    new-instance p1, Ll/l010;

    .line 26
    .line 27
    invoke-direct {p1, p2}, Ll/l010;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;)V

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
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->T(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 9

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->V()Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->n:Lcom/p1/mobile/putong/feed/data/Moment;

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
