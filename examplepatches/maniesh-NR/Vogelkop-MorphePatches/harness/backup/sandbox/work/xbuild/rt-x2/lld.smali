.class public final Llld;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lhsd;
.implements Lr3b;
.implements Lcom/opera/android/browser/NavigationHistory;
.implements Lvm;
.implements Lrj2;
.implements Lnj8;
.implements Lnwh;
.implements Lw7e;
.implements Ld94;
.implements Lpji;
.implements La5a;
.implements Lz8l;
.implements Lgb6;
.implements Lbcf;


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(B)V
    .registers 3

    iput-byte p1, p0, Llld;->a:B

    const/4 v0, 0x0

    sparse-switch p1, :sswitch_data_2c

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {v0}, Lhyg;->k(Ljava/lang/Object;)Lt0g;

    move-result-object p1

    iput-object p1, p0, Llld;->b:Ljava/lang/Object;

    return-void

    :sswitch_10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void

    :sswitch_14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lyhe;

    const/16 v0, 0xe

    invoke-direct {p1, v0}, Lyhe;-><init>(B)V

    iput-object p1, p0, Llld;->b:Ljava/lang/Object;

    return-void

    :sswitch_21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lj1d;

    invoke-direct {p1, v0}, Lj1d;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Llld;->b:Ljava/lang/Object;

    return-void

    :sswitch_data_2c
    .sparse-switch
        0xd -> :sswitch_21
        0x11 -> :sswitch_14
        0x17 -> :sswitch_10
    .end sparse-switch
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 46
    iput-byte p2, p0, Llld;->a:B

    iput-object p1, p0, Llld;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lk4j;Lcom/opera/android/browser/NavigationEntry;)V
    .registers 3

    const/16 p1, 0x19

    iput-byte p1, p0, Llld;->a:B

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Llld;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lmsh;)V
    .registers 3

    const/16 v0, 0x12

    iput-byte v0, p0, Llld;->a:B

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Llld;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lylh;Lpjn;)V
    .registers 3

    const/4 p2, 0x3

    iput-byte p2, p0, Llld;->a:B

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object p1, p0, Llld;->b:Ljava/lang/Object;

    return-void
.end method

