.class public final Lzqc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Llkf;


# instance fields
.field public final a:Ldx3;

.field public final b:Ldw3;

.field public final c:Lj4c;

.field public final d:Ldw3;

.field public final e:Ldw3;

.field public final f:Lew3;

.field public final g:Lew3;

.field public final h:Lwyn;

.field public final i:Lumi;

.field public final j:Ldw3;

.field public final k:Ldw3;

.field public final l:Ldw3;

.field public final m:Ldw3;

.field public final n:Ldw3;

.field public final o:Lzyk;

.field public final p:Lzyk;

.field public final q:Lzyk;


# direct methods
.method public constructor <init>(Ldx3;Ldw3;Lj4c;Ldw3;Luu1;Ldw3;Lew3;Lew3;Lwyn;Lumi;Ldw3;Ldw3;Ldw3;Ldw3;Ldw3;)V
    .registers 16

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lzqc;->a:Ldx3;

    iput-object p2, p0, Lzqc;->b:Ldw3;

    iput-object p3, p0, Lzqc;->c:Lj4c;

    iput-object p4, p0, Lzqc;->d:Ldw3;

    iput-object p6, p0, Lzqc;->e:Ldw3;

    iput-object p7, p0, Lzqc;->f:Lew3;

    iput-object p8, p0, Lzqc;->g:Lew3;

    iput-object p9, p0, Lzqc;->h:Lwyn;

    iput-object p10, p0, Lzqc;->i:Lumi;

    iput-object p11, p0, Lzqc;->j:Ldw3;

    iput-object p12, p0, Lzqc;->k:Ldw3;

    iput-object p13, p0, Lzqc;->l:Ldw3;

    iput-object p14, p0, Lzqc;->m:Ldw3;

    iput-object p15, p0, Lzqc;->n:Ldw3;

    new-instance p1, Lxqc;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lxqc;-><init>(Lzqc;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lzqc;->o:Lzyk;

    new-instance p1, Lxqc;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Lxqc;-><init>(Lzqc;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lzqc;->p:Lzyk;

    new-instance p1, Lxqc;

    const/4 p2, 0x2

    invoke-direct {p1, p0, p2}, Lxqc;-><init>(Lzqc;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lzqc;->q:Lzyk;

    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Class;)Landroidx/fragment/app/Fragment;
    .registers 28

    move-object/from16 v0, p0

    const-class v1, Llrc;

    move-object/from16 v2, p1

    invoke-static {v2, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_157

    iget-object v1, v0, Lzqc;->p:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lvrc;

    iget-object v3, v0, Lzqc;->g:Lew3;

    invoke-virtual {v3}, Lew3;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    iget-object v4, v1, Lvrc;->a:Ldx3;

    const-string v5, "#"

    filled-new-array {v5}, [Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x6

    const-string v7, ""

    const/4 v8, 0x0

    invoke-static {v7, v5, v8, v6}, Lkotlin/text/StringsKt;->Y(Ljava/lang/CharSequence;[Ljava/lang/String;II)Ljava/util/List;

    move-result-object v5

    const-string v6, "opera-livescore://ui/"

    invoke-static {v6}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    invoke-virtual {v6}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v6

    invoke-static {v5}, Lkotlin/collections/CollectionsKt;->K(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-virtual {v6, v9}, Landroid/net/Uri$Builder;->encodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v6

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v9

    const/4 v10, 0x1

    if-le v9, v10, :cond_55

    invoke-interface {v5, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v6, v5}, Landroid/net/Uri$Builder;->encodedFragment(Ljava/lang/String;)Landroid/net/Uri$Builder;

    :cond_55
    invoke-virtual {v6}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v5

    iget-object v6, v1, Lvrc;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v4}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v5}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v10

    if-nez v10, :cond_66

    move-object v10, v7

    :cond_66
    invoke-virtual {v5}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_6d

    move-object v7, v5

    :cond_6d
    const v5, 0x7f050013

    invoke-virtual {v9, v5}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v5

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v9

    if-eqz v9, :cond_a9

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v9

    if-eqz v9, :cond_a9

    if-eqz v5, :cond_85

    const/16 v5, 0xc8

    goto :goto_87

    :cond_85
    const/16 v5, 0x82

    :goto_87
    const-string v9, "default_webpage_zoom"

    invoke-virtual {v6, v9}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result v6

    const/16 v9, 0x32

    invoke-static {v6, v9, v5}, Ldjh;->c(III)I

    move-result v5

    if-eqz v3, :cond_9c

    invoke-static {}, LJ/N;->MGWafL4o()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/opera/android/browser/chromium/OperaBrowserContextHandle;

    goto :goto_a2

    :cond_9c
    invoke-static {}, LJ/N;->M4QvXpDD()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/opera/android/browser/chromium/OperaBrowserContextHandle;

    :goto_a2
    invoke-static {v5}, Loup;->n0(I)D

    move-result-wide v11

    invoke-static {v6, v10, v7, v11, v12}, LJ/N;->MdX$dmbm(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;D)V

    :cond_a9
    invoke-static {v3, v8}, LJ/N;->M_FZHKB_(ZZ)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/chromium/content_public/browser/WebContents;

    new-instance v6, Lcom/opera/android/browser/WebContentsWrapper;

    iget-object v5, v4, Ldx3;->j:Lqi;

    const/4 v7, 0x7

    invoke-direct {v6, v5, v3, v7}, Lcom/opera/android/browser/WebContentsWrapper;-><init>(Lqi;Lorg/chromium/content_public/browser/WebContents;I)V

    invoke-virtual {v6, v2}, Lcom/opera/android/browser/WebContentsWrapper;->g(Lqq6;)V

    iget-object v9, v1, Lvrc;->b:Lcom/opera/android/settings/SettingsManager;

    sget-object v2, Ldp7;->a:Ld06;

    iget-object v3, v2, Ld06;->a:Ljava/lang/Object;

    check-cast v3, Lz8b;

    iget-object v5, v3, Lz8b;->a:Ljava/lang/Object;

    check-cast v5, Lua7;

    if-eqz v5, :cond_cb

    invoke-virtual {v5, v4}, Lua7;->C(Lxd5;)V

    :cond_cb
    invoke-virtual {v3, v4}, Lz8b;->E(Landroid/content/ContextWrapper;)Lcp7;

    move-result-object v10

    iget-object v11, v1, Lvrc;->c:Lj4c;

    iget-object v12, v1, Lvrc;->e:Lorm;

    iget-object v13, v1, Lvrc;->f:Lwyn;

    iget-object v14, v1, Lvrc;->g:Lvx;

    iget-object v3, v1, Lvrc;->h:Ldw3;

    invoke-virtual {v3}, Ldw3;->get()Ljava/lang/Object;

    move-result-object v3

    move-object v15, v3

    check-cast v15, Lcs6;

    iget-object v3, v1, Lvrc;->i:Ldw3;

    invoke-virtual {v3}, Ldw3;->get()Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v16, v3

    check-cast v16, Lxoc;

    iget-object v3, v1, Lvrc;->j:Ldw3;

    iget-object v4, v1, Lvrc;->k:Ldw3;

    new-instance v18, Lurc;

    new-instance v7, Lg8c;

    invoke-direct {v7, v1}, Lg8c;-><init>(Lvrc;)V

    new-instance v8, Lrkc;

    const/16 v5, 0x9

    invoke-direct {v8, v1, v5}, Lrkc;-><init>(Ljava/lang/Object;B)V

    move-object/from16 v17, v3

    move-object/from16 v5, v18

    move-object/from16 v18, v4

    invoke-direct/range {v5 .. v18}, Lurc;-><init>(Lcom/opera/android/browser/WebContentsWrapper;Lg8c;Lrkc;Lcom/opera/android/settings/SettingsManager;Lcp7;Lj4c;Lorm;Lwyn;Lvx;Lcs6;Lxoc;Ldw3;Ldw3;)V

    new-instance v17, Llrc;

    new-instance v1, Lqrc;

    iget-object v2, v2, Ld06;->a:Ljava/lang/Object;

    check-cast v2, Lz8b;

    iget-object v3, v2, Lz8b;->a:Ljava/lang/Object;

    check-cast v3, Lua7;

    iget-object v4, v0, Lzqc;->a:Ldx3;

    if-eqz v3, :cond_118

    invoke-virtual {v3, v4}, Lua7;->C(Lxd5;)V

    :cond_118
    invoke-virtual {v2, v4}, Lz8b;->E(Landroid/content/ContextWrapper;)Lcp7;

    move-result-object v2

    new-instance v3, Ldnb;

    const/16 v6, 0xc

    invoke-direct {v3, v4, v6}, Ldnb;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v1, v5, v2, v3}, Lqrc;-><init>(Lurc;Lcp7;Ldnb;)V

    iget-object v2, v0, Lzqc;->q:Lzyk;

    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v20, v2

    check-cast v20, Lwll;

    iget-object v2, v0, Lzqc;->n:Ldw3;

    iget-object v2, v2, Ldw3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->B()Lqwe;

    move-result-object v21

    new-instance v2, Lyqc;

    invoke-direct {v2, v5}, Lyqc;-><init>(Lurc;)V

    iget-object v3, v0, Lzqc;->e:Ldw3;

    invoke-virtual {v3}, Ldw3;->get()Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v25, v3

    check-cast v25, Lorm;

    iget-object v0, v0, Lzqc;->f:Lew3;

    sget-object v24, Lu55;->Ro:Lulp;

    move-object/from16 v22, v0

    move-object/from16 v19, v1

    move-object/from16 v23, v2

    move-object/from16 v18, v5

    invoke-direct/range {v17 .. v25}, Llrc;-><init>(Lurc;Lqrc;Lwll;Lqwe;Lew3;Lyqc;Lu55;Lorm;)V

    return-object v17

    :cond_157
    return-object v2
.end method
