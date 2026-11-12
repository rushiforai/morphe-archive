.class public final Lt42;
.super Lx22;
.source "SourceFile"


# instance fields
.field public final A:Lgv3;

.field public final B:Lgv3;

.field public final C:Lji;

.field public final D:Lzv3;

.field public final E:Lj4c;

.field public final F:Lrw3;

.field public final G:Lgv3;

.field public final H:Lgjm;

.field public final I:Lqwe;

.field public final J:Lwll;

.field public final K:Lkze;

.field public final L:Ls42;

.field public final v:Lcom/opera/android/BrowserActivity;

.field public final w:Lei;

.field public final x:Ltcc;

.field public final y:Lzv3;

.field public final z:Lzv3;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lei;Lk6l;Ltcc;Ldll;Lzv3;Lzv3;Lgv3;Lgv3;Lgv3;Lji;Lzv3;Lcom/opera/android/Lazy;Lwv1;Lj4c;Lrw3;Lgv3;Lgjm;Ly22;Lji;Lj4c;Lqim;Lqwe;)V
    .registers 40

    move-object/from16 v14, p2

    iget-object v0, v14, Lei;->f:Ljava/lang/Object;

    move-object v6, v0

    check-cast v6, Lrvg;

    iget-object v0, v14, Lei;->g:Landroid/view/View;

    move-object v15, v0

    check-cast v15, Lcom/opera/android/webaiassistant/WebAiAssistantLayoutSwitcher;

    iget-object v0, v14, Lei;->c:Landroid/view/View;

    move-object v8, v0

    check-cast v8, Lcom/opera/android/sheet/VelocityTrackingCoordinatorLayout;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    move-object/from16 v4, p5

    move-object/from16 v5, p9

    move-object/from16 v7, p13

    move-object/from16 v9, p14

    move-object/from16 v10, p19

    move-object/from16 v11, p20

    move-object/from16 v12, p21

    move-object/from16 v13, p22

    invoke-direct/range {v0 .. v13}, Lx22;-><init>(Lcom/opera/android/BrowserActivity;Lk6l;Ltcc;Ldll;Lesk;Lrvg;Lcom/opera/android/Lazy;Landroid/view/ViewGroup;Lwv1;Ly22;Lesk;Lj4c;Lqim;)V

    iput-object v1, v0, Lt42;->v:Lcom/opera/android/BrowserActivity;

    iput-object v14, v0, Lt42;->w:Lei;

    iput-object v3, v0, Lt42;->x:Ltcc;

    move-object/from16 v2, p6

    iput-object v2, v0, Lt42;->y:Lzv3;

    move-object/from16 v2, p7

    iput-object v2, v0, Lt42;->z:Lzv3;

    move-object/from16 v2, p8

    iput-object v2, v0, Lt42;->A:Lgv3;

    move-object/from16 v2, p10

    iput-object v2, v0, Lt42;->B:Lgv3;

    move-object/from16 v2, p11

    iput-object v2, v0, Lt42;->C:Lji;

    move-object/from16 v2, p12

    iput-object v2, v0, Lt42;->D:Lzv3;

    move-object/from16 v2, p15

    iput-object v2, v0, Lt42;->E:Lj4c;

    move-object/from16 v2, p16

    iput-object v2, v0, Lt42;->F:Lrw3;

    move-object/from16 v2, p17

    iput-object v2, v0, Lt42;->G:Lgv3;

    move-object/from16 v2, p18

    iput-object v2, v0, Lt42;->H:Lgjm;

    move-object/from16 v2, p23

    iput-object v2, v0, Lt42;->I:Lqwe;

    new-instance v2, Lwll;

    invoke-direct {v2, v1}, Lwll;-><init>(Ldx3;)V

    iput-object v2, v0, Lt42;->J:Lwll;

    new-instance v1, Lkze;

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {v1, v2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v1, v0, Lt42;->K:Lkze;

    new-instance v2, Ls42;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v2, v0, Lt42;->L:Ls42;

    iget-object v2, v14, Lei;->i:Landroid/view/View;

    check-cast v2, Lcom/opera/android/webcore/FastResizeWebViewContainer;

    invoke-virtual {v2, v1}, Lcom/opera/android/webcore/FastResizeWebViewContainer;->c(Lkze;)V

    iget-object v1, v14, Lei;->e:Landroid/view/View;

    check-cast v1, Lcom/opera/android/widget/MeasurableHeightScrollView;

    invoke-static {v1}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->C(Landroid/view/View;)Lcom/opera/android/sheet/OperaBottomSheetBehavior;

    move-result-object v2

    new-instance v4, Lr42;

    const/4 v5, 0x0

    invoke-direct {v4, v0, v5}, Lr42;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2, v4}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->x(Lnjf;)V

    new-instance v2, Lvl6;

    new-instance v4, Leme;

    invoke-direct {v4, v0}, Leme;-><init>(Ljava/lang/Object;)V

    const/4 v6, 0x4

    invoke-direct {v2, v1, v6, v4}, Lvl6;-><init>(Landroidx/core/widget/NestedScrollView;ILnj8;)V

    iget-object v4, v2, Lvl6;->b:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/sheet/OperaBottomSheetBehavior;

    sget-object v6, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->O:Lsv2;

    iput-object v6, v4, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->a:Lsv2;

    const/4 v6, 0x1

    iput-boolean v6, v4, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->p:Z

    invoke-virtual {v3, v2}, Ltcc;->a(Lmdc;)V

    iget-object v2, v14, Lei;->b:Landroid/view/ViewGroup;

    check-cast v2, Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance v3, Lm42;

    invoke-direct {v3, v0, v5}, Lm42;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iput-boolean v5, v1, Lcom/opera/android/widget/MeasurableHeightScrollView;->L:Z

    new-instance v1, Lga7;

    invoke-virtual {v15, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/webcore/FastResizeWebViewContainer;

    invoke-direct {v1, v2}, Lga7;-><init>(Landroid/view/View;)V

    invoke-virtual {v15}, Lcom/opera/android/webaiassistant/WebAiAssistantLayoutSwitcher;->c()Ljrc;

    move-result-object v1

    iget-object v1, v1, Ljrc;->c:Lcom/google/android/material/button/MaterialButton;

    new-instance v2, Lgf;

    const/16 v3, 0xd

    invoke-direct {v2, v0, v3}, Lgf;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v15}, Lcom/opera/android/webaiassistant/WebAiAssistantLayoutSwitcher;->a()Ljrc;

    move-result-object v1

    iget-object v1, v1, Ljrc;->c:Lcom/google/android/material/button/MaterialButton;

    new-instance v2, Ln42;

    invoke-direct {v2, v0, v5}, Ln42;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public final a(Lb2l;Lm02;Lv22;Lu22;Lq2;)Lr22;
    .registers 26

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lt42;->y:Lzv3;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lj62;

    move-object v3, v1

    check-cast v3, Ld7l;

    iget-object v3, v3, Ld7l;->j:Le7l;

    invoke-interface {v3}, Lb9l;->m()Z

    move-result v3

    new-instance v4, Lp42;

    const/4 v5, 0x1

    invoke-direct {v4, v0, v5}, Lp42;-><init>(Lt42;B)V

    move-object/from16 v6, p2

    invoke-virtual {v2, v3, v4, v6}, Lj62;->a(ZLkotlin/jvm/functions/Function1;Ld12;)Lhq3;

    move-result-object v2

    new-instance v3, Lga7;

    iget-object v4, v2, Ls62;->b:Lcom/opera/android/browser/WebContentsWrapper;

    invoke-virtual {v4}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v6

    invoke-interface {v6}, Lorg/chromium/content_public/browser/WebContents;->J0()Lorg/chromium/ui/base/ViewAndroidDelegate;

    move-result-object v6

    iget-object v6, v6, Lorg/chromium/ui/base/ViewAndroidDelegate;->b:Lxr5;

    invoke-direct {v3, v6}, Lga7;-><init>(Landroid/view/View;)V

    invoke-virtual {v0}, Lx22;->c()Lmlj;

    move-result-object v9

    new-instance v10, Lwx;

    const/16 v3, 0xa

    invoke-direct {v10, v0, v1, v3}, Lwx;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v13, v2, Ls62;->c:Lg7m;

    iget-object v3, v0, Lt42;->D:Lzv3;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    move-object v14, v3

    check-cast v14, Lk42;

    iget-object v3, v0, Lx22;->k:Lzyk;

    invoke-virtual {v3}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v3

    move-object v15, v3

    check-cast v15, Lv5n;

    new-instance v6, Lize;

    move-object v3, v1

    check-cast v3, Ld7l;

    iget-object v3, v3, Ld7l;->j:Le7l;

    invoke-interface {v3}, Lb9l;->m()Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-direct {v6, v3}, Lekc;-><init>(Ljava/lang/Object;)V

    new-instance v7, Lrl;

    const/4 v3, 0x4

    invoke-direct {v7, v3}, Lrl;-><init>(B)V

    new-instance v8, Lgq3;

    new-instance v11, Lwhf;

    const/16 v12, 0x9

    invoke-direct {v11, v2, v12}, Lwhf;-><init>(Ljava/lang/Object;B)V

    iget-object v3, v0, Lt42;->v:Lcom/opera/android/BrowserActivity;

    move/from16 v17, v5

    iget-object v5, v0, Lt42;->z:Lzv3;

    move-object/from16 v18, v2

    move-object v2, v8

    iget-object v8, v0, Lt42;->A:Lgv3;

    iget-object v12, v0, Lt42;->C:Lji;

    iget-object v1, v0, Lt42;->H:Lgjm;

    move-object/from16 v16, v1

    move-object/from16 p2, v4

    move/from16 v0, v17

    move-object/from16 v1, v18

    move-object/from16 v4, p3

    invoke-direct/range {v2 .. v16}, Lgq3;-><init>(Landroid/content/Context;Lndc;Lzv3;Lize;Ljava/lang/Runnable;Lesk;Lmlj;Lcom/opera/api/Callback;Lkotlin/jvm/functions/Function2;Lesk;Lg7m;Lk42;Lv5n;Lgjm;)V

    invoke-virtual {v4}, Lv22;->getLifecycle()Ltcc;

    move-result-object v3

    new-instance v5, Ld62;

    invoke-direct {v5, v1, v2, v0}, Ld62;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v3, v5}, Ltcc;->a(Lmdc;)V

    iget-object v2, v1, Ls62;->m:Lz;

    move-object/from16 v3, p0

    iget-object v5, v3, Lt42;->x:Ltcc;

    invoke-virtual {v2, v5}, Lz;->t(Ltcc;)V

    invoke-virtual {v1}, Ls62;->f()Lqyj;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v6, Lob;

    const/16 v7, 0x10

    invoke-direct {v6, v2, v7}, Lob;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v5, v6}, Ltcc;->a(Lmdc;)V

    new-instance v6, Lvsn;

    new-instance v7, Lize;

    move-object/from16 v8, p1

    check-cast v8, Ld7l;

    iget-object v8, v8, Ld7l;->j:Le7l;

    invoke-interface {v8}, Lb9l;->m()Z

    move-result v8

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    invoke-direct {v7, v8}, Lekc;-><init>(Ljava/lang/Object;)V

    iget-object v8, v3, Lt42;->v:Lcom/opera/android/BrowserActivity;

    move-object v9, v8

    invoke-static {v9}, Lr9n;->A(Landroid/content/Context;)Z

    move-result v8

    new-instance v10, Lo42;

    const/4 v11, 0x0

    invoke-direct {v10, v3, v1, v11}, Lo42;-><init>(Lt42;Lhq3;B)V

    new-instance v11, Lo42;

    invoke-direct {v11, v3, v1, v0}, Lo42;-><init>(Lt42;Lhq3;B)V

    new-instance v12, Lvx;

    const/16 v13, 0x8

    invoke-direct {v12, v3, v13}, Lvx;-><init>(Ljava/lang/Object;B)V

    iget-object v13, v3, Lt42;->E:Lj4c;

    invoke-virtual {v13}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lyk6;

    iget-object v13, v13, Lyk6;->k:Lkze;

    new-instance v14, Lq02;

    const/16 v15, 0x9

    invoke-direct {v14, v3, v15}, Lq02;-><init>(Ljava/lang/Object;B)V

    iget-object v0, v3, Lt42;->F:Lrw3;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lurn;

    iget-object v2, v3, Lt42;->G:Lgv3;

    move/from16 v16, v15

    move-object v15, v0

    move/from16 v0, v16

    move-object/from16 v16, v9

    move-object v9, v1

    move-object/from16 v1, v16

    move-object/from16 v16, v2

    const/4 v2, 0x0

    invoke-direct/range {v6 .. v16}, Lvsn;-><init>(Lize;ZLs62;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lesk;Lkze;Ljava/lang/Runnable;Lurn;Lesk;)V

    new-instance v7, Lpqh;

    invoke-direct {v7}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v9}, Ls62;->d()Lekc;

    move-result-object v8

    new-instance v10, Lf9;

    invoke-direct {v10, v7, v3, v6, v0}, Lf9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v0, Lug;

    const/4 v7, 0x4

    invoke-direct {v0, v10, v7}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v8, v4, v0}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v0, v6, Lvsn;->q:Lwnm;

    invoke-static {v0}, Lxf8;->B(Likc;)Ltsd;

    move-result-object v0

    new-instance v8, Lp42;

    invoke-direct {v8, v3, v2}, Lp42;-><init>(Lt42;B)V

    new-instance v10, Lug;

    invoke-direct {v10, v8, v7}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v0, v4, v10}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v0, v4, Lv22;->f:Lqdc;

    invoke-static {v0}, Lcqp;->V(Ltcc;)Lddc;

    move-result-object v0

    new-instance v4, Lc71;

    const/4 v7, 0x0

    const/4 v8, 0x2

    invoke-direct {v4, v3, v6, v7, v8}, Lc71;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    iget-object v7, v6, Lvsn;->p:Lrlh;

    invoke-static {v7, v0, v4}, Lw7d;->i(Lf99;Lnx5;Lkotlin/jvm/functions/Function2;)Ld3k;

    new-instance v0, Lob;

    invoke-direct {v0, v9, v8}, Lob;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v5, v0}, Ltcc;->a(Lmdc;)V

    new-instance v0, Lq42;

    invoke-direct {v0, v3, v9, v6}, Lq42;-><init>(Lt42;Lhq3;Lvsn;)V

    iget-object v4, v3, Lt42;->w:Lei;

    iget-object v6, v4, Lei;->d:Landroid/view/View;

    check-cast v6, Lcom/opera/android/webaiassistant/WebAiAssistantSheetContentWrapper;

    iget-object v4, v4, Lei;->g:Landroid/view/View;

    check-cast v4, Lcom/opera/android/webaiassistant/WebAiAssistantLayoutSwitcher;

    invoke-virtual/range {p2 .. p2}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v7

    new-instance v8, Ls8n;

    const v10, 0x7f040557

    invoke-direct {v8, v1, v10}, Ls8n;-><init>(Landroid/content/Context;I)V

    const v1, 0x7f0402ed

    const v10, 0x7f061084

    invoke-static {v1, v8, v10}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v1

    iget-object v8, v3, Lt42;->J:Lwll;

    invoke-virtual {v8, v7, v1}, Lwll;->a(Lorg/chromium/content_public/browser/WebContents;I)Lp8f;

    move-result-object v1

    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/webcore/FastResizeWebViewContainer;

    iget-object v1, v1, Lp8f;->b:Ljava/lang/Object;

    check-cast v1, Lzll;

    iget-object v4, v3, Lt42;->I:Lqwe;

    move-object/from16 v7, p2

    invoke-virtual {v2, v1, v7, v4}, Lcom/opera/android/webcore/FastResizeWebViewContainer;->a(Lzll;Lcom/opera/android/browser/WebContentsWrapper;Lqwe;)V

    invoke-virtual {v9}, Ls62;->f()Lqyj;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lob;

    const/16 v4, 0x10

    invoke-direct {v2, v1, v4}, Lob;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v5, v2}, Ltcc;->a(Lmdc;)V

    iget-object v1, v3, Lt42;->L:Ls42;

    invoke-virtual {v6, v1}, Lcom/opera/android/webaiassistant/WebAiAssistantSheetContentWrapper;->F(Ljava/lang/Object;)V

    return-object v0
.end method

.method public final j(Ljava/lang/String;)Z
    .registers 2

    const/4 p0, 0x0

    return p0
.end method

.method public final k(Lorg/chromium/url/GURL;)Z
    .registers 2

    const/4 p0, 0x0

    return p0
.end method
