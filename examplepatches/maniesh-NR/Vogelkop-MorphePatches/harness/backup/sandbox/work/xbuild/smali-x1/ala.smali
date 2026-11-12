.class public final Lala;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljz4;


# static fields
.field public static final m:Ls16;


# instance fields
.field public a:Ljava/lang/Object;

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;

.field public f:Ljava/lang/Object;

.field public g:Ljava/lang/Object;

.field public h:Ljava/lang/Object;

.field public i:Ljava/lang/Object;

.field public j:Ljava/lang/Object;

.field public k:Ljava/lang/Object;

.field public l:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ls16;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lala;->m:Ls16;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lw8i;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lala;->a:Ljava/lang/Object;

    new-instance v0, Lw8i;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lala;->b:Ljava/lang/Object;

    new-instance v0, Lw8i;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lala;->c:Ljava/lang/Object;

    new-instance v0, Lw8i;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lala;->d:Ljava/lang/Object;

    new-instance v0, Li3;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Li3;-><init>(F)V

    iput-object v0, p0, Lala;->e:Ljava/lang/Object;

    new-instance v0, Li3;

    invoke-direct {v0, v1}, Li3;-><init>(F)V

    iput-object v0, p0, Lala;->f:Ljava/lang/Object;

    new-instance v0, Li3;

    invoke-direct {v0, v1}, Li3;-><init>(F)V

    iput-object v0, p0, Lala;->g:Ljava/lang/Object;

    new-instance v0, Li3;

    invoke-direct {v0, v1}, Li3;-><init>(F)V

    iput-object v0, p0, Lala;->h:Ljava/lang/Object;

    new-instance v0, Lqs7;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lqs7;-><init>(B)V

    iput-object v0, p0, Lala;->i:Ljava/lang/Object;

    new-instance v0, Lqs7;

    invoke-direct {v0, v1}, Lqs7;-><init>(B)V

    iput-object v0, p0, Lala;->j:Ljava/lang/Object;

    new-instance v0, Lqs7;

    invoke-direct {v0, v1}, Lqs7;-><init>(B)V

    iput-object v0, p0, Lala;->k:Ljava/lang/Object;

    new-instance v0, Lqs7;

    invoke-direct {v0, v1}, Lqs7;-><init>(B)V

    iput-object v0, p0, Lala;->l:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final A(Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 14

    new-instance v0, Lnz4;

    iget-object v1, p0, Lala;->d:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/browser/chromium/ChromiumContainerView;

    iget-object v2, p0, Lala;->c:Ljava/lang/Object;

    check-cast v2, Lysl;

    invoke-direct {v0, v1, v2}, Lnz4;-><init>(Lcom/opera/android/browser/chromium/ChromiumContainerView;Lysl;)V

    new-instance v2, Lg7b;

    iget-object v3, p0, Lala;->b:Ljava/lang/Object;

    check-cast v3, Lt5d;

    iget-object v1, v1, Lcom/opera/android/browser/chromium/ChromiumContainerView;->b:Lzy4;

    iget-object v1, v1, Lzy4;->a:Lb7f;

    invoke-direct {v2, v3, p1, v1}, Lg7b;-><init>(Lt5d;Lcom/opera/android/browser/chromium/ChromiumContent;Lb7f;)V

    invoke-virtual {p1}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v1

    sget-object v3, Lmkh;->d:Ls49;

    iget-object v4, v2, Lg7b;->m:Lorg/chromium/content_public/browser/WebContents;

    const-class v5, Lorg/chromium/content/browser/GestureListenerManagerImpl;

    iget-object v6, v2, Lg7b;->a:Ltz4;

    if-eqz v4, :cond_33

    sget-object v7, Lorg/chromium/content/browser/GestureListenerManagerImpl;->n:Landroid/util/LongSparseArray;

    invoke-interface {v4, v5, v3}, Lorg/chromium/content_public/browser/WebContents;->X(Ljava/lang/Class;Lktn;)Lytm;

    move-result-object v4

    check-cast v4, Lorg/chromium/content/browser/GestureListenerManagerImpl;

    invoke-virtual {v4, v6}, Lorg/chromium/content/browser/GestureListenerManagerImpl;->h(Ljw9;)V

    :cond_33
    iput-object v1, v2, Lg7b;->m:Lorg/chromium/content_public/browser/WebContents;

    if-eqz v1, :cond_43

    sget-object v4, Lorg/chromium/content/browser/GestureListenerManagerImpl;->n:Landroid/util/LongSparseArray;

    invoke-interface {v1, v5, v3}, Lorg/chromium/content_public/browser/WebContents;->X(Ljava/lang/Class;Lktn;)Lytm;

    move-result-object v1

    check-cast v1, Lorg/chromium/content/browser/GestureListenerManagerImpl;

    const/4 v3, 0x2

    invoke-virtual {v1, v6, v3}, Lorg/chromium/content/browser/GestureListenerManagerImpl;->b(Ljw9;I)V

    :cond_43
    iget-object v1, p0, Lala;->e:Ljava/lang/Object;

    move-object v6, v1

    check-cast v6, Livn;

    iget-object v1, p0, Lala;->f:Ljava/lang/Object;

    move-object v7, v1

    check-cast v7, Lg1j;

    iget-object v1, p0, Lala;->g:Ljava/lang/Object;

    move-object v8, v1

    check-cast v8, Lq6e;

    iget-object v1, p0, Lala;->h:Ljava/lang/Object;

    move-object v9, v1

    check-cast v9, Lx5f;

    iget-object v1, p0, Lala;->j:Ljava/lang/Object;

    check-cast v1, Lb7f;

    iget-object v3, p0, Lala;->k:Ljava/lang/Object;

    move-object v10, v3

    check-cast v10, Ljv0;

    iput-object p1, v0, Lnz4;->f:Lcom/opera/android/browser/chromium/ChromiumContent;

    iput-object v1, v0, Lnz4;->j:Lb7f;

    iget-object v1, v0, Lnz4;->a:Lty3;

    invoke-virtual {p1, v1}, Lcom/opera/android/browser/chromium/ChromiumContent;->k(Liz4;)V

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    new-instance v1, Lcy3;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v1, p1, v3}, Lcy3;-><init>(Lcom/opera/android/browser/chromium/ChromiumContent;Landroid/content/Context;)V

    iput-object v1, v0, Lnz4;->d:Lcy3;

    invoke-virtual {p1}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v1

    iget-object v3, v0, Lnz4;->d:Lcy3;

    invoke-interface {v1, v3}, Lorg/chromium/content_public/browser/WebContents;->v0(Lcy3;)V

    invoke-virtual {p1}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v1

    invoke-static {v1}, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->fromWebContents(Lorg/chromium/content_public/browser/WebContents;)Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;

    move-result-object v5

    new-instance v3, Lue;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v11, Lwth;

    const/16 v1, 0x1a

    invoke-direct {v11, v0, v1}, Lwth;-><init>(Ljava/lang/Object;B)V

    invoke-direct/range {v3 .. v11}, Lue;-><init>(Landroid/content/Context;Lye;Livn;Lg1j;Lq6e;Lorm;Ljv0;Lte;)V

    iput-object v3, v5, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->f:Lve;

    new-instance v1, Landroid/view/GestureDetector;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    new-instance v4, Lmz4;

    const/4 v5, 0x0

    invoke-direct {v4, v5}, Lmz4;-><init>(B)V

    invoke-direct {v1, v3, v4}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iget-object v1, v0, Lnz4;->j:Lb7f;

    iget-object v3, v0, Lnz4;->k:Lwa;

    invoke-virtual {v1, v3}, Lb7f;->b(Lorg/chromium/base/Callback;)Ljava/lang/Object;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v3, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->B()Lqwe;

    move-result-object v1

    iget-object v3, v0, Lnz4;->f:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object v3, v3, Lcom/opera/android/browser/chromium/ChromiumContent;->J:Lxr5;

    invoke-virtual {v1, v3}, Lqwe;->b(Landroid/view/View;)V

    new-instance v1, Lntn;

    iget-object v3, p0, Lala;->i:Ljava/lang/Object;

    check-cast v3, Le9e;

    invoke-direct {v1, p1, v3}, Lntn;-><init>(Lcom/opera/android/browser/chromium/ChromiumContent;Ljava/util/function/Supplier;)V

    new-instance v4, Llz4;

    invoke-direct {v4, v0, v2, v1}, Llz4;-><init>(Lnz4;Lg7b;Lntn;)V

    iget-object p0, p0, Lala;->a:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashMap;

    invoke-virtual {p0, p1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, v4, Llz4;->c:Lkz4;

    invoke-virtual {p1, p0}, Lcom/opera/android/browser/chromium/ChromiumContent;->k(Liz4;)V

    invoke-virtual {p1, v1}, Lcom/opera/android/browser/chromium/ChromiumContent;->k(Liz4;)V

    invoke-interface {v3, v1}, Le9e;->b(Lorg/chromium/base/Callback;)Ljava/lang/Object;

    return-void
.end method

.method public final D()Z
    .registers 1

    iget-object p0, p0, Lala;->l:Ljava/lang/Object;

    check-cast p0, Le00;

    invoke-virtual {p0}, Le00;->b()Lc00;

    move-result-object p0

    iget-boolean p0, p0, Lc00;->b:Z

    return p0
.end method

.method public final E(Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 4

    invoke-virtual {p0, p1}, Lala;->l(Lcom/opera/android/browser/chromium/ChromiumContent;)Llz4;

    move-result-object p0

    iget-object p0, p0, Llz4;->a:Lnz4;

    iget-object p0, p0, Lnz4;->f:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    invoke-interface {p0}, Lorg/chromium/content_public/browser/WebContents;->d1()Lorg/chromium/ui/base/EventForwarder;

    move-result-object p0

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    const/4 p1, 0x0

    invoke-virtual {p0, v0, v1, p1}, Lorg/chromium/ui/base/EventForwarder;->a(JZ)V

    return-void
.end method

.method public final G(Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 5

    invoke-virtual {p0, p1}, Lala;->l(Lcom/opera/android/browser/chromium/ChromiumContent;)Llz4;

    move-result-object p0

    iget-object p0, p0, Llz4;->a:Lnz4;

    iget-object p1, p0, Lnz4;->f:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p1}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p1

    invoke-interface {p1}, Lorg/chromium/content_public/browser/WebContents;->d1()Lorg/chromium/ui/base/EventForwarder;

    move-result-object p1

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v1, v2}, Lorg/chromium/ui/base/EventForwarder;->a(JZ)V

    iget-object p1, p0, Lnz4;->f:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p1}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p1

    check-cast p1, Lorg/chromium/content/browser/webcontents/WebContentsImpl;

    iget-object p1, p1, Lorg/chromium/content/browser/webcontents/WebContentsImpl;->g:Lhuh;

    iget p1, p1, Lhuh;->a:F

    float-to-double v0, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int p1, v0

    iget-object p0, p0, Lnz4;->f:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    if-eqz p0, :cond_3b

    invoke-interface {p0}, Lorg/chromium/content_public/browser/WebContents;->d1()Lorg/chromium/ui/base/EventForwarder;

    move-result-object p0

    int-to-float p1, p1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/chromium/ui/base/EventForwarder;->g(FF)V

    :cond_3b
    return-void
