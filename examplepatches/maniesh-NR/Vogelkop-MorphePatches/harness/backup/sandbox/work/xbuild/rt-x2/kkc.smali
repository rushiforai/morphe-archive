.class public final synthetic Lkkc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;

.field public final synthetic f:Ljava/lang/Object;

.field public final synthetic g:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ler9;Lekc;Likc;Lekc;Lekc;Lekc;)V
    .registers 8

    const/4 v0, 0x1

    iput-byte v0, p0, Lkkc;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkkc;->c:Ljava/lang/Object;

    iput-object p2, p0, Lkkc;->b:Ljava/lang/Object;

    iput-object p3, p0, Lkkc;->d:Ljava/lang/Object;

    iput-object p4, p0, Lkkc;->e:Ljava/lang/Object;

    iput-object p5, p0, Lkkc;->f:Ljava/lang/Object;

    iput-object p6, p0, Lkkc;->g:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Li7k;Lpde;Llg;Lfd;Lhv3;Ltsd;)V
    .registers 8

    .line 19
    const/4 v0, 0x3

    iput-byte v0, p0, Lkkc;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkkc;->b:Ljava/lang/Object;

    iput-object p2, p0, Lkkc;->d:Ljava/lang/Object;

    iput-object p3, p0, Lkkc;->e:Ljava/lang/Object;

    iput-object p4, p0, Lkkc;->f:Ljava/lang/Object;

    iput-object p5, p0, Lkkc;->g:Ljava/lang/Object;

    iput-object p6, p0, Lkkc;->c:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 8

    .line 20
    iput-byte p7, p0, Lkkc;->a:B

    iput-object p1, p0, Lkkc;->b:Ljava/lang/Object;

    iput-object p2, p0, Lkkc;->c:Ljava/lang/Object;

    iput-object p3, p0, Lkkc;->d:Ljava/lang/Object;

    iput-object p4, p0, Lkkc;->e:Ljava/lang/Object;

    iput-object p5, p0, Lkkc;->f:Ljava/lang/Object;

    iput-object p6, p0, Lkkc;->g:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 20

    move-object/from16 v0, p0

    iget-byte v1, v0, Lkkc;->a:B

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    iget-object v5, v0, Lkkc;->g:Ljava/lang/Object;

    iget-object v6, v0, Lkkc;->f:Ljava/lang/Object;

    iget-object v7, v0, Lkkc;->e:Ljava/lang/Object;

    iget-object v8, v0, Lkkc;->d:Ljava/lang/Object;

    iget-object v9, v0, Lkkc;->c:Ljava/lang/Object;

    iget-object v0, v0, Lkkc;->b:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_1aa

    move-object v10, v0

    check-cast v10, Ldtk;

    move-object v11, v9

    check-cast v11, Lctk;

    move-object v12, v8

    check-cast v12, Ljava/util/ArrayList;

    move-object v13, v7

    check-cast v13, Ljava/util/LinkedHashMap;

    move-object v14, v6

    check-cast v14, Ljava/util/List;

    move-object v15, v5

    check-cast v15, Ljava/util/ArrayList;

    invoke-virtual/range {v10 .. v15}, Ldtk;->a(Lctk;Ljava/util/ArrayList;Ljava/util/Map;Ljava/util/List;Ljava/util/List;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_31
    check-cast v0, Li7k;

    check-cast v8, Lpde;

    check-cast v7, Llg;

    check-cast v6, Lfd;

    check-cast v5, Lhv3;

    check-cast v9, Ltsd;

    new-instance v1, Lh7k;

    iget-object v0, v0, Li7k;->d:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v10

    invoke-static {v10}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v10

    const v11, 0x7f0d03c1

    invoke-virtual {v10, v11, v0, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    const v10, 0x7f0a04a5

    invoke-static {v10, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    move-object v14, v11

    check-cast v14, Landroid/widget/ImageView;

    if-eqz v14, :cond_107

    const v10, 0x7f0a0500

    invoke-static {v10, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroidx/constraintlayout/widget/Guideline;

    if-eqz v11, :cond_107

    const v10, 0x7f0a0501

    invoke-static {v10, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroidx/constraintlayout/widget/Guideline;

    if-eqz v11, :cond_107

    const v10, 0x7f0a052f

    invoke-static {v10, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroidx/constraintlayout/widget/Barrier;

    if-eqz v11, :cond_107

    const v10, 0x7f0a0530

    invoke-static {v10, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/TextView;

    if-eqz v11, :cond_107

    const v10, 0x7f0a0791

    invoke-static {v10, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    move-object v15, v11

    check-cast v15, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v15, :cond_107

    const v10, 0x7f0a093b

    invoke-static {v10, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    move-object/from16 v16, v11

    check-cast v16, Landroid/widget/ImageView;

    if-eqz v16, :cond_107

    const v10, 0x7f0a094d

    invoke-static {v10, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    move-object/from16 v17, v11

    check-cast v17, Landroid/widget/ImageView;

    if-eqz v17, :cond_107

    new-instance v12, Lor2;

    move-object v13, v0

    check-cast v13, Landroid/widget/FrameLayout;

    const/16 v18, 0x19

    invoke-direct/range {v12 .. v18}, Lor2;-><init>(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v0, v12, Lor2;->c:Landroid/view/View;

    check-cast v0, Landroid/widget/FrameLayout;

    invoke-direct {v1, v0}, Lab2;-><init>(Landroid/view/View;)V

    invoke-static {v0}, Lp37;->z(Landroid/view/View;)Lkze;

    move-result-object v0

    new-instance v2, Lf1p;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v12, v2, Lf1p;->a:Ljava/lang/Object;

    iput-object v8, v2, Lf1p;->b:Ljava/lang/Object;

    new-instance v10, Ld8d;

    const/16 v11, 0xd

    invoke-direct {v10, v2, v11}, Ld8d;-><init>(Ljava/lang/Object;B)V

    invoke-static {v8, v0, v10}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance v2, Lk5o;

    invoke-direct {v2, v0, v12, v9}, Lk5o;-><init>(Lkze;Lor2;Ltsd;)V

    new-instance v2, Lzg;

    iget-object v8, v12, Lor2;->f:Ljava/lang/Object;

    check-cast v8, Landroid/widget/ImageView;

    invoke-direct {v2, v0, v8, v7}, Lzg;-><init>(Likc;Landroid/widget/ImageView;Llg;)V

    new-instance v2, Lqb7;

    iget-object v7, v12, Lor2;->d:Ljava/lang/Object;

    check-cast v7, Landroid/widget/ImageView;

    iget-object v9, v12, Lor2;->b:Ljava/lang/Object;

    check-cast v9, Landroid/widget/ImageView;

    invoke-direct {v2, v0, v7, v9, v6}, Lqb7;-><init>(Likc;Landroid/widget/ImageView;Landroid/widget/ImageView;Lfd;)V

    iget-object v0, v12, Lor2;->e:Ljava/lang/Object;

    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance v2, Lmze;

    invoke-direct {v2, v5, v4}, Lmze;-><init>(Lhv3;B)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v0, Lmze;

    invoke-direct {v0, v5, v3}, Lmze;-><init>(Lhv3;B)V

    invoke-virtual {v8, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    move-object v2, v1

    goto :goto_118

    :cond_107
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v10}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_118
    return-object v2

    :pswitch_119
    check-cast v0, Lrji;

    check-cast v9, Lc67;

    check-cast v8, Lvji;

    check-cast v7, Ljava/lang/String;

    check-cast v5, [Ljava/lang/Object;

    iget-object v1, v0, Lrji;->b:Lvji;

    if-eq v1, v8, :cond_12a

    iput-object v8, v0, Lrji;->b:Lvji;

    move v4, v3

    :cond_12a
    iget-object v1, v0, Lrji;->c:Ljava/lang/String;

    invoke-static {v1, v7}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_135

    iput-object v7, v0, Lrji;->c:Ljava/lang/String;

    goto :goto_136

    :cond_135
    move v3, v4

    :goto_136
    iput-object v9, v0, Lrji;->a:Lc67;

    iput-object v6, v0, Lrji;->d:Ljava/lang/Object;

    iput-object v5, v0, Lrji;->e:[Ljava/lang/Object;

    iget-object v1, v0, Lrji;->f:Lp8f;

    if-eqz v1, :cond_14a

    if-eqz v3, :cond_14a

    invoke-virtual {v1}, Lp8f;->K()V

    iput-object v2, v0, Lrji;->f:Lp8f;

    invoke-virtual {v0}, Lrji;->d()V

    :cond_14a
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_14d
    move-object v1, v9

    check-cast v1, Ler9;

    check-cast v0, Lekc;

    check-cast v8, Likc;

    check-cast v7, Lekc;

    check-cast v6, Lekc;

    check-cast v5, Lekc;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v8}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v7}, Lekc;->g()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v6}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v5}, Lekc;->g()Ljava/lang/Object;

    move-result-object v6

    move-object v5, v0

    invoke-interface/range {v1 .. v6}, Ler9;->m(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_174
    check-cast v0, Lekc;

    check-cast v9, Ltsd;

    check-cast v8, Ltsd;

    check-cast v7, Ltsd;

    check-cast v6, Ltsd;

    check-cast v5, Ltsd;

    invoke-virtual {v0}, Lekc;->i()Z

    move-result v0

    if-eqz v0, :cond_1a4

    invoke-virtual {v9}, Lekc;->i()Z

    move-result v0

    if-eqz v0, :cond_1a4

    invoke-virtual {v8}, Lekc;->i()Z

    move-result v0

    if-eqz v0, :cond_1a4

    invoke-virtual {v7}, Lekc;->i()Z

    move-result v0

    if-eqz v0, :cond_1a4

    invoke-virtual {v6}, Lekc;->i()Z

    move-result v0

    if-eqz v0, :cond_1a4

    invoke-virtual {v5}, Lekc;->i()Z

    move-result v0

    if-nez v0, :cond_1a5

    :cond_1a4
    move v3, v4

    :cond_1a5
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_data_1aa
    .packed-switch 0x0
        :pswitch_174
        :pswitch_14d
        :pswitch_119
        :pswitch_31
    .end packed-switch
.end method
