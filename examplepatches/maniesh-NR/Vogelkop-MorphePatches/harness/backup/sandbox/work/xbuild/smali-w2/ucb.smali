.class public final Lucb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcdb;


# instance fields
.field public final synthetic a:B

.field public final b:Lcom/opera/android/BrowserActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/BrowserActivity;B)V
    .registers 3

    iput-byte p2, p0, Lucb;->a:B

    iput-object p1, p0, Lucb;->b:Lcom/opera/android/BrowserActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final execute()V
    .registers 10

    iget-byte v0, p0, Lucb;->a:B

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-object p0, p0, Lucb;->b:Lcom/opera/android/BrowserActivity;

    packed-switch v0, :pswitch_data_72

    invoke-virtual {p0, v2, v2}, Lcom/opera/android/BrowserActivity;->n0(ZZ)V

    invoke-virtual {p0, v1}, Lcom/opera/android/BrowserActivity;->o1(I)V

    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->Z0:Lhv3;

    const-string v1, "android.permission.CAMERA"

    invoke-static {p0, v1}, Lfr3;->Q(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_34

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

    goto :goto_3e

    :cond_34
    iget-object v2, p0, Ldx3;->j:Lqi;

    new-instance v3, Lrli;

    invoke-direct {v3, p0, v0}, Lrli;-><init>(Lcom/opera/android/BrowserActivity;Lhv3;)V

    invoke-static {v2, v1, v3}, Lf03;->U(Lorg/chromium/ui/base/WindowAndroid;Ljava/lang/String;Lbag;)V

    :goto_3e
    return-void

    :pswitch_3f
    new-array v0, v2, [Ln6h;

    new-instance v2, Lwzg;

    const/4 v1, 0x0

    const/4 v3, 0x4

    const-class v4, Lwg7;

    invoke-direct {v2, v1, v4, v3}, Lwzg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v1, Lzhj;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    const/4 v3, 0x0

    const/4 v4, 0x2

    const/16 v5, 0x1003

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-direct/range {v1 .. v8}, Lzhj;-><init>(Lwzg;Landroid/os/Bundle;IILjava/lang/String;ZLjava/util/List;)V

    invoke-virtual {v1, p0}, Lzhj;->c(Landroid/content/Context;)V

    return-void

    :pswitch_5d
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->v()Lfs6;

    move-result-object p0

    iget-object p0, p0, Lfs6;->a:Lcom/opera/android/settings/SettingsManager;

    const-string v0, "live_scores_enabled"

    invoke-virtual {p0, v1, v0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    nop

    :pswitch_data_72
    .packed-switch 0x0
        :pswitch_5d
        :pswitch_3f
    .end packed-switch
.end method
