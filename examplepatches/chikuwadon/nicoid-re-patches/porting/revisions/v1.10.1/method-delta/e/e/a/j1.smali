.class public Le/e/a/j1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/sauzask/nicoid/NicoidVideoFragment;


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 2

    iget-object p1, p0, Le/e/a/j1;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    invoke-static {p1}, Le/e/a/SeriesPlayback;->toggleRepeat(Ljava/lang/Object;)V

    return-void
.end method
