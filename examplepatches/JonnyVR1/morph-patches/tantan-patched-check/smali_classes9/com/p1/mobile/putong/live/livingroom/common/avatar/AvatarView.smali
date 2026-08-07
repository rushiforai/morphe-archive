.class public Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/FrameLayout;",
        "Ll/iam<",
        "Ll/in1;",
        ">;"
    }
.end annotation


# static fields
.field public static A:Z


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;

.field public b:Landroid/widget/LinearLayout;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Landroid/widget/FrameLayout;

.field public f:Lcom/p1/mobile/putong/live/livingroom/common/avatar/view/AvatarShineView;

.field public g:Lv/VText;

.field public h:Landroid/widget/FrameLayout;

.field public i:Lv/VImage;

.field public j:Lv/VImage;

.field public k:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public l:Lv/VText;

.field public m:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

.field public n:Ljava/lang/String;

.field public o:Ll/ak1;

.field public p:Ll/in1;

.field public q:Landroid/animation/Animator;

.field public r:Landroid/animation/Animator;

.field public s:Landroid/animation/Animator;

.field public t:Landroid/animation/ValueAnimator;

.field public u:Landroid/animation/ValueAnimator;

.field public v:I

.field public final w:I

.field public x:I

.field public final y:J

.field public z:Ll/jxd0;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x42300000    # 44.0f

    .line 5
    .line 6
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->v:I

    .line 11
    .line 12
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->w:I

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->x:I

    .line 20
    .line 21
    const-wide/16 v0, 0x190

    .line 22
    .line 23
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->y:J

    .line 24
    .line 25
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 26
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/high16 p1, 0x42300000    # 44.0f

    .line 27
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p2

    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->v:I

    .line 28
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->w:I

    const/4 p1, 0x0

    .line 29
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->x:I

    const-wide/16 p1, 0x190

    .line 30
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->y:J

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 31
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/high16 p1, 0x42300000    # 44.0f

    .line 32
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p2

    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->v:I

    .line 33
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->w:I

    const/4 p1, 0x0

    .line 34
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->x:I

    const-wide/16 p1, 0x190

    .line 35
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->y:J

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->q(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->u(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(JLjava/util/Map;)V
    .locals 1

    .line 1
    const-string v0, "watch_duration"

    .line 2
    .line 3
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p2, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->s(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->p(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0
.end method

.method private getFirstFollowAnimator()Landroid/animation/Animator;
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->r:Landroid/animation/Animator;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->v:I

    .line 10
    .line 11
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->g:Lv/VText;

    .line 12
    .line 13
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->f:Lcom/p1/mobile/putong/live/livingroom/common/avatar/view/AvatarShineView;

    .line 14
    .line 15
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->h:Landroid/widget/FrameLayout;

    .line 16
    .line 17
    const/4 v6, 0x1

    .line 18
    invoke-static/range {v1 .. v6}, Ll/yo1;->m(Landroid/content/Context;ILandroid/widget/TextView;Lcom/p1/mobile/putong/live/livingroom/common/avatar/view/AvatarShineView;Landroid/widget/FrameLayout;Z)Landroid/animation/Animator;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->v:I

    .line 27
    .line 28
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->g:Lv/VText;

    .line 29
    .line 30
    invoke-static {v1, v2, v3}, Ll/yo1;->l(Landroid/content/Context;ILandroid/widget/TextView;)Landroid/animation/Animator;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const-wide/16 v2, 0x7d0

    .line 35
    .line 36
    invoke-virtual {v1, v2, v3}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 37
    .line 38
    .line 39
    filled-new-array {v0, v1}, [Landroid/animation/Animator;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-static {v0}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->r:Landroid/animation/Animator;

    .line 48
    .line 49
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->r:Landroid/animation/Animator;

    .line 50
    .line 51
    return-object p0
.end method

.method private getHideFollowAnimator()Landroid/animation/Animator;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->u:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->v:I

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    filled-new-array {v0, v1}, [I

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-wide/16 v1, 0x190

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->u:Landroid/animation/ValueAnimator;

    .line 24
    .line 25
    new-instance v1, Ll/ap1;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/ap1;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->u:Landroid/animation/ValueAnimator;

    .line 34
    .line 35
    return-object p0
.end method

.method private getShowFansClubEntryAnimatorStart()V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->o:Ll/ak1;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/ak1;

    .line 6
    .line 7
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->a:Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;

    .line 8
    .line 9
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->f:Lcom/p1/mobile/putong/live/livingroom/common/avatar/view/AvatarShineView;

    .line 10
    .line 11
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->g:Lv/VText;

    .line 12
    .line 13
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->k:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 14
    .line 15
    iget-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->l:Lv/VText;

    .line 16
    .line 17
    iget-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->h:Landroid/widget/FrameLayout;

    .line 18
    .line 19
    iget-object v8, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->i:Lv/VImage;

    .line 20
    .line 21
    invoke-direct/range {v1 .. v8}, Ll/ak1;-><init>(Landroid/view/View;Landroid/view/View;Lv/VText;Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;Lv/VText;Landroid/widget/FrameLayout;Lv/VImage;)V

    .line 22
    .line 23
    .line 24
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->o:Ll/ak1;

    .line 25
    .line 26
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->o:Ll/ak1;

    .line 27
    .line 28
    const/high16 v0, 0x43120000    # 146.0f

    .line 29
    .line 30
    invoke-static {v0}, Ll/bnl0;->w(F)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    const/high16 v1, 0x41880000    # 17.0f

    .line 35
    .line 36
    invoke-static {v1}, Ll/bnl0;->w(F)I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    invoke-virtual {p0, v0, v1}, Ll/ak1;->g(II)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method private getShowFollowAnimator()Landroid/animation/Animator;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->t:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->v:I

    .line 8
    .line 9
    filled-new-array {v0, v1}, [I

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-wide/16 v1, 0x190

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->t:Landroid/animation/ValueAnimator;

    .line 24
    .line 25
    new-instance v1, Ll/zo1;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/zo1;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->t:Landroid/animation/ValueAnimator;

    .line 34
    .line 35
    return-object p0
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->v(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->w(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k(Landroid/view/View;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private r()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->D4:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/String;

    .line 12
    .line 13
    const/16 v1, 0xc

    .line 14
    .line 15
    invoke-static {v1, v0}, Ll/ynp0;->s(ILjava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/high16 v1, 0x41800000    # 16.0f

    .line 20
    .line 21
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    add-int/2addr v0, v1

    .line 26
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->v:I

    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->g:Lv/VText;

    .line 29
    .line 30
    new-instance v1, Ll/bp1;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/bp1;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->h:Landroid/widget/FrameLayout;

    .line 39
    .line 40
    new-instance v1, Ll/cp1;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/cp1;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->b:Landroid/widget/LinearLayout;

    .line 49
    .line 50
    new-instance v1, Ll/dp1;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Ll/dp1;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->m:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 59
    .line 60
    new-instance v1, Ll/ep1;

    .line 61
    .line 62
    invoke-direct {v1, p0}, Ll/ep1;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;)V

    .line 63
    .line 64
    .line 65
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method private synthetic s(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->p:Ll/in1;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->x:I

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ll/in1;->l4(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->p:Ll/in1;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->x:I

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ll/in1;->l4(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic v(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->p:Ll/in1;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/in1;->k4()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic w(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->p:Ll/in1;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/in1;->k4()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final A(I)V
    .locals 4

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, 0x1

    .line 3
    const/4 v2, 0x0

    .line 4
    if-eq p1, v0, :cond_1

    .line 5
    .line 6
    const/4 v0, 0x3

    .line 7
    if-eq p1, v0, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->g:Lv/VText;

    .line 10
    .line 11
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->h:Landroid/widget/FrameLayout;

    .line 15
    .line 16
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->v:I

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->g:Lv/VText;

    .line 23
    .line 24
    new-array v3, v1, [Landroid/view/View;

    .line 25
    .line 26
    aput-object v0, v3, v2

    .line 27
    .line 28
    invoke-static {p1, v3}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->i:Lv/VImage;

    .line 32
    .line 33
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->g:Lv/VText;

    .line 37
    .line 38
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->h:Landroid/widget/FrameLayout;

    .line 42
    .line 43
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->e:Landroid/widget/FrameLayout;

    .line 47
    .line 48
    sget p1, Ll/obc0;->X0:I

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->g:Lv/VText;

    .line 55
    .line 56
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->D4:I

    .line 57
    .line 58
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->g:Lv/VText;

    .line 62
    .line 63
    invoke-static {p1, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    iget p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->v:I

    .line 67
    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->g:Lv/VText;

    .line 69
    .line 70
    new-array v1, v1, [Landroid/view/View;

    .line 71
    .line 72
    aput-object v0, v1, v2

    .line 73
    .line 74
    invoke-static {p1, v1}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 75
    .line 76
    .line 77
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->h:Landroid/widget/FrameLayout;

    .line 78
    .line 79
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 80
    .line 81
    .line 82
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->e:Landroid/widget/FrameLayout;

    .line 83
    .line 84
    const/4 v0, 0x0

    .line 85
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 86
    .line 87
    .line 88
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->p:Ll/in1;

    .line 89
    .line 90
    invoke-virtual {p0, v0}, Ll/in1;->n4(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public B(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->j:Lv/VImage;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Landroid/view/View;

    .line 6
    .line 7
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public E()V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->c:Lv/VText;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->d:Lv/VText;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->x:I

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->g:Lv/VText;

    .line 17
    .line 18
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->h:Landroid/widget/FrameLayout;

    .line 22
    .line 23
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->m:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->i0()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final F()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->A:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->z:Ll/jxd0;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 25
    return p0
.end method

.method public G(IZ)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->g:Lv/VText;

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->e:Landroid/widget/FrameLayout;

    .line 8
    .line 9
    :goto_0
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->n(Landroid/view/View;Z)Landroid/animation/Animator;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->s:Landroid/animation/Animator;

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public H(D)V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/p6s;->s0()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->C7:I

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->X:I

    .line 15
    .line 16
    :goto_0
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->n:Ljava/lang/String;

    .line 21
    .line 22
    sget-object v0, Ll/htd0;->f:Ll/htd0;

    .line 23
    .line 24
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Ll/civ;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/civ;->n()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Td:I

    .line 37
    .line 38
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->n:Ljava/lang/String;

    .line 43
    .line 44
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->d:Lv/VText;

    .line 45
    .line 46
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v1}, Ll/p6s;->u0()Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->d:Lv/VText;

    .line 58
    .line 59
    new-instance v1, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-static {p1, p2}, Ll/yau;->c(D)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->n:Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public I(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V
    .locals 3

    .line 1
    invoke-static {p1}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p2}, Ll/nsv;->e(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)Ll/nsv;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->m:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 10
    .line 11
    const/high16 v1, 0x42540000    # 53.0f

    .line 12
    .line 13
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    new-instance v2, Ll/fp1;

    .line 18
    .line 19
    invoke-direct {v2}, Ll/fp1;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-static {v0, v1, p2, v2}, Ll/biv;->b(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILl/nsv;Ll/qcj;)V

    .line 23
    .line 24
    .line 25
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->c:Lv/VText;

    .line 26
    .line 27
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    new-instance p2, Ll/jxd0;

    .line 33
    .line 34
    new-instance v0, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string v1, "fans_club_anim_shown"

    .line 37
    .line 38
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    sget-object p1, Ll/uqb0;->b0:Ll/sre0;

    .line 47
    .line 48
    iget-object p1, p1, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 49
    .line 50
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 62
    .line 63
    invoke-direct {p2, p1, v0}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 64
    .line 65
    .line 66
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->z:Ll/jxd0;

    .line 67
    .line 68
    invoke-static {}, Ll/pzi0;->o()J

    .line 69
    .line 70
    .line 71
    move-result-wide p1

    .line 72
    sget-wide v0, Ll/uhd0;->l:J

    .line 73
    .line 74
    sub-long/2addr p1, v0

    .line 75
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->p:Ll/in1;

    .line 76
    .line 77
    new-instance v0, Ll/gp1;

    .line 78
    .line 79
    invoke-direct {v0, p1, p2}, Ll/gp1;-><init>(J)V

    .line 80
    .line 81
    .line 82
    const-string p1, "audience_avatar_info_loaded"

    .line 83
    .line 84
    invoke-static {p0, p1, v0}, Ll/fgt;->c(Ll/i6t;Ljava/lang/String;Ll/y20;)V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->E()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->t:Landroid/animation/ValueAnimator;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->q:Landroid/animation/Animator;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 16
    .line 17
    .line 18
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->o:Ll/ak1;

    .line 19
    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/ak1;->e()V

    .line 23
    .line 24
    .line 25
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->u:Landroid/animation/ValueAnimator;

    .line 26
    .line 27
    if-eqz v0, :cond_3

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 30
    .line 31
    .line 32
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->r:Landroid/animation/Animator;

    .line 33
    .line 34
    if-eqz v0, :cond_4

    .line 35
    .line 36
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 37
    .line 38
    .line 39
    :cond_4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->s:Landroid/animation/Animator;

    .line 40
    .line 41
    if-eqz p0, :cond_5

    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/animation/Animator;->cancel()V

    .line 44
    .line 45
    .line 46
    :cond_5
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/in1;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->m(Ll/in1;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public final l(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ip1;->a(Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public m(Ll/in1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->p:Ll/in1;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/xzs;->L2()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->g:Lv/VText;

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public n(Landroid/view/View;Z)Landroid/animation/Animator;
    .locals 1

    .line 1
    const/4 p0, 0x2

    .line 2
    new-array p0, p0, [F

    .line 3
    .line 4
    fill-array-data p0, :array_0

    .line 5
    .line 6
    .line 7
    invoke-static {p0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Ll/hp1;

    .line 12
    .line 13
    invoke-direct {v0, p1}, Ll/hp1;-><init>(Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 17
    .line 18
    .line 19
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView$a;

    .line 20
    .line 21
    invoke-direct {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView$a;-><init>(Z)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 25
    .line 26
    .line 27
    const-wide/16 p1, 0x3e8

    .line 28
    .line 29
    invoke-virtual {p0, p1, p2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 30
    .line 31
    .line 32
    return-object p0

    .line 33
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public onFinishInflate()V
    .locals 7

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->l(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->r()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->m:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->p0()V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->k:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 16
    .line 17
    const/high16 p0, 0x41800000    # 16.0f

    .line 18
    .line 19
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    neg-int v2, v0

    .line 24
    const/4 v5, 0x0

    .line 25
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result v6

    .line 29
    const/4 v3, 0x0

    .line 30
    const/4 v4, 0x0

    .line 31
    invoke-static/range {v1 .. v6}, Ll/qnp0;->c1(Landroid/view/View;IIIII)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final synthetic p(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->g:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Ljava/lang/Integer;

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->g:Lv/VText;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic q(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->g:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Ljava/lang/Integer;

    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Ljava/lang/Integer;

    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->v:I

    .line 30
    .line 31
    if-lt p1, v0, :cond_0

    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->g:Lv/VText;

    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->g:Lv/VText;

    .line 40
    .line 41
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->D4:I

    .line 42
    .line 43
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 44
    .line 45
    .line 46
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->g:Lv/VText;

    .line 47
    .line 48
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public x()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->x:I

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->getFirstFollowAnimator()Landroid/animation/Animator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->p:Ll/in1;

    .line 15
    .line 16
    const-string v0, "slide"

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/in1;->n4(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public y(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->x:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->A(I)V

    .line 6
    .line 7
    .line 8
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->x:I

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->p:Ll/in1;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/in1;->X3(I)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    if-eq v0, p1, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->z(II)V

    .line 19
    .line 20
    .line 21
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->x:I

    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method public final z(II)V
    .locals 4

    .line 1
    const/4 v0, 0x4

    .line 2
    const/4 v1, 0x2

    .line 3
    const/4 v2, 0x1

    .line 4
    if-ne p1, v2, :cond_0

    .line 5
    .line 6
    if-ne p2, v1, :cond_0

    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->g:Lv/VText;

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->getShowFollowAnimator()Landroid/animation/Animator;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    if-ne p1, v1, :cond_4

    .line 22
    .line 23
    const/4 v3, 0x3

    .line 24
    if-ne p2, v3, :cond_4

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->F()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_3

    .line 31
    .line 32
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->getFirstFollowAnimator()Landroid/animation/Animator;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1}, Landroid/animation/Animator;->isRunning()Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-eqz p1, :cond_1

    .line 41
    .line 42
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->getFirstFollowAnimator()Landroid/animation/Animator;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p1}, Landroid/animation/Animator;->cancel()V

    .line 47
    .line 48
    .line 49
    :cond_1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->getShowFansClubEntryAnimatorStart()V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->z:Ll/jxd0;

    .line 53
    .line 54
    if-eqz p0, :cond_2

    .line 55
    .line 56
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 57
    .line 58
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    :cond_2
    return-void

    .line 62
    :cond_3
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->A(I)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_4
    if-ne p1, v1, :cond_5

    .line 67
    .line 68
    if-ne p2, v2, :cond_5

    .line 69
    .line 70
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->g:Lv/VText;

    .line 71
    .line 72
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 73
    .line 74
    .line 75
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->getHideFollowAnimator()Landroid/animation/Animator;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_5
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->A(I)V

    .line 84
    .line 85
    .line 86
    return-void
.end method
