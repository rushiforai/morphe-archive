.class public final Lef7;
.super Liji;
.source "SourceFile"


# instance fields
.field public final A:Ljv0;

.field public final B:Lwjh;

.field public C:Lag;

.field public D:Lkc0;

.field public E:Lmc0;

.field public F:Z

.field public G:Z

.field public H:Z

.field public I:Z

.field public final w:Lre7;

.field public final x:Z

.field public y:Lre7;

.field public final z:Lrf7;


# direct methods
.method public constructor <init>(Lmej;Ldx3;Lre7;ZLrf7;Ljv0;Lwjh;)V
    .registers 8

    invoke-direct {p0, p1, p2}, Liji;-><init>(Lmej;Ldx3;)V

    sget-object p1, Lkc0;->d:Lkc0;

    iput-object p1, p0, Lef7;->D:Lkc0;

    iput-object p3, p0, Lef7;->w:Lre7;

    iput-boolean p4, p0, Lef7;->x:Z

    iput-object p5, p0, Lef7;->z:Lrf7;

    iput-object p6, p0, Lef7;->A:Ljv0;

    iput-object p7, p0, Lef7;->B:Lwjh;

    return-void
.end method


# virtual methods
.method public final A()V
    .registers 2

    sget-object v0, Lkc0;->e:Lkc0;

    iput-object v0, p0, Lef7;->D:Lkc0;

    return-void
.end method

.method public final B()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lef7;->G:Z

    return-void
.end method

.method public final C()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lef7;->H:Z

    return-void
.end method

.method public final D()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lef7;->F:Z

    return-void
.end method

.method public final E()V
    .registers 2

    sget-object v0, Lmc0;->b:Lmc0;

    iput-object v0, p0, Lef7;->E:Lmc0;

    return-void
.end method

.method public final F()V
    .registers 2

    sget-object v0, Lmc0;->c:Lmc0;

    iput-object v0, p0, Lef7;->E:Lmc0;

    return-void
.end method

.method public final G()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lef7;->I:Z

    return-void
.end method

.method public final H()V
    .registers 3

    const/4 v0, 0x2

    sget-object v1, Lkc0;->h:Lkc0;

    invoke-virtual {p0, v0, v1}, Lef7;->a0(ILkc0;)V

    return-void
.end method

.method public final I()V
    .registers 3

    const/4 v0, 0x1

    sget-object v1, Lkc0;->f:Lkc0;

    invoke-virtual {p0, v0, v1}, Lef7;->a0(ILkc0;)V

    return-void
.end method

.method public final K()Z
    .registers 5

    iget-object v0, p0, Lef7;->A:Ljv0;

    invoke-interface {v0}, Ljv0;->v()Z

    move-result v0

    if-nez v0, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    iget-object p0, p0, Lef7;->w:Lre7;

    iget-wide v0, p0, Lre7;->j:J

    sget-object v2, Lu92;->e:Ljava/util/Set;

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-lez v2, :cond_1b

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    goto :goto_1c

    :cond_1b
    const/4 v0, 0x0

    :goto_1c
    iget-object v1, p0, Lre7;->m:Ljava/lang/String;

    invoke-static {p0}, Lrf7;->g(Lre7;)Lo29;

    move-result-object p0

    invoke-static {v0, v1, p0}, Lvtp;->a0(Ljava/lang/Long;Ljava/lang/String;Lo29;)Z

    move-result p0

    return p0
.end method

.method public final L(Lkg7;)Z
    .registers 8

    sget-object v0, Lkg7;->l:Lkg7;

    const/4 v1, 0x0

    if-eq p1, v0, :cond_9

    sget-object v0, Lkg7;->k:Lkg7;

    if-ne p1, v0, :cond_1f

    :cond_9
    iget-object p1, p0, Lef7;->w:Lre7;

    iget-wide v2, p1, Lre7;->j:J

    const-wide/32 v4, 0x6400000

    cmp-long v0, v2, v4

    if-gtz v0, :cond_1f

    iget-object p0, p0, Ldej;->b:Lmej;

    invoke-interface {p0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1, v1}, Lrf7;->n(Landroid/content/Context;Lre7;Z)Z

    move-result p0

    return p0

    :cond_1f
    return v1
.end method

.method public final M()Z
    .registers 2

    iget-boolean v0, p0, Lef7;->x:Z

    if-nez v0, :cond_12

    iget-object p0, p0, Lef7;->w:Lre7;

    invoke-static {p0}, Lrf7;->g(Lre7;)Lo29;

    move-result-object p0

    invoke-virtual {p0}, Lo29;->d()Z

    move-result p0

    if-eqz p0, :cond_12

    const/4 p0, 0x1

    return p0

    :cond_12
    const/4 p0, 0x0

    return p0
