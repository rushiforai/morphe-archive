.class public final synthetic Luef;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 5

    iput-byte p4, p0, Luef;->a:B

    iput-object p1, p0, Luef;->b:Ljava/lang/Object;

    iput-object p2, p0, Luef;->c:Ljava/lang/Object;

    iput-object p3, p0, Luef;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 24

    move-object/from16 v0, p0

    iget-byte v1, v0, Luef;->a:B

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    iget-object v5, v0, Luef;->d:Ljava/lang/Object;

    iget-object v6, v0, Luef;->c:Ljava/lang/Object;

    iget-object v0, v0, Luef;->b:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_28e

    check-cast v0, Lvk1;

    check-cast v6, Lt1;

    check-cast v5, Ljg8;

    new-instance v1, Lq7o;

    new-instance v2, Lki;

    const/16 v4, 0xc

    invoke-direct {v2, v0, v4}, Lki;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Lj4c;

    invoke-direct {v0, v2, v3}, Lj4c;-><init>(Lesk;B)V

    invoke-direct {v1, v0, v6, v5}, Lq7o;-><init>(Lj4c;Lt1;Ljg8;)V

    return-object v1

    :pswitch_28
    check-cast v0, Lu8k;

    check-cast v6, Lplh;

    check-cast v5, Lv1;

    iget-object v0, v0, Lu8k;->d:Lode;

    invoke-static {v0}, Lxf8;->t(Lekc;)Lf99;

    move-result-object v0

    invoke-static {v5}, La26;->h(Lno7;)Lf99;

    move-result-object v1

    new-instance v2, Lxq6;

    invoke-direct {v2, v5, v4}, Lxq6;-><init>(Lv1;Lmt5;)V

    invoke-static {v0, v6, v1, v2}, Lnb6;->l(Lf99;Lf99;Lf99;Ldr9;)Lcw;

    move-result-object v0

    invoke-static {v0}, Lqbe;->t(Lf99;)Lf99;

    move-result-object v0

    return-object v0

    :pswitch_46
    check-cast v0, Ljbn;

    check-cast v6, Landroid/content/Intent;

    check-cast v5, Lkotlin/jvm/functions/Function1;

    iget-object v0, v0, Ljbn;->a:Landroid/content/Context;

    new-instance v1, Labn;

    invoke-direct {v1, v0, v5}, Labn;-><init>(Landroid/content/Context;Lkotlin/jvm/functions/Function1;)V

    new-instance v0, Lgbn;

    invoke-direct {v0, v1}, Lgbn;-><init>(Labn;)V

    invoke-virtual {v1, v0}, Labn;->b(Lhbn;)V

    iget-object v0, v1, Labn;->g:Landroid/speech/SpeechRecognizer;

    invoke-virtual {v0, v6}, Landroid/speech/SpeechRecognizer;->startListening(Landroid/content/Intent;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_63
    check-cast v0, Ld4;

    check-cast v6, Ls5n;

    check-cast v5, Lt5n;

    invoke-virtual {v0, v6}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    invoke-static {v0}, Lz5i;->J(Landroid/view/View;)Lung;

    move-result-object v0

    iget-object v0, v0, Lung;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_78
    check-cast v0, Lw3j;

    move-object v7, v6

    check-cast v7, Lkd4;

    move-object v11, v5

    check-cast v11, Lo3a;

    iget-object v1, v0, Lw3j;->e:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lt3j;

    invoke-virtual {v1}, Lt3j;->c()Z

    move-result v1

    if-eqz v1, :cond_98

    iget-object v1, v0, Lw3j;->f:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lu3j;

    move-object v9, v1

    goto :goto_99

    :cond_98
    move-object v9, v4

    :goto_99
    if-eqz v9, :cond_a3

    iget v1, v9, Lu3j;->h:I

    if-ne v1, v2, :cond_a1

    move v8, v2

    goto :goto_aa

    :cond_a1
    if-nez v1, :cond_a5

    :cond_a3
    move v8, v3

    goto :goto_aa

    :cond_a5
    if-eqz v1, :cond_c3

    if-eq v1, v2, :cond_c3

    move v8, v1

    :goto_aa
    iget-object v1, v0, Lw3j;->c:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    move-object v13, v1

    check-cast v13, Ljava/util/Map;

    iget-object v0, v0, Lw3j;->d:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    move-object v14, v0

    check-cast v14, Ljava/util/Map;

    const/4 v10, 0x0

    const/4 v12, 0x0

    invoke-virtual/range {v7 .. v14}, Lkd4;->a(ILu3j;ZLo3a;Ljava/lang/Integer;Ljava/util/Map;Ljava/util/Map;)Ljd4;

    move-result-object v4

    goto :goto_cd

    :cond_c3
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v0, "kotlin.Unit"

    invoke-static {v0}, Lqp2;->o(Ljava/lang/String;)V

    :goto_cd
    return-object v4

    :pswitch_ce
    check-cast v0, Lc8l;

    check-cast v6, Lx7l;

    check-cast v5, Lrg;

    iget-object v0, v0, Lc8l;->h:Ljava/util/ArrayList;

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    sget-object v0, Ly7l;->a:Ly7l;

    invoke-virtual {v5, v0}, Lrg;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_e1
    check-cast v0, Lfwf;

    check-cast v6, Landroidx/recyclerview/widget/RecyclerView;

    check-cast v5, Ls6k;

    new-instance v1, Lr6k;

    invoke-virtual {v6}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    const v7, 0x7f0d03bf

    invoke-virtual {v2, v7, v6, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    const v3, 0x7f0a02b1

    invoke-static {v3, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    move-object v9, v6

    check-cast v9, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v9, :cond_147

    const v3, 0x7f0a02b2

    invoke-static {v3, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    move-object v10, v6

    check-cast v10, Lcom/opera/android/custom_views/DropShadowFrameLayout;

    if-eqz v10, :cond_147

    const v3, 0x7f0a06c3

    invoke-static {v3, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    move-object v11, v6

    check-cast v11, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v11, :cond_147

    const v3, 0x7f0a06c4

    invoke-static {v3, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    move-object v12, v6

    check-cast v12, Lcom/opera/android/custom_views/DropShadowFrameLayout;

    if-eqz v12, :cond_147

    const v3, 0x7f0a0cd8

    invoke-static {v3, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    move-object v13, v6

    check-cast v13, Lcom/opera/android/weather/view/WeatherWidgetView;

    if-eqz v13, :cond_147

    new-instance v7, Lpt1;

    move-object v8, v2

    check-cast v8, Landroidx/constraintlayout/widget/ConstraintLayout;

    const/16 v14, 0x14

    invoke-direct/range {v7 .. v14}, Lpt1;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Ljava/lang/Object;Landroid/view/View;Landroid/view/View;Landroid/view/View;B)V

    iget-object v2, v5, Ls6k;->d:Lne5;

    iget-object v3, v5, Ls6k;->e:Le7k;

    invoke-direct {v1, v0, v7, v2, v3}, Lr6k;-><init>(Lfwf;Lpt1;Lne5;Le7k;)V

    move-object v4, v1

    goto :goto_158

    :cond_147
    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_158
    return-object v4

    :pswitch_159
    check-cast v0, Lvdh;

    move-object/from16 v21, v6

    check-cast v21, Lpde;

    move-object/from16 v22, v5

    check-cast v22, Lp6l;

    iget-object v8, v0, Lvdh;->k:Lmdh;

    iget-object v9, v0, Lvdh;->l:Lqdh;

    iget-object v11, v0, Lvdh;->n:Lcy;

    iget-object v12, v0, Lvdh;->e:Lcom/opera/android/settings/SettingsManager;

    iget-object v13, v0, Lvdh;->g:Lpde;

    iget-object v14, v0, Lvdh;->h:Lkze;

    iget-object v1, v0, Lvdh;->i:Lx5f;

    iget-object v15, v0, Lvdh;->j:Lx5f;

    iget-object v2, v0, Lvdh;->m:Landroid/view/View$OnLongClickListener;

    iget-object v4, v0, Lvdh;->d:Landroidx/recyclerview/widget/RecyclerView;

    iget v5, v0, Lv5k;->c:I

    invoke-static {v4, v5, v3}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v18

    iget-object v10, v0, Lvdh;->o:Lqr8;

    iget-object v3, v0, Lvdh;->p:Lnv2;

    iget-object v0, v0, Lvdh;->q:Ltlg;

    new-instance v7, Lbeh;

    move-object/from16 v20, v0

    move-object/from16 v16, v1

    move-object/from16 v17, v2

    move-object/from16 v19, v3

    invoke-direct/range {v7 .. v22}, Lbeh;-><init>(Lmdh;Lqdh;Lqr8;Lcy;Lcom/opera/android/settings/SettingsManager;Lpde;Lkze;Lx5f;Lx5f;Landroid/view/View$OnLongClickListener;Landroid/view/View;Lnv2;Ltlg;Lpde;Lp6l;)V

    return-object v7

    :pswitch_191
    check-cast v6, Ljava/lang/String;

    check-cast v5, Lwub;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Attempting to assign conflicting values \'"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, "\' and \'"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, "\' to field \'"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, v5, Lwub;->a:Ljava/lang/Object;

    check-cast v0, Lmhe;

    iget-object v0, v0, Lmhe;->c:Ljava/lang/String;

    const/16 v2, 0x27

    invoke-static {v1, v0, v2}, Lo18;->p(Ljava/lang/StringBuilder;Ljava/lang/String;C)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :pswitch_1b9
    check-cast v0, Lqt9;

    check-cast v6, Llqj;

    check-cast v5, Ldrf;

    if-eqz v0, :cond_1cb

    invoke-virtual {v6, v0}, Llqj;->c(Lqt9;)I

    move-result v0

    iget v1, v6, Llqj;->t:I

    sub-int/2addr v0, v1

    invoke-virtual {v6, v0}, Llqj;->a(I)V

    :cond_1cb
    iget v0, v6, Llqj;->t:I

    invoke-static {v6, v4, v0, v4}, Lz5i;->p(Llqj;Ljava/lang/Integer;ILjava/lang/Integer;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->R(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lzg5;

    if-eqz v1, :cond_1dc

    iget-object v1, v1, Lzg5;->b:Ljava/lang/Integer;

    goto :goto_1dd

    :cond_1dc
    move-object v1, v4

    :goto_1dd
    invoke-interface {v5, v1}, Ldrf;->a(Ljava/lang/Integer;)Ljava/util/List;

    move-result-object v3

    if-eqz v1, :cond_208

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_208

    invoke-static {v3}, Lkotlin/collections/CollectionsKt;->K(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lzg5;

    check-cast v3, Ljava/lang/Iterable;

    invoke-static {v3, v2}, Lkotlin/collections/CollectionsKt;->G(Ljava/lang/Iterable;I)Ljava/util/List;

    move-result-object v2

    iget v3, v6, Lzg5;->a:I

    new-instance v6, Lzg5;

    invoke-direct {v6, v3, v4, v1}, Lzg5;-><init>(ILmzg;Ljava/lang/Integer;)V

    invoke-static {v6}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    check-cast v1, Ljava/util/Collection;

    check-cast v2, Ljava/lang/Iterable;

    invoke-static {v2, v1}, Lkotlin/collections/CollectionsKt;->V(Ljava/lang/Iterable;Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object v3

    :cond_208
    new-instance v1, Lyg5;

    check-cast v0, Ljava/util/Collection;

    check-cast v3, Ljava/lang/Iterable;

    invoke-static {v3, v0}, Lkotlin/collections/CollectionsKt;->V(Ljava/lang/Iterable;Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-interface {v5}, Ldrf;->c()Z

    move-result v2

    invoke-direct {v1, v0, v2}, Lyg5;-><init>(Ljava/util/List;Z)V

    return-object v1

    :pswitch_21a
    check-cast v0, Ladb;

    check-cast v6, Lgom;

    check-cast v5, Lkotlin/jvm/functions/Function0;

    iget-object v0, v0, Ladb;->b:Lcom/opera/android/BrowserActivity;

    invoke-static {v0, v6}, Lmom;->b(Lt5d;Lgom;)V

    invoke-interface {v5}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_22b
    check-cast v0, Lu6c;

    check-cast v6, Lndf;

    check-cast v5, Lafe;

    iget v1, v6, Lndf;->d:F

    invoke-virtual {v0}, Lu6c;->j()Lm6c;

    move-result-object v2

    iget v3, v2, Lm6c;->m:I

    iget v2, v2, Lm6c;->n:I

    add-int/2addr v3, v2

    int-to-float v2, v3

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v2, v3

    invoke-virtual {v0}, Lu6c;->j()Lm6c;

    move-result-object v0

    iget-object v0, v0, Lm6c;->l:Ljava/util/List;

    check-cast v0, Ljava/lang/Iterable;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_24c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_271

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    move-object v7, v6

    check-cast v7, Ln6c;

    iget v8, v7, Ln6c;->l:I

    int-to-float v8, v8

    iget v7, v7, Ln6c;->m:I

    int-to-float v7, v7

    div-float/2addr v7, v3

    add-float/2addr v7, v8

    sub-float/2addr v7, v2

    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    move-result v7

    const/high16 v8, 0x3f800000    # 1.0f

    div-float/2addr v7, v1

    sub-float/2addr v8, v7

    const/high16 v7, 0x3f400000    # 0.75f

    cmpl-float v7, v8, v7

    if-ltz v7, :cond_24c

    move-object v4, v6

    :cond_271
    check-cast v4, Ln6c;

    const/4 v0, -0x1

    if-eqz v4, :cond_279

    iget v1, v4, Ln6c;->a:I

    goto :goto_27a

    :cond_279
    move v1, v0

    :goto_27a
    invoke-interface {v5}, Liak;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    if-eqz v2, :cond_288

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne v2, v1, :cond_289

    :cond_288
    move v0, v1

    :cond_289
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0

    :pswitch_data_28e
    .packed-switch 0x0
        :pswitch_22b
        :pswitch_21a
        :pswitch_1b9
        :pswitch_191
        :pswitch_159
        :pswitch_e1
        :pswitch_ce
        :pswitch_78
        :pswitch_63
        :pswitch_46
        :pswitch_28
    .end packed-switch
.end method
