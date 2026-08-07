.class public Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;

.field public e:Lv/VDraweeView;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;

.field public j:Landroid/animation/AnimatorSet;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->r0()V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->u0()V

    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->t0()V

    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->s0()V

    return-void
.end method

.method public static synthetic l0(Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->v0()V

    return-void
.end method

.method private n0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->f:Lv/VText;

    .line 2
    .line 3
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->B0(Landroid/widget/TextView;Ljava/lang/Boolean;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->g:Lv/VText;

    .line 9
    .line 10
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->B0(Landroid/widget/TextView;Ljava/lang/Boolean;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->j:Landroid/animation/AnimatorSet;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->j:Landroid/animation/AnimatorSet;

    .line 21
    .line 22
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 23
    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->j:Landroid/animation/AnimatorSet;

    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method private synthetic u0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->g:Lv/VText;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public final B0(Landroid/widget/TextView;Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    const/high16 p0, 0x41a00000    # 20.0f

    .line 2
    .line 3
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    const/high16 v0, 0x3f800000    # 1.0f

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v0, v1

    .line 18
    :goto_0
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    if-eqz p2, :cond_1

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    int-to-float v1, p0

    .line 29
    :goto_1
    invoke-virtual {p1, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final m0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/thw;->a(Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public o0(J)Ljava/lang/String;
    .locals 4

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long p0, p1, v0

    .line 4
    .line 5
    if-gez p0, :cond_0

    .line 6
    .line 7
    const-string p0, ""

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    cmp-long p0, p1, v0

    .line 11
    .line 12
    const-wide/16 v2, 0xe10

    .line 13
    .line 14
    if-ltz p0, :cond_1

    .line 15
    .line 16
    cmp-long p0, p1, v2

    .line 17
    .line 18
    if-gez p0, :cond_1

    .line 19
    .line 20
    const-wide/16 v0, 0x3c

    .line 21
    .line 22
    div-long v2, p1, v0

    .line 23
    .line 24
    rem-long v0, p1, v0

    .line 25
    .line 26
    move-wide p0, v0

    .line 27
    move-wide v0, v2

    .line 28
    goto :goto_0

    .line 29
    :cond_1
    cmp-long p0, p1, v2

    .line 30
    .line 31
    if-ltz p0, :cond_2

    .line 32
    .line 33
    const-wide/16 v0, 0x3b

    .line 34
    .line 35
    :cond_2
    move-wide p0, v0

    .line 36
    :goto_0
    new-instance p2, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v0, ":"

    .line 45
    .line 46
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-wide/16 v0, 0xa

    .line 50
    .line 51
    cmp-long v0, p0, v0

    .line 52
    .line 53
    if-gez v0, :cond_3

    .line 54
    .line 55
    const-string v0, "0"

    .line 56
    .line 57
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    :cond_3
    invoke-virtual {p2, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    return-object p0
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->n0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->m0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public p0()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->n0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->h:Lv/VText;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->i:Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->i:Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->defaultIcon:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->setIcon(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public q0()Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->f:Lv/VText;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->f:Lv/VText;

    .line 10
    .line 11
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public final synthetic r0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->g:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->f:Lv/VText;

    .line 8
    .line 9
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic s0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->f:Lv/VText;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setIcon(I)V
    .locals 0

    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->e:Lv/VDraweeView;

    invoke-virtual {p0, p1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    return-void
.end method

.method public setIcon(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->e:Lv/VDraweeView;

    .line 2
    .line 3
    sget v0, Ll/qa00;->w:I

    .line 4
    .line 5
    const-string v1, "context_livingAct"

    .line 6
    .line 7
    invoke-static {v1, p0, p1, v0}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic t0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->f:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->g:Lv/VText;

    .line 8
    .line 9
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic v0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->j:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final w0()V
    .locals 23

    move-object/from16 v0, p0

    .line 1
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->n0()V

    .line 2
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->f:Lv/VText;

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->B0(Landroid/widget/TextView;Ljava/lang/Boolean;)V

    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->j:Landroid/animation/AnimatorSet;

    if-nez v1, :cond_0

    const/16 v1, 0xfa0

    .line 4
    invoke-static {v1}, Ll/gt0;->j(I)Landroid/animation/Animator;

    move-result-object v2

    .line 5
    iget-object v3, v0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->f:Lv/VText;

    const/4 v11, 0x2

    new-array v10, v11, [F

    fill-array-data v10, :array_0

    .line 6
    sget-object v13, Landroid/view/ViewGroup;->TRANSLATION_Y:Landroid/util/Property;

    const-wide/16 v5, 0x0

    const-wide/16 v18, 0x12c

    const/4 v9, 0x0

    move-object v4, v13

    move-wide/from16 v7, v18

    invoke-static/range {v3 .. v10}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    move-result-object v3

    check-cast v3, Landroid/animation/ObjectAnimator;

    .line 7
    iget-object v14, v0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->f:Lv/VText;

    new-array v4, v11, [F

    fill-array-data v4, :array_1

    .line 8
    sget-object v15, Landroid/view/ViewGroup;->ALPHA:Landroid/util/Property;

    const-wide/16 v16, 0x0

    const/16 v20, 0x0

    move-object/from16 v21, v4

    invoke-static/range {v14 .. v21}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    move-result-object v4

    move-object v5, v15

    check-cast v4, Landroid/animation/ObjectAnimator;

    .line 9
    iget-object v12, v0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->g:Lv/VText;

    new-array v6, v11, [F

    fill-array-data v6, :array_2

    const-wide/16 v14, 0x0

    move-wide/from16 v16, v18

    const/16 v18, 0x0

    move-object/from16 v19, v6

    .line 10
    invoke-static/range {v12 .. v19}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    move-result-object v6

    move-wide/from16 v18, v16

    check-cast v6, Landroid/animation/ObjectAnimator;

    .line 11
    iget-object v14, v0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->g:Lv/VText;

    new-array v7, v11, [F

    fill-array-data v7, :array_3

    const-wide/16 v16, 0x0

    move-object v15, v5

    move-object/from16 v21, v7

    .line 12
    invoke-static/range {v14 .. v21}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    move-result-object v5

    move-object v7, v15

    check-cast v5, Landroid/animation/ObjectAnimator;

    .line 13
    new-instance v8, Landroid/animation/AnimatorSet;

    invoke-direct {v8}, Landroid/animation/AnimatorSet;-><init>()V

    .line 14
    new-instance v9, Ll/ohw;

    invoke-direct {v9, v0}, Ll/ohw;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;)V

    new-instance v10, Ll/phw;

    invoke-direct {v10, v0}, Ll/phw;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;)V

    invoke-static {v4, v9, v10}, Ll/gt0;->w(Landroid/animation/Animator;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator;

    const/4 v9, 0x4

    .line 15
    new-array v10, v9, [Landroid/animation/Animator;

    const/16 v22, 0x0

    aput-object v3, v10, v22

    const/4 v3, 0x1

    aput-object v4, v10, v3

    aput-object v6, v10, v11

    const/4 v4, 0x3

    aput-object v5, v10, v4

    invoke-virtual {v8, v10}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 16
    invoke-static {v1}, Ll/gt0;->j(I)Landroid/animation/Animator;

    move-result-object v1

    .line 17
    iget-object v12, v0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->g:Lv/VText;

    new-array v5, v11, [F

    fill-array-data v5, :array_4

    const-wide/16 v14, 0x0

    move-wide/from16 v16, v18

    const/16 v18, 0x0

    move-object/from16 v19, v5

    .line 18
    invoke-static/range {v12 .. v19}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    move-result-object v5

    move-wide/from16 v18, v16

    check-cast v5, Landroid/animation/ObjectAnimator;

    .line 19
    iget-object v14, v0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->g:Lv/VText;

    new-array v6, v11, [F

    fill-array-data v6, :array_5

    const-wide/16 v16, 0x0

    move-object/from16 v21, v6

    move-object v15, v7

    .line 20
    invoke-static/range {v14 .. v21}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    move-result-object v6

    check-cast v6, Landroid/animation/ObjectAnimator;

    .line 21
    iget-object v12, v0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->f:Lv/VText;

    new-array v10, v11, [F

    fill-array-data v10, :array_6

    const-wide/16 v14, 0xc8

    move-wide/from16 v16, v18

    const/16 v18, 0x0

    move-object/from16 v19, v10

    .line 22
    invoke-static/range {v12 .. v19}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    move-result-object v10

    move-wide/from16 v18, v16

    check-cast v10, Landroid/animation/ObjectAnimator;

    .line 23
    iget-object v14, v0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->f:Lv/VText;

    new-array v12, v11, [F

    fill-array-data v12, :array_7

    const-wide/16 v16, 0xc8

    move-object v15, v7

    move-object/from16 v21, v12

    .line 24
    invoke-static/range {v14 .. v21}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    move-result-object v7

    check-cast v7, Landroid/animation/ObjectAnimator;

    .line 25
    new-instance v12, Landroid/animation/AnimatorSet;

    invoke-direct {v12}, Landroid/animation/AnimatorSet;-><init>()V

    .line 26
    new-instance v13, Ll/qhw;

    invoke-direct {v13, v0}, Ll/qhw;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;)V

    new-instance v14, Ll/rhw;

    invoke-direct {v14, v0}, Ll/rhw;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;)V

    invoke-static {v6, v13, v14}, Ll/gt0;->w(Landroid/animation/Animator;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 27
    new-array v13, v9, [Landroid/animation/Animator;

    aput-object v5, v13, v22

    aput-object v6, v13, v3

    aput-object v10, v13, v11

    aput-object v7, v13, v4

    invoke-virtual {v12, v13}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 28
    new-instance v5, Landroid/animation/AnimatorSet;

    invoke-direct {v5}, Landroid/animation/AnimatorSet;-><init>()V

    iput-object v5, v0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->j:Landroid/animation/AnimatorSet;

    .line 29
    new-array v6, v9, [Landroid/animation/Animator;

    aput-object v2, v6, v22

    aput-object v8, v6, v3

    aput-object v1, v6, v11

    aput-object v12, v6, v4

    invoke-virtual {v5, v6}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    .line 30
    :cond_0
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->j:Landroid/animation/AnimatorSet;

    new-instance v2, Ll/shw;

    invoke-direct {v2, v0}, Ll/shw;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;)V

    invoke-static {v1, v2}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->j:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        -0x3f800000    # -4.0f
    .end array-data

    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    :array_2
    .array-data 4
        0x40800000    # 4.0f
        0x0
    .end array-data

    :array_3
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    :array_4
    .array-data 4
        0x0
        -0x3ec00000    # -12.0f
    .end array-data

    :array_5
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    :array_6
    .array-data 4
        0x41400000    # 12.0f
        0x0
    .end array-data

    :array_7
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public y0(Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;)V
    .locals 5

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->i:Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->h:Lv/VText;

    .line 4
    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->tip:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x1

    .line 12
    xor-int/2addr v1, v2

    .line 13
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->tip:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->h:Lv/VText;

    .line 25
    .line 26
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->tip:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->isCrazyNow:Z

    .line 32
    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->crazyIcon:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->setIcon(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->f:Lv/VText;

    .line 41
    .line 42
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->endTime:J

    .line 46
    .line 47
    iget-wide v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->currentTime:J

    .line 48
    .line 49
    sub-long/2addr v0, v2

    .line 50
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->z0(J)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->buff:Z

    .line 55
    .line 56
    if-eqz v0, :cond_3

    .line 57
    .line 58
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->buffText:Ljava/lang/String;

    .line 59
    .line 60
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-nez v0, :cond_3

    .line 65
    .line 66
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->buffIcon:Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-nez v0, :cond_3

    .line 73
    .line 74
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->g:Lv/VText;

    .line 75
    .line 76
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->buffText:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 79
    .line 80
    .line 81
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->endTime:J

    .line 82
    .line 83
    iget-wide v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->currentTime:J

    .line 84
    .line 85
    sub-long/2addr v0, v3

    .line 86
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->z0(J)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->e:Lv/VDraweeView;

    .line 90
    .line 91
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->buffIcon:Ljava/lang/String;

    .line 92
    .line 93
    sget v1, Ll/qa00;->w:I

    .line 94
    .line 95
    const-string v3, "context_livingAct"

    .line 96
    .line 97
    invoke-static {v3, v0, p1, v1}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 98
    .line 99
    .line 100
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->f:Lv/VText;

    .line 101
    .line 102
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 103
    .line 104
    .line 105
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->j:Landroid/animation/AnimatorSet;

    .line 106
    .line 107
    if-nez p1, :cond_2

    .line 108
    .line 109
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->w0()V

    .line 110
    .line 111
    .line 112
    :cond_2
    return-void

    .line 113
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->p0()V

    .line 114
    .line 115
    .line 116
    return-void
.end method

.method public z0(J)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->f:Lv/VText;

    .line 2
    .line 3
    const-wide/16 v1, 0x3e8

    .line 4
    .line 5
    div-long/2addr p1, v1

    .line 6
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->o0(J)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
