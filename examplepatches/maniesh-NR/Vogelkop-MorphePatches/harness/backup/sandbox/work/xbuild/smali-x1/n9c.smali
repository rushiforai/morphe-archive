.class public final Ln9c;
.super Lc59;
.source "SourceFile"


# instance fields
.field public final synthetic n:B

.field public final o:Ljava/lang/Object;

.field public p:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;Lcom/opera/android/account/push/AccountPushManager;)V
    .registers 8

    const/4 v0, 0x1

    iput-byte v0, p0, Ln9c;->n:B

    const v0, 0x7f14119f

    const v1, 0x7f1411b0

    const v2, 0x7f1411a0

    const v3, 0x7f14119e

    .line 36
    invoke-static {p1, v2, v3, v0, v1}, Lx1p;->h(Landroid/content/Context;IIII)Lj59;

    move-result-object v0

    .line 37
    invoke-direct {p0, p1, p2, v0}, Lc59;-><init>(Landroid/content/Context;Lumi;Lj59;)V

    .line 38
    iput-object p3, p0, Ln9c;->o:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lumi;Lqq6;)V
    .registers 8

    const/4 v0, 0x0

    iput-byte v0, p0, Ln9c;->n:B

    const v0, 0x7f14092d

    const v1, 0x7f14092f

    const v2, 0x7f14092e

    const v3, 0x7f14092c

    invoke-static {p1, v2, v3, v0, v1}, Lx1p;->h(Landroid/content/Context;IIII)Lj59;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lc59;-><init>(Landroid/content/Context;Lumi;Lj59;)V

    new-instance p1, Lcom/leanplum/LeanplumFirebaseServiceHandler;

    invoke-direct {p1}, Lcom/leanplum/LeanplumFirebaseServiceHandler;-><init>()V

    iput-object p1, p0, Ln9c;->o:Ljava/lang/Object;

    iget-object p1, p3, Lqq6;->b:Ljava/lang/Object;

    check-cast p1, Lh42;

    iput-object p1, p0, Ln9c;->p:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final d()Lekc;
    .registers 2

    iget-byte v0, p0, Ln9c;->n:B

    packed-switch v0, :pswitch_data_10

    invoke-super {p0}, Lc59;->d()Lekc;

    move-result-object p0

    return-object p0

    :pswitch_a
    iget-object p0, p0, Ln9c;->p:Ljava/lang/Object;

    check-cast p0, Lh42;

    return-object p0

    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final e(Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 6

    iget-byte v0, p0, Ln9c;->n:B

    iget-object v1, p0, Ln9c;->o:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_36

    invoke-super {p0, p1, p2, p3}, Lc59;->e(Ljava/lang/String;Ljava/lang/String;Z)V

    iget-object p1, p0, Ln9c;->p:Ljava/lang/Object;

    check-cast p1, Lnsc;

    if-eqz p1, :cond_13

    invoke-virtual {p1}, Lq59;->cancel()V

    :cond_13
    new-instance p1, Lnsc;

    check-cast v1, Lcom/opera/android/account/push/AccountPushManager;

    iget-object p3, v1, Lcom/opera/android/account/push/AccountPushManager;->a:Lkze;

    new-instance v0, Leof;

    const/16 v1, 0x15

    invoke-direct {v0, p0, p2, v1}, Leof;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const/4 p2, 0x1

    invoke-direct {p1, p3, v0, p2}, Lnsc;-><init>(Lekc;Lcom/opera/api/Callback;B)V

    iput-object p1, p0, Ln9c;->p:Ljava/lang/Object;

    return-void

    :pswitch_27
    invoke-super {p0, p1, p2, p3}, Lc59;->e(Ljava/lang/String;Ljava/lang/String;Z)V

    check-cast v1, Lcom/leanplum/LeanplumFirebaseServiceHandler;

    if-nez p2, :cond_30

    const-string p2, "INVALID"

    :cond_30
    iget-object p0, p0, Lc59;->a:Landroid/content/Context;

    invoke-virtual {v1, p2, p0}, Lcom/leanplum/LeanplumFirebaseServiceHandler;->onNewToken(Ljava/lang/String;Landroid/content/Context;)V

    return-void

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_27
    .end packed-switch
.end method
