.class public final synthetic Lvk2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lvk2;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 6
    iput-byte p2, p0, Lvk2;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final a(Ljava/lang/Object;)V
    .registers 2

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 20

    move-object/from16 v0, p0

    iget-byte v0, v0, Lvk2;->a:B

    const/4 v1, 0x3

    const/4 v2, 0x7

    const/4 v3, 0x2

    const-wide/16 v4, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x1

    packed-switch v0, :pswitch_data_472

    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget v0, Lcom/opera/android/startup/WelcomeActivity;->w:I

    return-void

    :pswitch_19
    move-object/from16 v0, p1

    check-cast v0, Lqjn;

    return-void

    :pswitch_1e
    move-object/from16 v0, p1

    check-cast v0, Ldnn;

    return-void

    :pswitch_23
    move-object/from16 v0, p1

    check-cast v0, Lkqm;

    iget-object v1, v0, Lkqm;->b:Ljava/util/ArrayList;

    iget-object v6, v0, Lkqm;->b:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_7c

    invoke-virtual {v6}, Ljava/util/ArrayList;->listIterator()Ljava/util/ListIterator;

    move-result-object v1

    :goto_35
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_45

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lkqm;

    iget-wide v7, v7, Lkqm;->h:D

    add-double/2addr v4, v7

    goto :goto_35

    :cond_45
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v1

    int-to-double v7, v1

    div-double/2addr v4, v7

    const-wide v7, 0x3fb999999999999aL    # 0.1

    mul-double/2addr v4, v7

    new-instance v1, Lb5i;

    invoke-direct {v1, v4, v5, v3}, Lb5i;-><init>(DB)V

    invoke-virtual {v6}, Ljava/util/ArrayList;->listIterator()Ljava/util/ListIterator;

    move-result-object v3

    :cond_5a
    :goto_5a
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_74

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lkqm;

    invoke-virtual {v1, v4}, Lb5i;->test(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5a

    iget-wide v4, v4, Lkqm;->h:D

    iget-wide v7, v0, Lkqm;->g:D

    add-double/2addr v7, v4

    iput-wide v7, v0, Lkqm;->g:D

    goto :goto_5a

    :cond_74
    new-instance v0, Lf15;

    invoke-direct {v0, v1, v2}, Lf15;-><init>(Ljava/lang/Object;B)V

    invoke-static {v6, v0}, Lsfe;->A0(Ljava/lang/Iterable;Lsrg;)Z

    :cond_7c
    return-void

    :pswitch_7d
    move-object/from16 v0, p1

    check-cast v0, Lkqm;

    iget-object v1, v0, Lkqm;->b:Ljava/util/ArrayList;

    iget-object v3, v0, Lkqm;->b:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_c5

    new-instance v1, Lbxl;

    const/16 v4, 0xf

    invoke-direct {v1, v4}, Lbxl;-><init>(B)V

    invoke-virtual {v3}, Ljava/util/ArrayList;->listIterator()Ljava/util/ListIterator;

    move-result-object v4

    :cond_96
    :goto_96
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_bd

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lkqm;

    invoke-virtual {v1, v5}, Lbxl;->test(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_96

    iget-object v6, v0, Lkqm;->d:Lipm;

    iget-object v5, v5, Lkqm;->d:Lipm;

    iget-object v7, v6, Lipm;->a:Ljava/util/ArrayList;

    iget-object v9, v5, Lipm;->a:Ljava/util/ArrayList;

    invoke-virtual {v7, v9}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iput-boolean v8, v6, Lipm;->d:Z

    iget v7, v6, Lipm;->f:I

    iget v5, v5, Lipm;->f:I

    add-int/2addr v7, v5

    iput v7, v6, Lipm;->f:I

    goto :goto_96

    :cond_bd
    new-instance v0, Lf15;

    invoke-direct {v0, v1, v2}, Lf15;-><init>(Ljava/lang/Object;B)V

    invoke-static {v3, v0}, Lsfe;->A0(Ljava/lang/Iterable;Lsrg;)Z

    :cond_c5
    return-void

    :pswitch_c6
    move-object/from16 v0, p1

    check-cast v0, Lkqm;

    iget-object v2, v0, Lkqm;->d:Lipm;

    invoke-virtual {v2}, Lipm;->a()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v9

    const-wide v10, 0x414b774000000000L    # 3600000.0

    if-ge v9, v1, :cond_e7

    new-instance v1, Landroid/util/Pair;

    sget-object v3, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v8

    invoke-direct {v1, v3, v8}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_122

    :cond_e7
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Long;

    invoke-virtual {v9}, Ljava/lang/Long;->longValue()J

    move-result-wide v12

    move-wide v14, v4

    :goto_f7
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-ge v8, v9, :cond_118

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Long;

    invoke-virtual {v9}, Ljava/lang/Long;->longValue()J

    move-result-wide v16

    sub-long v12, v16, v12

    long-to-double v12, v12

    div-double/2addr v12, v10

    invoke-static {v12, v13}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v9

    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-double/2addr v14, v12

    add-int/lit8 v8, v8, 0x1

    move-wide/from16 v12, v16

    goto :goto_f7

    :cond_118
    new-instance v3, Landroid/util/Pair;

    invoke-static {v14, v15}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v8

    invoke-direct {v3, v1, v8}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    move-object v1, v3

    :goto_122
    iget-object v3, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v3, Ljava/util/List;

    iget-object v1, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Double;

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v8

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1a9

    iget-object v1, v2, Lipm;->a:Ljava/util/ArrayList;

    invoke-static {v1}, Lsfe;->c0(Ljava/lang/Iterable;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v12

    iget-wide v14, v2, Lipm;->c:J

    sub-long/2addr v14, v12

    long-to-double v12, v14

    div-double/2addr v12, v10

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v1

    int-to-double v10, v1

    div-double/2addr v8, v10

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    move-wide v10, v4

    :goto_150
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_16d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/Double;

    invoke-virtual {v14}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v14

    sub-double/2addr v14, v8

    move-wide/from16 v16, v4

    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    invoke-static {v14, v15, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v4

    add-double/2addr v10, v4

    move-wide/from16 v4, v16

    goto :goto_150

    :cond_16d
    move-wide/from16 v16, v4

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v1

    int-to-double v3, v1

    div-double/2addr v10, v3

    invoke-static {v10, v11}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v3

    const-wide v10, 0x3eb0c6f7a0b5ed8dL    # 1.0E-6

    invoke-static {v3, v4, v10, v11}, Ljava/lang/Math;->max(DD)D

    move-result-wide v3

    new-instance v1, Lb0f;

    cmpg-double v1, v3, v16

    if-lez v1, :cond_1da

    invoke-static {v3, v4, v6}, Lwp8;->c(D[D)D

    const-wide v10, 0x401921fb54442d18L    # 6.283185307179586

    invoke-static {v10, v11, v6}, Lwp8;->c(D[D)D

    const-wide/high16 v5, 0x3fe0000000000000L    # 0.5

    sub-double v10, v12, v5

    add-double/2addr v12, v5

    cmpl-double v1, v10, v12

    if-gtz v1, :cond_1ca

    sget-wide v14, Lb0f;->a:D

    mul-double/2addr v3, v14

    sub-double/2addr v10, v8

    div-double/2addr v10, v3

    sub-double/2addr v12, v8

    div-double/2addr v12, v3

    invoke-static {v10, v11, v12, v13}, Lx1p;->q(DD)D

    move-result-wide v3

    mul-double v4, v3, v5

    :cond_1a9
    invoke-virtual {v2}, Lipm;->b()J

    move-result-wide v1

    long-to-double v1, v1

    mul-double/2addr v4, v1

    iput-wide v4, v0, Lkqm;->g:D

    iget-object v1, v0, Lkqm;->b:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->listIterator()Ljava/util/ListIterator;

    move-result-object v1

    :goto_1b7
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1c7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkqm;

    iget-wide v2, v2, Lkqm;->h:D

    add-double/2addr v4, v2

    goto :goto_1b7

    :cond_1c7
    iput-wide v4, v0, Lkqm;->h:D

    return-void

    :cond_1ca
    new-instance v0, Lo4f;

    invoke-static {v10, v11}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-static {v12, v13}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    sget-object v3, Lzwc;->f:Lzwc;

    invoke-direct {v0, v3, v1, v2}, Lo4f;-><init>(Lzwc;Ljava/lang/Double;Ljava/lang/Double;)V

    throw v0

    :cond_1da
    new-instance v0, Lh0f;

    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    sget-object v3, Lzwc;->i:Lzwc;

    invoke-direct {v0, v3, v1, v2}, Lo4f;-><init>(Lzwc;Ljava/lang/Double;Ljava/lang/Number;)V

    throw v0

    :pswitch_1ea
    move-object/from16 v0, p1

    check-cast v0, Ljava/util/List;

    return-void

    :pswitch_1ef
    move-object/from16 v0, p1

    check-cast v0, Landroid/util/SparseBooleanArray;

    return-void

    :pswitch_1f4
    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/Boolean;

    return-void

    :pswitch_1f9
    move-object/from16 v0, p1

    check-cast v0, Lpne;

    iget-object v1, v0, Lpne;->c:Ljava/util/List;

    iget-object v0, v0, Lpne;->a:Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_231

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_231

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    new-array v3, v2, [Ljava/lang/String;

    :goto_213
    if-ge v7, v2, :cond_22e

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "sha256/"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v7

    add-int/lit8 v7, v7, 0x1

    goto :goto_213

    :cond_22e
    invoke-static {v0, v3}, LJ/N;->M6aqNNMf(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_231
    return-void

    :pswitch_232
    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/Throwable;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    new-instance v1, Lrl;

    const/16 v2, 0x18

    invoke-direct {v1, v2}, Lrl;-><init>(B)V

    invoke-static {v1}, Lvml;->e(Ljava/lang/Runnable;)V

    invoke-static {v0}, Lks3;->D(Ljava/lang/Throwable;)V

    return-void

    :pswitch_246
    move-object/from16 v0, p1

    check-cast v0, Lzqi;

    iget-object v0, v0, Lzqi;->b:Lmrk;

    iget-object v1, v0, Lmrk;->u:Lfe5;

    iput-boolean v8, v1, Lfe5;->d:Z

    invoke-virtual {v1}, Lfe5;->b()V

    iget-object v1, v0, Lmrk;->K:Lj55;

    iget-object v2, v1, Lj55;->f:Landroid/content/ClipboardManager;

    invoke-virtual {v2, v1}, Landroid/content/ClipboardManager;->removePrimaryClipChangedListener(Landroid/content/ClipboardManager$OnPrimaryClipChangedListener;)V

    iget-object v2, v1, Lj55;->d:Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v2

    iget-object v1, v1, Lj55;->q:Lh55;

    invoke-virtual {v2, v1}, Landroid/view/ViewTreeObserver;->removeOnWindowFocusChangeListener(Landroid/view/ViewTreeObserver$OnWindowFocusChangeListener;)V

    iget-object v1, v0, Lmrk;->H:Lxpm;

    iget-object v2, v0, Lmrk;->I:Lirk;

    invoke-virtual {v1, v2}, Lxpm;->H(Ljava/lang/Object;)V

    iget-object v1, v0, Lmrk;->D:Lrqk;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v2, Lava;->a:Lcva;

    invoke-virtual {v2, v1}, Lcva;->c(Ljava/lang/Runnable;)Z

    iget-object v0, v0, Lmrk;->L:Lqt8;

    iget-object v1, v0, Lqt8;->g:Ljava/lang/Object;

    check-cast v1, Lro9;

    iput-object v6, v1, Lro9;->d:Ljava/lang/Object;

    iget-object v1, v1, Lro9;->c:Ljava/lang/Object;

    check-cast v1, Lw6j;

    if-eqz v1, :cond_287

    invoke-virtual {v1}, Lw6j;->b()V

    :cond_287
    iget-object v0, v0, Lqt8;->e:Ljava/lang/Object;

    check-cast v0, Lwcd;

    iget-object v1, v0, Lwcd;->b:Lode;

    iget-object v2, v0, Lwcd;->f:Ld8d;

    invoke-virtual {v1, v2}, Lekc;->p(Lf7f;)V

    iget-object v1, v0, Lwcd;->g:Lh42;

    iget-object v0, v0, Lwcd;->d:Ld3g;

    invoke-virtual {v1, v0}, Lekc;->p(Lf7f;)V

    iget-wide v1, v0, Ld3g;->a:J

    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-eqz v5, :cond_2a8

    invoke-static {v1, v2}, LJ/N;->Mby5wR8C(J)V

    iput-wide v3, v0, Ld3g;->a:J

    iput-boolean v7, v0, Ld3g;->b:Z

    :cond_2a8
    return-void

    :pswitch_2a9
    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-static {v0}, LJ/N;->MLWmh7HR(Z)V

    return-void

    :pswitch_2b5
    move-object/from16 v0, p1

    check-cast v0, Lq43;

    iget v0, v0, Lq43;->a:I

    return-void

    :pswitch_2bc
    move-object/from16 v0, p1

    check-cast v0, Lq43;

    return-void

    :pswitch_2c1
    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/String;

    sget-object v1, Llqm;->t:Llqm;

    invoke-static {v0, v1, v7}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object v0

    invoke-virtual {v0, v8}, Lvx3;->c(Z)V

    iput v8, v0, Lvx3;->c:I

    invoke-static {v0}, Lam2;->v(Lvx3;)V

    return-void

    :pswitch_2d4
    move-object/from16 v0, p1

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    :try_start_2dc
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v2, "https://play.google.com/store"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object v1

    const-string v2, "com.android.vending"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    const-string v2, "com.opera.android.extra.DO_NOT_INTERCEPT"

    invoke-virtual {v1, v2, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_2fc
    .catch Landroid/content/ActivityNotFoundException; {:try_start_2dc .. :try_end_2fc} :catch_2fc

    :catch_2fc
    return-void

    :pswitch_2fd
    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void

    :pswitch_305
    move-object/from16 v0, p1

    check-cast v0, Landroid/net/Uri;

    invoke-static {}, Lorg/chromium/ui/base/Clipboard;->getInstance()Lorg/chromium/ui/base/Clipboard;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/chromium/ui/base/Clipboard;->e(Landroid/net/Uri;)V

    return-void

    :pswitch_311
    move-object/from16 v0, p1

    check-cast v0, Landroid/view/View;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v1

    iget-object v1, v1, Ld6j;->g:Lwsf;

    new-instance v2, Lvsf;

    sget-object v3, Lkl0;->h:Lkl0;

    invoke-direct {v2, v1, v3, v7}, Lvsf;-><init>(Lwsf;Lkl0;B)V

    invoke-virtual {v1, v2}, Lwsf;->a(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Lrxh;

    const v2, 0x7f141083

    invoke-direct {v1, v2}, Lrxh;-><init>(I)V

    const-string v2, "https://www.opera.com/privacy"

    invoke-static {v0, v2, v1}, Lcom/opera/android/FullscreenWebActivity;->z0(Landroid/content/Context;Ljava/lang/String;Lpxh;)V

    :pswitch_342
    return-void

    :pswitch_343
    invoke-static/range {p1 .. p1}, Lac8;->a(Ljava/lang/Object;)V

    return-void

    :pswitch_347
    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/String;

    return-void

    :pswitch_34c
    move-object/from16 v0, p1

    check-cast v0, Lo8k;

    check-cast v0, Lc5k;

    iget-object v1, v0, Lo8k;->c:Lcom/opera/android/browser/OperaPageRootView;

    iget-object v2, v0, Lc5k;->M:Lmni;

    iget-object v1, v1, Lcom/opera/android/browser/OperaPageRootView;->d:Li7f;

    invoke-virtual {v1, v2}, Li7f;->c(Ljava/lang/Object;)Z

    iget-object v1, v0, Lc5k;->E:Lw4k;

    invoke-static {v1}, Lac8;->d(Ljava/lang/Object;)V

    iget-object v1, v0, Lc5k;->y:Lzxf;

    iget-object v2, v0, Lc5k;->D:Lt4k;

    invoke-virtual {v1, v2}, Lzxf;->H(Ljava/lang/Object;)V

    iget-object v1, v0, Lc5k;->A:Lbx8;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Ldg7;

    const/16 v3, 0x11

    invoke-direct {v2, v1, v3}, Ldg7;-><init>(Ljava/lang/Object;B)V

    iget-object v3, v1, Lbx8;->a:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    move v5, v7

    :cond_37a
    :goto_37a
    if-ge v5, v4, :cond_394

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    add-int/lit8 v5, v5, 0x1

    check-cast v8, Lzw8;

    iget-object v8, v8, Lzw8;->b:Lxw8;

    if-eqz v8, :cond_37a

    const-class v9, Lxw8;

    invoke-virtual {v9, v9}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v9

    if-eqz v9, :cond_37a

    invoke-interface {v2, v8}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto :goto_37a

    :cond_394
    iget-object v2, v1, Lbx8;->n:Lu37;

    invoke-virtual {v2}, Lu37;->f()V

    iget-object v1, v1, Lbx8;->a:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    iget-object v1, v0, Lc5k;->t:Lkue;

    iput-object v6, v1, Lkue;->g:Lz4k;

    iget-object v1, v0, Lc5k;->z:Lp0c;

    iget-object v1, v1, Lp0c;->c:Li7f;

    invoke-virtual {v1, v0}, Li7f;->c(Ljava/lang/Object;)Z

    iget-object v1, v0, Lc5k;->q:Lcv8;

    iget-object v2, v1, Lcv8;->g:Lqie;

    iget-object v2, v1, Lcv8;->n:Ltsd;

    iget-object v3, v1, Lcv8;->o:Lzu8;

    invoke-virtual {v2, v3}, Lekc;->p(Lf7f;)V

    iget-object v2, v1, Lcv8;->c:Lcom/opera/android/feed/FeedScrollView;

    iput-object v6, v2, Lcom/opera/android/feed/FeedScrollView;->J:Lut3;

    iget-object v2, v1, Lcv8;->v:Lpr;

    iget-object v3, v2, Lpr;->d:Ljava/lang/Object;

    check-cast v3, Lode;

    iget-object v4, v1, Lcv8;->C:Lzu8;

    invoke-virtual {v3, v4}, Lekc;->p(Lf7f;)V

    iget-object v3, v1, Lcv8;->e:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v4, v1, Lcv8;->r:Lfv8;

    invoke-virtual {v3, v4}, Landroidx/recyclerview/widget/RecyclerView;->q0(Liph;)V

    invoke-virtual {v3, v6}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    iget-object v3, v1, Lcv8;->q:Lu37;

    invoke-virtual {v3}, Lu37;->f()V

    iget-object v1, v1, Lcv8;->p:Lt5k;

    invoke-virtual {v1}, Lha2;->onDestroy()V

    iget-object v1, v2, Lpr;->b:Ljava/lang/Object;

    check-cast v1, Lpde;

    iget-object v3, v2, Lpr;->e:Ljava/lang/Object;

    check-cast v3, Lhr8;

    invoke-virtual {v1, v3}, Lekc;->p(Lf7f;)V

    iget-object v1, v2, Lpr;->c:Ljava/lang/Object;

    check-cast v1, Lpde;

    iget-object v2, v2, Lpr;->f:Ljava/lang/Object;

    check-cast v2, Lhr8;

    invoke-virtual {v1, v2}, Lekc;->p(Lf7f;)V

    iget-object v1, v0, Lc5k;->j:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v1, v0}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    iget-object v1, v0, Lc5k;->J:Lv4k;

    iget-object v2, v1, Lv4k;->b:Lc5k;

    iget-object v2, v2, Lc5k;->l:Lcom/opera/android/feed/FeedScrollView;

    iget-object v2, v2, Lcom/opera/android/feed/FeedScrollView;->D:Li7f;

    invoke-virtual {v2, v1}, Li7f;->c(Ljava/lang/Object;)Z

    iget-object v1, v0, Lc5k;->L:Lx4k;

    iget-object v2, v1, Lx4k;->b:Low8;

    if-eqz v2, :cond_408

    invoke-virtual {v2, v1}, Landroidx/recyclerview/widget/d;->unregisterAdapterDataObserver(Lgph;)V

    iput-object v6, v1, Lx4k;->b:Low8;

    :cond_408
    iget-boolean v2, v1, Lx4k;->c:Z

    if-eqz v2, :cond_418

    new-instance v2, Lmni;

    const/16 v3, 0x16

    invoke-direct {v2, v1, v3}, Lmni;-><init>(Ljava/lang/Object;B)V

    invoke-static {v2}, Lvml;->c(Ljava/lang/Runnable;)V

    iput-boolean v7, v1, Lx4k;->c:Z

    :cond_418
    iget-object v1, v0, Lc5k;->P:Lb5k;

    invoke-virtual {v1}, Lb5k;->b()V

    iget-object v1, v0, Lc5k;->X:Lru9;

    iget-object v2, v0, Lc5k;->Y:Lx53;

    invoke-virtual {v1, v2}, Lru9;->d(Ln1;)V

    iget-object v0, v0, Lc5k;->g:Lpde;

    sget-object v1, Log;->a:Log;

    invoke-virtual {v0, v1}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_42c
    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_439

    sput v8, Lcom/opera/android/browser/BannerBlockerHelper;->c:I

    goto :goto_444

    :cond_439
    sget-object v2, Lcom/opera/android/browser/BannerBlockerHelper;->b:[Ljava/lang/String;

    invoke-static {v2, v0}, Ljava/util/Arrays;->binarySearch([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    if-gez v0, :cond_442

    move v1, v3

    :cond_442
    sput v1, Lcom/opera/android/browser/BannerBlockerHelper;->c:I

    :goto_444
    return-void

    :pswitch_445
    move-object/from16 v0, p1

    check-cast v0, Landroid/graphics/drawable/Animatable;

    instance-of v1, v0, Landroidx/vectordrawable/graphics/drawable/Animatable2Compat;

    if-eqz v1, :cond_455

    check-cast v0, Landroidx/vectordrawable/graphics/drawable/Animatable2Compat;

    sget-object v1, Lzk2;->a:Lxk2;

    invoke-interface {v0, v1}, Landroidx/vectordrawable/graphics/drawable/Animatable2Compat;->registerAnimationCallback(Landroidx/vectordrawable/graphics/drawable/Animatable2Compat$AnimationCallback;)V

    goto :goto_460

    :cond_455
    instance-of v1, v0, Landroid/graphics/drawable/Animatable2;

    if-eqz v1, :cond_460

    check-cast v0, Landroid/graphics/drawable/Animatable2;

    sget-object v1, Lyk2;->a:Lwk2;

    invoke-interface {v0, v1}, Landroid/graphics/drawable/Animatable2;->registerAnimationCallback(Landroid/graphics/drawable/Animatable2$AnimationCallback;)V

    :cond_460
    :goto_460
    return-void

    :pswitch_461
    move-object/from16 v0, p1

    check-cast v0, Landroid/graphics/drawable/Animatable;

    invoke-interface {v0}, Landroid/graphics/drawable/Animatable;->stop()V

    return-void

    :pswitch_469
    move-object/from16 v0, p1

    check-cast v0, Landroid/graphics/drawable/Animatable;

    invoke-interface {v0}, Landroid/graphics/drawable/Animatable;->start()V

    return-void

    nop

    :pswitch_data_472
    .packed-switch 0x0
        :pswitch_469
        :pswitch_461
        :pswitch_445
        :pswitch_42c
        :pswitch_34c
        :pswitch_347
        :pswitch_343
        :pswitch_342
        :pswitch_311
        :pswitch_305
        :pswitch_2fd
        :pswitch_2d4
        :pswitch_2c1
        :pswitch_2bc
        :pswitch_2b5
        :pswitch_2a9
        :pswitch_246
        :pswitch_232
        :pswitch_1f9
        :pswitch_1f4
        :pswitch_1ef
        :pswitch_1ea
        :pswitch_c6
        :pswitch_7d
        :pswitch_23
        :pswitch_1e
        :pswitch_19
    .end packed-switch
.end method
