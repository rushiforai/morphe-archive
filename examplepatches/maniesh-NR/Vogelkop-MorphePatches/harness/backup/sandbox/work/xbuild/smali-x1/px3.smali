.class public final Lpx3;
.super Ly08;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/browser/BrowserFragment;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/browser/BrowserFragment;B)V
    .registers 3

    iput-byte p2, p0, Lpx3;->a:B

    iput-object p1, p0, Lpx3;->b:Lcom/opera/android/browser/BrowserFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final E(Lb2l;Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 3

    iget-byte p2, p0, Lpx3;->a:B

    packed-switch p2, :pswitch_data_22

    return-void

    :pswitch_6
    move-object p2, p1

    check-cast p2, Ld7l;

    iget-object p2, p2, Ld7l;->j:Le7l;

    invoke-interface {p2}, Lb9l;->isActive()Z

    move-result p2

    if-eqz p2, :cond_21

    iget-object p0, p0, Lpx3;->b:Lcom/opera/android/browser/BrowserFragment;

    iget-object p0, p0, Lcom/opera/android/browser/BrowserFragment;->r:Lami;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p2, Lro9;

    invoke-direct {p2, p0, p1}, Lro9;-><init>(Lami;Lb2l;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p2, p1}, Lami;->w(Lro9;Z)V

    :cond_21
    return-void

    :pswitch_data_22
    .packed-switch 0x1
        :pswitch_6
    .end packed-switch
.end method

.method public final Q(Lb2l;Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 3

    iget-byte p2, p0, Lpx3;->a:B

    packed-switch p2, :pswitch_data_2e

    return-void

    :pswitch_6
    check-cast p1, Ld7l;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->isActive()Z

    move-result p1

    if-eqz p1, :cond_2c

    iget-object p0, p0, Lpx3;->b:Lcom/opera/android/browser/BrowserFragment;

    iget-object p0, p0, Lcom/opera/android/browser/BrowserFragment;->k:Laal;

    iget-object p0, p0, Lr22;->c:Ljava/lang/Object;

    check-cast p0, Lqim;

    iget-object p1, p0, Lqim;->n:Lu7k;

    if-eqz p1, :cond_2c

    iget-object p1, p1, Lu7k;->a:Ljava/lang/Object;

    check-cast p1, Lz9l;

    iget-boolean p2, p1, Lz9l;->d:Z

    if-eqz p2, :cond_2c

    sget-object p2, Lhjm;->b:Lhjm;

    invoke-virtual {p1, p2}, Lz9l;->finish(Lhjm;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lqim;->n:Lu7k;

    :cond_2c
    return-void

    nop

    :pswitch_data_2e
    .packed-switch 0x1
        :pswitch_6
    .end packed-switch
.end method

.method public final a(Lb2l;Ld7l;)V
    .registers 5

    iget-byte v0, p0, Lpx3;->a:B

    packed-switch v0, :pswitch_data_1c

    return-void

    :pswitch_6
    iget-object p0, p0, Lpx3;->b:Lcom/opera/android/browser/BrowserFragment;

    iget-object v0, p0, Lcom/opera/android/browser/BrowserFragment;->g:Lk6l;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, p2, v1}, Lk6l;->f(Lb2l;Ld7l;Z)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object p0

    sget-object p1, Lq9n;->c:Ll5b;

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-static {p0}, Lq9n;->v(Landroid/view/Window;)Z

    return-void

    :pswitch_data_1c
    .packed-switch 0x1
        :pswitch_6
    .end packed-switch
.end method

.method public final f(Lb2l;)V
    .registers 3

    iget-byte v0, p0, Lpx3;->a:B

    packed-switch v0, :pswitch_data_28

    return-void

    :pswitch_6
    move-object v0, p1

    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->isActive()Z

    move-result v0

    iget-object p0, p0, Lpx3;->b:Lcom/opera/android/browser/BrowserFragment;

    if-eqz v0, :cond_22

    iget-object p0, p0, Lcom/opera/android/browser/BrowserFragment;->r:Lami;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lro9;

    invoke-direct {v0, p0, p1}, Lro9;-><init>(Lami;Lb2l;)V

    const/4 p1, 0x0

    invoke-virtual {p0, v0, p1}, Lami;->w(Lro9;Z)V

    goto :goto_27

    :cond_22
    iget-object p0, p0, Lcom/opera/android/browser/BrowserFragment;->k:Laal;

    invoke-virtual {p0, p1}, Laal;->T(Lb2l;)V

    :goto_27
    return-void

    :pswitch_data_28
    .packed-switch 0x1
        :pswitch_6
    .end packed-switch
.end method

.method public final u(Lb2l;)V
    .registers 5

    iget-byte v0, p0, Lpx3;->a:B

    packed-switch v0, :pswitch_data_1c

    return-void

    :pswitch_6
    iget-object v0, p0, Lpx3;->b:Lcom/opera/android/browser/BrowserFragment;

    iget-object v1, v0, Lcom/opera/android/browser/BrowserFragment;->t:Loml;

    const/4 v2, 0x0

    if-eqz v1, :cond_13

    invoke-virtual {v1, v2}, Loml;->cancel(Z)Z

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/opera/android/browser/BrowserFragment;->t:Loml;

    :cond_13
    check-cast p1, Ld7l;

    invoke-virtual {p1, p0}, Ld7l;->s0(La2l;)V

    invoke-virtual {v0, v2}, Lcom/opera/android/browser/BrowserFragment;->h0(Z)V

    return-void

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method
