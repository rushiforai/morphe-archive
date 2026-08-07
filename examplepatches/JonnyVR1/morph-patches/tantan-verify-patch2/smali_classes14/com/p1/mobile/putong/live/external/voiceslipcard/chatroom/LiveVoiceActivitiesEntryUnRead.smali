.class public Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;
.super Lv/VRelative;
.source "SourceFile"

# interfaces
.implements Ll/h2v;


# instance fields
.field public d:Lv/VDraweeView;

.field public e:Lv/VMarqueeText;

.field public f:Lv/VMarqueeText;

.field public g:Lv/VFrame;

.field public h:Lv/VImage;

.field public final i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public j:Landroid/animation/Animator;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public k:Ll/kcg0;

.field public l:I

.field public m:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->i:Ljava/util/List;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->l:I

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic B(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;ZLl/h2v;IILandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->T(ZLl/h2v;IILandroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic H(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->setViewsVisibility(Z)V

    return-void
.end method

.method public static synthetic I(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->W()V

    return-void
.end method

.method public static synthetic L(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->a0(I)V

    return-void
.end method

.method public static bridge synthetic M(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->Z(II)V

    return-void
.end method

.method public static bridge synthetic O(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;FFF)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->c0(FFF)V

    return-void
.end method

.method private synthetic S(Ll/h2v;ZIILandroid/animation/ValueAnimator;)V
    .locals 3

    .line 1
    invoke-virtual {p5}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 2
    .line 3
    .line 4
    move-result p5

    .line 5
    invoke-interface {p1, p2}, Ll/h2v;->K(Z)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    int-to-float v0, v0

    .line 10
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->K(Z)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-interface {p1, p2}, Ll/h2v;->K(Z)I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    sub-int/2addr v1, v2

    .line 19
    int-to-float v1, v1

    .line 20
    mul-float/2addr v1, p5

    .line 21
    add-float/2addr v0, v1

    .line 22
    float-to-int v0, v0

    .line 23
    invoke-interface {p1, p2}, Ll/h2v;->u(Z)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    int-to-float v1, v1

    .line 28
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->u(Z)I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    invoke-interface {p1, p2}, Ll/h2v;->u(Z)I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    sub-int/2addr v2, p1

    .line 37
    int-to-float p1, v2

    .line 38
    mul-float/2addr p1, p5

    .line 39
    add-float/2addr v1, p1

    .line 40
    float-to-int p1, v1

    .line 41
    invoke-direct {p0, v0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->Z(II)V

    .line 42
    .line 43
    .line 44
    neg-int p1, p3

    .line 45
    int-to-float p1, p1

    .line 46
    const/high16 p2, 0x3f800000    # 1.0f

    .line 47
    .line 48
    sub-float/2addr p2, p5

    .line 49
    mul-float/2addr p1, p2

    .line 50
    neg-int p3, p4

    .line 51
    int-to-float p3, p3

    .line 52
    mul-float/2addr p3, p2

    .line 53
    invoke-direct {p0, p1, p3, p5}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->c0(FFF)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method private synthetic T(ZLl/h2v;IILandroid/animation/ValueAnimator;)V
    .locals 3

    .line 1
    invoke-virtual {p5}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 2
    .line 3
    .line 4
    move-result p5

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->K(Z)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    int-to-float v0, v0

    .line 10
    invoke-interface {p2, p1}, Ll/h2v;->K(Z)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->K(Z)I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    sub-int/2addr v1, v2

    .line 19
    int-to-float v1, v1

    .line 20
    mul-float/2addr v1, p5

    .line 21
    add-float/2addr v0, v1

    .line 22
    float-to-int v0, v0

    .line 23
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->u(Z)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    int-to-float v1, v1

    .line 28
    invoke-interface {p2, p1}, Ll/h2v;->u(Z)I

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->u(Z)I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    sub-int/2addr p2, p1

    .line 37
    int-to-float p1, p2

    .line 38
    mul-float/2addr p1, p5

    .line 39
    add-float/2addr v1, p1

    .line 40
    float-to-int p1, v1

    .line 41
    invoke-direct {p0, v0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->Z(II)V

    .line 42
    .line 43
    .line 44
    neg-int p1, p3

    .line 45
    int-to-float p1, p1

    .line 46
    mul-float/2addr p1, p5

    .line 47
    neg-int p2, p4

    .line 48
    int-to-float p2, p2

    .line 49
    mul-float/2addr p2, p5

    .line 50
    const/high16 p3, 0x3f800000    # 1.0f

    .line 51
    .line 52
    sub-float/2addr p3, p5

    .line 53
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->c0(FFF)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method private W()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->i:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->l:I

    .line 11
    .line 12
    add-int/lit8 v0, v0, 0x1

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->i:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    rem-int/2addr v0, v1

    .line 21
    iput v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->l:I

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->d:Lv/VDraweeView;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->i:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Ljava/lang/String;

    .line 32
    .line 33
    const-string v0, "context_square"

    .line 34
    .line 35
    invoke-static {v0, v1, p0}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private Z(II)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 6
    .line 7
    iput p2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private a0(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private b0(Ll/j0v;Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->i:Ljava/util/List;

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/j0v;->c()Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->i:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    const/4 v0, 0x2

    .line 20
    if-lt p1, v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->X(Lcom/p1/mobile/android/app/Act;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->i:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-nez p1, :cond_2

    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->d:Lv/VDraweeView;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->i:Ljava/util/List;

    .line 37
    .line 38
    const/4 p2, 0x0

    .line 39
    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    check-cast p0, Ljava/lang/String;

    .line 44
    .line 45
    const-string p2, "context_square"

    .line 46
    .line 47
    invoke-static {p2, p1, p0}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    :cond_2
    :goto_0
    return-void
.end method

.method private c0(FFF)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->d:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->d:Lv/VDraweeView;

    .line 7
    .line 8
    invoke-virtual {v0, p2}, Landroid/view/View;->setTranslationY(F)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->d:Lv/VDraweeView;

    .line 12
    .line 13
    invoke-virtual {v0, p3}, Landroid/view/View;->setAlpha(F)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->e:Lv/VMarqueeText;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->e:Lv/VMarqueeText;

    .line 22
    .line 23
    invoke-virtual {v0, p2}, Landroid/view/View;->setTranslationY(F)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->e:Lv/VMarqueeText;

    .line 27
    .line 28
    invoke-virtual {v0, p3}, Landroid/view/View;->setAlpha(F)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->f:Lv/VMarqueeText;

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->f:Lv/VMarqueeText;

    .line 37
    .line 38
    invoke-virtual {v0, p2}, Landroid/view/View;->setTranslationY(F)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->f:Lv/VMarqueeText;

    .line 42
    .line 43
    invoke-virtual {v0, p3}, Landroid/view/View;->setAlpha(F)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->g:Lv/VFrame;

    .line 47
    .line 48
    invoke-virtual {v0, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->g:Lv/VFrame;

    .line 52
    .line 53
    invoke-virtual {p1, p2}, Landroid/view/View;->setTranslationY(F)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->g:Lv/VFrame;

    .line 57
    .line 58
    invoke-virtual {p1, p3}, Landroid/view/View;->setAlpha(F)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0, p3}, Landroid/view/View;->setAlpha(F)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;Ll/h2v;ZIILandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->S(Ll/h2v;ZIILandroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->V(Ljava/lang/Long;)V

    return-void
.end method

.method private setViewsAlpha(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->e:Lv/VMarqueeText;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->f:Lv/VMarqueeText;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->g:Lv/VFrame;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private setViewsVisibility(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->e:Lv/VMarqueeText;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->f:Lv/VMarqueeText;

    .line 7
    .line 8
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->g:Lv/VFrame;

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->m:Z

    .line 16
    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    :goto_0
    invoke-static {v0, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->setViewsAlpha(F)V

    return-void
.end method


# virtual methods
.method public C(Ll/h2v;Z)Landroid/animation/Animator;
    .locals 8

    .line 1
    invoke-interface {p1, p2}, Ll/h2v;->K(Z)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->K(Z)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-int v6, v0, v1

    .line 10
    .line 11
    invoke-interface {p1, p2}, Ll/h2v;->u(Z)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->u(Z)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    sub-int v7, v0, v1

    .line 20
    .line 21
    const/4 v0, 0x2

    .line 22
    new-array v0, v0, [F

    .line 23
    .line 24
    fill-array-data v0, :array_0

    .line 25
    .line 26
    .line 27
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v2, Ll/i1v;

    .line 32
    .line 33
    move-object v3, p0

    .line 34
    move-object v5, p1

    .line 35
    move v4, p2

    .line 36
    invoke-direct/range {v2 .. v7}, Ll/i1v;-><init>(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;ZLl/h2v;II)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 40
    .line 41
    .line 42
    new-instance p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead$b;

    .line 43
    .line 44
    invoke-direct {p0, v3, v4}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead$b;-><init>(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;Z)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, p0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 48
    .line 49
    .line 50
    const-wide/16 p0, 0x320

    .line 51
    .line 52
    invoke-virtual {v0, p0, p1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 53
    .line 54
    .line 55
    return-object v0

    .line 56
    nop

    .line 57
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public E(Ll/h2v;Z)Landroid/animation/Animator;
    .locals 8

    .line 1
    invoke-interface {p1, p2}, Ll/h2v;->K(Z)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->K(Z)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-int v6, v0, v1

    .line 10
    .line 11
    invoke-interface {p1, p2}, Ll/h2v;->u(Z)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->u(Z)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    sub-int v7, v0, v1

    .line 20
    .line 21
    const/4 v0, 0x2

    .line 22
    new-array v0, v0, [F

    .line 23
    .line 24
    fill-array-data v0, :array_0

    .line 25
    .line 26
    .line 27
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v2, Ll/h1v;

    .line 32
    .line 33
    move-object v3, p0

    .line 34
    move-object v4, p1

    .line 35
    move v5, p2

    .line 36
    invoke-direct/range {v2 .. v7}, Ll/h1v;-><init>(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;Ll/h2v;ZII)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 40
    .line 41
    .line 42
    const-wide/16 p0, 0x320

    .line 43
    .line 44
    invoke-virtual {v0, p0, p1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 45
    .line 46
    .line 47
    new-instance p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead$a;

    .line 48
    .line 49
    invoke-direct {p0, v3, v5, v6, v7}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead$a;-><init>(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;ZII)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, p0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 53
    .line 54
    .line 55
    return-object v0

    .line 56
    nop

    .line 57
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public F()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v1

    .line 5
    const/high16 v0, 0x428c0000    # 70.0f

    .line 6
    .line 7
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    new-instance v3, Ll/e1v;

    .line 12
    .line 13
    invoke-direct {v3, p0}, Ll/e1v;-><init>(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;)V

    .line 14
    .line 15
    .line 16
    new-instance v4, Ll/f1v;

    .line 17
    .line 18
    invoke-direct {v4, p0}, Ll/f1v;-><init>(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;)V

    .line 19
    .line 20
    .line 21
    new-instance v5, Ll/g1v;

    .line 22
    .line 23
    invoke-direct {v5, p0}, Ll/g1v;-><init>(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;)V

    .line 24
    .line 25
    .line 26
    move-object v0, p0

    .line 27
    invoke-interface/range {v0 .. v5}, Ll/h2v;->w(IILl/y20;Ll/y20;Ll/y20;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public K(Z)I
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/high16 p0, 0x428c0000    # 70.0f

    .line 4
    .line 5
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->m:Z

    .line 11
    .line 12
    if-nez p0, :cond_1

    .line 13
    .line 14
    const/high16 p0, 0x432d0000    # 173.0f

    .line 15
    .line 16
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0

    .line 21
    :cond_1
    const/high16 p0, 0x43450000    # 197.0f

    .line 22
    .line 23
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0
.end method

.method public final P(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/l1v;->a(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Q()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->k:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->j:Landroid/animation/Animator;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 11
    .line 12
    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    iput v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->l:I

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->i:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public R(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->e:Lv/VMarqueeText;

    .line 2
    .line 3
    invoke-static {p1}, Ll/jyn0;->b(Z)Ll/ss2;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v1}, Ll/ss2;->k()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->f:Lv/VMarqueeText;

    .line 15
    .line 16
    invoke-static {p1}, Ll/jyn0;->b(Z)Ll/ss2;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-interface {v1}, Ll/ss2;->n()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->h:Lv/VImage;

    .line 28
    .line 29
    invoke-static {p1}, Ll/jyn0;->b(Z)Ll/ss2;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-interface {p1}, Ll/ss2;->i()I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final synthetic V(Ljava/lang/Long;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->j:Landroid/animation/Animator;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/animation/Animator;->cancel()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->j:Landroid/animation/Animator;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public X(Lcom/p1/mobile/android/app/Act;)V
    .locals 10

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->d:Lv/VDraweeView;

    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->i:Ljava/util/List;

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Ljava/lang/String;

    .line 14
    .line 15
    const-string v2, "context_square"

    .line 16
    .line 17
    invoke-static {v2, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->j:Landroid/animation/Animator;

    .line 21
    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->d:Lv/VDraweeView;

    .line 25
    .line 26
    new-instance v7, Landroid/view/animation/LinearInterpolator;

    .line 27
    .line 28
    invoke-direct {v7}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 29
    .line 30
    .line 31
    const/4 v0, 0x2

    .line 32
    new-array v8, v0, [F

    .line 33
    .line 34
    fill-array-data v8, :array_0

    .line 35
    .line 36
    .line 37
    const-string v2, "alpha"

    .line 38
    .line 39
    const-wide/16 v3, 0x0

    .line 40
    .line 41
    const-wide/16 v5, 0xc8

    .line 42
    .line 43
    invoke-static/range {v1 .. v8}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->d:Lv/VDraweeView;

    .line 48
    .line 49
    new-instance v8, Landroid/view/animation/LinearInterpolator;

    .line 50
    .line 51
    invoke-direct {v8}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 52
    .line 53
    .line 54
    new-array v9, v0, [F

    .line 55
    .line 56
    fill-array-data v9, :array_1

    .line 57
    .line 58
    .line 59
    const-string v3, "alpha"

    .line 60
    .line 61
    const-wide/16 v4, 0x0

    .line 62
    .line 63
    const-wide/16 v6, 0xc8

    .line 64
    .line 65
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    new-instance v2, Ll/j1v;

    .line 70
    .line 71
    invoke-direct {v2, p0}, Ll/j1v;-><init>(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;)V

    .line 72
    .line 73
    .line 74
    invoke-static {v0, v2}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    const/16 v2, 0x7d0

    .line 79
    .line 80
    invoke-static {v2}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    filled-new-array {v0, v1, v2}, [Landroid/animation/Animator;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-static {v0}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->j:Landroid/animation/Animator;

    .line 93
    .line 94
    new-instance v1, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead$c;

    .line 95
    .line 96
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead$c;-><init>(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 100
    .line 101
    .line 102
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->k:Ll/kcg0;

    .line 103
    .line 104
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 105
    .line 106
    .line 107
    const-wide/16 v0, 0x96a

    .line 108
    .line 109
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 110
    .line 111
    const-wide/16 v3, 0x0

    .line 112
    .line 113
    invoke-static {v3, v4, v0, v1, v2}, Lrx/c;->interval(JJLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    invoke-virtual {p1}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-virtual {p1, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    new-instance v0, Ll/k1v;

    .line 134
    .line 135
    invoke-direct {v0, p0}, Ll/k1v;-><init>(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;)V

    .line 136
    .line 137
    .line 138
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->k:Ll/kcg0;

    .line 147
    .line 148
    return-void

    .line 149
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public Y(Ll/j0v;Ll/v5v;Z)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/j0v;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->m:Z

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->g:Lv/VFrame;

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->K(Z)I

    .line 13
    .line 14
    .line 15
    move-result p3

    .line 16
    invoke-direct {p0, p3}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->a0(I)V

    .line 17
    .line 18
    .line 19
    iget-object p3, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->e:Lv/VMarqueeText;

    .line 20
    .line 21
    invoke-virtual {p1}, Ll/j0v;->b()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    iget-object p3, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->f:Lv/VMarqueeText;

    .line 29
    .line 30
    invoke-virtual {p1}, Ll/j0v;->g()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    iget-object p3, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->i:Ljava/util/List;

    .line 38
    .line 39
    invoke-virtual {p1}, Ll/j0v;->c()Ljava/util/List;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ll/ty6;

    .line 44
    .line 45
    invoke-direct {v1}, Ll/ty6;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-static {p3, v0, v1}, Ll/jyb;->l(Ljava/util/Collection;Ljava/util/Collection;Ll/rcj;)Z

    .line 49
    .line 50
    .line 51
    move-result p3

    .line 52
    if-nez p3, :cond_0

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->Q()V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p2}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->b0(Ll/j0v;Lcom/p1/mobile/android/app/Act;)V

    .line 62
    .line 63
    .line 64
    :cond_0
    return-void
.end method

.method public j()V
    .locals 7

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->m:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/high16 v0, 0x43450000    # 197.0f

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/high16 v0, 0x432d0000    # 173.0f

    .line 9
    .line 10
    :goto_0
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    new-instance v4, Ll/e1v;

    .line 19
    .line 20
    invoke-direct {v4, p0}, Ll/e1v;-><init>(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;)V

    .line 21
    .line 22
    .line 23
    new-instance v5, Ll/f1v;

    .line 24
    .line 25
    invoke-direct {v5, p0}, Ll/f1v;-><init>(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;)V

    .line 26
    .line 27
    .line 28
    new-instance v6, Ll/g1v;

    .line 29
    .line 30
    invoke-direct {v6, p0}, Ll/g1v;-><init>(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;)V

    .line 31
    .line 32
    .line 33
    move-object v1, p0

    .line 34
    invoke-interface/range {v1 .. v6}, Ll/h2v;->l(IILl/y20;Ll/y20;Ll/y20;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->Q()V

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
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->P(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->R(Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setOnCloseButtonClickListener(Landroid/view/View$OnClickListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->g:Lv/VFrame;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public u(Z)I
    .locals 0

    .line 1
    const/high16 p0, 0x428c0000    # 70.0f

    .line 2
    .line 3
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
