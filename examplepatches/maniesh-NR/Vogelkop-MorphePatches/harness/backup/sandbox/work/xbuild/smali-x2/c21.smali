.class public final Lc21;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/PopupWindow$OnDismissListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lc21;->a:B

    iput-object p1, p0, Lc21;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onDismiss()V
    .registers 3

    iget-byte v0, p0, Lc21;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lc21;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_6c

    check-cast p0, Leyi;

    iget-boolean v0, p0, Leyi;->b:Z

    if-nez v0, :cond_18

    iget-object v0, p0, Leyi;->c:Ljava/lang/Object;

    check-cast v0, Lwa;

    invoke-virtual {v0, v1}, Lwa;->onResult(Ljava/lang/Object;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Leyi;->b:Z

    :cond_18
    return-void

    :pswitch_19
    check-cast p0, Lfud;

    invoke-virtual {p0}, Lfud;->c()V

    return-void

    :pswitch_1f
    check-cast p0, Lu85;

    iget-object v0, p0, Lu85;->h:Ljava/lang/Object;

    check-cast v0, Li21;

    invoke-virtual {v0}, Li21;->a()V

    iget-object v0, p0, Lu85;->e:Ljava/lang/Object;

    check-cast v0, Landroid/view/View;

    iget-object p0, p0, Lu85;->f:Ljava/lang/Object;

    check-cast p0, Lho3;

    invoke-virtual {v0, p0}, Landroid/view/View;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    return-void

    :pswitch_37
    check-cast p0, Li21;

    iget-boolean v0, p0, Li21;->v:Z

    if-eqz v0, :cond_40

    const/4 v0, 0x0

    iput-boolean v0, p0, Li21;->v:Z

    :cond_40
    iget-boolean v0, p0, Li21;->r:Z

    if-nez v0, :cond_6b

    iget-object v0, p0, Li21;->d:Landroid/os/Handler;

    iget-object v1, p0, Li21;->k:Lig;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v0, p0, Li21;->l:Lh7f;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :goto_51
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_61

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/PopupWindow$OnDismissListener;

    invoke-interface {v1}, Landroid/widget/PopupWindow$OnDismissListener;->onDismiss()V

    goto :goto_51

    :cond_61
    iget-object v0, p0, Li21;->i:Lq8n;

    invoke-virtual {v0}, Lq8n;->o0()V

    iget-object p0, p0, Li21;->f:Lh21;

    invoke-virtual {p0}, Lk8;->o0()V

    :cond_6b
    return-void

    :pswitch_data_6c
    .packed-switch 0x0
        :pswitch_37
        :pswitch_1f
        :pswitch_19
    .end packed-switch
.end method
