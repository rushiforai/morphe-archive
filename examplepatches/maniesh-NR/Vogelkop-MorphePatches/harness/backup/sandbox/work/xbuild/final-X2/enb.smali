.class public final Lenb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Executor;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/util/concurrent/Executor;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lfnb;Ljava/util/concurrent/Executor;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lenb;->a:B

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lenb;->b:Ljava/util/concurrent/Executor;

    iput-object p1, p0, Lenb;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/ExecutorService;Luac;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Lenb;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lenb;->b:Ljava/util/concurrent/Executor;

    iput-object p2, p0, Lenb;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final execute(Ljava/lang/Runnable;)V
    .registers 4

    iget-byte v0, p0, Lenb;->a:B

    iget-object v1, p0, Lenb;->b:Ljava/util/concurrent/Executor;

    packed-switch v0, :pswitch_data_1a

    check-cast v1, Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1, p1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :pswitch_d
    :try_start_d
    invoke-interface {v1, p1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_10
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_d .. :try_end_10} :catch_11

    goto :goto_19

    :catch_11
    move-exception p1

    iget-object p0, p0, Lenb;->c:Ljava/lang/Object;

    check-cast p0, Lfnb;

    invoke-virtual {p0, p1}, Lfnb;->c(Ljava/lang/Exception;)V

    :goto_19
    return-void

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
