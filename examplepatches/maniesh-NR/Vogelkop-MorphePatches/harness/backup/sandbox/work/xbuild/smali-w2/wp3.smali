.class public final Lwp3;
.super Lmzg;
.source "SourceFile"


# instance fields
.field public final synthetic b:B

.field public final synthetic c:Lt0h;

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lt0h;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Lwp3;->b:B

    iput-object p1, p0, Lwp3;->c:Lt0h;

    iput-object p2, p0, Lwp3;->d:Ljava/lang/Object;

    invoke-direct {p0}, Lmzg;-><init>()V

    return-void
.end method


# virtual methods
.method public final g()V
    .registers 6

    iget-byte v0, p0, Lwp3;->b:B

    iget-object v1, p0, Lwp3;->d:Ljava/lang/Object;

    iget-object p0, p0, Lwp3;->c:Lt0h;

    packed-switch v0, :pswitch_data_50

    check-cast p0, Lnwf;

    iget-object p0, p0, Lnwf;->b:Lhv3;

    check-cast v1, Lwcj;

    iget-object p0, p0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object v0

    if-eqz v0, :cond_44

    move-object v2, v0

    check-cast v2, Ld7l;

    iget-object v2, v2, Ld7l;->j:Le7l;

    invoke-interface {v2}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lz5i;->a0(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_41

    iget-object v2, p0, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object v2, v2, Ltw3;->u0:Lii;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ly22;

    iget-object v2, v2, Ly22;->a:Lx22;

    if-eqz v2, :cond_44

    new-instance v3, Lq3;

    const/16 v4, 0x14

    invoke-direct {v3, p0, v1, v4}, Lq3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2, v0, v3}, Lx22;->b(Lb2l;Lkotlin/jvm/functions/Function1;)V

    goto :goto_44

    :cond_41
    invoke-interface {v1, p0}, Lwcj;->a(Landroid/content/Context;)V

    :cond_44
    :goto_44
    return-void

    :pswitch_45
    check-cast p0, Lbq3;

    iget-object p0, p0, Lbq3;->a:Lhv3;

    check-cast v1, Lhbf;

    invoke-virtual {p0, v1}, Lhv3;->b(Lhbf;)V

    return-void

    nop

    :pswitch_data_50
    .packed-switch 0x0
        :pswitch_45
    .end packed-switch
.end method

.method public final o()V
    .registers 2

    iget-byte v0, p0, Lwp3;->b:B

    iget-object p0, p0, Lwp3;->c:Lt0h;

    packed-switch v0, :pswitch_data_18

    check-cast p0, Lnwf;

    sget-object v0, Lxl0;->n:Lxl0;

    invoke-virtual {p0, v0}, Lnwf;->w(Lxl0;)V

    return-void

    :pswitch_f
    check-cast p0, Lbq3;

    sget-object v0, Lph0;->k:Lph0;

    invoke-virtual {p0, v0}, Lbq3;->u(Lph0;)V

    return-void

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_f
    .end packed-switch
.end method
