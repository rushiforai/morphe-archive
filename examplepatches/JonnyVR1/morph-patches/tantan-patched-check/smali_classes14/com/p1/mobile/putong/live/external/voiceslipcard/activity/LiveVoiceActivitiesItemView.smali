.class public Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;
.super Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView$a;
    }
.end annotation


# instance fields
.field public A:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public B:Lv/VText;

.field public C:Lv/VImage;

.field public D:Lv/VText;

.field public E:Lv/VText;

.field public F:Lv/VText;

.field public G:Lv/VText;

.field public H:Lv/VText;

.field public u:Lv/VRelative;

.field public v:Lv/VDraweeView;

.field public w:Lv/VText;

.field public x:Lv/VText;

.field public y:Landroid/widget/FrameLayout;

.field public z:Landroid/widget/LinearLayout;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView$a;Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView$a;->b(Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView$a;Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p2, 0x1

    .line 2
    invoke-interface {p0, p2, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView$a;->a(ILcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView$a;Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    invoke-interface {p0, p2, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView$a;->a(ILcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView$a;Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p2, 0x2

    .line 2
    invoke-interface {p0, p2, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView$a;->a(ILcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView$a;Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p2, 0x3

    .line 2
    invoke-interface {p0, p2, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView$a;->a(ILcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private setDescText(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;->x:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private setRelationStatus(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;->E:Lv/VText;

    .line 2
    .line 3
    const-string v1, "all"

    .line 4
    .line 5
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;->F:Lv/VText;

    .line 13
    .line 14
    const-string v1, "follow"

    .line 15
    .line 16
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;->G:Lv/VText;

    .line 24
    .line 25
    const-string v1, "match"

    .line 26
    .line 27
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;->H:Lv/VText;

    .line 35
    .line 36
    const-string v0, "likeother"

    .line 37
    .line 38
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method private setTitleText(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;->w:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final o(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/t1v;->a(Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;->w()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;->o(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;->p(Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public p(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;->w:Lv/VText;

    .line 2
    .line 3
    invoke-static {p1}, Ll/jyn0;->b(Z)Ll/ss2;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v1}, Ll/ss2;->e()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;->x:Lv/VText;

    .line 15
    .line 16
    invoke-static {p1}, Ll/jyn0;->b(Z)Ll/ss2;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-interface {v1}, Ll/ss2;->b()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;->D:Lv/VText;

    .line 28
    .line 29
    invoke-static {p1}, Ll/jyn0;->b(Z)Ll/ss2;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-interface {p1}, Ll/ss2;->d()I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final q(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;->v:Lv/VDraweeView;

    .line 2
    .line 3
    const/high16 v0, 0x425c0000    # 55.0f

    .line 4
    .line 5
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const-string v2, "context_square"

    .line 14
    .line 15
    invoke-static {v2, p0, p1, v1, v0}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public r(Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;->mainTitle:Ljava/lang/String;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;->setTitleText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;->secondTitle:Ljava/lang/String;

    .line 7
    .line 8
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;->setDescText(Ljava/lang/CharSequence;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;->avatar:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;->q(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;->status:Ljava/lang/String;

    .line 17
    .line 18
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;->endTimeStamp:D

    .line 19
    .line 20
    invoke-virtual {p0, v0, v1, v2}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;->s(Ljava/lang/String;D)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;->relationStatus:Ljava/lang/String;

    .line 24
    .line 25
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;->setRelationStatus(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final s(Ljava/lang/String;D)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p2, p3}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;->u(D)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;->v(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public t(Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView$a;Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;)V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;->E:Lv/VText;

    .line 2
    .line 3
    new-instance v1, Ll/o1v;

    .line 4
    .line 5
    invoke-direct {v1, p1, p2}, Ll/o1v;-><init>(Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView$a;Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;->F:Lv/VText;

    .line 12
    .line 13
    new-instance v1, Ll/p1v;

    .line 14
    .line 15
    invoke-direct {v1, p1, p2}, Ll/p1v;-><init>(Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView$a;Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;->G:Lv/VText;

    .line 22
    .line 23
    new-instance v1, Ll/q1v;

    .line 24
    .line 25
    invoke-direct {v1, p1, p2}, Ll/q1v;-><init>(Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView$a;Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;->H:Lv/VText;

    .line 32
    .line 33
    new-instance v1, Ll/r1v;

    .line 34
    .line 35
    invoke-direct {v1, p1, p2}, Ll/r1v;-><init>(Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView$a;Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;->u:Lv/VRelative;

    .line 42
    .line 43
    new-instance v0, Ll/s1v;

    .line 44
    .line 45
    invoke-direct {v0, p1, p2}, Ll/s1v;-><init>(Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView$a;Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;)V

    .line 46
    .line 47
    .line 48
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final u(D)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;->z:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;->D:Lv/VText;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;->D:Lv/VText;

    .line 14
    .line 15
    double-to-long p1, p1

    .line 16
    invoke-static {p1, p2}, Ll/y6u;->f(J)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final v(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;->z:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;->D:Lv/VText;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;->A:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;->A:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 22
    .line 23
    const-string v1, "https://auto.tancdn.com/v1/raw/faaceaf9-d54d-45c6-9009-aecd295225e511.pdf"

    .line 24
    .line 25
    const/4 v2, -0x1

    .line 26
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;->B:Lv/VText;

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public w()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;->A:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;->A:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->o()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method
