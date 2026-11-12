.class public final Livk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# instance fields
.field public final a:Lhvk;

.field public final b:Ljava/lang/String;

.field public final c:Landroid/graphics/Rect;

.field public final d:Landroidx/recyclerview/widget/RecyclerView;

.field public final e:Landroid/graphics/drawable/Drawable;

.field public f:I

.field public g:I

.field public h:Ljava/lang/String;

.field public i:I

.field public j:Z

.field public final synthetic k:Lnvk;


# direct methods
.method public constructor <init>(Lnvk;Landroidx/recyclerview/widget/RecyclerView;Lhvk;)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Livk;->k:Lnvk;

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Livk;->c:Landroid/graphics/Rect;

    new-instance p1, Lwk7;

    const/4 v0, 0x3

    invoke-direct {p1, p0, v0}, Lwk7;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iput-object p2, p0, Livk;->d:Landroidx/recyclerview/widget/RecyclerView;

    iput-object p3, p0, Livk;->a:Lhvk;

    iget p2, p3, Lhvk;->b:I

    invoke-virtual {v1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Livk;->b:Ljava/lang/String;

    instance-of p2, p3, Lkvk;

    if-eqz p2, :cond_30

    const p1, 0x7f0805cb

    invoke-static {p1, v1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Livk;->e:Landroid/graphics/drawable/Drawable;

    goto :goto_6e

    :cond_30
    instance-of p2, p3, Lmvk;

    if-eqz p2, :cond_72

    check-cast p3, Lmvk;

    new-instance p2, Llvk;

    invoke-direct {p2, v1}, Llvk;-><init>(Landroid/content/Context;)V

    invoke-virtual {p2, p1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    iget p1, p3, Lmvk;->d:I

    invoke-static {p1, v1}, Lu2d;->j(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, p1, v2}, Lu2d;->e(Landroid/content/Context;ILjava/lang/String;)Ln3d;

    move-result-object p1

    new-instance v2, Lhg2;

    const/4 v3, 0x2

    invoke-direct {v2, p2, v3}, Lhg2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v2}, Ln3d;->b(Lj3d;)V

    iget-object p1, p3, Lmvk;->e:[Li3d;

    array-length p3, p1

    const/4 v2, 0x0

    :goto_55
    if-ge v2, p3, :cond_6c

    aget-object v3, p1, v2

    iget-object v4, v3, Li3d;->a:Ldvb;

    iget v5, v3, Li3d;->c:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    new-instance v6, Lroj;

    invoke-direct {v6, v1, v3, v0}, Lroj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p2, v4, v5, v6}, Lf3d;->a(Ldvb;Ljava/lang/Integer;Lykj;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_55

    :cond_6c
    iput-object p2, p0, Livk;->e:Landroid/graphics/drawable/Drawable;

    :goto_6e
    invoke-virtual {p0, v1}, Livk;->b(Landroid/content/Context;)V

    return-void

    :cond_72
    const-string p0, "Action does not define an icon"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 2

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0, p1}, Livk;->b(Landroid/content/Context;)V

    return-void
.end method

.method public final b(Landroid/content/Context;)V
    .registers 5

    iget-object v0, p0, Livk;->a:Lhvk;

    iget v1, v0, Lhvk;->a:I

    const v2, 0x7f060ade

    invoke-static {v1, p1, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v1

    iput v1, p0, Livk;->f:I

    iget v0, v0, Lhvk;->c:I

    const v1, 0x7f06063b

    invoke-static {v0, p1, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    iput p1, p0, Livk;->g:I

    iget-object p1, p0, Livk;->e:Landroid/graphics/drawable/Drawable;

    instance-of v0, p1, Lf3d;

    if-eqz v0, :cond_22

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void

    :cond_22
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    new-instance v0, Landroid/graphics/PorterDuffColorFilter;

    iget p0, p0, Livk;->g:I

    sget-object v1, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v0, p0, v1}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    return-void
.end method
