.class public final synthetic Lgpk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lurg;
.implements Lrpk;
.implements Lp9n;
.implements Ljtl;
.implements Ln5o;
.implements Lxjj;
.implements Lyjj;
.implements Lhh4;
.implements Lktn;
.implements Lzkn;
.implements Lekj;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lgpk;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 6
    iput-byte p2, p0, Lgpk;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static bridge synthetic f(Ljava/lang/Object;)Landroid/adservices/topics/TopicsManager;
    .registers 1

    check-cast p0, Landroid/adservices/topics/TopicsManager;

    return-object p0
.end method

.method public static bridge synthetic j()Ljava/lang/Class;
    .registers 1

    const-class v0, Landroid/adservices/topics/TopicsManager;

    return-object v0
.end method


# virtual methods
.method public final a(DILjava/lang/Object;)Look;
    .registers 16

    iget-byte p0, p0, Lgpk;->a:B

    packed-switch p0, :pswitch_data_36

    check-cast p4, Ln8f;

    new-instance v0, Look;

    iget-wide p0, p4, Ln8f;->a:J

    invoke-static {p0, p1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p4, Ln8f;->d:Ljava/lang/String;

    iget-object v3, p4, Ln8f;->b:Ljava/lang/String;

    iget-object v4, p4, Ln8f;->c:Ljava/lang/String;

    const/4 v5, 0x3

    iget-object v8, p4, Ln8f;->e:Ljava/lang/String;

    move v6, v5

    move-object v9, v3

    move v7, p3

    invoke-direct/range {v0 .. v9}, Look;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;Ljava/lang/String;)V

    return-object v0

    :pswitch_1f
    move v7, p3

    check-cast p4, Ljzj;

    new-instance v1, Look;

    iget-object v3, p4, Ljzj;->b:Ljava/lang/String;

    iget-object v4, p4, Ljzj;->a:Ljava/lang/String;

    iget-object v9, p4, Ljzj;->d:Ljava/lang/String;

    const-string v2, ""

    const/16 v6, 0x8

    move-object v5, v4

    move v8, v7

    move v7, v6

    move-object v10, v4

    invoke-direct/range {v1 .. v10}, Look;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;Ljava/lang/String;)V

    return-object v1

    :pswitch_data_36
    .packed-switch 0x1
        :pswitch_1f
    .end packed-switch
.end method

.method public final b(Lhjm;)V
    .registers 2

    return-void
.end method

