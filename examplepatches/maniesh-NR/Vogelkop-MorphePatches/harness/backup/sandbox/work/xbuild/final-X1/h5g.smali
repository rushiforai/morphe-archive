.class public final synthetic Lh5g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Li5g;


# direct methods
.method public synthetic constructor <init>(Li5g;B)V
    .registers 3

    iput-byte p2, p0, Lh5g;->a:B

    iput-object p1, p0, Lh5g;->b:Li5g;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    iget-byte p1, p0, Lh5g;->a:B

    iget-object p0, p0, Lh5g;->b:Li5g;

    packed-switch p1, :pswitch_data_48

    iget-object p0, p0, Li5g;->b:Lqfb;

    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, Lt5g;

    invoke-virtual {p0}, Lt5g;->I0()Lt6g;

    move-result-object p0

    iget-object p1, p0, Lt6g;->f:Lru9;

    invoke-virtual {p1}, Lru9;->b()Lnv6;

    move-result-object p1

    iget-object v0, p1, Lnv6;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/SharedPreferences$Editor;

    const-string v1, "has_dismissed_password_autofill_banner"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p1}, Lnv6;->w()V

    invoke-virtual {p0}, Lt6g;->h()V

    return-void

    :pswitch_28
    iget-object p0, p0, Li5g;->b:Lqfb;

    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, Lt5g;

    invoke-virtual {p0}, Lt5g;->I0()Lt6g;

    move-result-object p0

    iget-object p1, p0, Lt6g;->c:Lyu2;

    invoke-virtual {p1}, Lyu2;->b()Z

    move-result p1

    if-eqz p1, :cond_46

    iget-object p1, p0, Lt6g;->b:Lot2;

    new-instance v0, Lvdf;

    const/16 v1, 0x11

    invoke-direct {v0, p0, v1}, Lvdf;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Lot2;->f(Ljava/lang/Runnable;)V

    :cond_46
    return-void

    nop

    :pswitch_data_48
    .packed-switch 0x0
        :pswitch_28
    .end packed-switch
.end method
