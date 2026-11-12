.class public abstract Laoo;
.super Lfjo;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnTouchListener;
.implements Looo;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Landroid/view/View;

.field public final c:Lami;

.field public d:Ljava/util/ArrayList;

.field public e:Lloo;

.field public f:D

.field public g:D

.field public h:Ljava/util/ArrayList;

.field public i:Lbzo;

.field public j:Landroid/view/View;

.field public k:Landroid/view/View;

.field public l:Lxbf;

.field public m:Ly55;

.field public n:Lltm;

.field public o:Lsc;

.field public p:Ltvk;

.field public q:Z

.field public r:Loam;

.field public s:Lzg;

.field public final t:Ldrj;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/view/View;)V
    .registers 5

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput-object p1, p0, Laoo;->a:Landroid/content/Context;

    if-nez p2, :cond_d

    invoke-virtual {p0}, Laoo;->k()Landroid/view/View;

    move-result-object p2

    :cond_d
    iput-object p2, p0, Laoo;->b:Landroid/view/View;

    new-instance v0, Lami;

    const/16 v1, 0x10

    invoke-direct {v0, p1, v1}, Lami;-><init>(Landroid/content/Context;B)V

    iput-object v0, p0, Laoo;->c:Lami;

    new-instance p1, Ldrj;

    const/16 v0, 0xb

    invoke-direct {p1, v0}, Ldrj;-><init>(B)V

    iput-object p1, p0, Laoo;->t:Ldrj;

    invoke-virtual {p0, p2}, Laoo;->s(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Laoo;->q:Z

    return-void
.end method

.method public final b()V
    .registers 1

    return-void
.end method

.method public final c()V
    .registers 1

    return-void
.end method

.method public final d()Ljava/lang/Integer;
    .registers 1

    const/4 p0, 0x1

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public final e()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final f()Z
    .registers 1

    iget-boolean p0, p0, Laoo;->q:Z

    return p0
.end method

.method public final g()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final h()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public i(Landroid/view/View;)V
    .registers 3

    iget-boolean v0, p0, Laoo;->q:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Laoo;->j:Landroid/view/View;

    if-ne p1, v0, :cond_d

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Laoo;->u(I)V

    :cond_d
    iget-object p0, p0, Laoo;->c:Lami;

    invoke-virtual {p0, p1}, Lami;->a(Landroid/view/View;)V

    return-void
.end method

.method public final j(Landroid/view/View;)V
    .registers 9

    iget-object v0, p0, Laoo;->i:Lbzo;

    instance-of v1, v0, Lcie;

    if-eqz v1, :cond_14

    check-cast v0, Lcie;

    iget-boolean v0, v0, Lcie;->q0:Z

    if-nez v0, :cond_14

    iget-object v0, p0, Laoo;->m:Ly55;

    if-eqz v0, :cond_14

    invoke-interface {v0}, Lbl;->o()V

    return-void

    :cond_14
    invoke-virtual {p0}, Laoo;->t()V

    iget-object v0, p0, Laoo;->l:Lxbf;

    if-nez v0, :cond_2c

    iget-object v3, p0, Laoo;->s:Lzg;

    new-instance v1, Lxbf;

    iget-object v4, p0, Laoo;->m:Ly55;

    iget-object v6, p0, Laoo;->n:Lltm;

    iget-object v2, p0, Laoo;->a:Landroid/content/Context;

    move-object v5, p0

    invoke-direct/range {v1 .. v6}, Lxbf;-><init>(Landroid/content/Context;Lzg;Lbl;Laoo;Lltm;)V

    iput-object v1, v5, Laoo;->l:Lxbf;

    move-object v0, v1

    :cond_2c
    invoke-virtual {v0, p1}, Lxbf;->a(Landroid/view/View;)V

    return-void
.end method

.method public k()Landroid/view/View;
    .registers 1

    return-object p0
.end method

.method public l(Lw06;)V
    .registers 5

    iget-object v0, p0, Laoo;->j:Landroid/view/View;

    if-eqz v0, :cond_9

    iget-object v1, p0, Laoo;->c:Lami;

    invoke-virtual {v1, v0, p0}, Lami;->b(Landroid/view/View;Looo;)V

    :cond_9
    sget-object v0, Lw06;->b:Lw06;

    if-eq v0, p1, :cond_25

    sget-object v0, Lw06;->c:Lw06;

    if-eq v0, p1, :cond_25

    sget-object v0, Lw06;->u:Lw06;

    if-eq v0, p1, :cond_25

    sget-object v0, Lw06;->g:Ln06;

    if-eq v0, p1, :cond_25

    sget-object v0, Lw06;->i:Lw06;

    if-eq v0, p1, :cond_25

    sget-object v0, Lw06;->j:Lw06;

    if-eq v0, p1, :cond_25

    sget-object v0, Lw06;->h:Lw06;

    if-ne v0, p1, :cond_5c

    :cond_25
    iget-object p1, p0, Laoo;->j:Landroid/view/View;

    if-eqz p1, :cond_30

    sget-boolean v0, Lg1p;->j:Z

    if-eqz v0, :cond_30

    invoke-virtual {p0, p1}, Laoo;->s(Landroid/view/View;)V

    :cond_30
    iget-object p1, p0, Laoo;->k:Landroid/view/View;

    if-eqz p1, :cond_3a

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    :cond_3a
    iget-object p1, p0, Laoo;->d:Ljava/util/ArrayList;

    invoke-static {p1}, Lm5h;->d(Ljava/util/List;)Z

    move-result p1

    if-nez p1, :cond_5c

    iget-object p1, p0, Laoo;->d:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :cond_49
    :goto_49
    if-ge v1, v0, :cond_5c

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    if-eqz v2, :cond_49

    check-cast v2, Landroid/view/View;

    invoke-virtual {v2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v2, p0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    goto :goto_49

    :cond_5c
    return-void
.end method

.method public m()V
    .registers 1

    return-void
.end method

.method public n()V
    .registers 1

    return-void
.end method

.method public o()V
    .registers 1

    return-void
.end method

.method public final onClick(Landroid/view/View;)V
    .registers 2

    invoke-virtual {p0, p1}, Laoo;->j(Landroid/view/View;)V

    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 5

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_15

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    float-to-double v0, p1

    iput-wide v0, p0, Laoo;->f:D

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    float-to-double p1, p1

    iput-wide p1, p0, Laoo;->g:D

    :cond_15
    const/4 p0, 0x0

    return p0
.end method

.method public p()V
    .registers 1

    return-void
.end method

.method public q(Landroid/view/View;)V
    .registers 2

    invoke-virtual {p0, p1}, Laoo;->j(Landroid/view/View;)V

    return-void
.end method

.method public r()V
    .registers 1

    return-void
.end method

.method public final s(Landroid/view/View;)V
    .registers 6

    new-instance v0, Landroid/view/GestureDetector;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Lsgh;

    const/4 v3, 0x4

    invoke-direct {v2, p0, p1, v3}, Lsgh;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v0, v1, v2}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Landroid/view/View;->setClickable(Z)V

    new-instance v1, Lbmd;

    const/4 v2, 0x2

    invoke-direct {v1, p0, v0, v2}, Lbmd;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    return-void
.end method

.method public final t()V
    .registers 15

    iget-object v0, p0, Laoo;->p:Ltvk;

    if-eqz v0, :cond_15

    iget-object v1, p0, Laoo;->i:Lbzo;

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Ltvk;->f(Lbzo;I)Z

    move-result v0

    if-nez v0, :cond_15

    iget-object v0, p0, Laoo;->e:Lloo;

    if-eqz v0, :cond_15

    invoke-interface {v0}, Lloo;->onAdClicked()V

    return-void

    :cond_15
    iget-object v0, p0, Laoo;->o:Lsc;

    if-eqz v0, :cond_1c

    invoke-virtual {v0}, Lsc;->g()V

    :cond_1c
    iget-object v0, p0, Laoo;->h:Ljava/util/ArrayList;

    if-eqz v0, :cond_85

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    move v3, v2

    :cond_26
    if-ge v3, v1, :cond_85

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Lpho;

    iget v5, v4, Lpho;->a:I

    const/4 v6, 0x4

    if-ne v5, v6, :cond_26

    iget-object v4, v4, Lpho;->b:Ljava/util/ArrayList;

    if-eqz v4, :cond_26

    sget-object v0, Lsjo;->a:Ljava/util/List;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    const-string v1, "clickts"

    invoke-static {v1, v0, v4}, Lsjo;->e(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    :cond_4d
    :goto_4d
    if-ge v2, v1, :cond_7e

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Ljava/lang/String;

    new-instance v7, Lcom/opera/ad/entity/Macros;

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v8

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v9

    iget-wide v10, p0, Laoo;->f:D

    iget-wide v12, p0, Laoo;->g:D

    invoke-direct/range {v7 .. v13}, Lcom/opera/ad/entity/Macros;-><init>(IIDD)V

    invoke-static {v3, v7}, Llno;->a(Ljava/lang/String;Lcom/opera/ad/entity/Macros;)Ljava/lang/String;

    move-result-object v3

    invoke-static {}, Lf1p;->a()Lf1p;

    move-result-object v4

    invoke-virtual {v4, v3}, Lf1p;->p(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_4d

    invoke-static {v3, v6}, Lphj;->t(Ljava/lang/String;I)V

    goto :goto_4d

    :cond_7e
    iget-object p0, p0, Laoo;->e:Lloo;

    if-eqz p0, :cond_85

    invoke-interface {p0}, Lloo;->onAdClicked()V

    :cond_85
    return-void
.end method

.method public final u(I)V
    .registers 10

    iget-object v0, p0, Laoo;->p:Ltvk;

    const/4 v1, 0x1

    if-eqz v0, :cond_19

    if-ne p1, v1, :cond_9

    move v2, v1

    goto :goto_a

    :cond_9
    const/4 v2, 0x4

    :goto_a
    iget-object v3, p0, Laoo;->i:Lbzo;

    invoke-virtual {v0, v3, v2}, Ltvk;->f(Lbzo;I)Z

    move-result v0

    if-nez v0, :cond_19

    if-ne v1, p1, :cond_63

    iget-object p0, p0, Laoo;->e:Lloo;

    if-eqz p0, :cond_63

    goto :goto_60

    :cond_19
    invoke-virtual {p0}, Laoo;->r()V

    iget-object v0, p0, Laoo;->h:Ljava/util/ArrayList;

    if-eqz v0, :cond_63

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    move v4, v3

    :cond_26
    if-ge v4, v2, :cond_63

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Lpho;

    iget v6, v5, Lpho;->a:I

    if-ne v6, p1, :cond_26

    iget-object v5, v5, Lpho;->b:Ljava/util/ArrayList;

    if-eqz v5, :cond_26

    sget-object v0, Lsjo;->a:Ljava/util/List;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    const-string v2, "impressionts"

    invoke-static {v2, v0, v5}, Lsjo;->e(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    :goto_4c
    if-ge v3, v2, :cond_5a

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Ljava/lang/String;

    invoke-static {v4, p1}, Lphj;->t(Ljava/lang/String;I)V

    goto :goto_4c

    :cond_5a
    iget-object p0, p0, Laoo;->e:Lloo;

    if-eqz p0, :cond_63

    if-ne v1, p1, :cond_63

    :goto_60
    invoke-interface {p0}, Lloo;->a()V

    :cond_63
    return-void
.end method

.method public final unregister()V
    .registers 5

    invoke-virtual {p0}, Laoo;->p()V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object p0, p0, Laoo;->c:Lami;

    iget-object v1, p0, Lami;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/WeakHashMap;

    invoke-virtual {v1}, Ljava/util/WeakHashMap;->clear()V

    iget-object v1, p0, Lami;->d:Ljava/lang/Object;

    check-cast v1, Ljava/util/WeakHashMap;

    invoke-virtual {v1}, Ljava/util/WeakHashMap;->clear()V

    iget-object v1, p0, Lami;->e:Ljava/lang/Object;

    check-cast v1, Ljava/util/WeakHashMap;

    invoke-virtual {v1}, Ljava/util/WeakHashMap;->clear()V

    iget-object v1, p0, Lami;->b:Ljava/lang/Object;

    check-cast v1, Ltuj;

    iget-object v2, v1, Ltuj;->g:Ljava/lang/Object;

    check-cast v2, Ljava/util/WeakHashMap;

    invoke-virtual {v2}, Ljava/util/WeakHashMap;->clear()V

    iget-object v2, v1, Ltuj;->k:Ljava/lang/Object;

    check-cast v2, Landroid/os/Handler;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeMessages(I)V

    iput-boolean v3, v1, Ltuj;->c:Z

    iget-object p0, p0, Lami;->f:Ljava/lang/Object;

    check-cast p0, Landroid/os/Handler;

    invoke-virtual {p0, v3}, Landroid/os/Handler;->removeMessages(I)V

    iget-object p0, v1, Ltuj;->g:Ljava/lang/Object;

    check-cast p0, Ljava/util/WeakHashMap;

    invoke-virtual {p0}, Ljava/util/WeakHashMap;->clear()V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeMessages(I)V

    iput-boolean v3, v1, Ltuj;->c:Z

    iget-object p0, v1, Ltuj;->f:Ljava/lang/Object;

    check-cast p0, Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/ViewTreeObserver;

    if-eqz p0, :cond_62

    invoke-virtual {p0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v2

    if-eqz v2, :cond_62

    iget-object v2, v1, Ltuj;->e:Ljava/lang/Object;

    check-cast v2, Lml2;

    invoke-virtual {p0, v2}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    :cond_62
    iget-object p0, v1, Ltuj;->f:Ljava/lang/Object;

    check-cast p0, Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/Reference;->clear()V

    iput-object v0, v1, Ltuj;->i:Ljava/lang/Object;

    return-void
.end method

.method public final v(Landroid/view/View;)V
    .registers 6

    sget-object v0, Lsjo;->b:Lygo;

    invoke-virtual {v0}, Li7c;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_53

    iget-object v0, p0, Laoo;->i:Lbzo;

    if-eqz v0, :cond_53

    iget-object v0, p0, Laoo;->r:Loam;

    if-eqz v0, :cond_53

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lc26;->q:Ll5b;

    iget-boolean v1, v1, Ll5b;->b:Z

    if-nez v1, :cond_23

    invoke-static {v0}, Lc26;->f(Landroid/content/Context;)V

    :cond_23
    iget-object v0, p0, Laoo;->s:Lzg;

    if-eqz v0, :cond_2c

    iget-object v0, v0, Lzg;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    goto :goto_2d

    :cond_2c
    const/4 v0, 0x0

    :goto_2d
    instance-of v1, p1, Leuo;

    if-eqz v1, :cond_3d

    new-instance v1, Lc6p;

    check-cast p1, Leuo;

    iget-object v2, p0, Laoo;->r:Loam;

    invoke-direct {v1, p1, v0, v2}, Lc6p;-><init>(Leuo;Ljava/lang/String;Loam;)V

    :goto_3a
    iput-object v1, p0, Laoo;->o:Lsc;

    return-void

    :cond_3d
    instance-of v1, p1, Landroid/webkit/WebView;

    iget-object v2, p0, Laoo;->r:Loam;

    if-eqz v1, :cond_4c

    new-instance v1, Lnoo;

    check-cast p1, Landroid/webkit/WebView;

    const/4 v3, 0x0

    invoke-direct {v1, p1, v0, v2, v3}, Lnoo;-><init>(Landroid/view/View;Ljava/lang/String;Loam;B)V

    goto :goto_3a

    :cond_4c
    new-instance v1, Lnoo;

    const/4 v3, 0x1

    invoke-direct {v1, p1, v0, v2, v3}, Lnoo;-><init>(Landroid/view/View;Ljava/lang/String;Loam;B)V

    goto :goto_3a

    :cond_53
    return-void
.end method
