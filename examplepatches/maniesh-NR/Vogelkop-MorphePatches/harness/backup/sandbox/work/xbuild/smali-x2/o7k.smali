.class public final synthetic Lo7k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lv7k;


# direct methods
.method public synthetic constructor <init>(Lv7k;B)V
    .registers 3

    iput-byte p2, p0, Lo7k;->a:B

    iput-object p1, p0, Lo7k;->b:Lv7k;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    iget-byte p1, p0, Lo7k;->a:B

    const/4 v0, 0x0

    iget-object p0, p0, Lo7k;->b:Lv7k;

    packed-switch p1, :pswitch_data_36

    invoke-virtual {p0}, Lv7k;->I0()Lc8k;

    move-result-object p0

    iget-object p0, p0, Lc8k;->g:Lwre;

    new-array p1, v0, [I

    invoke-virtual {p0, p1}, Lwre;->a([I)V

    return-void

    :pswitch_14
    invoke-virtual {p0}, Lv7k;->I0()Lc8k;

    move-result-object p0

    iget-object p0, p0, Lj93;->c:Ld8j;

    new-array p1, v0, [I

    check-cast p0, Lg8j;

    invoke-virtual {p0, p1}, Lg8j;->i([I)V

    return-void

    :pswitch_22
    invoke-virtual {p0}, Lv7k;->I0()Lc8k;

    move-result-object p0

    iget-object p0, p0, Lc8k;->f:Lxln;

    sget-object p1, Lvln;->b:Lvln;

    iget-object p0, p0, Lxln;->b:Lgjm;

    new-instance v1, Lrkn;

    const/4 v2, 0x0

    invoke-direct {v1, p1, v2}, Lrkn;-><init>(Lvln;Landroid/os/Bundle;)V

    invoke-virtual {p0, v1, v0}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_22
        :pswitch_14
    .end packed-switch
.end method
