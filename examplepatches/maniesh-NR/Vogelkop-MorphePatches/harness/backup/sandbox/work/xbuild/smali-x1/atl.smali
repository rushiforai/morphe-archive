.class public final Latl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lndc;


# instance fields
.field public final synthetic a:B

.field public final b:Lqdc;

.field public final c:Lqdc;


# direct methods
.method public constructor <init>(Lhjf;)V
    .registers 10

    const/4 v0, 0x0

    iput-byte v0, p0, Latl;->a:B

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    new-instance v0, Lqdc;

    const/4 v1, 0x1

    .line 50
    invoke-direct {v0, p0, v1}, Lqdc;-><init>(Lndc;Z)V

    .line 51
    iput-object v0, p0, Latl;->b:Lqdc;

    .line 52
    iput-object v0, p0, Latl;->c:Lqdc;

    .line 53
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object v2

    new-instance v4, Lqfl;

    const/4 p1, 0x7

    invoke-direct {v4, p0, p1}, Lqfl;-><init>(Ljava/lang/Object;B)V

    const/4 v6, 0x0

    const/16 v7, 0xd

    const/4 v3, 0x0

    const/4 v5, 0x0

    invoke-static/range {v2 .. v7}, Loup;->l0(Ltcc;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;I)V

    return-void
.end method

.method public constructor <init>(Ll7n;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Latl;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v1, Lqdc;

    invoke-direct {v1, p0, v0}, Lqdc;-><init>(Lndc;Z)V

    iput-object v1, p0, Latl;->b:Lqdc;

    iput-object v1, p0, Latl;->c:Lqdc;

    sget-object v2, Lqcc;->e:Lqcc;

    invoke-virtual {v1, v2}, Lqdc;->g(Lqcc;)V

    new-instance v1, Lm7n;

    invoke-direct {v1, p0, v0}, Lm7n;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p1, Ll7n;->a:Lo7n;

    iget-boolean p1, p0, Lo7n;->d:Z

    if-eqz p1, :cond_23

    invoke-static {v1}, Lo7n;->a(Ljava/lang/AutoCloseable;)V

    goto :goto_2c

    :cond_23
    iget-object p1, p0, Lo7n;->a:Lurj;

    monitor-enter p1

    :try_start_26
    iget-object p0, p0, Lo7n;->c:Ljava/util/LinkedHashSet;

    invoke-interface {p0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z
    :try_end_2b
    .catchall {:try_start_26 .. :try_end_2b} :catchall_2d

    monitor-exit p1

    :goto_2c
    return-void

    :catchall_2d
    move-exception p0

    monitor-exit p1

    throw p0
.end method


# virtual methods
.method public final getLifecycle()Ltcc;
    .registers 2

    iget-byte v0, p0, Latl;->a:B

    packed-switch v0, :pswitch_data_c

    iget-object p0, p0, Latl;->c:Lqdc;

    return-object p0

    :pswitch_8
    iget-object p0, p0, Latl;->c:Lqdc;

    return-object p0

    nop

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_8
    .end packed-switch
.end method
