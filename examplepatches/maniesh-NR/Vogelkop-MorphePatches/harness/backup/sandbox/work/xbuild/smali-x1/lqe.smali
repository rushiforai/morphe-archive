.class public final Llqe;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final x:J

.field public static final y:Lixh;

.field public static final z:Lixh;


# instance fields
.field public final a:Lcom/opera/android/feed/FeedContainerView;

.field public final b:Landroid/view/View;

.field public final c:Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

.field public final d:Ltsd;

.field public final e:Lkze;

.field public final f:Lk26;

.field public final g:Ltsd;

.field public final h:Lpde;

.field public final i:Lpde;

.field public j:Landroid/animation/ValueAnimator;

.field public final k:Ljqe;

.field public final l:Ljqe;

.field public final m:Ljqe;

.field public n:I

.field public o:I

.field public p:I

.field public q:Lc1f;

.field public final r:Lkqe;

.field public s:I

.field public t:I

.field public u:I

.field public v:I

.field public w:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Lpn7;->b:Lon7;

    const/16 v0, 0x64

    sget-object v1, Lun7;->d:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Llqe;->x:J

    new-instance v0, Lixh;

    const/high16 v1, 0x41800000    # 16.0f

    invoke-direct {v0, v1}, Lixh;-><init>(F)V

    sput-object v0, Llqe;->y:Lixh;

    new-instance v0, Lixh;

    const/high16 v1, 0x41400000    # 12.0f

    invoke-direct {v0, v1}, Lixh;-><init>(F)V

    sput-object v0, Llqe;->z:Lixh;

    return-void
.end method

