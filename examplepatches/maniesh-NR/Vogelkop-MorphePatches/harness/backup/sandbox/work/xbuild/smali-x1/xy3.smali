.class public final Lxy3;
.super Ls62;
.source "SourceFile"


# instance fields
.field public final F:Z

.field public final G:Lm02;

.field public final H:Lhw3;

.field public final I:Likc;

.field public final J:Lwy3;

.field public K:Ll62;


# direct methods
.method public constructor <init>(Lcom/opera/android/browser/chromium/ChromiumContent;ZLm02;Lwth;Ll02;Lh62;Lf62;Lcom/opera/android/settings/SettingsManager;Lcom/opera/android/Lazy;Lg7m;Lp12;Lwyn;Lky1;Lyk6;La52;Lqb;Lg62;Lhw3;Lf9;Lr2;Lyv3;Landroid/content/res/Resources;)V
    .registers 44

    sget-object v1, Lt62;->b:Lt62;

    move-object/from16 v0, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    move-object/from16 v10, p10

    move-object/from16 v11, p11

    move-object/from16 v12, p12

    move-object/from16 v13, p13

    move-object/from16 v14, p14

    move-object/from16 v15, p15

    move-object/from16 v16, p16

    move-object/from16 v17, p17

    move-object/from16 v18, p19

    move-object/from16 v19, p20

    move-object/from16 v20, p21

    invoke-direct/range {v0 .. v20}, Ls62;-><init>(Lt62;Lcom/opera/android/browser/WebContentsWrapper;Ld12;Lwth;Ll02;Lkotlin/jvm/functions/Function1;Lf62;Lcom/opera/android/settings/SettingsManager;Lcom/opera/android/Lazy;Lg7m;Lp12;Lwyn;Lky1;Lyk6;La52;Lqb;Lesk;Lkotlin/jvm/functions/Function1;Lr2;Lyv3;)V

    move/from16 v1, p2

    iput-boolean v1, v0, Lxy3;->F:Z

    iput-object v3, v0, Lxy3;->G:Lm02;

    move-object/from16 v2, p18

    iput-object v2, v0, Lxy3;->H:Lhw3;

    new-instance v2, Likc;

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-direct {v2, v3}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v2, v0, Lxy3;->I:Likc;

    new-instance v2, Lwy3;

    move-object/from16 v3, p1

    invoke-direct {v2, v3, v0}, Lwy3;-><init>(Lcom/opera/android/browser/chromium/ChromiumContent;Lxy3;)V

    iput-object v2, v0, Lxy3;->J:Lwy3;

    const v2, 0x7f050013

    move-object/from16 v3, p22

    invoke-virtual {v3, v2}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    if-eqz v2, :cond_5b

    const/16 v2, 0xc8

    goto :goto_5d

    :cond_5b
    const/16 v2, 0x82

    :goto_5d
    const-string v3, "default_webpage_zoom"

    move-object/from16 v8, p8

    invoke-virtual {v8, v3}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result v3

    const/16 v4, 0x32

    invoke-static {v3, v4, v2}, Ldjh;->c(III)I

    move-result v2

    if-eqz v1, :cond_74

    invoke-static {}, LJ/N;->MGWafL4o()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/opera/android/browser/chromium/OperaBrowserContextHandle;

    goto :goto_7a

    :cond_74
    invoke-static {}, LJ/N;->M4QvXpDD()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/opera/android/browser/chromium/OperaBrowserContextHandle;

    :goto_7a
    invoke-static {v2}, Loup;->n0(I)D

    move-result-wide v2

    const-string v4, "opera-aria"

    const-string v5, "ui"

    invoke-static {v1, v4, v5, v2, v3}, LJ/N;->MdX$dmbm(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;D)V

    invoke-virtual {v0}, Ls62;->n()V

    invoke-virtual {v0}, Ls62;->j()V

    return-void
.end method


