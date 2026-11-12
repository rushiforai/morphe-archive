.class public abstract Lr22;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkrn;


# instance fields
.field public final a:Ljava/lang/Object;

.field public final b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 107
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lr22;->a:Ljava/lang/Object;

    .line 108
    new-instance v0, Ltod;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Ltod;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lr22;->b:Ljava/lang/Object;

    .line 109
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lr22;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lqtm;Ld93;)V
    .registers 4

    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 99
    iput-object p2, p0, Lr22;->a:Ljava/lang/Object;

    .line 100
    iput-object p3, p0, Lr22;->b:Ljava/lang/Object;

    .line 101
    invoke-static {p1}, Lv1;->u(Landroid/content/Context;)Lv1;

    move-result-object p1

    iput-object p1, p0, Lr22;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lcom/opera/android/bar/BottomBar;Lw6j;)V
    .registers 12

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lr22;->a:Ljava/lang/Object;

    new-instance v0, Lpde;

    new-instance v1, Lnp3;

    invoke-virtual {p2}, Lcom/opera/android/bar/BottomBar;->c()I

    move-result v2

    invoke-virtual {p2}, Lcom/opera/android/bar/BottomBar;->c()I

    move-result v3

    iget-object v4, p2, Lcom/opera/android/bar/BottomBar;->g:Landroid/view/View;

    const/4 v5, 0x0

    if-eqz v4, :cond_33

    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    move-result v4

    if-nez v4, :cond_33

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    const v6, 0x7f040a4c

    invoke-static {v6, v4, v5}, Lf03;->w(ILandroid/content/Context;I)I

    move-result v6

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-static {v7, v4}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v4

    add-int/2addr v4, v6

    goto :goto_34

    :cond_33
    move v4, v5

    :goto_34
    add-int/2addr v4, v3

    invoke-direct {v1, v2, v4}, Lnp3;-><init>(II)V

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lr22;->b:Ljava/lang/Object;

    new-instance v0, Lbp;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lr22;->c:Ljava/lang/Object;

    iget-object p3, p3, Lw6j;->c:Ljava/lang/Object;

    check-cast p3, Lpde;

    new-instance v0, Loo3;

    invoke-direct {v0, p0, v5}, Loo3;-><init>(Lr22;B)V

    invoke-virtual {p3, p1, v0}, Lekc;->j(Lndc;Lf7f;)V

    iget-object p2, p2, Lcom/opera/android/bar/BottomBar;->p:Lkze;

    new-instance p3, Loo3;

    const/4 v0, 0x1

    invoke-direct {p3, p0, v0}, Loo3;-><init>(Lr22;B)V

    invoke-virtual {p2, p1, p3}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5

    .line 92
    iput-object p1, p0, Lr22;->a:Ljava/lang/Object;

    iput-object p2, p0, Lr22;->b:Ljava/lang/Object;

    iput-object p3, p0, Lr22;->c:Ljava/lang/Object;

    iput-object p4, p0, Lr22;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lqim;)V
    .registers 3

    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 94
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lr22;->a:Ljava/lang/Object;

    .line 95
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lr22;->b:Ljava/lang/Object;

    .line 96
    iput-object p1, p0, Lr22;->c:Ljava/lang/Object;

    .line 97
    new-instance p1, Lz4k;

    const/16 v0, 0x9

    invoke-direct {p1, p0, v0}, Lz4k;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lr22;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lx22;Lmrn;Lnrl;Lkotlin/jvm/functions/Function1;)V
    .registers 5

    .line 102
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lr22;->d:Ljava/lang/Object;

    .line 103
    iput-object p2, p0, Lr22;->a:Ljava/lang/Object;

    .line 104
    iput-object p3, p0, Lr22;->b:Ljava/lang/Object;

    .line 105
    iput-object p4, p0, Lr22;->c:Ljava/lang/Object;

    return-void
.end method

