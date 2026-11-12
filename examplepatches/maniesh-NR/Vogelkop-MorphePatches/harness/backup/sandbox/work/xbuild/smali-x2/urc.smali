.class public final Lurc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lndc;


# instance fields
.field public final a:Lcom/opera/android/browser/WebContentsWrapper;

.field public final b:Lg8c;

.field public final c:Lcp7;

.field public final d:Lxoc;

.field public final e:Lqdc;

.field public final f:Lta7;

.field public final g:Lode;

.field public final h:Ls9i;

.field public final i:Leyi;

.field public final j:Lkze;

.field public k:Ljava/lang/String;

.field public l:Z


# direct methods
.method public constructor <init>(Lcom/opera/android/browser/WebContentsWrapper;Lg8c;Lrkc;Lcom/opera/android/settings/SettingsManager;Lcp7;Lj4c;Lorm;Lwyn;Lvx;Lcs6;Lxoc;Ldw3;Ldw3;)V
    .registers 30

    move-object/from16 v0, p0

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    move-object/from16 v1, p1

    iput-object v1, v0, Lurc;->a:Lcom/opera/android/browser/WebContentsWrapper;

    move-object/from16 v2, p2

    iput-object v2, v0, Lurc;->b:Lg8c;

    move-object/from16 v2, p5

    iput-object v2, v0, Lurc;->c:Lcp7;

    move-object/from16 v13, p11

    iput-object v13, v0, Lurc;->d:Lxoc;

    new-instance v3, Lqdc;

    const/4 v4, 0x1

    invoke-direct {v3, v0, v4}, Lqdc;-><init>(Lndc;Z)V

    iput-object v3, v0, Lurc;->e:Lqdc;

    move-object/from16 v5, p3

    invoke-virtual {v5, v0}, Lrkc;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lu02;

    move-object v6, v3

    new-instance v3, Lta7;

    move v7, v4

    move-object v4, v5

    new-instance v5, Ly0a;

    const/16 v8, 0x10

    invoke-direct {v5, v0, v8}, Ly0a;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v8

    invoke-interface {v8}, Lorg/chromium/content_public/browser/WebContents;->m()Z

    move-result v10

    move-object/from16 v11, p4

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    move-object/from16 v12, p10

    move-object/from16 v14, p12

    move-object/from16 v15, p13

    move-object v1, v6

    move v2, v7

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    invoke-direct/range {v3 .. v15}, Lta7;-><init>(Lu02;Ly0a;Lj4c;Lorm;Lwyn;Lvx;ZLcom/opera/android/settings/SettingsManager;Lcs6;Lxoc;Ldw3;Ldw3;)V

    iput-object v3, v0, Lurc;->f:Lta7;

    new-instance v5, Lode;

    const/4 v6, 0x0

    invoke-direct {v5, v6}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v5, v0, Lurc;->g:Lode;

    new-instance v5, Ls9i;

    invoke-virtual/range {p1 .. p1}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v6

    invoke-direct {v5, v6, v3}, Ls9i;-><init>(Lorg/chromium/content_public/browser/WebContents;Lta7;)V

    iput-object v5, v0, Lurc;->h:Ls9i;

    new-instance v3, Leyi;

    invoke-virtual/range {p1 .. p1}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v6

    invoke-interface {v6}, Lorg/chromium/content_public/browser/WebContents;->m()Z

    move-result v6

    invoke-direct {v3, v6, v11}, Leyi;-><init>(ZLcom/opera/android/settings/SettingsManager;)V

    iput-object v3, v0, Lurc;->i:Leyi;

    new-instance v6, Lkze;

    sget-object v7, Ltrc;->a:Ltrc;

    invoke-direct {v6, v7}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v6, v0, Lurc;->j:Lkze;

    iget-object v4, v4, Lu02;->o:Ljava/lang/Object;

    check-cast v4, Lkze;

    new-instance v6, Lrrc;

    const/4 v7, 0x0

    invoke-direct {v6, v0, v7}, Lrrc;-><init>(Lurc;B)V

    new-instance v7, Lug;

    const/16 v8, 0x1b

    invoke-direct {v7, v6, v8}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v4, v0, v7}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v3, v3, Leyi;->d:Ljava/lang/Object;

    check-cast v3, Lkze;

    new-instance v4, Lrrc;

    invoke-direct {v4, v0, v2}, Lrrc;-><init>(Lurc;B)V

    new-instance v2, Lug;

    invoke-direct {v2, v4, v8}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v3, v0, v2}, Lekc;->j(Lndc;Lf7f;)V

    invoke-virtual/range {p1 .. p1}, Lcom/opera/android/browser/WebContentsWrapper;->i()V

    invoke-interface/range {p5 .. p5}, Lcp7;->getState()Lekc;

    move-result-object v2

    new-instance v3, Lrrc;

    const/4 v4, 0x2

    invoke-direct {v3, v0, v4}, Lrrc;-><init>(Lurc;B)V

    new-instance v6, Lug;

    invoke-direct {v6, v3, v8}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v2, v0, v6}, Lekc;->j(Lndc;Lf7f;)V

    sget-object v2, Lqcc;->e:Lqcc;

    invoke-virtual {v1, v2}, Lqdc;->g(Lqcc;)V

    new-instance v2, Lrrc;

    const/4 v3, 0x3

    invoke-direct {v2, v0, v3}, Lrrc;-><init>(Lurc;B)V

    const/4 v3, 0x0

    const/16 v6, 0xd

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object/from16 p1, v1

    move-object/from16 p3, v2

    move-object/from16 p5, v3

    move/from16 p6, v6

    move-object/from16 p2, v7

    move-object/from16 p4, v8

    invoke-static/range {p1 .. p6}, Loup;->l0(Ltcc;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;I)V

    iget-object v1, v5, Ls9i;->e:Ljava/lang/Object;

    check-cast v1, Lnv6;

    new-instance v2, Lyqc;

    invoke-direct {v2, v0}, Lyqc;-><init>(Lurc;)V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lvpb;

    invoke-direct {v0}, Lvpb;-><init>()V

    new-instance v3, Lorb;

    invoke-direct {v3}, Lorb;-><init>()V

    invoke-virtual {v0, v3}, Lvpb;->a(Ljava/lang/Object;)V

    iget-object v1, v1, Lnv6;->a:Ljava/lang/Object;

    check-cast v1, Lqq8;

    invoke-virtual {v1}, Lqq8;->h()Ljava/lang/String;

    move-result-object v3

    const-string v5, "2.0"

    const-string v6, "method"

    const-string v7, "jsonrpc"

    const-string v8, "views.v1.getLiveScoreState"

    invoke-static {v7, v5, v6, v8}, Lo18;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorb;

    move-result-object v5

    const-string v6, "params"

    invoke-virtual {v5, v0, v6}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "id"

    invoke-virtual {v5, v3, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lrkc;

    invoke-direct {v0, v2, v4}, Lrkc;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v5, v0}, Lqq8;->l(Lorb;Lkotlin/jvm/functions/Function1;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 4

    iget-object v0, p0, Lurc;->c:Lcp7;

    invoke-interface {v0}, Lcp7;->getState()Lekc;

    move-result-object v0

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lbp7;->c:Lbp7;

    if-ne v0, v1, :cond_46

    iget-object v0, p0, Lurc;->k:Ljava/lang/String;

    if-eqz v0, :cond_46

    iget-object v1, p0, Lurc;->b:Lg8c;

    invoke-virtual {v1, v0}, Lg8c;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/Uri;

    iget-boolean v1, p0, Lurc;->l:Z

    if-nez v1, :cond_46

    const/4 v1, 0x1

    iput-boolean v1, p0, Lurc;->l:Z

    iget-object v1, p0, Lurc;->j:Lkze;

    sget-object v2, Ltrc;->a:Ltrc;

    invoke-virtual {v1, v2}, Lekc;->r(Ljava/lang/Object;)V

    new-instance v1, Lksc;

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    invoke-direct {v1, v0, v2}, Lksc;-><init>(Ljava/lang/String;I)V

    new-instance v0, Lrrc;

    const/4 v2, 0x4

    invoke-direct {v0, p0, v2}, Lrrc;-><init>(Lurc;B)V

    new-instance v2, Lstn;

    iget-object p0, p0, Lurc;->a:Lcom/opera/android/browser/WebContentsWrapper;

    invoke-direct {v2, p0, v0}, Lstn;-><init>(Lcom/opera/android/browser/WebContentsWrapper;Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->d()Lorg/chromium/content_public/browser/NavigationController;

    move-result-object p0

    invoke-interface {p0, v1}, Lorg/chromium/content_public/browser/NavigationController;->r(Lksc;)Lorg/chromium/content_public/browser/NavigationHandle;

    :cond_46
    return-void
.end method

.method public final getLifecycle()Ltcc;
    .registers 1

    iget-object p0, p0, Lurc;->e:Lqdc;

    return-object p0
.end method
