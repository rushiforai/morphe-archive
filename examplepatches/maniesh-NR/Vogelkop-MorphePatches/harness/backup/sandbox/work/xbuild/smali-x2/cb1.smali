.class public final Lcb1;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ldb1;

.field public final b:Lab1;

.field public final c:Lab1;

.field public final d:Landroid/view/View;


# direct methods
.method public constructor <init>(Ldb1;Lab1;Lab1;Landroid/view/View;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcb1;->a:Ldb1;

    iput-object p2, p0, Lcb1;->b:Lab1;

    iput-object p3, p0, Lcb1;->c:Lab1;

    iput-object p4, p0, Lcb1;->d:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/Menu;)Z
    .registers 18

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lcb1;->b:Lab1;

    invoke-virtual {v2}, Lab1;->invoke()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkfl;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_15

    return v4

    :cond_15
    invoke-interface {v1}, Landroid/view/Menu;->clear()V

    iget-object v2, v2, Lkfl;->a:Ljava/util/List;

    move-object v3, v2

    check-cast v3, Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->size()I

    move-result v3

    const/4 v5, 0x1

    move v6, v4

    move v7, v5

    move v8, v7

    :goto_25
    if-ge v6, v3, :cond_f5

    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljfl;

    instance-of v10, v9, Lsfl;

    const/4 v11, 0x2

    if-eqz v10, :cond_89

    add-int/lit8 v10, v7, 0x1

    iget-object v12, v9, Ljfl;->a:Ljava/lang/Object;

    sget-object v13, Lvtp;->g:Ljava/lang/Object;

    invoke-static {v12, v13}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_42

    const v12, 0x1020020

    goto :goto_73

    :cond_42
    sget-object v13, Lvtp;->h:Ljava/lang/Object;

    invoke-static {v12, v13}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_4e

    const v12, 0x1020021

    goto :goto_73

    :cond_4e
    sget-object v13, Lvtp;->i:Ljava/lang/Object;

    invoke-static {v12, v13}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_5a

    const v12, 0x1020022

    goto :goto_73

    :cond_5a
    sget-object v13, Lvtp;->j:Ljava/lang/Object;

    invoke-static {v12, v13}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_66

    const v12, 0x102001f

    goto :goto_73

    :cond_66
    sget-object v13, Lvtp;->k:Ljava/lang/Object;

    invoke-static {v12, v13}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_72

    const v12, 0x1020043

    goto :goto_73

    :cond_72
    move v12, v7

    :goto_73
    check-cast v9, Lsfl;

    iget-object v13, v9, Lsfl;->b:Ljava/lang/String;

    invoke-interface {v1, v8, v12, v7, v13}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v7

    invoke-interface {v7, v11}, Landroid/view/MenuItem;->setShowAsAction(I)V

    new-instance v11, Lbb1;

    invoke-direct {v11, v9, v0, v4}, Lbb1;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v7, v11}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    :goto_86
    move v7, v10

    goto/16 :goto_f0

    :cond_89
    instance-of v10, v9, Lyfl;

    if-eqz v10, :cond_ea

    add-int/lit8 v10, v7, 0x1

    iget-object v12, v0, Lcb1;->d:Landroid/view/View;

    invoke-virtual {v12}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v12

    check-cast v9, Lyfl;

    iget-object v13, v9, Lyfl;->b:Landroid/view/textclassifier/TextClassification;

    iget v14, v9, Lyfl;->c:I

    iget-object v9, v9, Lyfl;->d:Landroid/graphics/drawable/Drawable;

    const v15, 0x1020041

    if-gez v14, :cond_b9

    invoke-virtual {v13}, Landroid/view/textclassifier/TextClassification;->getLabel()Ljava/lang/CharSequence;

    move-result-object v14

    invoke-interface {v1, v15, v15, v7, v14}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v7

    invoke-interface {v7, v11}, Landroid/view/MenuItem;->setShowAsAction(I)V

    invoke-interface {v7, v9}, Landroid/view/MenuItem;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;

    new-instance v9, Lbb1;

    invoke-direct {v9, v12, v13, v11}, Lbb1;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v7, v9}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    goto :goto_86

    :cond_b9
    if-nez v14, :cond_bd

    move v12, v5

    goto :goto_be

    :cond_bd
    move v12, v4

    :goto_be
    invoke-virtual {v13}, Landroid/view/textclassifier/TextClassification;->getActions()Ljava/util/List;

    move-result-object v13

    invoke-interface {v13, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/app/RemoteAction;

    if-eqz v12, :cond_cc

    move v14, v15

    goto :goto_cd

    :cond_cc
    move v14, v4

    :goto_cd
    invoke-virtual {v13}, Landroid/app/RemoteAction;->getTitle()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-interface {v1, v15, v14, v7, v4}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v4

    if-nez v12, :cond_d8

    const/4 v11, 0x0

    :cond_d8
    invoke-interface {v4, v11}, Landroid/view/MenuItem;->setShowAsAction(I)V

    if-eqz v9, :cond_e0

    invoke-interface {v4, v9}, Landroid/view/MenuItem;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;

    :cond_e0
    new-instance v7, Laxe;

    const/4 v9, 0x4

    invoke-direct {v7, v13, v9}, Laxe;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v4, v7}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    goto :goto_86

    :cond_ea
    instance-of v4, v9, Lwfl;

    if-eqz v4, :cond_f0

    add-int/lit8 v8, v8, 0x1

    :cond_f0
    :goto_f0
    add-int/lit8 v6, v6, 0x1

    const/4 v4, 0x0

    goto/16 :goto_25

    :cond_f5
    return v5
.end method
