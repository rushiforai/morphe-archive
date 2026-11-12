.class public final Lb22;
.super Lx22;
.source "SourceFile"


# instance fields
.field public final A:Ldu3;

.field public final B:Lji;

.field public final C:Lzv3;

.field public final D:Lcom/opera/android/Lazy;

.field public final E:Lj4c;

.field public final F:Lrw3;

.field public final G:Ldu3;

.field public final H:Lgjm;

.field public final I:Lhw3;

.field public final v:Lcom/opera/android/BrowserActivity;

.field public final w:Ltcc;

.field public final x:Lzv3;

.field public final y:Lzv3;

.field public final z:Ldu3;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lk6l;Ltcc;Ldll;Lzv3;Lzv3;Ldu3;Ldu3;Ldu3;Lji;Lzv3;Lcom/opera/android/Lazy;Lrvg;Lcom/opera/android/Lazy;Landroid/view/ViewGroup;Lwv1;Lj4c;Lrw3;Ldu3;Lgjm;Lhw3;Ly22;Lji;Lj4c;Lqim;)V
    .registers 40

    move-object v0, p0

    move-object v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p8

    move-object/from16 v6, p13

    move-object/from16 v7, p14

    move-object/from16 v8, p15

    move-object/from16 v9, p16

    move-object/from16 v10, p22

    move-object/from16 v11, p23

    move-object/from16 v12, p24

    move-object/from16 v13, p25

    invoke-direct/range {v0 .. v13}, Lx22;-><init>(Lcom/opera/android/BrowserActivity;Lk6l;Ltcc;Ldll;Lesk;Lrvg;Lcom/opera/android/Lazy;Landroid/view/ViewGroup;Lwv1;Ly22;Lesk;Lj4c;Lqim;)V

    iput-object p1, p0, Lb22;->v:Lcom/opera/android/BrowserActivity;

    iput-object v3, p0, Lb22;->w:Ltcc;

    move-object/from16 p1, p5

    iput-object p1, p0, Lb22;->x:Lzv3;

    move-object/from16 p1, p6

    iput-object p1, p0, Lb22;->y:Lzv3;

    move-object/from16 p1, p7

    iput-object p1, p0, Lb22;->z:Ldu3;

    move-object/from16 p1, p9

    iput-object p1, p0, Lb22;->A:Ldu3;

    move-object/from16 p1, p10

    iput-object p1, p0, Lb22;->B:Lji;

    move-object/from16 p1, p11

    iput-object p1, p0, Lb22;->C:Lzv3;

    move-object/from16 p1, p12

    iput-object p1, p0, Lb22;->D:Lcom/opera/android/Lazy;

    move-object/from16 p1, p17

    iput-object p1, p0, Lb22;->E:Lj4c;

    move-object/from16 p1, p18

    iput-object p1, p0, Lb22;->F:Lrw3;

    move-object/from16 p1, p19

    iput-object p1, p0, Lb22;->G:Ldu3;

    move-object/from16 p1, p20

    iput-object p1, p0, Lb22;->H:Lgjm;

    move-object/from16 p1, p21

    iput-object p1, p0, Lb22;->I:Lhw3;

    return-void
.end method


