.class public final Les;
.super Lygc;
.source "SourceFile"

# interfaces
.implements Ld4a;


# static fields
.field public static final e:Lcs;


# instance fields
.field public final b:Ltta;

.field public final c:Z

.field public final d:Lbs;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lcs;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcs;-><init>(B)V

    sput-object v0, Les;->e:Lcs;

    return-void
.end method

.method public constructor <init>(Ltta;ZLbs;)V
    .registers 5

    sget-object v0, Les;->e:Lcs;

    invoke-direct {p0, v0}, Lygc;-><init>(Lgyg;)V

    iput-object p1, p0, Les;->b:Ltta;

    iput-boolean p2, p0, Les;->c:Z

    iput-object p3, p0, Les;->d:Lbs;

    return-void
.end method


# virtual methods
.method public final I(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 13

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0c0088

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v9

    new-instance v4, Landroidx/recyclerview/widget/GridLayoutManager;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    const/4 v1, 0x1

    invoke-direct {v4, v9, v1}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(II)V

    new-instance v2, Lj4a;

    invoke-direct {v2, v4, v9, p0}, Lj4a;-><init>(Landroidx/recyclerview/widget/GridLayoutManager;ILd4a;)V

    iput-object v2, v4, Landroidx/recyclerview/widget/GridLayoutManager;->g:Ltx7;

    new-instance v2, Lt79;

    iget-object v3, p0, Les;->b:Ltta;

    iget v5, v3, Ltta;->c:I

    sget-object v3, Lfan;->a:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    const/high16 v6, 0x41400000    # 12.0f

    invoke-static {v1, v6, v3}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v3

    float-to-int v6, v3

    const/high16 v3, 0x41800000    # 16.0f

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v7

    invoke-static {v1, v3, v7}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v3

    float-to-int v7, v3

    const/high16 v3, 0x41000000    # 8.0f

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    invoke-static {v1, v3, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    float-to-int v8, v0

    const/4 v10, 0x1

    move-object v3, p1

    invoke-direct/range {v2 .. v10}, Lt79;-><init>(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/GridLayoutManager;IIIIIB)V

    invoke-virtual {v3, v4}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    :goto_4c
    iget-object p1, v3, Landroidx/recyclerview/widget/RecyclerView;->p:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-lez p1, :cond_59

    const/4 p1, 0x0

    invoke-virtual {v3, p1}, Landroidx/recyclerview/widget/RecyclerView;->r0(I)V

    goto :goto_4c

    :cond_59
    new-instance p1, Li4a;

    invoke-direct {p1, v2}, Li4a;-><init>(Lk8;)V

    invoke-virtual {v3, p1}, Landroidx/recyclerview/widget/RecyclerView;->m(Liph;)V

    iget-boolean p0, p0, Les;->c:Z

    if-eqz p0, :cond_86

    new-instance p0, Lq87;

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0, p1}, Lq87;-><init>(Landroid/content/Context;)V

    new-instance p1, Lu7;

    const/4 v0, 0x5

    invoke-direct {p1, p0, v0}, Lu7;-><init>(Ljava/lang/Object;B)V

    sget-object v0, Lq9n;->c:Ll5b;

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lhjf;->v(Landroid/content/Context;)Ldll;

    move-result-object v0

    if-eqz v0, :cond_83

    invoke-static {v0, v3, p1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_83
    invoke-virtual {v3, p0}, Landroidx/recyclerview/widget/RecyclerView;->m(Liph;)V

    :cond_86
    invoke-virtual {v3}, Landroidx/recyclerview/widget/RecyclerView;->a0()V

    return-void
.end method

.method public final getItem(I)Le4a;
    .registers 2

    iget-object p0, p0, Lygc;->a:Lxd2;

    iget-object p0, p0, Lxd2;->f:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljs;

    return-object p0
.end method

.method public final getItemViewType(I)I
    .registers 2

    iget-object p0, p0, Lygc;->a:Lxd2;

    iget-object p0, p0, Lxd2;->f:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljs;

    iget-object p0, p0, Ljs;->b:Lds;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    return p0
.end method

.method public final onBindViewHolder(Landroidx/recyclerview/widget/i;I)V
    .registers 3

    check-cast p1, Leu;

    iget-object p0, p0, Lygc;->a:Lxd2;

    iget-object p0, p0, Lxd2;->f:Ljava/util/List;

    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljs;

    invoke-virtual {p1, p0}, Leu;->U(Ljs;)V

    return-void
.end method

.method public final onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/i;
    .registers 4

    sget-object v0, Lds;->b:Lzpa;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lds;->i:Lh58;

    invoke-virtual {v0, p2}, Lh58;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lds;

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result p2

    iget-object v0, p0, Les;->d:Lbs;

    if-eqz p2, :cond_55

    const/4 p0, 0x1

    if-eq p2, p0, :cond_4f

    const/4 p0, 0x2

    if-eq p2, p0, :cond_49

    const/4 p0, 0x3

    if-eq p2, p0, :cond_43

    const/4 p0, 0x4

    if-ne p2, p0, :cond_3e

    new-instance p0, Lyt;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const p2, 0x7f14068e

    const v0, 0x7f0807c5

    invoke-static {p2, p1, v0}, Lcom/opera/android/custom_views/EmptyListView;->d(ILandroid/content/Context;I)Lcom/opera/android/custom_views/EmptyListView;

    move-result-object p1

    new-instance p2, Landroid/view/ViewGroup$LayoutParams;

    const/4 v0, -0x1

    invoke-direct {p2, v0, v0}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    return-object p0

    :cond_3e
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return-object p0

    :cond_43
    new-instance p0, Lbu;

    invoke-direct {p0, p1}, Lbu;-><init>(Landroid/view/ViewGroup;)V

    return-object p0

    :cond_49
    new-instance p0, Ldu;

    invoke-direct {p0, p1, v0}, Ldu;-><init>(Landroid/view/ViewGroup;Lbs;)V

    return-object p0

    :cond_4f
    new-instance p0, Lcu;

    invoke-direct {p0, p1, v0}, Lcu;-><init>(Landroid/view/ViewGroup;Lbs;)V

    return-object p0

    :cond_55
    new-instance p2, Lau;

    iget-object p0, p0, Les;->b:Ltta;

    invoke-direct {p2, p1, p0, v0}, Lau;-><init>(Landroid/view/ViewGroup;Ltta;Lbs;)V

    return-object p2
.end method
