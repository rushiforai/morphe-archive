.class public final LT/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    iput p1, p0, LT/c;->a:I

    iput-object p2, p0, LT/c;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    iget p1, p0, LT/c;->a:I

    packed-switch p1, :pswitch_data_0

    iget-object p1, p0, LT/c;->b:Ljava/lang/Object;

    check-cast p1, Landroidx/appcompat/widget/Toolbar;

    iget-object p1, p1, Landroidx/appcompat/widget/Toolbar;->L:Li/Z0;

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    iget-object p1, p1, Li/Z0;->b:Lh/p;

    :goto_0
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lh/p;->collapseActionView()Z

    :cond_1
    return-void

    :pswitch_0
    iget-object p1, p0, LT/c;->b:Ljava/lang/Object;

    check-cast p1, Lg/a;

    invoke-virtual {p1}, Lg/a;->a()V

    return-void

    :pswitch_1
    iget-object p1, p0, LT/c;->b:Ljava/lang/Object;

    check-cast p1, Le/e;

    iget-object v0, p1, Le/e;->f:Landroid/widget/Button;

    iget-object v0, p1, Le/e;->v:Le/c;

    const/4 v1, 0x1

    iget-object p1, p1, Le/e;->b:Le/g;

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    return-void

    :pswitch_2
    iget-object p1, p0, LT/c;->b:Ljava/lang/Object;

    check-cast p1, LT/d;

    iget-object v0, p1, LT/d;->e:Ljava/lang/Object;

    check-cast v0, Landroid/view/ViewGroup;

    iget-object p1, p1, LT/d;->f:Ljava/lang/Object;

    check-cast p1, Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