.method public static p(Lr22;ZI)V
    .registers 5

    iget-object v0, p0, Lr22;->b:Ljava/lang/Object;

    check-cast v0, Lnrl;

    iget-object v0, v0, Lnrl;->b:Ljava/lang/Object;

    check-cast v0, Lrvg;

    iget-object v0, v0, Lrvg;->b:Landroid/view/ViewGroup;

    check-cast v0, Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    int-to-float v0, v0

    and-int/lit8 p2, p2, 0x2

    if-eqz p2, :cond_1f

    iget-object p1, p0, Lr22;->a:Ljava/lang/Object;

    check-cast p1, Lmrn;

    iget-object p1, p1, Lmrn;->j:Lcom/opera/android/custom_views/OperaEditText;

    invoke-virtual {p1}, Landroid/view/View;->hasFocus()Z

    move-result p1

    :cond_1f
    invoke-virtual {p0}, Lr22;->h()Ls62;

    move-result-object p2

    iget-object p0, p0, Lr22;->a:Ljava/lang/Object;

    check-cast p0, Lmrn;

    iget-object p0, p0, Lmrn;->m:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    sget-object v1, Lfan;->a:Landroid/graphics/Rect;

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v0, p0

    float-to-int p0, v0

    int-to-long v0, p0

    iget-object p0, p2, Ls62;->q:Lpde;

    new-instance p2, Lr52;

    invoke-direct {p2, v0, v1, p1}, Lr52;-><init>(JZ)V

    invoke-static {p0, p2}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public A(Lmid;)V
    .registers 2

    return-void
.end method

.method public B()V
    .registers 1

    return-void
.end method

.method public C(J)V
    .registers 3

    return-void
.end method

.method public D(F)V
    .registers 2

    return-void
.end method

.method public E(Lyjh;)V
    .registers 2

    return-void
.end method

.method public F(Lyjh;)V
    .registers 2

    return-void
.end method

.method public G(I)V
    .registers 2

    return-void
.end method

.method public H(I)V
    .registers 2

    return-void
.end method

.method public I()V
    .registers 1

    return-void
.end method

.method public J()V
    .registers 1

    return-void
.end method

.method public K(J)V
    .registers 3

    return-void
.end method

.method public L()V
    .registers 1

    return-void
.end method

.method public M(I)V
    .registers 3

    iget-object v0, p0, Lr22;->a:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/bar/BottomBar;

    invoke-virtual {v0, p1}, Lcom/opera/android/bar/BottomBar;->l(I)V

    iget-object p1, v0, Lcom/opera/android/bar/BottomBar;->q:Latj;

    if-eqz p1, :cond_20

    iget-object p1, p1, Latj;->b:Lpde;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_20

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lekc;->r(Ljava/lang/Object;)V

    :cond_20
    invoke-virtual {p0}, Lr22;->P()V

    return-void
.end method

.method public N(Lap3;)V
    .registers 3

    iget-object p0, p0, Lr22;->a:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/bar/BottomBar;

    iget-object v0, p0, Lcom/opera/android/bar/BottomBar;->c:Lap3;

    invoke-virtual {p1, v0}, Lap3;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_24

    iput-object p1, p0, Lcom/opera/android/bar/BottomBar;->c:Lap3;

    iget-object v0, p1, Lap3;->a:Lzo3;

    iget v0, v0, Lzo3;->a:I

    invoke-virtual {p0, v0}, Lcom/opera/android/bar/BottomBar;->a(I)V

    iget-boolean p1, p1, Lap3;->c:Z

    invoke-virtual {p0, p1}, Lcom/opera/android/bar/BottomBar;->b(Z)V

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    iget-object p0, p0, Lcom/opera/android/bar/BottomBar;->b:Lc1f;

    if-eqz p0, :cond_24

    invoke-virtual {p0}, Lc1f;->e()V

    :cond_24
    return-void
.end method

