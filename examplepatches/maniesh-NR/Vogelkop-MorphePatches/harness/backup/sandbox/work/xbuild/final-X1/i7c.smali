.class public abstract Li7c;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:Ljava/lang/Object;

.field public static final c:Ljava/lang/Object;


# instance fields
.field public volatile a:Ljava/lang/Object;


# direct methods
.method static synthetic constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Li7c;->b:Ljava/lang/Object;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Li7c;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(B)V
    .registers 2

    packed-switch p1, :pswitch_data_14

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object p1, Li7c;->b:Ljava/lang/Object;

    iput-object p1, p0, Li7c;->a:Ljava/lang/Object;

    return-void

    :pswitch_b
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object p1, Li7c;->c:Ljava/lang/Object;

    iput-object p1, p0, Li7c;->a:Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x1
        :pswitch_b
    .end packed-switch
.end method

.method public static b(Li7c;Ljava/lang/Runnable;)V
    .registers 5

    iget-object v0, p0, Li7c;->a:Ljava/lang/Object;

    sget-object v1, Li7c;->c:Ljava/lang/Object;

    if-eq v0, v1, :cond_c

    if-eqz p1, :cond_b

    invoke-static {p1}, Lgxo;->c(Ljava/lang/Runnable;)V

    :cond_b
    return-void

    :cond_c
    sget-object v0, Lgxo;->c:Lgxo;

    new-instance v1, Lfmn;

    const/16 v2, 0x16

    invoke-direct {v1, p0, p1, v2}, Lfmn;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lgxo;->b(Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/Object;
    .registers 3

    iget-object v0, p0, Li7c;->a:Ljava/lang/Object;

    sget-object v1, Li7c;->c:Ljava/lang/Object;

    if-eq v0, v1, :cond_9

    iget-object p0, p0, Li7c;->a:Ljava/lang/Object;

    return-object p0

    :cond_9
    monitor-enter p0

    :try_start_a
    iget-object v0, p0, Li7c;->a:Ljava/lang/Object;

    if-ne v0, v1, :cond_14

    invoke-virtual {p0}, Li7c;->c()Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Li7c;->a:Ljava/lang/Object;

    :cond_14
    iget-object v0, p0, Li7c;->a:Ljava/lang/Object;

    monitor-exit p0

    return-object v0

    :goto_18
    monitor-exit p0
    :try_end_19
    .catchall {:try_start_a .. :try_end_19} :catchall_1a

    throw v0

    :catchall_1a
    move-exception v0

    goto :goto_18
.end method

.method public abstract c()Ljava/lang/Object;
.end method

.method public final d(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-object v0, p0, Li7c;->a:Ljava/lang/Object;

    sget-object v1, Li7c;->b:Ljava/lang/Object;

    if-eq v0, v1, :cond_9

    iget-object p0, p0, Li7c;->a:Ljava/lang/Object;

    return-object p0

    :cond_9
    monitor-enter p0

    :try_start_a
    iget-object v0, p0, Li7c;->a:Ljava/lang/Object;

    if-ne v0, v1, :cond_14

    invoke-virtual {p0, p1}, Li7c;->e(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Li7c;->a:Ljava/lang/Object;

    :cond_14
    monitor-exit p0
    :try_end_15
    .catchall {:try_start_a .. :try_end_15} :catchall_1a

    iget-object p0, p0, Li7c;->a:Ljava/lang/Object;

    return-object p0

    :goto_18
    :try_start_18
    monitor-exit p0
    :try_end_19
    .catchall {:try_start_18 .. :try_end_19} :catchall_1a

    throw p1

    :catchall_1a
    move-exception p1

    goto :goto_18
.end method

.method public abstract e(Ljava/lang/Object;)Ljava/lang/Object;
.end method
