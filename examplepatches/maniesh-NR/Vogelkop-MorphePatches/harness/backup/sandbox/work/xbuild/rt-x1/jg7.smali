.class public final Ljg7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final a:Lwg7;

.field public final b:Lrf7;

.field public final c:Ltzi;

.field public final d:Lzg7;

.field public final e:Lze7;

.field public final f:Lcom/opera/android/undo/UndoBar;

.field public final g:Lg1j;

.field public final h:Ljv0;

.field public final i:Lorm;

.field public final j:Lvwh;

.field public final k:Ljava/util/HashSet;


# direct methods
.method public constructor <init>(Lwg7;Ltzi;Lrf7;Lzg7;Lze7;Lcom/opera/android/undo/UndoBar;Lvwh;Lg1j;Ljv0;Lorm;)V
    .registers 12

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Ljg7;->k:Ljava/util/HashSet;

    iput-object p1, p0, Ljg7;->a:Lwg7;

    iput-object p2, p0, Ljg7;->c:Ltzi;

    iput-object p3, p0, Ljg7;->b:Lrf7;

    iput-object p4, p0, Ljg7;->d:Lzg7;

    iput-object p5, p0, Ljg7;->e:Lze7;

    iput-object p6, p0, Ljg7;->f:Lcom/opera/android/undo/UndoBar;

    iput-object p7, p0, Ljg7;->j:Lvwh;

    iput-object p8, p0, Ljg7;->g:Lg1j;

    iput-object p9, p0, Ljg7;->h:Ljv0;

    iput-object p10, p0, Ljg7;->i:Lorm;

    return-void
.end method

.method public static a(Lre7;)Lu92;
    .registers 7

    invoke-virtual {p0}, Lre7;->g()Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :cond_22

    invoke-virtual {p0}, Lre7;->f()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0}, Lrf7;->g(Lre7;)Lo29;

    move-result-object v2

    invoke-static {v1}, Ls29;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v3, p0, Lre7;->m:Ljava/lang/String;

    sget-object v4, Lu92;->e:Ljava/util/Set;

    iget-wide v4, p0, Lre7;->j:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    invoke-static {p0, v3, v2}, Lvtp;->a0(Ljava/lang/Long;Ljava/lang/String;Lo29;)Z

    move-result p0

    if-nez p0, :cond_24

    :cond_22
    const/4 p0, 0x0

    return-object p0

    :cond_24
    new-instance p0, Lu92;

    invoke-direct {p0, v0, v2, v3, v1}, Lu92;-><init>(Landroid/net/Uri;Lo29;Ljava/lang/String;Ljava/lang/String;)V

    return-object p0
.end method

.method public static b(Landroid/content/Context;Lre7;Ljava/lang/Runnable;Lue7;)V
    .registers 11

    iget-boolean v0, p1, Lre7;->A:Z

    if-eqz v0, :cond_5b

    invoke-static {p0}, Lq9n;->p(Landroid/content/Context;)Ldx3;

    move-result-object v2

    if-eqz v2, :cond_5b

    new-instance p0, Lrxh;

    const v0, 0x7f140609

    invoke-direct {p0, v0}, Lrxh;-><init>(I)V

    new-instance v1, Lws1;

    const/4 v6, 0x5

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v1 .. v6}, Lws1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    const-string p1, "com.opera.android.ui.DIALOG_QUEUE_SERVICE"

    invoke-virtual {v2, p1}, Ldx3;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lz77;

    new-instance p2, Lgkj;

    const/4 p3, 0x0

    invoke-direct {p2, p3, p3}, Lnz0;-><init>(ZZ)V

    const/4 p3, 0x0

    iput-object p3, p2, Lgkj;->a:Ljava/lang/String;

    iput-object p3, p2, Lgkj;->b:Ljava/lang/String;

    iput-object p3, p2, Lgkj;->c:Ljava/lang/String;

    iput-object p3, p2, Lgkj;->d:Ljava/lang/CharSequence;

    iput-object p3, p2, Lgkj;->e:Lekj;

    iput-object p3, p2, Lgkj;->f:Lfkj;

    iput-object p3, p2, Lgkj;->g:Lqp2;

    iput-object v1, p2, Lgkj;->h:Ldkj;

    iput-object p3, p2, Lgkj;->i:Ldkj;

    iput-object p3, p2, Lgkj;->j:Lql;

    const p3, 0x7f140608

    iput p3, p2, Lgkj;->k:I

    const p3, 0x7f1403bf

    iput p3, p2, Lgkj;->l:I

    const p3, 0x7f14060a

    iput p3, p2, Lgkj;->m:I

    const/4 p3, 0x1

    iput-boolean p3, p2, Lgkj;->n:Z

    iput-object p0, p2, Lgkj;->o:Lpxh;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {p1, p2, p0}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :cond_5b
    move-object v4, p2

    invoke-interface {v4}, Ljava/lang/Runnable;->run()V

    return-void
