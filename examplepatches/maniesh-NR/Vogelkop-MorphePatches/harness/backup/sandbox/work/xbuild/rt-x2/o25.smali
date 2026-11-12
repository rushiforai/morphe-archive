.class public final Lo25;
.super Lr25;
.source "SourceFile"


# instance fields
.field public final synthetic f:B


# direct methods
.method public constructor <init>(B)V
    .registers 14

    iput-byte p1, p0, Lo25;->f:B

    packed-switch p1, :pswitch_data_48

    new-instance v2, Lrxh;

    const p1, 0x7f14037f

    invoke-direct {v2, p1}, Lrxh;-><init>(I)V

    const v4, 0x7f080505

    sget-object v5, La35;->m:La35;

    const-string v1, "Bookmarks"

    const/4 v3, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lr25;-><init>(Ljava/lang/String;Lrxh;Lrxh;ILa35;)V

    return-void

    :pswitch_1a
    move-object v6, p0

    new-instance v8, Lrxh;

    const p0, 0x7f141173

    invoke-direct {v8, p0}, Lrxh;-><init>(I)V

    const v10, 0x7f0805fa

    sget-object v11, La35;->a:La35;

    const-string v7, "SpeedDial"

    const/4 v9, 0x0

    invoke-direct/range {v6 .. v11}, Lr25;-><init>(Ljava/lang/String;Lrxh;Lrxh;ILa35;)V

    return-void

    :pswitch_2f
    move-object v6, p0

    new-instance v8, Lrxh;

    const p0, 0x7f1400fa

    invoke-direct {v8, p0}, Lrxh;-><init>(I)V

    new-instance v9, Lrxh;

    invoke-direct {v9, p0}, Lrxh;-><init>(I)V

    const v10, 0x7f0803ec

    sget-object v11, La35;->n:La35;

    const-string v7, "AIAssistant"

    invoke-direct/range {v6 .. v11}, Lr25;-><init>(Ljava/lang/String;Lrxh;Lrxh;ILa35;)V

    return-void

    :pswitch_data_48
    .packed-switch 0x1
        :pswitch_2f
        :pswitch_1a
    .end packed-switch
.end method


# virtual methods
.method public final a(Ls25;Ljava/lang/Runnable;)V
    .registers 5

    iget-byte p0, p0, Lo25;->f:B

    packed-switch p0, :pswitch_data_4c

    iget-object p0, p1, Ls25;->a:Lcom/opera/android/BrowserActivity;

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->o()Lnr8;

    move-result-object p1

    new-instance v0, Lfh4;

    const/4 v1, 0x6

    invoke-direct {v0, p0, p2, v1}, Lfh4;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Lnr8;->f(Ljava/lang/Runnable;)V

    return-void

    :pswitch_1d
    iget-object p0, p1, Ls25;->h:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Law0;

    invoke-virtual {p0, p2}, Law0;->a(Ljava/lang/Runnable;)V

    return-void

    :pswitch_29
    iget-object p0, p1, Ls25;->j:Li53;

    check-cast p0, Lcom/opera/android/bookmarks/h;

    invoke-virtual {p0}, Lcom/opera/android/bookmarks/h;->l()Lcom/opera/android/bookmarks/c;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/opera/android/bookmarks/h;->q(Lcom/opera/android/bookmarks/b;)V

    invoke-virtual {p0}, Lcom/opera/android/bookmarks/h;->n()Lcom/opera/android/bookmarks/c;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/opera/android/bookmarks/h;->q(Lcom/opera/android/bookmarks/b;)V

    invoke-virtual {p0}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object p1

    invoke-virtual {p1}, Lcom/opera/android/bookmarks/c;->i()Ljava/util/List;

    move-result-object p1

    check-cast p1, Ljava/util/AbstractList;

    invoke-virtual {p0, p1}, Lcom/opera/android/bookmarks/h;->e(Ljava/util/AbstractList;)V

    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    return-void

    :pswitch_data_4c
    .packed-switch 0x0
        :pswitch_29
        :pswitch_1d
    .end packed-switch
.end method

.method public final c(Ls25;Lcom/opera/api/Callback;)V
    .registers 5

    iget-byte p0, p0, Lo25;->f:B

    packed-switch p0, :pswitch_data_68

    iget-object p0, p1, Ls25;->a:Lcom/opera/android/BrowserActivity;

    const p1, 0x7f141091

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    check-cast p2, Liu2;

    invoke-virtual {p2, p0}, Liu2;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_14
    new-instance p0, Lk25;

    check-cast p2, Liu2;

    const/4 v0, 0x0

    invoke-direct {p0, p2, p1, v0}, Lk25;-><init>(Liu2;Ls25;B)V

    iget-object p1, p1, Ls25;->h:Lj4c;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Law0;

    new-instance p2, Liu2;

    const/16 v0, 0xd

    invoke-direct {p2, p0, v0}, Liu2;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Lr62;

    iget-object p1, p1, Law0;->f:Ltz1;

    iget-object p1, p1, Ltz1;->h:Lode;

    new-instance v0, Lab;

    const/4 v1, 0x5

    invoke-direct {v0, p2, v1}, Lab;-><init>(Ljava/lang/Object;B)V

    const/4 p2, 0x1

    invoke-direct {p0, p1, v0, p2}, Lr62;-><init>(Lekc;Lcom/opera/api/Callback;B)V

    return-void

    :pswitch_3c
    iget-object p0, p1, Ls25;->j:Li53;

    invoke-virtual {p0}, Li53;->b()I

    move-result p0

    iget-object p1, p1, Ls25;->a:Lcom/opera/android/BrowserActivity;

    if-nez p0, :cond_4e

    const p0, 0x7f141047

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_61

    :cond_4e
    invoke-virtual {p1}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const v1, 0x7f120018

    invoke-virtual {p1, v1, p0, v0}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    :goto_61
    check-cast p2, Liu2;

    invoke-virtual {p2, p0}, Liu2;->run(Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_68
    .packed-switch 0x0
        :pswitch_3c
        :pswitch_14
    .end packed-switch
.end method

.method public final d(Ls25;)Z
    .registers 3

    iget-byte v0, p0, Lo25;->f:B

    packed-switch v0, :pswitch_data_22

    invoke-super {p0, p1}, Lr25;->d(Ls25;)Z

    move-result p0

    return p0

    :pswitch_a
    iget-object p0, p1, Ls25;->h:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Law0;

    iget-object p0, p0, Law0;->c:Lyk6;

    iget-object p0, p0, Lyk6;->i:Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0

    nop

    :pswitch_data_22
    .packed-switch 0x1
        :pswitch_a
    .end packed-switch
.end method
