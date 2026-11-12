.class public final Lhb;
.super Lfe2;
.source "SourceFile"


# instance fields
.field public final synthetic g:B

.field public final synthetic h:Ljb;


# direct methods
.method public synthetic constructor <init>(Ljb;B)V
    .registers 3

    iput-byte p2, p0, Lhb;->g:B

    iput-object p1, p0, Lhb;->h:Ljb;

    invoke-direct {p0}, Lfe2;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lhb;->g:B

    packed-switch v0, :pswitch_data_2a

    iget-object p0, p0, Lhb;->h:Ljb;

    iget-object p0, p0, Ljb;->d:Ljava/lang/Object;

    check-cast p0, La4f;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    return-object p0

    :pswitch_14
    iget-object p0, p0, Lhb;->h:Ljb;

    iget-object p0, p0, Ljb;->d:Ljava/lang/Object;

    check-cast p0, La4f;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p0, 0x0

    new-array p0, p0, [Landroid/accounts/Account;

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_14
    .end packed-switch
.end method

.method public final g(Ljava/lang/Object;)V
    .registers 13

    iget-byte v0, p0, Lhb;->g:B

    const/4 v1, 0x6

    const-string v2, "Signin.GetAccountsBackoffRetries"

    const-string v3, "Signin.GetAccountsBackoffSuccess"

    const-wide/16 v4, 0x3e8

    const/4 v6, 0x7

    const/4 v7, 0x5

    iget-object v8, p0, Lhb;->h:Ljb;

    const/4 v9, 0x0

    const/4 v10, 0x1

    packed-switch v0, :pswitch_data_b4

    check-cast p1, Ljava/util/List;

    iput-boolean v10, v8, Ljb;->b:Z

    iget-object v0, v8, Ljb;->g:Ljava/io/Serializable;

    check-cast v0, Ljava/util/concurrent/atomic/AtomicReference;

    if-nez p1, :cond_40

    iput-boolean v9, v8, Ljb;->b:Z

    iget p1, v8, Ljb;->a:I

    if-ge p1, v7, :cond_2f

    add-int/2addr p1, v10

    iput p1, v8, Ljb;->a:I

    new-instance p1, Lc4;

    const/4 v0, 0x2

    invoke-direct {p1, p0, v0}, Lc4;-><init>(Ljava/lang/Object;B)V

    invoke-static {v6, p1, v4, v5}, Lorg/chromium/base/task/PostTask;->b(ILjava/lang/Runnable;J)V

    goto :goto_5a

    :cond_2f
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object p0

    if-nez p0, :cond_39

    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :goto_37
    move-object p1, p0

    goto :goto_40

    :cond_39
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    goto :goto_37

    :cond_40
    :goto_40
    iget p0, v8, Ljb;->a:I

    if-eqz p0, :cond_52

    iget-boolean p0, v8, Ljb;->b:Z

    invoke-static {v3, p0}, Lioh;->t(Ljava/lang/String;Z)V

    iget-boolean p0, v8, Ljb;->b:Z

    if-eqz p0, :cond_52

    iget p0, v8, Ljb;->a:I

    invoke-static {p0, v1, v2}, Lioh;->y(IILjava/lang/String;)V

    :cond_52
    iput v9, v8, Ljb;->a:I

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    invoke-virtual {v8}, Ljb;->h()V

    :goto_5a
    return-void

    :pswitch_5b
    check-cast p1, Ljava/util/List;

    iput-boolean v10, v8, Ljb;->b:Z

    iget-object v0, v8, Ljb;->f:Ljava/io/Serializable;

    check-cast v0, Ljava/util/concurrent/atomic/AtomicReference;

    if-nez p1, :cond_88

    iput-boolean v9, v8, Ljb;->b:Z

    iget p1, v8, Ljb;->a:I

    if-ge p1, v7, :cond_77

    add-int/2addr p1, v10

    iput p1, v8, Ljb;->a:I

    new-instance p1, Lc4;

    invoke-direct {p1, p0, v10}, Lc4;-><init>(Ljava/lang/Object;B)V

    invoke-static {v6, p1, v4, v5}, Lorg/chromium/base/task/PostTask;->b(ILjava/lang/Runnable;J)V

    goto :goto_b2

    :cond_77
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object p0

    if-nez p0, :cond_81

    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :goto_7f
    move-object p1, p0

    goto :goto_88

    :cond_81
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    goto :goto_7f

    :cond_88
    :goto_88
    iget p0, v8, Ljb;->a:I

    if-eqz p0, :cond_9a

    iget-boolean p0, v8, Ljb;->b:Z

    invoke-static {v3, p0}, Lioh;->t(Ljava/lang/String;Z)V

    iget-boolean p0, v8, Ljb;->b:Z

    if-eqz p0, :cond_9a

    iget p0, v8, Ljb;->a:I

    invoke-static {p0, v1, v2}, Lioh;->y(IILjava/lang/String;)V

    :cond_9a
    iput v9, v8, Ljb;->a:I

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_b2

    iget-object p0, v8, Ljb;->h:Ljava/io/Serializable;

    check-cast p0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_b2

    invoke-virtual {v8}, Ljb;->a()V

    :cond_b2
    :goto_b2
    return-void

    nop

    :pswitch_data_b4
    .packed-switch 0x0
        :pswitch_5b
    .end packed-switch
.end method
