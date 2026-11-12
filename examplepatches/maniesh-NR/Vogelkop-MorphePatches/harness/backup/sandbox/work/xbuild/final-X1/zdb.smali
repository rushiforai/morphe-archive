.class public final Lzdb;
.super Lorg/chromium/components/navigation_interception/InterceptNavigationDelegate;
.source "SourceFile"


# instance fields
.field public final b:Laeb;

.field public c:Lorg/chromium/content_public/browser/WebContents;

.field public d:Lbpd;

.field public e:Lf53;

.field public f:Z

.field public g:Z

.field public h:Lig;

.field public i:Ld23;

.field public final j:Z

.field public k:Z

.field public final synthetic l:Laeb;


# direct methods
.method public constructor <init>(Laeb;Laeb;)V
    .registers 3

    iput-object p1, p0, Lzdb;->l:Laeb;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lzdb;->b:Laeb;

    invoke-virtual {p2}, Laeb;->b()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p1

    invoke-virtual {p0, p1}, Lzdb;->b(Lorg/chromium/content_public/browser/WebContents;)V

    iget-object p1, p2, Laeb;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p1}, Lcom/opera/android/browser/WebContentsWrapper;->c()Ldx3;

    move-result-object p1

    if-eqz p1, :cond_18

    const/4 p1, 0x1

    goto :goto_19

    :cond_18
    const/4 p1, 0x0

    :goto_19
    iput-boolean p1, p0, Lzdb;->j:Z

    return-void
.end method


