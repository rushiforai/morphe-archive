.class public final synthetic Lnoj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Looj;


# direct methods
.method public synthetic constructor <init>(Looj;B)V
    .registers 3

    iput-byte p2, p0, Lnoj;->a:B

    iput-object p1, p0, Lnoj;->b:Looj;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-byte p1, p0, Lnoj;->a:B

    const/4 v0, 0x0

    iget-object p0, p0, Lnoj;->b:Looj;

    packed-switch p1, :pswitch_data_cc

    iget-object p0, p0, Looj;->t:Lqoj;

    const p1, 0x7f141130

    sget-object v0, Llag;->e:Llag;

    invoke-virtual {p0, p1, v0}, Lqoj;->a(ILlag;)V

    return-void

    :pswitch_13
    iget-object p0, p0, Looj;->t:Lqoj;

    const p1, 0x7f141123

    sget-object v0, Llag;->f:Llag;

    invoke-virtual {p0, p1, v0}, Lqoj;->a(ILlag;)V

    return-void

    :pswitch_1e
    iget-object p0, p0, Looj;->t:Lqoj;

    const p1, 0x7f141131

    sget-object v0, Llag;->b:Llag;

    invoke-virtual {p0, p1, v0}, Lqoj;->a(ILlag;)V

    return-void

    :pswitch_29
    iget-object p0, p0, Looj;->t:Lqoj;

    const p1, 0x7f14095d

    sget-object v0, Llag;->i:Llag;

    invoke-virtual {p0, p1, v0}, Lqoj;->a(ILlag;)V

    return-void

    :pswitch_34
    iget-object p0, p0, Looj;->t:Lqoj;

    const p1, 0x7f14112d

    sget-object v0, Llag;->c:Llag;

    invoke-virtual {p0, p1, v0}, Lqoj;->a(ILlag;)V

    return-void

    :pswitch_3f
    iget-object p1, p0, Looj;->u:Ljvg;

    iget-object p1, p1, Ljvg;->c:Ljava/lang/Object;

    check-cast p1, Lv9j;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lyoj;

    if-eqz p1, :cond_60

    iget-boolean p1, p1, Lyoj;->a:Z

    if-eqz p1, :cond_60

    iget-object p0, p0, Looj;->t:Lqoj;

    iget-object p0, p0, Lqoj;->e:Lwt3;

    invoke-virtual {p0}, Lwt3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lg0c;

    new-array p1, v0, [I

    invoke-virtual {p0, p1}, Lg0c;->a([I)V

    :cond_60
    return-void

    :pswitch_61
    iget-object p0, p0, Looj;->t:Lqoj;

    iget-object p0, p0, Lqoj;->d:Lwt3;

    invoke-virtual {p0}, Lwt3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lsyl;

    new-instance p1, Lvyl;

    invoke-direct {p1}, Lvyl;-><init>()V

    const/16 v0, 0x1003

    invoke-static {p1, v0}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p1

    iget-object p0, p0, Lsyl;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p1, p0}, Lzhj;->c(Landroid/content/Context;)V

    return-void

    :pswitch_7c
    iget-object p0, p0, Looj;->t:Lqoj;

    iget-object p0, p0, Lqoj;->c:Lwt3;

    invoke-virtual {p0}, Lwt3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lrj;

    iget-object p0, p0, Lrj;->b:Lgjm;

    sget-object p1, Lij;->a:Lij;

    invoke-virtual {p0, p1, v0}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_8e
    iget-object p0, p0, Looj;->t:Lqoj;

    const p1, 0x7f140cdf

    sget-object v0, Llag;->h:Llag;

    invoke-virtual {p0, p1, v0}, Lqoj;->a(ILlag;)V

    return-void

    :pswitch_99
    iget-object p0, p0, Looj;->t:Lqoj;

    const p1, 0x7f140d67

    sget-object v0, Llag;->d:Llag;

    invoke-virtual {p0, p1, v0}, Lqoj;->a(ILlag;)V

    return-void

    :pswitch_a4
    iget-object p0, p0, Looj;->t:Lqoj;

    iget-object p0, p0, Lqoj;->b:Lgjm;

    new-instance p1, Lzl8;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, p1, v0}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_b1
    iget-object p0, p0, Looj;->t:Lqoj;

    iget-object p0, p0, Lqoj;->b:Lgjm;

    new-instance p1, Lido;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, p1, v0}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_be
    iget-object p0, p0, Looj;->t:Lqoj;

    iget-object p0, p0, Lqoj;->b:Lgjm;

    new-instance p1, Ld01;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, p1, v0}, Lgjm;->e(Ln37;Z)V

    return-void

    nop

    :pswitch_data_cc
    .packed-switch 0x0
        :pswitch_be
        :pswitch_b1
        :pswitch_a4
        :pswitch_99
        :pswitch_8e
        :pswitch_7c
        :pswitch_61
        :pswitch_3f
        :pswitch_34
        :pswitch_29
        :pswitch_1e
        :pswitch_13
    .end packed-switch
.end method
