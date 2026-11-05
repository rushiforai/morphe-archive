.class public Lcom/sauzask/nicoid/NicoidVideoFragment$k;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lcom/devbrackets/android/exomedia/listener/OnErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/NicoidVideoFragment;->b(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/sauzask/nicoid/NicoidVideoFragment;


# virtual methods
.method public onError(Ljava/lang/Exception;)Z
    .registers 7

    const/4 v0, 0x1

    :try_start_1
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    invoke-virtual {p1}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    if-nez v3, :cond_b

    move-object v3, p1

    :cond_b
    instance-of v1, v3, Le/d/b/a/p0/v$e;

    if-eqz v1, :cond_50

    check-cast v3, Le/d/b/a/p0/v$e;

    iget-object v4, v3, Le/d/b/a/p0/v$e;->requestUri:Landroid/net/Uri;

    iget v3, v3, Le/d/b/a/p0/v$e;->a:I

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "HTTP "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    if-eqz v4, :cond_39

    const-string v3, " @ "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "/"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_39
    if-eqz v4, :cond_4b

    const-string v3, "Signature"

    invoke-virtual {v4, v3}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_46

    const-string v3, " [signed]"

    goto :goto_48

    :cond_46
    const-string v3, " [no signature]"

    :goto_48
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_4b
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_58

    :cond_50
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    :goto_58
    invoke-static {v3}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    const-string v1, "nicoid-modern"

    invoke-static {v1, v3, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$k;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 1
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    const v1, 0x7f0800ea

    .line 2
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$k;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 3
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    .line 4
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    const/4 v2, -0x1

    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$k;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    const/4 v2, 0x4

    .line 5
    iput v2, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->n0:I

    .line 6
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$k;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 7
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const v2, 0x7f0f00bf

    .line 8
    invoke-virtual {p1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p1

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$k;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 9
    iget-object v2, v2, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    .line 10
    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p1, " ("

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ")"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$k;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 11
    invoke-virtual {p1, v0}, Lcom/sauzask/nicoid/NicoidVideoFragment;->j(Z)V
    :try_end_b7
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_b7} :catch_b8

    goto :goto_bc

    :catch_b8
    move-exception p1

    .line 12
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_bc
    return v0
.end method
