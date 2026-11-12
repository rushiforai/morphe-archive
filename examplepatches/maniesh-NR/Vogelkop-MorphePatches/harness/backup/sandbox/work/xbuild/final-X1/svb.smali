.class public final Lsvb;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:F

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;

.field public f:Ljava/lang/Object;

.field public final g:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lpde;)V
    .registers 4

    .line 110
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x2

    .line 111
    new-array v0, v0, [I

    iput-object v0, p0, Lsvb;->g:Ljava/lang/Object;

    .line 112
    iput-object p1, p0, Lsvb;->b:Ljava/lang/Object;

    .line 113
    iput-object p2, p0, Lsvb;->c:Ljava/lang/Object;

    const v0, 0x7f0a006f

    .line 114
    invoke-virtual {p1, v0}, Lfp1;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lsvb;->d:Ljava/lang/Object;

    .line 115
    new-instance p1, Lks6;

    const/16 v0, 0x14

    invoke-direct {p1, p0, v0}, Lks6;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p1}, Lekc;->k(Lf7f;)V

    return-void
.end method

.method public constructor <init>(Lxbf;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object v0, p1, Lxbf;->c:Ljava/lang/Object;

    check-cast v0, Lode;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgig;

    iget-object v1, p1, Lxbf;->b:Ljava/lang/Object;

    check-cast v1, Ltjg;

    invoke-interface {v0}, Lgig;->g()Lqjd;

    move-result-object v2

    iput-object v2, p0, Lsvb;->b:Ljava/lang/Object;

    const/4 v3, 0x0

    if-eqz v2, :cond_29

    iget-object v1, v1, Ltjg;->k:Lokg;

    iget-object v1, v1, Lokg;->e:Ljava/util/HashMap;

    iget-object v4, v2, Lqjd;->a:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Legd;

    iget-object v2, v2, Lqjd;->e:Lvjd;

    goto :goto_2b

    :cond_29
    move-object v1, v3

    move-object v2, v1

    :goto_2b
    if-eqz v1, :cond_30

    iget-object v4, v1, Legd;->a:Lre7;

    goto :goto_31

    :cond_30
    move-object v4, v3

    :goto_31
    iput-object v4, p0, Lsvb;->c:Ljava/lang/Object;

    invoke-interface {v0}, Lgig;->getPlaybackParameters()Lthg;

    move-result-object v0

    iget v0, v0, Lthg;->a:F

    iput v0, p0, Lsvb;->a:F

    if-eqz v1, :cond_42

    invoke-virtual {v1}, Legd;->c()Landroid/net/Uri;

    move-result-object v0

    goto :goto_43

    :cond_42
    move-object v0, v3

    :goto_43
    iput-object v0, p0, Lsvb;->d:Ljava/lang/Object;

    if-eqz v1, :cond_4a

    iget-object v0, v1, Legd;->c:Ljava/lang/String;

    goto :goto_4b

    :cond_4a
    move-object v0, v3

    :goto_4b
    iput-object v0, p0, Lsvb;->f:Ljava/lang/Object;

    if-eqz v2, :cond_5d

    iget-object v0, v2, Lvjd;->a:Ljava/lang/CharSequence;

    sget-object v1, Laik;->a:[Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_5d

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    :cond_5d
    iput-object v3, p0, Lsvb;->e:Ljava/lang/Object;

    iget-object p1, p1, Lxbf;->e:Ljava/lang/Object;

    check-cast p1, Ljjg;

    iget-object p1, p1, Ljjg;->b:Ljava/lang/Object;

    check-cast p1, Ltjg;

    iget-object p1, p1, Ltjg;->n:Ljx6;

    iget-object p1, p1, Ljx6;->c:Lpr;

    iput-object p1, p0, Lsvb;->g:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 10

    iget-object v0, p0, Lsvb;->g:Ljava/lang/Object;

    check-cast v0, [I

    iget-object v1, p0, Lsvb;->b:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/BrowserActivity;

    iget-object v2, p0, Lsvb;->d:Ljava/lang/Object;

    check-cast v2, Landroid/view/View;

    iget-object v3, p0, Lsvb;->e:Ljava/lang/Object;

    check-cast v3, Ld21;

    if-eqz v3, :cond_a8

    iget-object v3, p0, Lsvb;->c:Ljava/lang/Object;

    check-cast v3, Lpde;

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/high16 v4, 0x42800000    # 64.0f

    invoke-virtual {v1}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-static {v4, v5}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v4

    const/4 v5, 0x1

    if-le v3, v4, :cond_2f

    move v4, v5

    goto :goto_30

    :cond_2f
    const/4 v4, 0x0

    :goto_30
    invoke-virtual {v2, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    new-instance v6, Landroid/view/WindowManager$LayoutParams;

    const/16 v7, 0x7f6

    const/16 v8, 0x318

    invoke-direct {v6, v7, v8}, Landroid/view/WindowManager$LayoutParams;-><init>(II)V

    const/16 v7, 0x33

    iput v7, v6, Landroid/view/WindowManager$LayoutParams;->gravity:I

    iget v7, p0, Lsvb;->a:F

    iput v7, v6, Landroid/view/WindowManager$LayoutParams;->alpha:F

    aget v0, v0, v5

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v5

    add-int/2addr v5, v0

    sub-int/2addr v5, v3

    iput v5, v6, Landroid/view/WindowManager$LayoutParams;->y:I

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v0

    iput v0, v6, Landroid/view/WindowManager$LayoutParams;->width:I

    iput v3, v6, Landroid/view/WindowManager$LayoutParams;->height:I

    if-eqz v4, :cond_82

    iget-object v0, p0, Lsvb;->f:Ljava/lang/Object;

    check-cast v0, Landroid/view/WindowManager;

    if-eqz v0, :cond_82

    iget-object v0, p0, Lsvb;->e:Ljava/lang/Object;

    check-cast v0, Ld21;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager$LayoutParams;

    iget v2, v6, Landroid/view/WindowManager$LayoutParams;->alpha:F

    iget v3, v0, Landroid/view/WindowManager$LayoutParams;->alpha:F

    cmpl-float v2, v2, v3

    if-nez v2, :cond_82

    iget v2, v6, Landroid/view/WindowManager$LayoutParams;->y:I

    iget v3, v0, Landroid/view/WindowManager$LayoutParams;->y:I

    if-ne v2, v3, :cond_82

    iget v2, v6, Landroid/view/WindowManager$LayoutParams;->width:I

    iget v3, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    if-ne v2, v3, :cond_82

    iget v2, v6, Landroid/view/WindowManager$LayoutParams;->height:I

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    if-eq v2, v0, :cond_a8

    :cond_82
    iget-object v0, p0, Lsvb;->f:Ljava/lang/Object;

    check-cast v0, Landroid/view/WindowManager;

    const/4 v2, 0x0

    if-eqz v0, :cond_92

    iget-object v3, p0, Lsvb;->e:Ljava/lang/Object;

    check-cast v3, Ld21;

    invoke-interface {v0, v3}, Landroid/view/ViewManager;->removeView(Landroid/view/View;)V

    iput-object v2, p0, Lsvb;->f:Ljava/lang/Object;

    :cond_92
    if-eqz v4, :cond_a8

    :try_start_94
    const-string v0, "window"

    invoke-virtual {v1, v0}, Lt5d;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    iput-object v0, p0, Lsvb;->f:Ljava/lang/Object;

    iget-object v1, p0, Lsvb;->e:Ljava/lang/Object;

    check-cast v1, Ld21;

    invoke-interface {v0, v1, v6}, Landroid/view/ViewManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    :try_end_a5
    .catch Ljava/lang/Exception; {:try_start_94 .. :try_end_a5} :catch_a6

    return-void

    :catch_a6
    iput-object v2, p0, Lsvb;->f:Ljava/lang/Object;

    :cond_a8
    return-void
.end method
