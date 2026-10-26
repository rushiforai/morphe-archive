.class public LX/CR1;
.super Ljava/lang/Object;

.method private final A00()V
    .locals 2
    iget-object v0, p0, LX/CR1;->A00:Ljava/util/concurrent/atomic/AtomicBoolean;
    const/4 v1, 0x1
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V
    return-void
.end method

.method private final A01()V
    .locals 2
    iget-object v0, p0, LX/CR1;->A00:Ljava/util/concurrent/atomic/AtomicBoolean;
    const/4 v1, 0x1
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V
    return-void
.end method

.method public static final A04(Landroid/content/Context;LX/CPr;)Z
    .locals 1
    const/4 v0, 0x1
    return v0
.end method
