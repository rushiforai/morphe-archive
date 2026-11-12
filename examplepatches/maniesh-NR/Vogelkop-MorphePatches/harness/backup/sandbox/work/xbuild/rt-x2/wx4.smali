.class public final Lwx4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewGroup$OnHierarchyChangeListener;


# instance fields
.field public final synthetic a:B

.field public b:Landroid/view/ViewGroup$OnHierarchyChangeListener;

.field public final synthetic c:Landroid/view/ViewGroup;


# direct methods
.method public synthetic constructor <init>(Landroid/view/ViewGroup;B)V
    .registers 3

    iput-byte p2, p0, Lwx4;->a:B

    iput-object p1, p0, Lwx4;->c:Landroid/view/ViewGroup;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onChildViewAdded(Landroid/view/View;Landroid/view/View;)V
    .registers 7

    iget-byte v0, p0, Lwx4;->a:B

    const/4 v1, -0x1

    iget-object v2, p0, Lwx4;->c:Landroid/view/ViewGroup;

    packed-switch v0, :pswitch_data_7a

    check-cast v2, Lcom/opera/android/custom_views/OperaRadioGroup;

    iget-object v0, v2, Lcom/opera/android/custom_views/OperaRadioGroup;->e:Lyhe;

    if-ne p1, v2, :cond_2e

    invoke-virtual {p2}, Landroid/view/View;->getId()I

    move-result v2

    if-ne v2, v1, :cond_1b

    invoke-static {}, Landroid/view/View;->generateViewId()I

    move-result v1

    invoke-virtual {p2, v1}, Landroid/view/View;->setId(I)V

    :cond_1b
    instance-of v1, p2, Lcom/opera/android/custom_views/RadioButton;

    if-eqz v1, :cond_25

    move-object v1, p2

    check-cast v1, Lcom/opera/android/custom_views/RadioButton;

    iput-object v0, v1, Lcom/opera/android/custom_views/RadioButton;->m:Lyhe;

    goto :goto_2e

    :cond_25
    instance-of v1, p2, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v1, :cond_2e

    move-object v1, p2

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iput-object v0, v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    :cond_2e
    :goto_2e
    iget-object p0, p0, Lwx4;->b:Landroid/view/ViewGroup$OnHierarchyChangeListener;

    if-eqz p0, :cond_35

    invoke-interface {p0, p1, p2}, Landroid/view/ViewGroup$OnHierarchyChangeListener;->onChildViewAdded(Landroid/view/View;Landroid/view/View;)V

    :cond_35
    return-void

    :pswitch_36
    check-cast v2, Lcom/google/android/material/chip/ChipGroup;

    if-ne p1, v2, :cond_71

    instance-of v0, p2, Lcom/google/android/material/chip/Chip;

    if-eqz v0, :cond_71

    invoke-virtual {p2}, Landroid/view/View;->getId()I

    move-result v0

    if-ne v0, v1, :cond_4b

    invoke-static {}, Landroid/view/View;->generateViewId()I

    move-result v0

    invoke-virtual {p2, v0}, Landroid/view/View;->setId(I)V

    :cond_4b
    iget-object v0, v2, Lcom/google/android/material/chip/ChipGroup;->h:Lev4;

    move-object v1, p2

    check-cast v1, Lcom/google/android/material/chip/Chip;

    iget-object v2, v0, Lev4;->d:Ljava/lang/Object;

    check-cast v2, Ljava/util/HashMap;

    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-interface {v1}, Landroid/widget/Checkable;->isChecked()Z

    move-result v2

    if-eqz v2, :cond_68

    invoke-virtual {v0, v1}, Lev4;->c(Lcom/google/android/material/chip/Chip;)Z

    :cond_68
    new-instance v2, Ltw2;

    const/16 v3, 0x11

    invoke-direct {v2, v0, v3}, Ltw2;-><init>(Ljava/lang/Object;B)V

    iput-object v2, v1, Lcom/google/android/material/chip/Chip;->j:Ltw2;

    :cond_71
    iget-object p0, p0, Lwx4;->b:Landroid/view/ViewGroup$OnHierarchyChangeListener;

    if-eqz p0, :cond_78

    invoke-interface {p0, p1, p2}, Landroid/view/ViewGroup$OnHierarchyChangeListener;->onChildViewAdded(Landroid/view/View;Landroid/view/View;)V

    :cond_78
    return-void

    nop

    :pswitch_data_7a
    .packed-switch 0x0
        :pswitch_36
    .end packed-switch
.end method

.method public final onChildViewRemoved(Landroid/view/View;Landroid/view/View;)V
    .registers 7

    iget-byte v0, p0, Lwx4;->a:B

    iget-object v1, p0, Lwx4;->c:Landroid/view/ViewGroup;

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_60

    check-cast v1, Lcom/opera/android/custom_views/OperaRadioGroup;

    if-ne p1, v1, :cond_1f

    instance-of v0, p2, Lcom/opera/android/custom_views/RadioButton;

    if-eqz v0, :cond_16

    move-object v0, p2

    check-cast v0, Lcom/opera/android/custom_views/RadioButton;

    iput-object v2, v0, Lcom/opera/android/custom_views/RadioButton;->m:Lyhe;

    goto :goto_1f

    :cond_16
    instance-of v0, p2, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v0, :cond_1f

    move-object v0, p2

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iput-object v2, v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    :cond_1f
    :goto_1f
    iget-object p0, p0, Lwx4;->b:Landroid/view/ViewGroup$OnHierarchyChangeListener;

    if-eqz p0, :cond_26

    invoke-interface {p0, p1, p2}, Landroid/view/ViewGroup$OnHierarchyChangeListener;->onChildViewRemoved(Landroid/view/View;Landroid/view/View;)V

    :cond_26
    return-void

    :pswitch_27
    check-cast v1, Lcom/google/android/material/chip/ChipGroup;

    if-ne p1, v1, :cond_57

    instance-of v0, p2, Lcom/google/android/material/chip/Chip;

    if-eqz v0, :cond_57

    iget-object v0, v1, Lcom/google/android/material/chip/ChipGroup;->h:Lev4;

    move-object v1, p2

    check-cast v1, Lcom/google/android/material/chip/Chip;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object v2, v1, Lcom/google/android/material/chip/Chip;->j:Ltw2;

    iget-object v2, v0, Lev4;->d:Ljava/lang/Object;

    check-cast v2, Ljava/util/HashMap;

    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, v0, Lev4;->e:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashSet;

    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    :cond_57
    iget-object p0, p0, Lwx4;->b:Landroid/view/ViewGroup$OnHierarchyChangeListener;

    if-eqz p0, :cond_5e

    invoke-interface {p0, p1, p2}, Landroid/view/ViewGroup$OnHierarchyChangeListener;->onChildViewRemoved(Landroid/view/View;Landroid/view/View;)V

    :cond_5e
    return-void

    nop

    :pswitch_data_60
    .packed-switch 0x0
        :pswitch_27
    .end packed-switch
.end method