.method public static varargs g0(Ljava/util/HashSet;Ljava/util/HashSet;[I)Z
    .registers 3

    invoke-static {p2}, Lsgb;->i([I)Ljava/util/List;

    move-result-object p2

    invoke-static {p0, p2}, Ljava/util/Collections;->disjoint(Ljava/util/Collection;Ljava/util/Collection;)Z

    move-result p0

    if-nez p0, :cond_c

    const/4 p0, 0x0

    return p0

    :cond_c
    invoke-static {p1, p2}, Ljava/util/Collections;->disjoint(Ljava/util/Collection;Ljava/util/Collection;)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method


# virtual methods
.method public final A()Lv3e;
    .registers 1

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lr3b;

    invoke-interface {p0}, Lr3b;->A()Lv3e;

    move-result-object p0

    return-object p0
.end method

.method public final C(Lcm;)V
    .registers 4

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lopf;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "showAd: onAdFailedToShow, error="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lopf;->a(Ljava/lang/String;)V

    iget-object v0, p0, Lopf;->c:Lcom/google/android/gms/ads/mediation/MediationInterstitialAdCallback;

    if-eqz v0, :cond_26

    iget v0, p1, Lcm;->b:I

    iget-object p1, p1, Lcm;->c:Ljava/lang/String;

    invoke-static {v0, p1}, Lrm5;->q(ILjava/lang/String;)Lcom/google/android/gms/ads/AdError;

    move-result-object p1

    iget-object v0, p0, Lopf;->c:Lcom/google/android/gms/ads/mediation/MediationInterstitialAdCallback;

    invoke-interface {v0, p1}, Lcom/google/android/gms/ads/mediation/MediationInterstitialAdCallback;->onAdFailedToShow(Lcom/google/android/gms/ads/AdError;)V

    :cond_26
    iget-object p1, p0, Lopf;->d:Ldhb;

    if-eqz p1, :cond_30

    invoke-virtual {p1}, Lk8;->P()V

    const/4 p1, 0x0

    iput-object p1, p0, Lopf;->d:Ldhb;

    :cond_30
    return-void
.end method

.method public final D()Lmzd;
    .registers 1

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lr3b;

    invoke-interface {p0}, Lr3b;->D()Lmzd;

    move-result-object p0

    return-object p0
.end method

.method public final E()Ls5e;
    .registers 1

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lr3b;

    invoke-interface {p0}, Lr3b;->E()Ls5e;

    move-result-object p0

    return-object p0
.end method

.method public final F()V
    .registers 4

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lknh;

    iget-object v0, p0, Lknh;->w:Lua7;

    new-instance v1, Lnnh;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Lnnh;-><init>(I)V

    invoke-static {v0, v1}, Lcqp;->r0(Lua7;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lryl;->g0()V

    return-void
.end method

.method public final G()Li2h;
    .registers 1

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lr3b;

    invoke-interface {p0}, Lr3b;->G()Li2h;

    move-result-object p0

    return-object p0
.end method

.method public final H()Lu4i;
    .registers 1

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lr3b;

    invoke-interface {p0}, Lr3b;->H()Lu4i;

    move-result-object p0

    return-object p0
.end method

.method public final I()Li5e;
    .registers 1

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lr3b;

    invoke-interface {p0}, Lr3b;->I()Li5e;

    move-result-object p0

    return-object p0
.end method

.method public final J()Lv3e;
    .registers 1

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lr3b;

    invoke-interface {p0}, Lr3b;->J()Lv3e;

    move-result-object p0

    return-object p0
.end method

.method public final K()V
    .registers 1

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lknh;

    iget-object p0, p0, Lknh;->A:Ly83;

    if-nez p0, :cond_9

    const/4 p0, 0x0

    :cond_9
    iget-object p0, p0, Ly83;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/tabui2/recently_closed_tabs/RecentlyClosedTabsSheetContentWrapper;

    invoke-virtual {p0}, Lgej;->e()V

    return-void
.end method

.method public final L()Lab7;
    .registers 1

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lr3b;

    invoke-interface {p0}, Lr3b;->L()Lab7;

    move-result-object p0

    return-object p0
.end method

.method public final M()Llrh;
    .registers 1

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lr3b;

    invoke-interface {p0}, Lr3b;->M()Llrh;

    move-result-object p0

    return-object p0
.end method

.method public final N()Lr5e;
    .registers 1

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lr3b;

    invoke-interface {p0}, Lr3b;->N()Lr5e;

    move-result-object p0

    return-object p0
.end method

.method public final O()Lt9f;
    .registers 1

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lr3b;

    invoke-interface {p0}, Lr3b;->O()Lt9f;

    move-result-object p0

    return-object p0
.end method

.method public final P()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final Q(I)Z
    .registers 2

    const/4 p0, 0x1

    return p0
.end method

.method public final R()Ly5e;
    .registers 1

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lr3b;

    invoke-interface {p0}, Lr3b;->R()Ly5e;

    move-result-object p0

    return-object p0
.end method

.method public final S()J
    .registers 3

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public final T()V
    .registers 3

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lpii;

    iget-object v0, p0, Lpii;->I:Landroid/os/ParcelFileDescriptor;

    invoke-static {v0}, Lxvg;->l(Ljava/io/Closeable;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lpii;->I:Landroid/os/ParcelFileDescriptor;

    iget-object v0, p0, Lpii;->u:Lqji;

    if-eqz v0, :cond_25

    const/4 v0, 0x0

    iput-boolean v0, p0, Lpii;->L:Z

    iget-object v0, p0, Lpii;->G:Llii;

    invoke-interface {v0}, Llii;->a()Z

    move-result v0

    if-eqz v0, :cond_25

    iget-object v0, p0, Lpii;->u:Lqji;

    iget-byte v0, v0, Lqji;->l:B

    const/4 v1, 0x2

    if-ne v0, v1, :cond_25

    invoke-virtual {p0}, Lpii;->L0()V

    :cond_25
    return-void
.end method

.method public final U(F)V
    .registers 3

    const/high16 v0, 0x437f0000    # 255.0f

    mul-float/2addr p1, v0

    float-to-int p1, p1

    rsub-int p1, p1, 0xff

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lknh;

    iget-object p0, p0, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    if-eqz p0, :cond_15

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    :cond_15
    return-void
.end method

.method public final V(JJ)J
    .registers 5

    const-wide/16 p0, 0x1

    return-wide p0
.end method

.method public final W()V
    .registers 1

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lknh;

    iget-object p0, p0, Lknh;->A:Ly83;

    if-nez p0, :cond_9

    const/4 p0, 0x0

    :cond_9
    iget-object p0, p0, Ly83;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/tabui2/recently_closed_tabs/RecentlyClosedTabsSheetContentWrapper;

    invoke-virtual {p0}, Lgej;->e()V

    return-void
.end method

.method public final Y()V
    .registers 7

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lmyf;

    iget-object v1, p0, Lmyf;->c:Lmyk;

    iget-object v2, p0, Lmyf;->h:Lrgh;

    iget-object v3, p0, Lmyf;->g:Ljava/lang/String;

    new-instance v4, Lvdf;

    const/16 v0, 0xc

    invoke-direct {v4, p0, v0}, Lvdf;-><init>(Ljava/lang/Object;B)V

    new-instance v5, Lkqd;

    const/16 v0, 0x1a

    invoke-direct {v5, p0, v0}, Lkqd;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Lpi2;

    invoke-direct/range {v0 .. v5}, Lpi2;-><init>(Lmyk;Lrgh;Ljava/lang/String;Lvdf;Lkqd;)V

    iput-object v0, p0, Lmyf;->f:Lpi2;

    return-void
.end method

.method public final Z(ID)V
    .registers 6

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Li32;

    const-wide/16 v0, 0x0

    cmpl-double v0, p2, v0

    if-nez v0, :cond_b

    return-void

    :cond_b
    invoke-virtual {p0, p1}, Li32;->l(I)Lr7h;

    move-result-object p1

    iget-wide v0, p1, Lr7h;->b:D

    add-double/2addr v0, p2

    iput-wide v0, p1, Lr7h;->b:D

    new-instance p2, Lr7h;

    invoke-direct {p2, p1}, Lr7h;-><init>(Lr7h;)V

    invoke-virtual {p0, p2}, Lldk;->g(Ljava/lang/Object;)V

    return-void
.end method

.method public final a(JJ)J
    .registers 5

    return-wide p3
.end method

.method public final a0(ILandroid/view/View;)V
    .registers 6

    invoke-virtual {p2}, Landroid/view/View;->isLaidOut()Z

    move-result v0

    if-nez v0, :cond_c

    const/16 p0, 0x8

    invoke-virtual {p2, p0}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_c
    invoke-virtual {p2}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result v2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    sget-object v0, Llf1;->a:Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    new-instance v0, Lc48;

    const/4 v1, 0x2

    invoke-direct {v0, v1, p2, p0}, Lc48;-><init>(BLandroid/view/View;Ljava/lang/Object;)V

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    return-void
.end method

.method public final b()V
    .registers 3

    iget-byte v0, p0, Llld;->a:B

    packed-switch v0, :pswitch_data_3e

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/widget/RoundedImageView;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/opera/android/widget/RoundedImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void

    :pswitch_e
    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lmsh;

    iget-object v0, p0, Lmsh;->A:Lkm5;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lkm5;->a:Z

    new-instance v0, Ljava/util/HashSet;

    iget-object p0, p0, Lmsh;->A:Lkm5;

    iget-object v1, p0, Lkm5;->d:Ljava/lang/Object;

    check-cast v1, Ljava/util/HashSet;

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_26
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_36

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lssh;

    invoke-interface {v1}, Lssh;->b()V

    goto :goto_26

    :cond_36
    iget-object p0, p0, Lkm5;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashSet;

    invoke-virtual {p0}, Ljava/util/HashSet;->clear()V

    return-void

    :pswitch_data_3e
    .packed-switch 0x12
        :pswitch_e
    .end packed-switch
.end method

.method public final b0(ILandroid/view/View;)V
    .registers 6

    invoke-virtual {p2}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    sget-object v0, Llf1;->a:Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    new-instance v0, Lc48;

    const/4 v1, 0x1

    invoke-direct {v0, v1, p2, p0}, Lc48;-><init>(BLandroid/view/View;Ljava/lang/Object;)V

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    return-void
.end method

.method public final c0()V
    .registers 2

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lmyf;

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lmyf;->b(I)V

    return-void
.end method

.method public final d()I
    .registers 1

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lorg/chromium/content_public/browser/WebContents;

    invoke-static {p0}, LJ/N;->MMzOlmu8(Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method public final d0(ID)D
    .registers 13

    iget-object v0, p0, Llld;->b:Ljava/lang/Object;

    check-cast v0, Li32;

    invoke-virtual {v0, p1}, Li32;->l(I)Lr7h;

    move-result-object p1

    iget-wide v0, p1, Lr7h;->b:D

    const-wide v2, 0x3fe3333333333333L    # 0.6

    cmpg-double v4, v0, v2

    const-wide/16 v5, 0x0

    if-gtz v4, :cond_16

    return-wide v5

    :cond_16
    mul-double/2addr p2, v0

    sub-double v7, v0, p2

    cmpg-double v4, v7, v2

    if-gez v4, :cond_1f

    sub-double p2, v0, v2

    :cond_1f
    cmpl-double v0, p2, v5

    if-lez v0, :cond_29

    iget p1, p1, Lr7h;->a:I

    neg-double v0, p2

    invoke-virtual {p0, p1, v0, v1}, Llld;->Z(ID)V

    :cond_29
    return-wide p2
.end method

.method public final e(Lcie;)V
    .registers 6

    new-instance v0, Lero;

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Ljsd;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lero;-><init>(Landroid/content/Context;Landroid/view/View;B)V

    invoke-virtual {p0, v0}, Ljsd;->a(Laoo;)V

    iget-object p0, p0, Ljsd;->a:Ljava/util/HashMap;

    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iput-object v0, p1, Lcie;->w0:Laoo;

    invoke-static {v0, p1}, Ljsd;->c(Laoo;Lcie;)V

    return-void
.end method

.method public final e0(Lcom/opera/api/Callback;)V
    .registers 4

    iget-object v0, p0, Llld;->b:Ljava/lang/Object;

    check-cast v0, Lno7;

    invoke-virtual {v0}, Lno7;->i()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lffd;

    invoke-interface {v0}, Lffd;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1d

    new-instance v0, Lp1;

    invoke-direct {v0, p0}, Lp1;-><init>(Llld;)V

    iget-object p0, v0, Lp1;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/LinkedHashSet;

    invoke-interface {p0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void

    :cond_1d
    invoke-interface {p1, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final f([Landroid/print/PageRange;)V
    .registers 7

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lpii;

    iget-object v0, p0, Lpii;->s:Lumi;

    iget-object v1, p0, Lpii;->I:Landroid/os/ParcelFileDescriptor;

    invoke-static {v1}, Lxvg;->l(Ljava/io/Closeable;)V

    const/4 v1, 0x0

    iput-object v1, p0, Lpii;->I:Landroid/os/ParcelFileDescriptor;

    iget-object v2, p0, Lpii;->u:Lqji;

    if-nez v2, :cond_13

    return-void

    :cond_13
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    new-instance v3, Lt1;

    const/16 v4, 0xf

    invoke-direct {v3, v2, v4}, Lt1;-><init>(Landroid/content/Context;B)V

    invoke-interface {v0, v3}, Ltcl;->b(Lesk;)Lnml;

    move-result-object v2

    new-instance v3, Lmgf;

    const/16 v4, 0x14

    invoke-direct {v3, p0, p1, v4}, Lmgf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v3}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p0

    invoke-virtual {v2, p0}, Lnml;->b(Lnml;)V

    invoke-virtual {v2, v1}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method

.method public final f0(Lbza;Lwsd;Lapj;Llli;)Lxsd;
    .registers 21

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    iget-object v3, v0, Lbza;->i:Lj74;

    iget-object v4, v0, Lbza;->n:Lwog;

    iget-boolean v3, v3, Lj74;->a:Z

    const/4 v5, 0x0

    if-eqz v3, :cond_1cf

    move-object/from16 v3, p0

    iget-object v3, v3, Llld;->b:Ljava/lang/Object;

    check-cast v3, Lylh;

    invoke-virtual {v3}, Lylh;->c()Lamh;

    move-result-object v3

    const/4 v6, 0x0

    if-eqz v3, :cond_b6

    iget-object v7, v3, Lamh;->c:Ljava/lang/Object;

    monitor-enter v7

    :try_start_1f
    iget-object v8, v3, Lamh;->a:Lqq8;

    iget-object v8, v8, Lqq8;->c:Ljava/lang/Object;

    check-cast v8, Ltr3;

    iget-object v8, v8, Ltr3;->c:Ljava/lang/Object;

    check-cast v8, Ljava/util/LinkedHashMap;

    invoke-virtual {v8, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ldmh;

    if-eqz v8, :cond_3b

    new-instance v9, Lxsd;

    iget-object v10, v8, Ldmh;->a:Ljva;

    iget-object v8, v8, Ldmh;->b:Ljava/util/Map;

    invoke-direct {v9, v10, v8}, Lxsd;-><init>(Ljva;Ljava/util/Map;)V

    goto :goto_3c

    :cond_3b
    move-object v9, v5

    :goto_3c
    if-nez v9, :cond_78

    iget-object v8, v3, Lamh;->b:Lbp;

    iget-object v9, v8, Lbp;->b:Ljava/lang/Object;

    check-cast v9, Ljava/util/LinkedHashMap;

    invoke-virtual {v9, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/ArrayList;

    if-nez v9, :cond_4e

    move-object v9, v5

    goto :goto_78

    :cond_4e
    invoke-interface {v9}, Ljava/util/Collection;->size()I

    move-result v10

    move v11, v6

    :goto_53
    if-ge v11, v10, :cond_73

    invoke-interface {v9, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lfmh;

    iget-object v13, v12, Lfmh;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {v13}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljva;

    if-eqz v13, :cond_6d

    new-instance v14, Lxsd;

    iget-object v12, v12, Lfmh;->b:Ljava/util/Map;

    invoke-direct {v14, v13, v12}, Lxsd;-><init>(Ljva;Ljava/util/Map;)V

    goto :goto_6e

    :cond_6d
    move-object v14, v5

    :goto_6e
    if-nez v14, :cond_74

    add-int/lit8 v11, v11, 0x1

    goto :goto_53

    :cond_73
    move-object v14, v5

    :cond_74
    invoke-virtual {v8}, Lbp;->e()V

    move-object v9, v14

    :cond_78
    :goto_78
    if-eqz v9, :cond_b1

    iget-object v8, v9, Lxsd;->a:Ljva;

    invoke-interface {v8}, Ljva;->a()Z

    move-result v8

    if-nez v8, :cond_b1

    iget-object v8, v3, Lamh;->c:Ljava/lang/Object;

    monitor-enter v8
    :try_end_85
    .catchall {:try_start_1f .. :try_end_85} :catchall_b3

    :try_start_85
    iget-object v10, v3, Lamh;->a:Lqq8;

    iget-object v10, v10, Lqq8;->c:Ljava/lang/Object;

    check-cast v10, Ltr3;

    iget-object v11, v10, Ltr3;->c:Ljava/lang/Object;

    check-cast v11, Ljava/util/LinkedHashMap;

    invoke-interface {v11, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    if-eqz v11, :cond_a3

    invoke-virtual {v10}, Ltr3;->k()J

    move-result-wide v12

    invoke-virtual {v10, v1, v11}, Ltr3;->n(Ljava/lang/Object;Ljava/lang/Object;)J

    move-result-wide v14

    sub-long/2addr v12, v14

    iput-wide v12, v10, Ltr3;->b:J

    invoke-virtual {v10, v1, v11, v5}, Ltr3;->j(Ljava/lang/Object;Ljava/lang/Object;Ldmh;)V

    :cond_a3
    iget-object v3, v3, Lamh;->b:Lbp;

    iget-object v3, v3, Lbp;->b:Ljava/lang/Object;

    check-cast v3, Ljava/util/LinkedHashMap;

    invoke-virtual {v3, v1}, Ljava/util/AbstractMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_ac
    .catchall {:try_start_85 .. :try_end_ac} :catchall_ae

    :try_start_ac
    monitor-exit v8

    goto :goto_b1

    :catchall_ae
    move-exception v0

    monitor-exit v8

    throw v0
    :try_end_b1
    .catchall {:try_start_ac .. :try_end_b1} :catchall_b3

    :cond_b1
    :goto_b1
    monitor-exit v7

    goto :goto_b7

    :catchall_b3
    move-exception v0

    monitor-exit v7

    throw v0

    :cond_b6
    move-object v9, v5

    :goto_b7
    if-eqz v9, :cond_1cf

    iget-object v3, v9, Lxsd;->a:Ljva;

    instance-of v7, v3, Ltg3;

    if-eqz v7, :cond_c3

    move-object v8, v3

    check-cast v8, Ltg3;

    goto :goto_c4

    :cond_c3
    move-object v8, v5

    :goto_c4
    if-eqz v8, :cond_e4

    iget-object v8, v8, Ltg3;->a:Landroid/graphics/Bitmap;

    invoke-virtual {v8}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v8

    if-nez v8, :cond_d0

    sget-object v8, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    :cond_d0
    sget-object v11, Landroid/graphics/Bitmap$Config;->HARDWARE:Landroid/graphics/Bitmap$Config;

    if-ne v8, v11, :cond_e4

    sget-object v8, Leza;->f:Lxm5;

    invoke-static {v0, v8}, Lxf8;->J(Lbza;Lxm5;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Boolean;

    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    if-nez v8, :cond_e4

    move v8, v6

    goto :goto_e5

    :cond_e4
    const/4 v8, 0x1

    :goto_e5
    if-eqz v8, :cond_1cf

    iget-object v1, v1, Lwsd;->b:Ljava/util/Map;

    const-string v8, "coil#size"

    invoke-interface {v1, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_ff

    invoke-virtual {v2}, Lapj;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1cf

    goto/16 :goto_1ce

    :cond_ff
    iget-object v1, v9, Lxsd;->b:Ljava/util/Map;

    const-string v8, "coil#is_sampled"

    invoke-interface {v1, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    instance-of v8, v1, Ljava/lang/Boolean;

    if-eqz v8, :cond_10e

    check-cast v1, Ljava/lang/Boolean;

    goto :goto_10f

    :cond_10e
    move-object v1, v5

    :goto_10f
    if-eqz v1, :cond_115

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    :cond_115
    if-nez v6, :cond_123

    sget-object v1, Lapj;->c:Lapj;

    invoke-static {v2, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1ce

    sget-object v1, Lwog;->b:Lwog;

    if-eq v4, v1, :cond_1ce

    :cond_123
    invoke-interface {v3}, Ljva;->getWidth()I

    move-result v1

    invoke-interface {v3}, Ljva;->getHeight()I

    move-result v3

    if-eqz v7, :cond_136

    sget-object v6, Ldza;->b:Lxm5;

    invoke-static {v0, v6}, Lxf8;->J(Lbza;Lxm5;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lapj;

    goto :goto_138

    :cond_136
    sget-object v0, Lapj;->c:Lapj;

    :goto_138
    iget-object v6, v2, Lapj;->a:Lg97;

    instance-of v7, v6, Le97;

    const v8, 0x7fffffff

    if-eqz v7, :cond_146

    check-cast v6, Le97;

    iget v6, v6, Le97;->a:I

    goto :goto_147

    :cond_146
    move v6, v8

    :goto_147
    iget-object v7, v0, Lapj;->a:Lg97;

    instance-of v11, v7, Le97;

    if-eqz v11, :cond_152

    check-cast v7, Le97;

    iget v7, v7, Le97;->a:I

    goto :goto_153

    :cond_152
    move v7, v8

    :goto_153
    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v6

    iget-object v2, v2, Lapj;->b:Lg97;

    instance-of v7, v2, Le97;

    if-eqz v7, :cond_162

    check-cast v2, Le97;

    iget v2, v2, Le97;->a:I

    goto :goto_163

    :cond_162
    move v2, v8

    :goto_163
    iget-object v0, v0, Lapj;->b:Lg97;

    instance-of v7, v0, Le97;

    if-eqz v7, :cond_16e

    check-cast v0, Le97;

    iget v0, v0, Le97;->a:I

    goto :goto_16f

    :cond_16e
    move v0, v8

    :goto_16f
    invoke-static {v2, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    int-to-double v11, v6

    int-to-double v13, v1

    div-double/2addr v11, v13

    int-to-double v13, v0

    move-wide/from16 p1, v11

    int-to-double v10, v3

    div-double/2addr v13, v10

    if-eq v6, v8, :cond_182

    if-eq v0, v8, :cond_182

    move-object/from16 v2, p4

    goto :goto_184

    :cond_182
    sget-object v2, Llli;->b:Llli;

    :goto_184
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    if-eqz v2, :cond_1a5

    const/4 v7, 0x1

    if-ne v2, v7, :cond_1a1

    cmpg-double v2, p1, v13

    if-gez v2, :cond_19a

    sub-int/2addr v6, v1

    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    move-result v0

    :goto_196
    move-wide/from16 v11, p1

    :goto_198
    const/4 v7, 0x1

    goto :goto_1b5

    :cond_19a
    sub-int/2addr v0, v3

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    :goto_19f
    move-wide v11, v13

    goto :goto_198

    :cond_1a1
    invoke-static {}, Lh9o;->p()V

    return-object v5

    :cond_1a5
    cmpl-double v2, p1, v13

    if-lez v2, :cond_1af

    sub-int/2addr v6, v1

    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    move-result v0

    goto :goto_196

    :cond_1af
    sub-int/2addr v0, v3

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    goto :goto_19f

    :goto_1b5
    if-le v0, v7, :cond_1ce

    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    const-wide/high16 v1, 0x3ff0000000000000L    # 1.0

    if-eqz v0, :cond_1ca

    if-ne v0, v7, :cond_1c6

    cmpg-double v0, v11, v1

    if-gtz v0, :cond_1cf

    goto :goto_1ce

    :cond_1c6
    invoke-static {}, Lh9o;->p()V

    return-object v5

    :cond_1ca
    cmpg-double v0, v11, v1

    if-nez v0, :cond_1cf

    :cond_1ce
    :goto_1ce
    return-object v9

    :cond_1cf
    return-object v5
.end method

.method public final g()V
    .registers 2

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lopf;

    const-string v0, "showAd: onAdDisplayed"

    invoke-virtual {p0, v0}, Lopf;->a(Ljava/lang/String;)V

    iget-object p0, p0, Lopf;->c:Lcom/google/android/gms/ads/mediation/MediationInterstitialAdCallback;

    if-eqz p0, :cond_10

    invoke-interface {p0}, Lcom/google/android/gms/ads/mediation/MediationAdCallback;->reportAdImpression()V

    :cond_10
    return-void
.end method

.method public final getConfiguration()Lil5;
    .registers 1

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lr3b;

    invoke-interface {p0}, Lr3b;->getConfiguration()Lil5;

    move-result-object p0

    return-object p0
.end method

.method public final getContext()Landroid/content/Context;
    .registers 1

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lr3b;

    invoke-interface {p0}, Lr3b;->getContext()Landroid/content/Context;

    move-result-object p0

    return-object p0
.end method

.method public final getTimeUs(J)J
    .registers 3

    const-wide/16 p0, 0x0

    return-wide p0
.end method

.method public final getUrl()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/NavigationEntry;

    invoke-interface {p0}, Lcom/opera/android/browser/NavigationEntry;->getUrl()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final h()Lp5e;
    .registers 1

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lr3b;

    invoke-interface {p0}, Lr3b;->h()Lp5e;

    move-result-object p0

    return-object p0
.end method

.method public final h0(Ljava/lang/CharSequence;Lxdg;)Z
    .registers 5

    iget-object p2, p2, Lxdg;->c:Ljava/lang/String;

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1b

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lyhe;

    invoke-virtual {p0, p2}, Lyhe;->m(Ljava/lang/String;)Ljava/util/regex/Pattern;

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

.method public final i(I)Lcom/opera/android/browser/NavigationEntry;
    .registers 2

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lorg/chromium/content_public/browser/WebContents;

    invoke-static {p0, p1}, LJ/N;->MR8hjCiA(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/browser/NavigationEntry;

    return-object p0
.end method

.method public final i0(Lbza;Ljava/lang/Object;Lvrf;Ly55;)Lwsd;
    .registers 13

    iget-object p4, p1, Lbza;->i:Lj74;

    iget-object v0, p1, Lbza;->d:Ljava/util/Map;

    sget-object v1, Lj74;->d:Lj74;

    const/4 v2, 0x0

    if-eq p4, v1, :cond_de

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lylh;

    iget-object p0, p0, Lylh;->c:Lke5;

    iget-object p0, p0, Lke5;->c:Ljava/util/List;

    move-object p4, p0

    check-cast p4, Ljava/util/Collection;

    invoke-interface {p4}, Ljava/util/Collection;->size()I

    move-result p4

    const/4 v1, 0x0

    move v3, v1

    :goto_1a
    if-ge v3, p4, :cond_db

    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lkotlin/Pair;

    iget-object v5, v4, Lkotlin/Pair;->a:Ljava/lang/Object;

    check-cast v5, Lea1;

    iget-object v4, v4, Lkotlin/Pair;->b:Ljava/lang/Object;

    check-cast v4, Litb;

    check-cast v4, Ls15;

    invoke-virtual {v4, p2}, Ls15;->e(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d7

    iget-byte v4, v5, Lea1;->a:B

    packed-switch v4, :pswitch_data_10c

    move-object v4, p2

    check-cast v4, Lapm;

    iget-object v4, v4, Lapm;->a:Ljava/lang/String;

    goto/16 :goto_d5

    :pswitch_3e
    move-object v4, p2

    check-cast v4, Lapm;

    iget-object v5, v4, Lapm;->c:Ljava/lang/String;

    const-string v6, "file"

    if-eqz v5, :cond_4d

    invoke-virtual {v5, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_d4

    :cond_4d
    iget-object v5, v4, Lapm;->e:Ljava/lang/String;

    if-eqz v5, :cond_d4

    sget-object v5, Lnzm;->a:[Landroid/graphics/Bitmap$Config;

    iget-object v5, v4, Lapm;->c:Ljava/lang/String;

    invoke-static {v5, v6}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6b

    invoke-static {v4}, Lm5h;->j(Lapm;)Ljava/util/List;

    move-result-object v5

    invoke-static {v5}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v5

    const-string v6, "android_asset"

    invoke-static {v5, v6}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_d4

    :cond_6b
    sget-object v5, Ldza;->c:Lxm5;

    invoke-static {p3, v5}, Lxf8;->K(Lvrf;Lxm5;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-eqz v5, :cond_d4

    invoke-static {v4}, Lm5h;->i(Lapm;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_d4

    iget-object v6, p3, Lvrf;->e:Lg29;

    sget-object v7, Lw6g;->b:Ljava/lang/String;

    invoke-static {v5, v1}, Ls16;->o(Ljava/lang/String;Z)Lw6g;

    move-result-object v5

    invoke-virtual {v6, v5}, Lg29;->metadata(Lw6g;)Lp19;

    move-result-object v5

    iget-object v5, v5, Lp19;->f:Ljava/lang/Long;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, "-"

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_d5

    :pswitch_a2
    move-object v4, p2

    check-cast v4, Lapm;

    iget-object v5, v4, Lapm;->c:Ljava/lang/String;

    const-string v6, "android.resource"

    invoke-static {v5, v6}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_d4

    iget-object v5, p3, Lvrf;->a:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v5

    sget-object v6, Lnzm;->a:[Landroid/graphics/Bitmap$Config;

    iget v5, v5, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 v5, v5, 0x30

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, ":"

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_d5

    :cond_d4
    move-object v4, v2

    :goto_d5
    if-nez v4, :cond_dc

    :cond_d7
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_1a

    :cond_db
    move-object v4, v2

    :cond_dc
    if-nez v4, :cond_df

    :cond_de
    return-object v2

    :cond_df
    sget-object p0, Ldza;->a:Lxm5;

    invoke-static {p1, p0}, Lxf8;->J(Lbza;Lxm5;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    check-cast p0, Ljava/util/Collection;

    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_105

    new-instance p0, Ljava/util/LinkedHashMap;

    invoke-direct {p0, v0}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    iget-object p1, p3, Lvrf;->b:Lapj;

    invoke-virtual {p1}, Lapj;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "coil#size"

    invoke-interface {p0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p1, Lwsd;

    invoke-direct {p1, v4, p0}, Lwsd;-><init>(Ljava/lang/String;Ljava/util/Map;)V

    return-object p1

    :cond_105
    new-instance p0, Lwsd;

    invoke-direct {p0, v4, v0}, Lwsd;-><init>(Ljava/lang/String;Ljava/util/Map;)V

    return-object p0

    nop

    :pswitch_data_10c
    .packed-switch 0x0
        :pswitch_a2
        :pswitch_3e
    .end packed-switch
.end method

.method public final j()I
    .registers 1

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lorg/chromium/content_public/browser/WebContents;

    invoke-static {p0}, LJ/N;->M_4p2AnT(Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method public final j0(Ljava/util/List;)V
    .registers 4

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lmsh;

    iget-object v0, p0, Lmsh;->A:Lkm5;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lkm5;->a:Z

    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, v0, Lkm5;->c:Ljava/lang/Object;

    new-instance p1, Ljava/util/HashSet;

    iget-object p0, p0, Lmsh;->A:Lkm5;

    iget-object v0, p0, Lkm5;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashSet;

    invoke-direct {p1, v0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1e
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2e

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lssh;

    invoke-interface {v0}, Lssh;->a()V

    goto :goto_1e

    :cond_2e
    iget-object p0, p0, Lkm5;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashSet;

    invoke-virtual {p0}, Ljava/util/HashSet;->clear()V

    return-void
.end method

.method public final k(JJ)J
    .registers 5

    const-wide/16 p0, 0x0

    return-wide p0
.end method

.method public final k0(Ljava/lang/CharSequence;)V
    .registers 2

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Landroid/print/PrintDocumentAdapter$WriteResultCallback;

    invoke-virtual {p0, p1}, Landroid/print/PrintDocumentAdapter$WriteResultCallback;->onWriteFailed(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final l0(Landroid/view/View;Lg3o;)Lg3o;
    .registers 5

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Ljvj;

    const/16 p1, 0x8

    iget-object v0, p2, Lg3o;->a:Ld3o;

    invoke-virtual {v0, p1}, Ld3o;->i(I)Lr9b;

    move-result-object p1

    iget p1, p1, Lr9b;->d:I

    iget-object v0, p0, Ljvj;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->isInMultiWindowMode()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_21

    iget-boolean p1, p0, Ljvj;->d:Z

    if-eqz p1, :cond_2d

    iput-boolean v1, p0, Ljvj;->d:Z

    invoke-virtual {p0, v1}, Ljvj;->a(Z)V

    return-object p2

    :cond_21
    int-to-float p1, p1

    iget v0, p0, Ljvj;->c:F

    cmpl-float p1, p1, v0

    if-lez p1, :cond_29

    const/4 v1, 0x1

    :cond_29
    iget-boolean p1, p0, Ljvj;->d:Z

    if-ne p1, v1, :cond_2e

    :cond_2d
    return-object p2

    :cond_2e
    iput-boolean v1, p0, Ljvj;->d:Z

    invoke-virtual {p0, v1}, Ljvj;->a(Z)V

    return-object p2
.end method

.method public final m(JJ)J
    .registers 5

    const-wide p0, -0x7fffffffffffffffL    # -4.9E-324

    return-wide p0
.end method

.method public final m0(Lk5o;Lv31;)Lrn9;
    .registers 44

    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iget-object v1, v1, Llld;->b:Ljava/lang/Object;

    check-cast v1, Lj1d;

    new-instance v2, Lj1d;

    iget-object v3, v0, Lk5o;->b:Ljava/lang/Object;

    check-cast v3, Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-direct {v2, v3}, Lj1d;-><init>(I)V

    iget-object v3, v0, Lk5o;->b:Ljava/lang/Object;

    check-cast v3, Ljava/util/ArrayList;

    invoke-interface {v3}, Ljava/util/Collection;->size()I

    move-result v4

    const/4 v6, 0x0

    :goto_1e
    if-ge v6, v4, :cond_ae

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lnmg;

    iget-wide v8, v7, Lnmg;->a:J

    invoke-virtual {v1, v8, v9}, Lj1d;->c(J)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lmmg;

    if-nez v10, :cond_3b

    iget-wide v10, v7, Lnmg;->b:J

    iget-wide v12, v7, Lnmg;->d:J

    move-wide/from16 v25, v10

    move-wide/from16 v27, v12

    const/16 v29, 0x0

    goto :goto_4d

    :cond_3b
    iget-wide v11, v10, Lmmg;->a:J

    iget-boolean v13, v10, Lmmg;->c:Z

    iget-wide v14, v10, Lmmg;->b:J

    move-object/from16 v10, p2

    invoke-virtual {v10, v14, v15}, Lv31;->N(J)J

    move-result-wide v14

    move-wide/from16 v25, v11

    move/from16 v29, v13

    move-wide/from16 v27, v14

    :goto_4d
    iget-wide v11, v7, Lnmg;->a:J

    new-instance v16, Llmg;

    iget-wide v13, v7, Lnmg;->b:J

    move v15, v6

    iget-wide v5, v7, Lnmg;->d:J

    move-object/from16 v39, v3

    iget-boolean v3, v7, Lnmg;->e:Z

    move/from16 v23, v3

    iget v3, v7, Lnmg;->f:F

    move/from16 v24, v3

    iget-byte v3, v7, Lnmg;->g:B

    move/from16 v30, v3

    iget-object v3, v7, Lnmg;->i:Ljava/util/ArrayList;

    move-object/from16 v31, v3

    move/from16 v40, v4

    iget-wide v3, v7, Lnmg;->j:J

    move-wide/from16 v32, v3

    iget v3, v7, Lnmg;->k:F

    move/from16 v34, v3

    iget-wide v3, v7, Lnmg;->l:J

    move-wide/from16 v35, v3

    iget-wide v3, v7, Lnmg;->m:J

    move-wide/from16 v37, v3

    move-wide/from16 v21, v5

    move-wide/from16 v17, v11

    move-wide/from16 v19, v13

    invoke-direct/range {v16 .. v38}, Llmg;-><init>(JJJZFJJZILjava/util/ArrayList;JFJJ)V

    move-object/from16 v5, v16

    move-wide/from16 v3, v17

    invoke-virtual {v2, v3, v4, v5}, Lj1d;->g(JLjava/lang/Object;)V

    iget-boolean v3, v7, Lnmg;->e:Z

    if-eqz v3, :cond_a3

    new-instance v16, Lmmg;

    iget-wide v4, v7, Lnmg;->b:J

    iget-wide v6, v7, Lnmg;->c:J

    move/from16 v21, v3

    move-wide/from16 v17, v4

    move-wide/from16 v19, v6

    invoke-direct/range {v16 .. v21}, Lmmg;-><init>(JJZ)V

    move-object/from16 v3, v16

    invoke-virtual {v1, v8, v9, v3}, Lj1d;->g(JLjava/lang/Object;)V

    goto :goto_a6

    :cond_a3
    invoke-virtual {v1, v8, v9}, Lj1d;->i(J)V

    :goto_a6
    add-int/lit8 v6, v15, 0x1

    move-object/from16 v3, v39

    move/from16 v4, v40

    goto/16 :goto_1e

    :cond_ae
    new-instance v1, Lrn9;

    const/16 v3, 0x14

    invoke-direct {v1, v2, v0, v3}, Lrn9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v1
.end method

.method public final n(J)Lbjh;
    .registers 3

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lbjh;

    return-object p0
.end method

.method public final n0(F)V
    .registers 2

    return-void
.end method

.method public final o()Lb6e;
    .registers 1

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lr3b;

    invoke-interface {p0}, Lr3b;->o()Lb6e;

    move-result-object p0

    return-object p0
.end method

.method public final o0(Lhcj;)V
    .registers 15

    iget-object v0, p1, Lhcj;->f:Ljava/util/ArrayList;

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lmcj;

    iget-object v1, p0, Lmcj;->b:Ljava/lang/Object;

    check-cast v1, Lorg/chromium/ui/base/WindowAndroid;

    if-eqz v1, :cond_10

    iget-object v2, v1, Lorg/chromium/ui/base/WindowAndroid;->e:Ljava/lang/RuntimeException;

    if-eqz v2, :cond_1a

    :cond_10
    iget-object v1, p0, Lmcj;->a:Ljava/lang/Object;

    check-cast v1, Lorg/chromium/content_public/browser/WebContents;

    invoke-interface {v1}, Lorg/chromium/content_public/browser/WebContents;->k0()Lorg/chromium/ui/base/WindowAndroid;

    move-result-object v1

    iput-object v1, p0, Lmcj;->b:Ljava/lang/Object;

    :cond_1a
    if-eqz v1, :cond_fa

    iget-object p0, v1, Lorg/chromium/ui/base/WindowAndroid;->f:Lb2b;

    if-eqz p0, :cond_fa

    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/Context;

    if-eqz p0, :cond_fa

    new-instance v1, Lghf;

    new-instance v2, Li4d;

    iget-object v3, p1, Lhcj;->e:Ljava/lang/String;

    iget-object v4, p1, Lhcj;->b:Ljava/lang/String;

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-eqz v0, :cond_3c

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-le v7, v6, :cond_3c

    move v7, v6

    goto :goto_3d

    :cond_3c
    move v7, v5

    :goto_3d
    if-eqz v7, :cond_42

    const-string v8, "android.intent.action.SEND_MULTIPLE"

    goto :goto_44

    :cond_42
    const-string v8, "android.intent.action.SEND"

    :goto_44
    new-instance v9, Landroid/content/Intent;

    invoke-direct {v9, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/high16 v8, 0x13080000

    invoke-virtual {v9, v8}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const-string v8, "org.chromium.chrome.browser.share_origin"

    invoke-virtual {v9, v8, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object v8, p1, Lhcj;->a:Lorg/chromium/ui/base/WindowAndroid;

    invoke-virtual {v8}, Lorg/chromium/ui/base/WindowAndroid;->m()Lb2b;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/app/Activity;

    invoke-virtual {v8}, Landroid/app/Activity;->getTaskId()I

    move-result v8

    const-string v10, "org.chromium.chrome.extra.TASK_ID"

    invoke-virtual {v9, v10, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const/4 v8, 0x0

    if-eqz v0, :cond_82

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-lez v10, :cond_82

    if-eqz v3, :cond_82

    const-string v10, "image"

    invoke-virtual {v3, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_82

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/net/Uri;

    goto :goto_83

    :cond_82
    move-object v10, v8

    :goto_83
    const-string v11, "android.intent.extra.TEXT"

    const-string v12, "android.intent.extra.STREAM"

    if-eqz v10, :cond_b7

    if-nez v7, :cond_b7

    invoke-virtual {v9, v12, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    invoke-virtual {v9, v6}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    sget-object v0, Lt8;->a:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-virtual {v0, v10}, Landroid/content/ContentResolver;->getType(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v9, v3}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {v0, v8, v10}, Landroid/content/ClipData;->newUri(Landroid/content/ContentResolver;Ljava/lang/CharSequence;Landroid/net/Uri;)Landroid/content/ClipData;

    move-result-object v0

    invoke-virtual {v9, v0}, Landroid/content/Intent;->setClipData(Landroid/content/ClipData;)V

    invoke-virtual {p1}, Lhcj;->b()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_ef

    invoke-virtual {p1}, Lhcj;->b()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v9, v11, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_ef

    :cond_b7
    invoke-virtual {p1}, Lhcj;->b()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_c6

    const-string v8, "android.intent.extra.SUBJECT"

    invoke-virtual {v9, v8, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_c6
    invoke-virtual {p1}, Lhcj;->b()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v9, v11, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    if-eqz v0, :cond_e5

    invoke-virtual {v9, v3}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v9, v6}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    if-eqz v7, :cond_db

    invoke-virtual {v9, v12, v0}, Landroid/content/Intent;->putParcelableArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    goto :goto_ef

    :cond_db
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/Parcelable;

    invoke-virtual {v9, v12, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    goto :goto_ef

    :cond_e5
    const-string p1, "text/plain"

    invoke-virtual {v9, p1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "android.intent.extra.TITLE"

    invoke-virtual {v9, p1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_ef
    :goto_ef
    const/16 p1, 0x1a

    invoke-direct {v2, v9, p1}, Li4d;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v1, v2}, Lghf;-><init>(Li4d;)V

    invoke-virtual {v1, p0}, Lghf;->I(Landroid/content/Context;)Ljjm;

    :cond_fa
    return-void
.end method

.method public final onAdClicked()V
    .registers 2

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lopf;

    const-string v0, "showAd: onAdClicked"

    invoke-virtual {p0, v0}, Lopf;->a(Ljava/lang/String;)V

    iget-object p0, p0, Lopf;->c:Lcom/google/android/gms/ads/mediation/MediationInterstitialAdCallback;

    if-eqz p0, :cond_10

    invoke-interface {p0}, Lcom/google/android/gms/ads/mediation/MediationAdCallback;->reportAdClicked()V

    :cond_10
    return-void
.end method

.method public final onAdDismissed()V
    .registers 2

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lopf;

    const-string v0, "showAd: onAdDismissed"

    invoke-virtual {p0, v0}, Lopf;->a(Ljava/lang/String;)V

    iget-object v0, p0, Lopf;->c:Lcom/google/android/gms/ads/mediation/MediationInterstitialAdCallback;

    if-eqz v0, :cond_10

    invoke-interface {v0}, Lcom/google/android/gms/ads/mediation/MediationAdCallback;->onAdClosed()V

    :cond_10
    iget-object v0, p0, Lopf;->d:Ldhb;

    if-eqz v0, :cond_1a

    invoke-virtual {v0}, Lk8;->P()V

    const/4 v0, 0x0

    iput-object v0, p0, Lopf;->d:Ldhb;

    :cond_1a
    return-void
.end method

.method public final onAdOpened()V
    .registers 2

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lopf;

    const-string v0, "showAd: onAdOpened"

    invoke-virtual {p0, v0}, Lopf;->a(Ljava/lang/String;)V

    iget-object p0, p0, Lopf;->c:Lcom/google/android/gms/ads/mediation/MediationInterstitialAdCallback;

    if-eqz p0, :cond_10

    invoke-interface {p0}, Lcom/google/android/gms/ads/mediation/MediationAdCallback;->onAdOpened()V

    :cond_10
    return-void
.end method

.method public final onSuccess()V
    .registers 1

    return-void
.end method

.method public final p()Lx3e;
    .registers 1

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lr3b;

    invoke-interface {p0}, Lr3b;->p()Lx3e;

    move-result-object p0

    return-object p0
.end method

.method public final p0()V
    .registers 4

    iget-object v0, p0, Llld;->b:Ljava/lang/Object;

    check-cast v0, Lhld;

    iget-object v1, v0, Lhld;->j:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v1}, Landroid/view/View;->getAlpha()F

    move-result v1

    const/high16 v2, 0x3f800000    # 1.0f

    sub-float/2addr v2, v1

    const/high16 v1, 0x43160000    # 150.0f

    mul-float/2addr v2, v1

    float-to-int v1, v2

    iget-object v2, v0, Lhld;->j:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {p0, v1, v2}, Llld;->b0(ILandroid/view/View;)V

    iget-object v2, v0, Lhld;->k:Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p0, v1, v2}, Llld;->b0(ILandroid/view/View;)V

    iget-object v2, v0, Lhld;->s:Landroidx/appcompat/widget/AppCompatSeekBar;

    invoke-virtual {p0, v1, v2}, Llld;->b0(ILandroid/view/View;)V

    iget-object v2, v0, Lhld;->f:Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p0, v1, v2}, Llld;->b0(ILandroid/view/View;)V

    iget-object v0, v0, Lhld;->g:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {p0, v1, v0}, Llld;->b0(ILandroid/view/View;)V

    return-void
.end method

.method public final q(I)Lz4a;
    .registers 3

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lvxi;

    iget-object p0, p0, Lvxi;->e:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    const/4 v0, 0x1

    if-ne p0, v0, :cond_12

    sget-object p0, Lz4a;->d:Lz4a;

    return-object p0

    :cond_12
    if-nez p1, :cond_17

    sget-object p0, Lz4a;->a:Lz4a;

    return-object p0

    :cond_17
    sub-int/2addr p0, v0

    if-ne p1, p0, :cond_1d

    sget-object p0, Lz4a;->b:Lz4a;

    return-object p0

    :cond_1d
    sget-object p0, Lz4a;->c:Lz4a;

    return-object p0
.end method

.method public final r(JJ)J
    .registers 5

    const-wide/16 p0, 0x0

    return-wide p0
.end method

.method public final s()La4e;
    .registers 1

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lr3b;

    invoke-interface {p0}, Lr3b;->s()La4e;

    move-result-object p0

    return-object p0
.end method

.method public final t()Lu3e;
    .registers 1

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lr3b;

    invoke-interface {p0}, Lr3b;->t()Lu3e;

    move-result-object p0

    return-object p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    iget-byte v0, p0, Llld;->a:B

    sparse-switch v0, :sswitch_data_48

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :sswitch_a
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "{fragment="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Llwh;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, "}"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :sswitch_2c
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "ProviderMetadata{ componentName="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Landroid/content/ComponentName;

    invoke-virtual {p0}, Landroid/content/ComponentName;->flattenToShortString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " }"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :sswitch_data_48
    .sparse-switch
        0x1 -> :sswitch_2c
        0x13 -> :sswitch_a
    .end sparse-switch
.end method

.method public final v(I)Z
    .registers 2

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lorg/chromium/content_public/browser/WebContents;

    invoke-static {p0, p1}, LJ/N;->M5JRnMU2(Ljava/lang/Object;I)Z

    move-result p0

    return p0
.end method

.method public final w(Ld5o;)Lv7e;
    .registers 5

    new-instance v0, Lfc2;

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Landroid/content/res/Resources;

    const-class v1, Landroid/net/Uri;

    const-class v2, Landroid/content/res/AssetFileDescriptor;

    invoke-virtual {p1, v1, v2}, Ld5o;->r(Ljava/lang/Class;Ljava/lang/Class;)Lv7e;

    move-result-object p1

    invoke-direct {v0, p0, p1}, Lfc2;-><init>(Landroid/content/res/Resources;Lv7e;)V

    return-object v0
.end method

.method public final x()La2e;
    .registers 1

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lr3b;

    invoke-interface {p0}, Lr3b;->x()La2e;

    move-result-object p0

    return-object p0
.end method

.method public final y()Lm3i;
    .registers 1

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lr3b;

    invoke-interface {p0}, Lr3b;->y()Lm3i;

    move-result-object p0

    return-object p0
.end method

.method public final z(J)J
    .registers 3

    const-wide/16 p0, 0x1

    return-wide p0
.end method