.end method

.method public final a(Landroid/content/Context;)Landroid/view/View;
    .registers 7

    invoke-super {p0, p1}, Liji;->a(Landroid/content/Context;)Landroid/view/View;

    move-result-object p1

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, p0, Liji;->c:Ldx3;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object v0

    iget-object v1, v0, Lydn;->d:Lvdn;

    iget-boolean v1, v1, Lvdn;->a:Z

    const/4 v2, 0x0

    iget-object v3, p0, Lef7;->w:Lre7;

    if-eqz v1, :cond_48

    iget-object v1, v0, Lydn;->c:Lgfn;

    invoke-interface {v1}, Lgfn;->isEnabled()Z

    move-result v1

    if-nez v1, :cond_48

    iget-object v1, v3, Lre7;->a:Lxf7;

    invoke-virtual {v1}, Lxf7;->a()Z

    move-result v1

    iget-object v4, v0, Lydn;->d:Lvdn;

    invoke-virtual {v4}, Lvdn;->a()Z

    move-result v4

    if-eqz v4, :cond_33

    if-eqz v1, :cond_3b

    :cond_33
    iget-object v4, v0, Lydn;->d:Lvdn;

    iget-boolean v4, v4, Lvdn;->a:Z

    if-eqz v4, :cond_48

    if-eqz v1, :cond_48

    :cond_3b
    iget-object v1, v3, Lre7;->t:Lcom/opera/android/downloads/DownloadItem;

    invoke-interface {v1}, Lcom/opera/android/downloads/DownloadItem;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lydn;->t(Ljava/lang/String;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    goto :goto_49

    :cond_48
    move v0, v2

    :goto_49
    if-eqz v0, :cond_55

    const v0, 0x7f0a0591

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    :cond_55
    new-instance v0, Ldf7;

    invoke-direct {v0, v3}, Ldf7;-><init>(Lre7;)V

    iget-object v1, p0, Lef7;->B:Lwjh;

    invoke-virtual {p0, v0, v1}, Liji;->r(Lfji;Lwjh;)V

    return-object p1
.end method

.method public final a0(ILkc0;)V
    .registers 9

    iget-object v0, p0, Lef7;->w:Lre7;

    invoke-virtual {v0}, Lre7;->h()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    const/16 v3, 0x9c4

    if-eqz v2, :cond_3c

    invoke-virtual {v1}, Ljava/io/File;->canWrite()Z

    move-result v2

    if-eqz v2, :cond_3c

    iget-object v2, p0, Lef7;->z:Lrf7;

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v0, v1}, Lrf7;->f(Lre7;Ljava/lang/String;)J

    move-result-wide v1

    iget-wide v4, v0, Lre7;->j:J

    cmp-long v1, v1, v4

    if-gez v1, :cond_30

    new-instance p1, Lglj;

    const p2, 0x7f140b49

    invoke-direct {p1, p2, v3}, Lglj;-><init>(II)V

    invoke-virtual {p0, p1}, Liji;->R(Lo93;)V

    return-void

    :cond_30
    invoke-virtual {v0, p1}, Lre7;->y(I)V

    invoke-virtual {v0}, Lre7;->b()V

    iput-object p2, p0, Lef7;->D:Lkc0;

    invoke-virtual {p0}, Ldej;->b()V

    return-void

    :cond_3c
    new-instance p1, Lglj;

    const p2, 0x7f1405c6

    invoke-direct {p1, p2, v3}, Lglj;-><init>(II)V

    invoke-virtual {p0, p1}, Liji;->R(Lo93;)V

    return-void
.end method

