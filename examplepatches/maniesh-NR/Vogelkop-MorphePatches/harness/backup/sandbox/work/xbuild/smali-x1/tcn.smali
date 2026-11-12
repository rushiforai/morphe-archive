.class public final Ltcn;
.super Llgn;
.source "SourceFile"


# instance fields
.field public final synthetic d:B

.field public final e:I

.field public final f:Z

.field public final synthetic g:Lmgn;


# direct methods
.method public constructor <init>(Lrfn;IZ)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Ltcn;->d:B

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Ltcn;->g:Lmgn;

    invoke-direct {p0, p1}, Llgn;-><init>(Lmgn;)V

    iput p2, p0, Ltcn;->e:I

    iput-boolean p3, p0, Ltcn;->f:Z

    return-void
.end method

.method public constructor <init>(Lucn;IZ)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Ltcn;->d:B

    .line 16
    iput-object p1, p0, Ltcn;->g:Lmgn;

    invoke-direct {p0, p1}, Llgn;-><init>(Lmgn;)V

    .line 17
    iput p2, p0, Ltcn;->e:I

    .line 18
    iput-boolean p3, p0, Ltcn;->f:Z

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/ViewGroup;Landroid/view/View;)Lrcn;
    .registers 15

    iget-byte v0, p0, Ltcn;->d:B

    iget-boolean v1, p0, Ltcn;->f:Z

    iget-object v2, p0, Ltcn;->g:Lmgn;

    const/16 v3, 0xc

    packed-switch v0, :pswitch_data_12e

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcxc;->t(Landroid/content/Context;)Lcxc;

    move-result-object v0

    invoke-virtual {v0}, Lno7;->i()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lbxc;

    new-instance v4, Lrcn;

    check-cast v2, Lrfn;

    iget-object v2, v2, Lrfn;->j:Lyug;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    const/4 v6, 0x4

    invoke-virtual {v0, v6, v5}, Lbxc;->a(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    const/4 v7, 0x5

    invoke-virtual {v0, v7, v6}, Lbxc;->a(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v7

    const/4 v8, 0x6

    invoke-virtual {v0, v8, v7}, Lbxc;->a(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v7

    if-eqz v1, :cond_44

    const v8, 0x7f1411b8

    goto :goto_47

    :cond_44
    const v8, 0x7f141368

    :goto_47
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_51

    invoke-virtual {v7, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    :cond_51
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_62

    const v6, 0x7f141367

    invoke-virtual {v7, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    :cond_62
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v7

    move-object v8, v0

    move-object v0, v4

    move-object v4, v5

    move-object v5, v6

    new-instance v6, Lwzg;

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_74

    move-object v7, v8

    goto :goto_7b

    :cond_74
    const v8, 0x7f1413aa

    invoke-virtual {v7, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    :goto_7b
    new-instance v8, Lpkm;

    invoke-direct {v8, v2, v3}, Lpkm;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v6, v7, v8, v3}, Lwzg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    if-eqz v1, :cond_89

    sget-object v1, Lmf0;->f:Lmf0;

    :goto_87
    move-object v8, v1

    goto :goto_8c

    :cond_89
    sget-object v1, Lmf0;->d:Lmf0;

    goto :goto_87

    :goto_8c
    const/4 v3, 0x0

    const v7, 0x7f0d00ac

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v8}, Lrcn;-><init>(Landroid/view/ViewGroup;Landroid/view/View;ILjava/lang/CharSequence;Ljava/lang/CharSequence;Lwzg;ILmf0;)V

    move-object v1, v0

    new-instance v2, Lscn;

    const/4 v3, 0x1

    invoke-direct {v2, p0, p2, v3}, Lscn;-><init>(Llgn;Landroid/view/View;B)V

    invoke-virtual {v1, v2}, Llz3;->a(Lkz3;)V

    return-object v1

    :pswitch_a0
    new-instance v0, Lrcn;

    check-cast v2, Lucn;

    iget-object v4, v2, Lucn;->j:Lgjm;

    iget-object v2, v2, Lucn;->k:Lysj;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    const/high16 v6, 0x40800000    # 4.0f

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-static {v6, v5}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v5

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    iget v7, p0, Ltcn;->e:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    filled-new-array {v8}, [Ljava/lang/Object;

    move-result-object v8

    const v9, 0x7f12006e

    invoke-virtual {v6, v9, v7, v8}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {v7}, Lcxc;->t(Landroid/content/Context;)Lcxc;

    move-result-object v8

    invoke-virtual {v8}, Lno7;->i()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lbxc;

    if-eqz v1, :cond_e6

    const/16 v9, 0x8

    invoke-virtual {v8, v9, v7}, Lbxc;->a(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v8

    goto :goto_eb

    :cond_e6
    const/4 v9, 0x7

    invoke-virtual {v8, v9, v7}, Lbxc;->a(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v8

    :goto_eb
    if-nez v8, :cond_fa

    if-eqz v1, :cond_f3

    const v8, 0x7f141385

    goto :goto_f6

    :cond_f3
    const v8, 0x7f141384

    :goto_f6
    invoke-virtual {v7, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    :cond_fa
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v7

    move-object v9, v6

    new-instance v6, Lwzg;

    const v10, 0x7f141383

    invoke-virtual {v7, v10}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    new-instance v10, Lobn;

    const/4 v11, 0x2

    invoke-direct {v10, v2, v4, v11}, Lobn;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v6, v7, v10, v3}, Lwzg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    if-eqz v1, :cond_116

    sget-object v1, Lmf0;->c:Lmf0;

    goto :goto_118

    :cond_116
    sget-object v1, Lmf0;->b:Lmf0;

    :goto_118
    const v7, 0x7f0d00ad

    move-object v2, p2

    move v3, v5

    move-object v5, v8

    move-object v4, v9

    move-object v8, v1

    move-object v1, p1

    invoke-direct/range {v0 .. v8}, Lrcn;-><init>(Landroid/view/ViewGroup;Landroid/view/View;ILjava/lang/CharSequence;Ljava/lang/CharSequence;Lwzg;ILmf0;)V

    new-instance v1, Lscn;

    const/4 v3, 0x0

    invoke-direct {v1, p0, p2, v3}, Lscn;-><init>(Llgn;Landroid/view/View;B)V

    invoke-virtual {v0, v1}, Llz3;->a(Lkz3;)V

    return-object v0

    :pswitch_data_12e
    .packed-switch 0x0
        :pswitch_a0
    .end packed-switch
.end method
