.class public abstract Lskb;
.super Lblb;
.source "SourceFile"


# static fields
.field public static final i:Lixh;

.field public static final j:J


# instance fields
.field public final e:Lvo3;

.field public f:Landroidx/recyclerview/widget/i;

.field public g:Lflb;

.field public h:Landroidx/recyclerview/widget/RecyclerView;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lixh;

    const/high16 v1, 0x40400000    # 3.0f

    invoke-direct {v0, v1}, Lixh;-><init>(F)V

    sput-object v0, Lskb;->i:Lixh;

    sget-object v0, Lpn7;->b:Lon7;

    const/16 v0, 0x96

    sget-object v1, Lun7;->d:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Lskb;->j:J

    return-void
.end method

.method public constructor <init>(Lvo3;)V
    .registers 2

    invoke-direct {p0}, Lblb;-><init>()V

    iput-object p1, p0, Lskb;->e:Lvo3;

    return-void
.end method


# virtual methods
.method public final d(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;)V
    .registers 3

    iget-object p0, p2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    iget-object p0, p2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationX(F)V

    iget-object p0, p2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    iget-object p0, p2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationZ(F)V

    return-void
.end method

.method public final h(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;)I
    .registers 3

    const p0, 0xf000f

    return p0
.end method

.method public final l()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final m()Z
    .registers 1

    iget-object p0, p0, Lskb;->h:Landroidx/recyclerview/widget/RecyclerView;

    if-nez p0, :cond_5

    const/4 p0, 0x0

    :cond_5
    invoke-static {p0}, Lflb;->n(Landroid/view/View;)Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_d

    const/4 p0, 0x1

    return p0

    :cond_d
    const/4 p0, 0x0

    return p0
.end method

.method public o(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;FFIZ)V
    .registers 8

    iget-object p1, p3, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getTranslationX()F

    move-result p1

    cmpg-float p1, p4, p1

    if-nez p1, :cond_15

    iget-object p1, p3, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getTranslationY()F

    move-result p1

    cmpg-float p1, p5, p1

    if-nez p1, :cond_15

    return-void

    :cond_15
    iget-object p1, p3, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p1, p4}, Landroid/view/View;->setTranslationX(F)V

    iget-object p1, p3, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p1, p5}, Landroid/view/View;->setTranslationY(F)V

    invoke-virtual {p0}, Lskb;->v()Lxj7;

    move-result-object p1

    iget-object p0, p0, Lskb;->e:Lvo3;

    iget-object p0, p0, Lvo3;->d:Lwo3;

    iget-object p0, p0, Lwo3;->A:Lkze;

    invoke-static {p0, p1}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    return-void
.end method

.method public final t(Landroidx/recyclerview/widget/i;I)V
    .registers 7

    if-eqz p1, :cond_5

    const/4 v0, 0x2

    if-eq p2, v0, :cond_6

    :cond_5
    const/4 p1, 0x0

    :cond_6
    iget-object p2, p0, Lskb;->f:Landroidx/recyclerview/widget/i;

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_90

    iget-object p2, p0, Lskb;->f:Landroidx/recyclerview/widget/i;

    iget-object v0, p0, Lskb;->e:Lvo3;

    if-eqz p2, :cond_4f

    iget-object v1, p2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->translationZ(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    new-instance v2, Lkc;

    const/16 v3, 0xe

    invoke-direct {v2, p2, v3}, Lkc;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    iget-object v1, v0, Lvo3;->d:Lwo3;

    iget-object v1, v1, Lwo3;->A:Lkze;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lxj7;

    iget-object v2, v0, Lvo3;->d:Lwo3;

    iget-object v2, v2, Lwo3;->A:Lkze;

    sget-object v3, Luj7;->a:Luj7;

    invoke-static {v2, v3}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    invoke-virtual {p0, p2, v1}, Lskb;->x(Landroidx/recyclerview/widget/i;Lxj7;)V

    instance-of v1, p2, Ljv2;

    if-eqz v1, :cond_4f

    check-cast p2, Ljv2;

    iget-object p2, p2, Ljv2;->b:Lov0;

    iget-object p2, p2, Lov0;->d:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    const/4 v1, 0x1

    invoke-virtual {p2, v1}, Landroid/view/View;->setSelected(Z)V

    :cond_4f
    iput-object p1, p0, Lskb;->f:Landroidx/recyclerview/widget/i;

    if-eqz p1, :cond_90

    iget-object p2, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p2

    sget-wide v1, Lskb;->j:J

    invoke-static {v1, v2}, Lpn7;->f(J)J

    move-result-wide v1

    invoke-virtual {p2, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p2

    iget-object v1, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Lskb;->i:Lixh;

    invoke-virtual {v2, v1}, Ly7h;->l(Landroid/content/Context;)F

    move-result v1

    invoke-virtual {p2, v1}, Landroid/view/ViewPropertyAnimator;->translationZ(F)Landroid/view/ViewPropertyAnimator;

    invoke-virtual {p0}, Lskb;->v()Lxj7;

    move-result-object p2

    iget-object v0, v0, Lvo3;->d:Lwo3;

    iget-object v0, v0, Lwo3;->A:Lkze;

    invoke-static {v0, p2}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    invoke-virtual {p0, p1}, Lskb;->w(Landroidx/recyclerview/widget/i;)V

    instance-of p0, p1, Ljv2;

    if-eqz p0, :cond_90

    check-cast p1, Ljv2;

    iget-object p0, p1, Ljv2;->b:Lov0;

    iget-object p0, p0, Lov0;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/view/View;->setSelected(Z)V

    :cond_90
    return-void
.end method

.method public final u(Landroidx/recyclerview/widget/i;I)V
    .registers 3

    return-void
.end method

.method public v()Lxj7;
    .registers 1

    iget-object p0, p0, Lskb;->f:Landroidx/recyclerview/widget/i;

    if-eqz p0, :cond_7

    sget-object p0, Lvj7;->a:Lvj7;

    return-object p0

    :cond_7
    sget-object p0, Luj7;->a:Luj7;

    return-object p0
.end method

.method public w(Landroidx/recyclerview/widget/i;)V
    .registers 2

    return-void
.end method

.method public abstract x(Landroidx/recyclerview/widget/i;Lxj7;)V
.end method
