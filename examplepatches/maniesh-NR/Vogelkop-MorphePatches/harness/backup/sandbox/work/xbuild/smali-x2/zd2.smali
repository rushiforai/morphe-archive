.class public final Lzd2;
.super Landroid/os/AsyncTask;
.source "SourceFile"

# interfaces
.implements Lih4;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/opera/android/crashhandler/OperaCrashKeys;Ltw2;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Lzd2;->a:B

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lzd2;->b:Ljava/lang/Object;

    iput-object p2, p0, Lzd2;->c:Ljava/lang/Object;

    iput-object p3, p0, Lzd2;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lswl;Lcom/opera/api/Callback;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Lzd2;->a:B

    .line 17
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 18
    iput-object p1, p0, Lzd2;->b:Ljava/lang/Object;

    .line 19
    iput-object p2, p0, Lzd2;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a(Ljava/util/List;)V
    .registers 5

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_4
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1c

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lyd2;

    iget-object v1, p0, Lzd2;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/crashhandler/OperaCrashKeys;

    iget v2, v0, Lyd2;->a:I

    iget-object v0, v0, Lyd2;->b:Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Lcom/opera/android/crashhandler/OperaCrashKeys;->a(ILjava/lang/String;)V

    goto :goto_4

    :cond_1c
    iget-object p0, p0, Lzd2;->d:Ljava/lang/Object;

    check-cast p0, Ltw2;

    iget-object p0, p0, Ltw2;->b:Ljava/lang/Object;

    check-cast p0, Lym8;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lym8;->b:Z

    return-void
.end method

.method public final cancel()V
    .registers 2

    iget-object v0, p0, Lzd2;->d:Ljava/lang/Object;

    check-cast v0, Lih4;

    if-eqz v0, :cond_a

    invoke-interface {v0}, Lih4;->cancel()V

    return-void

    :cond_a
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/os/AsyncTask;->cancel(Z)Z

    return-void
.end method

.method public final doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lzd2;->a:B

    iget-object v1, p0, Lzd2;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_20

    check-cast p1, [Ljava/lang/Void;

    check-cast v1, Lswl;

    invoke-interface {v1}, Lswl;->run()Lqwl;

    move-result-object p0

    return-object p0

    :pswitch_10
    check-cast p1, [Ljava/lang/Void;

    iget-object p0, p0, Lzd2;->d:Ljava/lang/Object;

    check-cast p0, Ltw2;

    check-cast v1, Landroid/content/Context;

    iget-object p0, p0, Ltw2;->b:Ljava/lang/Object;

    invoke-static {v1}, Lym8;->a(Landroid/content/Context;)Ljava/util/ArrayList;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_10
    .end packed-switch
.end method

.method public final onPostExecute(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Lzd2;->a:B

    packed-switch v0, :pswitch_data_28

    check-cast p1, Lqwl;

    if-eqz p1, :cond_10

    invoke-interface {p1}, Lqwl;->run()Lih4;

    move-result-object p1

    iput-object p1, p0, Lzd2;->d:Ljava/lang/Object;

    goto :goto_21

    :cond_10
    iget-object p0, p0, Lzd2;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/api/Callback;

    if-eqz p0, :cond_21

    new-instance p1, Lq43;

    const/4 v0, -0x1

    const-string v1, "KeyStore failure"

    invoke-direct {p1, v0, v1}, Lq43;-><init>(ILjava/lang/String;)V

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :cond_21
    :goto_21
    return-void

    :pswitch_22
    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lzd2;->a(Ljava/util/List;)V

    return-void

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_22
    .end packed-switch
.end method