.method public O()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final P()V
    .registers 10

    iget-object v0, p0, Lr22;->b:Ljava/lang/Object;

    check-cast v0, Lpde;

    new-instance v1, Lnp3;

    iget-object v2, p0, Lr22;->a:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/bar/BottomBar;

    invoke-virtual {v2}, Lcom/opera/android/bar/BottomBar;->c()I

    move-result v3

    invoke-virtual {v2}, Lcom/opera/android/bar/BottomBar;->c()I

    move-result v4

    iget-object v5, v2, Lcom/opera/android/bar/BottomBar;->g:Landroid/view/View;

    const/4 v6, 0x0

    if-eqz v5, :cond_34

    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    move-result v5

    if-nez v5, :cond_34

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    const v7, 0x7f040a4c

    invoke-static {v7, v5, v6}, Lf03;->w(ILandroid/content/Context;I)I

    move-result v7

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-static {v8, v5}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v5

    add-int/2addr v5, v7

    goto :goto_35

    :cond_34
    move v5, v6

    :goto_35
    add-int/2addr v5, v4

    invoke-direct {v1, v3, v5}, Lnp3;-><init>(II)V

    invoke-static {v0, v1}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    iget-object p0, p0, Lr22;->d:Ljava/lang/Object;

    check-cast p0, Lpt3;

    if-eqz p0, :cond_70

    invoke-virtual {v2}, Lcom/opera/android/bar/BottomBar;->f()I

    move-result v0

    iget-object p0, p0, Lpt3;->b:Lcom/opera/android/BrowserActivity;

    iget-object v1, p0, Lcom/opera/android/BrowserActivity;->L:Lc37;

    const/4 v2, 0x0

    if-nez v1, :cond_4e

    move-object v1, v2

    :cond_4e
    iget-object v3, p0, Lcom/opera/android/BrowserActivity;->I:Lr22;

    if-nez v3, :cond_53

    move-object v3, v2

    :cond_53
    iget-object v3, v3, Lr22;->b:Ljava/lang/Object;

    check-cast v3, Lpde;

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lnp3;

    iget v3, v3, Lnp3;->b:I

    if-lt v0, v3, :cond_62

    const/4 v6, 0x1

    :cond_62
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iget-object v1, v1, Lc37;->a:Ljava/lang/Object;

    check-cast v1, Lnak;

    invoke-virtual {v1, v2, v0}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->j0()V

    :cond_70
    return-void
.end method

.method public final a(Ljjm;)V
    .registers 3

    invoke-interface {p1}, Ljjm;->getDefaultPriority()Lijm;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method

.method public final b(Ljjm;Lijm;)V
    .registers 3

    invoke-virtual {p0, p2}, Lr22;->e(Lijm;)Ljava/util/ArrayDeque;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/util/ArrayDeque;->offer(Ljava/lang/Object;)Z

    iget-object p2, p0, Lr22;->d:Ljava/lang/Object;

    check-cast p2, Lz4k;

    invoke-interface {p1, p2}, Ljjm;->setRequestDismisser(Lkjm;)V

    iget-object p0, p0, Lr22;->c:Ljava/lang/Object;

    check-cast p0, Lqim;

    invoke-virtual {p0}, Lqim;->a()V

    return-void
.end method

