.class public final Lvbf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lupm;
.implements Lq9g;


# static fields
.field public static final M:[Ljava/lang/String;

.field public static final N:[Ljava/lang/String;


# instance fields
.field public final A:Lxbf;

.field public final B:I

.field public final C:I

.field public final D:Lnrl;

.field public E:Lyqd;

.field public F:Z

.field public G:Leri;

.field public final H:Lj25;

.field public final I:Lvc7;

.field public final J:Ligi;

.field public final K:Lpde;

.field public final L:Ld8d;

.field public final a:Z

.field public final b:Lcom/opera/android/settings/SettingsManager;

.field public final c:Lk6l;

.field public final d:Ls9g;

.field public final e:Lydn;

.field public final f:Lswf;

.field public final g:Lp8f;

.field public final h:Lsbf;

.field public final i:Lxg;

.field public final j:Lpbf;

.field public final k:Lrbf;

.field public final l:Lin3;

.field public final m:Lqbf;

.field public final n:Lcom/opera/android/bar/OmniBoxRoot;

.field public final o:Z

.field public final p:Z

.field public final q:Lv73;

.field public final r:Lqfb;

.field public final s:Lcom/opera/android/widget/UrlFieldEditText;

.field public final t:Ltbf;

.field public u:Lwaf;

.field public final v:Lkze;

.field public final w:Ljl6;

.field public final x:Ldbf;

.field public final y:Ldbf;

.field public final z:Lubf;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-string v0, "https://"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lvbf;->M:[Ljava/lang/String;

    const-string v0, "www."

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lvbf;->N:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(ILcom/opera/android/settings/SettingsManager;Ls9g;Lk6l;Lydn;Lswf;Lp8f;Lxg;Lin3;Ls28;Landroid/widget/FrameLayout;Lcom/opera/android/bar/OmniBoxRoot;Lcom/opera/android/widget/UrlFieldEditText;ZZLv73;Ldbf;Ldbf;Lpt3;Lumi;Lmdh;Lqdh;Lcul;Ligi;Lpde;Lvx;Lwcd;Liuh;Lwok;)V
    .registers 60

    move-object/from16 v1, p0

    move-object/from16 v11, p2

    move-object/from16 v12, p3

    move-object/from16 v13, p5

    move-object/from16 v14, p6

    move-object/from16 v15, p7

    move-object/from16 v0, p8

    move-object/from16 v2, p9

    move-object/from16 v3, p12

    move-object/from16 v4, p13

    move/from16 v5, p14

    move-object/from16 v6, p17

    move-object/from16 v7, p25

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    new-instance v8, Lsbf;

    const/4 v9, 0x0

    invoke-direct {v8, v1, v9}, Lsbf;-><init>(Ljava/lang/Object;B)V

    iput-object v8, v1, Lvbf;->h:Lsbf;

    new-instance v10, Lpbf;

    invoke-direct {v10, v1}, Lpbf;-><init>(Lvbf;)V

    iput-object v10, v1, Lvbf;->j:Lpbf;

    new-instance v9, Lrbf;

    invoke-direct {v9, v1}, Lrbf;-><init>(Lvbf;)V

    iput-object v9, v1, Lvbf;->k:Lrbf;

    move-object/from16 v16, v8

    new-instance v8, Lqbf;

    invoke-direct {v8, v1}, Lqbf;-><init>(Lvbf;)V

    iput-object v8, v1, Lvbf;->m:Lqbf;

    move-object/from16 v17, v8

    new-instance v8, Ltbf;

    invoke-direct {v8}, Ljava/lang/Object;-><init>()V

    move-object/from16 v18, v10

    sget-object v10, Lypm;->l:Lypm;

    iput-object v10, v8, Ltbf;->b:Lypm;

    const/4 v10, 0x3

    iput v10, v8, Ltbf;->c:I

    invoke-static {}, Lqwi;->a()Lqwi;

    move-result-object v10

    iput-object v10, v8, Ltbf;->d:Lqwi;

    sget-object v10, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    iput-object v10, v8, Ltbf;->e:Ljava/util/List;

    iput-object v10, v8, Ltbf;->f:Ljava/util/List;

    iput-object v8, v1, Lvbf;->t:Ltbf;

    new-instance v10, La36;

    invoke-direct {v10}, Ljava/lang/Object;-><init>()V

    iput-object v10, v1, Lvbf;->u:Lwaf;

    new-instance v10, Lkze;

    move-object/from16 v20, v8

    sget-object v8, Lpeg;->a:Lpeg;

    invoke-direct {v10, v8}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v10, v1, Lvbf;->v:Lkze;

    new-instance v8, Lnrl;

    invoke-direct {v8, v1}, Lnrl;-><init>(Ljava/lang/Object;)V

    iput-object v8, v1, Lvbf;->D:Lnrl;

    new-instance v8, Lj25;

    const/4 v10, 0x2

    invoke-direct {v8, v1, v10}, Lj25;-><init>(Ljava/lang/Object;B)V

    iput-object v8, v1, Lvbf;->H:Lj25;

    new-instance v10, Lvc7;

    move-object/from16 v22, v8

    const/4 v8, 0x1

    invoke-direct {v10, v1, v8}, Lvc7;-><init>(Ljava/lang/Object;B)V

    iput-object v10, v1, Lvbf;->I:Lvc7;

    new-instance v8, Ld8d;

    move-object/from16 v23, v10

    const/16 v10, 0x10

    invoke-direct {v8, v1, v10}, Ld8d;-><init>(Ljava/lang/Object;B)V

    iput-object v8, v1, Lvbf;->L:Ld8d;

    move/from16 v10, p1

    iput-boolean v10, v1, Lvbf;->a:Z

    iput-object v11, v1, Lvbf;->b:Lcom/opera/android/settings/SettingsManager;

    move-object/from16 v10, p4

    iput-object v10, v1, Lvbf;->c:Lk6l;

    iput-object v12, v1, Lvbf;->d:Ls9g;

    iput-object v13, v1, Lvbf;->e:Lydn;

    iput-object v14, v1, Lvbf;->f:Lswf;

    iget-object v10, v14, Lswf;->g:Li7f;

    invoke-virtual {v10, v9}, Li7f;->b(Ljava/lang/Object;)Z

    iput-object v15, v1, Lvbf;->g:Lp8f;

    iput-object v0, v1, Lvbf;->i:Lxg;

    iput-object v2, v1, Lvbf;->l:Lin3;

    iput-object v3, v1, Lvbf;->n:Lcom/opera/android/bar/OmniBoxRoot;

    iput-object v4, v1, Lvbf;->s:Lcom/opera/android/widget/UrlFieldEditText;

    iput-boolean v5, v1, Lvbf;->o:Z

    move/from16 v9, p15

    iput-boolean v9, v1, Lvbf;->p:Z

    move-object/from16 v9, p16

    iput-object v9, v1, Lvbf;->q:Lv73;

    iput-object v6, v1, Lvbf;->x:Ldbf;

    move-object/from16 v9, p24

    iput-object v9, v1, Lvbf;->J:Ligi;

    iput-object v7, v1, Lvbf;->K:Lpde;

    move-object/from16 v9, p18

    iput-object v9, v1, Lvbf;->y:Ldbf;

    new-instance v9, Lwub;

    invoke-direct {v9, v6}, Lwub;-><init>(Ljava/lang/Object;)V

    new-instance v10, Lqfb;

    new-instance v0, Lbp;

    new-instance v2, Lo8f;

    const/4 v4, 0x2

    invoke-direct {v2, v6, v4}, Lo8f;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    new-instance v21, Ljava/util/HashSet;

    iput-object v2, v0, Lbp;->b:Ljava/lang/Object;

    invoke-direct {v10, v3, v9, v0}, Lqfb;-><init>(Lcom/opera/android/bar/OmniBoxRoot;Lwub;Lbp;)V

    iput-object v10, v1, Lvbf;->r:Lqfb;

    invoke-virtual/range {p13 .. p13}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-wide/16 v9, 0x40

    const/4 v2, 0x1

    invoke-virtual {v1, v9, v10, v2}, Lvbf;->r(JZ)V

    move-object v9, v0

    new-instance v0, Lubf;

    move-object/from16 v14, p13

    move-object/from16 v4, p19

    move-object/from16 v2, p20

    move-object/from16 v5, p21

    move-object/from16 v6, p22

    move-object/from16 v7, p23

    move-object/from16 v10, p29

    move-object v12, v3

    move-object/from16 v29, v8

    move-object v13, v9

    move-object/from16 v24, v16

    move-object/from16 v26, v17

    move-object/from16 v25, v18

    move-object/from16 v27, v20

    move-object/from16 v15, v22

    move-object/from16 v28, v23

    const/4 v11, 0x0

    const/16 v19, 0x3

    move-object/from16 v3, p10

    move-object/from16 v8, p27

    move-object/from16 v9, p28

    invoke-direct/range {v0 .. v10}, Lubf;-><init>(Lvbf;Lumi;Ls28;Lpt3;Lmdh;Lqdh;Lcul;Lwcd;Liuh;Lwok;)V

    iput-object v0, v1, Lvbf;->z:Lubf;

    invoke-virtual {v14, v11}, Landroid/view/View;->setFocusable(Z)V

    invoke-virtual {v14, v11}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    invoke-virtual {v14}, Landroid/view/View;->clearFocus()V

    invoke-virtual {v1}, Lvbf;->t()V

    invoke-virtual {v1}, Lvbf;->u()V

    invoke-virtual {v14, v0}, Lcom/opera/android/custom_views/ObservableEditText;->m(Lz6f;)V

    invoke-virtual {v14, v0}, Landroid/widget/TextView;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    invoke-virtual {v14, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v14, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    invoke-virtual {v14, v0}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    invoke-virtual {v12, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v12, v11}, Landroid/view/View;->setFocusable(Z)V

    invoke-virtual {v12, v11}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    new-instance v0, Lxbf;

    new-instance v2, Lobf;

    invoke-direct {v2, v1, v11}, Lobf;-><init>(Lvbf;B)V

    new-instance v3, Lobf;

    const/4 v4, 0x1

    invoke-direct {v3, v1, v4}, Lobf;-><init>(Lvbf;B)V

    new-instance v4, Lobf;

    const/4 v5, 0x2

    invoke-direct {v4, v1, v5}, Lobf;-><init>(Lvbf;B)V

    new-instance v5, Lo5f;

    const/16 v6, 0x8

    invoke-direct {v5, v1, v6}, Lo5f;-><init>(Ljava/lang/Object;B)V

    new-instance v6, Lkw3;

    const/16 v7, 0x12

    invoke-direct {v6, v7}, Lkw3;-><init>(B)V

    move-object/from16 p24, p17

    move-object/from16 p18, v0

    move-object/from16 p19, v2

    move-object/from16 p20, v3

    move-object/from16 p21, v4

    move-object/from16 p22, v5

    move-object/from16 p23, v6

    invoke-direct/range {p18 .. p24}, Lxbf;-><init>(Lesk;Lesk;Lesk;Lkotlin/jvm/functions/Function1;Lesk;Ldbf;)V

    iput-object v0, v1, Lvbf;->A:Lxbf;

    new-instance v0, Ljl6;

    invoke-direct {v0, v14}, Ljl6;-><init>(Lcom/opera/android/widget/UrlFieldEditText;)V

    iput-object v0, v1, Lvbf;->w:Ljl6;

    const v0, 0x7f070a35

    invoke-virtual {v13, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual/range {p11 .. p11}, Landroid/view/View;->getPaddingStart()I

    move-result v2

    sub-int/2addr v0, v2

    iput v0, v1, Lvbf;->B:I

    invoke-virtual {v12}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f07081a

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, v1, Lvbf;->C:I

    invoke-virtual {v14}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v2, 0x7f14133b

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v14}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f141339

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v14, v2}, Lcom/opera/android/custom_views/OperaEditText;->g(Ljava/lang/String;)V

    new-instance v3, Low3;

    const/4 v4, 0x5

    move-object/from16 v5, p26

    invoke-direct {v3, v1, v5, v4}, Low3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v4, Lwpg;

    invoke-direct {v4, v14, v0, v2}, Lwpg;-><init>(Lcom/opera/android/widget/UrlFieldEditText;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v4, v14, Lcom/opera/android/widget/UrlFieldEditText;->b0:Lwpg;

    iput-object v3, v14, Lcom/opera/android/widget/UrlFieldEditText;->c0:Lesk;

    invoke-virtual {v14}, Lcom/opera/android/widget/UrlFieldEditText;->D()V

    if-eqz p14, :cond_1c9

    const v0, 0x7f0409be

    goto :goto_1cc

    :cond_1c9
    const v0, 0x7f0409c4

    :goto_1cc
    invoke-virtual {v14}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v0, v2}, Lf03;->W(ILandroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {v14, v0}, Landroid/widget/TextView;->setHintTextColor(Landroid/content/res/ColorStateList;)V

    move-object/from16 v11, p2

    invoke-virtual {v11, v15}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    move-object/from16 v13, p5

    move-object/from16 v0, v28

    invoke-virtual {v13, v0}, Lydn;->b(Ltdn;)V

    move-object/from16 v15, p7

    iget-object v0, v15, Lp8f;->b:Ljava/lang/Object;

    check-cast v0, Li7f;

    move-object/from16 v2, v24

    invoke-virtual {v0, v2}, Li7f;->b(Ljava/lang/Object;)Z

    move-object/from16 v0, p8

    iget-object v0, v0, Lxg;->b:Ljava/lang/Iterable;

    check-cast v0, Lh7f;

    move-object/from16 v2, v25

    invoke-virtual {v0, v2}, Lh7f;->b(Ljava/lang/Object;)Z

    invoke-virtual/range {p6 .. p6}, Lswf;->a()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v1}, Lvbf;->q()V

    move-object/from16 v2, v27

    iput-object v0, v2, Ltbf;->e:Ljava/util/List;

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Ls9g;->a(Lq9g;)V

    new-instance v0, Llzb;

    const/16 v2, 0x19

    invoke-direct {v0, v1, v2}, Llzb;-><init>(Ljava/lang/Object;B)V

    invoke-static {v12}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v2

    if-eqz v2, :cond_219

    invoke-static {v2, v12, v0}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_219
    invoke-virtual {v12}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f070818

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    mul-int/lit8 v0, v0, 0x3

    invoke-virtual {v12}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f070819

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    invoke-virtual {v12}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f07081f

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    new-instance v4, Lnbf;

    invoke-direct {v4, v1, v0, v2, v3}, Lnbf;-><init>(Lvbf;III)V

    invoke-virtual {v12, v4}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    move-object/from16 v2, p9

    iget-object v0, v2, Lin3;->c:Li7f;

    move-object/from16 v2, v26

    invoke-virtual {v0, v2}, Li7f;->b(Ljava/lang/Object;)Z

    move-object/from16 v7, p25

    move-object/from16 v0, v29

    invoke-virtual {v7, v0}, Lekc;->k(Lf7f;)V

    invoke-virtual {v1}, Lvbf;->n()V

    return-void
.end method


# virtual methods
.method public final A()V
    .registers 2

    iget-object v0, p0, Lvbf;->c:Lk6l;

    iget-object v0, v0, Lk6l;->o:Lb2l;

    if-eqz v0, :cond_9

    invoke-virtual {p0, v0}, Lvbf;->s(Lb2l;)V

    :cond_9
    return-void
.end method

.method public final a()Lwpm;
    .registers 1

    iget-object p0, p0, Lvbf;->s:Lcom/opera/android/widget/UrlFieldEditText;

    return-object p0
.end method

.method public final b()V
    .registers 1

    return-void
.end method

.method public final c()V
    .registers 2

    const-string v0, ""

    invoke-virtual {p0, v0}, Lvbf;->k(Ljava/lang/String;)V

    return-void
.end method

.method public final d(Ljava/util/List;)V
    .registers 2

    iget-object p1, p0, Lvbf;->c:Lk6l;

    iget-object p1, p1, Lk6l;->o:Lb2l;

    if-eqz p1, :cond_9

    invoke-virtual {p0, p1}, Lvbf;->s(Lb2l;)V

    :cond_9
    return-void
.end method

.method public final e(I)Z
    .registers 2

    iget-object p0, p0, Lvbf;->s:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {p0, p1}, Lcom/opera/android/custom_views/OperaEditText;->f(I)Z

    move-result p0

    return p0
.end method

.method public final f()V
    .registers 1

    return-void
.end method

.method public final g()Lxbf;
    .registers 1

    iget-object p0, p0, Lvbf;->A:Lxbf;

    return-object p0
.end method

.method public final h()V
    .registers 1

    iget-object p0, p0, Lvbf;->s:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-static {p0}, Lq9n;->u(Landroid/view/View;)Z

    return-void
.end method

.method public final i()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final j(Lpvb;)V
    .registers 2

    return-void
.end method

.method public final k(Ljava/lang/String;)V
    .registers 5

    invoke-virtual {p0}, Lvbf;->q()V

    const/4 v0, 0x2

    const/4 v1, 0x0

    iget-object v2, p0, Lvbf;->s:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v2, p1, p1, v0, v1}, Lcom/opera/android/widget/UrlFieldEditText;->B(Ljava/lang/CharSequence;Ljava/lang/String;II)V

    invoke-virtual {p0}, Lvbf;->p()Z

    move-result p0

    if-eqz p0, :cond_1b

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p0

    invoke-virtual {v2}, Landroid/widget/TextView;->length()I

    move-result p1

    invoke-static {p0, p1}, Landroid/text/Selection;->setSelection(Landroid/text/Spannable;I)V

    :cond_1b
    return-void
.end method

.method public final l()V
    .registers 12

    iget-object v0, p0, Lvbf;->t:Ltbf;

    iget-object v0, v0, Ltbf;->b:Lypm;

    iget-object v1, v0, Lypm;->g:Lzg;

    iget-object v2, v0, Lypm;->f:Ljava/lang/String;

    iget-object v3, v0, Lypm;->a:Ljava/lang/String;

    iget-object v0, v0, Lypm;->b:Ljava/lang/String;

    const/4 v4, 0x2

    iget-object v5, p0, Lvbf;->s:Lcom/opera/android/widget/UrlFieldEditText;

    const/4 v6, 0x0

    if-eqz v1, :cond_1e

    iget-object p0, v1, Lzg;->b:Ljava/lang/Object;

    check-cast p0, Lsre;

    invoke-virtual {p0}, Lsre;->a()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v5, p0, p0, v4, v6}, Lcom/opera/android/widget/UrlFieldEditText;->B(Ljava/lang/CharSequence;Ljava/lang/String;II)V

    return-void

    :cond_1e
    invoke-virtual {p0}, Lvbf;->p()Z

    move-result v1

    const/4 v7, -0x1

    if-eqz v1, :cond_2b

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_31

    :cond_2b
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_34

    :cond_31
    move-object v1, v0

    :cond_32
    move v0, v7

    goto :goto_6d

    :cond_34
    sget-object v1, Lvbf;->M:[Ljava/lang/String;

    invoke-static {v3, v1}, Laik;->s(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sget-object v3, Lvbf;->N:[Ljava/lang/String;

    invoke-static {v1, v3}, Laik;->s(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lehi;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0}, Lopm;->a(Ljava/lang/String;)Lfr;

    move-result-object v8

    const/4 v9, 0x0

    if-eqz v8, :cond_69

    iget v10, v8, Lfr;->b:I

    iget v8, v8, Lfr;->c:I

    invoke-virtual {v0, v10, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v3}, Laik;->s(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-eq v3, v7, :cond_69

    new-instance v9, Lfr;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/2addr v0, v3

    const/16 v8, 0x1a

    invoke-direct {v9, v3, v0, v8}, Lfr;-><init>(IIB)V

    :cond_69
    if-eqz v9, :cond_32

    iget v0, v9, Lfr;->c:I

    :goto_6d
    if-eq v0, v7, :cond_74

    const/4 p0, 0x1

    invoke-virtual {v5, v1, v2, p0, v0}, Lcom/opera/android/widget/UrlFieldEditText;->B(Ljava/lang/CharSequence;Ljava/lang/String;II)V

    return-void

    :cond_74
    invoke-virtual {p0}, Lvbf;->p()Z

    move-result p0

    if-eqz p0, :cond_7b

    move v4, v6

    :cond_7b
    invoke-virtual {v5, v1, v2, v4, v6}, Lcom/opera/android/widget/UrlFieldEditText;->B(Ljava/lang/CharSequence;Ljava/lang/String;II)V

    return-void
.end method

.method public final m(Ljava/lang/CharSequence;)Llbf;
    .registers 3

    invoke-static {p1}, Laik;->t(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_11

    sget-object p0, Llbf;->a:Llbf;

    return-object p0

    :cond_11
    iget-object p0, p0, Lvbf;->s:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lxnh;->t(Landroid/content/Context;)Lxnh;

    move-result-object p0

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwnh;

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lwnh;->b(I)Z

    move-result p0

    if-nez p0, :cond_37

    invoke-virtual {p1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object p0

    sget-object v0, Lwqm;->a:[Ljava/lang/String;

    invoke-static {p0}, LJ/N;->Mhh3b1$p(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_37

    sget-object p0, Llbf;->d:Llbf;

    return-object p0

    :cond_37
    invoke-static {p1}, Lwqm;->x(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_40

    sget-object p0, Llbf;->c:Llbf;

    return-object p0

    :cond_40
    sget-object p0, Llbf;->b:Llbf;

    return-object p0
.end method

.method public final n()V
    .registers 3

    iget-object v0, p0, Lvbf;->E:Lyqd;

    if-eqz v0, :cond_a

    invoke-static {v0}, Lvml;->a(Ljava/lang/Runnable;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lvbf;->E:Lyqd;

    :cond_a
    iget-object v0, p0, Lvbf;->D:Lnrl;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lnrl;->P(Z)V

    iget-object p0, p0, Lvbf;->r:Lqfb;

    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/EnumMap;

    invoke-virtual {p0}, Ljava/util/EnumMap;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_1e
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2e

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/bar/OmniButtonView;

    invoke-virtual {v0}, Lcom/opera/android/bar/OmniButtonView;->jumpDrawablesToCurrentState()V

    goto :goto_1e

    :cond_2e
    return-void
.end method

.method public final o()Ljava/lang/CharSequence;
    .registers 4

    iget-object v0, p0, Lvbf;->s:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v0}, Lcom/opera/android/widget/UrlFieldEditText;->s()Z

    move-result v1

    if-eqz v1, :cond_d

    invoke-virtual {v0}, Lcom/opera/android/widget/UrlFieldEditText;->q()Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0

    :cond_d
    const-wide/16 v1, 0x1

    iget-object p0, p0, Lvbf;->t:Ltbf;

    invoke-virtual {p0, v1, v2}, Ltbf;->b(J)Z

    move-result v1

    if-eqz v1, :cond_20

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_20
    iget-object p0, p0, Ltbf;->b:Lypm;

    iget-object v0, p0, Lypm;->g:Lzg;

    if-eqz v0, :cond_2f

    iget-object p0, v0, Lzg;->b:Ljava/lang/Object;

    check-cast p0, Lsre;

    invoke-virtual {p0}, Lsre;->a()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2f
    iget-object p0, p0, Lypm;->b:Ljava/lang/String;

    return-object p0
.end method

.method public final p()Z
    .registers 3

    iget-object p0, p0, Lvbf;->t:Ltbf;

    const-wide/16 v0, 0x1

    invoke-virtual {p0, v0, v1}, Ltbf;->b(J)Z

    move-result p0

    return p0
.end method

.method public final q()V
    .registers 3

    iget-object v0, p0, Lvbf;->E:Lyqd;

    if-eqz v0, :cond_5

    return-void

    :cond_5
    new-instance v0, Lyqd;

    const/16 v1, 0x19

    invoke-direct {v0, p0, v1}, Lyqd;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lvbf;->E:Lyqd;

    invoke-static {v0}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final r(JZ)V
    .registers 6

    iget-object p0, p0, Lvbf;->t:Ltbf;

    iget-wide v0, p0, Ltbf;->a:J

    if-eqz p3, :cond_a

    or-long/2addr v0, p1

    iput-wide v0, p0, Ltbf;->a:J

    return-void

    :cond_a
    not-long p1, p1

    and-long/2addr v0, p1

    iput-wide v0, p0, Ltbf;->a:J

    return-void
.end method

.method public final s(Lb2l;)V
    .registers 6

    invoke-virtual {p0}, Lvbf;->q()V

    new-instance v0, Lypm;

    invoke-direct {v0, p1}, Lypm;-><init>(Lb2l;)V

    iget-object v1, p0, Lvbf;->t:Ltbf;

    iput-object v0, v1, Ltbf;->b:Lypm;

    move-object v0, p1

    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->isLoading()Z

    move-result v0

    const-wide/16 v2, 0x10

    invoke-virtual {p0, v2, v3, v0}, Lvbf;->r(JZ)V

    check-cast p1, Ld7l;

    invoke-virtual {p1}, Ld7l;->o0()Z

    move-result v0

    const-wide/16 v2, 0x40

    invoke-virtual {p0, v2, v3, v0}, Lvbf;->r(JZ)V

    iget-object v0, p1, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->r()Z

    move-result v0

    if-nez v0, :cond_3d

    iget-object v0, p1, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->c0()Z

    move-result v0

    if-eqz v0, :cond_3b

    invoke-virtual {p1}, Ld7l;->o0()Z

    move-result v0

    if-eqz v0, :cond_3d

    :cond_3b
    const/4 v0, 0x0

    goto :goto_3e

    :cond_3d
    const/4 v0, 0x1

    :goto_3e
    const-wide/16 v2, 0x400

    invoke-virtual {p0, v2, v3, v0}, Lvbf;->r(JZ)V

    iget-object v0, p1, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->g()Z

    move-result v0

    const-wide/16 v2, 0x800

    invoke-virtual {p0, v2, v3, v0}, Lvbf;->r(JZ)V

    iget-object v0, p1, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->z()Z

    move-result v0

    const-wide/16 v2, 0x2000

    invoke-virtual {p0, v2, v3, v0}, Lvbf;->r(JZ)V

    invoke-virtual {p0}, Lvbf;->v()V

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->b0()Lqwi;

    move-result-object p1

    invoke-virtual {p0}, Lvbf;->q()V

    iput-object p1, v1, Ltbf;->d:Lqwi;

    return-void
.end method

.method public final t()V
    .registers 4

    invoke-virtual {p0}, Lvbf;->q()V

    invoke-virtual {p0}, Lvbf;->o()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lvbf;->m(Ljava/lang/CharSequence;)Llbf;

    iget-object v0, p0, Lvbf;->t:Ltbf;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p0, Lvbf;->s:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-static {v0}, Laik;->t(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const-wide/16 v1, 0x100

    invoke-virtual {p0, v1, v2, v0}, Lvbf;->r(JZ)V

    return-void
.end method

.method public final u()V
    .registers 8

    invoke-virtual {p0}, Lvbf;->o()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lvbf;->m(Ljava/lang/CharSequence;)Llbf;

    move-result-object v0

    const-wide/16 v1, 0x1

    iget-object v3, p0, Lvbf;->t:Ltbf;

    invoke-virtual {v3, v1, v2}, Ltbf;->b(J)Z

    move-result v1

    const/4 v2, 0x1

    sget-object v4, Llbf;->b:Llbf;

    const/4 v5, 0x0

    iget-object p0, p0, Lvbf;->s:Lcom/opera/android/widget/UrlFieldEditText;

    if-nez v1, :cond_43

    iget-object v1, v3, Ltbf;->b:Lypm;

    iget-object v1, v1, Lypm;->c:Ljava/lang/String;

    invoke-static {v1}, Lcom/opera/android/browser/UrlMangler;->c(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_40

    iget-object v1, v3, Ltbf;->b:Lypm;

    iget-object v1, v1, Lypm;->c:Ljava/lang/String;

    invoke-static {v1}, Lcom/opera/android/browser/UrlMangler;->isOffline(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_40

    iget-object v1, v3, Ltbf;->b:Lypm;

    iget-object v1, v1, Lypm;->c:Ljava/lang/String;

    invoke-static {v1}, Lcom/opera/android/browser/UrlMangler;->b(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_40

    iget-object v1, v3, Ltbf;->b:Lypm;

    iget-object v1, v1, Lypm;->c:Ljava/lang/String;

    invoke-static {v1}, Lcom/opera/android/browser/UrlMangler;->d(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_43

    :cond_40
    const/4 v1, 0x2

    :goto_41
    move v3, v5

    goto :goto_58

    :cond_43
    if-eq v0, v4, :cond_56

    sget-object v1, Llbf;->d:Llbf;

    if-eq v0, v1, :cond_56

    invoke-virtual {p0}, Landroid/widget/TextView;->getEditableText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcs5;->J(Ljava/lang/CharSequence;)I

    move-result v1

    goto :goto_41

    :cond_56
    move v3, v2

    move v1, v5

    :goto_58
    iget-object v6, p0, Lcom/opera/android/custom_views/OperaEditText;->j:Ll2c;

    invoke-virtual {v6, v1}, Ll2c;->d(I)V

    iget-boolean v1, p0, Lcom/opera/android/widget/UrlFieldEditText;->I:Z

    if-eq v3, v1, :cond_73

    iput-boolean v3, p0, Lcom/opera/android/widget/UrlFieldEditText;->I:Z

    invoke-static {p0}, Lcs5;->W(Landroid/view/View;)Z

    move-result v1

    iget-boolean v3, p0, Lcom/opera/android/widget/UrlFieldEditText;->I:Z

    if-nez v3, :cond_6f

    if-eqz v1, :cond_6f

    move v1, v2

    goto :goto_70

    :cond_6f
    move v1, v5

    :goto_70
    invoke-virtual {p0, v1}, Landroid/view/View;->onRtlPropertiesChanged(I)V

    :cond_73
    invoke-static {p0}, Lcs5;->W(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_7b

    const/4 v1, 0x5

    goto :goto_7c

    :cond_7b
    const/4 v1, 0x3

    :goto_7c
    or-int/lit8 v1, v1, 0x10

    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setGravity(I)V

    if-eq v0, v4, :cond_84

    move v2, v5

    :cond_84
    invoke-virtual {p0, v2}, Lcom/opera/android/widget/UrlFieldEditText;->E(Z)V

    return-void
.end method

.method public final v()V
    .registers 4

    invoke-virtual {p0}, Lvbf;->q()V

    iget-object v0, p0, Lvbf;->t:Ltbf;

    iget-object v0, v0, Ltbf;->b:Lypm;

    iget-object v0, v0, Lypm;->c:Ljava/lang/String;

    iget-object v1, p0, Lvbf;->b:Lcom/opera/android/settings/SettingsManager;

    const-string v2, "vpn_search_bypass"

    invoke-virtual {v1, v2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_21

    iget-object v1, p0, Lvbf;->e:Lydn;

    invoke-static {v0}, Lcom/opera/android/browser/BrowserUtils;->getRendererUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lydn;->t(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_21

    const/4 v0, 0x1

    goto :goto_22

    :cond_21
    const/4 v0, 0x0

    :goto_22
    const-wide/16 v1, 0x80

    invoke-virtual {p0, v1, v2, v0}, Lvbf;->r(JZ)V

    return-void
.end method
