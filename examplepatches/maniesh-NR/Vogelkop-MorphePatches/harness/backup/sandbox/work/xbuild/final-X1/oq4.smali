.class public final Loq4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final a:Landroid/widget/LinearLayout;

.field public final b:Landroid/widget/TextView;

.field public final c:Lcom/opera/android/ui/catalog/widget/OperaListItem;

.field public final d:Lcom/opera/android/ui/catalog/widget/OperaListItem;

.field public final e:Lcom/opera/android/ui/catalog/widget/OperaListItem;

.field public final f:Lcom/opera/android/ui/catalog/widget/OperaListItem;

.field public final g:Lcom/opera/android/ui/catalog/widget/OperaListItem;

.field public final h:Lcom/opera/android/ui/catalog/widget/OperaListItem;

.field public final i:Lcom/opera/android/ui/catalog/widget/OperaListItem;

.field public final j:Lcom/opera/android/ui/catalog/widget/OperaListItem;

.field public final k:Lcom/opera/android/ui/catalog/widget/OperaListItem;

.field public final l:Lcom/opera/android/ui/catalog/widget/OperaListItem;

.field public final m:Lcom/opera/android/ui/catalog/widget/OperaListItem;

.field public final n:Lcom/opera/android/ui/catalog/widget/OperaListItem;

.field public final o:Lcom/opera/android/ui/catalog/widget/OperaListItem;

.field public final p:Lcom/google/android/material/textfield/TextInputLayout;

.field public final q:Lcom/opera/android/ui/catalog/widget/OperaListItem;

.field public final r:Lcom/opera/android/ui/catalog/widget/OperaListItem;

.field public final s:Lcom/opera/android/ui/catalog/widget/OperaListItem;


# direct methods
.method public constructor <init>(Landroid/widget/LinearLayout;Landroid/widget/TextView;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/google/android/material/textfield/TextInputLayout;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;)V
    .registers 20

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Loq4;->a:Landroid/widget/LinearLayout;

    iput-object p2, p0, Loq4;->b:Landroid/widget/TextView;

    iput-object p3, p0, Loq4;->c:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iput-object p4, p0, Loq4;->d:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iput-object p5, p0, Loq4;->e:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iput-object p6, p0, Loq4;->f:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iput-object p7, p0, Loq4;->g:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iput-object p8, p0, Loq4;->h:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iput-object p9, p0, Loq4;->i:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iput-object p10, p0, Loq4;->j:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iput-object p11, p0, Loq4;->k:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iput-object p12, p0, Loq4;->l:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iput-object p13, p0, Loq4;->m:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iput-object p14, p0, Loq4;->n:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iput-object p15, p0, Loq4;->o:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    move-object/from16 p1, p16

    iput-object p1, p0, Loq4;->p:Lcom/google/android/material/textfield/TextInputLayout;

    move-object/from16 p1, p17

    iput-object p1, p0, Loq4;->q:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    move-object/from16 p1, p18

    iput-object p1, p0, Loq4;->r:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    move-object/from16 p1, p19

    iput-object p1, p0, Loq4;->s:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    return-void
.end method

.method public static a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Loq4;
    .registers 26

    move-object/from16 v0, p1

    const v1, 0x7f0d00bf

    const/4 v2, 0x0

    move-object/from16 v3, p0

    invoke-virtual {v3, v1, v0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    if-eqz p2, :cond_11

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    :cond_11
    const v0, 0x7f0a040a

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v5, v2

    check-cast v5, Landroid/widget/TextView;

    if-eqz v5, :cond_104

    const v0, 0x7f0a049b

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v6, v2

    check-cast v6, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v6, :cond_104

    const v0, 0x7f0a049c

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v7, v2

    check-cast v7, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v7, :cond_104

    const v0, 0x7f0a05a5

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v8, v2

    check-cast v8, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v8, :cond_104

    const v0, 0x7f0a05a6

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v9, v2

    check-cast v9, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v9, :cond_104

    const v0, 0x7f0a05a7

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v10, v2

    check-cast v10, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v10, :cond_104

    const v0, 0x7f0a05a8

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v11, v2

    check-cast v11, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v11, :cond_104

    const v0, 0x7f0a05a9

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v12, v2

    check-cast v12, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v12, :cond_104

    const v0, 0x7f0a05aa

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v13, v2

    check-cast v13, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v13, :cond_104

    const v0, 0x7f0a05ab

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v14, v2

    check-cast v14, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v14, :cond_104

    const v0, 0x7f0a05ac

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v15, v2

    check-cast v15, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v15, :cond_104

    const v0, 0x7f0a05ad

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v16, v2

    check-cast v16, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v16, :cond_104

    const v0, 0x7f0a05ae

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v17, v2

    check-cast v17, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v17, :cond_104

    const v0, 0x7f0a05af

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v18, v2

    check-cast v18, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v18, :cond_104

    const v0, 0x7f0a0ab0

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v19, v2

    check-cast v19, Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz v19, :cond_104

    const v0, 0x7f0a0ab1

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/AutoCompleteTextView;

    if-eqz v2, :cond_104

    const v0, 0x7f0a0aec

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v20, v2

    check-cast v20, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v20, :cond_104

    const v0, 0x7f0a0c7a

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v21, v2

    check-cast v21, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v21, :cond_104

    const v0, 0x7f0a0c7b

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v22, v2

    check-cast v22, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v22, :cond_104

    new-instance v3, Loq4;

    move-object v4, v1

    check-cast v4, Landroid/widget/LinearLayout;

    invoke-direct/range {v3 .. v22}, Loq4;-><init>(Landroid/widget/LinearLayout;Landroid/widget/TextView;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/google/android/material/textfield/TextInputLayout;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;)V

    return-object v3

    :cond_104
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 v0, 0x0

    return-object v0
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 1

    iget-object p0, p0, Loq4;->a:Landroid/widget/LinearLayout;

    return-object p0
.end method