.method public constructor <init>(Lpde;Lcom/opera/android/feed/FeedContainerView;Landroid/view/View;Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;Ltsd;Ltsd;Lkze;Lk26;Ltsd;Lpde;Lpde;)V
    .registers 28

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p5

    move-object/from16 v5, p7

    move-object/from16 v6, p9

    move-object/from16 v7, p10

    move-object/from16 v8, p11

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v2, v0, Llqe;->a:Lcom/opera/android/feed/FeedContainerView;

    iput-object v3, v0, Llqe;->b:Landroid/view/View;

    move-object/from16 v9, p4

    iput-object v9, v0, Llqe;->c:Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    iput-object v4, v0, Llqe;->d:Ltsd;

    iput-object v5, v0, Llqe;->e:Lkze;

    move-object/from16 v9, p8

    iput-object v9, v0, Llqe;->f:Lk26;

    iput-object v6, v0, Llqe;->g:Ltsd;

    iput-object v7, v0, Llqe;->h:Lpde;

    iput-object v8, v0, Llqe;->i:Lpde;

    new-instance v9, Ljqe;

    invoke-direct {v9}, Ljqe;-><init>()V

    iput-object v9, v0, Llqe;->k:Ljqe;

    new-instance v10, Ljqe;

    invoke-direct {v10}, Ljqe;-><init>()V

    iput-object v10, v0, Llqe;->l:Ljqe;

    new-instance v11, Ljqe;

    invoke-direct {v11}, Ljqe;-><init>()V

    sget-object v12, Ljqe;->e:[Lxtb;

    const/4 v13, 0x0

    aget-object v12, v12, v13

    const/high16 v14, -0x1000000

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    iget-object v15, v11, Ljqe;->a:Liqe;

    invoke-virtual {v15, v12, v14}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    iput-object v11, v0, Llqe;->m:Ljqe;

    new-instance v12, Lkqe;

    invoke-direct {v12, v0, v13}, Lkqe;-><init>(Ljava/lang/Object;B)V

    iput-object v12, v0, Llqe;->r:Lkqe;

    sget v12, Ld03;->e:I

    invoke-static {v9, v2, v11}, Lydp;->s(Landroid/graphics/drawable/Drawable;Landroid/view/View;Landroid/graphics/drawable/Drawable;)Ld03;

    move-result-object v9

    invoke-virtual {v2, v9}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v3, v10}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    new-instance v3, Llzb;

    const/16 v9, 0x13

    invoke-direct {v3, v0, v9}, Llzb;-><init>(Ljava/lang/Object;B)V

    invoke-static {v2, v3}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    invoke-virtual {v3, v2}, Llzb;->a(Landroid/view/View;)V

    new-instance v3, Lz61;

    const/16 v9, 0x10

    invoke-direct {v3, v0, v9}, Lz61;-><init>(Ljava/lang/Object;B)V

    invoke-static {v2, v3}, Lq9n;->g(Landroid/view/View;Landroid/view/View$OnAttachStateChangeListener;)V

    new-instance v2, Lgqe;

    invoke-direct {v2, v0, v13}, Lgqe;-><init>(Llqe;B)V

    move-object/from16 v3, p6

    invoke-static {v3, v1, v2}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance v2, Lgqe;

    const/4 v3, 0x1

    invoke-direct {v2, v0, v3}, Lgqe;-><init>(Llqe;B)V

    invoke-static {v5, v1, v2}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance v2, Lgqe;

    const/4 v3, 0x2

    invoke-direct {v2, v0, v3}, Lgqe;-><init>(Llqe;B)V

    invoke-static {v7, v1, v2}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance v2, Lgqe;

    const/4 v3, 0x3

    invoke-direct {v2, v0, v3}, Lgqe;-><init>(Llqe;B)V

    invoke-static {v8, v1, v2}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance v2, Lgqe;

    const/4 v3, 0x4

    invoke-direct {v2, v0, v3}, Lgqe;-><init>(Llqe;B)V

    invoke-static {v4, v1, v2}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance v2, Lgqe;

    const/4 v3, 0x5

    invoke-direct {v2, v0, v3}, Lgqe;-><init>(Llqe;B)V

    invoke-static {v6, v1, v2}, La26;->T(Lekc;Likc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final a(J)V
    .registers 22

    move-object/from16 v3, p0

    iget-object v0, v3, Llqe;->a:Lcom/opera/android/feed/FeedContainerView;

    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v1

    const-wide/16 v4, 0x0

    if-nez v1, :cond_13

    sget-object v1, Lpn7;->b:Lon7;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-wide v1, v4

    goto :goto_15

    :cond_13
    move-wide/from16 v1, p1

    :goto_15
    iget v6, v3, Llqe;->w:I

    if-lez v6, :cond_1f

    sget-object v1, Lpn7;->b:Lon7;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_20

    :cond_1f
    move-wide v4, v1

    :goto_20
    iget-object v1, v3, Llqe;->e:Lkze;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iget-object v2, v3, Llqe;->h:Lpde;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    iget-object v6, v3, Llqe;->i:Lpde;

    invoke-virtual {v6}, Lekc;->g()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Number;

    invoke-virtual {v6}, Ljava/lang/Number;->intValue()I

    move-result v6

    const/4 v7, 0x0

    if-eqz v1, :cond_4d

    const/16 v8, 0xff

    move v15, v8

    move v8, v2

    move v2, v6

    goto :goto_4f

    :cond_4d
    move v8, v2

    move v15, v7

    :goto_4f
    sget-object v9, Llqe;->y:Lixh;

    if-eqz v1, :cond_60

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v10

    invoke-virtual {v9, v10}, Ly7h;->k(Landroid/content/Context;)I

    move-result v9

    if-lt v6, v9, :cond_5e

    move v9, v6

    :cond_5e
    :goto_5e
    move v11, v9

    goto :goto_6a

    :cond_60
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v10

    invoke-virtual {v9, v10}, Ly7h;->k(Landroid/content/Context;)I

    move-result v9

    add-int/2addr v9, v8

    goto :goto_5e

    :goto_6a
    sget-object v9, Llqe;->z:Lixh;

    if-eqz v1, :cond_7b

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v9, v8}, Ly7h;->k(Landroid/content/Context;)I

    move-result v8

    if-ge v6, v8, :cond_79

    move v6, v8

    :cond_79
    :goto_79
    move v13, v6

    goto :goto_85

    :cond_7b
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v9, v6}, Ly7h;->k(Landroid/content/Context;)I

    move-result v6

    add-int/2addr v6, v8

    goto :goto_79

    :goto_85
    if-eqz v1, :cond_93

    iget v0, v3, Llqe;->u:I

    iget v1, v3, Llqe;->s:I

    :goto_8b
    move v9, v1

    move/from16 v18, v7

    move v7, v0

    move-wide v0, v4

    move/from16 v5, v18

    goto :goto_a3

    :cond_93
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0408dd

    invoke-static {v1, v0, v7}, Lf03;->w(ILandroid/content/Context;I)I

    move-result v7

    iget v0, v3, Llqe;->v:I

    iget v1, v3, Llqe;->t:I

    goto :goto_8b

    :goto_a3
    iget-object v4, v3, Llqe;->j:Landroid/animation/ValueAnimator;

    if-eqz v4, :cond_aa

    invoke-virtual {v4}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_aa
    const/4 v4, 0x2

    new-array v4, v4, [F

    fill-array-data v4, :array_f6

    invoke-static {v4}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v4

    invoke-static {v0, v1}, Lpn7;->f(J)J

    move-result-wide v0

    invoke-virtual {v4, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    new-instance v0, Lkc;

    const/16 v1, 0x15

    invoke-direct {v0, v3, v1}, Lkc;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v4, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    iget v14, v3, Llqe;->n:I

    iget-object v0, v3, Llqe;->k:Ljqe;

    invoke-virtual {v0}, Ljqe;->c()I

    move-result v1

    move-object v6, v4

    invoke-virtual {v0}, Ljqe;->b()I

    move-result v4

    invoke-virtual {v0}, Ljqe;->a()I

    move-result v0

    iget-object v8, v3, Llqe;->l:Ljqe;

    invoke-virtual {v8}, Ljqe;->a()I

    move-result v8

    iget v10, v3, Llqe;->o:I

    iget v12, v3, Llqe;->p:I

    move-object/from16 v16, v6

    move v6, v0

    new-instance v0, Lhqe;

    move-object/from16 v17, v16

    invoke-direct/range {v0 .. v15}, Lhqe;-><init>(IILlqe;IIIIIIIIIIII)V

    move-object/from16 v6, v17

    invoke-virtual {v6, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    invoke-virtual {v6}, Landroid/animation/ValueAnimator;->start()V

    iput-object v6, v3, Llqe;->j:Landroid/animation/ValueAnimator;

    return-void

    nop

    :array_f6
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final b()V
    .registers 5

    iget-object v0, p0, Llqe;->d:Ltsd;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lv8k;

    iget-object v1, p0, Llqe;->a:Lcom/opera/android/feed/FeedContainerView;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v0, v2}, Lv8k;->d(Landroid/content/Context;)I

    move-result v0

    iput v0, p0, Llqe;->v:I

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v2, 0x7f0402ed

    const v3, 0x7f06063b

    invoke-static {v2, v0, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    iput v0, p0, Llqe;->u:I

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0402a8

    invoke-static {v1, v0, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    iput v0, p0, Llqe;->s:I

    const/4 v1, 0x0

    invoke-static {v1, v0}, Lp37;->j0(FI)I

    move-result v0

    iput v0, p0, Llqe;->t:I

    iget-object v0, p0, Llqe;->q:Lc1f;

    if-eqz v0, :cond_3f

    invoke-virtual {v0}, Lc1f;->e()V

    :cond_3f
    sget-object v0, Lpn7;->b:Lon7;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v0, 0x0

    invoke-virtual {p0, v0, v1}, Llqe;->a(J)V

    return-void
.end method
