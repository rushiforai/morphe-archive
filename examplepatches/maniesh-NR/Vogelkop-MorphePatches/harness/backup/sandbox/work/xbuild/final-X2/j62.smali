.class public final Lj62;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ldx3;

.field public final b:Lumi;

.field public final c:Lgjm;

.field public final d:Lji;

.field public final e:Lj4c;

.field public final f:Lj4c;

.field public final g:Lcom/opera/android/Lazy;

.field public final h:Lwv1;

.field public final i:Lyv3;

.field public final j:Lyv3;

.field public final k:Lwyn;

.field public final l:Lzv3;

.field public final m:Lzv3;

.field public final n:Lzv3;

.field public final o:Lyv3;

.field public final p:Lji;

.field public final q:Lji;

.field public final r:Lzv3;

.field public final s:Lj4c;

.field public final t:Lr2;

.field public final u:Lzyk;


# direct methods
.method public constructor <init>(Ldx3;Lumi;Lgjm;Lji;Lj4c;Lj4c;Lcom/opera/android/Lazy;Lwv1;Lyv3;Lyv3;Lwyn;Lzv3;Lzv3;Lzv3;Lyv3;Lji;Lji;Lzv3;Lj4c;Lr2;)V
    .registers 21

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lj62;->a:Ldx3;

    iput-object p2, p0, Lj62;->b:Lumi;

    iput-object p3, p0, Lj62;->c:Lgjm;

    iput-object p4, p0, Lj62;->d:Lji;

    iput-object p5, p0, Lj62;->e:Lj4c;

    iput-object p6, p0, Lj62;->f:Lj4c;

    iput-object p7, p0, Lj62;->g:Lcom/opera/android/Lazy;

    iput-object p8, p0, Lj62;->h:Lwv1;

    iput-object p9, p0, Lj62;->i:Lyv3;

    iput-object p10, p0, Lj62;->j:Lyv3;

    iput-object p11, p0, Lj62;->k:Lwyn;

    iput-object p12, p0, Lj62;->l:Lzv3;

    iput-object p13, p0, Lj62;->m:Lzv3;

    iput-object p14, p0, Lj62;->n:Lzv3;

    iput-object p15, p0, Lj62;->o:Lyv3;

    move-object/from16 p1, p16

    iput-object p1, p0, Lj62;->p:Lji;

    move-object/from16 p1, p17

    iput-object p1, p0, Lj62;->q:Lji;

    move-object/from16 p1, p18

    iput-object p1, p0, Lj62;->r:Lzv3;

    move-object/from16 p1, p19

    iput-object p1, p0, Lj62;->s:Lj4c;

    move-object/from16 p1, p20

    iput-object p1, p0, Lj62;->t:Lr2;

    new-instance p1, Lvk1;

    const/16 p2, 0x11

    invoke-direct {p1, p2}, Lvk1;-><init>(B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lj62;->u:Lzyk;

    return-void
.end method


# virtual methods
.method public final a(ZLkotlin/jvm/functions/Function1;Ld12;)Lhq3;
    .registers 28

    move-object/from16 v0, p0

    move/from16 v2, p1

    iget-object v1, v0, Lj62;->e:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v18, v1

    check-cast v18, Lyk6;

    iget-object v1, v0, Lj62;->f:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v19, v1

    check-cast v19, La52;

    iget-object v1, v0, Lj62;->h:Lwv1;

    iget-object v1, v1, Lwv1;->b:Lb6h;

    invoke-interface {v1}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Lxb;

    iget-object v1, v0, Lj62;->d:Lji;

    iget-object v1, v1, Lji;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v4

    invoke-virtual {v0}, Lj62;->b()Lg7m;

    move-result-object v13

    iget-object v1, v0, Lj62;->j:Lyv3;

    invoke-virtual {v1}, Lyv3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v12, v1

    check-cast v12, Lqsh;

    iget-object v1, v0, Lj62;->s:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v17, v1

    check-cast v17, Lky1;

    iget-object v1, v0, Lj62;->l:Lzv3;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v14, v1

    check-cast v14, Lk42;

    iget-object v1, v0, Lj62;->m:Lzv3;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v15, v1

    check-cast v15, Ll02;

    iget-object v1, v0, Lj62;->n:Lzv3;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v20, v1

    check-cast v20, Lqb;

    iget-object v1, v0, Lj62;->u:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Lekc;

    const/4 v8, 0x0

    invoke-static {v2, v8}, LJ/N;->M_FZHKB_(ZZ)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/chromium/content_public/browser/WebContents;

    new-instance v9, Lcom/opera/android/browser/WebContentsWrapper;

    iget-object v10, v0, Lj62;->a:Ldx3;

    iget-object v3, v10, Ldx3;->j:Lqi;

    const/4 v6, 0x7

    invoke-direct {v9, v3, v1, v6}, Lcom/opera/android/browser/WebContentsWrapper;-><init>(Lqi;Lorg/chromium/content_public/browser/WebContents;I)V

    const/4 v1, 0x0

    invoke-virtual {v9, v1}, Lcom/opera/android/browser/WebContentsWrapper;->g(Lqq6;)V

    invoke-virtual {v9}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v1

    invoke-static {v1}, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->fromWebContents(Lorg/chromium/content_public/browser/WebContents;)Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object/from16 v3, p2

    invoke-interface {v3, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lve;

    iput-object v3, v1, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->f:Lve;

    new-instance v11, La12;

    iget-object v1, v0, Lj62;->b:Lumi;

    invoke-direct {v11, v10, v1}, La12;-><init>(Landroid/content/Context;Ltcl;)V

    new-instance v3, Lwth;

    const/16 v6, 0xa

    invoke-direct {v3, v11, v6}, Lwth;-><init>(Ljava/lang/Object;B)V

    if-eqz v2, :cond_ad

    new-instance v8, Lwth;

    move-object/from16 v21, v1

    move-object/from16 v1, p3

    invoke-direct {v8, v1, v6}, Lwth;-><init>(Ljava/lang/Object;B)V

    move-object/from16 v22, v8

    goto :goto_b1

    :cond_ad
    move-object/from16 v21, v1

    move-object/from16 v22, v3

    :goto_b1
    new-instance v1, Lf62;

    const/4 v6, 0x0

    move-object v8, v3

    move-object/from16 v3, v18

    move-object/from16 v18, v15

    move-object/from16 v15, v21

    invoke-direct/range {v1 .. v6}, Lf62;-><init>(ZLyk6;Lcom/opera/android/settings/SettingsManager;Lekc;B)V

    const-string v2, "opera-aria://ui/"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v2

    const-string v5, "language"

    invoke-static {}, Lorg/chromium/base/LocaleUtils;->getDefaultLocaleString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    invoke-virtual {v2}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v2

    new-instance v5, Lrii;

    const/16 v6, 0x15

    invoke-direct {v5, v11, v6}, Lrii;-><init>(Ljava/lang/Object;B)V

    move-object v6, v8

    new-instance v8, Lp12;

    move-object/from16 v21, v9

    move-object v9, v10

    iget-object v10, v0, Lj62;->c:Lgjm;

    move-object/from16 v23, v11

    iget-object v11, v0, Lj62;->i:Lyv3;

    move-object/from16 p1, v1

    const/4 v1, 0x0

    invoke-direct/range {v8 .. v13}, Lp12;-><init>(Landroid/content/Context;Lgjm;Lyv3;Lqsh;Lg7m;)V

    new-instance v10, Lg62;

    invoke-direct {v10, v14, v1}, Lg62;-><init>(Lk42;B)V

    move-object/from16 v11, v18

    move-object/from16 v18, v3

    move-object/from16 v3, v21

    move-object/from16 v21, v10

    move-object v10, v2

    new-instance v2, Lhq3;

    new-instance v12, Lh62;

    invoke-direct {v12, v7, v14, v1}, Lh62;-><init>(Lxb;Lk42;B)V

    new-instance v1, Lhv;

    const/4 v7, 0x2

    invoke-direct {v1, v9, v15, v6, v7}, Lhv;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    move-object v14, v13

    iget-object v13, v0, Lj62;->g:Lcom/opera/android/Lazy;

    iget-object v6, v0, Lj62;->k:Lwyn;

    iget-object v7, v0, Lj62;->t:Lr2;

    iget-object v0, v0, Lj62;->o:Lyv3;

    move-object v9, v12

    move-object v12, v5

    move-object/from16 v5, v22

    move-object/from16 v22, v7

    move-object v7, v9

    move-object v9, v1

    move-object/from16 v16, v6

    move-object v15, v8

    move-object v6, v11

    move-object/from16 v8, p1

    move-object v11, v4

    move-object/from16 v4, v23

    move-object/from16 v23, v0

    invoke-direct/range {v2 .. v23}, Lhq3;-><init>(Lcom/opera/android/browser/WebContentsWrapper;La12;Lwth;Ll02;Lh62;Lf62;Lhv;Landroid/net/Uri;Lcom/opera/android/settings/SettingsManager;Lrii;Lcom/opera/android/Lazy;Lg7m;Lp12;Lwyn;Lky1;Lyk6;La52;Lqb;Lg62;Lr2;Lyv3;)V

    return-object v2
.end method

.method public final b()Lg7m;
    .registers 9

    new-instance v0, Lg7m;

    new-instance v5, Ld5o;

    iget-object v1, p0, Lj62;->o:Lyv3;

    invoke-virtual {v1}, Lyv3;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lru9;

    move-object v3, v2

    iget-object v2, p0, Lj62;->p:Lji;

    invoke-virtual {v2}, Lji;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorm;

    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    iput-object v3, v5, Ld5o;->a:Ljava/lang/Object;

    iput-object v4, v5, Ld5o;->b:Ljava/lang/Object;

    iget-object v4, v3, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v6, "ai.onboarding.session"

    const/4 v7, 0x0

    invoke-interface {v4, v6, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_40

    invoke-virtual {v3}, Lru9;->b()Lnv6;

    move-result-object v3

    iget-object v7, v3, Lnv6;->a:Ljava/lang/Object;

    check-cast v7, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v7, v6}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v3}, Lnv6;->w()V

    :try_start_35
    new-instance v3, Lorb;

    invoke-direct {v3, v4}, Lorb;-><init>(Ljava/lang/String;)V

    invoke-static {v3}, Lwyh;->w(Lorb;)Lgw0;

    move-result-object v3

    iput-object v3, v5, Ld5o;->c:Ljava/lang/Object;
    :try_end_40
    .catch Ljava/lang/Exception; {:try_start_35 .. :try_end_40} :catch_40

    :catch_40
    :cond_40
    iget-object v3, p0, Lj62;->q:Lji;

    iget-object v4, p0, Lj62;->r:Lzv3;

    invoke-direct/range {v0 .. v5}, Lg7m;-><init>(Lyv3;Lji;Lji;Lzv3;Ld5o;)V

    return-object v0
.end method
