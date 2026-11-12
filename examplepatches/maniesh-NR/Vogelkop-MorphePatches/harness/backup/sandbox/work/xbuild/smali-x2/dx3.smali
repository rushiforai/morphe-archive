.class public abstract Ldx3;
.super Lhjf;
.source "SourceFile"

# interfaces
.implements Lkl9;


# instance fields
.field public j:Lqi;

.field public k:Lzg;

.field public final l:Ltni;

.field public final m:Li7f;

.field public final n:Lhx3;

.field public o:Lqim;

.field public p:Leej;

.field public final q:Lzw3;

.field public final r:Lax3;

.field public s:Ldxe;

.field public t:Lkoi;


# direct methods
.method public constructor <init>()V
    .registers 4

    invoke-direct {p0}, Lhjf;-><init>()V

    new-instance v0, Ltni;

    invoke-direct {v0}, Ltni;-><init>()V

    iput-object v0, p0, Ldx3;->l:Ltni;

    new-instance v0, Li7f;

    invoke-direct {v0}, Li7f;-><init>()V

    iput-object v0, p0, Ldx3;->m:Li7f;

    new-instance v0, Lhx3;

    sget-object v1, Lvml;->d:Lumi;

    iget-object v2, p0, Lhjf;->e:Lxbf;

    invoke-direct {v0, p0, v1, v2}, Lhx3;-><init>(Ldx3;Lumi;Lxbf;)V

    iput-object v0, p0, Ldx3;->n:Lhx3;

    new-instance v0, Lzw3;

    invoke-direct {v0, p0}, Lzw3;-><init>(Ldx3;)V

    iput-object v0, p0, Ldx3;->q:Lzw3;

    new-instance v0, Lax3;

    invoke-direct {v0, p0}, Lax3;-><init>(Ldx3;)V

    iput-object v0, p0, Ldx3;->r:Lax3;

    return-void
.end method

.method public static L(Lorg/chromium/content_public/browser/WebContents;)Ldx3;
    .registers 2

    invoke-interface {p0}, Lorg/chromium/content_public/browser/WebContents;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_1d

    invoke-interface {p0}, Lorg/chromium/content_public/browser/WebContents;->k0()Lorg/chromium/ui/base/WindowAndroid;

    move-result-object p0

    if-eqz p0, :cond_1d

    invoke-virtual {p0}, Lorg/chromium/ui/base/WindowAndroid;->m()Lb2b;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/Activity;

    instance-of v0, p0, Ldx3;

    if-eqz v0, :cond_1d

    check-cast p0, Ldx3;

    return-object p0

    :cond_1d
    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public final E()Z
    .registers 2

    invoke-virtual {p0}, Ldx3;->W()Lk6l;

    move-result-object p0

    const/4 v0, 0x0

    if-nez p0, :cond_8

    return v0

    :cond_8
    iget-object p0, p0, Lk6l;->o:Lb2l;

    if-eqz p0, :cond_18

    check-cast p0, Ld7l;

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->m()Z

    move-result p0

    if-eqz p0, :cond_18

    const/4 p0, 0x1

    return p0

    :cond_18
    return v0
.end method

.method public F()Ljv0;
    .registers 1

    new-instance p0, Lqii;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-object p0
.end method

.method public G(Lcom/opera/android/browser/chromium/ChromiumContent;)Ljava/util/List;
    .registers 2

    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object p0
.end method

.method public H()Lg1j;
    .registers 2

    new-instance p0, Lrbe;

    const/16 v0, 0x19

    invoke-direct {p0, v0}, Lrbe;-><init>(B)V

    return-object p0
.end method

