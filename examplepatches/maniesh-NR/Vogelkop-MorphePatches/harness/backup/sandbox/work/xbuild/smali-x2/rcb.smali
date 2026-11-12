.class public final synthetic Lrcb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcdb;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lrcb;->a:B

    iput-object p1, p0, Lrcb;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final execute()V
    .registers 3

    iget-byte v0, p0, Lrcb;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lrcb;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_36

    check-cast p0, Lcom/opera/android/BrowserActivity;

    const/4 v0, 0x0

    invoke-static {p0, v0, v1}, Lxf8;->n0(Landroid/content/Context;Llkk;Z)V

    return-void

    :pswitch_f
    check-cast p0, Landroid/content/Intent;

    invoke-virtual {p0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_2a

    const-string v1, "report"

    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2a

    invoke-virtual {p0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p0

    if-eqz p0, :cond_2a

    const-string v0, "prefix"

    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    :cond_2a
    return-void

    :pswitch_2b
    check-cast p0, Ld8j;

    new-array v0, v1, [I

    check-cast p0, Lg8j;

    invoke-virtual {p0, v0}, Lg8j;->a([I)V

    return-void

    nop

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_2b
        :pswitch_f
    .end packed-switch
.end method
