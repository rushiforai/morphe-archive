.class public abstract Lhi7;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final q:J

.field public static final r:J

.field public static final s:J

.field public static final t:J

.field public static final synthetic u:I


# instance fields
.field public final a:Lyh7;

.field public final b:Lzh7;

.field public final c:Landroidx/coordinatorlayout/widget/CoordinatorLayout;

.field public final d:Landroid/view/ViewGroup;

.field public final e:Ligi;

.field public final f:Lqim;

.field public final g:Lkze;

.field public final h:Landroid/graphics/Point;

.field public final i:Lni7;

.field public final j:F

.field public final k:Lj22;

.field public final l:Lks6;

.field public m:Landroid/graphics/Point;

.field public n:Landroid/graphics/Point;

.field public o:Z

.field public final p:Ldi7;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    sget-object v0, Lpn7;->b:Lon7;

    sget-object v0, Lun7;->d:Lun7;

    const/16 v1, 0xc8

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v2

    sput-wide v2, Lhi7;->q:J

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v2

    sput-wide v2, Lhi7;->r:J

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v1

    sput-wide v1, Lhi7;->s:J

    const/16 v1, 0x96

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Lhi7;->t:J

    return-void
.end method

.method public constructor <init>(Lyh7;Lzh7;Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/ViewGroup;Ligi;Lqim;Lkze;Landroid/graphics/Point;)V
    .registers 28

    move-object/from16 v2, p0

    move-object/from16 v8, p1

    move-object/from16 v9, p2

    move-object/from16 v10, p3

    move-object/from16 v0, p5

    move-object/from16 v11, p6

    move-object/from16 v12, p7

    move-object/from16 v1, p8

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v8, v2, Lhi7;->a:Lyh7;

    iput-object v9, v2, Lhi7;->b:Lzh7;

    iput-object v10, v2, Lhi7;->c:Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    move-object/from16 v3, p4

    iput-object v3, v2, Lhi7;->d:Landroid/view/ViewGroup;

    iput-object v0, v2, Lhi7;->e:Ligi;

    iput-object v11, v2, Lhi7;->f:Lqim;

    iput-object v12, v2, Lhi7;->g:Lkze;

    iput-object v1, v2, Lhi7;->h:Landroid/graphics/Point;

    new-instance v13, Lni7;

    iget-object v4, v0, Ligi;->e:Ljava/lang/Object;

    check-cast v4, Landroid/view/View;

    invoke-direct {v13, v4}, Lni7;-><init>(Landroid/view/View;)V

    iput-object v13, v2, Lhi7;->i:Lni7;

    iget-object v5, v0, Ligi;->f:Ljava/lang/Object;

    check-cast v5, Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getTranslationY()F

    move-result v5

    iput v5, v2, Lhi7;->j:F

    new-instance v14, Lj22;

    const/4 v15, 0x1

    invoke-direct {v14, v2, v15}, Lj22;-><init>(Ljava/lang/Object;B)V

    iput-object v14, v2, Lhi7;->k:Lj22;

    new-instance v5, Lks6;

    const/4 v6, 0x2

    invoke-direct {v5, v2, v6}, Lks6;-><init>(Ljava/lang/Object;B)V

    iput-object v5, v2, Lhi7;->l:Lks6;

    iput-object v1, v2, Lhi7;->n:Landroid/graphics/Point;

    new-instance v1, Ldi7;

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v1, v3}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object v1, v2, Lhi7;->p:Ldi7;

    iget-object v0, v0, Ligi;->c:Ljava/lang/Object;

    check-cast v0, Landroid/widget/FrameLayout;

    new-instance v3, Lz22;

    const/4 v7, 0x6

    invoke-direct {v3, v2, v7}, Lz22;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v3}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    const/high16 v0, 0x41800000    # 16.0f

    invoke-virtual {v4}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-static {v0, v3}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v0

    iput v0, v13, Lni7;->j:I

    new-instance v0, Lbi7;

    const/4 v3, 0x0

    invoke-direct {v0, v2, v3}, Lbi7;-><init>(Lhi7;B)V

    iput-object v0, v13, Lni7;->i:Lkotlin/jvm/functions/Function0;

    new-instance v0, Lbi7;

    invoke-direct {v0, v2, v15}, Lbi7;-><init>(Lhi7;B)V

    iput-object v0, v13, Lni7;->g:Lkotlin/jvm/functions/Function0;

    new-instance v0, Lbi7;

    invoke-direct {v0, v2, v6}, Lbi7;-><init>(Lhi7;B)V

    iput-object v0, v13, Lni7;->h:Lkotlin/jvm/functions/Function0;

    new-instance v0, Lq2;

    const/4 v6, 0x0

    const/16 v7, 0x19

    move-object v4, v1

    const/4 v1, 0x0

    move/from16 v16, v3

    const-class v3, Lhi7;

    move-object/from16 v17, v4

    const-string v4, "handlePositionChanged"

    move-object/from16 v18, v5

    const-string v5, "handlePositionChanged()V"

    move/from16 v9, v16

    move-object/from16 v8, v17

    move-object/from16 v15, v18

    invoke-direct/range {v0 .. v7}, Lq2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    iput-object v0, v13, Lni7;->b:Lkotlin/jvm/functions/Function0;

    new-instance v0, Lq2;

    const/16 v7, 0x1a

    const-string v4, "handleDraggingStarted"

    const-string v5, "handleDraggingStarted()V"

    invoke-direct/range {v0 .. v7}, Lq2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    iput-object v0, v13, Lni7;->c:Lkotlin/jvm/functions/Function0;

    new-instance v0, Lr2;

    const/16 v7, 0x1d

    const/4 v1, 0x1

    const-string v4, "handleDropZoneProgress"

    const-string v5, "handleDropZoneProgress(F)V"

    invoke-direct/range {v0 .. v7}, Lr2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    iput-object v0, v13, Lni7;->e:Lkotlin/jvm/functions/Function1;

    new-instance v0, Lci7;

    const/4 v7, 0x0

    const-string v4, "handleDrop"

    const-string v5, "handleDrop(Z)V"

    invoke-direct/range {v0 .. v7}, Lci7;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    iput-object v0, v13, Lni7;->d:Lkotlin/jvm/functions/Function1;

    new-instance v0, Lq2;

    const/16 v7, 0x1b

    const/4 v1, 0x0

    const-string v4, "handleFinishedMovementIdle"

    const-string v5, "handleFinishedMovementIdle()V"

    invoke-direct/range {v0 .. v7}, Lq2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    iput-object v0, v13, Lni7;->f:Lkotlin/jvm/functions/Function0;

    iget-object v0, v11, Lqim;->r:Lh7f;

    invoke-virtual {v0, v14}, Lh7f;->b(Ljava/lang/Object;)Z

    invoke-virtual {v12, v15}, Lekc;->k(Lf7f;)V

    new-instance v0, Lqv5;

    invoke-direct {v0, v9, v9}, Lqv5;-><init>(II)V

    new-instance v1, Lgi7;

    invoke-direct {v1, v2}, Lgi7;-><init>(Lhi7;)V

    invoke-virtual {v0, v1}, Lqv5;->b(Lnv5;)V

    invoke-virtual {v10, v8, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    move-object/from16 v8, p1

    move-object/from16 v9, p2

    const/4 v0, 0x1

    invoke-virtual {v9, v8, v0}, Lzh7;->a(Lyh7;Z)V

    return-void
.end method


# virtual methods
.method public final a(Lei7;)V
    .registers 4

    iget-boolean v0, p0, Lhi7;->o:Z

    if-nez v0, :cond_13

    const/4 v0, 0x1

    iput-boolean v0, p0, Lhi7;->o:Z

    iget-object v0, p0, Lhi7;->e:Ligi;

    iget-object v0, v0, Ligi;->b:Ljava/lang/Object;

    check-cast v0, Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_14

    :cond_13
    return-void

    :cond_14
    iget-object v0, p0, Lhi7;->c:Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    iget-object v1, p0, Lhi7;->p:Ldi7;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    iget-object v0, p0, Lhi7;->k:Lj22;

    iget-object v1, p0, Lhi7;->f:Lqim;

    iget-object v1, v1, Lqim;->r:Lh7f;

    invoke-virtual {v1, v0}, Lh7f;->c(Ljava/lang/Object;)Z

    iget-object v0, p0, Lhi7;->g:Lkze;

    iget-object v1, p0, Lhi7;->l:Lks6;

    invoke-virtual {v0, v1}, Lekc;->p(Lf7f;)V

    invoke-virtual {p0, p1}, Lhi7;->c(Lei7;)V

    iget-object p1, p0, Lhi7;->a:Lyh7;

    const/4 v0, 0x0

    iget-object p0, p0, Lhi7;->b:Lzh7;

    invoke-virtual {p0, p1, v0}, Lzh7;->a(Lyh7;Z)V

    return-void
.end method

.method public final b()V
    .registers 4

    iget-object v0, p0, Lhi7;->e:Ligi;

    iget-object v0, v0, Ligi;->e:Ljava/lang/Object;

    check-cast v0, Landroid/view/View;

    iget-object v1, p0, Lhi7;->i:Lni7;

    iget-boolean v1, v1, Lni7;->k:Z

    if-eqz v1, :cond_d

    return-void

    :cond_d
    iget-object v1, p0, Lhi7;->m:Landroid/graphics/Point;

    if-nez v1, :cond_1e

    new-instance v1, Landroid/graphics/Point;

    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v2

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v0

    invoke-direct {v1, v2, v0}, Landroid/graphics/Point;-><init>(II)V

    :cond_1e
    iput-object v1, p0, Lhi7;->n:Landroid/graphics/Point;

    invoke-virtual {p0, v1}, Lhi7;->g(Landroid/graphics/Point;)V

    return-void
.end method

.method public abstract c(Lei7;)V
.end method

.method public d()V
    .registers 1

    return-void
.end method

.method public e()V
    .registers 2

    sget-object v0, Lei7;->b:Lei7;

    invoke-virtual {p0, v0}, Lhi7;->a(Lei7;)V

    return-void
.end method

.method public f()V
    .registers 1

    return-void
.end method

.method public g(Landroid/graphics/Point;)V
    .registers 2

    sput-object p1, Lgg2;->G:Landroid/graphics/Point;

    return-void
.end method
