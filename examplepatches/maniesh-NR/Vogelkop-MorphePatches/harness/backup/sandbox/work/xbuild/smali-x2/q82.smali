.class public final Lq82;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lh7f;

.field public final b:Lcom/opera/android/BrowserActivity;

.field public c:Z

.field public d:Z

.field public e:Lg82;

.field public f:Z

.field public final g:Lp82;

.field public final h:Lc5o;

.field public final i:Llhb;

.field public j:Lb2l;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lk6l;Lc5o;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lqz;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lqz;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Lo82;

    invoke-direct {v1, p0}, Lo82;-><init>(Lq82;)V

    new-instance v2, Lh7f;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v2, p0, Lq82;->a:Lh7f;

    new-instance v2, Lp82;

    invoke-direct {v2, p0}, Lp82;-><init>(Lq82;)V

    iput-object v2, p0, Lq82;->g:Lp82;

    iput-object p1, p0, Lq82;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p1}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v2

    check-cast v2, Lqdc;

    iget-object v2, v2, Lqdc;->i:Lqcc;

    sget-object v3, Lqcc;->e:Lqcc;

    invoke-virtual {v2, v3}, Lqcc;->d(Lqcc;)Z

    move-result v2

    iput-boolean v2, p0, Lq82;->d:Z

    iput-object p3, p0, Lq82;->h:Lc5o;

    invoke-virtual {p1}, Lcom/opera/android/BrowserActivity;->x0()Lwy;

    move-result-object p1

    iget-object p1, p1, Lwy;->v:Llhb;

    iput-object p1, p0, Lq82;->i:Llhb;

    invoke-virtual {p2, v0}, Lk6l;->a(La2l;)Lf6l;

    invoke-virtual {p2, v1}, Lk6l;->c(Lj6l;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 7

    iget-object v0, p0, Lq82;->j:Lb2l;

    check-cast v0, Ld7l;

    invoke-virtual {v0}, Ld7l;->f0()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lq82;->c(Ljava/lang/String;)Lg82;

    move-result-object v0

    iput-object v0, p0, Lq82;->e:Lg82;

    iget-object v0, p0, Lq82;->j:Lb2l;

    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->B()I

    move-result v0

    const/high16 v1, 0x8000000

    and-int/2addr v0, v1

    if-eqz v0, :cond_20

    sget-object v0, Llqm;->i:Llqm;

    goto :goto_22

    :cond_20
    sget-object v0, Llqm;->d:Llqm;

    :goto_22
    iget-object v1, p0, Lq82;->a:Lh7f;

    invoke-static {v1, v1}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v2

    :goto_28
    invoke-virtual {v2}, Lg7f;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_44

    invoke-virtual {v2}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lr82;

    iget-object v4, p0, Lq82;->e:Lg82;

    iget-object v5, p0, Lq82;->j:Lb2l;

    check-cast v5, Ld7l;

    iget-object v5, v5, Ld7l;->j:Le7l;

    invoke-interface {v5}, Lb9l;->m()Z

    move-result v5

    invoke-interface {v3, v4, v0, v5}, Lr82;->d(Lg82;Llqm;Z)V

    goto :goto_28

    :cond_44
    iget-boolean v0, p0, Lq82;->f:Z

    const/4 v2, 0x1

    if-nez v0, :cond_4b

    iput-boolean v2, p0, Lq82;->f:Z

    :cond_4b
    invoke-static {v1, v1}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :goto_4f
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_6d

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lr82;

    iget-object v4, p0, Lq82;->j:Lb2l;

    check-cast v4, Ld7l;

    iget-object v4, v4, Ld7l;->j:Le7l;

    invoke-interface {v4}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/opera/android/browser/UrlMangler;->d(Ljava/lang/String;)Z

    move-result v4

    invoke-interface {v3, v4, v2}, Lr82;->b(ZZ)V

    goto :goto_4f

    :cond_6d
    iget-object v0, p0, Lq82;->j:Lb2l;

    invoke-static {v0}, Luy3;->H(Lb2l;)Lcom/opera/android/browser/chromium/ChromiumContent;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v0

    invoke-static {v0}, Lorg/chromium/content/browser/GestureListenerManagerImpl;->e(Lorg/chromium/content_public/browser/WebContents;)Lorg/chromium/content/browser/GestureListenerManagerImpl;

    move-result-object v0

    iget-object v3, p0, Lq82;->g:Lp82;

    const/4 v4, 0x2

    invoke-virtual {v0, v3, v4}, Lorg/chromium/content/browser/GestureListenerManagerImpl;->b(Ljw9;I)V

    iget-boolean v0, p0, Lq82;->d:Z

    if-eqz v0, :cond_9d

    new-instance v0, Lg7f;

    invoke-direct {v0, v1}, Lg7f;-><init>(Lh7f;)V

    :goto_8d
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_9d

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lr82;

    invoke-interface {v1}, Lr82;->a()V

    goto :goto_8d

    :cond_9d
    iput-boolean v2, p0, Lq82;->c:Z

    return-void
.end method

.method public final b(ZZ)V
    .registers 15

    iget-boolean v0, p0, Lq82;->c:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Lq82;->g:Lp82;

    const/4 v1, 0x0

    iput v1, v0, Lp82;->a:I

    iget-object v2, p0, Lq82;->j:Lb2l;

    invoke-static {v2}, Luy3;->H(Lb2l;)Lcom/opera/android/browser/chromium/ChromiumContent;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v2}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v2

    invoke-static {v2}, Lorg/chromium/content/browser/GestureListenerManagerImpl;->e(Lorg/chromium/content_public/browser/WebContents;)Lorg/chromium/content/browser/GestureListenerManagerImpl;

    move-result-object v2

    invoke-virtual {v2, v0}, Lorg/chromium/content/browser/GestureListenerManagerImpl;->h(Ljw9;)V

    iput-boolean v1, p0, Lq82;->f:Z

    const/4 v0, 0x0

    if-eqz p2, :cond_f6

    iget-object p2, p0, Lq82;->e:Lg82;

    iget-object p2, p2, Lg82;->a:Ljava/lang/String;

    iget-object v2, p0, Lq82;->h:Lc5o;

    iget-object v2, v2, Lc5o;->b:Ljava/lang/Object;

    check-cast v2, Ljava/util/HashMap;

    invoke-virtual {v2, p2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lkhb;

    if-eqz p1, :cond_f6

    if-eqz p2, :cond_f6

    iget-object p1, p0, Lq82;->i:Llhb;

    iget-object v2, p1, Llhb;->a:Li16;

    iget-object v3, p1, Llhb;->c:Lyl;

    iget-object v4, p1, Llhb;->b:Lx5f;

    iget-object v5, p1, Llhb;->f:Lnhb;

    iget-boolean p2, p2, Lkhb;->a:Z

    invoke-virtual {p1, p2}, Llhb;->b(I)Z

    move-result v6

    if-eqz v6, :cond_f6

    iget-object v6, p1, Llhb;->h:Lyz;

    if-eqz v6, :cond_d7

    invoke-virtual {v6}, Lyz;->q()Z

    move-result v6

    if-nez v6, :cond_cc

    iget-object v10, p1, Llhb;->h:Lyz;

    iput-object v0, p1, Llhb;->h:Lyz;

    iput-boolean v1, p1, Llhb;->l:Z

    iget-object v11, v5, Lnhb;->b:Lhl;

    if-eqz v11, :cond_9f

    iget-object v5, v11, Ldl;->b:Lq50;

    iget-object v6, v11, Ldl;->c:Ljava/lang/String;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v4 .. v9}, Lx5f;->r(Lq50;Ljava/lang/String;IZZ)V

    iget-object v4, p1, Llhb;->g:Lpo7;

    invoke-virtual {v4}, Lekc;->g()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ley;

    if-eqz v4, :cond_95

    iget-wide v4, v4, Ley;->a:J

    const-wide/16 v6, 0x100

    and-long/2addr v4, v6

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-eqz v4, :cond_95

    invoke-virtual {v3, v10, v11}, Ln1;->j(Lyz;Lhl;)V

    invoke-virtual {v10}, Lyz;->b()V

    invoke-virtual {v2}, Li16;->y()V

    iget-boolean v2, p1, Llhb;->k:Z

    if-eqz v2, :cond_f6

    iput-boolean v1, p1, Llhb;->k:Z

    invoke-virtual {p1, p2}, Llhb;->b(I)Z

    move-result p2

    if-eqz p2, :cond_f6

    invoke-virtual {p1}, Llhb;->a()V

    goto :goto_f6

    :cond_95
    new-instance v4, Ljq;

    invoke-direct {v4, p1, v11}, Ljq;-><init>(Llhb;Lhl;)V

    iput-object v4, v10, Lyz;->q:Ltz;

    invoke-virtual {v3, v10, v11, v1}, Lyl;->p(Lyz;Ldl;Z)V

    :cond_9f
    invoke-virtual {v2}, Li16;->y()V

    iget-boolean v2, p1, Llhb;->k:Z

    if-eqz v2, :cond_b1

    iput-boolean v1, p1, Llhb;->k:Z

    invoke-virtual {p1, p2}, Llhb;->b(I)Z

    move-result p2

    if-eqz p2, :cond_b1

    invoke-virtual {p1}, Llhb;->a()V

    :cond_b1
    iget-object p1, p1, Llhb;->e:Lcsh;

    invoke-virtual {p1, v1}, Lh1b;->u(I)La1b;

    move-result-object p1

    :cond_b7
    invoke-virtual {p1}, Lq4;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_f6

    invoke-virtual {p1}, Lq4;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljhb;

    iget-object v2, p0, Lq82;->b:Lcom/opera/android/BrowserActivity;

    invoke-interface {p2, v2, v10}, Ljhb;->a(Lcom/opera/android/BrowserActivity;Lyz;)Z

    move-result p2

    if-eqz p2, :cond_b7

    goto :goto_f6

    :cond_cc
    iget-object p2, p1, Llhb;->h:Lyz;

    invoke-virtual {p2}, Lyz;->c()V

    iput-object v0, p1, Llhb;->h:Lyz;

    sget-object p2, Ls50;->g:Ls50;

    :cond_d5
    :goto_d5
    move-object v10, p2

    goto :goto_e5

    :cond_d7
    iget-boolean p2, p1, Llhb;->j:Z

    if-eqz p2, :cond_de

    sget-object p2, Ls50;->e:Ls50;

    goto :goto_d5

    :cond_de
    iget-object p2, p1, Llhb;->i:Ls50;

    if-nez p2, :cond_d5

    sget-object p2, Ls50;->f:Ls50;

    goto :goto_d5

    :goto_e5
    const/4 p2, 0x1

    iput-boolean p2, p1, Llhb;->l:Z

    iget-object p1, v5, Lnhb;->b:Lhl;

    if-eqz p1, :cond_f6

    iget-object v5, p1, Ldl;->b:Lq50;

    iget-object v6, p1, Ldl;->c:Ljava/lang/String;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v4 .. v10}, Lx5f;->s(Lq50;Ljava/lang/String;IZZLs50;)V

    :cond_f6
    :goto_f6
    iput-object v0, p0, Lq82;->e:Lg82;

    iget-boolean p1, p0, Lq82;->d:Z

    if-eqz p1, :cond_112

    iget-object p1, p0, Lq82;->a:Lh7f;

    invoke-static {p1, p1}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p1

    :goto_102
    invoke-virtual {p1}, Lg7f;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_112

    invoke-virtual {p1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lr82;

    invoke-interface {p2}, Lr82;->e()V

    goto :goto_102

    :cond_112
    iput-boolean v1, p0, Lq82;->c:Z

    return-void
.end method

.method public final c(Ljava/lang/String;)Lg82;
    .registers 5

    const/4 v0, 0x0

    if-eqz p1, :cond_49

    iget-object v1, p0, Lq82;->h:Lc5o;

    iget-object v1, v1, Lc5o;->a:Ljava/lang/Object;

    check-cast v1, Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lg82;

    if-eqz v1, :cond_12

    return-object v1

    :cond_12
    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p0, p0, Lq82;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->y()Lfqe;

    move-result-object p0

    iget-object v1, p0, Lfqe;->a:Landroid/content/Context;

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->z()Lfue;

    move-result-object v1

    invoke-virtual {v1}, Lfue;->d()V

    iget-object v1, v1, Lfue;->a:Lcue;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    if-eq v1, v2, :cond_3c

    move-object p0, v0

    goto :goto_40

    :cond_3c
    invoke-virtual {p0}, Lfqe;->c()Luqe;

    move-result-object p0

    :goto_40
    if-eqz p0, :cond_49

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1}, Luqe;->e(Ljava/lang/String;Z)Lmsh;

    move-result-object p1

    if-nez p1, :cond_4a

    :cond_49
    return-object v0

    :cond_4a
    invoke-virtual {p0, p1, v1}, Luqe;->i(Lmsh;Z)Lg82;

    move-result-object p0

    return-object p0
.end method

.method public final d()Z
    .registers 3

    iget-object v0, p0, Lq82;->j:Lb2l;

    check-cast v0, Ld7l;

    invoke-virtual {v0}, Ld7l;->f0()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_16

    invoke-virtual {p0, v0}, Lq82;->c(Ljava/lang/String;)Lg82;

    move-result-object p0

    if-eqz p0, :cond_16

    const/4 p0, 0x1

    return p0

    :cond_16
    const/4 p0, 0x0

    return p0
.end method

.method public final e()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lq82;->d:Z

    iget-boolean v0, p0, Lq82;->c:Z

    if-eqz v0, :cond_1d

    iget-object p0, p0, Lq82;->a:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_d
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1d

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lr82;

    invoke-interface {v0}, Lr82;->a()V

    goto :goto_d

    :cond_1d
    return-void
.end method