.method public final c(Lhjm;)V
    .registers 11

    iget-object v0, p0, Ldej;->b:Lmej;

    invoke-interface {v0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v1, v0, Ld6j;->c:Lx5f;

    iget-object v2, p0, Lef7;->D:Lkc0;

    iget-object v3, p0, Lef7;->E:Lmc0;

    iget-boolean v4, p0, Lef7;->F:Z

    iget-boolean v5, p0, Lef7;->I:Z

    iget-boolean v6, p0, Lef7;->H:Z

    iget-boolean v7, p0, Lef7;->G:Z

    iget-object v0, p0, Lef7;->w:Lre7;

    invoke-virtual {v0}, Lre7;->c()Lnc0;

    move-result-object v8

    invoke-virtual/range {v1 .. v8}, Lx5f;->N(Lkc0;Lmc0;ZZZZLnc0;)V

    invoke-super {p0, p1}, Liji;->c(Lhjm;)V

    return-void
.end method

.method public final g()V
    .registers 3

    iget-object v0, p0, Lef7;->w:Lre7;

    iget-boolean v1, v0, Lre7;->n:Z

    if-nez v1, :cond_b

    iget-object p0, p0, Lef7;->z:Lrf7;

    invoke-virtual {p0, v0}, Lrf7;->s(Lre7;)V

    :cond_b
    return-void
.end method

.method public final h(Landroid/net/Uri;Ljava/lang/String;)V
    .registers 4

    iget-object p0, p0, Lef7;->w:Lre7;

    iget-object v0, p0, Lre7;->d:Landroid/net/Uri;

    invoke-virtual {p1, v0}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_f

    iput-object p1, p0, Lre7;->d:Landroid/net/Uri;

    const/4 p1, 0x0

    iput-object p1, p0, Lre7;->e:Landroid/net/Uri;

    :cond_f
    invoke-virtual {p0, p2}, Lre7;->x(Ljava/lang/String;)V

    invoke-virtual {p0}, Lre7;->b()V

    return-void
.end method

.method public final j(Lwii;)V
    .registers 3

    iget-object v0, p0, Lef7;->z:Lrf7;

    iget-object p0, p0, Lef7;->y:Lre7;

    invoke-virtual {v0, p0, p1}, Lrf7;->c(Lre7;Lvwh;)V

    return-void
.end method

.method public final k(Lfji;Lvwh;)V
    .registers 3

    check-cast p1, Ldf7;

    iget-object p1, p1, Ldf7;->a:Lre7;

    const/4 p2, 0x0

    iget-object p0, p0, Lef7;->z:Lrf7;

    invoke-virtual {p0, p1, p2}, Lrf7;->c(Lre7;Lvwh;)V

    return-void
.end method

.method public final n(Ljava/lang/String;)J
    .registers 3

    iget-object v0, p0, Lef7;->z:Lrf7;

    iget-object p0, p0, Lef7;->w:Lre7;

    invoke-virtual {v0, p0, p1}, Lrf7;->f(Lre7;Ljava/lang/String;)J

    move-result-wide p0

    return-wide p0
.end method

.method public final o(Landroid/net/Uri;Ljava/lang/String;)Lfji;
    .registers 12

    iget-object v0, p0, Lef7;->z:Lrf7;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Ls29;->g(Landroid/net/Uri;)Z

    move-result v1

    iget-object v0, v0, Lrf7;->c:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    :cond_10
    const/4 v4, 0x0

    if-ge v3, v2, :cond_82

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v3, v3, 0x1

    check-cast v5, Lre7;

    iget-object v6, p0, Lef7;->w:Lre7;

    if-eq v5, v6, :cond_10

    invoke-virtual {v5}, Lre7;->q()Z

    move-result v7

    if-eqz v7, :cond_10

    iget-object v7, v5, Lre7;->t:Lcom/opera/android/downloads/DownloadItem;

    invoke-interface {v7}, Lcom/opera/android/downloads/DownloadItem;->getUrl()Ljava/lang/String;

    move-result-object v7

    iget-object v6, v6, Lre7;->t:Lcom/opera/android/downloads/DownloadItem;

    invoke-interface {v6}, Lcom/opera/android/downloads/DownloadItem;->getUrl()Ljava/lang/String;

    move-result-object v6

    invoke-static {v7, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_10

    invoke-virtual {v5}, Lre7;->f()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_10

    invoke-virtual {v5}, Lre7;->a()Z

    move-result v6

    if-eqz v6, :cond_10

    invoke-virtual {v5}, Lre7;->g()Landroid/net/Uri;

    move-result-object v6

    if-eqz v6, :cond_10

    const-string v7, "file"

    invoke-virtual {v6}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-ne v7, v1, :cond_10

    if-eqz v7, :cond_73

    new-instance v7, Ljava/io/File;

    invoke-virtual {v6}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v7, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v6

    invoke-static {v6}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v6

    invoke-virtual {p1, v6}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_10

    goto :goto_83

    :cond_73
    invoke-static {v6}, Landroid/provider/DocumentsContract;->getDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v7

    invoke-static {p1, v7}, Landroid/provider/DocumentsContract;->buildDocumentUriUsingTree(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_10

    goto :goto_83

    :cond_82
    move-object v5, v4

    :goto_83
    iput-object v5, p0, Lef7;->y:Lre7;

    if-nez v5, :cond_88

    return-object v4

    :cond_88
    new-instance p0, Ldf7;

    invoke-direct {p0, v5}, Ldf7;-><init>(Lre7;)V

    return-object p0
.end method

.method public final q(Landroid/net/Uri;)Lfji;
    .registers 4

    iget-object v0, p0, Lef7;->w:Lre7;

    iget-object p0, p0, Lef7;->z:Lrf7;

    iget-object v1, p0, Lrf7;->c:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    const/4 v1, 0x0

    if-gez v0, :cond_f

    move-object p0, v1

    goto :goto_15

    :cond_f
    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, p1, v0}, Lrf7;->e(Landroid/net/Uri;I)Lre7;

    move-result-object p0

    :goto_15
    if-nez p0, :cond_18

    return-object v1

    :cond_18
    new-instance p1, Ldf7;

    invoke-direct {p1, p0}, Ldf7;-><init>(Lre7;)V

    return-object p1
.end method

.method public final s(Lgg7;)V
    .registers 5

    iget-object v0, p0, Ldej;->b:Lmej;

    invoke-interface {v0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v0, v0, Ld6j;->c:Lx5f;

    new-instance v1, Liu2;

    const/16 v2, 0x1b

    invoke-direct {v1, p1, v2}, Liu2;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Liji;->c:Ldx3;

    invoke-static {p0, v0, v1}, Lcqp;->n0(Ldx3;Lx5f;Lcom/opera/api/Callback;)V

    return-void
.end method

.method public final u()V
    .registers 3

    iget-object v0, p0, Lef7;->z:Lrf7;

    iget-object v1, p0, Lef7;->C:Lag;

    invoke-virtual {v0, v1}, Lrf7;->u(Lqf7;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lef7;->C:Lag;

    return-void
.end method

.method public final v(Lwjh;)V
    .registers 4

    new-instance v0, Lag;

    const/4 v1, 0x1

    invoke-direct {v0, p1, v1}, Lag;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lef7;->C:Lag;

    iget-object p0, p0, Lef7;->z:Lrf7;

    invoke-virtual {p0, v0}, Lrf7;->b(Lqf7;)V

    return-void
.end method

.method public final w(Landroid/content/Context;Lwii;)V
    .registers 5

    iget-object v0, p0, Lef7;->y:Lre7;

    const/4 v1, 0x0

    iget-object p0, p0, Lef7;->z:Lrf7;

    invoke-virtual {p0, v0, p1, p2, v1}, Lrf7;->p(Lre7;Landroid/content/Context;Lvwh;Z)V

    return-void
.end method

.method public final y()V
    .registers 7

    new-instance v0, Lgld;

    invoke-direct {v0}, Lgld;-><init>()V

    const/16 v1, 0x1003

    invoke-static {v0, v1}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object v0

    iget-object v1, p0, Ldej;->b:Lmej;

    invoke-interface {v1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v0, v2}, Lzhj;->c(Landroid/content/Context;)V

    new-instance v0, Legd;

    iget-object v2, p0, Lef7;->w:Lre7;

    iget-object v3, v2, Lre7;->t:Lcom/opera/android/downloads/DownloadItem;

    invoke-interface {v3}, Lcom/opera/android/downloads/DownloadItem;->getUrl()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    iget-object v4, v2, Lre7;->m:Ljava/lang/String;

    iget-object v5, v2, Lre7;->a:Lxf7;

    invoke-virtual {v5}, Lxf7;->a()Z

    move-result v5

    if-eqz v5, :cond_2f

    iget v2, v2, Lre7;->b:I

    goto :goto_31

    :cond_2f
    const/high16 v2, -0x80000000

    :goto_31
    invoke-direct {v0, v3, v4, v2}, Legd;-><init>(Landroid/net/Uri;Ljava/lang/String;I)V

    invoke-interface {v1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->x()Ltjg;

    move-result-object v1

    filled-new-array {v0}, [Legd;

    move-result-object v0

    new-instance v2, Lkjg;

    const/4 v3, 0x2

    invoke-direct {v2, v1, v3}, Lkjg;-><init>(Ltjg;B)V

    invoke-virtual {v1, v0, v2}, Ltjg;->e([Legd;Lk37;)V

    sget-object v0, Lkc0;->g:Lkc0;

    iput-object v0, p0, Lef7;->D:Lkc0;

    invoke-virtual {p0}, Ldej;->b()V

    return-void
.end method

.method public final z()V
    .registers 2

    sget-object v0, Lkc0;->c:Lkc0;

    iput-object v0, p0, Lef7;->D:Lkc0;

    return-void
.end method
