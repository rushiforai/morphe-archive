.class public final Lnx1;
.super Li7c;
.source "SourceFile"


# instance fields
.field public final synthetic d:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lnx1;->d:B

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Li7c;-><init>(B)V

    return-void
.end method


# virtual methods
.method public final e(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lnx1;->d:B

    const/4 v1, 0x1

    packed-switch v0, :pswitch_data_a4

    check-cast p1, Landroid/util/Pair;

    new-instance p0, Lhlm;

    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast p1, Ltcl;

    invoke-direct {p0, v0, p1}, Lhlm;-><init>(Landroid/content/Context;Ltcl;)V

    return-object p0

    :pswitch_16
    check-cast p1, Landroid/content/Context;

    new-instance v0, Lk32;

    const/16 v1, 0x9

    invoke-direct {v0, p0, p1, v1}, Lk32;-><init>(Ljava/lang/Object;Landroid/content/Context;B)V

    sget-object p0, Lvml;->d:Lumi;

    invoke-static {v0, p0}, Lcom/opera/android/Lazy;->e(Lcom/opera/android/Lazy;Lumi;)V

    return-object v0

    :pswitch_25
    check-cast p1, Landroid/content/Context;

    invoke-static {p1}, Ls6e;->b(Landroid/content/Context;)Ls6e;

    move-result-object p0

    invoke-virtual {p0}, Ls6e;->c()Z

    move-result p0

    if-eqz p0, :cond_37

    new-instance p0, Lbu6;

    invoke-direct {p0, v1}, Lbu6;-><init>(B)V

    goto :goto_3d

    :cond_37
    new-instance p0, Lbu6;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lbu6;-><init>(B)V

    :goto_3d
    return-object p0

    :pswitch_3e
    check-cast p1, Landroid/content/Context;

    new-instance p0, Lt28;

    sget-object v0, Lvml;->d:Lumi;

    invoke-direct {p0, p1, v0}, Lt28;-><init>(Landroid/content/Context;Lumi;)V

    return-object p0

    :pswitch_48
    check-cast p1, Landroid/content/Context;

    new-instance p0, Lc36;

    sget-object v0, Lvml;->d:Lumi;

    invoke-direct {p0, p1, v0}, Lc36;-><init>(Landroid/content/Context;Lumi;)V

    return-object p0

    :pswitch_52
    check-cast p1, Landroid/content/Context;

    new-instance p0, Ltjh;

    sget-object v0, Lvml;->d:Lumi;

    invoke-direct {p0, p1, v0}, Ltjh;-><init>(Landroid/content/Context;Lumi;)V

    return-object p0

    :pswitch_5c
    check-cast p1, Landroid/content/Context;

    sget-object p0, Ldtg;->a:Ljava/util/concurrent/atomic/AtomicReference;

    monitor-enter p0

    :try_start_61
    sget-boolean v0, Ldtg;->b:Z

    if-nez v0, :cond_6e

    sput-boolean v1, Ldtg;->b:Z

    invoke-static {p1}, Ldtg;->a(Landroid/content/Context;)Lctg;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    :cond_6e
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lctg;

    monitor-exit p0

    return-object p1

    :goto_76
    monitor-exit p0
    :try_end_77
    .catchall {:try_start_61 .. :try_end_77} :catchall_78

    throw p1

    :catchall_78
    move-exception p1

    goto :goto_76

    :pswitch_7a
    check-cast p1, Landroid/content/Context;

    new-instance p0, Ls6e;

    invoke-direct {p0, p1}, Ls6e;-><init>(Landroid/content/Context;)V

    return-object p0

    :pswitch_82
    check-cast p1, Landroid/content/Context;

    new-instance p0, Lloc;

    invoke-direct {p0, p1}, Lloc;-><init>(Landroid/content/Context;)V

    return-object p0

    :pswitch_8a
    check-cast p1, Landroid/content/Context;

    new-instance p0, Lyl6;

    sget-object v0, Lvml;->d:Lumi;

    invoke-direct {p0, p1, v0}, Lyl6;-><init>(Landroid/content/Context;Lumi;)V

    return-object p0

    :pswitch_94
    check-cast p1, Lkotlin/Pair;

    new-instance p0, La12;

    iget-object v0, p1, Lkotlin/Pair;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    iget-object p1, p1, Lkotlin/Pair;->b:Ljava/lang/Object;

    check-cast p1, Ltcl;

    invoke-direct {p0, v0, p1}, La12;-><init>(Landroid/content/Context;Ltcl;)V

    return-object p0

    :pswitch_data_a4
    .packed-switch 0x0
        :pswitch_94
        :pswitch_8a
        :pswitch_82
        :pswitch_7a
        :pswitch_5c
        :pswitch_52
        :pswitch_48
        :pswitch_3e
        :pswitch_25
        :pswitch_16
    .end packed-switch
.end method