.end method

.method public final a()I
    .registers 1

    iget-object p0, p0, Lala;->c:Ljava/lang/Object;

    check-cast p0, Lysl;

    invoke-interface {p0}, Lysl;->a()I

    move-result p0

    return p0
.end method

.method public final b(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3

    iget-object p0, p0, Lala;->f:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashMap;

    if-eqz p0, :cond_a

    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_a
    const-string p0, "Property \"autoMetadata\" has not been set"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-void
.end method

.method public final c()I
    .registers 1

    iget-object p0, p0, Lala;->c:Ljava/lang/Object;

    check-cast p0, Lysl;

    invoke-interface {p0}, Lysl;->c()I

    move-result p0

    return p0
.end method

.method public final d(Lyuh;Lcka;)V
    .registers 13

    iget-object p0, p0, Lala;->e:Ljava/lang/Object;

    check-cast p0, Lgha;

    iget-object v0, p0, Lgha;->b:Lx5f;

    instance-of v1, p1, Ly14;

    if-eqz v1, :cond_36

    check-cast p1, Ly14;

    iget-object p1, p1, Ly14;->a:Ljava/lang/String;

    iget-object p0, p0, Lgha;->a:Lx5f;

    iget-boolean v0, p0, Lx5f;->h:Z

    if-eqz v0, :cond_39a

    iget-object v0, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    new-instance v2, Lck0;

    invoke-direct {v2, v0, v1}, Lck0;-><init>(Lzpa;Lx56;)V

    iget-object v0, v2, Lck0;->v:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnd0;

    new-instance v2, Ltx0;

    const/16 v3, 0x17

    invoke-direct {v2, p1, v3}, Ltx0;-><init>(Ljava/lang/String;B)V

    invoke-virtual {v0, v2}, Lnd0;->a(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {p0, v1}, Lx5f;->U0(Lx56;)V

    goto/16 :goto_39a

    :cond_36
    instance-of v1, p1, Lewf;

    const/4 v2, 0x0

    if-eqz v1, :cond_111

    check-cast p1, Lewf;

    iget-object p1, p1, Lewf;->a:Lvje;

    instance-of v0, p1, Lsb8;

    const/16 v1, 0xe

    if-eqz v0, :cond_50

    check-cast p1, Lsb8;

    iget-object p1, p1, Lsb8;->a:Ltb8;

    iget-object p1, p1, Ltb8;->a:Ljava/lang/String;

    invoke-static {p0, p1, v2, v1}, Leha;->a(Lgha;Ljava/lang/String;Ljava/lang/String;I)V

    goto/16 :goto_39a

    :cond_50
    instance-of v0, p1, Lvb8;

    if-eqz v0, :cond_5f

    check-cast p1, Lvb8;

    iget-object p1, p1, Lvb8;->a:Lwb8;

    iget-object p1, p1, Lwb8;->a:Ljava/lang/String;

    invoke-static {p0, p1, v2, v1}, Leha;->a(Lgha;Ljava/lang/String;Ljava/lang/String;I)V

    goto/16 :goto_39a

    :cond_5f
    instance-of v0, p1, Lbc8;

    if-eqz v0, :cond_6c

    check-cast p1, Lbc8;

    iget-object p1, p1, Lbc8;->a:Ljava/lang/String;

    invoke-static {p0, p1, v2, v1}, Leha;->a(Lgha;Ljava/lang/String;Ljava/lang/String;I)V

    goto/16 :goto_39a

    :cond_6c
    instance-of v0, p1, Lgc8;

    if-eqz v0, :cond_7b

    check-cast p1, Lgc8;

    iget-object p1, p1, Lgc8;->a:Lhc8;

    iget-object p1, p1, Lhc8;->a:Ljava/lang/String;

    invoke-static {p0, p1, v2, v1}, Leha;->a(Lgha;Ljava/lang/String;Ljava/lang/String;I)V

    goto/16 :goto_39a

    :cond_7b
    instance-of v0, p1, Lic8;

    if-eqz v0, :cond_8a

    check-cast p1, Lic8;

    iget-object p1, p1, Lic8;->a:Ljc8;

    iget-object p1, p1, Ljc8;->a:Ljava/lang/String;

    invoke-static {p0, p1, v2, v1}, Leha;->a(Lgha;Ljava/lang/String;Ljava/lang/String;I)V

    goto/16 :goto_39a

    :cond_8a
    instance-of v0, p1, Lwc8;

    if-eqz v0, :cond_99

    check-cast p1, Lwc8;

    iget-object p1, p1, Lwc8;->a:Lxc8;

    iget-object p1, p1, Lxc8;->a:Ljava/lang/String;

    invoke-static {p0, p1, v2, v1}, Leha;->a(Lgha;Ljava/lang/String;Ljava/lang/String;I)V

    goto/16 :goto_39a

    :cond_99
    instance-of v0, p1, Lzc8;

    if-eqz v0, :cond_ab

    invoke-virtual {p0, v2}, Lgha;->c(Lxc0;)V

    check-cast p1, Lzc8;

    iget-object p1, p1, Lzc8;->a:Lad8;

    iget-object p1, p1, Lad8;->a:Ljava/lang/String;

    invoke-static {p0, p1, v2, v1}, Leha;->a(Lgha;Ljava/lang/String;Ljava/lang/String;I)V

    goto/16 :goto_39a

    :cond_ab
    instance-of v0, p1, Lqb8;

    if-eqz v0, :cond_ba

    check-cast p1, Lqb8;

    iget-object p1, p1, Lqb8;->a:Lrb8;

    iget-object p1, p1, Lrb8;->a:Ljava/lang/String;

    invoke-static {p0, p1, v2, v1}, Leha;->a(Lgha;Ljava/lang/String;Ljava/lang/String;I)V

    goto/16 :goto_39a

    :cond_ba
    instance-of v0, p1, Lob8;

    if-eqz v0, :cond_d3

    check-cast p1, Lob8;

    iget-object v0, p1, Lob8;->b:Lpb8;

    iget-object p1, p1, Lob8;->a:Ljava/lang/String;

    iget-object v1, v0, Lpb8;->a:Ljava/lang/String;

    iget-wide v2, v0, Lpb8;->b:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    iget-object v0, v0, Lpb8;->c:Ljava/lang/Long;

    invoke-virtual {p0, p1, v1, v2, v0}, Lgha;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;)V

    goto/16 :goto_39a

    :cond_d3
    instance-of v0, p1, Lxb8;

    const/16 v1, 0xc

    if-eqz v0, :cond_e8

    check-cast p1, Lxb8;

    iget-object v0, p1, Lxb8;->b:Lyb8;

    iget-object v0, v0, Lyb8;->a:Ljava/lang/String;

    iget-object p1, p1, Lxb8;->a:Lzb8;

    iget-object p1, p1, Lzb8;->a:Ljava/lang/String;

    invoke-static {p0, v0, p1, v1}, Leha;->a(Lgha;Ljava/lang/String;Ljava/lang/String;I)V

    goto/16 :goto_39a

    :cond_e8
    instance-of v0, p1, Lid8;

    if-eqz v0, :cond_f9

    check-cast p1, Lid8;

    iget-object v0, p1, Lid8;->b:Ljava/lang/String;

    iget-object p1, p1, Lid8;->a:Ljd8;

    iget-object p1, p1, Ljd8;->a:Ljava/lang/String;

    invoke-static {p0, v0, p1, v1}, Leha;->a(Lgha;Ljava/lang/String;Ljava/lang/String;I)V

    goto/16 :goto_39a

    :cond_f9
    instance-of p0, p1, Lub8;

    if-nez p0, :cond_39a

    instance-of p0, p1, Lfc8;

    if-nez p0, :cond_39a

    instance-of p0, p1, Lkd8;

    if-nez p0, :cond_39a

    instance-of p0, p1, Lyc8;

    if-nez p0, :cond_39a

    instance-of p0, p1, Lfke;

    if-nez p0, :cond_39a

    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_111
    instance-of v1, p1, Lavh;

    if-nez v1, :cond_39a

    instance-of v1, p1, Lhp9;

    if-eqz v1, :cond_14d

    check-cast p1, Lhp9;

    iget-object p0, p1, Lhp9;->a:Lgp9;

    iget-object p1, p0, Lgp9;->h:Lip9;

    iget-object p1, p1, Lip9;->a:Ljava/lang/String;

    iget-object v3, p0, Lgp9;->a:Ljava/lang/String;

    iget-wide v1, p0, Lgp9;->b:D

    double-to-long v4, v1

    iget-wide v6, p0, Lgp9;->c:J

    iget-object v8, p0, Lgp9;->g:Ljava/lang/String;

    sget-object p0, Lgha;->f:Ljava/util/Map;

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    move-object v2, p0

    check-cast v2, Ljd0;

    if-eqz v2, :cond_39a

    iget-object p0, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p1

    new-instance v9, Lck0;

    invoke-direct {v9, p0, p1}, Lck0;-><init>(Lzpa;Lx56;)V

    new-instance v1, Lv5f;

    invoke-direct/range {v1 .. v8}, Lv5f;-><init>(Ljd0;Ljava/lang/String;JJLjava/lang/String;)V

    invoke-virtual {v9, v1}, Lck0;->a(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v0, p1}, Lx5f;->U0(Lx56;)V

    goto/16 :goto_39a

    :cond_14d
    instance-of v1, p1, Leyf;

    if-eqz v1, :cond_1ed

    check-cast p1, Leyf;

    iget-object p0, p1, Leyf;->a:Ljava/util/LinkedHashMap;

    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result v1

    invoke-static {v1}, Lqbd;->a(I)I

    move-result v1

    invoke-direct {p1, v1}, Ljava/util/LinkedHashMap;-><init>(I)V

    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object p0

    check-cast p0, Ljava/lang/Iterable;

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_16c
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_196

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lc98;

    new-instance v3, Ldha;

    iget-object v8, v1, Lc98;->a:Ljava/lang/String;

    iget-wide v4, v1, Lc98;->b:D

    double-to-long v4, v4

    iget-wide v6, v1, Lc98;->c:J

    iget-object v1, v1, Lc98;->d:Ly98;

    iget-object v9, v1, Ly98;->a:Ljava/lang/String;

    invoke-direct/range {v3 .. v9}, Ldha;-><init>(JJLjava/lang/String;Ljava/lang/String;)V

    invoke-interface {p1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_16c

    :cond_196
    new-instance p0, Ljava/util/LinkedHashMap;

    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v1

    invoke-static {v1}, Lqbd;->a(I)I

    move-result v1

    invoke-direct {p0, v1}, Ljava/util/LinkedHashMap;-><init>(I)V

    invoke-virtual {p1}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object p1

    check-cast p1, Ljava/lang/Iterable;

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1ad
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1d4

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ldha;

    new-instance v3, Lrkm;

    iget-object v8, v1, Ldha;->a:Ljava/lang/String;

    iget-wide v4, v1, Ldha;->b:J

    iget-wide v6, v1, Ldha;->c:J

    iget-object v9, v1, Ldha;->d:Ljava/lang/String;

    invoke-direct/range {v3 .. v9}, Lrkm;-><init>(JJLjava/lang/String;Ljava/lang/String;)V

    invoke-interface {p0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1ad

    :cond_1d4
    iget-object p1, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    new-instance v2, Lck0;

    invoke-direct {v2, p1, v1}, Lck0;-><init>(Lzpa;Lx56;)V

    new-instance p1, Lx37;

    const/4 v3, 0x2

    invoke-direct {p1, p0, v3}, Lx37;-><init>(Ljava/util/LinkedHashMap;B)V

    invoke-virtual {v2, p1}, Lck0;->a(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v0, v1}, Lx5f;->U0(Lx56;)V

    goto/16 :goto_39a

    :cond_1ed
    instance-of v1, p1, Lqpl;

    if-eqz v1, :cond_212

    check-cast p1, Lqpl;

    iget-object p0, p1, Lqpl;->a:Lrpl;

    iget-object p0, p0, Lrpl;->a:Ljava/lang/String;

    iget-wide v1, p1, Lqpl;->b:J

    iget-object p1, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v3

    new-instance v4, Lck0;

    invoke-direct {v4, p1, v3}, Lck0;-><init>(Lzpa;Lx56;)V

    new-instance p1, Livd;

    const/4 v5, 0x5

    invoke-direct {p1, p0, v1, v2, v5}, Livd;-><init>(Ljava/lang/String;JB)V

    invoke-virtual {v4, p1}, Lck0;->a(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v0, v3}, Lx5f;->U0(Lx56;)V

    goto/16 :goto_39a

    :cond_212
    instance-of v1, p1, Lkum;

    const/4 v3, 0x1

    if-eqz v1, :cond_247

    check-cast p1, Lkum;

    iget-object p0, p1, Lkum;->a:Ljava/lang/Long;

    if-eqz p0, :cond_39a

    iget-object p1, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    new-instance v2, Lck0;

    invoke-direct {v2, p1, v1}, Lck0;-><init>(Lzpa;Lx56;)V

    iget-object p1, v2, Lck0;->v:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lnd0;

    iget-object p1, p1, Lnd0;->c:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lld0;

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    iget-object p0, p1, Lld0;->b:Lkd0;

    const/4 p1, 0x4

    invoke-virtual {p0, p1, v3, v4, v5}, Ljf0;->p(IIJ)V

    invoke-virtual {v0, v1}, Lx5f;->U0(Lx56;)V

    goto/16 :goto_39a

    :cond_247
    instance-of v1, p1, Lwah;

    if-eqz v1, :cond_2e9

    check-cast p1, Lwah;

    iget-object p1, p1, Lwah;->a:Lxah;

    iget-object p1, p1, Lxah;->a:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    sparse-switch v0, :sswitch_data_3aa

    goto/16 :goto_39a

    :sswitch_25a
    const-string v0, "start_free_offer"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_39a

    new-instance p1, Lfha;

    sget-object v0, Ldd0;->b:Ldd0;

    iget-object v1, p0, Lgha;->c:La98;

    invoke-direct {p1, v0, v1}, Lfha;-><init>(Ldd0;La98;)V

    iput-object p1, p0, Lgha;->d:Lfha;

    goto/16 :goto_39a

    :sswitch_26f
    const-string v0, "payment_google_pay"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_39a

    iget-object p0, p0, Lgha;->d:Lfha;

    if-eqz p0, :cond_39a

    sget-object p1, Lkm0;->c:Lkm0;

    iput-object p1, p0, Lfha;->c:Lkm0;

    goto/16 :goto_39a

    :sswitch_281
    const-string v0, "coupon_applied"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_39a

    iget-object p0, p0, Lgha;->d:Lfha;

    if-eqz p0, :cond_39a

    iput-boolean v3, p0, Lfha;->d:Z

    goto/16 :goto_39a

    :sswitch_291
    const-string v0, "finish_success"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2d4

    goto/16 :goto_39a

    :sswitch_29b
    const-string v0, "payment_card"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_39a

    iget-object p0, p0, Lgha;->d:Lfha;

    if-eqz p0, :cond_39a

    sget-object p1, Lkm0;->b:Lkm0;

    iput-object p1, p0, Lfha;->c:Lkm0;

    goto/16 :goto_39a

    :sswitch_2ad
    const-string v0, "start_purchase"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_39a

    new-instance p1, Lfha;

    sget-object v0, Ldd0;->c:Ldd0;

    iget-object v1, p0, Lgha;->c:La98;

    invoke-direct {p1, v0, v1}, Lfha;-><init>(Ldd0;La98;)V

    iput-object p1, p0, Lgha;->d:Lfha;

    goto/16 :goto_39a

    :sswitch_2c2
    const-string v0, "finish_error"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2d4

    goto/16 :goto_39a

    :sswitch_2cc
    const-string v0, "finish_refund"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_39a

    :cond_2d4
    sget-object v0, Lgha;->g:Ljava/util/Map;

    const-string v1, "finish_"

    invoke-static {p1, v1}, Lkotlin/text/StringsKt;->T(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lxc0;

    if-eqz p1, :cond_39a

    invoke-virtual {p0, p1}, Lgha;->c(Lxc0;)V

    goto/16 :goto_39a

    :cond_2e9
    instance-of p0, p1, Lnk4;

    if-eqz p0, :cond_3a5

    check-cast p1, Lnk4;

    iget-object p0, p1, Lnk4;->a:Ljava/util/LinkedHashMap;

    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result v1

    invoke-static {v1}, Lqbd;->a(I)I

    move-result v1

    invoke-direct {p1, v1}, Ljava/util/LinkedHashMap;-><init>(I)V

    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object p0

    check-cast p0, Ljava/lang/Iterable;

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_308
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_32a

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmk4;

    iget-object v1, v1, Lmk4;->a:Lok4;

    if-eqz v1, :cond_325

    iget-object v1, v1, Lok4;->a:Ljava/lang/String;

    goto :goto_326

    :cond_325
    move-object v1, v2

    :goto_326
    invoke-interface {p1, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_308

    :cond_32a
    invoke-virtual {p1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object p0

    check-cast p0, Ljava/lang/Iterable;

    instance-of v1, p0, Ljava/util/Collection;

    const/4 v2, 0x0

    if-eqz v1, :cond_33e

    move-object v1, p0

    check-cast v1, Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_360

    :cond_33e
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_342
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_360

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v4, "installed"

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_35e

    const-string v4, "active"

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_342

    :cond_35e
    move p0, v3

    goto :goto_361

    :cond_360
    move p0, v2

    :goto_361
    invoke-virtual {p1}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object p1

    check-cast p1, Ljava/lang/Iterable;

    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->L(Ljava/lang/Iterable;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iget-object v1, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v4

    new-instance v5, Lck0;

    invoke-direct {v5, v1, v4}, Lck0;-><init>(Lzpa;Lx56;)V

    iget-object v1, v5, Lck0;->v:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnd0;

    iget-object v1, v1, Lnd0;->c:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lld0;

    iget-object v5, v1, Lld0;->b:Lkd0;

    invoke-virtual {v5, v2, v3, p0}, Ljf0;->r(IIZ)V

    if-eqz p1, :cond_397

    iget-object p0, v1, Lld0;->b:Lkd0;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, v3, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_397
    invoke-virtual {v0, v4}, Lx5f;->U0(Lx56;)V

    :cond_39a
    :goto_39a
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    new-instance p1, Lsw7;

    invoke-direct {p1, p0}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p2, p1}, Lcka;->n(Ltw7;)V

    return-void

    :cond_3a5
    invoke-static {}, Lh9o;->p()V

    return-void

    nop

    :sswitch_data_3aa
    .sparse-switch
        -0x6b9a6b5c -> :sswitch_2cc
        -0x463a38a4 -> :sswitch_2c2
        -0x1f42bfc2 -> :sswitch_2ad
        -0x1da6aa57 -> :sswitch_29b
        0x484e3057 -> :sswitch_291
        0x6a5b2964 -> :sswitch_281
        0x6b3d3d7b -> :sswitch_26f
        0x738372c6 -> :sswitch_25a
    .end sparse-switch
.end method

.method public final e()V
    .registers 4

    iget-object v0, p0, Lala;->a:Ljava/lang/Object;

    check-cast v0, Lpt1;

    iget-object v1, v0, Lpt1;->b:Landroid/view/View;

    check-cast v1, Landroidx/constraintlayout/widget/ConstraintLayout;

    iget-object p0, p0, Lala;->l:Ljava/lang/Object;

    check-cast p0, Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lbtl;

    iget-boolean p0, p0, Lbtl;->c:Z

    iget-object v0, v0, Lpt1;->b:Landroid/view/View;

    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz p0, :cond_27

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lf03;->G(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result p0

    goto :goto_35

    :cond_27
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const v0, 0x7f0400e4

    const v2, 0x7f06063b

    invoke-static {v0, p0, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    :goto_35
    invoke-virtual {v1, p0}, Landroid/view/View;->setBackgroundColor(I)V

    return-void
.end method

.method public final f()Ljn2;
    .registers 19

    move-object/from16 v0, p0

    iget-object v1, v0, Lala;->a:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    if-nez v1, :cond_b

    const-string v1, " transportName"

    goto :goto_d

    :cond_b
    const-string v1, ""

    :goto_d
    iget-object v2, v0, Lala;->c:Ljava/lang/Object;

    check-cast v2, Lr18;

    if-nez v2, :cond_19

    const-string v2, " encodedPayload"

    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :cond_19
    iget-object v2, v0, Lala;->d:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Long;

    if-nez v2, :cond_25

    const-string v2, " eventMillis"

    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :cond_25
    iget-object v2, v0, Lala;->e:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Long;

    if-nez v2, :cond_31

    const-string v2, " uptimeMillis"

    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :cond_31
    iget-object v2, v0, Lala;->f:Ljava/lang/Object;

    check-cast v2, Ljava/util/HashMap;

    if-nez v2, :cond_3d

    const-string v2, " autoMetadata"

    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :cond_3d
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_8d

    new-instance v3, Ljn2;

    iget-object v1, v0, Lala;->a:Ljava/lang/Object;

    move-object v4, v1

    check-cast v4, Ljava/lang/String;

    iget-object v1, v0, Lala;->b:Ljava/lang/Object;

    move-object v5, v1

    check-cast v5, Ljava/lang/Integer;

    iget-object v1, v0, Lala;->c:Ljava/lang/Object;

    move-object v6, v1

    check-cast v6, Lr18;

    iget-object v1, v0, Lala;->d:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    iget-object v1, v0, Lala;->e:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v9

    iget-object v1, v0, Lala;->f:Ljava/lang/Object;

    move-object v11, v1

    check-cast v11, Ljava/util/HashMap;

    iget-object v1, v0, Lala;->g:Ljava/lang/Object;

    move-object v12, v1

    check-cast v12, Ljava/lang/Integer;

    iget-object v1, v0, Lala;->h:Ljava/lang/Object;

    move-object v13, v1

    check-cast v13, Ljava/lang/String;

    iget-object v1, v0, Lala;->i:Ljava/lang/Object;

    move-object v14, v1

    check-cast v14, [B

    iget-object v1, v0, Lala;->j:Ljava/lang/Object;

    move-object v15, v1

    check-cast v15, [B

    iget-object v1, v0, Lala;->k:Ljava/lang/Object;

    move-object/from16 v16, v1

    check-cast v16, Ljava/util/ArrayList;

    iget-object v0, v0, Lala;->l:Ljava/lang/Object;

    move-object/from16 v17, v0

    check-cast v17, Ljava/lang/String;

    invoke-direct/range {v3 .. v17}, Ljn2;-><init>(Ljava/lang/String;Ljava/lang/Integer;Lr18;JJLjava/util/HashMap;Ljava/lang/Integer;Ljava/lang/String;[B[BLjava/util/ArrayList;Ljava/lang/String;)V

    return-object v3

    :cond_8d
    const-string v0, "Missing required properties:"

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 v0, 0x0

    return-object v0
.end method

.method public final g()I
    .registers 1

    iget-object p0, p0, Lala;->c:Ljava/lang/Object;

    check-cast p0, Lysl;

    invoke-interface {p0}, Lysl;->g()I

    move-result p0

    return p0
.end method

.method public final h()I
    .registers 1

    iget-object p0, p0, Lala;->c:Ljava/lang/Object;

    check-cast p0, Lysl;

    invoke-interface {p0}, Lysl;->h()I

    move-result p0

    return p0
.end method

.method public final i()Lsaj;
    .registers 3

    new-instance v0, Lsaj;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iget-object v1, p0, Lala;->a:Ljava/lang/Object;

    check-cast v1, Lui6;

    iput-object v1, v0, Lsaj;->a:Lui6;

    iget-object v1, p0, Lala;->b:Ljava/lang/Object;

    check-cast v1, Lui6;

    iput-object v1, v0, Lsaj;->b:Lui6;

    iget-object v1, p0, Lala;->c:Ljava/lang/Object;

    check-cast v1, Lui6;

    iput-object v1, v0, Lsaj;->c:Lui6;

    iget-object v1, p0, Lala;->d:Ljava/lang/Object;

    check-cast v1, Lui6;

    iput-object v1, v0, Lsaj;->d:Lui6;

    iget-object v1, p0, Lala;->e:Ljava/lang/Object;

    check-cast v1, Lzw5;

    iput-object v1, v0, Lsaj;->e:Lzw5;

    iget-object v1, p0, Lala;->f:Ljava/lang/Object;

    check-cast v1, Lzw5;

    iput-object v1, v0, Lsaj;->f:Lzw5;

    iget-object v1, p0, Lala;->g:Ljava/lang/Object;

    check-cast v1, Lzw5;

    iput-object v1, v0, Lsaj;->g:Lzw5;

    iget-object v1, p0, Lala;->h:Ljava/lang/Object;

    check-cast v1, Lzw5;

    iput-object v1, v0, Lsaj;->h:Lzw5;

    iget-object v1, p0, Lala;->i:Ljava/lang/Object;

    check-cast v1, Lqs7;

    iput-object v1, v0, Lsaj;->i:Lqs7;

    iget-object v1, p0, Lala;->j:Ljava/lang/Object;

    check-cast v1, Lqs7;

    iput-object v1, v0, Lsaj;->j:Lqs7;

    iget-object v1, p0, Lala;->k:Ljava/lang/Object;

    check-cast v1, Lqs7;

    iput-object v1, v0, Lsaj;->k:Lqs7;

    iget-object p0, p0, Lala;->l:Ljava/lang/Object;

    check-cast p0, Lqs7;

    iput-object p0, v0, Lsaj;->l:Lqs7;

    return-object v0
.end method

.method public final j()Z
    .registers 1

    iget-object p0, p0, Lala;->c:Ljava/lang/Object;

    check-cast p0, Lysl;

    invoke-interface {p0}, Lysl;->j()Z

    move-result p0

    return p0
.end method

.method public final k(I)V
    .registers 4

    iget-object v0, p0, Lala;->e:Ljava/lang/Object;

    check-cast v0, Ly0f;

    if-eqz p1, :cond_13

    const/4 v1, 0x1

    if-eq p1, v1, :cond_d

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_18

    :cond_d
    sget-object v1, Lrs0;->i:Lrs0;

    invoke-virtual {v0, v1}, Ly0f;->c(Lrs0;)V

    goto :goto_18

    :cond_13
    sget-object v1, Lrs0;->h:Lrs0;

    invoke-virtual {v0, v1}, Ly0f;->c(Lrs0;)V

    :goto_18
    iget-object p0, p0, Lala;->g:Ljava/lang/Object;

    check-cast p0, Lr4m;

    invoke-virtual {p0}, Lr4m;->W()Lszb;

    move-result-object v0

    if-nez v0, :cond_23

    return-void

    :cond_23
    new-instance v1, Lbu3;

    invoke-direct {v1, p0, v0, p1}, Lbu3;-><init>(Lr4m;Lszb;I)V

    invoke-virtual {p0, v1}, Lr4m;->c0(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final l(Lcom/opera/android/browser/chromium/ChromiumContent;)Llz4;
    .registers 2

    iget-object p0, p0, Lala;->a:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashMap;

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Llz4;

    if-eqz p0, :cond_d

    return-object p0

    :cond_d
    invoke-static {}, Lhai;->d()V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final m(F)V
    .registers 3

    new-instance v0, Li3;

    invoke-direct {v0, p1}, Li3;-><init>(F)V

    iput-object v0, p0, Lala;->e:Ljava/lang/Object;

    new-instance v0, Li3;

    invoke-direct {v0, p1}, Li3;-><init>(F)V

    iput-object v0, p0, Lala;->f:Ljava/lang/Object;

    new-instance v0, Li3;

    invoke-direct {v0, p1}, Li3;-><init>(F)V

    iput-object v0, p0, Lala;->g:Ljava/lang/Object;

    new-instance v0, Li3;

    invoke-direct {v0, p1}, Li3;-><init>(F)V

    iput-object v0, p0, Lala;->h:Ljava/lang/Object;

    return-void
.end method

.method public final n(Lcom/opera/android/browser/chromium/ChromiumContent;)Z
    .registers 3

    invoke-virtual {p0, p1}, Lala;->l(Lcom/opera/android/browser/chromium/ChromiumContent;)Llz4;

    move-result-object p0

    iget-object p0, p0, Llz4;->a:Lnz4;

    iget-object p1, p0, Lnz4;->e:Landroid/view/View;

    if-eqz p1, :cond_1a

    iget-object v0, p0, Lnz4;->f:Lcom/opera/android/browser/chromium/ChromiumContent;

    if-eqz v0, :cond_1a

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    iget-object p0, p0, Lnz4;->f:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->J:Lxr5;

    if-ne p1, p0, :cond_1a

    const/4 p0, 0x1

    return p0

    :cond_1a
    const/4 p0, 0x0

    return p0
.end method

.method public final o(Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 9

    iget-object v0, p0, Lala;->a:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Llz4;

    iget-object v1, p0, Lala;->c:Ljava/lang/Object;

    check-cast v1, Lysl;

    invoke-interface {v1, p1}, Lysl;->x(Lcom/opera/android/browser/chromium/ChromiumContent;)V

    iget-object v1, v0, Llz4;->b:Lg7b;

    iget-object v2, v0, Llz4;->d:Lntn;

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    if-eqz v3, :cond_47

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    if-eqz v3, :cond_2f

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    iget-object v3, v1, Lg7b;->b:Lho3;

    invoke-virtual {v1, v3}, Landroid/view/View;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    :cond_2f
    sget-object v3, Lmkh;->d:Ls49;

    iget-object v4, v1, Lg7b;->a:Ltz4;

    iget-object v5, v1, Lg7b;->m:Lorg/chromium/content_public/browser/WebContents;

    if-eqz v5, :cond_44

    sget-object v6, Lorg/chromium/content/browser/GestureListenerManagerImpl;->n:Landroid/util/LongSparseArray;

    const-class v6, Lorg/chromium/content/browser/GestureListenerManagerImpl;

    invoke-interface {v5, v6, v3}, Lorg/chromium/content_public/browser/WebContents;->X(Ljava/lang/Class;Lktn;)Lytm;

    move-result-object v3

    check-cast v3, Lorg/chromium/content/browser/GestureListenerManagerImpl;

    invoke-virtual {v3, v4}, Lorg/chromium/content/browser/GestureListenerManagerImpl;->h(Ljw9;)V

    :cond_44
    const/4 v3, 0x0

    iput-object v3, v1, Lg7b;->m:Lorg/chromium/content_public/browser/WebContents;

    :cond_47
    iget-object v3, v1, Lg7b;->s:Landroid/widget/LinearLayout;

    invoke-virtual {v3}, Landroid/view/ViewGroup;->removeAllViews()V

    iget-object v1, v1, Lg7b;->r:Ljava/util/ArrayDeque;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->clear()V

    iget-object v0, v0, Llz4;->c:Lkz4;

    invoke-virtual {p1, v0}, Lcom/opera/android/browser/chromium/ChromiumContent;->y(Liz4;)V

    invoke-virtual {p1, v2}, Lcom/opera/android/browser/chromium/ChromiumContent;->y(Liz4;)V

    iget-object p0, p0, Lala;->i:Ljava/lang/Object;

    check-cast p0, Le9e;

    invoke-interface {p0, v2}, Lj4f;->a(Lorg/chromium/base/Callback;)V

    return-void
.end method

.method public final p(Z)V
    .registers 12

    const/4 v0, 0x0

    new-array v1, v0, [Ln6h;

    new-instance v3, Lwzg;

    const/4 v2, 0x4

    const/4 v4, 0x0

    const-class v5, Lf1c;

    invoke-direct {v3, v4, v5, v2}, Lwzg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    if-eqz p1, :cond_45

    const p1, 0x7f0a0148

    filled-new-array {p1}, [I

    move-result-object p1

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    aget p1, p1, v0

    if-eqz p1, :cond_28

    const/4 v0, -0x1

    if-eq p1, v0, :cond_28

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_28
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_2f

    move-object v2, v4

    :cond_2f
    if-eqz v2, :cond_45

    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    const-string p1, "highlights"

    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->j0(Ljava/util/ArrayList;)[I

    move-result-object v0

    invoke-virtual {v4, p1, v0}, Landroid/os/BaseBundle;->putIntArray(Ljava/lang/String;[I)V

    const-string p1, "highlight_scroll_to_view_behavior"

    const/4 v0, 0x3

    invoke-virtual {v4, p1, v0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    :cond_45
    if-nez v4, :cond_49

    sget-object v4, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    :cond_49
    iget-object p0, p0, Lala;->a:Ljava/lang/Object;

    check-cast p0, Lpt1;

    iget-object p0, p0, Lpt1;->b:Landroid/view/View;

    check-cast p0, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    new-instance v2, Lzhj;

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v9

    const/4 v5, 0x2

    const/16 v6, 0x1003

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-direct/range {v2 .. v9}, Lzhj;-><init>(Lwzg;Landroid/os/Bundle;IILjava/lang/String;ZLjava/util/List;)V

    invoke-virtual {v2, p0}, Lzhj;->c(Landroid/content/Context;)V

    return-void
.end method

.method public final q(Ljava/lang/String;Ljava/lang/String;Lcka;)V
    .registers 10

    const-string v0, "LPA:1$"

    :try_start_2
    sget-object v1, Lt0i;->b:Lp0i;

    iget-object p0, p0, Lala;->a:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/esim/ui/EsimActivity;

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    new-instance v3, Landroid/net/Uri$Builder;

    invoke-direct {v3}, Landroid/net/Uri$Builder;-><init>()V

    const-string v4, "https"

    invoke-virtual {v3, v4}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v3

    const-string v4, "esimsetup.android.com"

    invoke-virtual {v3, v4}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v3

    const-string v4, "esim_qrcode_provisioning"

    invoke-virtual {v3, v4}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v3

    const-string v4, "carddata"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "$"

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, v4, p1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    invoke-direct {v1, v2, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;
    :try_end_49
    .catchall {:try_start_2 .. :try_end_49} :catchall_4a

    goto :goto_53

    :catchall_4a
    move-exception p0

    sget-object p1, Lt0i;->b:Lp0i;

    new-instance p1, Lq0i;

    invoke-direct {p1, p0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object p0, p1

    :goto_53
    invoke-static {p0, p3}, Ls16;->m(Ljava/lang/Object;Lbqb;)V

    return-void
.end method

.method public final r(Lcom/opera/android/browser/chromium/ChromiumContent;Z)Z
    .registers 3

    invoke-virtual {p0, p1}, Lala;->l(Lcom/opera/android/browser/chromium/ChromiumContent;)Llz4;

    move-result-object p0

    iget-object p0, p0, Llz4;->a:Lnz4;

    iget-object p0, p0, Lnz4;->f:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    invoke-static {p0}, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->fromWebContents(Lorg/chromium/content_public/browser/WebContents;)Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;

    move-result-object p0

    iget-boolean p1, p0, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->D:Z

    if-eqz p1, :cond_21

    const/4 p1, 0x1

    if-eqz p2, :cond_1b

    invoke-virtual {p0}, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->r()V

    return p1

    :cond_1b
    invoke-virtual {p0}, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->D()Z

    move-result p2

    if-nez p2, :cond_23

    :cond_21
    const/4 p0, 0x0

    return p0

    :cond_23
    invoke-virtual {p0}, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->hidePopupsAndPreserveSelection()V

    return p1
.end method

.method public final t(Z)V
    .registers 2

    iget-object p0, p0, Lala;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->a:Lckf;

    invoke-virtual {p0, p1}, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->d(Z)V

    return-void
.end method

.method public final u(Lcom/opera/android/browser/chromium/ChromiumContent;Z)V
    .registers 8

    invoke-virtual {p0, p1}, Lala;->l(Lcom/opera/android/browser/chromium/ChromiumContent;)Llz4;

    move-result-object v0

    iget-object v1, v0, Llz4;->b:Lg7b;

    iget-object v0, v0, Llz4;->a:Lnz4;

    iget-object v2, v0, Lnz4;->b:Lcom/opera/android/browser/chromium/ChromiumContainerView;

    iget-boolean v3, v0, Lnz4;->g:Z

    const/4 v4, 0x0

    if-eq v3, p2, :cond_3c

    iput-boolean p2, v0, Lnz4;->g:Z

    if-eqz p2, :cond_29

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-virtual {v0}, Landroid/view/View;->bringToFront()V

    iget-object v3, v0, Lnz4;->f:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {v2, v3}, Lcom/opera/android/browser/chromium/ChromiumContainerView;->b(Lcom/opera/android/browser/chromium/ChromiumContent;)V

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    iget-object v2, v0, Lnz4;->f:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object v2, v2, Lcom/opera/android/browser/chromium/ChromiumContent;->J:Lxr5;

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    goto :goto_3c

    :cond_29
    const/16 v3, 0x8

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/opera/android/browser/chromium/ChromiumContainerView;->b(Lcom/opera/android/browser/chromium/ChromiumContent;)V

    iget-object v3, v0, Lnz4;->f:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object v3, v3, Lcom/opera/android/browser/chromium/ChromiumContent;->J:Lxr5;

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_3c
    :goto_3c
    if-eqz p2, :cond_46

    iget-object p0, p0, Lala;->c:Ljava/lang/Object;

    check-cast p0, Lysl;

    invoke-interface {p0, p1}, Lysl;->J(Lcom/opera/android/browser/chromium/ChromiumContent;)V

    goto :goto_47

    :cond_46
    const/4 v4, 0x4

    :goto_47
    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    xor-int/lit8 p0, p2, 0x1

    iput-boolean p0, v1, Lg7b;->n:Z

    if-eqz p2, :cond_53

    invoke-virtual {v1}, Landroid/view/View;->bringToFront()V

    :cond_53
    return-void
.end method