.end method


# virtual methods
.method public final c()Ljava/util/ArrayList;
    .registers 7

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Ljg7;->c:Ltzi;

    iget-object v2, v1, Ltzi;->a:Le5d;

    iget-object v2, v2, Le5d;->c:Ljava/lang/Object;

    check-cast v2, Ljava/util/LinkedHashSet;

    invoke-virtual {v2}, Ljava/util/AbstractCollection;->size()I

    move-result v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    iget-object v1, v1, Ltzi;->a:Le5d;

    iget-object v1, v1, Le5d;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/LinkedHashSet;

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1f
    :goto_1f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    iget-object v3, p0, Ljg7;->e:Lze7;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Lze7;->I(J)Lre7;

    move-result-object v2

    if-eqz v2, :cond_1f

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1f

    :cond_3b
    return-object v0
.end method

.method public final d(Landroid/view/MenuItem;)Z
    .registers 12

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0331

    iget-object v2, p0, Ljg7;->a:Lwg7;

    const/4 v3, 0x1

    if-ne v0, v1, :cond_2c

    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object v0

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_f8

    new-instance v0, Lxw;

    invoke-virtual {v2}, Lwg7;->L0()Lvvj;

    move-result-object v1

    new-instance v2, Lig7;

    invoke-direct {v2, p0}, Lig7;-><init>(Ljg7;)V

    invoke-direct {v0, v1, v2}, Lxw;-><init>(Lvvj;Lig7;)V

    invoke-virtual {v0, p1}, Lo73;->o(Landroid/view/View;)V

    return v3

    :cond_2c
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a032d

    iget-object v4, p0, Ljg7;->i:Lorm;

    const/4 v5, 0x0

    if-ne v0, v1, :cond_5b

    invoke-virtual {p0}, Ljg7;->c()Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_40
    if-ge v5, v0, :cond_57

    invoke-virtual {p1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v5, v5, 0x1

    check-cast v1, Lre7;

    invoke-virtual {v1}, Lre7;->c()Lnc0;

    move-result-object v1

    move-object v2, v4

    check-cast v2, Lx5f;

    sget-object v6, Loc0;->f:Loc0;

    invoke-virtual {v2, v6, v1}, Lx5f;->O(Loc0;Lnc0;)V

    goto :goto_40

    :cond_57
    invoke-virtual {p0, p1, v3}, Ljg7;->g(Ljava/util/List;Z)V

    return v3

    :cond_5b
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0330

    if-ne v0, v1, :cond_88

    invoke-virtual {p0}, Ljg7;->c()Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    move v1, v5

    :goto_6d
    if-ge v1, v0, :cond_84

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lre7;

    invoke-virtual {v2}, Lre7;->c()Lnc0;

    move-result-object v2

    move-object v6, v4

    check-cast v6, Lx5f;

    sget-object v7, Loc0;->d:Loc0;

    invoke-virtual {v6, v7, v2}, Lx5f;->O(Loc0;Lnc0;)V

    goto :goto_6d

    :cond_84
    invoke-virtual {p0, p1, v5}, Ljg7;->g(Ljava/util/List;Z)V

    return v3

    :cond_88
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const/4 v1, 0x2

    const v6, 0x7f0a032f

    if-eq v0, v6, :cond_fa

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v7, 0x7f0a032e

    if-eq v0, v7, :cond_fa

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x7f0a032c

    if-ne p1, v0, :cond_f9

    invoke-virtual {p0}, Ljg7;->c()Ljava/util/ArrayList;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    move-result-object p1

    new-instance v0, Lmn;

    const/4 v6, 0x3

    invoke-direct {v0, v6}, Lmn;-><init>(B)V

    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    move-result-object p1

    new-instance v0, Lnn;

    invoke-direct {v0, v1}, Lnn;-><init>(B)V

    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object p1

    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_f8

    invoke-virtual {p0}, Ljg7;->c()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    :goto_d7
    if-ge v5, v1, :cond_ee

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v5, v5, 0x1

    check-cast v6, Lre7;

    invoke-virtual {v6}, Lre7;->c()Lnc0;

    move-result-object v6

    move-object v7, v4

    check-cast v7, Lx5f;

    sget-object v8, Loc0;->m:Loc0;

    invoke-virtual {v7, v8, v6}, Lx5f;->O(Loc0;Lnc0;)V

    goto :goto_d7

    :cond_ee
    invoke-virtual {v2}, Lryl;->g0()V

    iget-object p0, p0, Ljg7;->h:Ljv0;

    sget-object v0, Lx92;->c:Lx92;

    invoke-interface {p0, p1, v0}, Ljv0;->j(Ljava/util/List;Lx92;)V

    :cond_f8
    return v3

    :cond_f9
    return v5

    :cond_fa
    invoke-virtual {p0}, Ljg7;->c()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    new-array v4, v4, [Legd;

    move v7, v5

    :goto_105
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-ge v7, v8, :cond_11b

    new-instance v8, Legd;

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lre7;

    invoke-direct {v8, v9}, Legd;-><init>(Lre7;)V

    aput-object v8, v4, v7

    add-int/lit8 v7, v7, 0x1

    goto :goto_105

    :cond_11b
    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->x()Ltjg;

    move-result-object v0

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    if-ne p1, v6, :cond_17a

    iget-object p1, v0, Ltjg;->i:Lujc;

    iget-object v1, p1, Lgk9;->b:Lgig;

    invoke-interface {v1}, Lgig;->getShuffleModeEnabled()Z

    move-result v1

    if-eqz v1, :cond_171

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    move v2, v5

    :goto_141
    invoke-virtual {p1}, Lgk9;->p()I

    move-result v6

    if-ge v2, v6, :cond_151

    invoke-virtual {p1, v2}, Lgk9;->Q(I)Lqjd;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_141

    :cond_151
    invoke-static {p1}, Lw7d;->C(Lgig;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {p1}, Lgk9;->getShuffleModeEnabled()Z

    move-result v6

    if-eqz v6, :cond_171

    new-instance v6, Levc;

    invoke-direct {v6, v1, v2}, Levc;-><init>(Ljava/util/List;Ljava/util/List;)V

    invoke-static {v6, v3}, Luup;->k(Lk1g;Z)Lj87;

    move-result-object v1

    new-instance v2, Lqie;

    const/16 v6, 0x8

    invoke-direct {v2, v0, v6}, Lqie;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Lj87;->a(Lsic;)V

    invoke-virtual {p1, v5}, Lgk9;->setShuffleModeEnabled(Z)V

    :cond_171
    new-instance p1, Lkjg;

    invoke-direct {p1, v0, v5}, Lkjg;-><init>(Ltjg;B)V

    invoke-virtual {v0, v4, p1}, Ltjg;->e([Legd;Lk37;)V

    goto :goto_182

    :cond_17a
    new-instance p1, Lkjg;

    invoke-direct {p1, v0, v1}, Lkjg;-><init>(Ltjg;B)V

    invoke-virtual {v0, v4, p1}, Ltjg;->e([Legd;Lk37;)V

    :goto_182
    iget-object p0, p0, Ljg7;->c:Ltzi;

    invoke-virtual {p0}, Ltzi;->d()V

    return v3
.end method

.method public final e(Lre7;Ljava/lang/String;)V
    .registers 10

    iget-object v0, p0, Ljg7;->b:Lrf7;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Lre7;->k()Z

    move-result v0

    iget-object v1, p0, Ljg7;->j:Lvwh;

    const/16 v2, 0x9c4

    const v3, 0x7f140778

    if-eqz v0, :cond_93

    if-eqz p2, :cond_93

    invoke-virtual {p1}, Lre7;->f()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1f

    return-void

    :cond_1f
    iget-object v0, p1, Lre7;->t:Lcom/opera/android/downloads/DownloadItem;

    :try_start_21
    invoke-virtual {p1}, Lre7;->e()Ldd7;

    move-result-object v4

    invoke-virtual {v4}, Ldd7;->i()Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v5}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v5

    const-string v6, "file"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_50

    invoke-virtual {v4, p2}, Ldd7;->k(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_8a

    invoke-virtual {p1, p2}, Lre7;->x(Ljava/lang/String;)V

    invoke-virtual {v4}, Ldd7;->i()Landroid/net/Uri;

    move-result-object p2

    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {v0, p2}, Lcom/opera/android/downloads/DownloadItem;->d(Ljava/lang/String;)V

    invoke-virtual {v4}, Ldd7;->i()Landroid/net/Uri;

    move-result-object p2

    iput-object p2, p1, Lre7;->e:Landroid/net/Uri;

    goto :goto_80

    :cond_50
    invoke-virtual {v4}, Ldd7;->i()Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v5}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v5

    const-string v6, "content"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8a

    iget-object v5, p1, Lre7;->a:Lxf7;

    iget-object v5, v5, Lxf7;->d:Lag7;

    iget-object v5, v5, Lag7;->b:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    invoke-virtual {v4}, Ldd7;->i()Landroid/net/Uri;

    move-result-object v4

    invoke-static {v5, v4, p2}, Landroid/provider/DocumentsContract;->renameDocument(Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    if-eqz v4, :cond_8a

    invoke-virtual {p1, p2}, Lre7;->x(Ljava/lang/String;)V

    invoke-virtual {v4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {v0, p2}, Lcom/opera/android/downloads/DownloadItem;->d(Ljava/lang/String;)V

    iput-object v4, p1, Lre7;->e:Landroid/net/Uri;
    :try_end_80
    .catch Ljava/lang/Exception; {:try_start_21 .. :try_end_80} :catch_8a

    :goto_80
    iget-object p0, p0, Ljg7;->d:Lzg7;

    iget-object p0, p0, Loy;->b:Ljava/lang/Object;

    check-cast p0, Lysi;

    invoke-interface {p0}, Lysi;->l()V

    return-void

    :catch_8a
    :cond_8a
    new-instance p0, Lglj;

    invoke-direct {p0, v3, v2}, Lglj;-><init>(II)V

    invoke-interface {v1, p0}, Lvwh;->f(Lo93;)V

    return-void

    :cond_93
    new-instance p0, Lglj;

    invoke-direct {p0, v3, v2}, Lglj;-><init>(II)V

    invoke-interface {v1, p0}, Lvwh;->f(Lo93;)V

    return-void
.end method

.method public final f(Landroid/net/Uri;Ljava/lang/String;)V
    .registers 7

    iget-object p0, p0, Ljg7;->a:Lwg7;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p0

    new-instance v0, Lghf;

    sget-object v1, Laik;->a:[Ljava/lang/String;

    if-nez p2, :cond_e

    const-string p2, ""

    :cond_e
    new-instance v1, Li4d;

    new-instance v2, Lvvf;

    const/16 v3, 0x13

    invoke-direct {v2, p1, p2, v3}, Lvvf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v1, v2}, Li4d;-><init>(Lkotlin/jvm/functions/Function1;)V

    invoke-direct {v0, v1}, Lghf;-><init>(Li4d;)V

    invoke-virtual {v0, p0}, Lghf;->I(Landroid/content/Context;)Ljjm;

    return-void
.end method

.method public final g(Ljava/util/List;Z)V
    .registers 5

    if-eqz p2, :cond_7

    iget-object v0, p0, Ljg7;->k:Ljava/util/HashSet;

    invoke-interface {v0, p1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    :cond_7
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lre7;

    invoke-virtual {v1}, Lre7;->s()V

    goto :goto_b

    :cond_1b
    if-eqz p2, :cond_21

    const p2, 0x7f120026

    goto :goto_24

    :cond_21
    const p2, 0x7f120027

    :goto_24
    iget-object p0, p0, Ljg7;->f:Lcom/opera/android/undo/UndoBar;

    invoke-virtual {p0, p2}, Lcom/opera/android/undo/UndoBar;->e(I)V

    iget-object p2, p0, Lcom/opera/android/undo/UndoBar;->c:Lmgh;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_32

    return-void

    :cond_32
    invoke-virtual {p2}, Lmgh;->f()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/opera/android/undo/UndoBar;->g:Z

    iget-object v0, p0, Lcom/opera/android/undo/UndoBar;->e:Lkkm;

    invoke-interface {v0, p1}, Lkkm;->N(Ljava/util/List;)Le5d;

    move-result-object p1

    iget-object v0, p1, Le5d;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_83

    iget-object p2, p2, Lmgh;->b:Ljava/lang/Object;

    check-cast p2, Lmhk;

    new-instance v1, Lmkm;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-direct {v1, p1, v0}, Lmkm;-><init>(Le5d;I)V

    iget p1, p2, Lmhk;->b:I

    add-int/2addr p1, v0

    iput p1, p2, Lmhk;->b:I

    iget-object p1, p2, Lmhk;->c:Ljava/lang/Object;

    check-cast p1, Ljava/util/LinkedList;

    invoke-virtual {p1, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lcom/opera/android/undo/UndoBar;->f()V

    iget-object p1, p0, Lcom/opera/android/undo/UndoBar;->b:Lami;

    iget-object p2, p1, Lami;->c:Ljava/lang/Object;

    check-cast p2, Lgtj;

    if-nez p2, :cond_79

    new-instance p2, Lqt;

    invoke-direct {p2, p1}, Lqt;-><init>(Lami;)V

    iget-object p1, p1, Lami;->b:Ljava/lang/Object;

    check-cast p1, Lvwh;

    invoke-interface {p1, p2}, Lvwh;->f(Lo93;)V

    goto :goto_83

    :cond_79
    invoke-virtual {p1, p2}, Lami;->A(Lgtj;)V

    iget-object p1, p1, Lami;->c:Ljava/lang/Object;

    check-cast p1, Lgtj;

    invoke-virtual {p1}, Lgtj;->j()V

    :cond_83
    :goto_83
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/opera/android/undo/UndoBar;->g:Z

    return-void
.end method

.method public final onClick(Landroid/view/View;)V
    .registers 10

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lre7;

    const/4 v1, 0x0

    if-eqz v0, :cond_11

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lre7;

    move-object v4, v0

    goto :goto_12

    :cond_11
    move-object v4, v1

    :goto_12
    iget-object v0, p0, Ljg7;->a:Lwg7;

    iget-object v0, v0, Lltl;->m:Lse;

    if-eqz v0, :cond_22

    iget-object p0, p0, Ljg7;->c:Ltzi;

    iget-object p0, p0, Ltzi;->a:Le5d;

    iget-wide v0, v4, Lre7;->o:J

    invoke-virtual {p0, v0, v1}, Le5d;->d(J)V

    return-void

    :cond_22
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v2, 0x7f0a0311

    const/4 v3, 0x2

    if-ne v0, v2, :cond_3e

    new-instance v0, Lnf7;

    new-instance v1, Lx77;

    invoke-direct {v1, p0, v4, p1, v3}, Lx77;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v2, p0, Ljg7;->g:Lg1j;

    iget-object p0, p0, Ljg7;->h:Ljv0;

    invoke-direct {v0, v4, v1, v2, p0}, Lnf7;-><init>(Lre7;Lx77;Lg1j;Ljv0;)V

    invoke-virtual {v0, p1}, Lo73;->p(Landroid/view/View;)V

    return-void

    :cond_3e
    if-eqz v4, :cond_ee

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    iget p1, v4, Lre7;->f:I

    invoke-static {p1}, Lvep;->A(I)I

    move-result p1

    if-eqz p1, :cond_eb

    const/4 v0, 0x1

    if-eq p1, v0, :cond_e7

    const/4 v6, 0x0

    if-eq p1, v3, :cond_72

    const/4 v0, 0x3

    if-ne p1, v0, :cond_ee

    invoke-virtual {v4}, Lre7;->c()Lnc0;

    move-result-object p1

    iget-object v0, p0, Ljg7;->i:Lorm;

    check-cast v0, Lx5f;

    sget-object v1, Loc0;->b:Loc0;

    invoke-virtual {v0, v1, p1}, Lx5f;->O(Loc0;Lnc0;)V

    new-instance v2, Lgg7;

    const/4 v7, 0x0

    move-object v3, p0

    invoke-direct/range {v2 .. v7}, Lgg7;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ZB)V

    new-instance p0, Lhg7;

    invoke-direct {p0, v3, v5, v6}, Lhg7;-><init>(Ljava/lang/Object;Ljava/lang/Object;Z)V

    invoke-static {v5, v4, v2, p0}, Ljg7;->b(Landroid/content/Context;Lre7;Ljava/lang/Runnable;Lue7;)V

    return-void

    :cond_72
    invoke-virtual {v4}, Lre7;->C()Z

    move-result p0

    if-eqz p0, :cond_e3

    const p0, 0x7f1405a7

    invoke-virtual {v5, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    const p1, 0x7f1405a8

    invoke-virtual {v5, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, "\n\n"

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Lqxh;

    invoke-direct {p1, p0}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    new-instance p0, Luk6;

    const/16 v2, 0xe

    invoke-direct {p0, v4, v2}, Luk6;-><init>(Ljava/lang/Object;B)V

    const-string v2, "com.opera.android.ui.DIALOG_QUEUE_SERVICE"

    invoke-virtual {v5, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lz77;

    new-instance v3, Lgkj;

    invoke-direct {v3, v6, v6}, Lnz0;-><init>(ZZ)V

    iput-object v1, v3, Lgkj;->a:Ljava/lang/String;

    iput-object v1, v3, Lgkj;->b:Ljava/lang/String;

    iput-object v1, v3, Lgkj;->c:Ljava/lang/String;

    iput-object v1, v3, Lgkj;->d:Ljava/lang/CharSequence;

    iput-object v1, v3, Lgkj;->e:Lekj;

    iput-object v1, v3, Lgkj;->f:Lfkj;

    iput-object v1, v3, Lgkj;->g:Lqp2;

    iput-object p0, v3, Lgkj;->h:Ldkj;

    iput-object v1, v3, Lgkj;->i:Ldkj;

    iput-object v1, v3, Lgkj;->j:Lql;

    const p0, 0x7f140ebc

    iput p0, v3, Lgkj;->k:I

    const p0, 0x7f1403bf

    iput p0, v3, Lgkj;->l:I

    const p0, 0x7f1405ad

    iput p0, v3, Lgkj;->m:I

    iput-boolean v0, v3, Lgkj;->n:Z

    iput-object p1, v3, Lgkj;->o:Lpxh;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {v2, v3, p0}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :cond_e3
    invoke-virtual {v4}, Lre7;->u()V

    return-void

    :cond_e7
    invoke-virtual {v4}, Lre7;->u()V

    return-void

    :cond_eb
    invoke-virtual {v4}, Lre7;->s()V

    :cond_ee
    return-void
.end method

.method public final onLongClick(Landroid/view/View;)Z
    .registers 4

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lre7;

    if-eqz v0, :cond_f

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lre7;

    goto :goto_10

    :cond_f
    const/4 p1, 0x0

    :goto_10
    if-eqz p1, :cond_1d

    iget-object p0, p0, Ljg7;->c:Ltzi;

    iget-object p0, p0, Ltzi;->a:Le5d;

    iget-wide v0, p1, Lre7;->o:J

    invoke-virtual {p0, v0, v1}, Le5d;->d(J)V

    const/4 p0, 0x1

    return p0

    :cond_1d
    const/4 p0, 0x0

    return p0
.end method
