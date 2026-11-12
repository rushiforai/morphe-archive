.class public final Lcom/opera/android/PushedContentHandler;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/opera/android/PushedContentHandler$Request;
    }
.end annotation


# static fields
.field public static p:Lcom/opera/android/PushedContentHandler;


# instance fields
.field public a:Z

.field public b:Z

.field public c:Z

.field public final d:Landroid/util/SparseArray;

.field public final e:Lb59;

.field public final f:Landroid/content/Context;

.field public final g:Lumi;

.field public final h:Lcom/opera/android/settings/SettingsManager;

.field public final i:Lvwn;

.field public final j:Lx5f;

.field public final k:Lx5f;

.field public final l:Llpe;

.field public m:Ljava/util/ArrayList;

.field public n:Livg;

.field public o:Lcom/opera/android/PushedContentHandler$Request;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;Lcom/opera/android/settings/SettingsManager;Lvwn;Llpe;Lx5f;Lx5f;)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/opera/android/PushedContentHandler;->d:Landroid/util/SparseArray;

    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/opera/android/PushedContentHandler;->m:Ljava/util/ArrayList;

    const/4 v0, 0x0

    new-array v0, v0, [Lbg1;

    const-string v1, "pushed-content-versions"

    invoke-static {p1, p2, v1, v0}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/PushedContentHandler;->e:Lb59;

    iput-object p1, p0, Lcom/opera/android/PushedContentHandler;->f:Landroid/content/Context;

    iput-object p2, p0, Lcom/opera/android/PushedContentHandler;->g:Lumi;

    iput-object p3, p0, Lcom/opera/android/PushedContentHandler;->h:Lcom/opera/android/settings/SettingsManager;

    iput-object p4, p0, Lcom/opera/android/PushedContentHandler;->i:Lvwn;

    iput-object p5, p0, Lcom/opera/android/PushedContentHandler;->l:Llpe;

    iput-object p6, p0, Lcom/opera/android/PushedContentHandler;->j:Lx5f;

    iput-object p7, p0, Lcom/opera/android/PushedContentHandler;->k:Lx5f;

    sput-object p0, Lcom/opera/android/PushedContentHandler;->p:Lcom/opera/android/PushedContentHandler;

    return-void
.end method

.method public static nativeChannelUpdate(II[B)V
    .registers 10
    .param p2    # [B
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    sget-object v0, Lcom/opera/android/PushedContentHandler;->p:Lcom/opera/android/PushedContentHandler;

    const/4 v1, 0x0

    if-nez v0, :cond_b

    const-string p0, "PushedContentHandler called by native before it was instantiated"

    invoke-static {p0, v1}, Lks3;->B(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_b
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sget-object v0, Lcom/opera/android/PushedContentHandler;->p:Lcom/opera/android/PushedContentHandler;

    iget-object v0, v0, Lcom/opera/android/PushedContentHandler;->e:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v4, "last-data"

    invoke-interface {v0, v4, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v4, "last-success"

    invoke-interface {v0, v4, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    sget-object v0, Lcom/opera/android/PushedContentHandler;->p:Lcom/opera/android/PushedContentHandler;

    iget-object v0, v0, Lcom/opera/android/PushedContentHandler;->d:Landroid/util/SparseArray;

    invoke-virtual {v0, p0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmch;

    if-eqz v0, :cond_6a

    invoke-interface {v0}, Lmch;->c()Lsa2;

    move-result-object v2

    const/4 v3, 0x0

    if-eqz v2, :cond_42

    iget v2, v2, Lsa2;->b:I

    goto :goto_54

    :cond_42
    sget-object v2, Lcom/opera/android/PushedContentHandler;->p:Lcom/opera/android/PushedContentHandler;

    iget-object v2, v2, Lcom/opera/android/PushedContentHandler;->e:Lb59;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    :goto_54
    if-eq p1, v2, :cond_6a

    invoke-static {}, Lio7;->values()[Lio7;

    move-result-object v2

    array-length v4, v2

    :goto_5b
    if-ge v3, v4, :cond_68

    aget-object v5, v2, v3

    iget-byte v6, v5, Lio7;->a:B

    if-ne v6, p0, :cond_65

    move-object v1, v5

    goto :goto_68

    :cond_65
    add-int/lit8 v3, v3, 0x1

    goto :goto_5b

    :cond_68
    :goto_68
    if-nez v1, :cond_6b

    :cond_6a
    return-void

    :cond_6b
    new-instance v2, Lnch;

    invoke-direct {v2, p2}, Lnch;-><init>([B)V

    new-instance p2, Ljch;

    invoke-direct {p2, p0, p1}, Ljch;-><init>(II)V

    invoke-interface {v0, v1, p1, v2, p2}, Lmch;->a(Lio7;ILnch;Ljch;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 4

    iget-object v0, p0, Lcom/opera/android/PushedContentHandler;->n:Livg;

    if-nez v0, :cond_3a

    const-class v0, Lio7;

    invoke-static {v0}, Ljava/util/EnumSet;->allOf(Ljava/lang/Class;)Ljava/util/EnumSet;

    move-result-object v0

    new-instance v1, Lnn;

    const/16 v2, 0xb

    invoke-direct {v1, v2}, Lnn;-><init>(B)V

    invoke-interface {v0, v1}, Ljava/util/Collection;->removeIf(Ljava/util/function/Predicate;)Z

    iget-object v1, p0, Lcom/opera/android/PushedContentHandler;->f:Landroid/content/Context;

    invoke-static {v1}, Ls6e;->b(Landroid/content/Context;)Ls6e;

    move-result-object v1

    iget-object v2, v1, Ls6e;->b:Lvq8;

    if-eqz v2, :cond_23

    iget-object v1, v2, Lvq8;->h:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    goto :goto_25

    :cond_23
    iget-object v1, v1, Ls6e;->c:Ljava/lang/String;

    :goto_25
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_30

    sget-object v1, Lio7;->e:Lio7;

    invoke-virtual {v0, v1}, Ljava/util/AbstractCollection;->remove(Ljava/lang/Object;)Z

    :cond_30
    new-instance v1, Livg;

    iget-object v2, p0, Lcom/opera/android/PushedContentHandler;->d:Landroid/util/SparseArray;

    invoke-direct {v1, v0, v2}, Livg;-><init>(Ljava/util/EnumSet;Landroid/util/SparseArray;)V

    iput-object v1, p0, Lcom/opera/android/PushedContentHandler;->n:Livg;

    move-object v0, v1

    :cond_3a
    new-instance v1, Lich;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lich;-><init>(Lcom/opera/android/PushedContentHandler;B)V

    iget-object p0, v0, Livg;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/EnumSet;

    invoke-virtual {p0}, Ljava/util/AbstractCollection;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_4e

    invoke-virtual {v1}, Lich;->run()V

    return-void

    :cond_4e
    iget-object p0, v0, Livg;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final b(ZLlch;)V
    .registers 8

    if-eqz p2, :cond_7

    iget-object v0, p0, Lcom/opera/android/PushedContentHandler;->m:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_7
    iget-boolean p2, p0, Lcom/opera/android/PushedContentHandler;->a:Z

    if-eqz p2, :cond_e

    if-nez p1, :cond_e

    return-void

    :cond_e
    const/4 p2, 0x1

    iput-boolean p2, p0, Lcom/opera/android/PushedContentHandler;->a:Z

    if-eqz p1, :cond_45

    iget-object p1, p0, Lcom/opera/android/PushedContentHandler;->o:Lcom/opera/android/PushedContentHandler$Request;

    const/4 p2, 0x0

    if-eqz p1, :cond_2f

    iget-wide v0, p1, Lcom/opera/android/PushedContentHandler$Request;->d:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_25

    invoke-static {v0, v1}, LJ/N;->MBqsUtXh(J)V

    iput-wide v2, p1, Lcom/opera/android/PushedContentHandler$Request;->d:J

    :cond_25
    iget-object v0, p1, Lcom/opera/android/PushedContentHandler$Request;->b:Loml;

    if-eqz v0, :cond_2f

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Loml;->cancel(Z)Z

    iput-object p2, p1, Lcom/opera/android/PushedContentHandler$Request;->b:Loml;

    :cond_2f
    iget-object p1, p0, Lcom/opera/android/PushedContentHandler;->l:Llpe;

    iget-object p1, p1, Llpe;->B:Lks3;

    iget-object v0, p1, Lks3;->i:Ljava/lang/Object;

    check-cast v0, Ld3k;

    if-eqz v0, :cond_3c

    invoke-virtual {v0, p2}, Lxob;->k(Ljava/util/concurrent/CancellationException;)V

    :cond_3c
    iput-object p2, p1, Lks3;->i:Ljava/lang/Object;

    iget-object p1, p1, Lks3;->h:Ljava/lang/Object;

    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    :cond_45
    iget-object p1, p0, Lcom/opera/android/PushedContentHandler;->e:Lb59;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/SharedPreferences;

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string p2, "timer"

    invoke-interface {p1, p2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {p0}, Lcom/opera/android/PushedContentHandler;->a()V

    return-void
.end method

.method public final c(Lio7;Lmch;)I
    .registers 4

    invoke-interface {p2, p0}, Lmch;->e(Lcom/opera/android/PushedContentHandler;)V

    invoke-interface {p2}, Lmch;->c()Lsa2;

    move-result-object p2

    if-eqz p2, :cond_c

    iget p0, p2, Lsa2;->b:I

    goto :goto_1f

    :cond_c
    iget-byte p2, p1, Lio7;->a:B

    iget-object p0, p0, Lcom/opera/android/PushedContentHandler;->e:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    const/4 v0, 0x0

    invoke-interface {p0, p2, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    :goto_1f
    iget-byte p1, p1, Lio7;->a:B

    invoke-static {p1, p0}, LJ/N;->MHNIDaRM(II)V

    return p0
.end method

.method public final d(ZZ)V
    .registers 10

    iget-boolean v0, p0, Lcom/opera/android/PushedContentHandler;->a:Z

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_24

    iput-boolean v2, p0, Lcom/opera/android/PushedContentHandler;->a:Z

    iget-object v0, p0, Lcom/opera/android/PushedContentHandler;->m:Ljava/util/ArrayList;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v3, p0, Lcom/opera/android/PushedContentHandler;->m:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    move v4, v2

    :goto_16
    if-ge v4, v3, :cond_24

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Llch;

    invoke-interface {v5, p1}, Llch;->m(Z)V

    goto :goto_16

    :cond_24
    iget-object p0, p0, Lcom/opera/android/PushedContentHandler;->i:Lvwn;

    if-nez p1, :cond_2d

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto/16 :goto_a4

    :cond_2d
    invoke-virtual {p0}, Lvwn;->a()Z

    move-result v0

    if-eqz v0, :cond_a4

    iget-object v0, p0, Lvwn;->b:Landroid/content/Context;

    sget-object v3, Lio7;->j:Lio7;

    sget-object v4, Lrwn;->k:Lioj;

    invoke-static {v0, v3, v4}, Lno7;->n(Landroid/content/Context;Lio7;Llo7;)Lno7;

    move-result-object v3

    check-cast v3, Lrwn;

    invoke-virtual {v3}, Lno7;->i()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lqwn;

    sget-object v4, Lpyn;->a:Ljava/util/HashSet;

    invoke-static {}, Landroid/webkit/WebView;->getCurrentWebViewPackage()Landroid/content/pm/PackageInfo;

    move-result-object v4

    if-eqz v4, :cond_52

    invoke-static {v4, v3}, Lvwn;->b(Landroid/content/pm/PackageInfo;Lqwn;)Z

    move-result v1

    goto :goto_79

    :cond_52
    const-string v4, "com.android.chrome"

    const-wide/16 v5, 0x0

    invoke-static {v0, v4, v5, v6}, Lr9n;->u(Landroid/content/Context;Ljava/lang/String;J)Landroid/content/pm/PackageInfo;

    move-result-object v4

    invoke-static {v4, v3}, Lvwn;->b(Landroid/content/pm/PackageInfo;Lqwn;)Z

    move-result v4

    if-nez v4, :cond_79

    const-string v4, "com.google.android.webview"

    invoke-static {v0, v4, v5, v6}, Lr9n;->u(Landroid/content/Context;Ljava/lang/String;J)Landroid/content/pm/PackageInfo;

    move-result-object v4

    invoke-static {v4, v3}, Lvwn;->b(Landroid/content/pm/PackageInfo;Lqwn;)Z

    move-result v4

    if-nez v4, :cond_79

    const-string v4, "com.android.webview"

    invoke-static {v0, v4, v5, v6}, Lr9n;->u(Landroid/content/Context;Ljava/lang/String;J)Landroid/content/pm/PackageInfo;

    move-result-object v0

    invoke-static {v0, v3}, Lvwn;->b(Landroid/content/pm/PackageInfo;Lqwn;)Z

    move-result v0

    if-nez v0, :cond_79

    move v1, v2

    :cond_79
    :goto_79
    iget-object v0, p0, Lvwn;->a:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v2, "wv.crash.count"

    invoke-static {}, Ltz5;->a()I

    move-result v3

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    if-eqz v1, :cond_97

    sget-object v1, Lyu0;->c:Lyu0;

    invoke-virtual {p0, v1}, Lvwn;->c(Lyu0;)V

    goto :goto_a1

    :cond_97
    const-string v1, "wv.disabled"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    sget-object v1, Lyu0;->d:Lyu0;

    invoke-virtual {p0, v1}, Lvwn;->c(Lyu0;)V

    :goto_a1
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_a4
    :goto_a4
    if-eqz p1, :cond_ac

    if-eqz p2, :cond_ac

    const/4 p0, 0x4

    invoke-static {p0}, Lcak;->a(I)V

    :cond_ac
    return-void
.end method

.method public final e(JZ)V
    .registers 15

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/opera/android/PushedContentHandler;->o:Lcom/opera/android/PushedContentHandler$Request;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    if-eqz p3, :cond_d

    const-wide/32 v2, 0x1499700

    goto :goto_10

    :cond_d
    const-wide/32 v2, 0x493e0

    :goto_10
    add-long/2addr v0, v2

    iget-object v2, p0, Lcom/opera/android/PushedContentHandler;->e:Lb59;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/SharedPreferences;

    const-wide/16 v4, 0x0

    const-string v6, "timer"

    invoke-interface {v3, v6, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    cmp-long v4, v0, v4

    if-lez v4, :cond_30

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3, v6, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_30
    iget-object v0, p0, Lcom/opera/android/PushedContentHandler;->j:Lx5f;

    iget-boolean v1, v0, Lx5f;->h:Z

    const/4 v3, 0x2

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v1, :cond_a0

    iget-object v1, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v6

    new-instance v7, Llp0;

    const/4 v8, -0x1

    const/4 v9, 0x3

    const/16 v10, 0x98b

    invoke-direct {v7, v10, v8, v9}, Ljf0;-><init>(III)V

    invoke-virtual {v7, v5, v4, p3}, Ljf0;->r(IIZ)V

    invoke-virtual {v7, v3, v4, p1, p2}, Ljf0;->p(IIJ)V

    if-nez p3, :cond_5c

    iget-object p1, v0, Lx5f;->c:Landroid/content/Context;

    invoke-static {}, Lzpa;->D()Lbj0;

    move-result-object p2

    invoke-static {p1, p2}, Lui6;->u(Landroid/content/Context;Lbj0;)Lbj0;

    invoke-virtual {v7, v4, v4, p2}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_5c
    invoke-virtual {v6, v1}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object p1

    const/16 p2, 0x19

    invoke-virtual {p1, p2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkp0;

    if-nez v1, :cond_79

    new-instance v1, Lkp0;

    invoke-direct {v1, v10, v4, v4}, Ljf0;-><init>(III)V

    invoke-virtual {p1, p2, v4, v1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p1, p2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p1

    move-object v1, p1

    check-cast v1, Lkp0;

    :cond_79
    invoke-virtual {v1, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    if-eqz p1, :cond_8d

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_8d

    new-instance p2, Lhf0;

    invoke-direct {p2, v1, v5, p1}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_9a

    :cond_8d
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v1, v5, v4, p1}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance p2, Lhf0;

    invoke-direct {p2, v1, v5, p1}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_9a
    invoke-virtual {p2, v7}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0, v6}, Lx5f;->U0(Lx56;)V

    :cond_a0
    invoke-virtual {v0, v3, p3}, Lx5f;->K0(IZ)V

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/SharedPreferences;

    const-string p2, "version"

    invoke-interface {p1, p2}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v0

    xor-int/2addr v0, v4

    if-eqz p3, :cond_ed

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1, p2, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string p2, "last-success"

    invoke-static {p1, p2}, Lam2;->x(Landroid/content/SharedPreferences$Editor;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/opera/android/PushedContentHandler;->h:Lcom/opera/android/settings/SettingsManager;

    const-string p2, "news_is_blocked_by_personalization_change"

    invoke-virtual {p1, v5, p2}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    :goto_c6
    iget-object p1, p0, Lcom/opera/android/PushedContentHandler;->d:Landroid/util/SparseArray;

    invoke-virtual {p1}, Landroid/util/SparseArray;->size()I

    move-result p2

    if-ge v5, p2, :cond_da

    invoke-virtual {p1, v5}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lmch;

    invoke-interface {p1}, Lmch;->f()V

    add-int/lit8 v5, v5, 0x1

    goto :goto_c6

    :cond_da
    new-instance p1, Lgh2;

    const/16 p2, 0x8

    invoke-direct {p1, p2, p0, v0}, Lgh2;-><init>(BLjava/lang/Object;Z)V

    new-instance p2, Lvvf;

    const/4 p3, 0x5

    invoke-direct {p2, p0, p1, p3}, Lvvf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, p0, Lcom/opera/android/PushedContentHandler;->l:Llpe;

    invoke-virtual {p0, p2}, Llpe;->a(Lkotlin/jvm/functions/Function1;)V

    return-void

    :cond_ed
    invoke-virtual {p0, v5, v0}, Lcom/opera/android/PushedContentHandler;->d(ZZ)V

    return-void
.end method

.method public final f(Lio7;Lmch;)V
    .registers 6

    iget-object v0, p0, Lcom/opera/android/PushedContentHandler;->d:Landroid/util/SparseArray;

    iget-byte v1, p1, Lio7;->a:B

    invoke-virtual {v0, v1, p2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    iget-object v0, p0, Lcom/opera/android/PushedContentHandler;->n:Livg;

    if-eqz v0, :cond_1f

    iget-object v1, v0, Livg;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/EnumSet;

    invoke-virtual {v1, p1}, Ljava/util/AbstractCollection;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1f

    new-instance v1, Lq2g;

    const/16 v2, 0x11

    invoke-direct {v1, v0, p1, v2}, Lq2g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {p2, v1}, Lmch;->b(Ljava/lang/Runnable;)V

    :cond_1f
    iget-boolean v0, p0, Lcom/opera/android/PushedContentHandler;->b:Z

    if-eqz v0, :cond_2b

    invoke-virtual {p0, p1, p2}, Lcom/opera/android/PushedContentHandler;->c(Lio7;Lmch;)I

    const/4 p1, 0x1

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Lcom/opera/android/PushedContentHandler;->b(ZLlch;)V

    :cond_2b
    return-void
.end method

.method public final g(Lio7;)V
    .registers 4

    iget-object v0, p0, Lcom/opera/android/PushedContentHandler;->e:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-byte p1, p1, Lio7;->a:B

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-boolean p0, p0, Lcom/opera/android/PushedContentHandler;->b:Z

    if-eqz p0, :cond_21

    const/4 p0, 0x0

    invoke-static {p1, p0}, LJ/N;->MHNIDaRM(II)V

    :cond_21
    return-void
.end method