# virtual methods
.method public final b(Ll62;)V
    .registers 4

    iget-object v0, p0, Ls62;->b:Lcom/opera/android/browser/WebContentsWrapper;

    invoke-virtual {v0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v1

    invoke-interface {v1}, Lorg/chromium/content_public/browser/WebContents;->K0()Z

    move-result v1

    if-eqz v1, :cond_f

    iput-object p1, p0, Lxy3;->K:Ll62;

    return-void

    :cond_f
    invoke-virtual {v0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v0

    invoke-interface {v0}, Lorg/chromium/content_public/browser/WebContents;->s()Lorg/chromium/url/GURL;

    move-result-object v0

    invoke-static {v0}, Lz5i;->b0(Lorg/chromium/url/GURL;)Z

    move-result v0

    if-eqz v0, :cond_26

    invoke-virtual {p0}, Lxy3;->o()V

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p1, p0}, Ll62;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_26
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p1, p0}, Ll62;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final g()Likc;
    .registers 1

    iget-object p0, p0, Lxy3;->I:Likc;

    return-object p0
.end method

.method public final m()V
    .registers 1

    iget-object p0, p0, Lxy3;->J:Lwy3;

    invoke-virtual {p0}, Lrtn;->g()V

    return-void
.end method

.method public final o()V
    .registers 10

    iget-object v0, p0, Ls62;->b:Lcom/opera/android/browser/WebContentsWrapper;

    invoke-virtual {v0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v0

    invoke-interface {v0}, Lorg/chromium/content_public/browser/WebContents;->s()Lorg/chromium/url/GURL;

    move-result-object v0

    iget-object v0, v0, Lorg/chromium/url/GURL;->a:Ljava/lang/String;

    invoke-static {v0}, Lcom/opera/android/browser/BrowserUtils;->getRendererUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    iget-boolean v1, p0, Lxy3;->F:Z

    const/4 v2, 0x0

    if-nez v1, :cond_2d

    iget-object v1, p0, Lxy3;->H:Lhw3;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkul;

    iget-object v3, v1, Lkul;->c:La64;

    new-instance v4, Lful;

    const/4 v5, 0x0

    invoke-direct {v4, v1, v0, v2, v5}, Lful;-><init>(Lkul;Landroid/net/Uri;Lmt5;B)V

    const/4 v1, 0x3

    invoke-static {v3, v2, v2, v4, v1}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    :cond_2d
    const-string v1, "s"

    invoke-static {v0, v1}, Lwqm;->m(Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_7f

    const-string v1, "q"

    invoke-static {v0, v1}, Lwqm;->m(Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_41

    const-string v1, ""

    move-object v5, v1

    goto :goto_42

    :cond_41
    move-object v5, v0

    :goto_42
    new-instance v7, Lcv2;

    const/16 v1, 0xa

    invoke-direct {v7, v0, p0, v1}, Lcv2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v0, p0, Lxy3;->G:Lm02;

    iget-object v1, v0, Lm02;->e:Ljava/lang/String;

    invoke-virtual {v4, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5d

    iget-object v1, v0, Lf12;->a:Ld12;

    if-eqz v1, :cond_5d

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v7, p0}, Lcv2;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_5d
    iput-object v2, v0, Lf12;->a:Ld12;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Lf12;->b:Ljava/util/ArrayList;

    iput-object v4, v0, Lm02;->e:Ljava/lang/String;

    iget-object v3, v0, Lm02;->c:Ll32;

    new-instance v8, Lpa;

    const/16 v1, 0x17

    invoke-direct {v8, v0, v1}, Lpa;-><init>(Ljava/lang/Object;B)V

    iget-boolean v6, p0, Lxy3;->F:Z

    invoke-virtual/range {v3 .. v8}, Ll32;->a(Ljava/lang/String;Ljava/lang/String;ZLcv2;Lpa;)Ld12;

    move-result-object p0

    invoke-virtual {v0, p0}, Lf12;->i(Ld12;)V

    iget-object p0, v0, Lm02;->d:Lq2;

    invoke-virtual {p0}, Lq2;->invoke()Ljava/lang/Object;

    :cond_7f
    return-void
.end method

.method public final p(Z)V
    .registers 4

    iget-object v0, p0, Lxy3;->K:Ll62;

    if-nez v0, :cond_5

    return-void

    :cond_5
    const/4 v1, 0x0

    iput-object v1, p0, Lxy3;->K:Ll62;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {v0, p0}, Ll62;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