# virtual methods
.method public final a(Lorg/chromium/content_public/browser/NavigationHandle;Lorg/chromium/url/GURL;ZZZZLd23;)V
    .registers 25

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v7, p7

    iget-wide v3, v1, Lorg/chromium/content_public/browser/NavigationHandle;->s:J

    move-object/from16 v0, p0

    iget-object v5, v0, Lzdb;->l:Laeb;

    iget-object v6, v5, Laeb;->h:Ljava/lang/String;

    iget-object v8, v5, Laeb;->c:Lcom/opera/android/Lazy;

    iget-object v9, v5, Laeb;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    const/4 v10, 0x0

    if-eqz v6, :cond_1d

    iget-wide v11, v5, Laeb;->i:J

    cmp-long v6, v11, v3

    if-eqz v6, :cond_1d

    iput-object v10, v5, Laeb;->h:Ljava/lang/String;

    :cond_1d
    invoke-virtual {v8}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lvo7;

    iget-object v11, v6, Lvo7;->i:Ljava/lang/Long;

    const/4 v12, 0x0

    if-eqz v11, :cond_30

    invoke-virtual {v11}, Ljava/lang/Long;->longValue()J

    move-result-wide v13

    cmp-long v3, v13, v3

    if-eqz v3, :cond_3f

    :cond_30
    iget-object v3, v6, Lvo7;->h:Luo7;

    if-eqz v3, :cond_3f

    iput-object v10, v6, Lvo7;->h:Luo7;

    iput-object v10, v6, Lvo7;->i:Ljava/lang/Long;

    iget-object v3, v3, Luo7;->b:Lqo7;

    iget-object v4, v6, Lvo7;->d:Lyqa;

    invoke-virtual {v4, v3, v12}, Lyqa;->i(Lqo7;Z)V

    :cond_3f
    iget-object v3, v5, Laeb;->d:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_45
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_61

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lshj;

    move/from16 v6, p3

    move/from16 v11, p4

    invoke-interface {v4, v1, v2, v6, v11}, Lshj;->b(Lorg/chromium/content_public/browser/NavigationHandle;Lorg/chromium/url/GURL;ZZ)Z

    move-result v4

    if-eqz v4, :cond_45

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v7, v0}, Ld23;->onResult(Ljava/lang/Object;)V

    return-void

    :cond_61
    move/from16 v11, p4

    invoke-virtual {v2}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lwqm;->s(Ljava/lang/String;)Z

    move-result v3

    const/4 v4, 0x1

    if-nez v3, :cond_31a

    invoke-virtual {v2}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lwqm;->u(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_31a

    sget-object v3, Lvqm;->a:Ljava/util/ArrayList;

    invoke-virtual {v2}, Lorg/chromium/url/GURL;->f()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lvqm;->c(Ljava/lang/String;)Z

    move-result v3

    const-string v13, "android.intent.category.BROWSABLE"

    const-string v14, "android.intent.action.VIEW"

    const/4 v15, 0x2

    if-eqz v3, :cond_f6

    const-string v3, "www.opera.com"

    invoke-virtual {v2}, Lorg/chromium/url/GURL;->c()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_f6

    invoke-virtual {v2}, Lorg/chromium/url/GURL;->e()Ljava/lang/String;

    move-result-object v3

    move v10, v12

    :goto_9a
    sget-object v16, Lwqm;->a:[Ljava/lang/String;

    if-ge v10, v15, :cond_f6

    aget-object v15, v16, v10

    invoke-virtual {v15, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_f2

    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3, v14}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v10

    invoke-virtual {v3, v10}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const/high16 v10, 0x14000000

    invoke-virtual {v3, v10}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    invoke-virtual {v3, v13}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    const-string v10, "com.opera.browser"

    invoke-virtual {v3, v10}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    sget-object v15, Lmdb;->a:Ljava/util/HashSet;

    const-string v15, "externally_handled"

    invoke-virtual {v3, v15, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-virtual {v9}, Lcom/opera/android/browser/WebContentsWrapper;->c()Ldx3;

    move-result-object v15

    const/16 v12, 0x40

    invoke-static {v12, v3}, Lqvf;->b(ILandroid/content/Intent;)Landroid/content/pm/ResolveInfo;

    move-result-object v12

    if-eqz v12, :cond_f6

    iget-object v12, v12, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    if-eqz v12, :cond_f6

    iget-object v12, v12, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v10, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_f6

    invoke-virtual {v15, v3}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    invoke-static {v1}, Lx1p;->C(Lorg/chromium/content_public/browser/NavigationHandle;)Z

    move-result v0

    invoke-static {v9, v0}, Lx1p;->Y(Lcom/opera/android/browser/chromium/ChromiumContent;Z)V

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v7, v0}, Ld23;->onResult(Ljava/lang/Object;)V

    return-void

    :cond_f2
    add-int/lit8 v10, v10, 0x1

    const/4 v15, 0x2

    goto :goto_9a

    :cond_f6
    invoke-virtual {v8}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lvo7;

    invoke-virtual {v3, v2, v4}, Lvo7;->a(Lorg/chromium/url/GURL;Z)Luo7;

    move-result-object v3

    if-eqz v3, :cond_159

    iget-object v10, v3, Luo7;->b:Lqo7;

    iget-boolean v12, v3, Luo7;->c:Z

    if-nez v12, :cond_11d

    invoke-virtual {v8}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lvo7;

    iget-object v0, v0, Lvo7;->d:Lyqa;

    const/4 v2, 0x0

    invoke-virtual {v0, v10, v2}, Lyqa;->i(Lqo7;Z)V

    invoke-virtual {v5, v1}, Laeb;->c(Lorg/chromium/content_public/browser/NavigationHandle;)V

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v7, v0}, Ld23;->onResult(Ljava/lang/Object;)V

    return-void

    :cond_11d
    iget-object v12, v3, Luo7;->d:Lkag;

    invoke-virtual {v12}, Ljava/lang/Enum;->ordinal()I

    move-result v12

    if-eqz v12, :cond_13f

    if-eq v12, v4, :cond_12a

    const/4 v3, 0x2

    if-ne v12, v3, :cond_159

    :cond_12a
    invoke-virtual {v8}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lvo7;

    iget-object v0, v0, Lvo7;->d:Lyqa;

    const/4 v2, 0x0

    invoke-virtual {v0, v10, v2}, Lyqa;->i(Lqo7;Z)V

    invoke-virtual {v5, v1}, Laeb;->c(Lorg/chromium/content_public/browser/NavigationHandle;)V

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v7, v0}, Ld23;->onResult(Ljava/lang/Object;)V

    return-void

    :cond_13f
    iget-wide v4, v1, Lorg/chromium/content_public/browser/NavigationHandle;->s:J

    invoke-virtual {v8}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lvo7;

    iput-object v3, v8, Lvo7;->h:Luo7;

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    iput-object v3, v8, Lvo7;->i:Ljava/lang/Long;

    const/4 v6, 0x1

    move/from16 v3, p3

    move/from16 v5, p5

    move v4, v11

    invoke-virtual/range {v0 .. v7}, Lzdb;->k(Lorg/chromium/content_public/browser/NavigationHandle;Lorg/chromium/url/GURL;ZZZZLd23;)V

    return-void

    :cond_159
    iget v0, v1, Lorg/chromium/content_public/browser/NavigationHandle;->d:I

    and-int/lit16 v0, v0, 0xff

    if-ne v0, v4, :cond_161

    move v2, v4

    goto :goto_162

    :cond_161
    const/4 v2, 0x0

    :goto_162
    if-eqz v2, :cond_173

    invoke-static/range {p2 .. p2}, LJ/N;->MKonq97J(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_173

    invoke-virtual {v5, v1}, Laeb;->c(Lorg/chromium/content_public/browser/NavigationHandle;)V

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v7, v0}, Ld23;->onResult(Ljava/lang/Object;)V

    return-void

    :cond_173
    iget v0, v1, Lorg/chromium/content_public/browser/NavigationHandle;->d:I

    invoke-static {v0}, Lwqm;->B(I)Llqm;

    move-result-object v0

    sget-object v3, Llqm;->p:Llqm;

    sget-object v6, Llag;->g:Llag;

    if-ne v0, v3, :cond_237

    invoke-virtual/range {p2 .. p2}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    new-instance v8, Landroid/content/Intent;

    invoke-direct {v8, v14, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v8, v13}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    const/4 v3, 0x0

    invoke-static {v3, v8}, Lqvf;->a(ILandroid/content/Intent;)Ljava/util/List;

    move-result-object v8

    check-cast v8, Ljava/lang/Iterable;

    new-instance v3, Ljava/util/ArrayList;

    const/16 v10, 0xa

    invoke-static {v8, v10}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v11

    invoke-direct {v3, v11}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v8}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_1a5
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_1b9

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/content/pm/ResolveInfo;

    iget-object v11, v11, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v11, v11, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v3, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1a5

    :cond_1b9
    invoke-static {v3}, Lkotlin/collections/CollectionsKt;->m0(Ljava/lang/Iterable;)Ljava/util/LinkedHashSet;

    move-result-object v3

    new-instance v8, Landroid/content/Intent;

    invoke-direct {v8, v14}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v11, "http"

    const-string v12, ""

    const/4 v14, 0x0

    invoke-static {v11, v12, v14}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v11

    invoke-virtual {v8, v11}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    invoke-virtual {v8, v13}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    const/4 v11, 0x0

    invoke-static {v11, v8}, Lqvf;->a(ILandroid/content/Intent;)Ljava/util/List;

    move-result-object v8

    check-cast v8, Ljava/lang/Iterable;

    new-instance v11, Ljava/util/ArrayList;

    invoke-static {v8, v10}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v10

    invoke-direct {v11, v10}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v8}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_1e5
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_1f9

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/content/pm/ResolveInfo;

    iget-object v10, v10, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v10, v10, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v11, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1e5

    :cond_1f9
    invoke-static {v11}, Lkotlin/collections/CollectionsKt;->n0(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v8

    check-cast v8, Ljava/util/Collection;

    invoke-interface {v3, v8}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    invoke-interface {v3}, Ljava/util/Collection;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_209

    const/4 v3, 0x0

    :cond_209
    if-eqz v3, :cond_21f

    invoke-static {v3}, Lkotlin/collections/CollectionsKt;->J(Ljava/lang/Iterable;)Ljava/lang/Object;

    move-result-object v3

    move-object v14, v3

    check-cast v14, Ljava/lang/String;

    if-eqz v14, :cond_21f

    sget-object v3, Ls9g;->h:Ls9g;

    const/4 v11, 0x0

    invoke-virtual {v3, v6, v0, v11}, Ls9g;->g(Llag;Ljava/lang/String;Z)Lkag;

    move-result-object v0

    sget-object v3, Lkag;->c:Lkag;

    if-ne v0, v3, :cond_220

    :cond_21f
    const/4 v14, 0x0

    :cond_220
    if-eqz v14, :cond_237

    iput-object v14, v5, Laeb;->h:Ljava/lang/String;

    iget-wide v2, v1, Lorg/chromium/content_public/browser/NavigationHandle;->s:J

    iput-wide v2, v5, Laeb;->i:J

    const/4 v6, 0x1

    move-object/from16 v0, p0

    move-object/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    invoke-virtual/range {v0 .. v7}, Lzdb;->k(Lorg/chromium/content_public/browser/NavigationHandle;Lorg/chromium/url/GURL;ZZZZLd23;)V

    return-void

    :cond_237
    iget-boolean v0, v1, Lorg/chromium/content_public/browser/NavigationHandle;->b:Z

    if-nez v0, :cond_307

    iget-boolean v0, v1, Lorg/chromium/content_public/browser/NavigationHandle;->q:Z

    if-nez v0, :cond_2de

    if-eqz v2, :cond_2b7

    invoke-virtual/range {p2 .. p2}, Lorg/chromium/url/GURL;->f()Ljava/lang/String;

    move-result-object v0

    sget-object v3, Laeb;->k:Lu1b;

    invoke-interface {v3, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2b7

    invoke-virtual {v9}, Lcom/opera/android/browser/WebContentsWrapper;->c()Ldx3;

    move-result-object v0

    if-eqz v0, :cond_284

    invoke-virtual {v9}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v1

    invoke-virtual {v0, v1}, Ldx3;->V(Lorg/chromium/content_public/browser/WebContents;)Lb2l;

    move-result-object v1

    if-eqz v1, :cond_284

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->I()Lq6e;

    move-result-object v0

    move-object v2, v1

    check-cast v2, Ld7l;

    invoke-virtual {v2}, Ld7l;->j0()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lq6e;->c(J)Ll6e;

    move-result-object v2

    if-nez v2, :cond_27a

    invoke-virtual {v0}, Lq6e;->b()Leri;

    move-result-object v2

    :cond_27a
    invoke-interface {v2}, Leri;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_286

    :cond_284
    const/4 v12, 0x0

    goto :goto_2af

    :cond_286
    invoke-interface {v2}, Leri;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-virtual/range {p2 .. p2}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object v3

    const/4 v6, 0x6

    invoke-static {v6, v0, v3}, Lzg;->n(ILjava/lang/String;Ljava/lang/String;)Lzg;

    move-result-object v0

    invoke-interface {v1}, Lb9l;->T()Lp6l;

    move-result-object v1

    sget-object v3, Lcti;->a:Lhv5;

    invoke-static {v0, v2, v3, v1}, Lcti;->a(Lzg;Leri;Lbti;Lp6l;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Llqm;->b:Llqm;

    const/4 v14, 0x0

    invoke-static {v0, v14, v1}, Lwqm;->f(Ljava/lang/String;Lsqh;Llqm;)Llsc;

    move-result-object v0

    new-instance v1, Lzr9;

    const/16 v2, 0x9

    invoke-direct {v1, v5, v0, v2}, Lzr9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v1}, Lvml;->c(Ljava/lang/Runnable;)V

    move v12, v4

    :goto_2af
    invoke-static {v12}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v7, v0}, Ld23;->onResult(Ljava/lang/Object;)V

    return-void

    :cond_2b7
    iget-boolean v0, v9, Lcom/opera/android/browser/chromium/ChromiumContent;->t:Z

    if-nez v0, :cond_2d5

    sget-object v0, Ls9g;->h:Ls9g;

    invoke-virtual/range {p2 .. p2}, Lorg/chromium/url/GURL;->d()Lorg/chromium/url/GURL;

    move-result-object v3

    invoke-virtual {v3}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object v3

    const/4 v11, 0x0

    invoke-virtual {v0, v6, v3, v11}, Ls9g;->g(Llag;Ljava/lang/String;Z)Lkag;

    move-result-object v0

    sget-object v3, Lkag;->b:Lkag;

    if-ne v0, v3, :cond_2d5

    iget v0, v1, Lorg/chromium/content_public/browser/NavigationHandle;->d:I

    const/high16 v3, 0x8000000

    and-int/2addr v0, v3

    if-ne v0, v3, :cond_2de

    :cond_2d5
    invoke-virtual {v5, v1}, Laeb;->c(Lorg/chromium/content_public/browser/NavigationHandle;)V

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v7, v0}, Ld23;->onResult(Ljava/lang/Object;)V

    return-void

    :cond_2de
    if-nez v2, :cond_307

    iget-boolean v0, v9, Lcom/opera/android/browser/chromium/ChromiumContent;->t:Z

    if-nez v0, :cond_307

    invoke-virtual/range {p2 .. p2}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string v2, "https"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_307

    const/4 v6, 0x1

    move-object/from16 v0, p0

    move-object/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    invoke-virtual/range {v0 .. v7}, Lzdb;->k(Lorg/chromium/content_public/browser/NavigationHandle;Lorg/chromium/url/GURL;ZZZZLd23;)V

    return-void

    :cond_307
    const/4 v6, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    move-object/from16 v7, p7

    invoke-virtual/range {v0 .. v7}, Lzdb;->k(Lorg/chromium/content_public/browser/NavigationHandle;Lorg/chromium/url/GURL;ZZZZLd23;)V

    return-void

    :cond_31a
    iget v0, v1, Lorg/chromium/content_public/browser/NavigationHandle;->d:I

    invoke-static {v0}, Lwqm;->B(I)Llqm;

    move-result-object v0

    invoke-virtual/range {p2 .. p2}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v9}, Lcom/opera/android/browser/WebContentsWrapper;->c()Ldx3;

    move-result-object v3

    sget-object v5, Llk6;->a:Llk6;

    sget-object v5, Lik6;->b:Lik6;

    invoke-static {v4, v5, v0, v3, v2}, Llk6;->f(ILik6;Llqm;Landroid/content/Context;Landroid/net/Uri;)Z

    move-result v2

    if-eqz v2, :cond_345

    invoke-virtual/range {p2 .. p2}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v9}, Lcom/opera/android/browser/WebContentsWrapper;->c()Ldx3;

    move-result-object v3

    invoke-static {v2, v0, v4, v3}, Llk6;->a(Landroid/net/Uri;Llqm;ILandroid/content/Context;)Z

    :cond_345
    invoke-static {v1}, Lx1p;->C(Lorg/chromium/content_public/browser/NavigationHandle;)Z

    move-result v0

    invoke-static {v9, v0}, Lx1p;->Y(Lcom/opera/android/browser/chromium/ChromiumContent;Z)V

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v7, v0}, Ld23;->onResult(Ljava/lang/Object;)V

    return-void
