.class public abstract Lf0e;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"


# static fields
.field public static final synthetic h:I


# instance fields
.field public final b:Lsf2;

.field public final c:Lpde;

.field public final d:Lyhe;

.field public final e:Lpde;

.field public final f:Ltsd;

.field public final g:Lxh7;


# direct methods
.method public constructor <init>(Lsf2;Lpde;Lpde;Lyhe;Lpde;)V
    .registers 7

    iget-object v0, p1, Lsf2;->b:Landroid/widget/ImageView;

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lf0e;->b:Lsf2;

    iput-object p3, p0, Lf0e;->c:Lpde;

    iput-object p4, p0, Lf0e;->d:Lyhe;

    iput-object p5, p0, Lf0e;->e:Lpde;

    new-instance p1, Lz61;

    invoke-direct {p1, v0}, Lz61;-><init>(Landroid/view/View;)V

    iget-object p1, p1, Lz61;->b:Ljava/lang/Object;

    check-cast p1, Lkze;

    invoke-static {p2, p1}, La26;->w(Likc;Lkze;)Ltsd;

    move-result-object p1

    iput-object p1, p0, Lf0e;->f:Ltsd;

    iget-object p2, p4, Lyhe;->b:Ljava/lang/Object;

    check-cast p2, Lz5l;

    iget-object p2, p2, Lz5l;->q:Lilb;

    iget-object p2, p2, Lilb;->i:Lxh7;

    iput-object p2, p0, Lf0e;->g:Lxh7;

    new-instance p4, Ld8d;

    const/16 p5, 0x8

    invoke-direct {p4, p0, p5}, Ld8d;-><init>(Ljava/lang/Object;B)V

    invoke-static {p3, p1, p4}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance p3, Lokb;

    const/4 p4, 0x1

    invoke-direct {p3, p0, p4}, Lokb;-><init>(Ljava/lang/Object;B)V

    invoke-static {p2, p1, p3}, La26;->V(Lw6f;Likc;Ljava/lang/Object;)V

    new-instance p1, Ls6h;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p0, p1, Ls6h;->b:Ljava/lang/Object;

    new-instance p2, Lhpd;

    const/16 p3, 0x9

    invoke-direct {p2, p0, p1, p3}, Lhpd;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object p2, p1, Ls6h;->a:Ljava/lang/Object;

    iget-object p2, p0, Lf0e;->b:Lsf2;

    iget-object p2, p2, Lsf2;->b:Landroid/widget/ImageView;

    new-instance p4, Lz22;

    const/16 p5, 0xa

    invoke-direct {p4, p0, p5}, Lz22;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p4}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    iget-object p2, p0, Lf0e;->e:Lpde;

    iget-object p0, p0, Lf0e;->f:Ltsd;

    new-instance p4, Ld8d;

    invoke-direct {p4, p1, p3}, Ld8d;-><init>(Ljava/lang/Object;B)V

    invoke-static {p2, p0, p4}, La26;->T(Lekc;Likc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final U()V
    .registers 10

    iget-object v0, p0, Lf0e;->c:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Leyj;

    invoke-virtual {p0}, Lf0e;->V()Landroid/view/View;

    move-result-object v2

    iget-object v3, p0, Lf0e;->g:Lxh7;

    const/4 v4, 0x0

    if-nez v2, :cond_14

    move v2, v4

    move v5, v2

    goto :goto_2a

    :cond_14
    invoke-virtual {v3, v2}, Lxh7;->a(Landroid/view/View;)F

    move-result v5

    iget-object v6, v3, Lxh7;->e:Ljava/lang/Object;

    check-cast v6, Ljava/util/LinkedHashMap;

    invoke-virtual {v6, v2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    if-eqz v2, :cond_29

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    goto :goto_2a

    :cond_29
    move v2, v4

    :goto_2a
    iget-object p0, p0, Lf0e;->b:Lsf2;

    iget-object v6, p0, Lsf2;->b:Landroid/widget/ImageView;

    iget-object p0, p0, Lsf2;->b:Landroid/widget/ImageView;

    invoke-virtual {v6}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v6

    check-cast v6, Landroid/view/View;

    if-nez v6, :cond_39

    return-void

    :cond_39
    invoke-virtual {p0}, Landroid/view/View;->getTranslationX()F

    move-result v7

    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    move-result v8

    int-to-float v8, v8

    add-float/2addr v7, v8

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v8

    div-int/lit8 v8, v8, 0x2

    int-to-float v8, v8

    add-float/2addr v7, v8

    invoke-virtual {v6}, Landroid/view/View;->getWidth()I

    move-result v6

    int-to-float v6, v6

    const/high16 v8, 0x40000000    # 2.0f

    div-float/2addr v6, v8

    sub-float/2addr v6, v7

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Leyj;

    iget-object v0, v0, Leyj;->l:Ltxj;

    if-eqz v0, :cond_70

    iget-object v0, v0, Ltxj;->e:Landroid/util/Size;

    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr v0, v8

    neg-float v4, v6

    mul-float/2addr v4, v6

    mul-float/2addr v0, v0

    div-float/2addr v4, v0

    float-to-double v6, v4

    invoke-static {v6, v7}, Ljava/lang/Math;->exp(D)D

    move-result-wide v6

    double-to-float v4, v6

    :cond_70
    invoke-virtual {v3}, Lxh7;->b()F

    move-result v0

    invoke-static {v5, v4, v0, v4}, Lv0g;->g(FFFF)F

    move-result v0

    const v3, 0x3eb33333    # 0.35f

    mul-float/2addr v3, v0

    const/high16 v4, 0x3f800000    # 1.0f

    add-float/2addr v3, v4

    invoke-virtual {p0, v3}, Landroid/view/View;->setScaleX(F)V

    invoke-virtual {p0, v3}, Landroid/view/View;->setScaleY(F)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationZ(F)V

    iget v0, v1, Leyj;->A:F

    invoke-static {v0, v4, v5, v4}, Lv0g;->g(FFFF)F

    move-result v0

    iget v1, v1, Leyj;->x:F

    sub-float/2addr v1, v4

    mul-float/2addr v1, v2

    add-float/2addr v1, v4

    invoke-static {v1, v0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    return-void
.end method

.method public abstract V()Landroid/view/View;
.end method
