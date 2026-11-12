.class public final synthetic Lgw3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lqcf;
.implements Lvwh;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ltw3;


# direct methods
.method public synthetic constructor <init>(Ltw3;B)V
    .registers 3

    iput-byte p2, p0, Lgw3;->a:B

    iput-object p1, p0, Lgw3;->b:Ltw3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/app/Dialog;)V
    .registers 3

    iget-byte v0, p0, Lgw3;->a:B

    iget-object p0, p0, Lgw3;->b:Ltw3;

    packed-switch v0, :pswitch_data_30

    :pswitch_7
    iget-object p0, p0, Ltw3;->a:Lhx3;

    invoke-virtual {p0}, Lhx3;->h()Lxm5;

    move-result-object p0

    invoke-virtual {p0, p1}, Lxm5;->v(Landroid/app/Dialog;)V

    return-void

    :pswitch_11
    iget-object p0, p0, Ltw3;->a:Lhx3;

    invoke-virtual {p0}, Lhx3;->h()Lxm5;

    move-result-object p0

    invoke-virtual {p0, p1}, Lxm5;->v(Landroid/app/Dialog;)V

    return-void

    :pswitch_1b
    iget-object p0, p0, Ltw3;->a:Lhx3;

    invoke-virtual {p0}, Lhx3;->h()Lxm5;

    move-result-object p0

    invoke-virtual {p0, p1}, Lxm5;->v(Landroid/app/Dialog;)V

    return-void

    :pswitch_25
    iget-object p0, p0, Ltw3;->a:Lhx3;

    invoke-virtual {p0}, Lhx3;->h()Lxm5;

    move-result-object p0

    invoke-virtual {p0, p1}, Lxm5;->v(Landroid/app/Dialog;)V

    return-void

    nop

    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_25
        :pswitch_7
        :pswitch_1b
        :pswitch_11
    .end packed-switch
.end method

.method public final f(Lo93;)V
    .registers 3

    iget-object p0, p0, Lgw3;->b:Ltw3;

    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->J0()Lysj;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p0, p1, v0}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method