.end method

.method public final b(Lorg/chromium/content_public/browser/WebContents;)V
    .registers 4

    iget-object v0, p0, Lzdb;->c:Lorg/chromium/content_public/browser/WebContents;

    if-eq v0, p1, :cond_2d

    :goto_4
    iget-object v0, p0, Lzdb;->h:Lig;

    const/4 v1, 0x0

    if-eqz v0, :cond_17

    iput-object v1, v0, Lig;->b:Ljava/lang/Object;

    iput-object v1, p0, Lzdb;->h:Lig;

    iget-object v0, p0, Lzdb;->i:Ld23;

    iput-object v1, p0, Lzdb;->i:Ld23;

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ld23;->onResult(Ljava/lang/Object;)V

    goto :goto_4

    :cond_17
    iget-object v0, p0, Lzdb;->c:Lorg/chromium/content_public/browser/WebContents;

    if-eqz v0, :cond_29

    iget-object v0, p0, Lzdb;->e:Lf53;

    if-eqz v0, :cond_24

    invoke-virtual {v0, v1}, Lptn;->c(Lorg/chromium/content_public/browser/WebContents;)V

    iput-object v1, p0, Lzdb;->e:Lf53;

    :cond_24
    iget-object v0, p0, Lzdb;->c:Lorg/chromium/content_public/browser/WebContents;

    invoke-static {v0}, LJ/N;->Mt_C4q47(Ljava/lang/Object;)V

    :cond_29
    iput-object p1, p0, Lzdb;->c:Lorg/chromium/content_public/browser/WebContents;

    if-nez p1, :cond_2e

    :cond_2d
    return-void

    :cond_2e
    iget-object p1, p0, Lzdb;->d:Lbpd;

    if-nez p1, :cond_40

    new-instance p1, Lbpd;

    new-instance v0, Lmlf;

    iget-object v1, p0, Lzdb;->b:Laeb;

    invoke-direct {v0, v1}, Lmlf;-><init>(Laeb;)V

    invoke-direct {p1, v0}, Lbpd;-><init>(Lmlf;)V

    iput-object p1, p0, Lzdb;->d:Lbpd;

    :cond_40
    iget-object p1, p0, Lzdb;->c:Lorg/chromium/content_public/browser/WebContents;

    invoke-static {p0, p1}, LJ/N;->Mjjyc5BV(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance p1, Lf53;

    iget-object v0, p0, Lzdb;->c:Lorg/chromium/content_public/browser/WebContents;

    const/4 v1, 0x2

    invoke-direct {p1, p0, v0, v1}, Lf53;-><init>(Ljava/lang/Object;Lorg/chromium/content_public/browser/WebContents;B)V

    iput-object p1, p0, Lzdb;->e:Lf53;

    return-void
.end method

.method public final c(Lorg/chromium/url/GURL;Ltm8;)V
    .registers 6

    iget-boolean v0, p2, Ltm8;->o:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    new-instance v0, Lksc;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lksc;-><init>(Lorg/chromium/url/GURL;I)V

    iget-object p1, p2, Ltm8;->c:Lcm;

    if-eqz p1, :cond_19

    iget-object v2, p1, Lcm;->c:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_19

    iput-object p1, v0, Lksc;->e:Lcm;

    :cond_19
    iget-boolean p1, p2, Ltm8;->q:Z

    iput-boolean p1, v0, Lksc;->j:Z

    invoke-static {}, LJ/N;->MWkeKQbk()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/chromium/url/Origin;

    iput-object p1, v0, Lksc;->b:Lorg/chromium/url/Origin;

    new-instance p1, Lwr9;

    const/16 p2, 0xd

    invoke-direct {p1, p2, p0, v0, v1}, Lwr9;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    const/4 p2, 0x7

    invoke-static {p2, p1}, Lorg/chromium/base/task/PostTask;->c(ILjava/lang/Runnable;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lzdb;->g:Z

    return-void
.end method

.method public final d(Ltm8;Z)Lea6;
    .registers 10

    const-string v0, "Android.TabNavigationInterceptResult."

    const-string v1, "Android.TabNavigationInterceptResult.For"

    const-string v2, "shouldOverrideUrlLoading"

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lorg/chromium/base/TraceEvent;->n(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/base/TraceEvent;

    move-result-object v2

    :try_start_b
    iget-object v4, p0, Lzdb;->b:Laeb;

    invoke-virtual {v4}, Laeb;->b()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v4

    iget-object p0, p0, Lzdb;->d:Lbpd;

    invoke-virtual {p0, p1}, Lbpd;->X(Ltm8;)Lea6;

    move-result-object p0
    :try_end_17
    .catchall {:try_start_b .. :try_end_17} :catchall_ab

    iget-byte v5, p0, Lea6;->b:B

    iget-object p1, p1, Ltm8;->a:Lorg/chromium/url/GURL;

    if-eqz p2, :cond_20

    :try_start_1d
    const-string p2, "ExternalProtocol"

    goto :goto_22

    :cond_20
    const-string p2, "InternalProtocol"

    :goto_22
    invoke-virtual {v1, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    const/16 v1, 0x8

    invoke-static {v5, v1, p2}, Lioh;->y(IILjava/lang/String;)V

    const/4 p2, 0x3

    if-ne v5, p2, :cond_30

    const/4 p2, 0x0

    goto :goto_90

    :cond_30
    invoke-static {p1}, Lvqm;->b(Lorg/chromium/url/GURL;)Z

    move-result v6

    if-eqz v6, :cond_38

    const/4 p2, 0x2

    goto :goto_90

    :cond_38
    invoke-static {p1}, Lvqm;->a(Lorg/chromium/url/GURL;)Z

    move-result v6

    if-nez v6, :cond_90

    const-string p2, "mdoc"

    invoke-virtual {p1}, Lorg/chromium/url/GURL;->f()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_4e

    const-string v3, "ForMdoc"

    const/4 p2, 0x4

    goto :goto_90

    :cond_4e
    invoke-virtual {p1}, Lorg/chromium/url/GURL;->f()Ljava/lang/String;

    move-result-object p2

    const-string v6, "openid4vp"

    invoke-virtual {p2, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_5e

    const-string v3, "ForOpenId4Vp"

    const/4 p2, 0x5

    goto :goto_90

    :cond_5e
    const-string p2, "openid-credential-offer"

    invoke-virtual {p1}, Lorg/chromium/url/GURL;->f()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_6e

    const-string v3, "ForOpenId4Vci"

    const/4 p2, 0x6

    goto :goto_90

    :cond_6e
    const-string p2, "haip-vp"

    invoke-virtual {p1}, Lorg/chromium/url/GURL;->f()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_7e

    const-string v3, "ForHaipVp"

    move p2, v1

    goto :goto_90

    :cond_7e
    const-string p2, "haip-vci"

    invoke-virtual {p1}, Lorg/chromium/url/GURL;->f()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_8f

    const-string v3, "ForHaipVci"

    const/16 p2, 0x9

    goto :goto_90

    :cond_8f
    const/4 p2, 0x1

    :cond_90
    :goto_90
    if-eqz v3, :cond_9e

    const/16 p1, 0x1354

    invoke-static {v4, p1}, LJ/N;->M_6SmRq4(Ljava/lang/Object;I)V

    invoke-virtual {v0, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v5, v1, p1}, Lioh;->y(IILjava/lang/String;)V

    :cond_9e
    const-string p1, "Android.TabNavigationIntercept.Scheme"

    const/16 v0, 0xa

    invoke-static {p2, v0, p1}, Lioh;->y(IILjava/lang/String;)V
    :try_end_a5
    .catchall {:try_start_1d .. :try_end_a5} :catchall_ab

    if-eqz v2, :cond_aa

    invoke-virtual {v2}, Lorg/chromium/base/TraceEvent;->close()V

    :cond_aa
    return-object p0

    :catchall_ab
    move-exception p0

    if-eqz v2, :cond_b6

    :try_start_ae
    invoke-virtual {v2}, Lorg/chromium/base/TraceEvent;->close()V
    :try_end_b1
    .catchall {:try_start_ae .. :try_end_b1} :catchall_b2

    goto :goto_b6

    :catchall_b2
    move-exception p1

    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_b6
    :goto_b6
    throw p0
.end method

.method public final e()I
    .registers 2

    iget-object p0, p0, Lzdb;->b:Laeb;

    invoke-virtual {p0}, Laeb;->b()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v0

    if-nez v0, :cond_a

    const/4 p0, -0x1

    return p0

    :cond_a
    invoke-virtual {p0}, Laeb;->b()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    invoke-interface {p0}, Lorg/chromium/content_public/browser/WebContents;->q()Lorg/chromium/content_public/browser/NavigationController;

    move-result-object p0

    invoke-interface {p0}, Lorg/chromium/content_public/browser/NavigationController;->t()I

    move-result p0

    return p0
.end method

.method public final f()Z
    .registers 2

    iget-object p0, p0, Lzdb;->b:Laeb;

    invoke-virtual {p0}, Laeb;->b()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v0

    if-eqz v0, :cond_24

    invoke-virtual {p0}, Laeb;->b()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    invoke-interface {p0}, Lorg/chromium/content_public/browser/WebContents;->q()Lorg/chromium/content_public/browser/NavigationController;

    move-result-object p0

    invoke-interface {p0}, Lorg/chromium/content_public/browser/NavigationController;->d()Z

    move-result v0

    if-nez v0, :cond_24

    invoke-interface {p0}, Lorg/chromium/content_public/browser/NavigationController;->t()I

    move-result v0

    invoke-interface {p0, v0}, Lorg/chromium/content_public/browser/NavigationController;->i(I)Lorg/chromium/content_public/browser/NavigationEntry;

    move-result-object p0

    if-eqz p0, :cond_26

    iget-boolean p0, p0, Lorg/chromium/content_public/browser/NavigationEntry;->e:Z

    if-eqz p0, :cond_26

    :cond_24
    const/4 p0, 0x1

    return p0

    :cond_26
    const/4 p0, 0x0

    return p0
.end method

.method public final g()Z
    .registers 4

    iget-object p0, p0, Lzdb;->b:Laeb;

    invoke-virtual {p0}, Laeb;->b()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_a

    return v1

    :cond_a
    invoke-virtual {p0}, Laeb;->b()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v0

    invoke-interface {v0}, Lorg/chromium/content_public/browser/WebContents;->p()Lorg/chromium/url/GURL;

    move-result-object v0

    iget-object v0, v0, Lorg/chromium/url/GURL;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_1c

    return v2

    :cond_1c
    iget-object p0, p0, Laeb;->f:Lbp;

    iget-object p0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast p0, Liqh;

    if-eqz p0, :cond_2c

    if-eqz p0, :cond_2b

    iget-boolean p0, p0, Liqh;->a:Z

    if-eqz p0, :cond_2b

    move v1, v2

    :cond_2b
    xor-int/2addr v1, v2

    :cond_2c
    return v1
.end method

.method public final h(Lorg/chromium/url/GURL;)V
    .registers 5

    iget-object v0, p0, Lzdb;->d:Lbpd;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object v0

    const-string v1, "wtai://wp/mc;"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2f

    :try_start_11
    invoke-virtual {p1}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, v1}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v0
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_1a} :catch_33

    invoke-virtual {v0}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_2f

    const v1, 0x10040

    invoke-static {v1, v0}, Lqvf;->a(ILandroid/content/Intent;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_3e

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3e

    :cond_2f
    const v0, 0x7f140366

    goto :goto_41

    :catch_33
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "Bad URI %s"

    invoke-static {v0, v2, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    :cond_3e
    const v0, 0x7f141320

    :goto_41
    iget-object p0, p0, Lzdb;->b:Laeb;

    invoke-virtual {p0}, Laeb;->b()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    sget-object v1, Lt8;->a:Landroid/content/Context;

    invoke-virtual {p1}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v1, v0, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1}, Lorg/chromium/content_public/browser/WebContents;->U0(Ljava/lang/String;)V

    return-void
.end method

.method public final handleSubframeExternalProtocol(Lorg/chromium/url/GURL;IZLorg/chromium/url/Origin;)Lorg/chromium/url/GURL;
    .registers 25

    new-instance v0, Lbp;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    const/4 v1, -0x2

    iput v1, v0, Lbp;->a:I

    invoke-virtual/range {p0 .. p0}, Lzdb;->e()I

    move-result v4

    invoke-virtual/range {p0 .. p0}, Lzdb;->f()Z

    move-result v5

    const/4 v2, 0x0

    const/4 v6, 0x1

    move/from16 v1, p2

    move/from16 v3, p3

    invoke-virtual/range {v0 .. v6}, Lbp;->d0(IZZIZZ)V

    new-instance v13, Lbeb;

    const/4 v1, 0x0

    move-object/from16 v3, p0

    invoke-direct {v13, v3, v1}, Lbeb;-><init>(Lzdb;B)V

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v11, 0x1

    const/4 v12, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const-wide/16 v16, -0x1

    move/from16 v4, p2

    move-object/from16 v10, p4

    move v5, v2

    move-object v1, v3

    move v7, v6

    move-object/from16 v3, p1

    move/from16 v6, p3

    move-object v2, v0

    invoke-virtual/range {v1 .. v19}, Lzdb;->l(Lbp;Lorg/chromium/url/GURL;IZZZLcm;ZLorg/chromium/url/Origin;ZZLorg/chromium/base/Callback;ZZJZZ)Lea6;

    move-result-object v0

    iget-byte v1, v0, Lea6;->b:B

    const/4 v2, 0x0

    if-eqz v1, :cond_54

    const/4 v3, 0x1

    if-eq v1, v3, :cond_4f

    const/4 v0, 0x2

    if-eq v1, v0, :cond_4c

    invoke-virtual/range {p0 .. p1}, Lzdb;->h(Lorg/chromium/url/GURL;)V

    return-object v2

    :cond_4c
    sget-object v0, Lzs9;->a:Lorg/chromium/url/GURL;

    return-object v0

    :cond_4f
    iget-object v0, v0, Lea6;->c:Ljava/lang/Object;

    check-cast v0, Lorg/chromium/url/GURL;

    return-object v0

    :cond_54
    return-object v2
.end method

.method public final i(Lorg/chromium/url/GURL;Z)V
    .registers 11

    iget-object v0, p0, Lzdb;->b:Laeb;

    invoke-virtual {v0}, Laeb;->b()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v1

    if-eqz v1, :cond_68

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz p2, :cond_14

    invoke-virtual {p0}, Lzdb;->g()Z

    move-result p2

    if-eqz p2, :cond_14

    move p2, v2

    goto :goto_15

    :cond_14
    move p2, v1

    :goto_15
    invoke-virtual {v0}, Laeb;->d()Z

    move-result v3

    invoke-static {p1}, Lvqm;->a(Lorg/chromium/url/GURL;)Z

    move-result v4

    const/4 v5, 0x2

    const/4 v6, 0x5

    if-eqz v4, :cond_27

    if-eqz v3, :cond_25

    const/4 p1, 0x3

    goto :goto_38

    :cond_25
    move p1, v1

    goto :goto_38

    :cond_27
    invoke-static {p1}, Lvqm;->b(Lorg/chromium/url/GURL;)Z

    move-result p1

    if-eqz p1, :cond_33

    if-eqz v3, :cond_31

    move p1, v6

    goto :goto_38

    :cond_31
    move p1, v5

    goto :goto_38

    :cond_33
    if-eqz v3, :cond_37

    const/4 p1, 0x4

    goto :goto_38

    :cond_37
    move p1, v2

    :goto_38
    const-string v4, "Android.Intent.MainFrameIntentLaunch"

    const/4 v7, 0x6

    invoke-static {p1, v7, v4}, Lioh;->y(IILjava/lang/String;)V

    if-eqz v3, :cond_47

    invoke-virtual {p0}, Lzdb;->g()Z

    move-result p1

    if-eqz p1, :cond_47

    move v1, v2

    :cond_47
    const-string p1, "Android.Intent.IntentLaunchFromTabCreation"

    invoke-static {p1, v1}, Lioh;->t(Ljava/lang/String;Z)V

    const/4 p1, 0x7

    if-eqz p2, :cond_58

    new-instance p2, Lvl9;

    invoke-direct {p2, p0, v6}, Lvl9;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, p2}, Lorg/chromium/base/task/PostTask;->c(ILjava/lang/Runnable;)V

    return-void

    :cond_58
    iget-object p2, v0, Laeb;->f:Lbp;

    iget-object v0, p2, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Liqh;

    if-eqz v0, :cond_71

    iget p2, p2, Lbp;->a:I

    invoke-virtual {p0}, Lzdb;->e()I

    move-result v0

    if-gt v0, p2, :cond_69

    :cond_68
    return-void

    :cond_69
    new-instance v0, Lp94;

    invoke-direct {v0, p0, p2, v5}, Lp94;-><init>(Ljava/lang/Object;IB)V

    invoke-static {p1, v0}, Lorg/chromium/base/task/PostTask;->c(ILjava/lang/Runnable;)V

    :cond_71
    return-void
.end method

.method public final j(Lea6;Lorg/chromium/url/GURL;Z)V
    .registers 24

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    iget-object v3, v0, Lzdb;->b:Laeb;

    iget-object v4, v3, Laeb;->c:Lcom/opera/android/Lazy;

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lvo7;

    iget-byte v5, v1, Lea6;->b:B

    iget-object v6, v4, Lvo7;->h:Luo7;

    const/4 v7, 0x0

    const/4 v8, 0x1

    const/4 v9, 0x0

    if-eqz v6, :cond_89

    iget-object v10, v6, Luo7;->a:Lorg/chromium/url/GURL;

    if-nez v5, :cond_1f

    move v11, v8

    goto :goto_20

    :cond_1f
    move v11, v7

    :goto_20
    if-eqz v11, :cond_7e

    iget-boolean v12, v6, Luo7;->e:Z

    if-eqz v12, :cond_7e

    iget-boolean v12, v6, Luo7;->f:Z

    if-nez v12, :cond_55

    iget-object v12, v4, Lvo7;->f:Lc37;

    invoke-virtual {v10}, Lorg/chromium/url/GURL;->d()Lorg/chromium/url/GURL;

    move-result-object v13

    invoke-virtual {v13}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object v16

    iget-object v12, v12, Lc37;->a:Ljava/lang/Object;

    check-cast v12, Lesk;

    invoke-interface {v12}, Lesk;->get()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ls9g;

    iget-object v13, v13, Ls9g;->b:Lcom/opera/android/settings/SettingsManager;

    sget-object v14, Llag;->g:Llag;

    invoke-virtual {v13, v14}, Lcom/opera/android/settings/SettingsManager;->k(Llag;)Lkag;

    move-result-object v18

    invoke-interface {v12}, Lesk;->get()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ls9g;

    const/4 v15, 0x0

    const/16 v19, 0x1

    move-object/from16 v17, v14

    move-object v14, v12

    invoke-virtual/range {v14 .. v19}, Ls9g;->o(ZLjava/lang/String;Llag;Lkag;Z)V

    :cond_55
    iget-object v12, v4, Lvo7;->g:Lx77;

    invoke-virtual {v10}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object v10

    iget-object v12, v12, Lx77;->c:Ljava/lang/Object;

    check-cast v12, Lesk;

    invoke-interface {v12}, Lesk;->get()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lru9;

    invoke-virtual {v12}, Lru9;->b()Lnv6;

    move-result-object v12

    iget-object v13, v12, Lnv6;->a:Ljava/lang/Object;

    check-cast v13, Landroid/content/SharedPreferences$Editor;

    const-string v14, "dynamic_external_apps.open_in_opera_url"

    invoke-interface {v13, v14, v10}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    const-string v10, "dynamic_external_apps.open_in_opera_timestamp"

    invoke-interface {v13, v10, v14, v15}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v12}, Lnv6;->w()V

    :cond_7e
    iget-object v10, v4, Lvo7;->d:Lyqa;

    iget-object v6, v6, Luo7;->b:Lqo7;

    invoke-virtual {v10, v6, v11}, Lyqa;->i(Lqo7;Z)V

    iput-object v9, v4, Lvo7;->h:Luo7;

    iput-object v9, v4, Lvo7;->i:Ljava/lang/Long;

    :cond_89
    iput-object v9, v3, Laeb;->h:Ljava/lang/String;

    iput-object v9, v0, Lzdb;->h:Lig;

    if-eqz v5, :cond_aa

    if-eq v5, v8, :cond_9e

    const/4 v1, 0x2

    if-eq v5, v1, :cond_9c

    const/4 v1, 0x4

    if-eq v5, v1, :cond_9c

    if-eqz p3, :cond_ae

    invoke-virtual {v0, v2}, Lzdb;->h(Lorg/chromium/url/GURL;)V

    :cond_9c
    :goto_9c
    move v7, v8

    goto :goto_ae

    :cond_9e
    iget-object v2, v1, Lea6;->c:Ljava/lang/Object;

    check-cast v2, Lorg/chromium/url/GURL;

    iget-object v1, v1, Lea6;->d:Ljava/lang/Object;

    check-cast v1, Ltm8;

    invoke-virtual {v0, v2, v1}, Lzdb;->c(Lorg/chromium/url/GURL;Ltm8;)V

    goto :goto_9c

    :cond_aa
    invoke-virtual {v0, v2, v8}, Lzdb;->i(Lorg/chromium/url/GURL;Z)V

    goto :goto_9c

    :cond_ae
    :goto_ae
    iget-object v1, v0, Lzdb;->i:Ld23;

    iput-object v9, v0, Lzdb;->i:Ld23;

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v1, v0}, Ld23;->onResult(Ljava/lang/Object;)V

    return-void
.end method

.method public final k(Lorg/chromium/content_public/browser/NavigationHandle;Lorg/chromium/url/GURL;ZZZZLd23;)V
    .registers 28

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    move-object/from16 v2, p7

    iget-boolean v3, v0, Lorg/chromium/content_public/browser/NavigationHandle;->a:Z

    if-eqz v3, :cond_e8

    iget-wide v3, v0, Lorg/chromium/content_public/browser/NavigationHandle;->s:J

    iget-object v5, v1, Lzdb;->b:Laeb;

    iput-wide v3, v5, Laeb;->j:J

    iget-object v6, v5, Laeb;->f:Lbp;

    iget v7, v0, Lorg/chromium/content_public/browser/NavigationHandle;->d:I

    iget-boolean v8, v0, Lorg/chromium/content_public/browser/NavigationHandle;->q:Z

    iget-boolean v9, v0, Lorg/chromium/content_public/browser/NavigationHandle;->p:Z

    invoke-virtual {v1}, Lzdb;->e()I

    move-result v10

    invoke-virtual {v1}, Lzdb;->f()Z

    move-result v11

    iget-boolean v12, v0, Lorg/chromium/content_public/browser/NavigationHandle;->b:Z

    invoke-virtual/range {v6 .. v12}, Lbp;->d0(IZZIZZ)V

    iget-boolean v3, v1, Lzdb;->j:Z

    if-nez v3, :cond_39

    invoke-virtual {v1}, Lzdb;->f()Z

    move-result v4

    if-eqz v4, :cond_39

    iget-boolean v4, v0, Lorg/chromium/content_public/browser/NavigationHandle;->q:Z

    if-nez v4, :cond_39

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v2, v0}, Ld23;->onResult(Ljava/lang/Object;)V

    return-void

    :cond_39
    const/4 v4, 0x1

    if-nez v3, :cond_60

    invoke-virtual {v5}, Laeb;->d()Z

    move-result v3

    if-eqz v3, :cond_5a

    iget-boolean v3, v1, Lzdb;->k:Z

    if-nez v3, :cond_5a

    iget-object v3, v1, Lzdb;->h:Lig;

    if-eqz v3, :cond_57

    new-instance v7, Lzr9;

    const/16 v8, 0xa

    invoke-direct {v7, v1, v3, v8}, Lzr9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const-wide/16 v8, 0x1388

    const/4 v3, 0x7

    invoke-static {v3, v7, v8, v9}, Lorg/chromium/base/task/PostTask;->b(ILjava/lang/Runnable;J)V

    :cond_57
    move/from16 v18, v4

    goto :goto_62

    :cond_5a
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v2, v0}, Ld23;->onResult(Ljava/lang/Object;)V

    return-void

    :cond_60
    move/from16 v18, p5

    :goto_62
    iput-object v2, v1, Lzdb;->i:Ld23;

    iget v2, v0, Lorg/chromium/content_public/browser/NavigationHandle;->d:I

    iget-boolean v3, v0, Lorg/chromium/content_public/browser/NavigationHandle;->q:Z

    move v7, v2

    move-object v2, v6

    iget-boolean v6, v0, Lorg/chromium/content_public/browser/NavigationHandle;->p:Z

    move v8, v7

    iget-boolean v7, v0, Lorg/chromium/content_public/browser/NavigationHandle;->b:Z

    iget-object v9, v0, Lorg/chromium/content_public/browser/NavigationHandle;->f:Lorg/chromium/url/GURL;

    invoke-static {v9}, Lorg/chromium/url/GURL;->i(Lorg/chromium/url/GURL;)Z

    move-result v10

    if-eqz v10, :cond_79

    const/4 v9, 0x0

    goto :goto_87

    :cond_79
    new-instance v10, Lcm;

    invoke-virtual {v9}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object v9

    iget v11, v0, Lorg/chromium/content_public/browser/NavigationHandle;->g:I

    const/16 v12, 0x8

    invoke-direct {v10, v9, v11, v12}, Lcm;-><init>(Ljava/lang/String;IB)V

    move-object v9, v10

    :goto_87
    iget-boolean v10, v0, Lorg/chromium/content_public/browser/NavigationHandle;->a:Z

    move v11, v8

    move-object v8, v9

    move v9, v10

    iget-object v10, v0, Lorg/chromium/content_public/browser/NavigationHandle;->n:Lorg/chromium/url/Origin;

    move v12, v11

    iget-boolean v11, v0, Lorg/chromium/content_public/browser/NavigationHandle;->r:Z

    iget-object v13, v5, Laeb;->b:Lu59;

    invoke-virtual {v13}, Lu59;->F()Lb2l;

    move-result-object v14

    if-eqz v14, :cond_a2

    check-cast v14, Ld7l;

    iget-object v14, v14, Ld7l;->j:Le7l;

    invoke-interface {v14}, Lb9l;->isActive()Z

    move-result v14

    goto :goto_a8

    :cond_a2
    iget-object v14, v13, Lu59;->b:Ljava/lang/Object;

    check-cast v14, Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-boolean v14, v14, Lcom/opera/android/browser/chromium/ChromiumContent;->r:Z

    :goto_a8
    const/4 v15, 0x0

    if-eqz v14, :cond_c6

    invoke-virtual {v13}, Lu59;->F()Lb2l;

    move-result-object v13

    if-eqz v13, :cond_c6

    check-cast v13, Ld7l;

    invoke-virtual {v13}, Ld7l;->o0()Z

    move-result v13

    if-eqz v13, :cond_c6

    iget-object v5, v5, Laeb;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object v5, v5, Lcom/opera/android/browser/chromium/ChromiumContent;->J:Lxr5;

    if-eqz v5, :cond_c6

    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    move-result v5

    if-nez v5, :cond_c6

    move v15, v4

    :cond_c6
    new-instance v13, Lbeb;

    invoke-direct {v13, v1, v4}, Lbeb;-><init>(Lzdb;B)V

    iget-wide v4, v0, Lorg/chromium/content_public/browser/NavigationHandle;->s:J

    move/from16 v14, p3

    move/from16 v19, p6

    move-wide/from16 v16, v4

    move v4, v12

    move v12, v15

    move/from16 v15, p4

    move v5, v3

    move-object/from16 v3, p2

    invoke-virtual/range {v1 .. v19}, Lzdb;->l(Lbp;Lorg/chromium/url/GURL;IZZZLcm;ZLorg/chromium/url/Origin;ZZLorg/chromium/base/Callback;ZZJZZ)Lea6;

    move-result-object v2

    if-nez v18, :cond_e7

    iget-boolean v0, v0, Lorg/chromium/content_public/browser/NavigationHandle;->r:Z

    move-object/from16 v3, p2

    invoke-virtual {v1, v2, v3, v0}, Lzdb;->j(Lea6;Lorg/chromium/url/GURL;Z)V

    :cond_e7
    return-void

    :cond_e8
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0}, Ljava/lang/RuntimeException;-><init>()V

    throw v0
