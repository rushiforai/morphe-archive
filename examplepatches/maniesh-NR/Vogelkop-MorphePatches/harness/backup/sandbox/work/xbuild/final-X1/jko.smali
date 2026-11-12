.class public abstract Ljko;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/TreeSet;

.field public static final b:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public static final c:Lzyk;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    sget-object v0, Ltxo;->Companion:Lawo;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    new-array v0, v0, [Ltxo;

    new-instance v1, Ljava/util/TreeSet;

    sget-object v2, Ltxo;->c:Lomj;

    invoke-direct {v1, v2}, Ljava/util/TreeSet;-><init>(Ljava/util/Comparator;)V

    invoke-static {v0, v1}, Le82;->A([Ljava/lang/Object;Ljava/util/AbstractSet;)V

    sput-object v1, Ljko;->a:Ljava/util/TreeSet;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    sput-object v0, Ljko;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    sget-object v0, La43;->F:La43;

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    sput-object v0, Ljko;->c:Lzyk;

    return-void
.end method

.method public static final a(Landroid/content/Context;Z)V
    .registers 6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {}, Laap;->f()Lz8p;

    move-result-object v2

    iget-wide v2, v2, Lz8p;->F:J

    sub-long/2addr v0, v2

    new-instance v2, Luho;

    const/4 v3, 0x0

    invoke-direct {v2, v0, v1, v3}, Luho;-><init>(JB)V

    const/4 v0, 0x1

    sget-object v1, Ljko;->a:Ljava/util/TreeSet;

    invoke-static {v1, v2, v0}, Lo95;->u(Ljava/lang/Iterable;Lkotlin/jvm/functions/Function1;Z)Z

    move-result v0

    if-eqz v0, :cond_1f

    if-eqz p1, :cond_1f

    invoke-static {p0}, Ljko;->b(Landroid/content/Context;)V

    :cond_1f
    return-void
.end method

.method public static final b(Landroid/content/Context;)V
    .registers 5

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    sget-object v0, Lw2p;->a:La64;

    new-instance v1, Lhkm;

    const/4 v2, 0x7

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3, p0}, Lhkm;-><init>(BLmt5;Ljava/lang/Object;)V

    const/4 p0, 0x3

    invoke-static {v0, v3, v3, v1, p0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void
.end method
