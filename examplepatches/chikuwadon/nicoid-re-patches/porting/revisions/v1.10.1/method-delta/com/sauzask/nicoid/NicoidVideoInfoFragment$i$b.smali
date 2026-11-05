.class public Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i$b;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/content/Intent;

.field public final synthetic b:Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i;


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 4

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i$b;->a:Landroid/content/Intent;

    const-string p2, "com.sauzask.nicoid.hls"

    const-string v0, "com.sauzask.nicoid.NicoidVideoInfoActivity"

    invoke-virtual {p1, p2, v0}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i$b;->b:Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i;

    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i;->b:Lcom/sauzask/nicoid/NicoidVideoInfoFragment;

    .line 1
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->b0:Landroid/app/Activity;

    .line 2
    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i$b;->a:Landroid/content/Intent;

    invoke-virtual {p1, p2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