.method public I(Lcom/opera/android/browser/chromium/ChromiumContent;)Ljava/util/List;
    .registers 8

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    new-instance v1, Lz0b;

    const/4 v2, 0x4

    invoke-direct {v1, v2}, Lv0b;-><init>(I)V

    new-instance v2, Lkk5;

    const/4 v3, 0x0

    invoke-direct {v2, p1, v3}, Lkk5;-><init>(Lcom/opera/android/browser/chromium/ChromiumContent;B)V

    invoke-virtual {v1, v2}, Lv0b;->c(Ljava/lang/Object;)V

    new-instance v2, Lqqe;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v4, Lnw3;

    const/16 v5, 0x16

    invoke-direct {v4, v0, v5}, Lnw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    invoke-direct {v2, p1, v4}, Lqqe;-><init>(Lcom/opera/android/browser/chromium/ChromiumContent;Lnw3;)V

    invoke-virtual {v1, v2}, Lv0b;->c(Ljava/lang/Object;)V

    new-instance v2, Lkk5;

    const/4 v4, 0x1

    invoke-direct {v2, p1, v4}, Lkk5;-><init>(Lcom/opera/android/browser/chromium/ChromiumContent;B)V

    invoke-virtual {v1, v2}, Lv0b;->c(Ljava/lang/Object;)V

    new-instance p1, Lp0a;

    new-instance v2, Loc2;

    const/16 v5, 0x19

    invoke-direct {v2, p0, v5}, Loc2;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p1, v2, v4}, Lp0a;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, p1}, Lv0b;->c(Ljava/lang/Object;)V

    new-instance p0, Lp0a;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p1

    iget-object p1, p1, Ld6j;->d:Lx5f;

    invoke-direct {p0, p1, v3}, Lp0a;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, p0}, Lv0b;->c(Ljava/lang/Object;)V

    invoke-virtual {v1}, Lz0b;->g()Lcsh;

    move-result-object p0

    return-object p0
.end method

.method public J()Ld7h;
    .registers 4

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    new-instance v0, Ld7h;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v1

    iget-object v1, v1, Ld6j;->c:Lx5f;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->O()Lv3m;

    move-result-object p0

    const/16 v2, 0xa

    invoke-direct {v0, v1, p0, v2}, Ld7h;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v0
.end method

.method public K()Livn;
    .registers 2

    new-instance v0, Lyw3;

    invoke-direct {v0, p0}, Lyw3;-><init>(Ldx3;)V

    return-object v0
.end method

.method public final M()Llg;
    .registers 1

    iget-object p0, p0, Ldx3;->n:Lhx3;

    iget-object p0, p0, Lhx3;->d:Lfx3;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Llg;

    return-object p0
.end method

.method public N()Lex3;
    .registers 1

    iget-object p0, p0, Ldx3;->n:Lhx3;

    return-object p0
.end method

.method public O()Leej;
    .registers 5

    iget-object v0, p0, Ldx3;->p:Leej;

    if-nez v0, :cond_17

    new-instance v0, Leej;

    iget-object v1, p0, Ldx3;->o:Lqim;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, v1, Lqim;->d:Lnej;

    iget-object v2, p0, Ldx3;->o:Lqim;

    iget-object v2, v2, Lqim;->f:Laal;

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Leej;-><init>(Lnej;Laal;Lgjm;)V

    iput-object v0, p0, Ldx3;->p:Leej;

    :cond_17
    return-object v0
.end method

.method public final P()Lcom/opera/android/browser/BrowserFragment;
    .registers 2

    invoke-virtual {p0}, Landroidx/fragment/app/r;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object p0

    const v0, 0x7f0a01a3

    invoke-virtual {p0, v0}, Landroidx/fragment/app/w;->E(I)Landroidx/fragment/app/Fragment;

    move-result-object p0

    check-cast p0, Lcom/opera/android/browser/BrowserFragment;

    return-object p0
.end method

.method public final R()Ltz8;
    .registers 1

    iget-object p0, p0, Ldx3;->n:Lhx3;

    iget-object p0, p0, Lhx3;->h:Lfx3;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ltz8;

    return-object p0
.end method

.method public final S()Leq9;
    .registers 1

    iget-object p0, p0, Ldx3;->n:Lhx3;

    iget-object p0, p0, Lhx3;->i:Lfx3;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Leq9;

    return-object p0
.end method

