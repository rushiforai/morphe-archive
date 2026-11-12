.class public final Lhz4;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:Lcom/opera/android/settings/SettingsManager;

.field public final c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;

.field public final f:Ljava/lang/Object;

.field public final g:Ljava/lang/Object;

.field public final h:Ljava/lang/Object;

.field public final i:Ljava/lang/Object;

.field public final j:Ljava/lang/Object;

.field public final k:Ljava/lang/Object;

.field public final l:Ljava/lang/Object;

.field public final m:Ljava/lang/Object;

.field public final n:Ljava/lang/Object;

.field public final o:Ljava/lang/Object;

.field public final p:Ljava/lang/Object;

.field public final q:Ljava/lang/Object;

.field public final r:Ljava/lang/Object;

.field public s:Ljava/lang/Object;

.field public final t:Ljava/lang/Object;


# direct methods
.method public constructor <init>(ILd8e;Ldbf;Ldbf;Ldbf;Lbpd;Lk6l;Lcom/opera/android/settings/SettingsManager;Ls28;Lumi;Lpt3;Lmdh;Lqdh;Lcul;Lxnh;Ldbf;Lwcd;Liuh;Lwok;Ld8e;)V
    .registers 21

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lhz4;->a:Z

    iput-object p2, p0, Lhz4;->c:Ljava/lang/Object;

    iput-object p3, p0, Lhz4;->d:Ljava/lang/Object;

    iput-object p4, p0, Lhz4;->e:Ljava/lang/Object;

    iput-object p5, p0, Lhz4;->f:Ljava/lang/Object;

    iput-object p6, p0, Lhz4;->g:Ljava/lang/Object;

    iput-object p7, p0, Lhz4;->h:Ljava/lang/Object;

    iput-object p8, p0, Lhz4;->b:Lcom/opera/android/settings/SettingsManager;

    iput-object p9, p0, Lhz4;->i:Ljava/lang/Object;

    iput-object p10, p0, Lhz4;->j:Ljava/lang/Object;

    iput-object p11, p0, Lhz4;->k:Ljava/lang/Object;

    iput-object p12, p0, Lhz4;->l:Ljava/lang/Object;

    iput-object p13, p0, Lhz4;->m:Ljava/lang/Object;

    iput-object p14, p0, Lhz4;->n:Ljava/lang/Object;

    iput-object p15, p0, Lhz4;->o:Ljava/lang/Object;

    move-object/from16 p1, p16

    iput-object p1, p0, Lhz4;->p:Ljava/lang/Object;

    move-object/from16 p1, p17

    iput-object p1, p0, Lhz4;->q:Ljava/lang/Object;

    move-object/from16 p1, p18

    iput-object p1, p0, Lhz4;->r:Ljava/lang/Object;

    move-object/from16 p1, p19

    iput-object p1, p0, Lhz4;->s:Ljava/lang/Object;

    move-object/from16 p1, p20

    iput-object p1, p0, Lhz4;->t:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lt5d;ZLeq9;Ltgi;Lqi;Lxw3;Lxw3;Livn;Lg1j;Lqp2;Lq6e;Lx5f;Leej;Lpt3;Ld7h;Ljv0;Lcom/opera/android/settings/SettingsManager;Le00;)V
    .registers 19

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iput-object p1, p0, Lhz4;->c:Ljava/lang/Object;

    .line 56
    iput-boolean p2, p0, Lhz4;->a:Z

    .line 57
    iput-object p3, p0, Lhz4;->f:Ljava/lang/Object;

    .line 58
    iput-object p4, p0, Lhz4;->g:Ljava/lang/Object;

    .line 59
    iput-object p5, p0, Lhz4;->d:Ljava/lang/Object;

    .line 60
    iput-object p6, p0, Lhz4;->h:Ljava/lang/Object;

    .line 61
    iput-object p7, p0, Lhz4;->i:Ljava/lang/Object;

    .line 62
    iput-object p8, p0, Lhz4;->j:Ljava/lang/Object;

    .line 63
    iput-object p9, p0, Lhz4;->k:Ljava/lang/Object;

    .line 64
    iput-object p10, p0, Lhz4;->l:Ljava/lang/Object;

    .line 65
    iput-object p11, p0, Lhz4;->m:Ljava/lang/Object;

    .line 66
    iput-object p12, p0, Lhz4;->n:Ljava/lang/Object;

    .line 67
    iput-object p13, p0, Lhz4;->o:Ljava/lang/Object;

    .line 68
    iput-object p14, p0, Lhz4;->p:Ljava/lang/Object;

    .line 69
    iput-object p15, p0, Lhz4;->q:Ljava/lang/Object;

    move-object/from16 p1, p16

    .line 70
    iput-object p1, p0, Lhz4;->r:Ljava/lang/Object;

    move-object/from16 p1, p17

    .line 71
    iput-object p1, p0, Lhz4;->b:Lcom/opera/android/settings/SettingsManager;

    move-object/from16 p1, p18

    .line 72
    iput-object p1, p0, Lhz4;->t:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a(ZLorg/chromium/content_public/browser/WebContents;)Lcom/opera/android/browser/chromium/ChromiumContent;
    .registers 16

    iget-object v0, p0, Lhz4;->n:Ljava/lang/Object;

    move-object v5, v0

    check-cast v5, Lx5f;

    iget-object v0, p0, Lhz4;->c:Ljava/lang/Object;

    check-cast v0, Lt5d;

    if-nez p2, :cond_12

    const/4 p2, 0x1

    invoke-static {p1, p2}, LJ/N;->M_FZHKB_(ZZ)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lorg/chromium/content_public/browser/WebContents;

    :cond_12
    move-object v9, p2

    new-instance v1, Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object p2, p0, Lhz4;->s:Ljava/lang/Object;

    move-object v7, p2

    check-cast v7, Lala;

    iget-object p2, p0, Lhz4;->d:Ljava/lang/Object;

    move-object v8, p2

    check-cast v8, Lqi;

    iget-boolean v11, p0, Lhz4;->a:Z

    const/4 v12, 0x0

    move v10, p1

    move-object v6, v1

    invoke-direct/range {v6 .. v12}, Lcom/opera/android/browser/chromium/ChromiumContent;-><init>(Ljz4;Lqi;Lorg/chromium/content_public/browser/WebContents;ZZI)V

    new-instance v2, Lqy4;

    iget-boolean p1, p0, Lhz4;->a:Z

    if-eqz p1, :cond_2f

    const/4 p2, 0x2

    goto :goto_31

    :cond_2f
    const/16 p2, 0x1d

    :goto_31
    new-instance v3, Lvk2;

    const/4 v4, 0x6

    invoke-direct {v3, v4}, Lvk2;-><init>(B)V

    invoke-static {v0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v6

    move-object v4, v1

    move-object v1, v2

    move v2, p2

    invoke-direct/range {v1 .. v6}, Lqy4;-><init>(ILcom/opera/api/Callback;Lcom/opera/android/browser/chromium/ChromiumContent;Lx5f;Lru9;)V

    move-object v2, v1

    move-object v1, v4

    iget-object p2, p0, Lhz4;->k:Ljava/lang/Object;

    move-object v3, p2

    check-cast v3, Lg1j;

    iget-object p2, p0, Lhz4;->l:Ljava/lang/Object;

    move-object v4, p2

    check-cast v4, Lqp2;

    iget-object p2, p0, Lhz4;->h:Ljava/lang/Object;

    check-cast p2, Lxw3;

    invoke-virtual {p2, v1}, Lxw3;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lorg/chromium/components/navigation_interception/InterceptNavigationDelegate;

    iget-object v6, p0, Lhz4;->i:Ljava/lang/Object;

    check-cast v6, Lxw3;

    invoke-virtual {v6, v1}, Lxw3;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lype;

    iget-object v12, p0, Lhz4;->o:Ljava/lang/Object;

    move-object v8, v12

    check-cast v8, Leej;

    iget-object v7, p0, Lhz4;->p:Ljava/lang/Object;

    move-object v9, v7

    check-cast v9, Lpt3;

    iget-object v7, p0, Lhz4;->q:Ljava/lang/Object;

    move-object v10, v7

    check-cast v10, Ld7h;

    iget-object v7, p0, Lhz4;->r:Ljava/lang/Object;

    move-object v11, v7

    check-cast v11, Ljv0;

    move-object v7, v5

    move-object v5, p2

    invoke-virtual/range {v1 .. v11}, Lcom/opera/android/browser/chromium/ChromiumContent;->t(Lqy4;Lg1j;Lqp2;Lorg/chromium/components/navigation_interception/InterceptNavigationDelegate;Lype;Lx5f;Leej;Lpt3;Ld7h;Ljv0;)V

    move-object v5, v7

    if-nez p1, :cond_8f

    iget-object p1, p0, Lhz4;->e:Ljava/lang/Object;

    check-cast p1, Laz3;

    invoke-virtual {v1, p1}, Lcom/opera/android/browser/chromium/ChromiumContent;->k(Liz4;)V

    new-instance p1, Lcom/opera/android/search/YandexPromotionTabHelper;

    invoke-virtual {v1}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p2

    check-cast v12, Leej;

    invoke-direct {p1, p2, v12, v0, v5}, Lcom/opera/android/search/YandexPromotionTabHelper;-><init>(Lorg/chromium/content_public/browser/WebContents;Leej;Lt5d;Lx5f;)V

    :cond_8f
    iget-object p1, p0, Lhz4;->f:Ljava/lang/Object;

    check-cast p1, Leq9;

    iget-object p1, p1, Leq9;->e:Lty3;

    invoke-virtual {v1, p1}, Lcom/opera/android/browser/chromium/ChromiumContent;->k(Liz4;)V

    iget-object p0, p0, Lhz4;->g:Ljava/lang/Object;

    check-cast p0, Ltgi;

    iget-object p1, p0, Ltgi;->b:Ljava/util/LinkedHashSet;

    invoke-interface {p1, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_a5

    return-object v1

    :cond_a5
    iget-object p1, p0, Ltgi;->d:Lty3;

    invoke-virtual {v1, p1}, Lcom/opera/android/browser/chromium/ChromiumContent;->k(Liz4;)V

    invoke-virtual {p0, v1}, Ltgi;->a(Lcom/opera/android/browser/chromium/ChromiumContent;)V

    return-object v1
.end method
