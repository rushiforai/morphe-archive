.class public final Lm0e;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lpde;

.field public final b:Lpde;

.field public final c:Lcom/opera/android/tabui2/FadeoutRecyclerView;

.field public final d:Lyhe;

.field public final e:Landroidx/recyclerview/widget/RecyclerView;

.field public final f:Lb0e;

.field public final g:Lcom/opera/android/tabui2/TabUiRootFrameLayout;

.field public h:Ltzd;

.field public i:Z


# direct methods
.method public constructor <init>(Lpde;Lpde;Lgal;Lcom/opera/android/tabui2/FadeoutRecyclerView;Lyhe;Landroidx/recyclerview/widget/RecyclerView;Lb0e;Lcom/opera/android/tabui2/TabUiRootFrameLayout;)V
    .registers 21

    move-object/from16 v0, p5

    move-object/from16 v1, p7

    move-object/from16 v2, p8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lm0e;->a:Lpde;

    iput-object p2, p0, Lm0e;->b:Lpde;

    move-object/from16 v3, p4

    iput-object v3, p0, Lm0e;->c:Lcom/opera/android/tabui2/FadeoutRecyclerView;

    iput-object v0, p0, Lm0e;->d:Lyhe;

    move-object/from16 v3, p6

    iput-object v3, p0, Lm0e;->e:Landroidx/recyclerview/widget/RecyclerView;

    iput-object v1, p0, Lm0e;->f:Lb0e;

    iput-object v2, p0, Lm0e;->g:Lcom/opera/android/tabui2/TabUiRootFrameLayout;

    new-instance v4, Lobc;

    const/4 v10, 0x0

    const/16 v11, 0x1a

    const/4 v5, 0x0

    const-class v7, Lm0e;

    const-string v8, "onLargeRecyclerLayoutChanged"

    const-string v9, "onLargeRecyclerLayoutChanged()V"

    move-object v6, p0

    invoke-direct/range {v4 .. v11}, Lobc;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    iget-object v0, v0, Lyhe;->b:Ljava/lang/Object;

    check-cast v0, Lz5l;

    iput-object v4, v0, Lz5l;->m:Lkotlin/jvm/functions/Function0;

    new-instance v0, Lk0e;

    const/4 v4, 0x0

    invoke-direct {v0, p0, v4}, Lk0e;-><init>(Lm0e;B)V

    invoke-static {p2, p1, v0}, La26;->T(Lekc;Likc;Lf7f;)V

    iget-object p2, p3, Lgal;->g:Lpde;

    new-instance v0, Lk0e;

    const/4 v4, 0x1

    invoke-direct {v0, p0, v4}, Lk0e;-><init>(Lm0e;B)V

    invoke-static {p2, p1, v0}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance p1, La83;

    const/16 p2, 0xa

    invoke-direct {p1, p0, p2}, La83;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, p1}, Landroidx/recyclerview/widget/d;->registerAdapterDataObserver(Lgph;)V

    new-instance p1, Lrn9;

    invoke-direct {p1, p0}, Lrn9;-><init>(Lm0e;)V

    new-instance p1, Ll0e;

    invoke-direct {p1, p0}, Ll0e;-><init>(Lm0e;)V

    new-instance p2, Landroid/view/GestureDetector;

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p2, v0, p1}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    new-instance v0, Lyo7;

    const/16 v1, 0x10

    invoke-direct {v0, p0, p2, p1, v1}, Lyo7;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, v2, Lcom/opera/android/tabui2/TabUiRootFrameLayout;->g:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public final a(F)I
    .registers 4

    iget-object v0, p0, Lm0e;->b:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Leyj;

    iget-object v0, v0, Leyj;->l:Ltxj;

    if-nez v0, :cond_e

    const/4 p0, 0x0

    return p0

    :cond_e
    iget-object v1, v0, Ltxj;->f:Lixh;

    iget-object p0, p0, Lm0e;->e:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v1, p0}, Ly7h;->k(Landroid/content/Context;)I

    move-result p0

    iget-object v0, v0, Ltxj;->e:Landroid/util/Size;

    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v0

    add-int/2addr v0, p0

    int-to-float v0, v0

    mul-float/2addr v0, p1

    div-int/lit8 p0, p0, 0x2

    int-to-float p0, p0

    sub-float/2addr v0, p0

    invoke-static {v0}, Lzed;->b(F)I

    move-result p0

    return p0
.end method

.method public final b()V
    .registers 6

    iget-object v0, p0, Lm0e;->f:Lb0e;

    iget-object v1, v0, Ldt1;->d:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_8b

    iget-object v1, p0, Lm0e;->d:Lyhe;

    iget-object v2, v1, Lyhe;->b:Ljava/lang/Object;

    check-cast v2, Lz5l;

    iget-object v2, v2, Lz5l;->f:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v3, Ln6k;

    const/16 v4, 0x16

    invoke-direct {v3, v1, v4}, Ln6k;-><init>(Ljava/lang/Object;B)V

    invoke-static {v2, v3}, Lnxg;->n(Landroidx/recyclerview/widget/RecyclerView;Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ltzd;

    iget-object v2, p0, Lm0e;->h:Ltzd;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_8b

    iput-object v1, p0, Lm0e;->h:Ltzd;

    if-eqz v1, :cond_8b

    instance-of v2, v1, Lszd;

    const/4 v3, -0x1

    iget-object v4, p0, Lm0e;->e:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v2, :cond_5e

    check-cast v1, Lszd;

    iget v2, v1, Lszd;->a:I

    iget-object v0, v0, Lb0e;->m:Lx77;

    iget-object v0, v0, Lx77;->d:Ljava/lang/Object;

    check-cast v0, Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_54

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    :cond_54
    iget v0, v1, Lszd;->b:F

    invoke-virtual {p0, v0}, Lm0e;->a(F)I

    move-result p0

    invoke-static {v4, v3, p0}, Lexg;->z(Landroidx/recyclerview/widget/RecyclerView;II)V

    return-void

    :cond_5e
    instance-of v2, v1, Lrzd;

    if-eqz v2, :cond_8b

    check-cast v1, Lrzd;

    iget v2, v1, Lrzd;->a:I

    iget-object v0, v0, Lb0e;->m:Lx77;

    iget-object v0, v0, Lx77;->c:Ljava/lang/Object;

    check-cast v0, Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_82

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    :cond_82
    iget v0, v1, Lrzd;->b:F

    invoke-virtual {p0, v0}, Lm0e;->a(F)I

    move-result p0

    invoke-static {v4, v3, p0}, Lexg;->z(Landroidx/recyclerview/widget/RecyclerView;II)V

    :cond_8b
    return-void
.end method
