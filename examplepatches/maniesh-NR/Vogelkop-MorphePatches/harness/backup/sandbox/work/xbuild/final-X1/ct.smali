.class public final Lct;
.super Lltl;
.source "SourceFile"


# static fields
.field public static final synthetic C:[Lxtb;


# instance fields
.field public A:I

.field public final B:Luvi;

.field public final r:Lua7;

.field public s:Lwk9;

.field public final t:Lzyk;

.field public final u:Lks;

.field public final v:Lks;

.field public final w:Lps;

.field public final x:Lks;

.field public final y:Lks;

.field public final z:Lks;


# direct methods
.method static constructor <clinit>()V
    .registers 10

    new-instance v0, Ld6h;

    const-class v1, Lct;

    const-string v2, "searchAdapter"

    const-string v3, "getSearchAdapter()Lcom/opera/android/favorites/add/AddFavoriteAdapter;"

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    new-instance v2, Ld6h;

    const-string v3, "suggestedForYouAdapter"

    const-string v5, "getSuggestedForYouAdapter()Lcom/opera/android/favorites/add/AddFavoriteAdapter;"

    invoke-direct {v2, v1, v3, v5, v4}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    new-instance v3, Ld6h;

    const-string v5, "categoryAdapter"

    const-string v6, "getCategoryAdapter()Lcom/opera/android/favorites/add/AddFavoriteCategoryAdapter;"

    invoke-direct {v3, v1, v5, v6, v4}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    new-instance v5, Ld6h;

    const-string v6, "frequentlyVisitedAdapter"

    const-string v7, "getFrequentlyVisitedAdapter()Lcom/opera/android/favorites/add/AddFavoriteAdapter;"

    invoke-direct {v5, v1, v6, v7, v4}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    new-instance v6, Ld6h;

    const-string v7, "toolsAdapter"

    const-string v8, "getToolsAdapter()Lcom/opera/android/favorites/add/AddFavoriteAdapter;"

    invoke-direct {v6, v1, v7, v8, v4}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    new-instance v7, Ld6h;

    const-string v8, "bookmarkAdapter"

    const-string v9, "getBookmarkAdapter()Lcom/opera/android/favorites/add/AddFavoriteAdapter;"

    invoke-direct {v7, v1, v8, v9, v4}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    const/4 v1, 0x6

    new-array v1, v1, [Lxtb;

    aput-object v0, v1, v4

    const/4 v0, 0x1

    aput-object v2, v1, v0

    const/4 v0, 0x2

    aput-object v3, v1, v0

    const/4 v0, 0x3

    aput-object v5, v1, v0

    const/4 v0, 0x4

    aput-object v6, v1, v0

    const/4 v0, 0x5

    aput-object v7, v1, v0

    sput-object v1, Lct;->C:[Lxtb;

    return-void
.end method

.method public constructor <init>(Lgjm;)V
    .registers 9

    const v0, 0x7f0d01d4

    invoke-static {v0}, Lu7k;->j(I)Lu7k;

    move-result-object v0

    const v1, 0x7f1400e7

    invoke-virtual {v0, v1}, Lu7k;->s(I)V

    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    const v1, 0x7f100002

    iput v1, v0, Litl;->b:I

    const/4 v1, 0x1

    iput-boolean v1, v0, Litl;->e:Z

    invoke-direct {p0, v0}, Lltl;-><init>(Litl;)V

    new-instance v0, Lua7;

    invoke-direct {v0, p0, p1}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object v0, p0, Lct;->r:Lua7;

    new-instance p1, Lt2;

    const/4 v0, 0x4

    invoke-direct {p1, p0, v0}, Lt2;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lct;->t:Lzyk;

    new-instance p1, Lpjn;

    const/4 v2, 0x6

    invoke-direct {p1, p0, v2}, Lpjn;-><init>(Ljava/lang/Object;B)V

    new-instance v3, Lat;

    const/4 v4, 0x2

    invoke-direct {v3, p0, v4}, Lat;-><init>(Lct;B)V

    new-instance v4, Lks;

    new-instance v5, Lat;

    invoke-direct {v5, p0, v1}, Lat;-><init>(Lct;B)V

    invoke-direct {v4, p1, v1, v3, v5}, Lks;-><init>(Lbs;ZLkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V

    iput-object v4, p0, Lct;->u:Lks;

    new-instance v3, Lat;

    const/4 v4, 0x3

    invoke-direct {v3, p0, v4}, Lat;-><init>(Lct;B)V

    new-instance v4, Lks;

    new-instance v5, Lat;

    invoke-direct {v5, p0, v1}, Lat;-><init>(Lct;B)V

    const/4 v6, 0x0

    invoke-direct {v4, p1, v6, v3, v5}, Lks;-><init>(Lbs;ZLkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V

    iput-object v4, p0, Lct;->v:Lks;

    new-instance v3, Lat;

    invoke-direct {v3, p0, v0}, Lat;-><init>(Lct;B)V

    new-instance v0, Lps;

    new-instance v4, Lzs;

    invoke-direct {v4, p0}, Lzs;-><init>(Lct;)V

    new-instance v5, Lat;

    invoke-direct {v5, p0, v6}, Lat;-><init>(Lct;B)V

    invoke-direct {v0, v4, v3, v5}, Lps;-><init>(Lzs;Lat;Lat;)V

    iput-object v0, p0, Lct;->w:Lps;

    new-instance v0, Lat;

    const/4 v3, 0x5

    invoke-direct {v0, p0, v3}, Lat;-><init>(Lct;B)V

    new-instance v3, Lks;

    new-instance v4, Lat;

    invoke-direct {v4, p0, v1}, Lat;-><init>(Lct;B)V

    invoke-direct {v3, p1, v6, v0, v4}, Lks;-><init>(Lbs;ZLkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V

    iput-object v3, p0, Lct;->x:Lks;

    new-instance v0, Lat;

    invoke-direct {v0, p0, v2}, Lat;-><init>(Lct;B)V

    new-instance v2, Lks;

    new-instance v3, Lat;

    invoke-direct {v3, p0, v1}, Lat;-><init>(Lct;B)V

    invoke-direct {v2, p1, v6, v0, v3}, Lks;-><init>(Lbs;ZLkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V

    iput-object v2, p0, Lct;->y:Lks;

    new-instance v0, Lat;

    const/4 v2, 0x7

    invoke-direct {v0, p0, v2}, Lat;-><init>(Lct;B)V

    new-instance v2, Lks;

    new-instance v3, Lat;

    invoke-direct {v3, p0, v1}, Lat;-><init>(Lct;B)V

    invoke-direct {v2, p1, v6, v0, v3}, Lks;-><init>(Lbs;ZLkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V

    iput-object v2, p0, Lct;->z:Lks;

    new-instance p1, Luvi;

    new-instance v0, Lbt;

    invoke-direct {v0, p0, v1}, Lbt;-><init>(Lct;B)V

    invoke-direct {p1, v0}, Luvi;-><init>(Lbt;)V

    iput-object p1, p0, Lct;->B:Luvi;

    return-void
.end method

.method public static H0(Lygc;Landroid/widget/LinearLayout;Lcom/opera/android/custom_views/SeparatorView;Ljava/util/List;)Z
    .registers 7

    move-object v0, p3

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_c

    move v1, v2

    goto :goto_e

    :cond_c
    const/16 v1, 0x8

    :goto_e
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    if-eqz p2, :cond_16

    invoke-virtual {p2, v2}, Landroid/view/View;->setVisibility(I)V

    :cond_16
    invoke-virtual {p0, p3}, Lygc;->H(Ljava/util/List;)V

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method


# virtual methods
.method public final G0()Lju;
    .registers 1

    iget-object p0, p0, Lct;->t:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lju;

    return-object p0
.end method

.method public final l0(Z)V
    .registers 3

    invoke-virtual {p0}, Lct;->G0()Lju;

    move-result-object v0

    iget-object v0, v0, Lju;->d:Lot;

    invoke-virtual {v0}, Loy;->c()Z

    move-result v0

    if-eqz v0, :cond_d

    return-void

    :cond_d
    invoke-super {p0, p1}, Lk24;->l0(Z)V

    return-void
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 5

    invoke-super {p0, p1}, Lltl;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0c0088

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p1

    iget v0, p0, Lct;->A:I

    if-ne p1, v0, :cond_13

    return-void

    :cond_13
    iput p1, p0, Lct;->A:I

    const/4 p1, 0x1

    sget-object v0, Lct;->C:[Lxtb;

    aget-object p1, v0, p1

    iget-object p1, p0, Lct;->v:Lks;

    invoke-virtual {p1, p0}, Lqr;->b(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Les;

    iget-object v1, p0, Lct;->s:Lwk9;

    const/4 v2, 0x0

    if-nez v1, :cond_28

    move-object v1, v2

    :cond_28
    iget-object v1, v1, Lwk9;->h:Ljava/lang/Object;

    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1, v1}, Les;->I(Landroidx/recyclerview/widget/RecyclerView;)V

    const/4 p1, 0x3

    aget-object p1, v0, p1

    iget-object p1, p0, Lct;->x:Lks;

    invoke-virtual {p1, p0}, Lqr;->b(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Les;

    iget-object v1, p0, Lct;->s:Lwk9;

    if-nez v1, :cond_3f

    move-object v1, v2

    :cond_3f
    iget-object v1, v1, Lwk9;->f:Ljava/lang/Object;

    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1, v1}, Les;->I(Landroidx/recyclerview/widget/RecyclerView;)V

    const/4 p1, 0x4

    aget-object p1, v0, p1

    iget-object p1, p0, Lct;->y:Lks;

    invoke-virtual {p1, p0}, Lqr;->b(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Les;

    iget-object v1, p0, Lct;->s:Lwk9;

    if-nez v1, :cond_56

    move-object v1, v2

    :cond_56
    iget-object v1, v1, Lwk9;->i:Ljava/lang/Object;

    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1, v1}, Les;->I(Landroidx/recyclerview/widget/RecyclerView;)V

    const/4 p1, 0x0

    aget-object p1, v0, p1

    iget-object p1, p0, Lct;->u:Lks;

    invoke-virtual {p1, p0}, Lqr;->b(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Les;

    iget-object v0, p0, Lct;->s:Lwk9;

    if-nez v0, :cond_6d

    move-object v0, v2

    :cond_6d
    iget-object v0, v0, Lwk9;->g:Ljava/lang/Object;

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1, v0}, Les;->I(Landroidx/recyclerview/widget/RecyclerView;)V

    invoke-virtual {p0}, Lct;->G0()Lju;

    move-result-object p1

    iget v0, p0, Lct;->A:I

    invoke-virtual {p1, v0}, Lju;->h(I)V

    iget-object p1, p0, Lct;->s:Lwk9;

    if-eqz p1, :cond_82

    move-object v2, p1

    :cond_82
    iget-object p1, v2, Lwk9;->c:Ljava/lang/Object;

    check-cast p1, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    new-instance v0, Lc4;

    const/16 v1, 0x9

    invoke-direct {v0, p0, v1}, Lc4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final y0(Landroid/view/LayoutInflater;Lcom/opera/android/StatusBarDrawingFrameLayout;)V
    .registers 30

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    const v2, 0x7f0a02a9

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    const v3, 0x7f0a017b

    invoke-static {v3, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v7, v4

    check-cast v7, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v7, :cond_281

    const v3, 0x7f0a017c

    invoke-static {v3, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v8, v4

    check-cast v8, Landroid/widget/LinearLayout;

    if-eqz v8, :cond_281

    const v3, 0x7f0a01ec

    invoke-static {v3, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v9, v4

    check-cast v9, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v9, :cond_281

    const v3, 0x7f0a01ed

    invoke-static {v3, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v10, v4

    check-cast v10, Landroid/widget/LinearLayout;

    if-eqz v10, :cond_281

    const v3, 0x7f0a01ee

    invoke-static {v3, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v11, v4

    check-cast v11, Lcom/opera/android/custom_views/SeparatorView;

    if-eqz v11, :cond_281

    const v3, 0x7f0a0269

    invoke-static {v3, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v12, v4

    check-cast v12, Landroid/widget/FrameLayout;

    if-eqz v12, :cond_281

    move-object v6, v2

    check-cast v6, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    const v3, 0x7f0a04d5

    invoke-static {v3, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v13, v4

    check-cast v13, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v13, :cond_281

    const v3, 0x7f0a04d6

    invoke-static {v3, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v14, v4

    check-cast v14, Landroid/widget/LinearLayout;

    if-eqz v14, :cond_281

    const v3, 0x7f0a04d7

    invoke-static {v3, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v15, v4

    check-cast v15, Lcom/opera/android/custom_views/SeparatorView;

    if-eqz v15, :cond_281

    const v3, 0x7f0a0639

    invoke-static {v3, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object/from16 v16, v4

    check-cast v16, Landroid/widget/LinearLayout;

    if-eqz v16, :cond_281

    const v3, 0x7f0a092c

    invoke-static {v3, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object/from16 v17, v4

    check-cast v17, Lcom/opera/android/custom_views/FadingNestedScrollView;

    if-eqz v17, :cond_281

    const v3, 0x7f0a0932

    invoke-static {v3, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object/from16 v18, v4

    check-cast v18, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v18, :cond_281

    const v4, 0x7f0a0943

    invoke-static {v4, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v19, v5

    check-cast v19, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v19, :cond_280

    const v4, 0x7f0a0afa

    invoke-static {v4, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v20, v5

    check-cast v20, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v20, :cond_280

    const v4, 0x7f0a0afb

    invoke-static {v4, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v21, v5

    check-cast v21, Landroid/widget/LinearLayout;

    if-eqz v21, :cond_280

    const v4, 0x7f0a0afc

    invoke-static {v4, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v22, v5

    check-cast v22, Lcom/opera/android/custom_views/SeparatorView;

    if-eqz v22, :cond_280

    const v4, 0x7f0a0b0b

    invoke-static {v4, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v23, v5

    check-cast v23, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    if-eqz v23, :cond_280

    const v4, 0x7f0a0bc1

    invoke-static {v4, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v24, v5

    check-cast v24, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v24, :cond_280

    const v4, 0x7f0a0bc2

    invoke-static {v4, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v25, v5

    check-cast v25, Landroid/widget/LinearLayout;

    if-eqz v25, :cond_280

    const v4, 0x7f0a0bc3

    invoke-static {v4, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v26, v5

    check-cast v26, Lcom/opera/android/custom_views/SeparatorView;

    if-eqz v26, :cond_280

    new-instance v5, Lwk9;

    invoke-direct/range {v5 .. v26}, Lwk9;-><init>(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroidx/recyclerview/widget/RecyclerView;Landroid/widget/LinearLayout;Landroidx/recyclerview/widget/RecyclerView;Landroid/widget/LinearLayout;Lcom/opera/android/custom_views/SeparatorView;Landroid/widget/FrameLayout;Landroidx/recyclerview/widget/RecyclerView;Landroid/widget/LinearLayout;Lcom/opera/android/custom_views/SeparatorView;Landroid/widget/LinearLayout;Lcom/opera/android/custom_views/FadingNestedScrollView;Lcom/opera/android/custom_views/StylingTextView;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView;Landroid/widget/LinearLayout;Lcom/opera/android/custom_views/SeparatorView;Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;Landroidx/recyclerview/widget/RecyclerView;Landroid/widget/LinearLayout;Lcom/opera/android/custom_views/SeparatorView;)V

    move-object/from16 v4, v17

    iput-object v5, v0, Lct;->s:Lwk9;

    invoke-virtual {v0, v1, v4}, Lltl;->p0(Landroid/view/View;Landroid/view/View;)V

    iget-object v1, v0, Lct;->s:Lwk9;

    const/4 v2, 0x0

    if-nez v1, :cond_11c

    move-object v4, v2

    goto :goto_11d

    :cond_11c
    move-object v4, v1

    :goto_11d
    iget-object v4, v4, Lwk9;->t:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/custom_views/FadingNestedScrollView;

    if-nez v1, :cond_124

    move-object v1, v2

    :cond_124
    iget-object v1, v1, Lwk9;->s:Landroid/view/View;

    check-cast v1, Landroid/widget/FrameLayout;

    iget-object v5, v0, Lct;->B:Luvi;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v6, Ltvi;

    const/4 v7, 0x0

    invoke-direct {v6, v5, v7}, Ltvi;-><init>(Luvi;B)V

    invoke-static {v4, v6}, Lq9n;->g(Landroid/view/View;Landroid/view/View$OnAttachStateChangeListener;)V

    new-instance v4, Ltvi;

    const/4 v6, 0x1

    invoke-direct {v4, v5, v6}, Ltvi;-><init>(Luvi;B)V

    invoke-static {v1, v4}, Lq9n;->g(Landroid/view/View;Landroid/view/View$OnAttachStateChangeListener;)V

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v1

    invoke-interface {v1}, Lndc;->getLifecycle()Ltcc;

    move-result-object v1

    invoke-virtual {v1, v5}, Ltcc;->a(Lmdc;)V

    sget-object v1, Lgt;->a:Lgt;

    iget-object v4, v0, Lct;->s:Lwk9;

    if-nez v4, :cond_151

    move-object v4, v2

    :cond_151
    iget-object v4, v4, Lwk9;->m:Ljava/lang/Object;

    check-cast v4, Landroid/widget/LinearLayout;

    const/16 v8, 0x32

    invoke-virtual {v5, v1, v4, v8}, Luvi;->R(Lgt;Landroid/widget/LinearLayout;I)V

    sget-object v1, Lgt;->b:Lgt;

    iget-object v4, v0, Lct;->s:Lwk9;

    if-nez v4, :cond_161

    move-object v4, v2

    :cond_161
    iget-object v4, v4, Lwk9;->j:Ljava/lang/Object;

    check-cast v4, Landroid/widget/LinearLayout;

    const/16 v9, 0x63

    invoke-virtual {v5, v1, v4, v9}, Luvi;->R(Lgt;Landroid/widget/LinearLayout;I)V

    sget-object v1, Lgt;->c:Lgt;

    iget-object v4, v0, Lct;->s:Lwk9;

    if-nez v4, :cond_171

    move-object v4, v2

    :cond_171
    iget-object v4, v4, Lwk9;->k:Ljava/lang/Object;

    check-cast v4, Landroid/widget/LinearLayout;

    invoke-virtual {v5, v1, v4, v8}, Luvi;->R(Lgt;Landroid/widget/LinearLayout;I)V

    sget-object v1, Lgt;->d:Lgt;

    iget-object v4, v0, Lct;->s:Lwk9;

    if-nez v4, :cond_17f

    move-object v4, v2

    :cond_17f
    iget-object v4, v4, Lwk9;->n:Landroid/view/View;

    check-cast v4, Landroid/widget/LinearLayout;

    invoke-virtual {v5, v1, v4, v8}, Luvi;->R(Lgt;Landroid/widget/LinearLayout;I)V

    sget-object v1, Lgt;->e:Lgt;

    iget-object v4, v0, Lct;->s:Lwk9;

    if-nez v4, :cond_18d

    move-object v4, v2

    :cond_18d
    iget-object v4, v4, Lwk9;->b:Landroid/widget/LinearLayout;

    const/16 v8, 0x1e

    invoke-virtual {v5, v1, v4, v8}, Luvi;->R(Lgt;Landroid/widget/LinearLayout;I)V

    iget-object v1, v0, Lct;->s:Lwk9;

    if-nez v1, :cond_199

    move-object v1, v2

    :cond_199
    iget-object v1, v1, Lwk9;->c:Ljava/lang/Object;

    check-cast v1, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    const v4, 0x7f0a010b

    invoke-static {v4, v1}, Lq9n;->y(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v10, v1

    check-cast v10, Lcom/google/android/material/appbar/AppBarLayout;

    iget-object v1, v0, Lct;->s:Lwk9;

    if-nez v1, :cond_1ac

    move-object v1, v2

    :cond_1ac
    iget-object v1, v1, Lwk9;->c:Ljava/lang/Object;

    check-cast v1, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    const v4, 0x7f0a023d

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v11, v1

    check-cast v11, Lcom/google/android/material/appbar/CollapsingToolbarLayout;

    iget-object v1, v0, Lct;->s:Lwk9;

    if-nez v1, :cond_1bf

    move-object v1, v2

    :cond_1bf
    iget-object v1, v1, Lwk9;->c:Ljava/lang/Object;

    check-cast v1, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    const v4, 0x7f0a0944

    invoke-static {v4, v1}, Lq9n;->y(ILandroid/view/View;)Landroid/view/View;

    move-result-object v12

    const/16 v1, 0x8

    invoke-virtual {v12, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, v0, Lct;->s:Lwk9;

    if-nez v1, :cond_1d4

    move-object v1, v2

    :cond_1d4
    iget-object v1, v1, Lwk9;->u:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    new-instance v4, Lgf;

    const/4 v5, 0x4

    invoke-direct {v4, v0, v5}, Lgf;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0}, Lct;->G0()Lju;

    move-result-object v1

    invoke-virtual {v0, v3}, Lltl;->r0(I)Landroid/view/MenuItem;

    move-result-object v3

    iget-object v4, v0, Lct;->s:Lwk9;

    if-nez v4, :cond_1ef

    move-object v8, v2

    goto :goto_1f0

    :cond_1ef
    move-object v8, v4

    :goto_1f0
    iget-object v8, v8, Lwk9;->g:Ljava/lang/Object;

    move-object v13, v8

    check-cast v13, Landroidx/recyclerview/widget/RecyclerView;

    if-nez v4, :cond_1f8

    move-object v4, v2

    :cond_1f8
    iget-object v4, v4, Lwk9;->t:Ljava/lang/Object;

    move-object v14, v4

    check-cast v14, Lcom/opera/android/custom_views/FadingNestedScrollView;

    iget-object v1, v1, Lju;->d:Lot;

    const v4, 0x7f1400df

    const/16 v8, 0x11

    invoke-virtual {v1, v3, v13, v4, v8}, Loy;->j(Landroid/view/MenuItem;Landroidx/recyclerview/widget/RecyclerView;II)V

    new-instance v8, Lj1c;

    const/16 v16, 0x0

    const/16 v17, 0xc1

    const/4 v9, 0x0

    const/4 v15, 0x0

    invoke-direct/range {v8 .. v17}, Lj1c;-><init>(Landroidx/appcompat/widget/Toolbar;Lcom/google/android/material/appbar/AppBarLayout;Lcom/google/android/material/appbar/CollapsingToolbarLayout;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;Lyz7;Lxsi;I)V

    invoke-virtual {v1, v8}, Loy;->i(Lj1c;)V

    invoke-virtual {v0}, Lct;->G0()Lju;

    move-result-object v1

    iget-object v1, v1, Lju;->b:Lrq8;

    iget-object v1, v1, Lrq8;->a:Lr9i;

    :try_start_21d
    iget-object v1, v1, Lr9i;->d:Ljava/lang/Object;

    check-cast v1, Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v7
    :try_end_225
    .catch Ljava/lang/SecurityException; {:try_start_21d .. :try_end_225} :catch_225

    :catch_225
    xor-int/2addr v7, v6

    iget-object v1, v0, Lct;->s:Lwk9;

    if-nez v1, :cond_22b

    move-object v1, v2

    :cond_22b
    iget-object v1, v1, Lwk9;->v:Ljava/lang/Object;

    check-cast v1, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    invoke-virtual {v1, v7}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setEnabled(Z)V

    iget-object v1, v0, Lct;->s:Lwk9;

    if-nez v1, :cond_237

    move-object v1, v2

    :cond_237
    iget-object v1, v1, Lwk9;->v:Ljava/lang/Object;

    check-cast v1, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    invoke-virtual {v1, v7}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->m(Z)V

    iget-object v1, v0, Lct;->s:Lwk9;

    if-nez v1, :cond_243

    move-object v1, v2

    :cond_243
    iget-object v1, v1, Lwk9;->v:Ljava/lang/Object;

    check-cast v1, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    new-instance v3, Lzs;

    invoke-direct {v3, v0}, Lzs;-><init>(Lct;)V

    iput-object v3, v1, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->b:Lzvk;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v3, 0x7f0c0088

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    iput v1, v0, Lct;->A:I

    invoke-virtual {v0}, Lct;->G0()Lju;

    move-result-object v1

    iget v3, v0, Lct;->A:I

    invoke-virtual {v1, v3}, Lju;->h(I)V

    invoke-virtual {v0}, Lct;->G0()Lju;

    move-result-object v1

    iget-object v1, v1, Lju;->h:Lode;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v3

    iget-object v4, v0, Lct;->s:Lwk9;

    if-nez v4, :cond_273

    move-object v4, v2

    :cond_273
    iget-object v4, v4, Lwk9;->c:Ljava/lang/Object;

    check-cast v4, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    new-instance v6, Lpb;

    invoke-direct {v6, v0, v5}, Lpb;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1, v3, v4, v2, v6}, Lxf8;->i0(Lekc;Lndc;Landroid/view/ViewGroup;Ljava/util/List;Lf7f;)V

    return-void

    :cond_280
    move v3, v4

    :cond_281
    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method

.method public final z0()V
    .registers 3

    iget-object v0, p0, Lct;->s:Lwk9;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    move-object v0, v1

    :cond_6
    iget-object v0, v0, Lwk9;->t:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/FadingNestedScrollView;

    invoke-static {v0}, Lz4o;->q0(Landroid/view/View;)V

    iget-object p0, p0, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    invoke-static {p0, v1}, Lz4o;->r0(Lcom/opera/android/StatusBarDrawingFrameLayout;Ldxh;)V

    return-void
.end method
