.class public final synthetic Lpy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lqy0;


# direct methods
.method public synthetic constructor <init>(Lqy0;B)V
    .registers 3

    iput-byte p2, p0, Lpy0;->a:B

    iput-object p1, p0, Lpy0;->b:Lqy0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    iget-byte p1, p0, Lpy0;->a:B

    iget-object p0, p0, Lpy0;->b:Lqy0;

    packed-switch p1, :pswitch_data_56

    iget-object p1, p0, Lsy0;->f:Lfy0;

    check-cast p1, Lgy0;

    if-eqz p1, :cond_1b

    iget-object v0, p0, Lyzi;->b:Ltzi;

    iget-object v0, v0, Ltzi;->a:Le5d;

    invoke-virtual {p1}, Lgy0;->b()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Le5d;->d(J)V

    invoke-virtual {p0}, Lqy0;->h0()V

    :cond_1b
    return-void

    :pswitch_1c
    iget-object p1, p0, Lsy0;->f:Lfy0;

    check-cast p1, Lgy0;

    if-eqz p1, :cond_52

    iget-object v0, p0, Lyzi;->b:Ltzi;

    iget-boolean v1, v0, Ltzi;->g:Z

    if-eqz v1, :cond_32

    iget-object v0, v0, Ltzi;->a:Le5d;

    invoke-virtual {p1}, Lgy0;->b()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Le5d;->d(J)V

    goto :goto_52

    :cond_32
    iget-object v0, p0, Lqy0;->h:Ljy0;

    iget-object v0, v0, Ljy0;->b:Lnv6;

    iget-object p1, p1, Lgy0;->a:Lyda;

    iget-object v0, v0, Lnv6;->a:Ljava/lang/Object;

    check-cast v0, Ldda;

    invoke-virtual {v0}, Ldda;->L0()Lcom/opera/android/history/f;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/opera/android/history/f;->g(Lzda;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_52

    sget-object v0, Llqm;->c:Llqm;

    const/4 v1, 0x1

    invoke-static {p1, v0, v1}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object p1

    iput-boolean v1, p1, Lvx3;->q:Z

    invoke-static {p1}, Lam2;->v(Lvx3;)V

    :cond_52
    :goto_52
    invoke-virtual {p0}, Lqy0;->h0()V

    return-void

    :pswitch_data_56
    .packed-switch 0x0
        :pswitch_1c
    .end packed-switch
.end method
