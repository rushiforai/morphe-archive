.class public abstract Lyzi;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"

# interfaces
.implements Lvzi;
.implements Lqzi;


# instance fields
.field public final b:Ltzi;

.field public final c:Lvzk;

.field public final d:Landroid/widget/ImageView;

.field public e:Z


# direct methods
.method public constructor <init>(Landroid/view/View;Ltzi;)V
    .registers 5

    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p2, p0, Lyzi;->b:Ltzi;

    const p2, 0x7f0a05b8

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ImageView;

    iput-object p2, p0, Lyzi;->d:Landroid/widget/ImageView;

    new-instance v0, Lkkf;

    const/16 v1, 0x11

    invoke-direct {v0, p0, v1}, Lkkf;-><init>(Ljava/lang/Object;B)V

    sget-object v1, Lq9n;->c:Ll5b;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lhjf;->v(Landroid/content/Context;)Ldll;

    move-result-object v1

    if-eqz v1, :cond_26

    invoke-static {v1, p1, v0}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_26
    if-nez p2, :cond_2c

    const/4 p1, 0x0

    iput-object p1, p0, Lyzi;->c:Lvzk;

    return-void

    :cond_2c
    new-instance p1, Lh4i;

    const/4 v0, 0x5

    invoke-direct {p1, p0, v0}, Lh4i;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lt0h;->i(Landroid/view/View$OnClickListener;)Lks8;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p1, Lvzk;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lyzi;->X(Landroid/content/Context;)Ld06;

    move-result-object v0

    invoke-direct {p1, p2, v0}, Lvzk;-><init>(Landroid/widget/ImageView;Ld06;)V

    iput-object p1, p0, Lyzi;->c:Lvzk;

    return-void
.end method