.end method

.method public final l(Lbp;Lorg/chromium/url/GURL;IZZZLcm;ZLorg/chromium/url/Origin;ZZLorg/chromium/base/Callback;ZZJZZ)Lea6;
    .registers 44

    move-object/from16 v0, p0

    move/from16 v1, p10

    invoke-virtual {v0}, Lzdb;->g()Z

    move-result v9

    iget-object v2, v0, Lzdb;->b:Laeb;

    iget-object v3, v2, Laeb;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {v2}, Laeb;->b()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v4

    invoke-interface {v4}, Lorg/chromium/content_public/browser/WebContents;->getVisibility()I

    move-result v4

    const/4 v5, 0x2

    const/4 v6, 0x0

    const/4 v7, 0x1

    if-ne v4, v5, :cond_1b

    move v4, v7

    goto :goto_1c

    :cond_1b
    move v4, v6

    :goto_1c
    iget-boolean v5, v3, Lcom/opera/android/browser/chromium/ChromiumContent;->t:Z

    if-eqz v5, :cond_22

    move v6, v7

    goto :goto_57

    :cond_22
    invoke-virtual {v2}, Laeb;->a()Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_2a

    iget-object v5, v2, Laeb;->h:Ljava/lang/String;

    :cond_2a
    if-nez v5, :cond_57

    iget-object v2, v2, Laeb;->b:Lu59;

    iget-object v2, v2, Lu59;->b:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {v2}, Lcom/opera/android/browser/WebContentsWrapper;->c()Ldx3;

    move-result-object v5

    sget-object v8, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v5}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v5

    check-cast v5, Lcom/opera/android/OperaApplication;

    invoke-virtual {v5}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object v5

    iget-object v8, v5, Lydn;->c:Lgfn;

    invoke-interface {v8}, Lgfn;->isEnabled()Z

    move-result v8

    if-nez v8, :cond_57

    iget-boolean v2, v2, Lcom/opera/android/browser/chromium/ChromiumContent;->t:Z

    iget-object v5, v5, Lydn;->d:Lvdn;

    if-eqz v2, :cond_53

    iget-boolean v6, v5, Lvdn;->a:Z

    goto :goto_57

    :cond_53
    invoke-virtual {v5}, Lvdn;->a()Z

    move-result v6

    :cond_57
    :goto_57
    xor-int/lit8 v10, v4, 0x1

    invoke-virtual {v0}, Lzdb;->f()Z

    move-result v17

    iget-boolean v2, v3, Lcom/opera/android/browser/chromium/ChromiumContent;->u:Z

    xor-int/lit8 v23, v2, 0x1

    move/from16 v22, v2

    new-instance v2, Ltm8;

    move-object/from16 v8, p1

    move-object/from16 v3, p2

    move/from16 v7, p4

    move/from16 v13, p5

    move/from16 v15, p6

    move-object/from16 v5, p7

    move/from16 v12, p8

    move-object/from16 v16, p9

    move/from16 v11, p11

    move-object/from16 v14, p12

    move/from16 v18, p13

    move/from16 v19, p14

    move-wide/from16 v20, p15

    move/from16 v24, p18

    move v4, v6

    move/from16 v6, p3

    invoke-direct/range {v2 .. v24}, Ltm8;-><init>(Lorg/chromium/url/GURL;ZLcm;IZLbp;ZZZZZLorg/chromium/base/Callback;ZLorg/chromium/url/Origin;ZZZJZZZ)V

    if-nez p17, :cond_8e

    invoke-virtual {v0, v2, v1}, Lzdb;->d(Ltm8;Z)Lea6;

    move-result-object v0

    return-object v0

    :cond_8e
    new-instance v3, Lcda;

    const/4 v4, 0x1

    invoke-direct {v3, v4, v0, v2, v1}, Lcda;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    new-instance v1, Lig;

    const/16 v2, 0xf

    invoke-direct {v1, v3, v2}, Lig;-><init>(Ljava/lang/Object;B)V

    iput-object v1, v0, Lzdb;->h:Lig;

    const/4 v0, 0x7

    invoke-static {v0, v1}, Lorg/chromium/base/task/PostTask;->c(ILjava/lang/Runnable;)V

    const/4 v0, 0x0

    return-object v0
