.class public final Lw17;
.super Lo5o;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 2

    const/4 v0, 0x0

    iput-byte v0, p0, Lw17;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Lw17;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lj4c;)V
    .registers 3

    const/4 v0, 0x1

    iput-byte v0, p0, Lw17;->a:B

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Lw17;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;Ljava/lang/String;Landroidx/work/WorkerParameters;)Lajc;
    .registers 10

    iget-byte v0, p0, Lw17;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lw17;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_98

    check-cast p0, Lj4c;

    const-class v0, Lcom/opera/android/esim/work/EsimPromotionWorker;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_26

    new-instance v1, Lcom/opera/android/esim/work/EsimPromotionWorker;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ldp6;

    invoke-virtual {p0}, Ldp6;->c()Lot6;

    move-result-object p0

    invoke-direct {v1, p1, p3, p0}, Lcom/opera/android/esim/work/EsimPromotionWorker;-><init>(Landroid/content/Context;Landroidx/work/WorkerParameters;Lgfd;)V

    goto :goto_70

    :cond_26
    const-class v0, Lcom/opera/android/esim/work/EsimUpsellWorker;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_70

    new-instance v1, Lcom/opera/android/esim/work/EsimUpsellWorker;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ldp6;

    new-instance p2, Lc5o;

    iget-object v0, p0, Ldp6;->n:Lf1p;

    new-instance v0, Lesg;

    new-instance v2, Lvm6;

    new-instance v3, Ltw2;

    iget-object v4, p0, Ldp6;->c:Lg77;

    const/16 v5, 0x1c

    invoke-direct {v3, v4, v5}, Ltw2;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v2, v3}, Lvm6;-><init>(Ltw2;)V

    new-instance v3, Llq6;

    invoke-virtual {p0}, Ldp6;->d()Lip6;

    move-result-object v4

    invoke-direct {v3, v4}, Llq6;-><init>(Lip6;)V

    const/16 v4, 0xb

    const/4 v5, 0x0

    invoke-direct {v0, v4, v2, v3, v5}, Lesg;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    new-instance v2, Ljq6;

    invoke-virtual {p0}, Ldp6;->d()Lip6;

    move-result-object p0

    invoke-direct {v2, p0}, Ljq6;-><init>(Lip6;)V

    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    iput-object v0, p2, Lc5o;->a:Ljava/lang/Object;

    iput-object v2, p2, Lc5o;->b:Ljava/lang/Object;

    invoke-direct {v1, p1, p3, p2}, Lcom/opera/android/esim/work/EsimUpsellWorker;-><init>(Landroid/content/Context;Landroidx/work/WorkerParameters;Lhfd;)V

    :cond_70
    :goto_70
    return-object v1

    :pswitch_71
    check-cast p0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_77
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_96

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lo5o;

    :try_start_83
    invoke-virtual {v0, p1, p2, p3}, Lo5o;->a(Landroid/content/Context;Ljava/lang/String;Landroidx/work/WorkerParameters;)Lajc;

    move-result-object v0
    :try_end_87
    .catchall {:try_start_83 .. :try_end_87} :catchall_8b

    if-eqz v0, :cond_77

    move-object v1, v0

    goto :goto_96

    :catchall_8b
    move-exception p0

    invoke-static {}, Lqs7;->x()Lqs7;

    move-result-object p1

    sget p2, Lx17;->a:I

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    throw p0

    :cond_96
    :goto_96
    return-object v1

    nop

    :pswitch_data_98
    .packed-switch 0x0
        :pswitch_71
    .end packed-switch
.end method
