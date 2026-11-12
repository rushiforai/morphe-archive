.class public final Luy3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Le7l;


# static fields
.field public static final g:Ljava/util/HashMap;


# instance fields
.field public final a:Lh7f;

.field public final b:Lcom/opera/android/browser/chromium/ChromiumContent;

.field public c:Lz4k;

.field public final d:Lvzk;

.field public e:Lcom/opera/android/browser/TabInfo;

.field public f:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Luy3;->g:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>(Lvzk;Lcom/opera/android/browser/chromium/ChromiumContent;ILcom/opera/android/browser/TabInfo;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lh7f;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Luy3;->a:Lh7f;

    new-instance v0, Lty3;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lty3;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Luy3;->d:Lvzk;

    iput-object p2, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    new-instance p1, Lole;

    invoke-direct {p1, p0}, Lole;-><init>(Ljava/lang/Object;)V

    iput-object p1, p2, Lcom/opera/android/browser/chromium/ChromiumContent;->m:Lez4;

    invoke-virtual {p2, v0}, Lcom/opera/android/browser/chromium/ChromiumContent;->k(Liz4;)V

    iput p3, p2, Lcom/opera/android/browser/WebContentsWrapper;->i:I

    iget-object p1, p2, Lcom/opera/android/browser/chromium/ChromiumContent;->z:Lard;

    invoke-virtual {p1}, Lard;->f()V

    sget-object p1, Luy3;->g:Ljava/util/HashMap;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p1, p2, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p4, p0, Luy3;->e:Lcom/opera/android/browser/TabInfo;

    return-void
.end method

.method public static F(Lb9l;)Luy3;
    .registers 2

    invoke-interface {p0}, Lb9l;->getId()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    sget-object v0, Luy3;->g:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Luy3;

    return-object p0
.end method

.method public static H(Lb2l;)Lcom/opera/android/browser/chromium/ChromiumContent;
    .registers 1

    invoke-static {p0}, Luy3;->F(Lb9l;)Luy3;

    move-result-object p0

    if-eqz p0, :cond_9

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    return-object p0

    :cond_9
    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public final A()Z
    .registers 5

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-wide v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->n:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-eqz p0, :cond_12

    invoke-static {v0, v1}, LJ/N;->Msp1FMud(J)Z

    move-result p0

    if-eqz p0, :cond_12

    const/4 p0, 0x1

    return p0

    :cond_12
    const/4 p0, 0x0

    return p0
.end method

.method public final B()I
    .registers 2

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    invoke-interface {p0}, Lorg/chromium/content_public/browser/WebContents;->q()Lorg/chromium/content_public/browser/NavigationController;

    move-result-object p0

    invoke-interface {p0}, Lorg/chromium/content_public/browser/NavigationController;->t()I

    move-result v0

    if-ltz v0, :cond_17

    invoke-interface {p0, v0}, Lorg/chromium/content_public/browser/NavigationController;->i(I)Lorg/chromium/content_public/browser/NavigationEntry;

    move-result-object p0

    iget p0, p0, Lorg/chromium/content_public/browser/NavigationEntry;->d:I

    return p0

    :cond_17
    const/4 p0, 0x0

    return p0
.end method

.method public final C(ZZLcom/opera/api/Callback;)V
    .registers 5

    if-nez p1, :cond_1f

    if-nez p2, :cond_1f

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object p1, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->o:Ljz4;

    invoke-interface {p1}, Ljz4;->h()I

    move-result p1

    iget-object p2, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->o:Ljz4;

    invoke-interface {p2}, Ljz4;->g()I

    move-result p2

    add-int/2addr p2, p1

    new-instance p1, Ltt2;

    const/4 v0, 0x2

    invoke-direct {p1, p3, p2, v0}, Ltt2;-><init>(Ljava/lang/Object;IB)V

    iget-wide p2, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->n:J

    invoke-static {p2, p3, p1}, LJ/N;->MGbhXOWD(JLjava/lang/Object;)V

    return-void

    :cond_1f
    const/4 p0, 0x0

    invoke-interface {p3, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final D(Ljava/lang/Runnable;)Lhh4;
    .registers 2

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/chromium/ChromiumContent;->q()Lvz5;

    move-result-object p0

    iget-object p0, p0, Lvz5;->f:Ljava/lang/Object;

    check-cast p0, Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lj5m;

    invoke-virtual {p0, p1}, Lj5m;->a(Ljava/lang/Runnable;)Lhh4;

    move-result-object p0

    return-object p0
.end method

.method public final E(IZLcom/opera/api/Callback;)V
    .registers 6

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-wide v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->n:J

    invoke-static {v0, v1, p1, p2, p3}, LJ/N;->MiC4wbtM(JIZLjava/lang/Object;)V

    return-void
.end method

.method public final G()Ljava/lang/String;
    .registers 3

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-wide v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->n:J

    invoke-static {v0, v1}, LJ/N;->MA_5vIay(J)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public final I()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/chromium/ChromiumContent;->n()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final J()Z
    .registers 1

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-boolean p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->t:Z

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public final K()I
    .registers 4

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->x:Lcom/opera/android/browser/chromium/OperaWebContentsDelegate;

    if-eqz v0, :cond_1f

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->H:Lnp1;

    iget-boolean v0, p0, Lnp1;->a:Z

    if-eqz v0, :cond_1f

    iget-object p0, p0, Lnp1;->d:Ljava/lang/Object;

    check-cast p0, Lr4h;

    iget v0, p0, Lr4h;->c:I

    const/16 v1, 0x2710

    const/16 v2, 0x64

    if-ne v0, v2, :cond_1a

    move p0, v1

    goto :goto_1c

    :cond_1a
    iget p0, p0, Lr4h;->f:I

    :goto_1c
    mul-int/2addr p0, v2

    div-int/2addr p0, v1

    return p0

    :cond_1f
    const/4 p0, 0x0

    return p0
.end method

.method public final M(Z)Z
    .registers 3

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->o:Ljz4;

    invoke-interface {v0, p0, p1}, Ljz4;->r(Lcom/opera/android/browser/chromium/ChromiumContent;Z)Z

    move-result p0

    return p0
.end method

.method public final N()V
    .registers 3

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->f()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v0

    if-eqz v0, :cond_f

    invoke-interface {v0}, Lorg/chromium/content_public/browser/WebContents;->p0()V

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lorg/chromium/content_public/browser/WebContents;->setAudioMuted(Z)V

    :cond_f
    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->z:Lard;

    if-eqz p0, :cond_16

    invoke-virtual {p0}, Lard;->c()V

    :cond_16
    return-void
.end method

.method public final O()Z
    .registers 5

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-wide v0, p0, Lcom/opera/android/browser/WebContentsWrapper;->a:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-eqz p0, :cond_12

    invoke-static {v0, v1}, LJ/N;->MWxyiKiL(J)Z

    move-result p0

    if-eqz p0, :cond_12

    const/4 p0, 0x1

    return p0

    :cond_12
    const/4 p0, 0x0

    return p0
.end method

.method public final P()I
    .registers 1

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    invoke-static {p0}, LJ/N;->MV0r1H9h(Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method public final Q(Lcom/opera/api/Callback;)Z
    .registers 2

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    invoke-static {p0, p1}, LJ/N;->M30rDk55(Ljava/lang/Object;Ljava/lang/Object;)V

    const/4 p0, 0x1

    return p0
.end method

.method public final R()Lzg;
    .registers 1

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->A:Lzg;

    return-object p0
.end method

.method public final S()Z
    .registers 1

    iget-boolean p0, p0, Luy3;->f:Z

    return p0
.end method

.method public final U()Lvz5;
    .registers 1

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/chromium/ChromiumContent;->q()Lvz5;

    move-result-object p0

    return-object p0
.end method

.method public final V()V
    .registers 1

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    invoke-interface {p0}, Lorg/chromium/content_public/browser/WebContents;->stop()V

    return-void
.end method

.method public final W(Z)V
    .registers 2

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0, p1}, Lcom/opera/android/browser/chromium/ChromiumContent;->z(Z)V

    return-void
.end method

.method public final X()V
    .registers 6

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v0

    invoke-static {v0}, LJ/N;->MhKYEP1z(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    return-void

    :cond_d
    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->c()Ldx3;

    move-result-object v0

    invoke-static {v0}, Lsfe;->U(Landroid/content/Context;)Lz77;

    move-result-object v1

    new-instance v2, Lmv;

    sget-object v3, Lvml;->d:Lumi;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    invoke-interface {p0}, Lorg/chromium/content_public/browser/WebContents;->s()Lorg/chromium/url/GURL;

    move-result-object v4

    invoke-static {v4}, Lz5i;->b0(Lorg/chromium/url/GURL;)Z

    move-result v4

    if-eqz v4, :cond_35

    new-instance v4, Lhd;

    invoke-interface {p0}, Lorg/chromium/content_public/browser/WebContents;->s()Lorg/chromium/url/GURL;

    move-result-object p0

    invoke-virtual {p0}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v4, v0, v3, p0}, Lhd;-><init>(Ldx3;Lumi;Ljava/lang/String;)V

    goto :goto_3a

    :cond_35
    new-instance v4, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;

    invoke-direct {v4, v0, v3, p0}, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;-><init>(Ldx3;Lumi;Lorg/chromium/content_public/browser/WebContents;)V

    :goto_3a
    const/4 p0, 0x0

    invoke-direct {v2, v4, p0}, Lmv;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {v1, v2, p0}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method

.method public final Y()I
    .registers 1

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    invoke-static {p0}, LJ/N;->M$CFPNhV(Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method public final Z(Llsc;)V
    .registers 2

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0, p1}, Lcom/opera/android/browser/chromium/ChromiumContent;->v(Llsc;)V

    return-void
.end method

.method public final a()Lcom/opera/android/browser/TabInfo;
    .registers 1

    iget-object p0, p0, Luy3;->e:Lcom/opera/android/browser/TabInfo;

    return-object p0
.end method

.method public final a0()Lorg/chromium/ui/base/WindowAndroid;
    .registers 1

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object p0, p0, Lcom/opera/android/browser/WebContentsWrapper;->b:Lqi;

    return-object p0
.end method

.method public final b()V
    .registers 2

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/opera/android/browser/chromium/ChromiumContent;->x(Z)V

    return-void
.end method

.method public final b0()Lqwi;
    .registers 6

    new-instance v0, Lqwi;

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/chromium/ChromiumContent;->o()Lnwi;

    move-result-object v1

    new-instance v2, Lhwi;

    iget-wide v3, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->n:J

    invoke-static {v3, v4}, LJ/N;->MCHF1Vfr(J)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/browser/SecurityInfo;

    invoke-direct {v2, p0}, Lhwi;-><init>(Lcom/opera/android/browser/SecurityInfo;)V

    invoke-direct {v0, v1, v2}, Lqwi;-><init>(Lnwi;Lhwi;)V

    return-object v0
.end method

.method public final c()V
    .registers 1

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->d()Lorg/chromium/content_public/browser/NavigationController;

    move-result-object p0

    invoke-interface {p0}, Lorg/chromium/content_public/browser/NavigationController;->c()V

    return-void
.end method

.method public final c0()Z
    .registers 2

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->o:Ljz4;

    invoke-interface {v0, p0}, Ljz4;->n(Lcom/opera/android/browser/chromium/ChromiumContent;)Z

    move-result p0

    return p0
.end method

.method public final d()V
    .registers 1

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/chromium/ChromiumContent;->s()V

    return-void
.end method

.method public final d0(Ljava/lang/String;ZLcom/opera/api/Callback;)V
    .registers 11

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->h()Z

    move-result v0

    if-eqz v0, :cond_d

    const/4 p0, 0x0

    invoke-interface {p3, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_d
    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v1

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->getView()Landroid/view/View;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lnr8;->e(Landroid/content/Context;)I

    move-result v5

    invoke-static {v1}, LJ/N;->M4P_efwZ(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_24

    return-void

    :cond_24
    new-instance v0, Lcom/opera/android/favorites/SpeedDialDataFetcher;

    move-object v2, p1

    move v3, p2

    move-object v6, p3

    invoke-direct/range {v0 .. v6}, Lcom/opera/android/favorites/SpeedDialDataFetcher;-><init>(Lorg/chromium/content_public/browser/WebContents;Ljava/lang/String;ILandroid/content/Context;ILcom/opera/api/Callback;)V

    return-void
.end method

.method public final dispose()V
    .registers 3

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget v0, p0, Lcom/opera/android/browser/WebContentsWrapper;->i:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sget-object v1, Luy3;->g:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/opera/android/browser/chromium/ChromiumContent;->l()V

    return-void
.end method

.method public final e()V
    .registers 2

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->h()Z

    move-result v0

    if-nez v0, :cond_15

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->d()Lorg/chromium/content_public/browser/NavigationController;

    move-result-object p0

    invoke-interface {p0}, Lorg/chromium/content_public/browser/NavigationController;->f()Z

    move-result v0

    if-eqz v0, :cond_15

    invoke-interface {p0}, Lorg/chromium/content_public/browser/NavigationController;->e()V

    :cond_15
    return-void
.end method

.method public final f()Z
    .registers 2

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->h()Z

    move-result v0

    if-nez v0, :cond_14

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->d()Lorg/chromium/content_public/browser/NavigationController;

    move-result-object p0

    invoke-interface {p0}, Lorg/chromium/content_public/browser/NavigationController;->f()Z

    move-result p0

    if-eqz p0, :cond_14

    const/4 p0, 0x1

    return p0

    :cond_14
    const/4 p0, 0x0

    return p0
.end method

.method public final g()Z
    .registers 1

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->d()Lorg/chromium/content_public/browser/NavigationController;

    move-result-object p0

    invoke-interface {p0}, Lorg/chromium/content_public/browser/NavigationController;->g()Z

    move-result p0

    return p0
.end method

.method public final getId()I
    .registers 1

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget p0, p0, Lcom/opera/android/browser/WebContentsWrapper;->i:I

    return p0
.end method

.method public final getUrl()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/chromium/ChromiumContent;->r()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final h(I)V
    .registers 3

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->h()Z

    move-result v0

    if-nez v0, :cond_15

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->d()Lorg/chromium/content_public/browser/NavigationController;

    move-result-object p0

    invoke-interface {p0, p1}, Lorg/chromium/content_public/browser/NavigationController;->s(I)Z

    move-result v0

    if-eqz v0, :cond_15

    invoke-interface {p0, p1}, Lorg/chromium/content_public/browser/NavigationController;->h(I)V

    :cond_15
    return-void
.end method

.method public final i()Lcom/opera/android/browser/NavigationHistory;
    .registers 3

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    new-instance v0, Llld;

    const/4 v1, 0x5

    invoke-direct {v0, p0, v1}, Llld;-><init>(Ljava/lang/Object;B)V

    return-object v0
.end method

.method public final isActive()Z
    .registers 1

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-boolean p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->r:Z

    return p0
.end method

.method public final isAudioMuted()Z
    .registers 2

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->h()Z

    move-result v0

    if-nez v0, :cond_14

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    invoke-interface {p0}, Lorg/chromium/content_public/browser/WebContents;->isAudioMuted()Z

    move-result p0

    if-eqz p0, :cond_14

    const/4 p0, 0x1

    return p0

    :cond_14
    const/4 p0, 0x0

    return p0
.end method

.method public final isLoading()Z
    .registers 1

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->H:Lnp1;

    iget-boolean p0, p0, Lnp1;->a:Z

    return p0
.end method

.method public final j(II)Z
    .registers 3

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    invoke-static {p0, p1, p2}, LJ/N;->M$0a8QHM(Ljava/lang/Object;II)Z

    move-result p0

    return p0
.end method

.method public final k(Z)V
    .registers 2

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0, p1}, Lcom/opera/android/browser/WebContentsWrapper;->setUseDesktopUserAgent(Z)V

    return-void
.end method

.method public final l()V
    .registers 2

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->h()Z

    move-result v0

    if-nez v0, :cond_15

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->d()Lorg/chromium/content_public/browser/NavigationController;

    move-result-object p0

    invoke-interface {p0}, Lorg/chromium/content_public/browser/NavigationController;->n()Z

    move-result v0

    if-eqz v0, :cond_15

    invoke-interface {p0}, Lorg/chromium/content_public/browser/NavigationController;->l()V

    :cond_15
    return-void
.end method

.method public final m()Z
    .registers 1

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-boolean p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->t:Z

    return p0
.end method

.method public final n()Z
    .registers 2

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->h()Z

    move-result v0

    if-nez v0, :cond_14

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->d()Lorg/chromium/content_public/browser/NavigationController;

    move-result-object p0

    invoke-interface {p0}, Lorg/chromium/content_public/browser/NavigationController;->n()Z

    move-result p0

    if-eqz p0, :cond_14

    const/4 p0, 0x1

    return p0

    :cond_14
    const/4 p0, 0x0

    return p0
.end method

.method public final o()V
    .registers 2

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->o:Ljz4;

    invoke-interface {v0, p0}, Ljz4;->E(Lcom/opera/android/browser/chromium/ChromiumContent;)V

    return-void
.end method

.method public final p()V
    .registers 2

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/opera/android/browser/chromium/ChromiumContent;->x(Z)V

    return-void
.end method

.method public final q()V
    .registers 2

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->o:Ljz4;

    invoke-interface {v0, p0}, Ljz4;->G(Lcom/opera/android/browser/chromium/ChromiumContent;)V

    return-void
.end method

.method public final r()Z
    .registers 1

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-boolean p0, p0, Lcom/opera/android/browser/WebContentsWrapper;->j:Z

    return p0
.end method

.method public final s(Lcom/opera/android/browser/TabInfo;)Z
    .registers 5

    iget-object v0, p0, Luy3;->e:Lcom/opera/android/browser/TabInfo;

    invoke-virtual {v0, p1}, Lcom/opera/android/browser/TabInfo;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    iget-object v0, p0, Luy3;->e:Lcom/opera/android/browser/TabInfo;

    iput-object p1, p0, Luy3;->e:Lcom/opera/android/browser/TabInfo;

    iget-object p0, p0, Luy3;->a:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :cond_14
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_38

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb7l;

    iget-object p1, p1, Lb7l;->a:Ld7l;

    iget-object v1, p1, Ld7l;->g:Lh7f;

    invoke-static {v1, v1}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v1

    :goto_28
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_14

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, La2l;

    invoke-interface {v2, p1, v0}, La2l;->T(Lb2l;Lcom/opera/android/browser/TabInfo;)V

    goto :goto_28

    :cond_38
    const/4 p0, 0x1

    return p0
.end method

.method public final setAudioMuted(Z)V
    .registers 3

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->h()Z

    move-result v0

    if-nez v0, :cond_f

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    invoke-interface {p0, p1}, Lorg/chromium/content_public/browser/WebContents;->setAudioMuted(Z)V

    :cond_f
    return-void
.end method

.method public final show()V
    .registers 1

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/chromium/ChromiumContent;->B()V

    return-void
.end method

.method public final t()Lesk;
    .registers 3

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/chromium/ChromiumContent;->p()Ljava/lang/String;

    move-result-object p0

    new-instance v0, Lsy3;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lsy3;-><init>(Ljava/lang/String;B)V

    return-object v0
.end method

.method public final u()V
    .registers 1

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->i()V

    return-void
.end method

.method public final v()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final w(Lb7l;)V
    .registers 2

    iget-object p0, p0, Luy3;->a:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final x(Landroid/net/Uri;Lcom/opera/api/Callback;)Z
    .registers 5

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->h()Z

    move-result v0

    if-nez v0, :cond_29

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    const-string v0, "file"

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1d

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p1

    goto :goto_21

    :cond_1d
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    :goto_21
    invoke-static {p0, p1, p2}, LJ/N;->MQ210P2s(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_29

    const/4 p0, 0x1

    return p0

    :cond_29
    const/4 p0, 0x0

    return p0
.end method

.method public final y()Lt59;
    .registers 1

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->M:Lt59;

    return-object p0
.end method

.method public final z()Z
    .registers 2

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->h()Z

    move-result v0

    if-nez v0, :cond_14

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    invoke-static {p0}, LJ/N;->MKZFebr4(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_14

    const/4 p0, 0x1

    return p0

    :cond_14
    const/4 p0, 0x0

    return p0
.end method
