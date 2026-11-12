.class public final Lmo8;
.super Lk43;
.source "SourceFile"


# instance fields
.field public final k:Landroid/app/Activity;

.field public final l:Li3j;

.field public final m:Lap;

.field public final n:Lbp;

.field public final o:Lyo;

.field public final synthetic p:Loo8;


# direct methods
.method public constructor <init>(Loo8;Landroid/app/Activity;Loo8;Lzy;Ldl;Li3j;Lap;)V
    .registers 8

    iput-object p1, p0, Lmo8;->p:Loo8;

    invoke-direct {p0, p3, p4, p5}, Lk43;-><init>(Lbqi;Lzy;Ldl;)V

    iput-object p2, p0, Lmo8;->k:Landroid/app/Activity;

    iput-object p6, p0, Lmo8;->l:Li3j;

    iput-object p7, p0, Lmo8;->m:Lap;

    new-instance p1, Lbp;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmo8;->n:Lbp;

    iget-object p1, p3, Lbqi;->e:Lyo;

    iput-object p1, p0, Lmo8;->o:Lyo;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 15

    new-instance v7, Lqo8;

    iget-object v0, p0, Lmo8;->k:Landroid/app/Activity;

    invoke-direct {v7, v0}, Lqo8;-><init>(Landroid/app/Activity;)V

    iget-object v0, p0, Lmo8;->p:Loo8;

    iget-object v0, v0, Lbqi;->f:Lrm;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    const/16 v3, 0x140

    const/16 v4, 0x32

    if-eq v1, v2, :cond_3f

    const/4 v2, 0x2

    const/16 v5, 0xfa

    if-eq v1, v2, :cond_3b

    const/4 v2, 0x3

    if-eq v1, v2, :cond_33

    const/4 v2, 0x4

    if-eq v1, v2, :cond_2c

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v9, 0x0

    const-string v10, "internal error"

    const/4 v11, 0x1

    move-object v8, p0

    invoke-virtual/range {v8 .. v13}, Lk43;->b(ZLjava/lang/String;ZLv50;Ljava/lang/Long;)V

    goto :goto_40

    :cond_2c
    move-object v8, p0

    invoke-virtual {v8}, Lmo8;->g()I

    move-result v3

    :goto_31
    move v4, v5

    goto :goto_40

    :cond_33
    move-object v8, p0

    invoke-virtual {v8}, Lmo8;->g()I

    move-result v3

    const/16 v4, 0x78

    goto :goto_40

    :cond_3b
    move-object v8, p0

    const/16 v3, 0x12c

    goto :goto_31

    :cond_3f
    move-object v8, p0

    :goto_40
    iput-object v0, v7, Lqo8;->c:Lrm;

    invoke-virtual {v7}, Landroid/view/View;->invalidate()V

    iput v3, v7, Lqo8;->a:I

    iput-short v4, v7, Lqo8;->b:S

    invoke-virtual {v7}, Landroid/view/View;->requestLayout()V

    invoke-virtual {v7}, Landroid/view/View;->invalidate()V

    new-instance v0, Lvo8;

    iget-object v1, v8, Lmo8;->o:Lyo;

    iget-object v2, v8, Lk43;->c:Ljava/lang/String;

    iget-object v3, v8, Lk43;->d:Ldl;

    iget-object v4, v8, Lmo8;->n:Lbp;

    iget-object v5, v8, Lmo8;->l:Li3j;

    iget-object v6, v8, Lmo8;->m:Lap;

    invoke-direct/range {v0 .. v7}, Lvo8;-><init>(Lyo;Ljava/lang/String;Ldl;Lbp;Li3j;Lap;Lqo8;)V

    invoke-virtual {v8, v0}, Lk43;->d(Laqi;)V

    return-void
.end method

.method public final g()I
    .registers 5

    iget-object p0, p0, Lmo8;->k:Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v1, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1e

    if-lt v2, v3, :cond_22

    invoke-virtual {p0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object p0

    invoke-interface {p0}, Landroid/view/WindowManager;->getCurrentWindowMetrics()Landroid/view/WindowMetrics;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/WindowMetrics;->getBounds()Landroid/graphics/Rect;

    move-result-object p0

    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    move-result v1

    :cond_22
    add-int/lit8 v1, v1, -0x40

    int-to-float p0, v1

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr p0, v0

    float-to-int p0, p0

    return p0
.end method
