.class public final Ljkp;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/view/ViewGroup;

.field public final b:Lp7p;

.field public final c:S

.field public d:Lwjp;

.field public final e:Lttn;

.field public f:I

.field public g:I

.field public h:J

.field public i:J


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;Lp7p;J)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljkp;->a:Landroid/view/ViewGroup;

    iput-object p2, p0, Ljkp;->b:Lp7p;

    long-to-int p1, p3

    iput-short p1, p0, Ljkp;->c:S

    new-instance p1, Lttn;

    const/16 p2, 0x1b

    invoke-direct {p1, p0, p2}, Lttn;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Ljkp;->e:Lttn;

    const/4 p1, -0x1

    iput p1, p0, Ljkp;->f:I

    iput p1, p0, Ljkp;->g:I

    const-wide/16 p1, -0x1

    iput-wide p1, p0, Ljkp;->h:J

    iput-wide p1, p0, Ljkp;->i:J

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 6

    iget-object v0, p0, Ljkp;->d:Lwjp;

    if-eqz v0, :cond_22

    const/4 v1, 0x1

    iput-boolean v1, v0, Lwjp;->k:Z

    iget-wide v1, p0, Ljkp;->i:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-lez v1, :cond_18

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    iget-wide v3, p0, Ljkp;->i:J

    sub-long/2addr v1, v3

    iput-wide v1, v0, Lwjp;->l:J

    :cond_18
    iget-object v0, p0, Ljkp;->e:Lttn;

    sget-object v1, Lpfp;->a:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    invoke-virtual {p0}, Ljkp;->c()V

    :cond_22
    return-void
.end method

.method public final b(Landroid/view/View;Ljava/lang/String;Landroid/view/MotionEvent;)V
    .registers 23

    move-object/from16 v0, p0

    invoke-virtual/range {p3 .. p3}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v1

    if-eqz v1, :cond_96

    const/4 v2, 0x1

    iget-object v3, v0, Ljkp;->e:Lttn;

    if-eq v1, v2, :cond_1a

    const/4 v2, 0x3

    if-eq v1, v2, :cond_11

    return-void

    :cond_11
    sget-object v1, Lpfp;->a:Landroid/os/Handler;

    invoke-virtual {v1, v3}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const/4 v1, 0x0

    iput-object v1, v0, Ljkp;->d:Lwjp;

    return-void

    :cond_1a
    sget-object v1, Lfap;->a:Lzyk;

    iget-object v1, v0, Ljkp;->a:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lfap;->c(Landroid/content/Context;)Landroid/util/Size;

    move-result-object v4

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v5

    iput-wide v5, v0, Ljkp;->i:J

    new-instance v7, Lwjp;

    iget v8, v0, Ljkp;->f:I

    iget v9, v0, Ljkp;->g:I

    invoke-virtual/range {p3 .. p3}, Landroid/view/MotionEvent;->getRawX()F

    move-result v5

    float-to-int v10, v5

    invoke-virtual/range {p3 .. p3}, Landroid/view/MotionEvent;->getRawY()F

    move-result v5

    float-to-int v11, v5

    iget-wide v5, v0, Ljkp;->i:J

    iget-wide v12, v0, Ljkp;->h:J

    sub-long v12, v5, v12

    const/4 v5, 0x2

    new-array v6, v5, [I

    invoke-virtual {v1, v6}, Landroid/view/View;->getLocationOnScreen([I)V

    const/4 v14, 0x0

    aget v15, v6, v14

    aget v6, v6, v2

    move/from16 v16, v14

    new-instance v14, Lzap;

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v17

    move/from16 v18, v2

    add-int v2, v17, v15

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    add-int/2addr v1, v6

    invoke-direct {v14, v15, v6, v2, v1}, Lzap;-><init>(IIII)V

    new-array v1, v5, [I

    move-object/from16 v2, p1

    invoke-virtual {v2, v1}, Landroid/view/View;->getLocationOnScreen([I)V

    aget v5, v1, v16

    aget v1, v1, v18

    new-instance v15, Lzap;

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v6

    add-int/2addr v6, v5

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v2

    add-int/2addr v2, v1

    invoke-direct {v15, v5, v1, v6, v2}, Lzap;-><init>(IIII)V

    invoke-virtual {v4}, Landroid/util/Size;->getWidth()I

    move-result v16

    invoke-virtual {v4}, Landroid/util/Size;->getHeight()I

    move-result v17

    move-object/from16 v18, p2

    invoke-direct/range {v7 .. v18}, Lwjp;-><init>(IIIIJLzap;Lzap;IILjava/lang/String;)V

    iput-object v7, v0, Ljkp;->d:Lwjp;

    sget-object v1, Lpfp;->a:Landroid/os/Handler;

    invoke-virtual {v1, v3}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-short v0, v0, Ljkp;->c:S

    int-to-long v4, v0

    invoke-virtual {v1, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    :cond_96
    invoke-virtual/range {p3 .. p3}, Landroid/view/MotionEvent;->getRawX()F

    move-result v1

    float-to-int v1, v1

    iput v1, v0, Ljkp;->f:I

    invoke-virtual/range {p3 .. p3}, Landroid/view/MotionEvent;->getRawY()F

    move-result v1

    float-to-int v1, v1

    iput v1, v0, Ljkp;->g:I

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    iput-wide v1, v0, Ljkp;->h:J

    const-wide/16 v1, -0x1

    iput-wide v1, v0, Ljkp;->i:J

    return-void
.end method

.method public final c()V
    .registers 8

    iget-object v6, p0, Ljkp;->d:Lwjp;

    if-eqz v6, :cond_23

    const/4 v0, 0x0

    iput-object v0, p0, Ljkp;->d:Lwjp;

    iget-object p0, p0, Ljkp;->b:Lp7p;

    if-eqz p0, :cond_23

    iget-object p0, p0, Lp7p;->a:Lvoo;

    new-instance v0, Lizo;

    iget-object v1, p0, Lvoo;->c:Ljava/lang/String;

    iget-object v2, p0, Lvoo;->b:Lpro;

    move-object v3, v2

    iget-object v2, v3, Lpro;->a:Ljava/lang/String;

    move-object v4, v3

    iget-object v3, p0, Lvoo;->j:Ljava/lang/String;

    iget-object v4, v4, Lpro;->b:Lsm;

    iget-object v5, p0, Lvoo;->l:Lfuo;

    invoke-direct/range {v0 .. v6}, Lizo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lsm;Lfuo;Lwjp;)V

    invoke-static {v0}, Lp8p;->a(Lp8p;)V

    :cond_23
    return-void
.end method
