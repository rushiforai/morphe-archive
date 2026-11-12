.class public final Lqfb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lekg;
.implements Lnj8;
.implements Lbtj;
.implements Lqld;
.implements Lhsd;
.implements Lubk;
.implements Ls87;
.implements Loeb;
.implements Lcn;
.implements Lfie;
.implements Lm82;
.implements Lhvh;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(B)V
    .registers 3

    iput-byte p1, p0, Lqfb;->a:B

    sparse-switch p1, :sswitch_data_34

    .line 124
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 125
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lqfb;->b:Ljava/lang/Object;

    .line 126
    new-instance p0, Ljava/util/HashMap;

    return-void

    .line 127
    :sswitch_12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 128
    new-instance p1, Lqie;

    const/16 v0, 0xc

    invoke-direct {p1, v0}, Lqie;-><init>(B)V

    iput-object p1, p0, Lqfb;->b:Ljava/lang/Object;

    return-void

    .line 129
    :sswitch_1f
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 p1, 0x100

    new-array p1, p1, [S

    iput-object p1, p0, Lqfb;->b:Ljava/lang/Object;

    return-void

    .line 130
    :sswitch_29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 131
    new-instance p1, Lmxb;

    invoke-direct {p1}, Lmxb;-><init>()V

    iput-object p1, p0, Lqfb;->b:Ljava/lang/Object;

    return-void

    :sswitch_data_34
    .sparse-switch
        0x3 -> :sswitch_29
        0x16 -> :sswitch_1f
        0x1b -> :sswitch_12
    .end sparse-switch
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    iput-byte v0, p0, Lqfb;->a:B

    .line 132
    new-instance v0, Lv61;

    invoke-direct {v0, p1}, Lv61;-><init>(Landroid/content/Context;)V

    .line 133
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 134
    iput-object v0, p0, Lqfb;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/bar/OmniBoxRoot;Lwub;Lbp;)V
    .registers 10

    const/16 v0, 0x10

    iput-byte v0, p0, Lqfb;->a:B

    .line 139
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 140
    new-instance v0, Ljava/util/EnumMap;

    const-class v1, Lvaf;

    invoke-direct {v0, v1}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    iput-object v0, p0, Lqfb;->b:Ljava/lang/Object;

    .line 141
    invoke-static {}, Lvaf;->values()[Lvaf;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_16
    if-ge v2, v1, :cond_35

    aget-object v3, v0, v2

    .line 142
    iget v4, v3, Lvaf;->a:I

    sget-object v5, Lr5n;->a:Ljava/util/WeakHashMap;

    .line 143
    invoke-static {p1, v4}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    .line 144
    check-cast v4, Lcom/opera/android/bar/OmniButtonView;

    .line 145
    invoke-virtual {v4, p2}, Lcom/opera/android/bar/OmniButtonView;->c(Lwub;)V

    .line 146
    iput-object p3, v4, Lcom/opera/android/bar/OmniButtonView;->j:Lbp;

    .line 147
    iget-object v5, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast v5, Ljava/util/EnumMap;

    invoke-virtual {v5, v3, v4}, Ljava/util/EnumMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v2, v2, 0x1

    goto :goto_16

    :cond_35
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 136
    iput-byte p2, p0, Lqfb;->a:B

    iput-object p1, p0, Lqfb;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;[Lkotlinx/serialization/json/b;)V
    .registers 7

    const/4 v0, 0x2

    iput-byte v0, p0, Lqfb;->a:B

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    const-string v1, "method"

    invoke-static {p1}, Lqqb;->c(Ljava/lang/String;)Lkotlinx/serialization/json/d;

    move-result-object p1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lkotlinx/serialization/json/b;

    array-length p1, p2

    if-eqz p1, :cond_35

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    array-length v1, p2

    const/4 v2, 0x0

    :goto_1e
    if-ge v2, v1, :cond_28

    aget-object v3, p2, v2

    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_1e

    :cond_28
    new-instance p2, Lkotlinx/serialization/json/a;

    invoke-direct {p2, p1}, Lkotlinx/serialization/json/a;-><init>(Ljava/util/List;)V

    const-string p1, "params"

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lkotlinx/serialization/json/b;

    :cond_35
    new-instance p1, Lkotlinx/serialization/json/c;

    invoke-direct {p1, v0}, Lkotlinx/serialization/json/c;-><init>(Ljava/util/Map;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object p2, Lhsb;->a:Lkotlinx/serialization/json/d;

    const-string v0, "jsonrpc"

    invoke-virtual {p1, v0}, Lkotlinx/serialization/json/c;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    const-string v2, "id"

    invoke-virtual {p1, v2}, Lkotlinx/serialization/json/c;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v1, :cond_51

    if-nez v3, :cond_79

    if-eqz p2, :cond_79

    :cond_51
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    const-string v3, "2.0"

    invoke-static {v3}, Lqqb;->c(Ljava/lang/String;)Lkotlinx/serialization/json/d;

    move-result-object v3

    invoke-interface {v1, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkotlinx/serialization/json/b;

    if-eqz p2, :cond_6a

    invoke-interface {v1, v2, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lkotlinx/serialization/json/b;

    :cond_6a
    new-instance p2, Lkotlinx/serialization/json/c;

    invoke-direct {p2, v1}, Lkotlinx/serialization/json/c;-><init>(Ljava/util/Map;)V

    new-instance v0, Lkotlinx/serialization/json/c;

    invoke-static {p2, p1}, Lrbd;->e(Ljava/util/Map;Ljava/util/Map;)Ljava/util/LinkedHashMap;

    move-result-object p1

    invoke-direct {v0, p1}, Lkotlinx/serialization/json/c;-><init>(Ljava/util/Map;)V

    move-object p1, v0

    :cond_79
    iput-object p1, p0, Lqfb;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lkw3;Lkw3;Lqii;)V
    .registers 4

    const/16 p1, 0x18

    iput-byte p1, p0, Lqfb;->a:B

    .line 137
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 138
    iput-object p2, p0, Lqfb;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lqsh;Lyqa;)V
    .registers 4

    const/16 v0, 0x1c

    iput-byte v0, p0, Lqfb;->a:B

    .line 135
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lqfb;->b:Ljava/lang/Object;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final A(Landroidx/recyclerview/widget/i;Lfr;Lfr;)V
    .registers 11

    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->c:Landroidx/recyclerview/widget/g;

    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/g;->m(Landroidx/recyclerview/widget/i;)V

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->l(Landroidx/recyclerview/widget/i;)V

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/i;->setIsRecyclable(Z)V

    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->M:Landroidx/recyclerview/widget/e;

    move-object v1, v0

    check-cast v1, Lxkj;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v3, p2, Lfr;->b:I

    iget v4, p2, Lfr;->c:I

    iget-object p2, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    if-nez p3, :cond_2b

    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    move-result p3

    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result v0

    move v5, p3

    move v6, v0

    goto :goto_31

    :cond_2b
    iget v0, p3, Lfr;->b:I

    iget p3, p3, Lfr;->c:I

    move v6, p3

    move v5, v0

    :goto_31
    invoke-virtual {p1}, Landroidx/recyclerview/widget/i;->isRemoved()Z

    move-result p3

    if-nez p3, :cond_4e

    if-ne v3, v5, :cond_3b

    if-eq v4, v6, :cond_4e

    :cond_3b
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result p3

    add-int/2addr p3, v5

    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result v0

    add-int/2addr v0, v6

    invoke-virtual {p2, v5, v6, p3, v0}, Landroid/view/View;->layout(IIII)V

    move-object v2, p1

    invoke-virtual/range {v1 .. v6}, Lxkj;->m(Landroidx/recyclerview/widget/i;IIII)Z

    move-result p1

    goto :goto_53

    :cond_4e
    move-object v2, p1

    invoke-virtual {v1, v2}, Lxkj;->n(Landroidx/recyclerview/widget/i;)Z

    move-result p1

    :goto_53
    if-eqz p1, :cond_58

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->j0()V

    :cond_58
    return-void
.end method

.method public final B()V
    .registers 5

    const/4 v0, 0x0

    :goto_1
    const/16 v1, 0x100

    if-ge v0, v1, :cond_1a

    iget-object v1, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast v1, [S

    aget-short v2, v1, v0

    mul-int/lit16 v3, v2, 0x4ebf

    shr-int/lit8 v3, v3, 0x1a

    int-to-short v3, v3

    mul-int/lit16 v3, v3, 0xd01

    int-to-short v3, v3

    sub-int/2addr v2, v3

    int-to-short v2, v2

    aput-short v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1a
    return-void
.end method

.method public final F()V
    .registers 1

    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, Llrc;

    invoke-virtual {p0}, Llrc;->g0()V

    return-void
.end method

.method public final I()V
    .registers 1

    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, Li7d;

    iget-object p0, p0, Li7d;->n:Lqm9;

    invoke-virtual {p0}, Lqm9;->I()V

    return-void
.end method

.method public final K()V
    .registers 1

    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, Llrc;

    iget-object p0, p0, Llrc;->B:Lor2;

    if-nez p0, :cond_9

    const/4 p0, 0x0

    :cond_9
    iget-object p0, p0, Lor2;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/live_score/LivescoreSheetContentWrapper;

    invoke-virtual {p0}, Lgej;->e()V

    return-void
.end method

.method public final U(F)V
    .registers 3

    const/high16 v0, 0x437f0000    # 255.0f

    mul-float/2addr p1, v0

    float-to-int p1, p1

    rsub-int p1, p1, 0xff

    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, Llrc;

    iget-object p0, p0, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    if-eqz p0, :cond_15

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    :cond_15
    return-void
.end method

.method public final W()V
    .registers 1

    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, Llrc;

    iget-object p0, p0, Llrc;->B:Lor2;

    if-nez p0, :cond_9

    const/4 p0, 0x0

    :cond_9
    iget-object p0, p0, Lor2;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/live_score/LivescoreSheetContentWrapper;

    invoke-virtual {p0}, Lgej;->e()V

    return-void
.end method

.method public final a(Lk43;Z)V
    .registers 4

    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, Luwh;

    invoke-virtual {p0, p1, p2}, Luwh;->d(Lk43;Z)V

    iget-object v0, p0, Luwh;->b:Ld14;

    invoke-virtual {v0, p1}, Ld14;->b(Lk43;)V

    if-eqz p2, :cond_14

    const p2, 0x7fffffff

    invoke-virtual {p0, p1, p2}, Luwh;->a(Lk43;I)V

    :cond_14
    return-void
.end method

.method public final b(Lvaf;)Lcom/opera/android/bar/OmniButtonView;
    .registers 2

    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/EnumMap;

    invoke-virtual {p0, p1}, Ljava/util/EnumMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/bar/OmniButtonView;

    return-object p0
.end method

.method public final c()V
    .registers 2

    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, Lr9i;

    iget-object p0, p0, Lr9i;->e:Ljava/lang/Object;

    check-cast p0, Lppf;

    const-string v0, "loadAd: onAdImpression"

    invoke-virtual {p0, v0}, Lhnf;->a(Ljava/lang/String;)V

    iget-object p0, p0, Lhnf;->v:Lcom/google/android/gms/ads/mediation/MediationNativeAdCallback;

    if-eqz p0, :cond_14

    invoke-interface {p0}, Lcom/google/android/gms/ads/mediation/MediationAdCallback;->reportAdImpression()V

    :cond_14
    return-void
.end method

.method public final d()V
    .registers 2

    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, Lhld;

    iget-object p0, p0, Lhld;->c:Landroid/widget/LinearLayout;

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final e(Lcie;)V
    .registers 6

    new-instance v0, Lero;

    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, Ljsd;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-direct {v0, v1, v3, v2}, Lero;-><init>(Landroid/content/Context;Landroid/view/View;B)V

    invoke-virtual {p0, v0}, Ljsd;->a(Laoo;)V

    iget-object p0, p0, Ljsd;->a:Ljava/util/HashMap;

    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iput-object v0, p1, Lcie;->w0:Laoo;

    invoke-static {v0, p1}, Ljsd;->c(Laoo;Lcie;)V

    iget-object p0, v0, Lero;->v:Landroid/view/ViewGroup;

    check-cast p0, Ly46;

    iput-object p1, p0, Ly46;->b:Ljava/lang/Object;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result p1

    if-lez p1, :cond_2b

    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    :cond_2b
    iget-object p1, p0, Ly46;->b:Ljava/lang/Object;

    check-cast p1, Lcie;

    iget-object p1, p1, Lbzo;->d:Lw06;

    sget-object v0, Lw06;->i:Lw06;

    if-ne v0, p1, :cond_46

    new-instance v3, Ljjo;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {v3, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iget-object p1, p0, Ly46;->b:Ljava/lang/Object;

    check-cast p1, Lcie;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_53

    :cond_46
    sget-object v0, Lw06;->j:Lw06;

    if-ne v0, p1, :cond_53

    new-instance v3, Lkjo;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {v3, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    :cond_53
    :goto_53
    iput-object v3, p0, Ly46;->c:Ljava/lang/Object;

    if-nez v3, :cond_58

    return-void

    :cond_58
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    sget v0, Lg1p;->a:I

    invoke-interface {v3, p1}, Lfro;->a(Landroid/content/Context;)Landroid/view/View;

    move-result-object p1

    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p1, p0, Ly46;->c:Ljava/lang/Object;

    check-cast p1, Lfro;

    iget-object p0, p0, Ly46;->b:Ljava/lang/Object;

    check-cast p0, Lcie;

    invoke-interface {p1, p0}, Lfro;->e(Lcie;)V

    return-void
.end method

.method public final f(Z)V
    .registers 4

    sget-object p1, Lcs6;->c:Lnak;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    sget-object v1, Lxjc;->a:Lxjc;

    invoke-virtual {p1, v0, v1}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/live_score/LiveCommentaryService;

    invoke-virtual {p0}, Landroid/app/Service;->stopSelf()V

    return-void
.end method

.method public final g(Lcm;)V
    .registers 4

    iget-byte v0, p0, Lqfb;->a:B

    const-string v1, "loadAd: onAdFailedToLoad, error="

    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_54

    check-cast p0, Lr9i;

    iget-object p0, p0, Lr9i;->e:Ljava/lang/Object;

    check-cast p0, Lppf;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lhnf;->a(Ljava/lang/String;)V

    iget-boolean v0, p0, Lhnf;->y:Z

    if-nez v0, :cond_2f

    iget v0, p1, Lcm;->b:I

    iget-object p1, p1, Lcm;->c:Ljava/lang/String;

    invoke-static {v0, p1}, Lrm5;->q(ILjava/lang/String;)Lcom/google/android/gms/ads/AdError;

    move-result-object p1

    iget-object p0, p0, Lhnf;->t:Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;

    invoke-interface {p0, p1}, Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;->onFailure(Lcom/google/android/gms/ads/AdError;)V

    :cond_2f
    return-void

    :pswitch_30
    check-cast p0, Lghf;

    iget-object p0, p0, Lghf;->d:Ljava/lang/Object;

    check-cast p0, Lmpf;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lmpf;->a(Ljava/lang/String;)V

    iget v0, p1, Lcm;->b:I

    iget-object p1, p1, Lcm;->c:Ljava/lang/String;

    invoke-static {v0, p1}, Lrm5;->q(ILjava/lang/String;)Lcom/google/android/gms/ads/AdError;

    move-result-object p1

    iget-object p0, p0, Lmpf;->a:Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;

    invoke-interface {p0, p1}, Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;->onFailure(Lcom/google/android/gms/ads/AdError;)V

    return-void

    nop

    :pswitch_data_54
    .packed-switch 0x11
        :pswitch_30
    .end packed-switch
.end method

.method public final h(Lk43;)V
    .registers 3

    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, Luwh;

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Luwh;->d(Lk43;Z)V

    iget-object p0, p0, Luwh;->b:Ld14;

    invoke-virtual {p0, p1}, Ld14;->b(Lk43;)V

    return-void
.end method

.method public final i(Landroidx/fragment/app/r;)V
    .registers 4

    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, [Lubk;

    const/4 v0, 0x0

    :goto_5
    const/4 v1, 0x5

    if-ge v0, v1, :cond_10

    aget-object v1, p0, v0

    invoke-interface {v1, p1}, Lubk;->i(Landroidx/fragment/app/r;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    :cond_10
    return-void
.end method

.method public final j(Landroid/app/Notification;I)V
    .registers 6

    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/live_score/LiveCommentaryService;

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x22

    const/4 v2, 0x2

    if-lt v0, v1, :cond_f

    invoke-virtual {p0, p2, p1, v2}, Landroid/app/Service;->startForeground(ILandroid/app/Notification;I)V

    return-void

    :cond_f
    invoke-virtual {p0, p2, p1, v2}, Landroid/app/Service;->startForeground(ILandroid/app/Notification;I)V

    return-void
.end method

.method public final k(Ln82;Ljava/util/List;)V
    .registers 10

    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, Lyqa;

    iget-object p1, p0, Lyqa;->c:Ljava/lang/Object;

    check-cast p1, Luqe;

    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_15
    :goto_15
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4c

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Loqe;

    instance-of v2, v1, Lmsh;

    if-eqz v2, :cond_48

    move-object v2, v1

    check-cast v2, Lmsh;

    iget-object v3, p1, Luqe;->v:Lta7;

    invoke-virtual {v2}, Lmsh;->b()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3}, Lta7;->s()Landroid/content/SharedPreferences;

    move-result-object v3

    const-string v5, "blacklisted_news_domains"

    const/4 v6, 0x0

    invoke-static {v3, v5, v6}, Lw1h;->o(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v3

    if-nez v3, :cond_3d

    sget-object v3, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    :cond_3d
    invoke-interface {v3, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_15

    iget-object v3, p1, Luqe;->r:Ljava/util/Set;

    invoke-interface {v3, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_48
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_15

    :cond_4c
    iget-object p0, p0, Lyqa;->b:Ljava/lang/Object;

    check-cast p0, Llld;

    invoke-virtual {p0, v0}, Llld;->j0(Ljava/util/List;)V

    return-void
.end method

.method public final l(Lvci;[BB)V
    .registers 10

    const/16 v0, 0x80

    new-array v1, v0, [B

    const/16 v2, 0x20

    invoke-virtual {p1, v2, v2, p2}, Lgub;->g(II[B)V

    invoke-virtual {p1, p3}, Lgub;->a(B)V

    const/4 p2, 0x0

    invoke-virtual {p1, p2, v0, v1}, Lvci;->o(II[B)V

    move p1, p2

    :goto_11
    if-ge p1, v2, :cond_46

    shl-int/lit8 p3, p1, 0x2

    invoke-static {p3, v1}, Lsfe;->q0(I[B)I

    move-result p3

    const v0, 0x55555555

    and-int v3, p3, v0

    ushr-int/lit8 p3, p3, 0x1

    and-int/2addr p3, v0

    add-int/2addr v3, p3

    move p3, p2

    :goto_23
    const/16 v0, 0x8

    if-ge p3, v0, :cond_43

    shl-int/lit8 v0, p3, 0x2

    ushr-int v4, v3, v0

    and-int/lit8 v4, v4, 0x3

    int-to-short v4, v4

    add-int/lit8 v0, v0, 0x2

    ushr-int v0, v3, v0

    and-int/lit8 v0, v0, 0x3

    int-to-short v0, v0

    shl-int/lit8 v5, p1, 0x3

    add-int/2addr v5, p3

    sub-int/2addr v4, v0

    int-to-short v0, v4

    iget-object v4, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast v4, [S

    aput-short v0, v4, v5

    add-int/lit8 p3, p3, 0x1

    goto :goto_23

    :cond_43
    add-int/lit8 p1, p1, 0x1

    goto :goto_11

    :cond_46
    return-void
.end method

.method public final m(Landroidx/fragment/app/r;)V
    .registers 4

    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, [Lubk;

    const/4 v0, 0x0

    :goto_5
    const/4 v1, 0x5

    if-ge v0, v1, :cond_10

    aget-object v1, p0, v0

    invoke-interface {v1, p1}, Lubk;->m(Landroidx/fragment/app/r;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    :cond_10
    return-void
.end method

.method public final n(JZ)V
    .registers 6

    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, [Lubk;

    const/4 v0, 0x0

    :goto_5
    const/4 v1, 0x5

    if-ge v0, v1, :cond_10

    aget-object v1, p0, v0

    invoke-interface {v1, p1, p2, p3}, Lubk;->n(JZ)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    :cond_10
    return-void
.end method

.method public final n0(F)V
    .registers 2

    return-void
.end method

.method public final o(Lvci;[BB)V
    .registers 9

    const/16 v0, 0xc0

    new-array v1, v0, [B

    const/16 v2, 0x20

    invoke-virtual {p1, v2, v2, p2}, Lgub;->g(II[B)V

    invoke-virtual {p1, p3}, Lgub;->a(B)V

    const/4 p2, 0x0

    invoke-virtual {p1, p2, v0, v1}, Lvci;->o(II[B)V

    move p1, p2

    :goto_11
    const/16 p3, 0x40

    if-ge p1, p3, :cond_5d

    mul-int/lit8 p3, p1, 0x3

    aget-byte v0, v1, p3

    and-int/lit16 v0, v0, 0xff

    add-int/lit8 v2, p3, 0x1

    aget-byte v2, v1, v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x8

    or-int/2addr v0, v2

    add-int/lit8 p3, p3, 0x2

    aget-byte p3, v1, p3

    and-int/lit16 p3, p3, 0xff

    shl-int/lit8 p3, p3, 0x10

    or-int/2addr v0, p3

    const p3, 0x249249

    and-int v2, v0, p3

    ushr-int/lit8 v3, v0, 0x1

    and-int/2addr v3, p3

    add-int/2addr v2, v3

    ushr-int/lit8 v0, v0, 0x2

    and-int/2addr v0, p3

    add-int/2addr v2, v0

    move p3, p2

    :goto_3b
    const/4 v0, 0x4

    if-ge p3, v0, :cond_5a

    mul-int/lit8 v0, p3, 0x6

    ushr-int v3, v2, v0

    and-int/lit8 v3, v3, 0x7

    int-to-short v3, v3

    add-int/lit8 v0, v0, 0x3

    ushr-int v0, v2, v0

    and-int/lit8 v0, v0, 0x7

    int-to-short v0, v0

    shl-int/lit8 v4, p1, 0x2

    add-int/2addr v4, p3

    sub-int/2addr v3, v0

    int-to-short v0, v3

    iget-object v3, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast v3, [S

    aput-short v0, v3, v4

    add-int/lit8 p3, p3, 0x1

    goto :goto_3b

    :cond_5a
    add-int/lit8 p1, p1, 0x1

    goto :goto_11

    :cond_5d
    return-void
.end method

.method public final onAdClicked()V
    .registers 2

    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, Lr9i;

    iget-object p0, p0, Lr9i;->e:Ljava/lang/Object;

    check-cast p0, Lppf;

    const-string v0, "loadAd: onAdClicked"

    invoke-virtual {p0, v0}, Lhnf;->a(Ljava/lang/String;)V

    iget-object p0, p0, Lhnf;->v:Lcom/google/android/gms/ads/mediation/MediationNativeAdCallback;

    if-eqz p0, :cond_14

    invoke-interface {p0}, Lcom/google/android/gms/ads/mediation/MediationAdCallback;->reportAdClicked()V

    :cond_14
    return-void
.end method

.method public final onAdLoaded(Ljava/lang/Object;)V
    .registers 7

    iget-byte v0, p0, Lqfb;->a:B

    const-string v1, "loadAd: onAdLoaded"

    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_11a

    check-cast p1, Lbie;

    check-cast p0, Lr9i;

    iget-object v0, p0, Lr9i;->e:Ljava/lang/Object;

    check-cast v0, Lppf;

    invoke-virtual {v0, v1}, Lhnf;->a(Ljava/lang/String;)V

    iget-boolean v1, v0, Lhnf;->y:Z

    if-eqz v1, :cond_1d

    invoke-virtual {p1}, Lbie;->d()V

    goto/16 :goto_100

    :cond_1d
    iput-object p1, v0, Lhnf;->w:Lbie;

    new-instance v1, Lksd;

    iget-object p0, p0, Lr9i;->c:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-direct {v1, p0}, Lksd;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Lhnf;->x:Lksd;

    invoke-virtual {p1}, Lbie;->b()Lo7p;

    move-result-object p0

    invoke-virtual {p0}, Lo7p;->j()Lc4p;

    move-result-object p0

    const/4 v1, 0x0

    if-eqz p0, :cond_3e

    iget-object p0, p0, Lc4p;->i:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    goto :goto_3f

    :cond_3e
    move-object p0, v1

    :goto_3f
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_48

    invoke-virtual {v0, p0}, Lcom/google/android/gms/ads/mediation/NativeAdMapper;->setHeadline(Ljava/lang/String;)V

    :cond_48
    iget-object p0, p1, Lbie;->e:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqhe;

    if-eqz p0, :cond_5a

    new-instance v2, Lfnf;

    invoke-direct {v2, p0}, Lfnf;-><init>(Lqhe;)V

    invoke-virtual {v0, v2}, Lcom/google/android/gms/ads/mediation/NativeAdMapper;->setIcon(Lcom/google/android/gms/ads/nativead/NativeAd$Image;)V

    :cond_5a
    invoke-virtual {p1}, Lbie;->c()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_67

    invoke-virtual {v0, p0}, Lcom/google/android/gms/ads/mediation/NativeAdMapper;->setBody(Ljava/lang/String;)V

    :cond_67
    invoke-virtual {p1}, Lbie;->b()Lo7p;

    move-result-object p0

    invoke-virtual {p0}, Lo7p;->j()Lc4p;

    move-result-object p0

    if-eqz p0, :cond_7a

    iget-object p0, p0, Lc4p;->n:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    goto :goto_7b

    :cond_7a
    move-object p0, v1

    :goto_7b
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_84

    invoke-virtual {v0, p0}, Lcom/google/android/gms/ads/mediation/NativeAdMapper;->setCallToAction(Ljava/lang/String;)V

    :cond_84
    invoke-virtual {p1}, Lbie;->f()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_91

    invoke-virtual {v0, p0}, Lcom/google/android/gms/ads/mediation/NativeAdMapper;->setAdvertiser(Ljava/lang/String;)V

    :cond_91
    invoke-virtual {p1}, Lbie;->b()Lo7p;

    move-result-object p0

    invoke-virtual {p0}, Lo7p;->j()Lc4p;

    move-result-object p0

    if-eqz p0, :cond_a4

    iget-object p0, p0, Lc4p;->m:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    move-object v1, p0

    check-cast v1, Ljava/lang/Double;

    :cond_a4
    if-eqz v1, :cond_a9

    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/mediation/NativeAdMapper;->setStarRating(Ljava/lang/Double;)V

    :cond_a9
    iget-object p0, v0, Lhnf;->x:Lksd;

    if-eqz p0, :cond_b0

    invoke-virtual {v0, p0}, Lcom/google/android/gms/ads/mediation/NativeAdMapper;->setMediaView(Landroid/view/View;)V

    :cond_b0
    const/4 p0, 0x1

    invoke-virtual {v0, p0}, Lcom/google/android/gms/ads/mediation/NativeAdMapper;->setOverrideClickHandling(Z)V

    invoke-static {}, Lcom/google/android/gms/ads/MobileAds;->getVersion()Lcom/google/android/gms/ads/VersionInfo;

    move-result-object p1

    new-instance v1, Lcom/google/android/gms/ads/VersionInfo;

    const/4 v2, 0x4

    const/4 v3, 0x0

    const/16 v4, 0x18

    invoke-direct {v1, v4, v2, v3}, Lcom/google/android/gms/ads/VersionInfo;-><init>(III)V

    invoke-virtual {p1}, Lcom/google/android/gms/ads/VersionInfo;->getMajorVersion()I

    move-result v2

    invoke-virtual {v1}, Lcom/google/android/gms/ads/VersionInfo;->getMajorVersion()I

    move-result v3

    if-gt v2, v3, :cond_f3

    invoke-virtual {p1}, Lcom/google/android/gms/ads/VersionInfo;->getMajorVersion()I

    move-result v2

    invoke-virtual {v1}, Lcom/google/android/gms/ads/VersionInfo;->getMajorVersion()I

    move-result v3

    if-ne v2, v3, :cond_f6

    invoke-virtual {p1}, Lcom/google/android/gms/ads/VersionInfo;->getMinorVersion()I

    move-result v2

    invoke-virtual {v1}, Lcom/google/android/gms/ads/VersionInfo;->getMinorVersion()I

    move-result v3

    if-gt v2, v3, :cond_f3

    invoke-virtual {p1}, Lcom/google/android/gms/ads/VersionInfo;->getMinorVersion()I

    move-result v2

    invoke-virtual {v1}, Lcom/google/android/gms/ads/VersionInfo;->getMinorVersion()I

    move-result v3

    if-ne v2, v3, :cond_f6

    invoke-virtual {p1}, Lcom/google/android/gms/ads/VersionInfo;->getMicroVersion()I

    move-result p1

    invoke-virtual {v1}, Lcom/google/android/gms/ads/VersionInfo;->getMicroVersion()I

    move-result v1

    if-lt p1, v1, :cond_f6

    :cond_f3
    invoke-virtual {v0, p0}, Lcom/google/android/gms/ads/mediation/NativeAdMapper;->setOverrideImpressionRecording(Z)V

    :cond_f6
    iget-object p0, v0, Lhnf;->t:Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;

    invoke-interface {p0, v0}, Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;->onSuccess(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/ads/mediation/MediationNativeAdCallback;

    iput-object p0, v0, Lhnf;->v:Lcom/google/android/gms/ads/mediation/MediationNativeAdCallback;

    :goto_100
    return-void

    :pswitch_101
    check-cast p1, Lvt1;

    check-cast p0, Lghf;

    iget-object p0, p0, Lghf;->d:Ljava/lang/Object;

    check-cast p0, Lmpf;

    invoke-virtual {p0, v1}, Lmpf;->a(Ljava/lang/String;)V

    iput-object p1, p0, Lmpf;->d:Lvt1;

    iget-object p1, p0, Lmpf;->a:Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;

    invoke-interface {p1, p0}, Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;->onSuccess(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/ads/mediation/MediationAppOpenAdCallback;

    iput-object p1, p0, Lmpf;->c:Lcom/google/android/gms/ads/mediation/MediationAppOpenAdCallback;

    return-void

    nop

    :pswitch_data_11a
    .packed-switch 0x11
        :pswitch_101
    .end packed-switch
.end method

.method public final p()J
    .registers 7

    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, Landroid/widget/Magnifier;

    invoke-virtual {p0}, Landroid/widget/Magnifier;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/widget/Magnifier;->getHeight()I

    move-result p0

    int-to-long v0, v0

    const/16 v2, 0x20

    shl-long/2addr v0, v2

    int-to-long v2, p0

    const-wide v4, 0xffffffffL

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    return-wide v0
.end method

.method public final q()Lneb;
    .registers 2

    new-instance v0, Lwve;

    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, Lorg/chromium/device/nfc/NfcDelegate;

    invoke-direct {v0, p0}, Lwve;-><init>(Lorg/chromium/device/nfc/NfcDelegate;)V

    return-object v0
.end method

.method public final r(F)Z
    .registers 3

    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-nez v0, :cond_7

    const/4 p0, 0x0

    return p0

    :cond_7
    invoke-virtual {p0}, Lqfb;->t()V

    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/core/widget/NestedScrollView;

    float-to-int p1, p1

    invoke-virtual {p0, p1}, Landroidx/core/widget/NestedScrollView;->n(I)V

    const/4 p0, 0x1

    return p0
.end method

.method public final s()F
    .registers 1

    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/core/widget/NestedScrollView;

    invoke-virtual {p0}, Landroidx/core/widget/NestedScrollView;->q()F

    move-result p0

    neg-float p0, p0

    return p0
.end method

.method public final setEnabled(Z)V
    .registers 4

    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, [Lubk;

    const/4 v0, 0x0

    :goto_5
    const/4 v1, 0x5

    if-ge v0, v1, :cond_10

    aget-object v1, p0, v0

    invoke-interface {v1, p1}, Lubk;->setEnabled(Z)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    :cond_10
    return-void
.end method

.method public final show(I)V
    .registers 3

    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, Lhld;

    iget-object v0, p0, Lhld;->b:Lcom/opera/android/custom_views/VerticalSeekBar;

    invoke-virtual {v0, p1}, Landroid/widget/ProgressBar;->setProgress(I)V

    iget-object p0, p0, Lhld;->c:Landroid/widget/LinearLayout;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final t()V
    .registers 1

    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/core/widget/NestedScrollView;

    iget-object p0, p0, Landroidx/core/widget/NestedScrollView;->d:Landroid/widget/OverScroller;

    invoke-virtual {p0}, Landroid/widget/OverScroller;->abortAnimation()V

    return-void
.end method

.method public final toString()Ljava/lang/String;
    .registers 2

    iget-byte v0, p0, Lqfb;->a:B

    packed-switch v0, :pswitch_data_14

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_a
    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, Lkotlinx/serialization/json/c;

    invoke-virtual {p0}, Lkotlinx/serialization/json/c;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_14
    .packed-switch 0x2
        :pswitch_a
    .end packed-switch
.end method

.method public final u(Ljava/util/List;)V
    .registers 19

    move-object/from16 v0, p0

    iget-object v0, v0, Lqfb;->b:Ljava/lang/Object;

    check-cast v0, Lmxb;

    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    new-instance v2, Li72;

    new-instance v3, Ltcd;

    const/4 v4, 0x1

    move-object/from16 v5, p1

    invoke-direct {v3, v5, v4}, Ltcd;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v2, v3}, Li72;-><init>(Ltcd;)V

    :cond_18
    invoke-virtual {v2}, Li72;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_52

    invoke-virtual {v2}, Li72;->removeLast()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Li8e;

    invoke-virtual {v1, v3}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_18

    iget-object v3, v3, Li8e;->e:Ljava/util/ArrayList;

    new-instance v4, Lr1i;

    invoke-direct {v4, v3}, Lr1i;-><init>(Ljava/util/List;)V

    invoke-virtual {v4}, Lr1i;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_35
    :goto_35
    move-object v4, v3

    check-cast v4, Lq1i;

    iget-object v4, v4, Lq1i;->b:Ljava/lang/Object;

    check-cast v4, Ljava/util/ListIterator;

    invoke-interface {v4}, Ljava/util/ListIterator;->hasPrevious()Z

    move-result v5

    if-eqz v5, :cond_18

    invoke-interface {v4}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Li8e;

    invoke-virtual {v1, v4}, Ljava/util/AbstractCollection;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_35

    invoke-virtual {v2, v4}, Li72;->addLast(Ljava/lang/Object;)V

    goto :goto_35

    :cond_52
    iget-object v2, v0, Lmxb;->d:Lg77;

    iget-object v3, v2, Lg77;->c:Ljava/lang/Object;

    check-cast v3, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_5c
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_14b

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Li8e;

    iget-object v6, v5, Li8e;->c:Ljava/util/LinkedHashMap;

    invoke-virtual {v6}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_72
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_125

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map$Entry;

    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lvab;

    iget-object v9, v7, Lvab;->a:Lqc3;

    iget-object v10, v2, Lg77;->a:Ljava/lang/Object;

    check-cast v10, Lmxb;

    iget-object v11, v2, Lg77;->b:Ljava/lang/Object;

    check-cast v11, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v11, v8}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lvab;

    const-string v14, "\' -> \'"

    if-eqz v12, :cond_fe

    iget-object v12, v10, Lmxb;->a:Ln1;

    new-instance v15, Ljava/lang/StringBuilder;

    const-string v13, "(+) override index \'"

    invoke-direct {v15, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v13, 0x27

    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v15, Ltbc;->c:Ltbc;

    move-object/from16 v16, v1

    iget-object v1, v12, Ln1;->b:Ljava/lang/Object;

    check-cast v1, Ltbc;

    invoke-virtual {v1, v15}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v1

    if-gtz v1, :cond_cd

    invoke-virtual {v12, v15, v13}, Ln1;->Z(Ltbc;Ljava/lang/String;)V

    :cond_cd
    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_d7
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_ed

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    move-object v13, v12

    check-cast v13, Ltlj;

    iget-object v13, v13, Lvab;->a:Lqc3;

    invoke-virtual {v13, v9}, Lqc3;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_d7

    goto :goto_ee

    :cond_ed
    const/4 v12, 0x0

    :goto_ee
    check-cast v12, Ltlj;

    if-eqz v12, :cond_100

    invoke-virtual {v9}, Lqc3;->hashCode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_100

    :cond_fe
    move-object/from16 v16, v1

    :cond_100
    :goto_100
    iget-object v1, v10, Lmxb;->a:Ln1;

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v12, "(+) index \'"

    invoke-direct {v10, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v13, 0x27

    invoke-virtual {v10, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v1, v9}, Ln1;->Y(Ljava/lang/String;)V

    invoke-virtual {v11, v8, v7}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object/from16 v1, v16

    goto/16 :goto_72

    :cond_125
    move-object/from16 v16, v1

    iget-object v1, v5, Li8e;->b:Ljava/util/LinkedHashSet;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_12d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_147

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ltlj;

    iget-object v6, v5, Lvab;->a:Lqc3;

    invoke-virtual {v6}, Lqc3;->hashCode()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v3, v6, v5}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_12d

    :cond_147
    move-object/from16 v1, v16

    goto/16 :goto_5c

    :cond_14b
    move-object/from16 v16, v1

    iget-object v0, v0, Lmxb;->c:Lc37;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface/range {v16 .. v16}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_156
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Li8e;

    iget-object v3, v0, Lc37;->a:Ljava/lang/Object;

    check-cast v3, Ljava/util/Set;

    iget-object v2, v2, Li8e;->d:Ljava/util/LinkedHashSet;

    invoke-interface {v3, v2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    goto :goto_156

    :cond_16c
    return-void
.end method

.method public final v(Ljava/lang/CharSequence;Lxdg;)Z
    .registers 5

    iget-object p2, p2, Lxdg;->c:Ljava/lang/String;

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1b

    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, Lqie;

    invoke-virtual {p0, p2}, Lqie;->r(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->lookingAt()Z

    move-result p1

    if-nez p1, :cond_1c

    :cond_1b
    return v1

    :cond_1c
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    move-result p0

    if-eqz p0, :cond_24

    const/4 p0, 0x1

    return p0

    :cond_24
    return v1
.end method

.method public final w(Ln82;)V
    .registers 2

    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, Lyqa;

    iget-object p0, p0, Lyqa;->b:Ljava/lang/Object;

    check-cast p0, Llld;

    invoke-virtual {p0}, Llld;->b()V

    return-void
.end method

.method public final x(Ljava/util/List;)V
    .registers 7

    iget-object v0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast v0, Lmxb;

    iget-object v1, v0, Lmxb;->a:Ln1;

    sget-object v2, Ltbc;->b:Ltbc;

    iget-object v1, v1, Ln1;->b:Ljava/lang/Object;

    check-cast v1, Ltbc;

    invoke-virtual {v1, v2}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v1

    if-gtz v1, :cond_5a

    sget-object v1, Ltpl;->a:Ltpl;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Lf9e;->a:Lf9e;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lf9e;->b()J

    move-result-wide v3

    invoke-virtual {p0, p1}, Lqfb;->u(Ljava/util/List;)V

    invoke-static {v3, v4}, Lspl;->b(J)J

    move-result-wide p0

    iget-object v1, v0, Lmxb;->d:Lg77;

    iget-object v1, v1, Lg77;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    move-result v1

    iget-object v0, v0, Lmxb;->a:Ln1;

    const-string v3, "Started "

    const-string v4, " definitions in "

    invoke-static {v1, v3, v4}, Lp3p;->o(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v3, Lpn7;->b:Lon7;

    sget-object v3, Lun7;->c:Lun7;

    invoke-static {p0, p1, v3}, Lpn7;->p(JLun7;)J

    move-result-wide p0

    long-to-double p0, p0

    const-wide v3, 0x408f400000000000L    # 1000.0

    div-double/2addr p0, v3

    invoke-virtual {v1, p0, p1}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string p0, " ms"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, v2, p0}, Ln1;->Z(Ltbc;Ljava/lang/String;)V

    return-void

    :cond_5a
    invoke-virtual {p0, p1}, Lqfb;->u(Ljava/util/List;)V

    return-void
.end method

.method public final y(Landroidx/recyclerview/widget/i;Lfr;Lfr;)V
    .registers 11

    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/i;->setIsRecyclable(Z)V

    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->M:Landroidx/recyclerview/widget/e;

    move-object v1, v0

    check-cast v1, Lxkj;

    if-eqz p2, :cond_28

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v3, p2, Lfr;->b:I

    iget v5, p3, Lfr;->b:I

    if-ne v3, v5, :cond_1e

    iget v0, p2, Lfr;->c:I

    iget v2, p3, Lfr;->c:I

    if-eq v0, v2, :cond_28

    :cond_1e
    iget v4, p2, Lfr;->c:I

    iget v6, p3, Lfr;->c:I

    move-object v2, p1

    invoke-virtual/range {v1 .. v6}, Lxkj;->m(Landroidx/recyclerview/widget/i;IIII)Z

    move-result p1

    goto :goto_2d

    :cond_28
    move-object v2, p1

    invoke-virtual {v1, v2}, Lxkj;->k(Landroidx/recyclerview/widget/i;)Z

    move-result p1

    :goto_2d
    if-eqz p1, :cond_32

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->j0()V

    :cond_32
    return-void
.end method

.method public final z(Lo93;Lmim;)I
    .registers 4

    instance-of v0, p1, Lken;

    if-eqz v0, :cond_f

    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, Li7d;

    iget-object p0, p0, Li7d;->n:Lqm9;

    invoke-virtual {p0, p1, p2}, Lqm9;->z(Lo93;Lmim;)I

    move-result p0

    return p0

    :cond_f
    const/4 p0, 0x3

    return p0
.end method
