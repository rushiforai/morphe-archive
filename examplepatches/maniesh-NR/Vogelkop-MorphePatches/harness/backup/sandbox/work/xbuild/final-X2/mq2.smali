.class public final Lmq2;
.super Ldej;
.source "SourceFile"


# instance fields
.field public final c:Ldx3;

.field public final d:Lcom/opera/android/browser/chromium/ChromiumContent;

.field public final e:Lzy9;

.field public final f:I

.field public final g:Liz9;

.field public final h:Ljava/util/List;

.field public final i:Ldt1;

.field public final j:Lhp2;


# direct methods
.method public constructor <init>(Ldx3;Lmej;Lcom/opera/android/browser/chromium/ChromiumContent;Lzy9;ILiz9;Ljava/util/List;)V
    .registers 8

    invoke-direct {p0, p2}, Ldej;-><init>(Lmej;)V

    iput-object p1, p0, Lmq2;->c:Ldx3;

    iput-object p3, p0, Lmq2;->d:Lcom/opera/android/browser/chromium/ChromiumContent;

    iput-object p4, p0, Lmq2;->e:Lzy9;

    iput p5, p0, Lmq2;->f:I

    iput-object p6, p0, Lmq2;->g:Liz9;

    iput-object p7, p0, Lmq2;->h:Ljava/util/List;

    new-instance p1, Ldt1;

    invoke-direct {p1}, Ldt1;-><init>()V

    iput-object p1, p0, Lmq2;->i:Ldt1;

    new-instance p1, Lhp2;

    const/16 p2, 0xd

    const/4 p3, 0x0

    invoke-direct {p1, p2, p3}, Lhp2;-><init>(BZ)V

    iput-object p1, p0, Lmq2;->j:Lhp2;

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)Landroid/view/View;
    .registers 19

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lmq2;->j:Lhp2;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    iput-wide v3, v2, Lhp2;->b:J

    new-instance v2, Ltw2;

    const/16 v3, 0xc

    invoke-direct {v2, v0, v3}, Ltw2;-><init>(Ljava/lang/Object;B)V

    new-instance v3, Lxj;

    const/16 v4, 0xd

    invoke-direct {v3, v0, v2, v4}, Lxj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v2, Lqp2;

    const/4 v4, 0x1

    invoke-direct {v2, v4}, Lqp2;-><init>(B)V

    new-instance v5, La3j;

    const/4 v6, 0x4

    invoke-direct {v5, v6}, La3j;-><init>(B)V

    iget-object v7, v0, Lmq2;->i:Ldt1;

    const-class v8, Lqq2;

    invoke-virtual {v7, v8, v3, v2, v5}, Ldt1;->J(Ljava/lang/Class;Lyjj;Lxjj;Lzjj;)V

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    invoke-static {v2}, Lpt1;->d(Landroid/view/LayoutInflater;)Lpt1;

    move-result-object v2

    iget-object v3, v2, Lpt1;->c:Landroid/view/View;

    check-cast v3, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v5, v2, Lpt1;->g:Landroid/view/View;

    check-cast v5, Landroid/widget/TextView;

    iget-object v8, v2, Lpt1;->b:Landroid/view/View;

    check-cast v8, Landroid/widget/FrameLayout;

    iget-object v9, v2, Lpt1;->f:Ljava/lang/Object;

    move-object v11, v9

    check-cast v11, Landroidx/recyclerview/widget/RecyclerView;

    new-instance v9, Landroidx/recyclerview/widget/LinearLayoutManager;

    const/4 v10, 0x0

    invoke-direct {v9, v4, v10}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(IZ)V

    invoke-virtual {v11, v9}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    invoke-virtual {v11, v7}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    move v9, v10

    new-instance v10, Lb5a;

    new-instance v13, Lu59;

    const/16 v12, 0xe

    invoke-direct {v13, v0, v12}, Lu59;-><init>(Ljava/lang/Object;B)V

    const v14, 0x7f0402f1

    const/4 v15, 0x0

    move/from16 v16, v12

    const/4 v12, 0x0

    move/from16 v6, v16

    invoke-direct/range {v10 .. v15}, Lb5a;-><init>(Landroidx/recyclerview/widget/RecyclerView;ZLa5a;IZ)V

    invoke-virtual {v11, v10}, Landroidx/recyclerview/widget/RecyclerView;->m(Liph;)V

    iget-object v10, v2, Lpt1;->e:Ljava/lang/Object;

    check-cast v10, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    new-instance v12, Lgf;

    invoke-direct {v12, v0, v6}, Lgf;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v10, v12}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v6, v7, Ldt1;->d:Ljava/lang/Object;

    check-cast v6, Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v7

    iget-object v12, v2, Lpt1;->d:Ljava/lang/Object;

    check-cast v12, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    const/16 v13, 0x8

    if-ne v7, v4, :cond_98

    invoke-virtual {v12, v9}, Landroid/view/View;->setVisibility(I)V

    new-instance v4, Lq02;

    const/16 v7, 0x18

    invoke-direct {v4, v2, v7}, Lq02;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v11, v4}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    goto :goto_9b

    :cond_98
    invoke-virtual {v12, v13}, Landroid/view/View;->setVisibility(I)V

    :goto_9b
    const/4 v2, 0x3

    iget v4, v0, Lmq2;->f:I

    if-eq v4, v2, :cond_12c

    const/4 v2, 0x5

    if-eq v4, v2, :cond_a4

    return-object v8

    :cond_a4
    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_df

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v2

    move v4, v9

    :cond_af
    if-ge v4, v2, :cond_df

    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v4, v4, 0x1

    check-cast v7, Lqq2;

    if-nez v7, :cond_bc

    const/4 v7, 0x0

    :cond_bc
    if-eqz v7, :cond_c6

    iget-object v7, v7, Lqq2;->a:Lru2;

    iget v7, v7, Lru2;->e:I

    const/16 v11, 0x2b

    if-eq v7, v11, :cond_af

    :cond_c6
    invoke-virtual {v8}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v4, 0x7f1402af

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v10, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v2, 0x7f141343

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_ed

    :cond_df
    const/4 v2, 0x4

    invoke-virtual {v10, v2}, Landroid/view/View;->setVisibility(I)V

    const v2, 0x7f14146f

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_ed
    iget-object v0, v0, Lmq2;->h:Ljava/util/List;

    move-object v1, v0

    check-cast v1, Ljava/util/Collection;

    if-eqz v1, :cond_128

    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_128

    invoke-interface {v0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lru2;

    iget-object v1, v1, Lru2;->g:Ljava/lang/String;

    if-eqz v1, :cond_128

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_128

    invoke-virtual {v8}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-interface {v0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru2;

    iget-object v0, v0, Lru2;->g:Ljava/lang/String;

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const v2, 0x7f141113

    invoke-virtual {v1, v2, v0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v3, v9}, Landroid/view/View;->setVisibility(I)V

    return-object v8

    :cond_128
    invoke-virtual {v3, v13}, Landroid/view/View;->setVisibility(I)V

    return-object v8

    :cond_12c
    const v0, 0x7f14025a

    invoke-virtual {v1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v8}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f1402bc

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-object v8
.end method

.method public final d(Ljava/util/List;)V
    .registers 6

    check-cast p1, Ljava/lang/Iterable;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_b
    :goto_b
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2b

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lru2;

    iget v2, v1, Lru2;->e:I

    const/16 v3, 0x2e

    if-ne v2, v3, :cond_1f

    const/4 v1, 0x0

    goto :goto_25

    :cond_1f
    new-instance v2, Lqq2;

    invoke-direct {v2, v1}, Lqq2;-><init>(Lru2;)V

    move-object v1, v2

    :goto_25
    if-eqz v1, :cond_b

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_b

    :cond_2b
    iget-object p0, p0, Lmq2;->i:Ldt1;

    invoke-virtual {p0, v0}, Ldt1;->K(Ljava/util/Collection;)V

    return-void
.end method
