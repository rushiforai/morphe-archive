.class public final Lkdk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final a:Ljava/util/concurrent/CountDownLatch;

.field public final b:Loml;

.field public final c:Ljava/lang/Object;

.field public final synthetic d:Lldk;


# direct methods
.method public constructor <init>(Lldk;Ljava/lang/Object;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lkdk;->d:Lldk;

    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v0, p0, Lkdk;->a:Ljava/util/concurrent/CountDownLatch;

    iput-object p2, p0, Lkdk;->c:Ljava/lang/Object;

    new-instance p2, Lmni;

    const/16 v0, 0x1c

    invoke-direct {p2, p0, v0}, Lmni;-><init>(Ljava/lang/Object;B)V

    iget-object p1, p1, Lldk;->a:Ltcl;

    invoke-interface {p1, p2}, Ltcl;->c(Ljava/lang/Runnable;)Lnml;

    move-result-object p1

    new-instance p2, Loml;

    invoke-direct {p2, p1}, Loml;-><init>(Lnml;)V

    iput-object p2, p0, Lkdk;->b:Loml;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 1

    :try_start_0
    iget-object p0, p0, Lkdk;->a:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {p0}, Ljava/util/concurrent/CountDownLatch;->await()V
    :try_end_5
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_5} :catch_5

    :catch_5
    return-void
.end method
