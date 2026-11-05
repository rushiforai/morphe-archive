.class public Lcom/sauzask/nicoid/NicoidVideoFragment$c0;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/NicoidVideoFragment;->a(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Landroid/os/Bundle;

.field public final synthetic c:Lcom/sauzask/nicoid/NicoidVideoFragment;


# virtual methods
.method public run()V
    .registers 7

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$c0;->c:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 1
    iget-boolean v1, v0, Landroidx/fragment/app/Fragment;->A:Z

    if-eqz v1, :cond_7

    return-void

    .line 2
    :cond_7
    iget-object v1, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    if-nez v1, :cond_c

    return-void

    .line 3
    :cond_c
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    const v1, 0x7f0801b8

    .line 4
    if-nez v0, :cond_14

    return-void

    :cond_14
    invoke-virtual {v0}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_25

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$c0;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_25
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$c0;->b:Landroid/os/Bundle;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$c0;->c:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 5
    iget-boolean v1, v1, Lcom/sauzask/nicoid/NicoidVideoFragment;->s0:Z

    const-string v2, "isSide"

    .line 6
    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$c0;->b:Landroid/os/Bundle;

    const/4 v1, 0x0

    const-string v2, "isInfoOnly"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$c0;->b:Landroid/os/Bundle;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$c0;->c:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 7
    iget v2, v2, Lcom/sauzask/nicoid/NicoidVideoFragment;->l0:I

    const-string v3, "taptype"

    .line 8
    invoke-virtual {v0, v3, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$c0;->c:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 9
    iget-object v2, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->B1:Le/e/a/k3;

    if-eqz v2, :cond_fe

    invoke-virtual {v2}, Le/e/a/k3;->a()I

    move-result v3

    if-nez v3, :cond_fe

    .line 10
    const-class v3, Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment;

    iget-object v4, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$c0;->b:Landroid/os/Bundle;

    .line 11
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const v5, 0x7f0f00bc

    .line 12
    invoke-virtual {v0, v5}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v3, v4, v0}, Le/e/a/k3;->a(Ljava/lang/Class;Landroid/os/Bundle;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$c0;->c:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 13
    iget-object v2, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->B1:Le/e/a/k3;

    .line 14
    const-class v3, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;

    iget-object v4, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$c0;->b:Landroid/os/Bundle;

    .line 15
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const v5, 0x7f0f00c6

    .line 16
    invoke-virtual {v0, v5}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v3, v4, v0}, Le/e/a/k3;->a(Ljava/lang/Class;Landroid/os/Bundle;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$c0;->c:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 17
    iget-boolean v0, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->U0:Z

    if-eqz v0, :cond_a0

    .line 18
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const/16 v2, 0xc

    const-string v3, "type"

    invoke-virtual {v0, v3, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$c0;->c:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 19
    iget v2, v2, Lcom/sauzask/nicoid/NicoidVideoFragment;->D1:I

    const-string v3, "playlistposition"

    .line 20
    invoke-virtual {v0, v3, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$c0;->c:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 21
    iget-object v3, v2, Lcom/sauzask/nicoid/NicoidVideoFragment;->B1:Le/e/a/k3;

    .line 22
    const-class v4, Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 23
    iget-object v2, v2, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const v5, 0x7f0f00c2

    .line 24
    invoke-virtual {v2, v5}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v4, v0, v2}, Le/e/a/k3;->a(Ljava/lang/Class;Landroid/os/Bundle;Ljava/lang/String;)V

    :cond_a0
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$c0;->c:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 25
    iget-boolean v0, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->w0:Z

    if-eqz v0, :cond_d3

    .line 26
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v2, "http://flapi.nicovideo.jp/api/getrelation?video="

    invoke-static {v2}, Le/b/a/a/a;->a(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$c0;->c:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 27
    iget-object v3, v3, Lcom/sauzask/nicoid/NicoidVideoFragment;->b0:Ljava/lang/String;

    .line 28
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "url"

    invoke-virtual {v0, v3, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$c0;->c:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 29
    iget-object v3, v2, Lcom/sauzask/nicoid/NicoidVideoFragment;->B1:Le/e/a/k3;

    .line 30
    const-class v4, Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 31
    iget-object v2, v2, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const v5, 0x7f0f00c3

    .line 32
    invoke-virtual {v2, v5}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v4, v0, v2}, Le/e/a/k3;->a(Ljava/lang/Class;Landroid/os/Bundle;Ljava/lang/String;)V

    :cond_d3
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$c0;->c:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 33
    iget-object v2, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->B1:Le/e/a/k3;

    .line 34
    const-class v3, Lcom/sauzask/nicoid/NicoidCommentListFragment;

    const/4 v4, 0x0

    .line 35
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const v5, 0x7f0f0038

    .line 36
    invoke-virtual {v0, v5}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v3, v4, v0}, Le/e/a/k3;->a(Ljava/lang/Class;Landroid/os/Bundle;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$c0;->c:Lcom/sauzask/nicoid/NicoidVideoFragment;

    invoke-virtual {v0}, Lcom/sauzask/nicoid/NicoidVideoFragment;->c()V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$c0;->c:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 37
    iget-object v2, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->F1:Lcom/astuetz/PagerSlidingTabStrip;

    .line 38
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->E1:Lcom/sauzask/nicoid/NicoidViewPager;

    .line 39
    invoke-virtual {v2, v0}, Lcom/astuetz/PagerSlidingTabStrip;->setViewPager(Landroidx/viewpager/widget/ViewPager;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$c0;->c:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 40
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->B1:Le/e/a/k3;

    const/4 v2, 0x1

    .line 41
    iget-object v0, v0, Le/e/a/k3;->h:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {v0, v2, v1}, Landroidx/viewpager/widget/ViewPager;->a(IZ)V

    :cond_fe
    return-void
.end method