.method public c()Landroid/net/Uri$Builder;
    .registers 6

    invoke-static {}, Lc26;->q()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lr22;->d:Ljava/lang/Object;

    iget-object v0, p0, Lr22;->b:Ljava/lang/Object;

    check-cast v0, Ld93;

    iget-object v1, v0, Ld93;->a:Lyla;

    iget-object v1, v1, Lyla;->a:Ljava/net/URL;

    new-instance v2, Landroid/net/Uri$Builder;

    invoke-direct {v2}, Landroid/net/Uri$Builder;-><init>()V

    invoke-virtual {v1}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/net/URL;->getAuthority()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/net/Uri$Builder;->encodedAuthority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Landroid/net/Uri$Builder;->encodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v3, "product"

    const-string v4, "opera"

    invoke-virtual {v1, v3, v4}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    iget-wide v3, v0, Ld93;->b:J

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    const-string v4, "features"

    invoke-virtual {v1, v4, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    iget-object v3, p0, Lr22;->d:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    const-string v4, "ac"

    invoke-virtual {v1, v4, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v3

    invoke-static {v3}, Lsfe;->b0(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "lang"

    invoke-virtual {v1, v4, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    iget-object v3, p0, Lr22;->c:Ljava/lang/Object;

    check-cast v3, Lv1;

    invoke-virtual {v3}, Lv1;->x()Ljava/lang/String;

    move-result-object v3

    const-string v4, "abgroup"

    invoke-virtual {v1, v4, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    iget-object v0, v0, Ld93;->c:Ljava/lang/String;

    if-eqz v0, :cond_6d

    const-string v1, "config_bundle"

    invoke-virtual {v2, v1, v0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    :cond_6d
    iget-object p0, p0, Lr22;->a:Ljava/lang/Object;

    check-cast p0, Lqtm;

    if-eqz p0, :cond_7c

    iget-object p0, p0, Lqtm;->d:Ljava/lang/String;

    if-eqz p0, :cond_7c

    const-string v0, "uid"

    invoke-virtual {v2, v0, p0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    :cond_7c
    return-object v2
.end method

.method public d(Lrsg;)Lno3;
    .registers 4

    iget-boolean p0, p1, Lrsg;->b:Z

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p0, :cond_c

    iget-boolean p0, p1, Lrsg;->c:Z

    if-eqz p0, :cond_c

    move p0, v1

    goto :goto_d

    :cond_c
    move p0, v0

    :goto_d
    new-instance p1, Lno3;

    xor-int/2addr p0, v1

    invoke-direct {p1, v1, v0, p0}, Lno3;-><init>(ZZZ)V

    return-object p1
.end method

.method public final e(Lijm;)Ljava/util/ArrayDeque;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_15

    const/4 v0, 0x1

    if-ne p1, v0, :cond_e

    iget-object p0, p0, Lr22;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayDeque;

    return-object p0

    :cond_e
    new-instance p0, Ljava/lang/RuntimeException;

    const/4 p1, 0x0

    invoke-direct {p0, p1, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p0

    :cond_15
    iget-object p0, p0, Lr22;->a:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayDeque;

    return-object p0
.end method

.method public final f(Ltc2;)V
    .registers 6

    iget-object v0, p0, Lr22;->a:Ljava/lang/Object;

    check-cast v0, Lmrn;

    iget-boolean v1, p1, Ltc2;->a:Z

    if-eqz v1, :cond_15

    invoke-virtual {p0}, Lr22;->g()Lvsn;

    move-result-object v1

    iget-object v1, v1, Lvsn;->c:Ls62;

    invoke-virtual {v1}, Ls62;->f()Lqyj;

    move-result-object v1

    invoke-virtual {v1}, Lqyj;->f()V

    :cond_15
    sget-object v1, Ldrn;->b:Ldrn;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_28

    invoke-virtual {p0}, Lr22;->g()Lvsn;

    move-result-object p0

    invoke-virtual {p0}, Lvsn;->g()V

    invoke-virtual {v0}, Lmrn;->g()V

    return-void

    :cond_28
    sget-object v1, Ldrn;->c:Ldrn;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3c

    invoke-virtual {p0}, Lr22;->g()Lvsn;

    move-result-object p0

    iget-object p0, p0, Lvsn;->k:Lg7m;

    sget-object p1, Ll60;->h:Ll60;

    invoke-virtual {p0, p1}, Lg7m;->c(Ll60;)V

    return-void

    :cond_3c
    sget-object v1, Ldrn;->d:Ldrn;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_58

    invoke-virtual {p0}, Lr22;->g()Lvsn;

    move-result-object p1

    sget-object v0, Lux1;->a:Lux1;

    iget-object p0, p0, Lr22;->d:Ljava/lang/Object;

    check-cast p0, Lx22;

    new-instance v1, Lo22;

    invoke-direct {v1, p0, v2}, Lo22;-><init>(Lx22;B)V

    invoke-virtual {p1, v0, v2, v1}, Lvsn;->h(Lux1;ZLcom/opera/api/Callback;)V

    return-void

    :cond_58
    sget-object v1, Ldrn;->e:Ldrn;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a5

    invoke-virtual {p0}, Lr22;->g()Lvsn;

    move-result-object p0

    invoke-virtual {p0}, Lvsn;->b()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    const/4 v0, 0x3

    if-ge p1, v0, :cond_1fd

    iget-object p0, p0, Lvsn;->c:Ls62;

    invoke-virtual {p0}, Ls62;->e()Liy1;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Liy1;->f:Lny1;

    new-instance v1, Lwx;

    const/4 v2, 0x4

    invoke-direct {v1, p0, p1, v2}, Lwx;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, v0, Lny1;->a:Landroid/content/Context;

    :try_start_8a
    invoke-virtual {v0, p0, v1}, Lny1;->a(Landroid/content/Context;Lcom/opera/api/Callback;)V
    :try_end_8d
    .catch Landroid/content/ActivityNotFoundException; {:try_start_8a .. :try_end_8d} :catch_8e

    return-void

    :catch_8e
    new-instance p1, Laz0;

    invoke-direct {p1, p0}, Laz0;-><init>(Landroid/content/Context;)V

    const p0, 0x7f140774

    invoke-virtual {p1, p0}, Laz0;->a(I)V

    const p0, 0x7f140bbb

    const/4 v0, 0x0

    invoke-virtual {p1, p0, v0}, Laz0;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Laz0;

    move-result-object p0

    invoke-virtual {p0}, Laz0;->c()Lbz0;

    return-void

    :cond_a5
    sget-object v1, Ldrn;->f:Ldrn;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b7

    invoke-virtual {p0}, Lr22;->g()Lvsn;

    move-result-object p0

    sget-object p1, Lux1;->a:Lux1;

    invoke-virtual {p0, p1}, Lvsn;->i(Lux1;)V

    return-void

    :cond_b7
    sget-object v1, Ldrn;->g:Ldrn;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_da

    iget-object p1, v0, Lmrn;->j:Lcom/opera/android/custom_views/OperaEditText;

    invoke-virtual {p1}, Landroid/view/View;->clearFocus()V

    invoke-static {p1}, Lq9n;->u(Landroid/view/View;)Z

    invoke-virtual {p0}, Lr22;->g()Lvsn;

    move-result-object p1

    iget-object p1, p1, Lvsn;->k:Lg7m;

    sget-object v0, Ll60;->d:Ll60;

    invoke-virtual {p1, v0}, Lg7m;->c(Ll60;)V

    invoke-virtual {p0}, Lr22;->g()Lvsn;

    move-result-object p0

    invoke-virtual {p0}, Lvsn;->g()V

    return-void

    :cond_da
    sget-object v1, Ldrn;->h:Ldrn;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_ee

    invoke-virtual {p0}, Lr22;->g()Lvsn;

    move-result-object p0

    iget-object p0, p0, Lvsn;->k:Lg7m;

    sget-object p1, Ll60;->e:Ll60;

    invoke-virtual {p0, p1}, Lg7m;->c(Ll60;)V

    return-void

    :cond_ee
    instance-of v1, p1, Lfrn;

    if-eqz v1, :cond_11d

    invoke-virtual {p0}, Lr22;->g()Lvsn;

    move-result-object v0

    check-cast p1, Lfrn;

    iget-object p1, p1, Lfrn;->b:Ljava/lang/String;

    invoke-virtual {v0, p1}, Lvsn;->f(Ljava/lang/String;)Lqx1;

    move-result-object p1

    if-eqz p1, :cond_1fd

    iget-object v0, p1, Lqx1;->m:Ljava/io/File;

    invoke-static {v0}, Lw7d;->x(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    const-string v3, "android.intent.action.VIEW"

    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object p1, p1, Lqx1;->n:Ljava/lang/String;

    invoke-virtual {v1, v0, p1}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    iget-object p0, p0, Lr22;->c:Ljava/lang/Object;

    check-cast p0, Lkotlin/jvm/functions/Function1;

    invoke-interface {p0, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_11d
    instance-of v1, p1, Lgrn;

    const/4 v3, 0x0

    if-eqz v1, :cond_134

    invoke-virtual {p0}, Lr22;->g()Lvsn;

    move-result-object p0

    check-cast p1, Lgrn;

    iget-object p1, p1, Lgrn;->b:Ljava/lang/String;

    iget-object p0, p0, Lvsn;->c:Ls62;

    invoke-virtual {p0}, Ls62;->e()Liy1;

    move-result-object p0

    invoke-virtual {p0, p1, v3}, Liy1;->g(Ljava/lang/String;Z)V

    return-void

    :cond_134
    instance-of v1, p1, Lhrn;

    if-eqz v1, :cond_14a

    invoke-virtual {p0}, Lr22;->g()Lvsn;

    move-result-object p0

    check-cast p1, Lhrn;

    iget-object p1, p1, Lhrn;->b:Ljava/lang/String;

    iget-object p0, p0, Lvsn;->c:Ls62;

    invoke-virtual {p0}, Ls62;->e()Liy1;

    move-result-object p0

    invoke-virtual {p0, p1}, Liy1;->h(Ljava/lang/String;)V

    return-void

    :cond_14a
    sget-object v1, Ldrn;->i:Ldrn;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_15a

    invoke-virtual {p0}, Lr22;->g()Lvsn;

    move-result-object p0

    invoke-virtual {p0}, Lvsn;->l()V

    return-void

    :cond_15a
    sget-object v1, Ldrn;->j:Ldrn;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1b0

    iget-object p1, v0, Lmrn;->j:Lcom/opera/android/custom_views/OperaEditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Lr22;->g()Lvsn;

    move-result-object v1

    iget-object v1, v1, Lvsn;->q:Lwnm;

    invoke-static {v1}, Lxf8;->B(Likc;)Ltsd;

    move-result-object v1

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ltsn;

    iget-object v1, v1, Ltsn;->b:Llsn;

    invoke-static {p1}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1fd

    invoke-interface {v1}, Llsn;->b()Lmsn;

    move-result-object v1

    sget-object v2, Lmsn;->b:Lmsn;

    if-ne v1, v2, :cond_1fd

    invoke-virtual {p0}, Lr22;->g()Lvsn;

    move-result-object v1

    iget-object v2, v0, Lmrn;->r:Lcom/opera/android/custom_views/StylingImageCheckableWithText;

    iget-boolean v2, v2, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->u:Z

    invoke-virtual {v1, p1, v2}, Lvsn;->m(Ljava/lang/String;Z)V

    const-string p1, ""

    invoke-virtual {v0, p1}, Lmrn;->i(Ljava/lang/String;)V

    invoke-virtual {p0}, Lr22;->h()Ls62;

    move-result-object p0

    iget-object p0, p0, Ls62;->b:Lcom/opera/android/browser/WebContentsWrapper;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    invoke-interface {p0}, Lorg/chromium/content_public/browser/WebContents;->J0()Lorg/chromium/ui/base/ViewAndroidDelegate;

    move-result-object p0

    iget-object p0, p0, Lorg/chromium/ui/base/ViewAndroidDelegate;->b:Lxr5;

    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    return-void

    :cond_1b0
    instance-of v1, p1, Lirn;

    if-eqz v1, :cond_1ce

    check-cast p1, Lirn;

    iget-boolean p1, p1, Lirn;->b:Z

    if-nez p1, :cond_1bf

    iget-object v0, v0, Lmrn;->m:Landroid/view/View;

    invoke-static {v0}, Lq9n;->u(Landroid/view/View;)Z

    :cond_1bf
    invoke-virtual {p0}, Lr22;->g()Lvsn;

    move-result-object v0

    iput-boolean p1, v0, Lvsn;->t:Z

    iget-object v0, v0, Lvsn;->q:Lwnm;

    invoke-virtual {v0}, Lwnm;->u()V

    invoke-static {p0, p1, v2}, Lr22;->p(Lr22;ZI)V

    return-void

    :cond_1ce
    instance-of v0, p1, Ljrn;

    if-eqz v0, :cond_1e5

    invoke-virtual {p0}, Lr22;->g()Lvsn;

    move-result-object p0

    check-cast p1, Ljrn;

    iget-object p1, p1, Ljrn;->b:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    if-gtz p1, :cond_1e1

    move v2, v3

    :cond_1e1
    invoke-virtual {p0, v2}, Lvsn;->d(Z)V

    return-void

    :cond_1e5
    instance-of v0, p1, Lern;

    if-eqz v0, :cond_1f5

    invoke-virtual {p0}, Lr22;->g()Lvsn;

    move-result-object p0

    check-cast p1, Lern;

    iget-boolean p1, p1, Lern;->b:Z

    invoke-static {p0, p1}, Lvsn;->j(Lvsn;Z)V

    return-void

    :cond_1f5
    sget-object p0, Ldrn;->k:Ldrn;

    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1fe

    :cond_1fd
    return-void

    :cond_1fe
    invoke-static {}, Lh9o;->p()V

    return-void
.end method

.method public abstract g()Lvsn;
.end method

.method public abstract h()Ls62;
.end method

.method public i()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public j(Lmid;)V
    .registers 2

    return-void
.end method

.method public k(Lmid;I)V
    .registers 3

    return-void
.end method

.method public final l()V
    .registers 3

    iget-object v0, p0, Lr22;->a:Ljava/lang/Object;

    check-cast v0, Lmrn;

    const-string v1, ""

    invoke-virtual {v0, v1}, Lmrn;->i(Ljava/lang/String;)V

    invoke-virtual {p0}, Lr22;->g()Lvsn;

    move-result-object v1

    iget-object v1, v1, Lvsn;->q:Lwnm;

    invoke-static {v1}, Lxf8;->B(Likc;)Ltsd;

    move-result-object v1

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ltsn;

    iget-object v1, v1, Ltsn;->b:Llsn;

    invoke-virtual {v0, v1}, Lmrn;->h(Llsn;)V

    const/4 v0, 0x0

    const/4 v1, 0x3

    invoke-static {p0, v0, v1}, Lr22;->p(Lr22;ZI)V

    return-void
.end method

.method public m(Ljava/lang/String;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V
    .registers 4

    return-void
.end method

.method public n(Ljava/lang/String;Landroid/os/Bundle;)V
    .registers 3

    return-void
.end method

.method public o()V
    .registers 1

    return-void
.end method

.method public q(Landroid/content/Intent;)Z
    .registers 2

    const/4 p0, 0x0

    return p0
.end method

.method public r()V
    .registers 1

    return-void
.end method

.method public s()V
    .registers 1

    return-void
.end method

.method public t(Ljava/lang/String;Landroid/os/Bundle;)V
    .registers 3

    return-void
.end method

.method public u(Ljava/lang/String;Landroid/os/Bundle;)V
    .registers 3

    return-void
.end method

.method public v(Landroid/net/Uri;Landroid/os/Bundle;)V
    .registers 3

    return-void
.end method

.method public w()V
    .registers 1

    return-void
.end method

.method public x(Ljava/lang/String;Landroid/os/Bundle;)V
    .registers 3

    return-void
.end method

.method public y(Ljava/lang/String;Landroid/os/Bundle;)V
    .registers 3

    return-void
.end method

.method public z(Landroid/net/Uri;Landroid/os/Bundle;)V
    .registers 3

    return-void
.end method