.method public T()Lpt3;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public final V(Lorg/chromium/content_public/browser/WebContents;)Lb2l;
    .registers 4

    invoke-virtual {p0}, Ldx3;->W()Lk6l;

    move-result-object p0

    const/4 v0, 0x0

    if-nez p0, :cond_8

    return-object v0

    :cond_8
    sget-object v1, Lcom/opera/android/browser/chromium/ChromiumContent;->V:Lorg/chromium/url/GURL;

    invoke-static {p1}, LJ/N;->Mo8CJari(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/opera/android/browser/chromium/ChromiumContent;

    if-eqz p1, :cond_19

    iget p1, p1, Lcom/opera/android/browser/WebContentsWrapper;->i:I

    invoke-virtual {p0, p1}, Lk6l;->r(I)Lb2l;

    move-result-object p0

    return-object p0

    :cond_19
    return-object v0
.end method

.method public final W()Lk6l;
    .registers 1

    invoke-virtual {p0}, Ldx3;->P()Lcom/opera/android/browser/BrowserFragment;

    move-result-object p0

    if-eqz p0, :cond_9

    iget-object p0, p0, Lcom/opera/android/browser/BrowserFragment;->g:Lk6l;

    return-object p0

    :cond_9
    const/4 p0, 0x0

    return-object p0
.end method

.method public final X(Lzhj;I)V
    .registers 9

    invoke-virtual {p0}, Landroidx/fragment/app/r;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object v0

    invoke-static {v0, v0}, Lu35;->f(Landroidx/fragment/app/w;Landroidx/fragment/app/w;)Landroidx/fragment/app/a;

    move-result-object v1

    iget v2, p1, Lzhj;->e:I

    iget-object v3, p1, Lzhj;->b:Landroid/os/Bundle;

    iget-object v4, p1, Lzhj;->a:Lwzg;

    const/4 v5, -0x1

    if-ne v2, v5, :cond_13

    const/16 v2, 0x1001

    :cond_13
    iput v2, v1, Lym9;->h:I

    iget-object v2, p1, Lzhj;->g:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_88

    iget-object v2, v4, Lwzg;->b:Ljava/lang/Object;

    check-cast v2, Lryl;

    if-nez v2, :cond_3f

    invoke-virtual {p0}, Landroidx/fragment/app/r;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/fragment/app/w;->L()Lol9;

    move-result-object v2

    invoke-virtual {p0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object p0

    iget-object v4, v4, Lwzg;->c:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Class;

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, p0, v4}, Lol9;->a(Ljava/lang/ClassLoader;Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v2

    :cond_3f
    if-eqz v3, :cond_4e

    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object p0

    if-eqz p0, :cond_4b

    invoke-virtual {p0, v3}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    move-object v3, p0

    :cond_4b
    invoke-virtual {v2, v3}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    :cond_4e
    iget-object p0, p1, Lzhj;->d:Ljava/lang/String;

    if-nez p0, :cond_5f

    instance-of p0, v2, Ljbl;

    if-eqz p0, :cond_5e

    move-object p0, v2

    check-cast p0, Ljbl;

    invoke-interface {p0}, Ljbl;->y()Ljava/lang/String;

    move-result-object p0

    goto :goto_5f

    :cond_5e
    const/4 p0, 0x0

    :cond_5f
    :goto_5f
    invoke-virtual {v1, p0}, Lym9;->c(Ljava/lang/String;)V

    iget v3, p1, Lzhj;->c:I

    invoke-static {v3}, Lvep;->A(I)I

    move-result v3

    if-eqz v3, :cond_71

    const/4 v4, 0x1

    if-ne v3, v4, :cond_77

    invoke-virtual {v1, p2, v2, p0, v4}, Landroidx/fragment/app/a;->e(ILandroidx/fragment/app/Fragment;Ljava/lang/String;I)V

    goto :goto_77

    :cond_71
    if-eqz p2, :cond_82

    const/4 v3, 0x2

    invoke-virtual {v1, p2, v2, p0, v3}, Landroidx/fragment/app/a;->e(ILandroidx/fragment/app/Fragment;Ljava/lang/String;I)V

    :cond_77
    :goto_77
    invoke-virtual {v1}, Landroidx/fragment/app/a;->h()I

    iget-boolean p0, p1, Lzhj;->f:Z

    if-eqz p0, :cond_81

    invoke-virtual {v0}, Landroidx/fragment/app/w;->D()V

    :cond_81
    return-void

    :cond_82
    const-string p0, "Must use non-zero containerViewId"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-void

    :cond_88
    invoke-static {v2}, Lp3p;->g(Ljava/util/Iterator;)Ljava/lang/ClassCastException;

    move-result-object p0

    throw p0
.end method

.method public final Y(Lcv3;)V
    .registers 3

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->n()Lag7;

    move-result-object p0

    iget-object p0, p0, Lag7;->a:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public Z()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public a0(Lyul;)V
    .registers 2

    return-void
.end method

.method public final b0(Lcv3;)V
    .registers 3

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    iget-object p0, p0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p0, p0, Lxv1;->D:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->f()Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_19

    check-cast p0, Lag7;

    iget-object p0, p0, Lag7;->a:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_19
    return-void
.end method

.method public c0(Ljava/lang/Class;)Lcjm;
    .registers 2

    const/4 p0, 0x0

    return-object p0
.end method

.method public final dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 6

    iget-object v0, p0, Ldx3;->m:Li7f;

    iget v1, v0, Li7f;->c:I

    if-eqz v1, :cond_28

    new-instance v1, Landroid/graphics/PointF;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    invoke-direct {v1, v2, v3}, Landroid/graphics/PointF;-><init>(FF)V

    new-instance v2, Lg7f;

    invoke-direct {v2, v0}, Lg7f;-><init>(Li7f;)V

    :goto_18
    invoke-virtual {v2}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_28

    invoke-virtual {v2}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/api/Callback;

    invoke-interface {v0, v1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto :goto_18

    :cond_28
    invoke-super {p0, p1}, Landroid/app/Activity;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3

    const-string v0, "com.opera.android.FRAGMENT_MANAGER_SERVICE"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-virtual {p0}, Landroidx/fragment/app/r;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object p0

    return-object p0

    :cond_d
    const-string v0, "com.opera.android.ui.SHEET_QUEUE_SERVICE"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1d

    iget-object p0, p0, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lqim;->d:Lnej;

    return-object p0

    :cond_1d
    const-string v0, "com.opera.android.ui.DIALOG_QUEUE_SERVICE"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2d

    iget-object p0, p0, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lqim;->c:Lz77;

    return-object p0

    :cond_2d
    const-string v0, "com.opera.android.ui.FRAGMENT_CONTROLLER_SERVICE"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3d

    iget-object p0, p0, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lqim;->b:Lll9;

    return-object p0

    :cond_3d
    invoke-super {p0, p1}, Lhjf;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public h(Lzhj;)V
    .registers 2

    return-void
.end method

.method public final onActivityResult(IILandroid/content/Intent;)V
    .registers 6

    invoke-super {p0, p1, p2, p3}, Lhjf;->onActivityResult(IILandroid/content/Intent;)V

    iget-object p0, p0, Ldx3;->k:Lzg;

    iget-object v0, p0, Lzg;->c:Ljava/lang/Object;

    check-cast v0, Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lr1o;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->delete(I)V

    iget-object p0, p0, Lzg;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-eqz v1, :cond_26

    invoke-interface {v1, p2, p3}, Lr1o;->a(ILandroid/content/Intent;)V

    return-void

    :cond_26
    if-eqz p0, :cond_34

    sget-object p1, Lorg/chromium/ui/base/WindowAndroid;->B:Lb2b;

    sget-object p1, Lt8;->a:Landroid/content/Context;

    const/4 p2, 0x0

    invoke-static {p1, p2, p0}, Larl;->a(Landroid/content/Context;ILjava/lang/String;)Larl;

    move-result-object p0

    invoke-virtual {p0}, Larl;->b()V

    :cond_34
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 3

    invoke-super {p0, p1}, Lhjf;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object v0, p0, Ldx3;->l:Ltni;

    invoke-virtual {v0, p1}, Ltni;->b(Landroid/content/res/Configuration;)V

    iget-object p0, p0, Ldx3;->o:Lqim;

    if-eqz p0, :cond_17

    iget-object p0, p0, Lqim;->j:Lisj;

    iget-object p0, p0, Lisj;->d:Lhsj;

    if-eqz p0, :cond_17

    iget-object p0, p0, Lhsj;->a:Lgtj;

    invoke-virtual {p0}, Lgtj;->k()V

    :cond_17
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 8

    invoke-static {p0}, Lsfe;->g0(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-super {p0, p1}, Lhjf;->onCreate(Landroid/os/Bundle;)V

    return-void

    :cond_a
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    new-instance v1, Ldxe;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v2

    iget-object v3, v0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    new-instance v4, Lnw3;

    const/16 v5, 0x15

    invoke-direct {v4, v0, v5}, Lnw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v5

    iget-object v5, v5, Ld6j;->c:Lx5f;

    invoke-direct {v1, p0, v2, v4, v5}, Ldxe;-><init>(Ldx3;Lcom/opera/android/settings/SettingsManager;Lnw3;Lx5f;)V

    iput-object v1, p0, Ldx3;->s:Ldxe;

    invoke-virtual {p0}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v1

    iget-object v2, p0, Ldx3;->s:Ldxe;

    invoke-virtual {v1, v2}, Ltcc;->a(Lmdc;)V

    invoke-super {p0, p1}, Lhjf;->onCreate(Landroid/os/Bundle;)V

    sget-object p1, Lowe;->c:Lowe;

    iget-object v1, p0, Ldx3;->r:Lax3;

    invoke-virtual {p1, v1}, Lowe;->a(Lnwe;)V

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->U()Z

    move-result p1

    if-nez p1, :cond_4a

    sget-object p1, Lej9;->b:Lii;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    :cond_4a
    new-instance p1, Lzg;

    new-instance v1, Lpjn;

    invoke-direct {v1, p0}, Lpjn;-><init>(Lhjf;)V

    invoke-direct {p1, v1}, Lzg;-><init>(Lpjn;)V

    iput-object p1, p0, Ldx3;->k:Lzg;

    new-instance p1, Lqi;

    iget-object v1, p0, Ldx3;->k:Lzg;

    const/4 v2, 0x0

    invoke-direct {p1, p0, v1, v2}, Lqi;-><init>(Landroid/content/Context;Lzg;Z)V

    iput-object p1, p0, Ldx3;->j:Lqi;

    new-instance v1, Lsz4;

    invoke-direct {v1, p1}, Lsz4;-><init>(Lg91;)V

    iput-object v1, p0, Lhjf;->h:Lsz4;

    invoke-virtual {p0}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p1

    iget-object v1, p0, Ldx3;->l:Ltni;

    invoke-virtual {v1, p1}, Ltni;->b(Landroid/content/res/Configuration;)V

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p1

    const-string v1, "eula_accepted.gdpr"

    invoke-virtual {p1, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_92

    invoke-virtual {p0}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v1

    new-instance v2, Lsxe;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v0, v0, Ld6j;->c:Lx5f;

    invoke-direct {v2, v0, p1}, Lsxe;-><init>(Lx5f;Lcom/opera/android/settings/SettingsManager;)V

    invoke-virtual {v1, v2}, Ltcc;->a(Lmdc;)V

    :cond_92
    iget-object p1, v3, Lxv1;->Y:Lj4c;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ldjg;

    iget-object v0, p0, Ldx3;->q:Lzw3;

    iget-object p1, p1, Ldjg;->a:Li7f;

    invoke-virtual {p1, v0}, Li7f;->b(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lxd5;->getLifecycle()Ltcc;

    move-result-object p1

    iget-object v0, v3, Lxv1;->Z:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lzkd;

    invoke-virtual {p1, v0}, Ltcc;->a(Lmdc;)V

    sget-object p1, Lcom/opera/android/wallpaper/WallpaperStorefrontExtension;->a:Ldx3;

    if-eqz p1, :cond_c1

    sget-object v0, Lcom/opera/android/wallpaper/WallpaperStorefrontExtension;->b:Llnn;

    if-eqz v0, :cond_c1

    invoke-virtual {p1}, Lxd5;->getLifecycle()Ltcc;

    move-result-object p1

    sget-object v0, Lcom/opera/android/wallpaper/WallpaperStorefrontExtension;->b:Llnn;

    invoke-virtual {p1, v0}, Ltcc;->b(Lmdc;)V

    :cond_c1
    new-instance p1, Llnn;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    sput-object p1, Lcom/opera/android/wallpaper/WallpaperStorefrontExtension;->b:Llnn;

    sput-object p0, Lcom/opera/android/wallpaper/WallpaperStorefrontExtension;->a:Ldx3;

    invoke-virtual {p0}, Lxd5;->getLifecycle()Ltcc;

    move-result-object p1

    sget-object v0, Lcom/opera/android/wallpaper/WallpaperStorefrontExtension;->b:Llnn;

    invoke-virtual {p1, v0}, Ltcc;->a(Lmdc;)V

    iget-object p0, p0, Ldx3;->n:Lhx3;

    iget-object p0, p0, Lhx3;->t:Lfx3;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    return-void
.end method

.method public onDestroy()V
    .registers 5

    invoke-super {p0}, Lhjf;->onDestroy()V

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    iget-object v0, v0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v0, v0, Lxv1;->Y:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ldjg;

    iget-object v1, p0, Ldx3;->q:Lzw3;

    iget-object v0, v0, Ldjg;->a:Li7f;

    invoke-virtual {v0, v1}, Li7f;->c(Ljava/lang/Object;)Z

    sget-object v0, Lowe;->c:Lowe;

    iget-object v1, p0, Ldx3;->r:Lax3;

    invoke-virtual {v0, v1}, Lowe;->b(Lnwe;)V

    const/4 v0, 0x0

    iput-object v0, p0, Ldx3;->s:Ldxe;

    iget-object v1, p0, Ldx3;->n:Lhx3;

    iget-object v1, v1, Lhx3;->d:Lfx3;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->f()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_37

    check-cast v1, Llg;

    iget-object v2, v1, Llg;->b:Lq6e;

    invoke-virtual {v2, v1}, Lq6e;->m(Lkri;)V

    :cond_37
    iput-object v0, p0, Lhjf;->h:Lsz4;

    iget-object v1, p0, Ldx3;->j:Lqi;

    invoke-virtual {v1}, Lorg/chromium/ui/base/WindowAndroid;->destroy()V

    iput-object v0, p0, Ldx3;->j:Lqi;

    iget-object v1, p0, Ldx3;->t:Lkoi;

    if-eqz v1, :cond_5a

    iget-object v2, v1, Lkoi;->a:Lb7f;

    invoke-virtual {v2, v1}, Lb7f;->a(Lorg/chromium/base/Callback;)V

    iget-object v2, v1, Lkoi;->d:Landroid/view/ViewGroup;

    if-eqz v2, :cond_55

    iget-object v3, v1, Lkoi;->b:Lfoi;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v2, v0}, Lfoi;->b(Landroid/view/ViewGroup;Lioi;)V

    :cond_55
    const/4 v2, 0x1

    iput-boolean v2, v1, Lkoi;->g:Z

    iput-object v0, p0, Ldx3;->t:Lkoi;

    :cond_5a
    return-void
.end method

.method public onStop()V
    .registers 2

    invoke-virtual {p0}, Ldx3;->S()Leq9;

    move-result-object v0

    invoke-virtual {v0}, Leq9;->b()V

    invoke-super {p0}, Lfp1;->onStop()V

    return-void
.end method

.method public final onWindowFocusChanged(Z)V
    .registers 2

    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V

    iget-object p0, p0, Ldx3;->o:Lqim;

    if-eqz p0, :cond_18

    iput-boolean p1, p0, Lqim;->t:Z

    if-eqz p1, :cond_f

    invoke-virtual {p0}, Lqim;->a()V

    goto :goto_18

    :cond_f
    invoke-virtual {p0}, Lqim;->c()Lbtj;

    move-result-object p0

    if-eqz p0, :cond_18

    invoke-interface {p0}, Lbtj;->I()V

    :cond_18
    :goto_18
    invoke-static {}, Lorg/chromium/ui/base/Clipboard;->getInstance()Lorg/chromium/ui/base/Clipboard;

    move-result-object p0

    invoke-virtual {p0, p1}, Lorg/chromium/ui/base/Clipboard;->c(Z)V

    return-void
.end method

.method public bridge synthetic s()Lfi;
    .registers 1

    invoke-virtual {p0}, Ldx3;->N()Lex3;

    move-result-object p0

    return-object p0
.end method

.method public final setContentView(I)V
    .registers 8

    invoke-super {p0, p1}, Lfp1;->setContentView(I)V

    new-instance v0, Lqim;

    const p1, 0x1020002

    invoke-virtual {p0, p1}, Lfp1;->findViewById(I)Landroid/view/View;

    move-result-object p1

    move-object v4, p1

    check-cast v4, Landroid/view/ViewGroup;

    invoke-virtual {p0}, Landroid/app/Activity;->hasWindowFocus()Z

    move-result v5

    move-object v2, p0

    move-object v3, p0

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lqim;-><init>(Ldx3;Ldx3;Ldx3;Landroid/view/ViewGroup;Z)V

    iput-object v0, v1, Ldx3;->o:Lqim;

    invoke-virtual {v1}, Ldx3;->N()Lex3;

    move-result-object p0

    invoke-interface {p0}, Lijf;->b()Lcom/opera/android/Lazy;

    move-result-object p0

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgjm;

    new-instance p1, Lnim;

    invoke-direct {p1, v0}, Lnim;-><init>(Lqim;)V

    invoke-virtual {p0, p1}, Lgjm;->F(Ljava/lang/Object;)V

    return-void
.end method

.method public startActivityForResult(Landroid/content/Intent;ILandroid/os/Bundle;)V
    .registers 9

    const-string v0, "org.chromium.chrome.browser.eenp"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_58

    sget-boolean v0, Lcom/opera/android/browser/external/ExternalAppService;->b:Z

    invoke-virtual {p0}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v0

    check-cast v0, Lqdc;

    iget-object v0, v0, Lqdc;->i:Lqcc;

    sget-object v1, Lqcc;->e:Lqcc;

    invoke-virtual {v0, v1}, Lqcc;->d(Lqcc;)Z

    move-result v0

    if-eqz v0, :cond_58

    sget-boolean v0, Lcom/opera/android/browser/external/ExternalAppService;->b:Z

    if-nez v0, :cond_58

    invoke-virtual {p0}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v0

    new-instance v1, Lwl8;

    new-instance v2, Landroid/content/Intent;

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    const/high16 v3, 0x10000000

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    const/4 v3, 0x0

    const/high16 v4, 0xc000000

    invoke-static {p0, v3, v2, v4}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lxl8;-><init>(Ldx3;Landroid/app/PendingIntent;)V

    const/4 v2, 0x1

    iput-boolean v2, v1, Lwl8;->d:Z

    const v2, 0x7f1401b7

    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    new-instance v3, Lsxh;

    const v4, 0x7f140b63

    invoke-direct {v3, v4, v2}, Lsxh;-><init>(I[Ljava/lang/Object;)V

    invoke-virtual {v1, v3}, Lxl8;->a(Lsxh;)V

    invoke-virtual {v0, v1}, Ltcc;->a(Lmdc;)V

    :cond_58
    invoke-super {p0, p1, p2, p3}, Lxd5;->startActivityForResult(Landroid/content/Intent;ILandroid/os/Bundle;)V

    return-void
.end method

.method public bridge synthetic t()Lijf;
    .registers 1

    invoke-virtual {p0}, Ldx3;->N()Lex3;

    move-result-object p0

    return-object p0
.end method

.method public final w()I
    .registers 3

    invoke-virtual {p0}, Ldx3;->E()Z

    move-result v0

    if-nez v0, :cond_b

    invoke-super {p0}, Lhjf;->w()I

    move-result p0

    return p0

    :cond_b
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->g()Lg7j;

    move-result-object v0

    invoke-virtual {p0}, Lhjf;->z()Z

    move-result p0

    const/16 v1, 0x8

    invoke-static {v0, p0, v1}, Lqbe;->A(Lg7j;ZI)I

    move-result p0

    return p0
.end method
