.class public final synthetic Lm98;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Leua;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 9
    iput-byte p2, p0, Lm98;->a:B

    iput-object p1, p0, Lm98;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lrii;Lpr;)V
    .registers 3

    const/4 p2, 0x3

    iput-byte p2, p0, Lm98;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lm98;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    iget-byte v0, p0, Lm98;->a:B

    sget-object v1, Lwb0;->c:Lwb0;

    iget-object p0, p0, Lm98;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_5e

    check-cast p0, Lxq3;

    sget-object v0, Lvb0;->c:Lvb0;

    iput-object v0, p0, Lxq3;->b:Ljava/lang/Object;

    return-void

    :pswitch_10
    check-cast p0, Lk4m;

    invoke-virtual {p0}, Lk4m;->run()V

    return-void

    :pswitch_16
    check-cast p0, Ltmi;

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p0, v0}, Ltmi;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_1e
    check-cast p0, Lqq8;

    sget-object v0, Lhjm;->a:Lhjm;

    invoke-virtual {p0, v0}, Lqq8;->i(Lhjm;)V

    return-void

    :pswitch_26
    check-cast p0, Lrii;

    iget-object p0, p0, Lrii;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/autofill/SaveCardDialogRequest;

    iget-object v0, p0, Lcom/opera/android/browser/autofill/SaveCardDialogRequest;->b:Landroid/content/Context;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v0, v0, Ld6j;->c:Lx5f;

    sget-object v1, Lvb0;->b:Lvb0;

    invoke-virtual {v0, v1}, Lx5f;->x0(Lvb0;)V

    iget-wide v0, p0, Lcom/opera/android/browser/autofill/SaveCardDialogRequest;->e:J

    invoke-static {v0, v1}, LJ/N;->MGK4TqSx(J)V

    return-void

    :pswitch_47
    check-cast p0, Lgjm;

    new-instance v0, Lxyg;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lxyg;-><init>(I)V

    invoke-virtual {p0, v0, v1}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_53
    check-cast p0, Lxq3;

    iput-object v1, p0, Lxq3;->c:Ljava/lang/Object;

    return-void

    :pswitch_58
    check-cast p0, Lim6;

    iput-object v1, p0, Lim6;->d:Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_5e
    .packed-switch 0x0
        :pswitch_58
        :pswitch_53
        :pswitch_47
        :pswitch_26
        :pswitch_1e
        :pswitch_16
        :pswitch_10
    .end packed-switch
.end method
