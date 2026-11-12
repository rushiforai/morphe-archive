.class public final Looj;
.super Li93;
.source "SourceFile"


# instance fields
.field public final t:Lqoj;

.field public final u:Ljvg;

.field public final v:Ltxi;

.field public w:Lpoj;


# direct methods
.method public constructor <init>(Lqoj;Ljvg;)V
    .registers 5

    const v0, 0x7f14113a

    invoke-direct {p0, v0}, Li93;-><init>(I)V

    new-instance v0, Ltxi;

    const/4 v1, 0x6

    invoke-direct {v0, p0, v1}, Ltxi;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Looj;->v:Ltxi;

    iput-object p1, p0, Looj;->t:Lqoj;

    iput-object p2, p0, Looj;->u:Ljvg;

    return-void
.end method


# virtual methods
.method public final G0()Lh93;
    .registers 1

    iget-object p0, p0, Looj;->v:Ltxi;

    return-object p0
.end method

.method public final onDestroyView()V
    .registers 2

    invoke-super {p0}, Lltl;->onDestroyView()V

    const/4 v0, 0x0

    iput-object v0, p0, Looj;->w:Lpoj;

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 6

    invoke-super {p0, p1, p2}, Li93;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget-object p1, p0, Looj;->w:Lpoj;

    iget-object p1, p1, Lpoj;->d:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lnoj;

    const/4 v0, 0x0

    invoke-direct {p2, p0, v0}, Lnoj;-><init>(Looj;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Looj;->w:Lpoj;

    iget-object p1, p1, Lpoj;->i:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lnoj;

    const/16 v0, 0x8

    invoke-direct {p2, p0, v0}, Lnoj;-><init>(Looj;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Looj;->w:Lpoj;

    iget-object p1, p1, Lpoj;->h:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lnoj;

    const/16 v0, 0x9

    invoke-direct {p2, p0, v0}, Lnoj;-><init>(Looj;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Looj;->w:Lpoj;

    iget-object p1, p1, Lpoj;->j:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lnoj;

    const/16 v0, 0xa

    invoke-direct {p2, p0, v0}, Lnoj;-><init>(Looj;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Looj;->w:Lpoj;

    iget-object p1, p1, Lpoj;->f:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lnoj;

    const/16 v1, 0xb

    invoke-direct {p2, p0, v1}, Lnoj;-><init>(Looj;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Looj;->w:Lpoj;

    iget-object p1, p1, Lpoj;->c:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lnoj;

    const/16 v1, 0xc

    invoke-direct {p2, p0, v1}, Lnoj;-><init>(Looj;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Looj;->w:Lpoj;

    iget-object p1, p1, Lpoj;->n:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lnoj;

    const/4 v1, 0x1

    invoke-direct {p2, p0, v1}, Lnoj;-><init>(Looj;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Looj;->w:Lpoj;

    iget-object p1, p1, Lpoj;->g:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lnoj;

    const/4 v1, 0x2

    invoke-direct {p2, p0, v1}, Lnoj;-><init>(Looj;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Looj;->w:Lpoj;

    iget-object p1, p1, Lpoj;->k:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lnoj;

    const/4 v1, 0x3

    invoke-direct {p2, p0, v1}, Lnoj;-><init>(Looj;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Looj;->w:Lpoj;

    iget-object p1, p1, Lpoj;->e:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lnoj;

    const/4 v1, 0x4

    invoke-direct {p2, p0, v1}, Lnoj;-><init>(Looj;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Looj;->w:Lpoj;

    iget-object p1, p1, Lpoj;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lnoj;

    const/4 v1, 0x5

    invoke-direct {p2, p0, v1}, Lnoj;-><init>(Looj;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Looj;->w:Lpoj;

    iget-object p1, p1, Lpoj;->l:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lnoj;

    const/4 v1, 0x6

    invoke-direct {p2, p0, v1}, Lnoj;-><init>(Looj;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Looj;->w:Lpoj;

    iget-object p1, p1, Lpoj;->m:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lnoj;

    const/4 v1, 0x7

    invoke-direct {p2, p0, v1}, Lnoj;-><init>(Looj;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Looj;->u:Ljvg;

    iget-object p1, p1, Ljvg;->c:Ljava/lang/Object;

    check-cast p1, Lv9j;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p2

    iget-object v1, p0, Looj;->w:Lpoj;

    iget-object v1, v1, Lpoj;->a:Landroid/widget/LinearLayout;

    new-instance v2, Lqzg;

    invoke-direct {v2, p0, v0}, Lqzg;-><init>(Ljava/lang/Object;B)V

    const/4 p0, 0x0

    invoke-static {p1, p2, v1, p0, v2}, Lxf8;->i0(Lekc;Lndc;Landroid/view/ViewGroup;Ljava/util/List;Lf7f;)V

    return-void
.end method

.method public final v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 21

    move-object/from16 v0, p2

    invoke-super/range {p0 .. p2}, Lltl;->v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V

    const v1, 0x7f0d03ac

    const/4 v2, 0x0

    move-object/from16 v3, p1

    invoke-virtual {v3, v1, v0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v0, 0x7f0a0a6d

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v5, v2

    check-cast v5, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v5, :cond_bd

    const v0, 0x7f0a0a6e

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v6, v2

    check-cast v6, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v6, :cond_bd

    const v0, 0x7f0a0a6f

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v7, v2

    check-cast v7, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v7, :cond_bd

    const v0, 0x7f0a0a70

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v8, v2

    check-cast v8, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v8, :cond_bd

    const v0, 0x7f0a0a73

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v9, v2

    check-cast v9, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v9, :cond_bd

    const v0, 0x7f0a0a74

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v10, v2

    check-cast v10, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v10, :cond_bd

    const v0, 0x7f0a0a75

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v11, v2

    check-cast v11, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v11, :cond_bd

    const v0, 0x7f0a0a76

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v12, v2

    check-cast v12, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v12, :cond_bd

    const v0, 0x7f0a0a77

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v13, v2

    check-cast v13, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v13, :cond_bd

    const v0, 0x7f0a0a79

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v14, v2

    check-cast v14, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v14, :cond_bd

    const v0, 0x7f0a0a7b

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v15, v2

    check-cast v15, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v15, :cond_bd

    const v0, 0x7f0a0a7c

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v16, v2

    check-cast v16, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v16, :cond_bd

    const v0, 0x7f0a0a7e

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v17, v2

    check-cast v17, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v17, :cond_bd

    new-instance v3, Lpoj;

    move-object v4, v1

    check-cast v4, Landroid/widget/LinearLayout;

    invoke-direct/range {v3 .. v17}, Lpoj;-><init>(Landroid/widget/LinearLayout;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;)V

    move-object/from16 v0, p0

    iput-object v3, v0, Looj;->w:Lpoj;

    return-void

    :cond_bd
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method
