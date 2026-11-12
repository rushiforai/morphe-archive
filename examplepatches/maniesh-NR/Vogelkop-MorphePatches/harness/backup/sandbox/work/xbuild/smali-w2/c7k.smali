.class public final Lc7k;
.super Lmzg;
.source "SourceFile"


# instance fields
.field public final synthetic b:B

.field public final synthetic c:Lnwf;


# direct methods
.method public synthetic constructor <init>(Lnwf;B)V
    .registers 3

    iput-byte p2, p0, Lc7k;->b:B

    iput-object p1, p0, Lc7k;->c:Lnwf;

    invoke-direct {p0}, Lmzg;-><init>()V

    return-void
.end method


# virtual methods
.method public final g()V
    .registers 5

    iget-byte v0, p0, Lc7k;->b:B

    iget-object p0, p0, Lc7k;->c:Lnwf;

    packed-switch v0, :pswitch_data_60

    iget-object p0, p0, Lnwf;->b:Lhv3;

    sget v0, Lcom/opera/android/qr/ScanQrCodeActivity;->k:I

    iget-object p0, p0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->Z0:Lhv3;

    const-string v1, "android.permission.CAMERA"

    invoke-static {p0, v1}, Lfr3;->Q(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_32

    sget-object v1, Lq9n;->c:Ll5b;

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-static {v1}, Lq9n;->v(Landroid/view/Window;)Z

    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/opera/android/qr/ScanQrCodeActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    new-instance v2, Lqj2;

    const/16 v3, 0xc

    invoke-direct {v2, v0, v3}, Lqj2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v1, v2}, Lhjf;->D(Landroid/content/Intent;Lni;)V

    goto :goto_3c

    :cond_32
    iget-object v2, p0, Ldx3;->j:Lqi;

    new-instance v3, Lrli;

    invoke-direct {v3, p0, v0}, Lrli;-><init>(Lcom/opera/android/BrowserActivity;Lhv3;)V

    invoke-static {v2, v1, v3}, Lf03;->U(Lorg/chromium/ui/base/WindowAndroid;Ljava/lang/String;Lbag;)V

    :goto_3c
    return-void

    :pswitch_3d
    iget-object p0, p0, Lnwf;->b:Lhv3;

    invoke-virtual {p0}, Lhv3;->m()V

    return-void

    :pswitch_43
    iget-object p0, p0, Lnwf;->b:Lhv3;

    invoke-virtual {p0}, Lhv3;->s()V

    return-void

    :pswitch_49
    iget-object p0, p0, Lnwf;->b:Lhv3;

    invoke-virtual {p0}, Lhv3;->m()V

    return-void

    :pswitch_4f
    iget-object p0, p0, Lnwf;->b:Lhv3;

    invoke-virtual {p0}, Lhv3;->i()V

    return-void

    :pswitch_55
    iget-object p0, p0, Lnwf;->b:Lhv3;

    iget-object p0, p0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->d1()V

    return-void

    nop

    :pswitch_data_60
    .packed-switch 0x0
        :pswitch_55
        :pswitch_4f
        :pswitch_49
        :pswitch_43
        :pswitch_3d
    .end packed-switch
.end method

.method public final o()V
    .registers 2

    iget-byte v0, p0, Lc7k;->b:B

    iget-object p0, p0, Lc7k;->c:Lnwf;

    packed-switch v0, :pswitch_data_2c

    sget-object v0, Lrq0;->c:Lrq0;

    invoke-virtual {p0, v0}, Lnwf;->x(Lrq0;)V

    return-void

    :pswitch_d
    sget-object v0, Lrq0;->d:Lrq0;

    invoke-virtual {p0, v0}, Lnwf;->x(Lrq0;)V

    return-void

    :pswitch_13
    sget-object v0, Lrq0;->i:Lrq0;

    invoke-virtual {p0, v0}, Lnwf;->x(Lrq0;)V

    return-void

    :pswitch_19
    sget-object v0, Lrq0;->h:Lrq0;

    invoke-virtual {p0, v0}, Lnwf;->x(Lrq0;)V

    return-void

    :pswitch_1f
    sget-object v0, Lrq0;->g:Lrq0;

    invoke-virtual {p0, v0}, Lnwf;->x(Lrq0;)V

    return-void

    :pswitch_25
    sget-object v0, Lrq0;->b:Lrq0;

    invoke-virtual {p0, v0}, Lnwf;->x(Lrq0;)V

    return-void

    nop

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_25
        :pswitch_1f
        :pswitch_19
        :pswitch_13
        :pswitch_d
    .end packed-switch
.end method
