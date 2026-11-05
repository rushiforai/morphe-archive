.class public Lcom/sauzask/nicoid/NicoidCacheManagerActivity$c;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/widget/AdapterView$OnItemLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/sauzask/nicoid/NicoidCacheManagerActivity;


# virtual methods
.method public onItemLongClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)Z"
        }
    .end annotation

    long-to-int p1, p4

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$c;->a:Lcom/sauzask/nicoid/NicoidCacheManagerActivity;

    .line 1
    iget-object p4, p3, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->Q:Landroid/view/View;

    const/4 p5, 0x0

    if-eq p2, p4, :cond_4d

    if-gez p1, :cond_b

    goto :goto_4d

    .line 2
    :cond_b
    iget-boolean p4, p3, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->G:Z

    const/4 v0, 0x1

    if-nez p4, :cond_4c

    .line 3
    invoke-virtual {p3}, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->s()V

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$c;->a:Lcom/sauzask/nicoid/NicoidCacheManagerActivity;

    .line 4
    iget-object p3, p3, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->z:Ljava/util/ArrayList;

    .line 5
    invoke-virtual {p3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/x1;

    const-string p3, "isselect"

    invoke-virtual {p1, p3}, Le/e/a/x1;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/lang/Boolean;

    if-eqz p4, :cond_3a

    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p4

    if-nez p4, :cond_2e

    goto :goto_3a

    :cond_2e
    invoke-static {p5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p4

    invoke-virtual {p1, p3, p4}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {p5}, Landroid/graphics/Color;->alpha(I)I

    move-result p1

    goto :goto_44

    :cond_3a
    :goto_3a
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p4

    invoke-virtual {p1, p3, p4}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const p1, 0x6631c7b1

    :goto_44
    invoke-virtual {p2, p1}, Landroid/view/View;->setBackgroundColor(I)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$c;->a:Lcom/sauzask/nicoid/NicoidCacheManagerActivity;

    invoke-virtual {p1}, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->updateSelectionCount()V

    :cond_4c
    return v0

    :cond_4d
    :goto_4d
    return p5
.end method
