.class public final Lps;
.super Lqr;
.source "SourceFile"


# instance fields
.field public final c:Lzs;

.field public final d:Lat;


# direct methods
.method public constructor <init>(Lzs;Lat;Lat;)V
    .registers 4

    invoke-direct {p0, p2}, Lqr;-><init>(Lkotlin/jvm/functions/Function0;)V

    iput-object p1, p0, Lps;->c:Lzs;

    iput-object p3, p0, Lps;->d:Lat;

    return-void
.end method


# virtual methods
.method public final a(Landroidx/recyclerview/widget/RecyclerView;)Landroidx/recyclerview/widget/d;
    .registers 14

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    new-instance v1, Los;

    iget-object v2, p0, Lps;->d:Lat;

    invoke-virtual {v2}, Lat;->invoke()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    iget-object p0, p0, Lps;->c:Lzs;

    invoke-direct {v1, p0, v2}, Los;-><init>(Lzs;Z)V

    new-instance v5, Landroidx/recyclerview/widget/GridLayoutManager;

    const/4 p0, 0x0

    const/4 v2, 0x1

    invoke-direct {v5, v2, p0}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(II)V

    const/high16 p0, 0x41000000    # 8.0f

    invoke-static {p0, v0}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v7

    const/high16 v3, 0x41800000    # 16.0f

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    invoke-static {v2, v3, v4}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v3

    float-to-int v8, v3

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    invoke-static {v2, p0, v3}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v3

    float-to-int v6, v3

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    invoke-static {v2, p0, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p0

    float-to-int v9, p0

    new-instance v3, Lt79;

    const/4 v10, 0x1

    const/4 v11, 0x0

    move-object v4, p1

    invoke-direct/range {v3 .. v11}, Lt79;-><init>(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/GridLayoutManager;IIIIIB)V

    new-instance p0, Lj4a;

    invoke-direct {p0, v5, v2, v1}, Lj4a;-><init>(Landroidx/recyclerview/widget/GridLayoutManager;ILd4a;)V

    iput-object p0, v5, Landroidx/recyclerview/widget/GridLayoutManager;->g:Ltx7;

    invoke-virtual {v4, v5}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    invoke-virtual {v4, v1}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    new-instance p0, Li4a;

    invoke-direct {p0, v3}, Li4a;-><init>(Lk8;)V

    invoke-virtual {v4, p0}, Landroidx/recyclerview/widget/RecyclerView;->m(Liph;)V

    return-object v1
.end method