.end method

.method public final onResourceRequestWithGesture()V
    .registers 9

    iget-object v0, p0, Lzdb;->h:Lig;

    if-eqz v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Lzdb;->b:Laeb;

    iget-object v1, v0, Laeb;->f:Lbp;

    invoke-virtual {p0}, Lzdb;->e()I

    move-result v5

    const/4 v6, 0x0

    const/4 v7, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-virtual/range {v1 .. v7}, Lbp;->d0(IZZIZZ)V

    return-void
.end method

.method public final requestFinishPendingShouldIgnoreCheck()V
    .registers 6

    iget-object v0, p0, Lzdb;->h:Lig;

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-virtual {v0}, Lig;->run()V

    iget-object v1, p0, Lzdb;->h:Lig;

    if-eqz v1, :cond_1b

    if-eqz v1, :cond_1b

    new-instance v2, Lzr9;

    const/16 v3, 0xa

    invoke-direct {v2, p0, v1, v3}, Lzr9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const-wide/16 v3, 0x1388

    const/4 p0, 0x7

    invoke-static {p0, v2, v3, v4}, Lorg/chromium/base/task/PostTask;->b(ILjava/lang/Runnable;J)V

    :cond_1b
    const/4 p0, 0x0

    iput-object p0, v0, Lig;->b:Ljava/lang/Object;

    return-void
.end method