.method public final c(Landroid/view/ViewGroup;)Landroidx/recyclerview/widget/i;
    .registers 5

    iget-byte p0, p0, Lgpk;->a:B

    const/4 v0, 0x0

    const/4 v1, 0x0

    packed-switch p0, :pswitch_data_6a

    new-instance p0, Lq08;

    const v2, 0x7f0d03f6

    invoke-static {p1, v2, p1, v1}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_19

    check-cast p1, Landroid/widget/LinearLayout;

    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    move-object v0, p0

    goto :goto_1e

    :cond_19
    const-string p0, "rootView"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_1e
    return-object v0

    :pswitch_1f
    sget p0, Lq08;->b:I

    const p0, 0x7f0d03f5

    invoke-static {p1, p0, p1, v1}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    const p1, 0x7f0a0839

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v1, :cond_58

    check-cast p0, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f1401b7

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const v2, 0x7f141240

    invoke-virtual {p1, v2, v0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v0, Lq08;

    invoke-direct {v0, p0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    goto :goto_69

    :cond_58
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_69
    return-object v0

    :pswitch_data_6a
    .packed-switch 0xc
        :pswitch_1f
    .end packed-switch
.end method

.method public final cancel()V
    .registers 1

    return-void
.end method

.method public final d(Landroid/content/Context;Lxkn;Lo2c;Landroid/graphics/Bitmap;ILy1n;)Llkn;
    .registers 7

    new-instance p0, Lhll;

    invoke-direct/range {p0 .. p6}, Lhll;-><init>(Landroid/content/Context;Lxkn;Lo2c;Landroid/graphics/Bitmap;ILy1n;)V

    return-object p0
.end method

.method public final e(Lorg/chromium/content/browser/webcontents/WebContentsImpl;)Ljava/lang/Object;
    .registers 2

    new-instance p0, Lorg/chromium/content/browser/input/TextSuggestionPopupController;

    invoke-direct {p0, p1}, Lorg/chromium/content/browser/input/TextSuggestionPopupController;-><init>(Lorg/chromium/content/browser/webcontents/WebContentsImpl;)V

    return-object p0
.end method

.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9

    iget-byte p0, p0, Lgpk;->a:B

    packed-switch p0, :pswitch_data_d2

    check-cast p1, Ljava/util/Map;

    sget-object p0, Ls9g;->h:Ls9g;

    sget-object v0, Llag;->b:Llag;

    iget-object v1, p0, Ls9g;->c:Lvzk;

    iget-object v2, v1, Lvzk;->a:Ljava/lang/Object;

    monitor-enter v2

    :try_start_10
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1d
    :goto_1d
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5e

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_1d

    iget-object v6, v1, Lvzk;->b:Ljava/lang/Object;

    check-cast v6, Ljava/util/HashMap;

    invoke-virtual {v6, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljag;

    if-eqz v6, :cond_1d

    invoke-virtual {v6, v0}, Ljag;->b(Llag;)Ljava/lang/Boolean;

    move-result-object v6

    if-eqz v6, :cond_1d

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-eqz v6, :cond_1d

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lkag;

    const/4 v6, 0x1

    invoke-virtual {v1, v5, v0, v4, v6}, Lvzk;->f0(Ljava/lang/String;Llag;Lkag;Z)Z

    move-result v4

    if-eqz v4, :cond_1d

    invoke-virtual {v3, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_1d

    :cond_5e
    monitor-exit v2
    :try_end_5f
    .catchall {:try_start_10 .. :try_end_5f} :catchall_8e

    invoke-virtual {v3}, Ljava/util/HashSet;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_89

    invoke-virtual {p0}, Ls9g;->n()V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v3}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_71
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_86

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    new-instance v3, Lloj;

    invoke-direct {v3, v2, v0}, Lloj;-><init>(Ljava/lang/String;Llag;)V

    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_71

    :cond_86
    invoke-virtual {p0, p1}, Ls9g;->l(Ljava/util/List;)V

    :cond_89
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :goto_8c
    :try_start_8c
    monitor-exit v2
    :try_end_8d
    .catchall {:try_start_8c .. :try_end_8d} :catchall_8e

    throw p0

    :catchall_8e
    move-exception p0

    goto :goto_8c

    :pswitch_90
    check-cast p1, Ljava/lang/Void;

    :try_start_92
    sget-object p0, Lrmj;->a:Ln9h;

    iget-object p1, p0, Ln9h;->c:Ljava/lang/Object;

    monitor-enter p1
    :try_end_97
    .catch Ljava/lang/Exception; {:try_start_92 .. :try_end_97} :catch_ca

    :try_start_97
    invoke-virtual {p0}, Ln9h;->m()[Lsmj;

    move-result-object p0

    monitor-exit p1
    :try_end_9c
    .catchall {:try_start_97 .. :try_end_9c} :catchall_c8

    array-length p1, p0

    invoke-static {p1}, Lqbd;->a(I)I

    move-result p1

    const/16 v0, 0x10

    if-ge p1, v0, :cond_a6

    move p1, v0

    :cond_a6
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0, p1}, Ljava/util/LinkedHashMap;-><init>(I)V

    array-length p1, p0

    const/4 v1, 0x0

    :goto_ad
    if-ge v1, p1, :cond_d0

    aget-object v2, p0, v1

    iget-object v3, v2, Lsmj;->b:Ljava/lang/String;

    invoke-static {v3}, Lcom/opera/android/browser/BrowserUtils;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iget-boolean v2, v2, Lsmj;->c:Z

    if-eqz v2, :cond_be

    sget-object v2, Lkag;->b:Lkag;

    goto :goto_c0

    :cond_be
    sget-object v2, Lkag;->c:Lkag;

    :goto_c0
    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v1, v1, 0x1

    goto :goto_ad

    :goto_c6
    :try_start_c6
    monitor-exit p1
    :try_end_c7
    .catchall {:try_start_c6 .. :try_end_c7} :catchall_c8

    :try_start_c7
    throw p0
    :try_end_c8
    .catch Ljava/lang/Exception; {:try_start_c7 .. :try_end_c8} :catch_ca

    :catchall_c8
    move-exception p0

    goto :goto_c6

    :catch_ca
    move-exception p0

    invoke-static {p0}, Lks3;->D(Ljava/lang/Throwable;)V

    sget-object v0, Ln08;->a:Ln08;

    :cond_d0
    return-object v0

    nop

    :pswitch_data_d2
    .packed-switch 0x7
        :pswitch_90
    .end packed-switch
.end method

.method public final h(Landroid/view/View;)V
    .registers 2

    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    invoke-virtual {p1}, Landroid/view/View;->clearAnimation()V

    return-void
.end method

.method public final i(Ljava/lang/Object;Landroidx/recyclerview/widget/i;)V
    .registers 5

    iget-byte p0, p0, Lgpk;->a:B

    packed-switch p0, :pswitch_data_a8

    :pswitch_5
    check-cast p1, Lj2l;

    check-cast p2, Lb38;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget p0, p1, Lj2l;->a:I

    iput p0, p2, Lb38;->c:I

    return-void

    :pswitch_11
    check-cast p1, Lk2l;

    check-cast p2, Lc38;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget p0, p1, Lk2l;->a:I

    iput p0, p2, Lc38;->b:I

    return-void

    :pswitch_1d
    check-cast p1, Li2l;

    check-cast p2, Lq08;

    sget-object p0, Lx2l;->r:Lo2l;

    return-void

    :pswitch_24
    check-cast p1, Lh2l;

    check-cast p2, Lq08;

    sget-object p0, Lx2l;->r:Lo2l;

    return-void

    :pswitch_2b
    check-cast p1, Lg2l;

    check-cast p2, Lh85;

    iget-object p0, p2, Lh85;->j:Lne5;

    if-eqz p0, :cond_50

    iget-object v0, p1, Lg2l;->a:Ljava/util/List;

    iget-object v1, p0, Lne5;->d:Ljava/lang/Object;

    check-cast v1, Ljava/util/List;

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_50

    iput-object v0, p0, Lne5;->d:Ljava/lang/Object;

    iget-object v0, p0, Lne5;->g:Ljava/lang/Object;

    check-cast v0, Ltsd;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcyj;

    iget-object v0, v0, Lcyj;->h:Lpxj;

    invoke-virtual {p0, v0}, Lne5;->n(Lpxj;)V

    :cond_50
    iput-object p1, p2, Lh85;->i:Lg2l;

    invoke-virtual {p2}, Lh85;->a0()V

    iget-object p0, p2, Lh85;->h:Ls9i;

    iget-object p1, p2, Lh85;->i:Lg2l;

    iget-object p1, p1, Lg2l;->a:Ljava/util/List;

    check-cast p1, Ljava/util/Collection;

    invoke-virtual {p0, p1}, Ls9i;->X(Ljava/util/Collection;)Z

    move-result p0

    iget-object p1, p2, Lh85;->b:Li85;

    iget-object p1, p1, Li85;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {p1, p0}, Landroid/view/View;->setSelected(Z)V

    invoke-virtual {p2}, Lh85;->b0()V

    return-void

    :pswitch_6c
    check-cast p1, Ll2l;

    check-cast p2, Lkj8;

    iput-object p1, p2, Lkj8;->c:Ll2l;

    iget-object p0, p2, Lkj8;->d:Ld5a;

    if-eqz p0, :cond_81

    iget p1, p1, Ll2l;->b:I

    iget p2, p0, Ld5a;->a:I

    if-eq p1, p2, :cond_81

    iput p1, p0, Ld5a;->a:I

    invoke-virtual {p0}, Ld5a;->b()V

    :cond_81
    return-void

    :pswitch_82
    check-cast p1, Lu2l;

    check-cast p2, Lh5l;

    iput-object p1, p2, Lh5l;->h:Lu2l;

    iget-object p0, p1, Lu2l;->a:Lb2l;

    check-cast p0, Ld7l;

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object p0

    iget p0, p0, Lcom/opera/android/browser/TabInfo;->d:I

    iput p0, p2, Lh5l;->g:I

    invoke-virtual {p2}, Lh5l;->e0()V

    return-void

    :pswitch_9a
    check-cast p1, Lr2l;

    check-cast p2, Lnwj;

    iget-object p0, p2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    check-cast p0, Lmwj;

    iget-object p1, p1, Lr2l;->a:Lq2l;

    iput-object p1, p0, Lmwj;->b:Lq2l;

    return-void

    nop

    :pswitch_data_a8
    .packed-switch 0x9
        :pswitch_9a
        :pswitch_82
        :pswitch_6c
        :pswitch_5
        :pswitch_2b
        :pswitch_24
        :pswitch_5
        :pswitch_1d
        :pswitch_11
    .end packed-switch
.end method

.method public final k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Ljava/lang/Object;
    .registers 20

    move-object/from16 v0, p1

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    iget-byte v1, v1, Lgpk;->a:B

    const v3, 0x7f0a0160

    const/4 v4, 0x0

    const-string v5, "Missing required view with ID: "

    const/4 v6, 0x0

    packed-switch v1, :pswitch_data_160

    sget-object v1, Luxk;->w:[Lxtb;

    const v1, 0x7f0d01f9

    invoke-virtual {v0, v1, v2, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v1, 0x7f0a0389

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v9, v2

    check-cast v9, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v9, :cond_aa

    const v1, 0x7f0a073a

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v10, v2

    check-cast v10, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v10, :cond_aa

    const v1, 0x7f0a07cf

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v11, v2

    check-cast v11, Landroid/widget/LinearLayout;

    if-eqz v11, :cond_aa

    const v1, 0x7f0a0b17

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_aa

    new-instance v12, Llwk;

    check-cast v2, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    invoke-direct {v12, v2, v6}, Llwk;-><init>(Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;B)V

    const v1, 0x7f0a0b1a

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v13, v2

    check-cast v13, Lcom/google/android/material/button/MaterialButton;

    if-eqz v13, :cond_aa

    const v1, 0x7f0a0b1d

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_aa

    invoke-static {v2}, Llwk;->a(Landroid/view/View;)Llwk;

    move-result-object v14

    const v1, 0x7f0a0b20

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v15, v2

    check-cast v15, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v15, :cond_aa

    const v1, 0x7f0a0b21

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/SeparatorView;

    if-eqz v2, :cond_aa

    const v1, 0x7f0a0b22

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/SeparatorView;

    if-eqz v2, :cond_aa

    const v1, 0x7f0a0c84

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_aa

    new-instance v1, Llwk;

    check-cast v2, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    const/4 v3, 0x2

    invoke-direct {v1, v2, v3}, Llwk;-><init>(Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;B)V

    new-instance v7, Lwm9;

    move-object v8, v0

    check-cast v8, Landroid/widget/LinearLayout;

    move-object/from16 v16, v1

    invoke-direct/range {v7 .. v16}, Lwm9;-><init>(Landroid/widget/LinearLayout;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Landroid/widget/LinearLayout;Llwk;Lcom/google/android/material/button/MaterialButton;Llwk;Lcom/opera/android/ui/catalog/widget/OperaListItem;Llwk;)V

    move-object v4, v7

    goto :goto_b9

    :cond_aa
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_b9
    return-object v4

    :pswitch_ba
    sget-object v1, Lxrk;->t:[Lxtb;

    const v1, 0x7f0d0471

    invoke-virtual {v0, v1, v2, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-static {v3, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v1, :cond_f8

    move-object v1, v0

    check-cast v1, Landroidx/constraintlayout/widget/ConstraintLayout;

    const v3, 0x7f0a056f

    invoke-static {v3, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v2, :cond_f8

    const v3, 0x7f0a08f2

    invoke-static {v3, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz v2, :cond_f8

    const v3, 0x7f0a06c5

    invoke-static {v3, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v6, :cond_f8

    new-instance v4, Lhjn;

    invoke-direct {v4, v1, v2}, Lhjn;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;)V

    goto :goto_107

    :cond_f8
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_107
    return-object v4

    :pswitch_108
    const v1, 0x7f0d046f

    invoke-virtual {v0, v1, v2, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v1, 0x7f0a00d5

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    if-eqz v2, :cond_14f

    invoke-static {v3, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v1, :cond_150

    const v3, 0x7f0a025b

    invoke-static {v3, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz v1, :cond_150

    move-object v2, v0

    check-cast v2, Landroidx/constraintlayout/widget/ConstraintLayout;

    const v3, 0x7f0a0598

    invoke-static {v3, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v6, :cond_150

    const v3, 0x7f0a0cc4

    invoke-static {v3, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/opera/android/custom_views/FadingRecyclerView;

    if-eqz v6, :cond_150

    new-instance v4, Lgjn;

    invoke-direct {v4, v2, v1, v6}, Lgjn;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;Lcom/opera/android/custom_views/FadingRecyclerView;)V

    goto :goto_15f

    :cond_14f
    move v3, v1

    :cond_150
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_15f
    return-object v4

    :pswitch_data_160
    .packed-switch 0x4
        :pswitch_108
        :pswitch_ba
    .end packed-switch
.end method

.method public final test(Ljava/lang/Object;)Z
    .registers 2

    check-cast p1, Ljzj;

    const/4 p0, 0x1

    return p0
.end method
