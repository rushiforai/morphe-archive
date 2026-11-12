.class public final synthetic Lrdn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lydn;


# direct methods
.method public synthetic constructor <init>(Lydn;B)V
    .registers 3

    iput-byte p2, p0, Lrdn;->a:B

    iput-object p1, p0, Lrdn;->b:Lydn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    iget-byte v0, p0, Lrdn;->a:B

    iget-object p0, p0, Lrdn;->b:Lydn;

    packed-switch v0, :pswitch_data_90

    invoke-virtual {p0}, Lydn;->u()V

    return-void

    :pswitch_b
    iget-object v0, p0, Lydn;->O:Lktf;

    iget-object v0, v0, Lktf;->d:Lefn;

    iget-object v1, p0, Lydn;->d:Lvdn;

    iget-object v1, v1, Lvdn;->b:Lefn;

    if-eq v0, v1, :cond_1e

    iget v0, p0, Lydn;->G:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_34

    invoke-virtual {p0}, Lydn;->g()V

    goto :goto_34

    :cond_1e
    iget-object p0, p0, Lydn;->t:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_24
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_34

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ltdn;

    invoke-interface {v0}, Ltdn;->A()V

    goto :goto_24

    :cond_34
    :goto_34
    return-void

    :pswitch_35
    invoke-virtual {p0}, Lydn;->e()V

    return-void

    :pswitch_39
    iget-object v0, p0, Lydn;->b:Lw7j;

    iget-object v1, p0, Lydn;->l:Landroid/content/Context;

    iget-object v2, p0, Lydn;->f:Lqq8;

    invoke-virtual {v2}, Lqq8;->g()Z

    move-result v2

    if-eqz v2, :cond_62

    iget-object p0, p0, Lydn;->c:Lgfn;

    invoke-interface {p0}, Lgfn;->isEnabled()Z

    move-result p0

    if-eqz p0, :cond_62

    const-string p0, "notification"

    invoke-virtual {v1, p0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/NotificationManager;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    invoke-static {v0, v1}, Lcgh;->l(ILandroid/content/Context;)Landroid/app/Notification;

    move-result-object v0

    const/16 v1, 0x1a4

    invoke-virtual {p0, v1, v0}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    :cond_62
    return-void

    :pswitch_63
    iget-object v0, p0, Lydn;->e:Lsgi;

    iget-object v1, p0, Lydn;->d:Lvdn;

    iget-boolean v1, v1, Lvdn;->a:Z

    invoke-virtual {p0}, Lydn;->m()I

    move-result v2

    invoke-virtual {v0, v2, v1}, Lsgi;->I(IZ)V

    invoke-virtual {p0}, Lydn;->v()V

    return-void

    :pswitch_74
    iget-object p0, p0, Lydn;->t:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_7a
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8a

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ltdn;

    invoke-interface {v0}, Ltdn;->N()V

    goto :goto_7a

    :cond_8a
    return-void

    :pswitch_8b
    invoke-virtual {p0}, Lydn;->v()V

    return-void

    nop

    :pswitch_data_90
    .packed-switch 0x0
        :pswitch_8b
        :pswitch_74
        :pswitch_63
        :pswitch_39
        :pswitch_35
        :pswitch_b
    .end packed-switch
.end method