# virtual methods
.method public final a(Lb2l;Lm02;Lv22;Lu22;Lq2;)Lr22;
    .registers 51

    move-object/from16 v0, p0

    move-object/from16 v5, p2

    invoke-static/range {p1 .. p1}, Luy3;->H(Lb2l;)Lcom/opera/android/browser/chromium/ChromiumContent;

    move-result-object v3

    if-eqz v3, :cond_233

    move-object/from16 v4, p1

    check-cast v4, Ld7l;

    iget-object v6, v4, Ld7l;->j:Le7l;

    invoke-interface {v6}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/opera/android/browser/BrowserUtils;->b(Ljava/lang/String;)Lzg;

    move-result-object v6

    if-eqz v6, :cond_1e

    iget v6, v6, Lzg;->a:I

    if-nez v6, :cond_1f

    :cond_1e
    const/4 v6, 0x2

    :cond_1f
    iget-object v7, v0, Lb22;->x:Lzv3;

    invoke-virtual {v7}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lj62;

    iget-object v8, v4, Ld7l;->j:Le7l;

    invoke-interface {v8}, Lb9l;->m()Z

    move-result v10

    new-instance v8, Lf9;

    const/4 v15, 0x7

    move-object/from16 v9, p5

    invoke-direct {v8, v0, v5, v9, v15}, Lf9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v9, v7, Lj62;->a:Ldx3;

    iget-object v11, v7, Lj62;->c:Lgjm;

    iget-object v12, v7, Lj62;->e:Lj4c;

    invoke-virtual {v12}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v12

    move-object/from16 v16, v12

    check-cast v16, Lyk6;

    iget-object v12, v7, Lj62;->f:Lj4c;

    invoke-virtual {v12}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v12

    move-object/from16 v22, v12

    check-cast v22, La52;

    iget-object v12, v7, Lj62;->g:Lcom/opera/android/Lazy;

    iget-object v13, v7, Lj62;->h:Lwv1;

    iget-object v13, v13, Lwv1;->b:Lb6h;

    invoke-interface {v13}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lxb;

    iget-object v14, v7, Lj62;->d:Lji;

    iget-object v14, v14, Lji;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v14}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v14

    invoke-virtual {v7}, Lj62;->b()Lg7m;

    move-result-object v21

    iget-object v2, v7, Lj62;->i:Lyv3;

    iget-object v15, v7, Lj62;->j:Lyv3;

    invoke-virtual {v15}, Lyv3;->get()Ljava/lang/Object;

    move-result-object v15

    move-object/from16 v20, v15

    check-cast v20, Lqsh;

    iget-object v15, v7, Lj62;->k:Lwyn;

    move-object/from16 v19, v2

    iget-object v2, v7, Lj62;->s:Lj4c;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lky1;

    move-object/from16 p5, v2

    iget-object v2, v7, Lj62;->l:Lzv3;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lk42;

    move-object/from16 v25, v3

    iget-object v3, v7, Lj62;->m:Lzv3;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ll02;

    move-object/from16 v26, v3

    iget-object v3, v7, Lj62;->n:Lzv3;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lqb;

    move-object/from16 v17, v14

    iget-object v14, v7, Lj62;->t:Lr2;

    move-object/from16 v27, v3

    iget-object v3, v7, Lj62;->u:Lzyk;

    invoke-virtual {v3}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lekc;

    iget-object v7, v7, Lj62;->o:Lyv3;

    move/from16 v28, v6

    new-instance v6, Lwth;

    move-object/from16 v18, v3

    const/16 v3, 0xa

    invoke-direct {v6, v5, v3}, Lwth;-><init>(Ljava/lang/Object;B)V

    move-object v3, v9

    new-instance v9, Lf62;

    move-object/from16 v29, v14

    const/4 v14, 0x1

    move-object/from16 v30, v22

    move-object/from16 v22, v29

    move-object/from16 v29, v12

    move-object/from16 v12, v17

    move-object/from16 v17, v3

    move-object v3, v13

    move-object/from16 v13, v18

    move-object/from16 v18, v11

    move-object/from16 v11, v16

    invoke-direct/range {v9 .. v14}, Lf62;-><init>(ZLyk6;Lcom/opera/android/settings/SettingsManager;Lekc;B)V

    new-instance v13, Lp12;

    move-object/from16 v16, v13

    invoke-direct/range {v16 .. v21}, Lp12;-><init>(Landroid/content/Context;Lgjm;Lyv3;Lqsh;Lg7m;)V

    move-object/from16 v14, v21

    move-object/from16 v16, v4

    new-instance v4, Lg62;

    const/4 v1, 0x1

    invoke-direct {v4, v2, v1}, Lg62;-><init>(Lk42;B)V

    invoke-virtual/range {v17 .. v17}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object v17

    new-instance v34, Lxy3;

    move-object/from16 v21, v8

    new-instance v8, Lh62;

    invoke-direct {v8, v3, v2, v1}, Lh62;-><init>(Lxb;Lk42;B)V

    iget-object v2, v0, Lb22;->I:Lhw3;

    move-object/from16 v1, p4

    move-object/from16 v20, v2

    move-object/from16 v19, v4

    move-object/from16 v23, v7

    move v4, v10

    move-object v10, v12

    move-object v12, v14

    move-object v14, v15

    move-object/from16 v42, v16

    move-object/from16 v24, v17

    move-object/from16 v3, v25

    move-object/from16 v7, v26

    move-object/from16 v18, v27

    move/from16 v43, v28

    move-object/from16 v17, v30

    move-object/from16 v2, v34

    move-object/from16 v15, p5

    move-object/from16 v16, v11

    move-object/from16 v11, v29

    invoke-direct/range {v2 .. v24}, Lxy3;-><init>(Lcom/opera/android/browser/chromium/ChromiumContent;ZLm02;Lwth;Ll02;Lh62;Lf62;Lcom/opera/android/settings/SettingsManager;Lcom/opera/android/Lazy;Lg7m;Lp12;Lwyn;Lky1;Lyk6;La52;Lqb;Lg62;Lhw3;Lf9;Lr2;Lyv3;Landroid/content/res/Resources;)V

    move-object v14, v12

    new-instance v4, Lga7;

    invoke-virtual {v3}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v5

    invoke-interface {v5}, Lorg/chromium/content_public/browser/WebContents;->J0()Lorg/chromium/ui/base/ViewAndroidDelegate;

    move-result-object v5

    iget-object v5, v5, Lorg/chromium/ui/base/ViewAndroidDelegate;->b:Lxr5;

    invoke-direct {v4, v5}, Lga7;-><init>(Landroid/view/View;)V

    invoke-virtual {v0}, Lx22;->c()Lmlj;

    move-result-object v10

    new-instance v11, Lwx;

    const/16 v4, 0x9

    move-object/from16 v5, p1

    invoke-direct {v11, v0, v5, v4}, Lwx;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v4, v0, Lb22;->C:Lzv3;

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    move-object v15, v4

    check-cast v15, Lk42;

    iget-object v4, v0, Lx22;->k:Lzyk;

    invoke-virtual {v4}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v16, v4

    check-cast v16, Lv5n;

    new-instance v4, Lvy3;

    move-object v6, v4

    new-instance v4, Lfx0;

    const/4 v7, 0x7

    invoke-direct {v4, v1, v0, v7}, Lfx0;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v8, Lg9;

    const/4 v9, 0x3

    invoke-direct {v8, v1, v5, v0, v9}, Lg9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    move-object v1, v6

    new-instance v6, Lf23;

    const/4 v9, 0x5

    invoke-direct {v6, v0, v5, v3, v9}, Lf23;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v9, Lfx0;

    const/16 v12, 0x8

    invoke-direct {v9, v0, v5, v12}, Lfx0;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v12, Lwhf;

    invoke-direct {v12, v3, v7}, Lwhf;-><init>(Ljava/lang/Object;B)V

    iget-object v2, v0, Lb22;->v:Lcom/opera/android/BrowserActivity;

    move-object v5, v8

    iget-object v8, v0, Lb22;->D:Lcom/opera/android/Lazy;

    move-object v7, v9

    iget-object v9, v0, Lb22;->z:Ldu3;

    iget-object v13, v0, Lb22;->B:Lji;

    iget-object v3, v0, Lb22;->H:Lgjm;

    move-object/from16 v17, p2

    move-object/from16 v18, v3

    move-object/from16 v0, v34

    move-object/from16 v3, p3

    invoke-direct/range {v1 .. v18}, Lvy3;-><init>(Landroid/content/Context;Lv22;Lfx0;Lg9;Lf23;Lfx0;Lcom/opera/android/Lazy;Ldu3;Lmlj;Lwx;Lwhf;Lji;Lg7m;Lk42;Lv5n;Lm02;Lgjm;)V

    invoke-virtual {v3}, Lv22;->getLifecycle()Ltcc;

    move-result-object v2

    new-instance v4, Ld62;

    const/4 v5, 0x1

    invoke-direct {v4, v0, v1, v5}, Ld62;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2, v4}, Ltcc;->a(Lmdc;)V

    iget-object v1, v0, Ls62;->m:Lz;

    move-object/from16 v2, p0

    iget-object v4, v2, Lb22;->w:Ltcc;

    invoke-virtual {v1, v4}, Lz;->t(Ltcc;)V

    invoke-virtual {v0}, Ls62;->f()Lqyj;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v6, Lob;

    const/16 v7, 0x10

    invoke-direct {v6, v1, v7}, Lob;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v4, v6}, Ltcc;->a(Lmdc;)V

    new-instance v31, Lvsn;

    new-instance v1, Lize;

    move-object/from16 v6, v42

    iget-object v6, v6, Ld7l;->j:Le7l;

    invoke-interface {v6}, Lb9l;->m()Z

    move-result v6

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    invoke-direct {v1, v6}, Lekc;-><init>(Ljava/lang/Object;)V

    iget-object v6, v2, Lb22;->v:Lcom/opera/android/BrowserActivity;

    invoke-static {v6}, Lr9n;->A(Landroid/content/Context;)Z

    move-result v33

    new-instance v6, Lz12;

    const/4 v7, 0x0

    invoke-direct {v6, v2, v0, v7}, Lz12;-><init>(Lb22;Lxy3;B)V

    new-instance v8, Lz12;

    invoke-direct {v8, v2, v0, v5}, Lz12;-><init>(Lb22;Lxy3;B)V

    new-instance v9, Lvx;

    const/4 v10, 0x7

    invoke-direct {v9, v2, v10}, Lvx;-><init>(Ljava/lang/Object;B)V

    iget-object v11, v2, Lb22;->E:Lj4c;

    invoke-virtual {v11}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lyk6;

    iget-object v11, v11, Lyk6;->k:Lkze;

    new-instance v12, Lq02;

    invoke-direct {v12, v2, v10}, Lq02;-><init>(Ljava/lang/Object;B)V

    iget-object v10, v2, Lb22;->F:Lrw3;

    invoke-virtual {v10}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v10

    move-object/from16 v40, v10

    check-cast v40, Lurn;

    iget-object v10, v2, Lb22;->G:Ldu3;

    move-object/from16 v32, v1

    move-object/from16 v35, v6

    move-object/from16 v36, v8

    move-object/from16 v37, v9

    move-object/from16 v41, v10

    move-object/from16 v38, v11

    move-object/from16 v39, v12

    invoke-direct/range {v31 .. v41}, Lvsn;-><init>(Lize;ZLs62;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lesk;Lkze;Ljava/lang/Runnable;Lurn;Lesk;)V

    move-object/from16 v1, v31

    iget-object v6, v1, Lvsn;->q:Lwnm;

    invoke-static {v6}, Lxf8;->B(Likc;)Ltsd;

    move-result-object v6

    new-instance v8, Ly12;

    invoke-direct {v8, v2, v7}, Ly12;-><init>(Lb22;B)V

    new-instance v7, Lpb;

    const/16 v9, 0xb

    invoke-direct {v7, v8, v9}, Lpb;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v6, v3, v7}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v3, v3, Lv22;->f:Lqdc;

    invoke-static {v3}, Lcqp;->V(Ltcc;)Lddc;

    move-result-object v3

    new-instance v6, Lc71;

    const/4 v7, 0x0

    invoke-direct {v6, v2, v1, v7, v5}, Lc71;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    iget-object v7, v1, Lvsn;->p:Lrlh;

    invoke-static {v7, v3, v6}, Lw7d;->i(Lf99;Lnx5;Lkotlin/jvm/functions/Function2;)Ld3k;

    new-instance v3, Lob;

    invoke-direct {v3, v0, v5}, Lob;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v4, v3}, Ltcc;->a(Lmdc;)V

    new-instance v3, La22;

    move/from16 v6, v43

    invoke-direct {v3, v2, v0, v1, v6}, La22;-><init>(Lb22;Lxy3;Lvsn;I)V

    return-object v3

    :cond_233
    const/4 v7, 0x0

    return-object v7