.method public static X(Landroid/content/Context;)Ld06;
    .registers 6

    new-instance v0, Ld06;

    const v1, 0x7f0402be

    const v2, 0x7f06063b

    invoke-static {v1, p0, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v1

    const v3, 0x7f080512

    invoke-static {v3, p0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    new-instance v1, Lg8i;

    invoke-direct {v1, p0}, Lg8i;-><init>(Landroid/content/Context;)V

    const v4, 0x7f0402e2

    invoke-static {v4, p0, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v2

    iput v2, v1, Lg8i;->c:I

    iput-object v3, v1, Lg8i;->d:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Lg8i;->a()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-static {p0, v1}, Lsfe;->P0(Landroid/content/Context;Landroid/graphics/drawable/Drawable;)Lsf9;

    move-result-object p0

    invoke-direct {v0, p0}, Ld06;-><init>(Ljava/lang/Object;)V

    return-object v0
.end method


# virtual methods
.method public G(JZ)V
    .registers 6

    invoke-virtual {p0}, Landroidx/recyclerview/widget/i;->getItemId()J

    move-result-wide v0

    cmp-long p1, v0, p1

    if-nez p1, :cond_c

    const/4 p1, 0x1

    invoke-virtual {p0, p3, p1}, Lyzi;->i0(ZZ)V

    :cond_c
    return-void
.end method

.method public U()V
    .registers 3

    iget-boolean v0, p0, Lyzi;->e:Z

    if-nez v0, :cond_14

    iget-object v0, p0, Lyzi;->b:Ltzi;

    iget-object v1, v0, Ltzi;->a:Le5d;

    iget-object v1, v1, Le5d;->b:Ljava/lang/Object;

    check-cast v1, Lh7f;

    invoke-virtual {v1, p0}, Lh7f;->b(Ljava/lang/Object;)Z

    iget-object v0, v0, Ltzi;->c:Lh7f;

    invoke-virtual {v0, p0}, Lh7f;->b(Ljava/lang/Object;)Z

    :cond_14
    const/4 v0, 0x1

    iput-boolean v0, p0, Lyzi;->e:Z

    invoke-virtual {p0}, Lyzi;->Z()Z

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lyzi;->i0(ZZ)V

    iget-object v0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    instance-of v1, v0, Lcom/opera/android/widget/SelectableRelativeLayout;

    if-eqz v1, :cond_2e

    check-cast v0, Lcom/opera/android/widget/SelectableRelativeLayout;

    invoke-virtual {p0}, Lyzi;->V()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/opera/android/widget/SelectableRelativeLayout;->d(Z)V

    :cond_2e
    invoke-virtual {p0}, Lyzi;->f0()V

    return-void
.end method

.method public V()Z
    .registers 1

    invoke-virtual {p0}, Lyzi;->Y()Z

    move-result p0

    return p0
.end method

.method public W(Z)V
    .registers 2

    invoke-virtual {p0}, Lyzi;->f0()V

    return-void
.end method

.method public Y()Z
    .registers 1

    instance-of p0, p0, Lry0;

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public Z()Z
    .registers 4

    iget-object v0, p0, Lyzi;->b:Ltzi;

    iget-object v0, v0, Ltzi;->a:Le5d;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/i;->getItemId()J

    move-result-wide v1

    iget-object p0, v0, Le5d;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/LinkedHashSet;

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/util/AbstractCollection;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public a0()V
    .registers 3

    iget-object v0, p0, Lyzi;->d:Landroid/widget/ImageView;

    if-eqz v0, :cond_1d

    iget-object v1, p0, Lyzi;->c:Lvzk;

    if-eqz v1, :cond_1d

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lyzi;->X(Landroid/content/Context;)Ld06;

    move-result-object v0

    invoke-virtual {p0}, Lyzi;->Z()Z

    move-result p0

    iput-object v0, v1, Lvzk;->b:Ljava/lang/Object;

    if-eqz p0, :cond_1d

    const/4 p0, 0x1

    const/4 v0, 0x0

    invoke-virtual {v1, p0, v0}, Lvzk;->x(ZZ)V

    :cond_1d
    return-void
.end method

.method public final b0(Landroid/graphics/drawable/Drawable;)V
    .registers 4

    new-instance v0, Ld06;

    iget-object v1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, p1}, Lsfe;->P0(Landroid/content/Context;Landroid/graphics/drawable/Drawable;)Lsf9;

    move-result-object p1

    invoke-direct {v0, p1}, Ld06;-><init>(Ljava/lang/Object;)V

    iget-object p1, p0, Lyzi;->c:Lvzk;

    if-eqz p1, :cond_1f

    invoke-virtual {p0}, Lyzi;->Z()Z

    move-result p0

    iput-object v0, p1, Lvzk;->c:Ljava/lang/Object;

    if-nez p0, :cond_1f

    const/4 p0, 0x0

    invoke-virtual {p1, p0, p0}, Lvzk;->x(ZZ)V

    :cond_1f
    return-void
.end method

.method public c0()Z
    .registers 1

    iget-object p0, p0, Lyzi;->b:Ltzi;

    iget-boolean p0, p0, Ltzi;->g:Z

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public e0()V
    .registers 3

    const/4 v0, 0x0

    iput-boolean v0, p0, Lyzi;->e:Z

    iget-object v0, p0, Lyzi;->b:Ltzi;

    iget-object v1, v0, Ltzi;->c:Lh7f;

    invoke-virtual {v1, p0}, Lh7f;->c(Ljava/lang/Object;)Z

    iget-object v0, v0, Ltzi;->a:Le5d;

    iget-object v0, v0, Le5d;->b:Ljava/lang/Object;

    check-cast v0, Lh7f;

    invoke-virtual {v0, p0}, Lh7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final f0()V
    .registers 2

    invoke-virtual {p0}, Lyzi;->c0()Z

    move-result v0

    invoke-virtual {p0, v0}, Lyzi;->g0(Z)V

    return-void
.end method

.method public g0(Z)V
    .registers 2

    return-void
.end method

.method public abstract h0()V
.end method

.method public i0(ZZ)V
    .registers 4

    iget-object v0, p0, Lyzi;->c:Lvzk;

    if-eqz v0, :cond_a

    invoke-virtual {v0}, Lvzk;->r()V

    invoke-virtual {v0, p1, p2}, Lvzk;->x(ZZ)V

    :cond_a
    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0, p1}, Landroid/view/View;->setSelected(Z)V

    return-void
.end method
