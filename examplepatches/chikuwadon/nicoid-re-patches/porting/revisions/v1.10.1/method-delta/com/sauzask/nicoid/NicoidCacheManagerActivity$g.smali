.class public Lcom/sauzask/nicoid/NicoidCacheManagerActivity$g;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->s()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/sauzask/nicoid/NicoidCacheManagerActivity;


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$g;->a:Lcom/sauzask/nicoid/NicoidCacheManagerActivity;

    .line 1
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->C:Le/e/a/b0;

    const/4 v0, 0x1

    .line 2
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p1, v1, v0}, Le/e/a/b0;->a(Ljava/lang/Boolean;Z)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$g;->a:Lcom/sauzask/nicoid/NicoidCacheManagerActivity;

    invoke-virtual {p1}, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->updateSelectionCount()V

    return-void
.end method
