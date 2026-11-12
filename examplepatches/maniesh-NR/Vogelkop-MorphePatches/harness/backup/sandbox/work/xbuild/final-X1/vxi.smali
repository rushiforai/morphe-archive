.class public final Lvxi;
.super Ldej;
.source "SourceFile"


# instance fields
.field public final synthetic c:B

.field public final d:Ljava/lang/Object;

.field public final e:Ljava/lang/Object;

.field public f:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lmej;Ljava/lang/String;Ljava/util/ArrayList;Llz8;)V
    .registers 6

    const/4 v0, 0x0

    iput-byte v0, p0, Lvxi;->c:B

    invoke-direct {p0, p1}, Ldej;-><init>(Lmej;)V

    iput-object p2, p0, Lvxi;->d:Ljava/lang/Object;

    iput-object p3, p0, Lvxi;->e:Ljava/lang/Object;

    iput-object p4, p0, Lvxi;->f:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lmej;Lswf;Lqp2;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Lvxi;->c:B

    .line 13
    invoke-direct {p0, p1}, Ldej;-><init>(Lmej;)V

    .line 14
    iput-object p3, p0, Lvxi;->d:Ljava/lang/Object;

    .line 15
    iput-object p2, p0, Lvxi;->e:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)Landroid/view/View;
    .registers 18

    move-object/from16 v1, p0

    iget-byte v0, v1, Lvxi;->c:B

    const/4 v6, 0x0

    packed-switch v0, :pswitch_data_164

    invoke-static/range {p1 .. p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    const v0, 0x7f0d03a1

    const/4 v3, 0x0

    invoke-virtual {v2, v0, v3, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    const v4, 0x7f0a02df

    invoke-static {v4, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroidx/core/widget/NestedScrollView;

    if-eqz v5, :cond_d3

    const v4, 0x7f0a07c6

    invoke-static {v4, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/LinearLayout;

    if-eqz v5, :cond_d3

    move-object v8, v0

    check-cast v8, Lcom/opera/android/custom_views/LayoutDirectionFrameLayout;

    const v9, 0x7f0a06c5

    invoke-static {v9, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v10, v4

    check-cast v10, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v10, :cond_d2

    new-instance v0, Lp8f;

    move-object v3, v5

    const/16 v5, 0x12

    const/4 v4, 0x0

    invoke-direct/range {v0 .. v5}, Lp8f;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ZB)V

    iput-object v0, v1, Lvxi;->f:Ljava/lang/Object;

    const v0, 0x7f1410fd

    invoke-virtual {v10, v0}, Landroid/widget/TextView;->setText(I)V

    invoke-static {}, Lqhj;->values()[Lqhj;

    move-result-object v0

    array-length v2, v0

    move v3, v6

    :goto_50
    if-ge v3, v2, :cond_d0

    aget-object v4, v0, v3

    iget-object v5, v1, Lvxi;->f:Ljava/lang/Object;

    check-cast v5, Lp8f;

    iget-object v10, v5, Lp8f;->c:Ljava/lang/Object;

    check-cast v10, Landroid/widget/LinearLayout;

    iget-object v11, v4, Lqhj;->a:Lqwf;

    invoke-static {v11}, Lqwf;->k(Lqwf;)Z

    move-result v12

    if-eqz v12, :cond_cd

    iget-object v12, v5, Lp8f;->d:Ljava/lang/Object;

    check-cast v12, Lvxi;

    iget-object v12, v12, Lvxi;->e:Ljava/lang/Object;

    check-cast v12, Lswf;

    iget-object v12, v12, Lswf;->f:Ljava/util/HashSet;

    invoke-virtual {v12, v11}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v12

    iget-object v13, v5, Lp8f;->b:Ljava/lang/Object;

    check-cast v13, Landroid/view/LayoutInflater;

    const v14, 0x7f0d038f

    invoke-virtual {v13, v14, v10, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v13

    invoke-virtual {v10, v13}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    sget-object v10, Lr5n;->a:Ljava/util/WeakHashMap;

    const v10, 0x7f0a0322

    invoke-static {v13, v10}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/view/View;

    check-cast v10, Lcom/opera/android/custom_views/StylingImageView;

    iget v14, v4, Lqhj;->c:I

    invoke-virtual {v10, v14}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    new-instance v14, Lp73;

    const/4 v15, 0x2

    invoke-direct {v14, v10, v15}, Lp73;-><init>(Lcom/opera/android/custom_views/StylingImageView;B)V

    invoke-static {v10}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v7

    if-eqz v7, :cond_a1

    invoke-static {v7, v10, v14}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_a1
    invoke-virtual {v14, v10}, Lp73;->a(Landroid/view/View;)V

    invoke-static {v13, v9}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/view/View;

    check-cast v7, Landroid/widget/TextView;

    iget v4, v4, Lqhj;->b:I

    invoke-virtual {v7, v4}, Landroid/widget/TextView;->setText(I)V

    const v4, 0x7f0a0201

    invoke-virtual {v13, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    if-eqz v12, :cond_bc

    move v7, v6

    goto :goto_bd

    :cond_bc
    const/4 v7, 0x4

    :goto_bd
    invoke-virtual {v4, v7}, Landroid/view/View;->setVisibility(I)V

    new-instance v4, Lhv6;

    invoke-direct {v4, v15, v5, v11, v12}, Lhv6;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    new-instance v5, Lks8;

    invoke-direct {v5, v4, v15}, Lks8;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v13, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_cd
    add-int/lit8 v3, v3, 0x1

    goto :goto_50

    :cond_d0
    move-object v3, v8

    goto :goto_e4

    :cond_d2
    move v4, v9

    :cond_d3
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_e4
    return-object v3

    :pswitch_e5
    invoke-static/range {p1 .. p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    invoke-static {v0}, Lpt1;->d(Landroid/view/LayoutInflater;)Lpt1;

    move-result-object v0

    iget-object v2, v0, Lpt1;->g:Landroid/view/View;

    check-cast v2, Landroid/widget/TextView;

    const v3, 0x7f14146f

    move-object/from16 v4, p1

    invoke-virtual {v4, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v2, v0, Lpt1;->c:Landroid/view/View;

    check-cast v2, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v3, v1, Lvxi;->d:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v2, v6}, Landroid/view/View;->setVisibility(I)V

    iget-object v2, v0, Lpt1;->e:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v2, v0, Lpt1;->f:Ljava/lang/Object;

    move-object v8, v2

    check-cast v8, Landroidx/recyclerview/widget/RecyclerView;

    new-instance v2, Lx93;

    const/4 v3, 0x5

    invoke-direct {v2, v1, v3}, Lx93;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v8, v2}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    new-instance v2, Landroidx/recyclerview/widget/LinearLayoutManager;

    const/4 v3, 0x1

    invoke-direct {v2, v3, v6}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(IZ)V

    invoke-virtual {v8, v2}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    new-instance v7, Lb5a;

    new-instance v10, Llld;

    const/16 v2, 0x18

    invoke-direct {v10, v1, v2}, Llld;-><init>(Ljava/lang/Object;B)V

    const v11, 0x7f0402f1

    const/4 v12, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v7 .. v12}, Lb5a;-><init>(Landroidx/recyclerview/widget/RecyclerView;ZLa5a;IZ)V

    invoke-virtual {v8, v7}, Landroidx/recyclerview/widget/RecyclerView;->m(Liph;)V

    iget-object v2, v1, Lvxi;->e:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    iget-object v4, v0, Lpt1;->d:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-ne v2, v3, :cond_159

    invoke-virtual {v4, v6}, Landroid/view/View;->setVisibility(I)V

    new-instance v2, Lh4i;

    const/4 v3, 0x4

    invoke-direct {v2, v1, v3}, Lh4i;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v4, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_15e

    :cond_159
    const/16 v1, 0x8

    invoke-virtual {v4, v1}, Landroid/view/View;->setVisibility(I)V

    :goto_15e
    iget-object v0, v0, Lpt1;->b:Landroid/view/View;

    check-cast v0, Landroid/widget/FrameLayout;

    return-object v0

    nop

    :pswitch_data_164
    .packed-switch 0x0
        :pswitch_e5
    .end packed-switch
.end method