.end method

.method public final h(Lr22;)V
    .registers 6

    instance-of v0, p1, La22;

    if-eqz v0, :cond_65

    move-object v0, p1

    check-cast v0, La22;

    iget-object v1, v0, La22;->f:Lvsn;

    iget-object v2, v1, Lvsn;->l:Lkze;

    sget-object v3, Lng;->a:Lng;

    invoke-virtual {v2, v3}, Lekc;->r(Ljava/lang/Object;)V

    iget v0, v0, La22;->g:I

    const/4 v2, 0x5

    if-ne v0, v2, :cond_18

    sget-object v0, Lnv0;->e:Lnv0;

    goto :goto_1a

    :cond_18
    sget-object v0, Lnv0;->d:Lnv0;

    :goto_1a
    sget-object v2, Lcsn;->a:Lcsn;

    const/4 v3, 0x0

    invoke-virtual {v1, v0, v2, v3}, Lvsn;->e(Lnv0;Ljoh;Lfw0;)V

    invoke-virtual {p1}, Lr22;->l()V

    iget-object p1, v1, Lvsn;->c:Ls62;

    invoke-virtual {p1}, Ls62;->f()Lqyj;

    move-result-object p1

    iget-object p1, p1, Lqyj;->i:Lode;

    iget-object p0, p0, Lx22;->l:Lmrn;

    iget-object v0, p0, Lmrn;->z:Lndc;

    if-eqz v0, :cond_65

    iget-object p0, p0, Lmrn;->u:Lxbf;

    iget-object v1, p0, Lxbf;->f:Ljava/lang/Object;

    check-cast v1, Lvbn;

    invoke-interface {v1, v0, p1}, Lvbn;->i(Lndc;Lode;)Z

    move-result v1

    if-nez v1, :cond_65

    iget-object v1, p0, Lxbf;->f:Ljava/lang/Object;

    check-cast v1, Lvbn;

    invoke-interface {v1}, Lvbn;->destroy()V

    new-instance v1, Lplk;

    invoke-direct {v1, p0, v0, p1}, Lplk;-><init>(Lxbf;Lndc;Lode;)V

    iput-object v1, p0, Lxbf;->f:Ljava/lang/Object;

    invoke-virtual {v1}, Lplk;->j()Lo2g;

    move-result-object p1

    iget-object v0, p0, Lxbf;->c:Ljava/lang/Object;

    check-cast v0, Lo2g;

    if-eq p1, v0, :cond_65

    iput-object p1, p0, Lxbf;->c:Ljava/lang/Object;

    iget-object v0, p0, Lxbf;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    invoke-virtual {v0}, Ln2d;->invalidate()V

    iget-object p1, p1, Lo2g;->c:Ljava/lang/Object;

    check-cast p1, Ls75;

    invoke-virtual {p0, p1, v3}, Lxbf;->E(Ls75;Ljava/lang/Runnable;)V

    :cond_65
    return-void
.end method
