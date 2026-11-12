.class public final Lqim;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ldx3;

.field public final b:Lll9;

.field public final c:Lz77;

.field public final d:Lnej;

.field public final e:Lysj;

.field public final f:Laal;

.field public final g:Loz3;

.field public final h:Lp77;

.field public final i:Lqie;

.field public final j:Lisj;

.field public final k:Lbpd;

.field public l:Luwf;

.field public m:Lz8b;

.field public n:Lu7k;

.field public o:Lb2l;

.field public p:Z

.field public q:Z

.field public final r:Lh7f;

.field public s:Z

.field public t:Z

.field public final u:[Lijm;

.field public v:Z

.field public w:Z


# direct methods
.method public constructor <init>(Ldx3;Ldx3;Ldx3;Landroid/view/ViewGroup;Z)V
    .registers 11

    new-instance v0, Lp77;

    invoke-direct {v0, p3}, Lp77;-><init>(Ldx3;)V

    new-instance p3, Lqie;

    const/16 v1, 0x15

    const/4 v2, 0x0

    invoke-direct {p3, v1, v2}, Lqie;-><init>(BZ)V

    new-instance v1, Lisj;

    new-instance v3, Ljjg;

    const/16 v4, 0xd

    invoke-direct {v3, p4, v4}, Ljjg;-><init>(Ljava/lang/Object;B)V

    new-instance p4, Lfrk;

    const/4 v4, 0x1

    invoke-direct {p4, v4}, Lfrk;-><init>(B)V

    invoke-direct {v1, v3, p4}, Lisj;-><init>(Lesk;Lesk;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean v4, p0, Lqim;->p:Z

    new-instance p4, Lh7f;

    invoke-direct {p4}, Ljava/lang/Object;-><init>()V

    iput-object p4, p0, Lqim;->r:Lh7f;

    sget-object p4, Lijm;->a:Lijm;

    sget-object v3, Lijm;->b:Lijm;

    filled-new-array {p4, v3}, [Lijm;

    move-result-object p4

    iput-object p4, p0, Lqim;->u:[Lijm;

    iput-object p1, p0, Lqim;->a:Ldx3;

    new-instance p1, Lll9;

    new-instance p4, Lmcj;

    invoke-direct {p4, p0, p2, v2}, Lmcj;-><init>(Ljava/lang/Object;Ljava/lang/Object;Z)V

    invoke-direct {p1, p4, p0}, Lll9;-><init>(Lmcj;Lqim;)V

    iput-object p1, p0, Lqim;->b:Lll9;

    iput-object v0, p0, Lqim;->h:Lp77;

    iput-object p3, p0, Lqim;->i:Lqie;

    iput-object v1, p0, Lqim;->j:Lisj;

    new-instance p1, Lz77;

    invoke-direct {p1, p0}, Lr22;-><init>(Lqim;)V

    iput-object p1, p0, Lqim;->c:Lz77;

    new-instance p1, Lnej;

    invoke-direct {p1, p0}, Lr22;-><init>(Lqim;)V

    iput-object p1, p0, Lqim;->d:Lnej;

    new-instance p1, Lysj;

    invoke-direct {p1, p0}, Lr22;-><init>(Lqim;)V

    iput-object p1, p0, Lqim;->e:Lysj;

    new-instance p1, Laal;

    invoke-direct {p1, p0}, Lr22;-><init>(Lqim;)V

    iput-object p1, p0, Lqim;->f:Laal;

    new-instance p1, Loz3;

    invoke-direct {p1, p0}, Lr22;-><init>(Lqim;)V

    iput-object p1, p0, Lqim;->g:Loz3;

    new-instance p1, Lbpd;

    invoke-direct {p1, p0}, Lbpd;-><init>(Lqim;)V

    iput-object p1, p0, Lqim;->k:Lbpd;

    iput-boolean p5, p0, Lqim;->t:Z

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 17

    move-object/from16 v0, p0

    iget-boolean v1, v0, Lqim;->v:Z

    const/4 v2, 0x1

    if-eqz v1, :cond_a

    iput-boolean v2, v0, Lqim;->w:Z

    return-void

    :cond_a
    iput-boolean v2, v0, Lqim;->v:Z

    const/4 v1, 0x0

    :goto_d
    move v3, v1

    :goto_e
    iget-object v4, v0, Lqim;->u:[Lijm;

    array-length v5, v4

    if-ge v3, v5, :cond_2e8

    aget-object v4, v4, v3

    iget-boolean v5, v0, Lqim;->p:Z

    if-eqz v5, :cond_22

    invoke-virtual {v0}, Lqim;->d()Z

    move-result v4

    invoke-virtual {v0, v4}, Lqim;->e(Z)V

    goto/16 :goto_2d9

    :cond_22
    iget-object v5, v0, Lqim;->h:Lp77;

    iget-object v6, v5, Lp77;->d:Ljava/lang/Object;

    check-cast v6, Landroid/util/Pair;

    const/4 v7, 0x0

    sget-object v8, Lhjm;->b:Lhjm;

    iget-object v9, v0, Lqim;->a:Ldx3;

    if-nez v6, :cond_6c

    iget-boolean v6, v0, Lqim;->q:Z

    if-nez v6, :cond_6c

    iget-object v6, v0, Lqim;->c:Lz77;

    invoke-virtual {v6, v4}, Lr22;->e(Lijm;)Ljava/util/ArrayDeque;

    move-result-object v10

    invoke-virtual {v10}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_6c

    invoke-virtual {v6, v4}, Lr22;->e(Lijm;)Ljava/util/ArrayDeque;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lb87;

    iget-object v6, v0, Lqim;->o:Lb2l;

    invoke-interface {v4, v6}, Lb87;->isAllowed(Lb2l;)Z

    move-result v6

    if-eqz v6, :cond_67

    invoke-interface {v4, v9, v7}, Lb87;->createDialog(Landroid/content/Context;Lb2l;)Lrim;

    move-result-object v6

    if-nez v6, :cond_5f

    invoke-interface {v4, v8}, Ljjm;->finish(Lhjm;)V

    invoke-virtual {v0}, Lqim;->a()V

    goto/16 :goto_2d9

    :cond_5f
    invoke-virtual {v5, v6, v4}, Lp77;->e(Lrim;Lb87;)V

    invoke-virtual {v0, v2}, Lqim;->e(Z)V

    goto/16 :goto_2d9

    :cond_67
    invoke-virtual {v0}, Lqim;->a()V

    goto/16 :goto_2d9

    :cond_6c
    iget-object v6, v0, Lqim;->b:Lll9;

    iget v10, v6, Lll9;->h:I

    if-gtz v10, :cond_2d9

    iget v6, v6, Lll9;->i:I

    if-gtz v6, :cond_2d9

    iget-object v6, v5, Lp77;->d:Ljava/lang/Object;

    check-cast v6, Landroid/util/Pair;

    if-nez v6, :cond_2d9

    iget-boolean v6, v0, Lqim;->q:Z

    if-nez v6, :cond_2d9

    iget-object v6, v0, Lqim;->i:Lqie;

    iget-object v6, v6, Lqie;->b:Ljava/lang/Object;

    check-cast v6, Landroid/util/Pair;

    if-nez v6, :cond_2d9

    iget-object v6, v0, Lqim;->d:Lnej;

    invoke-virtual {v6, v4}, Lr22;->e(Lijm;)Ljava/util/ArrayDeque;

    move-result-object v10

    invoke-virtual {v10}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_b6

    invoke-virtual {v6, v4}, Lr22;->e(Lijm;)Ljava/util/ArrayDeque;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcej;

    iget-object v5, v0, Lqim;->o:Lb2l;

    invoke-virtual {v4, v5}, Lcej;->isAllowed(Lb2l;)Z

    move-result v5

    if-eqz v5, :cond_b1

    invoke-virtual {v0}, Lqim;->b()Z

    invoke-virtual {v0, v4, v7}, Lqim;->h(Lcej;Lb2l;)Ldej;

    invoke-virtual {v0, v2}, Lqim;->e(Z)V

    goto/16 :goto_2d9

    :cond_b1
    invoke-virtual {v0}, Lqim;->a()V

    goto/16 :goto_2d9

    :cond_b6
    iget-object v6, v0, Lqim;->e:Lysj;

    invoke-virtual {v6, v4}, Lr22;->e(Lijm;)Ljava/util/ArrayDeque;

    move-result-object v10

    invoke-virtual {v10}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_ff

    iget-boolean v10, v0, Lqim;->t:Z

    if-eqz v10, :cond_ff

    invoke-virtual {v0}, Lqim;->b()Z

    invoke-virtual {v0}, Lqim;->c()Lbtj;

    move-result-object v5

    if-eqz v5, :cond_2d9

    invoke-virtual {v6, v4}, Lr22;->e(Lijm;)Ljava/util/ArrayDeque;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lo93;

    invoke-virtual {v7}, Lo93;->d()Z

    move-result v8

    if-eqz v8, :cond_fa

    new-instance v8, Lmim;

    invoke-direct {v8, v0, v1}, Lmim;-><init>(Lqim;B)V

    invoke-interface {v5, v7, v8}, Lbtj;->z(Lo93;Lmim;)I

    move-result v5

    if-eq v5, v2, :cond_f1

    invoke-virtual {v6, v4}, Lr22;->e(Lijm;)Ljava/util/ArrayDeque;

    move-result-object v4

    invoke-virtual {v4, v7}, Ljava/util/ArrayDeque;->offerFirst(Ljava/lang/Object;)Z

    :cond_f1
    invoke-virtual {v0}, Lqim;->d()Z

    move-result v4

    invoke-virtual {v0, v4}, Lqim;->e(Z)V

    goto/16 :goto_2d9

    :cond_fa
    invoke-virtual {v0}, Lqim;->a()V

    goto/16 :goto_2d9

    :cond_ff
    iget-object v6, v0, Lqim;->g:Loz3;

    invoke-virtual {v6, v4}, Lr22;->e(Lijm;)Ljava/util/ArrayDeque;

    move-result-object v10

    invoke-virtual {v10}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v10

    iget-object v11, v0, Lqim;->j:Lisj;

    if-nez v10, :cond_168

    invoke-virtual {v0}, Lqim;->d()Z

    move-result v10

    if-nez v10, :cond_168

    iget-object v10, v0, Lqim;->m:Lz8b;

    if-eqz v10, :cond_11d

    iget-object v10, v10, Lz8b;->a:Ljava/lang/Object;

    check-cast v10, Landroid/util/Pair;

    if-nez v10, :cond_168

    :cond_11d
    iget-object v10, v11, Lisj;->d:Lhsj;

    if-nez v10, :cond_168

    iget-object v10, v0, Lqim;->n:Lu7k;

    if-nez v10, :cond_168

    invoke-virtual {v6, v4}, Lr22;->e(Lijm;)Ljava/util/ArrayDeque;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lpz3;

    iget-object v5, v0, Lqim;->m:Lz8b;

    if-eqz v5, :cond_2d9

    iget-object v6, v5, Lz8b;->b:Ljava/lang/Object;

    check-cast v6, Landroid/view/ViewGroup;

    invoke-interface {v4, v6}, Lpz3;->c(Landroid/view/ViewGroup;)Llz3;

    move-result-object v6

    if-eqz v6, :cond_15c

    new-instance v7, Lmz3;

    invoke-direct {v7, v5, v6}, Lmz3;-><init>(Lz8b;Llz3;)V

    invoke-virtual {v6, v7}, Llz3;->a(Lkz3;)V

    new-instance v7, Landroid/util/Pair;

    invoke-direct {v7, v4, v6}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object v7, v5, Lz8b;->a:Ljava/lang/Object;

    iget-object v6, v7, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v6, Llz3;

    invoke-virtual {v6}, Llz3;->f()V

    iget-object v5, v5, Lz8b;->a:Ljava/lang/Object;

    check-cast v5, Landroid/util/Pair;

    iget-object v5, v5, Landroid/util/Pair;->second:Ljava/lang/Object;

    move-object v7, v5

    check-cast v7, Lpim;

    :cond_15c
    if-nez v7, :cond_163

    invoke-interface {v4, v8}, Ljjm;->finish(Lhjm;)V

    goto/16 :goto_2d9

    :cond_163
    invoke-virtual {v0, v2}, Lqim;->e(Z)V

    goto/16 :goto_2d9

    :cond_168
    iget-object v6, v0, Lqim;->f:Laal;

    invoke-virtual {v6, v4}, Lr22;->e(Lijm;)Ljava/util/ArrayDeque;

    move-result-object v10

    invoke-virtual {v10}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_2d2

    invoke-virtual {v0}, Lqim;->d()Z

    move-result v10

    if-nez v10, :cond_2d2

    iget-object v10, v0, Lqim;->m:Lz8b;

    if-eqz v10, :cond_184

    iget-object v10, v10, Lz8b;->a:Ljava/lang/Object;

    check-cast v10, Landroid/util/Pair;

    if-nez v10, :cond_2d2

    :cond_184
    iget-object v10, v6, Laal;->e:Lb2l;

    if-eqz v10, :cond_1a6

    invoke-virtual {v6, v4}, Lr22;->e(Lijm;)Ljava/util/ArrayDeque;

    move-result-object v10

    invoke-virtual {v10}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_190
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_1a6

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lz9l;

    iget-object v13, v12, Lz9l;->a:Lb2l;

    iget-object v14, v6, Laal;->e:Lb2l;

    if-ne v13, v14, :cond_190

    invoke-interface {v10}, Ljava/util/Iterator;->remove()V

    goto :goto_1a7

    :cond_1a6
    move-object v12, v7

    :goto_1a7
    if-eqz v12, :cond_2d2

    iget-object v10, v12, Lz9l;->c:Ljjm;

    iget v13, v12, Lz9l;->b:I

    invoke-static {v13}, Lvep;->A(I)I

    move-result v14

    const/4 v15, 0x3

    const/4 v1, 0x2

    if-eqz v14, :cond_1c5

    if-eq v14, v2, :cond_1c5

    if-eq v14, v1, :cond_1bd

    if-eq v14, v15, :cond_1c5

    const/4 v14, 0x0

    goto :goto_1c6

    :cond_1bd
    move-object v14, v10

    check-cast v14, Lo93;

    invoke-virtual {v14}, Lo93;->d()Z

    move-result v14

    goto :goto_1c6

    :cond_1c5
    move v14, v2

    :goto_1c6
    if-nez v14, :cond_1cd

    invoke-virtual {v0}, Lqim;->a()V

    goto/16 :goto_2d9

    :cond_1cd
    iget-object v14, v0, Lqim;->n:Lu7k;

    if-eqz v14, :cond_1da

    iget-object v14, v14, Lu7k;->a:Ljava/lang/Object;

    check-cast v14, Lz9l;

    invoke-virtual {v14, v8}, Lz9l;->finish(Lhjm;)V

    iput-object v7, v0, Lqim;->n:Lu7k;

    :cond_1da
    if-ne v13, v15, :cond_1e0

    iget-object v14, v11, Lisj;->d:Lhsj;

    if-nez v14, :cond_1eb

    :cond_1e0
    const/4 v14, 0x4

    if-ne v13, v14, :cond_1f4

    iget-object v7, v0, Lqim;->l:Luwf;

    if-eqz v7, :cond_1f4

    iget-object v7, v7, Luwf;->a:Landroid/util/Pair;

    if-eqz v7, :cond_1f4

    :cond_1eb
    invoke-virtual {v6, v4}, Lr22;->e(Lijm;)Ljava/util/ArrayDeque;

    move-result-object v1

    invoke-virtual {v1, v12}, Ljava/util/ArrayDeque;->offerFirst(Ljava/lang/Object;)Z

    goto/16 :goto_2d9

    :cond_1f4
    iget-object v4, v12, Lz9l;->a:Lb2l;

    invoke-static {v13}, Lvep;->A(I)I

    move-result v7

    if-eqz v7, :cond_2b5

    if-eq v7, v2, :cond_2a5

    if-eq v7, v1, :cond_295

    if-ne v7, v15, :cond_2d9

    iget-object v1, v0, Lqim;->l:Luwf;

    if-eqz v1, :cond_2d9

    check-cast v10, Ls2f;

    iget-object v5, v1, Luwf;->b:Landroid/view/ViewGroup;

    iget-object v7, v1, Luwf;->c:Lgbf;

    iget-object v9, v7, Lgbf;->b:Lz43;

    invoke-virtual {v9}, Lz43;->q()Z

    move-result v9

    if-eqz v9, :cond_21a

    invoke-virtual {v7}, Lgbf;->q()Lcom/opera/android/bar/OmniButtonView;

    move-result-object v7

    if-nez v7, :cond_21c

    :cond_21a
    const/4 v7, 0x0

    goto :goto_277

    :cond_21c
    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v11, Lq2f;

    invoke-direct {v11, v9}, Lq2f;-><init>(Landroid/content/Context;)V

    new-instance v9, Lzvd;

    invoke-direct {v9, v10, v14}, Lzvd;-><init>(Ljava/lang/Object;B)V

    iput-object v9, v11, Lq2f;->e:Landroid/view/View$OnClickListener;

    new-instance v9, Landroid/util/Pair;

    invoke-direct {v9, v10, v11}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object v9, v1, Luwf;->a:Landroid/util/Pair;

    new-instance v9, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v13, -0x2

    invoke-direct {v9, v13, v13}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    iput v15, v9, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    invoke-virtual {v5, v11, v9}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v5, Lkqd;

    const/16 v9, 0x18

    invoke-direct {v5, v1, v9}, Lkqd;-><init>(Ljava/lang/Object;B)V

    iput-object v5, v11, Lq2f;->d:Lkqd;

    iput-object v7, v11, Lq2f;->f:Lcom/opera/android/bar/OmniButtonView;

    const/4 v5, 0x0

    invoke-virtual {v11, v5}, Landroid/view/View;->setVisibility(I)V

    iget-object v7, v11, Lq2f;->h:Lcq3;

    iget-object v7, v7, Lcq3;->b:Landroid/view/View;

    check-cast v7, Lcom/opera/android/bubbleview/BubbleView;

    new-instance v9, Lkqd;

    const/16 v13, 0x17

    invoke-direct {v9, v11, v13}, Lkqd;-><init>(Ljava/lang/Object;B)V

    iput-object v9, v7, Lcom/opera/android/bubbleview/BubbleView;->n:Lhxj;

    new-instance v9, Ltwf;

    invoke-direct {v9, v11, v5}, Ltwf;-><init>(Lq2f;B)V

    const-wide/16 v13, 0xfa

    invoke-virtual {v7, v9, v13, v14}, Lcom/opera/android/bubbleview/BubbleView;->a(Ljava/lang/Runnable;J)V

    iget-object v5, v11, Lq2f;->g:Ltwf;

    const-wide/16 v13, 0xbb8

    invoke-virtual {v11, v5, v13, v14}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    iget-object v1, v1, Luwf;->a:Landroid/util/Pair;

    iget-object v1, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    move-object v7, v1

    check-cast v7, Lpim;

    :goto_277
    if-nez v7, :cond_28a

    invoke-virtual {v12, v8}, Lz9l;->finish(Lhjm;)V

    new-instance v1, Lr2f;

    iget-object v5, v10, Ls2f;->c:Ljava/lang/String;

    iget-boolean v7, v10, Ls2f;->d:Z

    invoke-direct {v1, v5, v7}, Lr2f;-><init>(Ljava/lang/String;Z)V

    const/4 v5, 0x0

    invoke-virtual {v6, v1, v4, v5}, Laal;->S(Lo93;Lb2l;Z)V

    goto :goto_2d9

    :cond_28a
    new-instance v1, Lu7k;

    invoke-direct {v1, v12}, Lu7k;-><init>(Ljava/lang/Object;)V

    iput-object v1, v0, Lqim;->n:Lu7k;

    invoke-virtual {v0, v2}, Lqim;->e(Z)V

    goto :goto_2d9

    :cond_295
    check-cast v10, Lo93;

    invoke-virtual {v11, v10}, Lisj;->b(Lo93;)Lhsj;

    new-instance v1, Lu7k;

    invoke-direct {v1, v12}, Lu7k;-><init>(Ljava/lang/Object;)V

    iput-object v1, v0, Lqim;->n:Lu7k;

    invoke-virtual {v0, v2}, Lqim;->e(Z)V

    goto :goto_2d9

    :cond_2a5
    check-cast v10, Lcej;

    invoke-virtual {v0, v10, v4}, Lqim;->h(Lcej;Lb2l;)Ldej;

    new-instance v1, Lu7k;

    invoke-direct {v1, v12}, Lu7k;-><init>(Ljava/lang/Object;)V

    iput-object v1, v0, Lqim;->n:Lu7k;

    invoke-virtual {v0, v2}, Lqim;->e(Z)V

    goto :goto_2d9

    :cond_2b5
    check-cast v10, Lb87;

    invoke-interface {v10, v9, v4}, Lb87;->createDialog(Landroid/content/Context;Lb2l;)Lrim;

    move-result-object v1

    if-nez v1, :cond_2c4

    invoke-interface {v10, v8}, Ljjm;->finish(Lhjm;)V

    invoke-virtual {v0}, Lqim;->a()V

    goto :goto_2d9

    :cond_2c4
    invoke-virtual {v5, v1, v10}, Lp77;->e(Lrim;Lb87;)V

    new-instance v1, Lu7k;

    invoke-direct {v1, v12}, Lu7k;-><init>(Ljava/lang/Object;)V

    iput-object v1, v0, Lqim;->n:Lu7k;

    invoke-virtual {v0, v2}, Lqim;->e(Z)V

    goto :goto_2d9

    :cond_2d2
    invoke-virtual {v0}, Lqim;->d()Z

    move-result v1

    invoke-virtual {v0, v1}, Lqim;->e(Z)V

    :cond_2d9
    :goto_2d9
    iget-boolean v1, v0, Lqim;->w:Z

    const/4 v5, 0x0

    if-eqz v1, :cond_2e3

    iput-boolean v5, v0, Lqim;->w:Z

    move v1, v5

    goto/16 :goto_d

    :cond_2e3
    add-int/lit8 v3, v3, 0x1

    move v1, v5

    goto/16 :goto_e

    :cond_2e8
    move v5, v1

    iput-boolean v5, v0, Lqim;->v:Z

    return-void
.end method

.method public final b()Z
    .registers 3

    iget-object p0, p0, Lqim;->m:Lz8b;

    const/4 v0, 0x0

    if-eqz p0, :cond_1b

    iget-object p0, p0, Lz8b;->a:Ljava/lang/Object;

    check-cast p0, Landroid/util/Pair;

    if-nez p0, :cond_d

    move p0, v0

    goto :goto_17

    :cond_d
    iget-object p0, p0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast p0, Llz3;

    sget-object v1, Lhjm;->b:Lhjm;

    invoke-virtual {p0, v1}, Llz3;->b(Lhjm;)Z

    move-result p0

    :goto_17
    if-eqz p0, :cond_1b

    const/4 p0, 0x1

    return p0

    :cond_1b
    return v0
.end method

.method public final c()Lbtj;
    .registers 4

    iget-object v0, p0, Lqim;->k:Lbpd;

    invoke-virtual {v0}, Lbpd;->B()Lisj;

    move-result-object v0

    if-eqz v0, :cond_9

    return-object v0

    :cond_9
    iget-object v0, p0, Lqim;->b:Lll9;

    iget-object v0, v0, Lll9;->g:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_16

    move-object v0, v2

    goto :goto_1d

    :cond_16
    const/4 v1, 0x1

    invoke-static {v1, v0}, Lam2;->k(ILjava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lryl;

    :goto_1d
    if-eqz v0, :cond_27

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->isVisible()Z

    move-result p0

    if-nez p0, :cond_26

    return-object v2

    :cond_26
    return-object v0

    :cond_27
    iget-object p0, p0, Lqim;->j:Lisj;

    return-object p0
.end method

.method public final d()Z
    .registers 5

    iget-object v0, p0, Lqim;->h:Lp77;

    iget-object v0, v0, Lp77;->d:Ljava/lang/Object;

    check-cast v0, Landroid/util/Pair;

    const/4 v1, 0x1

    if-nez v0, :cond_15

    iget-boolean v0, p0, Lqim;->q:Z

    if-nez v0, :cond_15

    iget-object v0, p0, Lqim;->i:Lqie;

    iget-object v0, v0, Lqie;->b:Ljava/lang/Object;

    check-cast v0, Landroid/util/Pair;

    if-eqz v0, :cond_16

    :cond_15
    return v1

    :cond_16
    iget-object v0, p0, Lqim;->b:Lll9;

    iget-object v0, v0, Lll9;->g:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_4a

    iget-object p0, p0, Lqim;->k:Lbpd;

    iget-object p0, p0, Lbpd;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    const/4 v0, 0x0

    move v2, v0

    :goto_28
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_43

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lem8;

    iget-object v3, v3, Lem8;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_41

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    add-int/lit8 v2, v2, -0x1

    :cond_41
    add-int/2addr v2, v1

    goto :goto_28

    :cond_43
    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_4a

    return v0

    :cond_4a
    return v1
.end method

.method public final e(Z)V
    .registers 4

    iget-boolean v0, p0, Lqim;->s:Z

    if-eq v0, p1, :cond_1e

    iput-boolean p1, p0, Lqim;->s:Z

    iget-object p1, p0, Lqim;->r:Lh7f;

    invoke-static {p1, p1}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p1

    :goto_c
    invoke-virtual {p1}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1e

    invoke-virtual {p1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lwim;

    iget-boolean v1, p0, Lqim;->s:Z

    invoke-interface {v0, v1}, Lwim;->c(Z)V

    goto :goto_c

    :cond_1e
    return-void
.end method

.method public final f(Lfm8;)Leq6;
    .registers 6

    iget-object v0, p0, Lqim;->n:Lu7k;

    sget-object v1, Lhjm;->b:Lhjm;

    if-eqz v0, :cond_10

    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Lz9l;

    invoke-virtual {v0, v1}, Lz9l;->finish(Lhjm;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lqim;->n:Lu7k;

    :cond_10
    iget-object v0, p0, Lqim;->k:Lbpd;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Leq6;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object v0, v2, Leq6;->a:Ljava/lang/Object;

    iget-object v0, v0, Lbpd;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    new-instance v3, Lem8;

    invoke-direct {v3, v2, p1}, Lem8;-><init>(Leq6;Lfm8;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lqim;->c()Lbtj;

    move-result-object p1

    if-eqz p1, :cond_34

    invoke-interface {p1}, Lbtj;->I()V

    :cond_34
    iget-object p1, p0, Lqim;->l:Luwf;

    if-eqz p1, :cond_45

    iget-object p1, p1, Luwf;->a:Landroid/util/Pair;

    if-eqz p1, :cond_45

    if-eqz p1, :cond_45

    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast p1, Lq2f;

    invoke-virtual {p1, v1}, Lq2f;->f(Lhjm;)V

    :cond_45
    iget-object p1, p0, Lqim;->m:Lz8b;

    if-eqz p1, :cond_58

    iget-object p1, p1, Lz8b;->a:Ljava/lang/Object;

    check-cast p1, Landroid/util/Pair;

    if-eqz p1, :cond_58

    if-eqz p1, :cond_58

    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast p1, Llz3;

    invoke-virtual {p1, v1}, Llz3;->b(Lhjm;)Z

    :cond_58
    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lqim;->e(Z)V

    return-object v2
.end method

.method public final g(Lzhj;)V
    .registers 2

    iget-object p0, p0, Lqim;->b:Lll9;

    invoke-virtual {p0, p1}, Lll9;->b(Lzhj;)V

    return-void
.end method

.method public final h(Lcej;Lb2l;)Ldej;
    .registers 4

    iget-object v0, p0, Lqim;->a:Ldx3;

    invoke-virtual {p1, v0, p2}, Lcej;->create(Landroid/content/Context;Lb2l;)Ldej;

    move-result-object p2

    iget-object p0, p0, Lqim;->i:Lqie;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Landroid/util/Pair;

    invoke-direct {v0, p1, p2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object v0, p0, Lqie;->b:Ljava/lang/Object;

    iget-object p0, p2, Ldej;->b:Lmej;

    invoke-interface {p0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p2, p1}, Ldej;->a(Landroid/content/Context;)Landroid/view/View;

    move-result-object p1

    invoke-interface {p0, p1}, Lmej;->U(Landroid/view/View;)V

    return-object p2
.end method

.method public final i(Z)V
    .registers 5

    const/4 v0, 0x0

    iput-boolean v0, p0, Lqim;->p:Z

    iget-object v0, p0, Lqim;->b:Lll9;

    iget v1, v0, Lll9;->h:I

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    iput v1, v0, Lll9;->h:I

    if-gtz v1, :cond_1e

    iget-object v0, v0, Lll9;->d:Lil9;

    if-eqz p1, :cond_1b

    iget-boolean p1, v0, Lil9;->a:Z

    if-nez p1, :cond_1e

    iput-boolean v2, v0, Lil9;->a:Z

    invoke-static {v0}, Lvml;->c(Ljava/lang/Runnable;)V

    goto :goto_1e

    :cond_1b
    invoke-virtual {v0}, Lil9;->a()V

    :cond_1e
    :goto_1e
    invoke-virtual {p0}, Lqim;->a()V

    return-void
.end method
